package com.presley.fit_book

import android.Manifest
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.database.sqlite.SQLiteDatabase
import android.net.Uri
import android.util.Log
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.documentfile.provider.DocumentFile
import androidx.work.ExistingWorkPolicy
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.Worker
import androidx.work.WorkerParameters
import java.io.BufferedInputStream
import java.io.BufferedOutputStream
import java.io.File
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

private const val BACKUP_LOG_TAG = "BackupWorker"
private const val BACKUP_CHANNEL_ID = "backup_channel"

class BackupReceiver : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
                if (context == null) return
                val work = OneTimeWorkRequestBuilder<BackupWorker>().build()
                WorkManager.getInstance(context).enqueueUniqueWork(
                        "fitbook-automatic-backup",
                        ExistingWorkPolicy.KEEP,
                        work
                )
        }
}

/** Runs scheduled backups off the receiver thread without changing the daily alarm schedule. */
class BackupWorker(context: Context, parameters: WorkerParameters) : Worker(context, parameters) {
        override fun doWork(): Result =
                if (performBackup(applicationContext)) Result.success() else Result.failure()

        private fun showError(context: Context, message: Int) {
                Handler(Looper.getMainLooper()).post {
                        Toast.makeText(context, context.getString(message), Toast.LENGTH_LONG).show()
                }
        }

        private fun performBackup(context: Context): Boolean {
                Log.d(BACKUP_LOG_TAG, "Performing automatic backup")
                var incompleteFile: DocumentFile? = null

                try {
                        val (enabled, backupPath) = getSettings(context)
                        if (!enabled) return true

                        if (backupPath == null) {
                                setAutomaticBackups(context, false)
                                showError(context, R.string.backup_failed_path_not_set)
                                return false
                        }

                        val dir = DocumentFile.fromTreeUri(context, Uri.parse(backupPath))
                        if (dir == null) {
                                setAutomaticBackups(context, false)
                                showError(context, R.string.backup_failed_directory_access)
                                return false
                        }

                        val database = getBackupDatabase(context) ?: return false
                        val date = SimpleDateFormat("yyyy-MM-dd", Locale.US).format(Date())
                        val file = dir.createFile("application/zip", "fitbook-" + date + ".zip")
                        if (file == null) {
                                showError(context, R.string.backup_failed_retry)
                                return false
                        }
                        incompleteFile = file

                        Log.d(BACKUP_LOG_TAG, "file.uri=" + file.uri)
                        if (!writeBackupArchive(context, database, file)) return false

                        incompleteFile = null
                        showBackupNotification(context, dir, file)
                        return true
                } catch (e: Exception) {
                        Log.e(BACKUP_LOG_TAG, "Error during backup: " + e.message, e)
                        // A transient failure must not disable every subsequent daily backup.
                        showError(context, R.string.backup_failed_retry)
                        return false
                } finally {
                        removeIncompleteBackup(incompleteFile)
                }
        }

        private fun getBackupDatabase(context: Context): File? {
                val filesDir = context.filesDir
                if (filesDir == null) {
                        setAutomaticBackups(context, false)
                        showError(context, R.string.backup_failed_app_files_directory)
                        return null
                }
                val parentDir = filesDir.parentFile
                if (parentDir == null) {
                        setAutomaticBackups(context, false)
                        showError(context, R.string.backup_failed_parent_directory)
                        return null
                }
                val database = File(File(parentDir, "app_flutter"), "fitbook.sqlite")
                if (!database.exists()) {
                        setAutomaticBackups(context, false)
                        showError(context, R.string.backup_failed_database_missing)
                        return null
                }
                return database
        }

        private fun writeBackupArchive(
                context: Context,
                sourceDatabase: File,
                file: DocumentFile
        ): Boolean {
                val snapshot = File.createTempFile("fitbook-backup-", ".sqlite", context.cacheDir)
                try {
                        val images = createPortableDatabaseCopy(sourceDatabase, snapshot)
                        val output = context.contentResolver.openOutputStream(file.uri)
                        if (output == null) {
                                showError(context, R.string.backup_failed_retry)
                                return false
                        }
                        output.use { stream ->
                                ZipOutputStream(BufferedOutputStream(stream)).use { zip ->
                                        addBackupFilesToZip(zip, snapshot, images)
                                }
                        }
                        return true
                } finally {
                        snapshot.delete()
                }
        }

        private fun addBackupFilesToZip(
                zip: ZipOutputStream,
                snapshot: File,
                images: Map<File, String>
        ) {
                addFileToZip(zip, snapshot, "fitbook.sqlite")
                images.forEach { (image, archivePath) ->
                        if (image.exists()) addFileToZip(zip, image, archivePath)
                }
        }

        private fun showBackupNotification(
                context: Context,
                dir: DocumentFile,
                file: DocumentFile
        ) {
                // Denying notifications must not prevent the actual data backup.
                if (!areBackupNotificationsAllowed(context)) return

                val manager = NotificationManagerCompat.from(context)
                createBackupNotificationChannel(context, manager)
                val notification = buildBackupNotification(context, dir, file).build()
                try {
                        manager.notify(2, notification)
                } catch (e: SecurityException) {
                        Log.w(BACKUP_LOG_TAG, "Backup saved, but notification blocked", e)
                }
        }

        private fun areBackupNotificationsAllowed(context: Context): Boolean =
                Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU ||
                        ActivityCompat.checkSelfPermission(
                                context,
                                Manifest.permission.POST_NOTIFICATIONS
                        ) == PackageManager.PERMISSION_GRANTED

        private fun createBackupNotificationChannel(
                context: Context,
                manager: NotificationManagerCompat
        ) {
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
                val channel = NotificationChannel(
                        BACKUP_CHANNEL_ID,
                        context.getString(R.string.backup_channel_name),
                        NotificationManager.IMPORTANCE_DEFAULT
                )
                channel.description = context.getString(R.string.backup_channel_description)
                manager.createNotificationChannel(channel)
        }

        private fun buildBackupNotification(
                context: Context,
                dir: DocumentFile,
                file: DocumentFile
        ): NotificationCompat.Builder {
                val openIntent = Intent().apply {
                        action = Intent.ACTION_GET_CONTENT
                        setDataAndType(dir.uri, "*/*")
                }
                val pendingOpen = PendingIntent.getActivity(
                        context, 0, openIntent, PendingIntent.FLAG_IMMUTABLE
                )

                val shareIntent = Intent().apply {
                        action = Intent.ACTION_SEND
                        putExtra(Intent.EXTRA_STREAM, file.uri)
                        type = "application/zip"
                        addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                }
                val pendingShare = PendingIntent.getActivity(
                        context, 0, shareIntent, PendingIntent.FLAG_IMMUTABLE
                )

                return NotificationCompat.Builder(context, BACKUP_CHANNEL_ID)
                        .setSmallIcon(R.drawable.baseline_download_24)
                        .setAutoCancel(true)
                        .setContentText(file.name)
                        .setContentTitle(context.getString(R.string.backup_success_title))
                        .setContentIntent(pendingOpen)
                        .addAction(
                                R.drawable.baseline_download_24,
                                context.getString(R.string.share),
                                pendingShare
                        )
        }

        private fun removeIncompleteBackup(file: DocumentFile?) {
                if (file == null) return
                try {
                        file.delete()
                } catch (e: SecurityException) {
                        Log.w(BACKUP_LOG_TAG, "Could not remove incomplete backup", e)
                } catch (e: IllegalArgumentException) {
                        Log.w(BACKUP_LOG_TAG, "Could not remove incomplete backup", e)
                }
        }

        private fun createPortableDatabaseCopy(
                sourceFile: File,
                destinationFile: File
        ): Map<File, String> {
                destinationFile.delete()
                val sourceDatabase =
                        SQLiteDatabase.openDatabase(
                                sourceFile.absolutePath,
                                null,
                                SQLiteDatabase.OPEN_READWRITE
                        )
                var legacyCopy = false
                try {
                        // VACUUM INTO snapshots committed WAL data without requiring a
                        // checkpoint or blocking an active Drift writer.
                        val version = sourceDatabase.rawQuery("SELECT sqlite_version()", null).use {
                                cursor -> if (cursor.moveToFirst()) cursor.getString(0) else ""
                        }
                        val parts = version.split('.').mapNotNull { it.toIntOrNull() }
                        val supportsVacuumInto =
                                parts.size >= 2 && (parts[0] > 3 || (parts[0] == 3 && parts[1] >= 27))
                        if (supportsVacuumInto) {
                                sourceDatabase.execSQL("VACUUM INTO ?", arrayOf(destinationFile.absolutePath))
                        } else {
                                // Older Android SQLite versions require the legacy checkpoint path.
                                sourceDatabase.rawQuery("PRAGMA wal_checkpoint(FULL)", null).use { cursor ->
                                        if (cursor.moveToFirst() && cursor.getInt(0) != 0) {
                                                throw IllegalStateException("Database is busy")
                                        }
                                }
                        }
                        legacyCopy = !supportsVacuumInto
                } finally {
                        sourceDatabase.close()
                }
                if (legacyCopy) {
                        sourceFile.copyTo(destinationFile, overwrite = true)
                }

                val images = linkedMapOf<File, String>()
                val relativePaths = linkedMapOf<String, String>()
                val database =
                        SQLiteDatabase.openDatabase(
                                destinationFile.absolutePath,
                                null,
                                SQLiteDatabase.OPEN_READWRITE
                        )
                try {
                        val imageColumns =
                                listOf(
                                        Pair("foods", "image_file"),
                                        Pair("meals", "image_file"),
                                        Pair("weights", "image")
                                )
                        imageColumns.forEach { (table, column) ->
                                if (!hasColumn(database, table, column)) return@forEach
                                val storedPaths = mutableListOf<String>()
                                database.rawQuery(
                                                "SELECT DISTINCT \"$column\" FROM \"$table\" " +
                                                        "WHERE \"$column\" IS NOT NULL AND \"$column\" != ''",
                                                null
                                        )
                                        .use { cursor ->
                                                while (cursor.moveToNext()) {
                                                        storedPaths.add(cursor.getString(0))
                                                }
                                        }
                                storedPaths.forEach { originalPath ->
                                        val archivePath =
                                                relativePaths.getOrPut(originalPath) {
                                                        "images/${relativePaths.size}_${File(originalPath).name}"
                                                }
                                        val image = File(originalPath)
                                        if (image.exists()) images[image] = archivePath
                                        database.execSQL(
                                                "UPDATE \"$table\" SET \"$column\" = ? " +
                                                        "WHERE \"$column\" = ?",
                                                arrayOf(archivePath, originalPath)
                                        )
                                }
                        }
                } finally {
                        database.close()
                }
                return images
        }

        private fun hasColumn(database: SQLiteDatabase, table: String, column: String): Boolean {
                database.rawQuery(
                                "SELECT 1 FROM sqlite_master WHERE type = 'table' AND name = ?",
                                arrayOf(table)
                        )
                        .use { if (!it.moveToFirst()) return false }
                database.rawQuery("PRAGMA table_info(\"$table\")", null).use { cursor ->
                        val nameIndex = cursor.getColumnIndexOrThrow("name")
                        while (cursor.moveToNext()) {
                                if (cursor.getString(nameIndex) == column) return true
                        }
                }
                return false
        }

        private fun addFileToZip(zip: ZipOutputStream, file: File, archivePath: String) {
                zip.putNextEntry(ZipEntry(archivePath))
                BufferedInputStream(file.inputStream()).use { input -> input.copyTo(zip) }
                zip.closeEntry()
        }
}
