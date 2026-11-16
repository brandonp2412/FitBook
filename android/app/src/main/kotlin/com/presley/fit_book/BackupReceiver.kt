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

class BackupWorker(context: Context, parameters: WorkerParameters) : Worker(context, parameters) {
        override fun doWork(): Result =
                if (performBackup(applicationContext)) Result.success() else Result.failure()

        private fun showError(context: Context, message: Int) {
                Handler(Looper.getMainLooper()).post {
                        Toast.makeText(context, context.getString(message), Toast.LENGTH_LONG).show()
                }
        }

        private fun performBackup(context: Context): Boolean {
                Log.d("BackupWorker", "Performing automatic backup")
                var incompleteFile: DocumentFile? = null

                try {
                        val (enabled, backupPath) = getSettings(context)
                        if (!enabled) return true

                        if (backupPath == null) {
                                setAutomaticBackups(context, false)
                                showError(context, R.string.backup_failed_path_not_set)
                                return false
                        }

                        val backupUri = Uri.parse(backupPath)

                        val channelId = "backup_channel"
                        var notificationBuilder =
                                NotificationCompat.Builder(context, channelId)
                                        .setSmallIcon(R.drawable.baseline_download_24)
                                        .setAutoCancel(true)

                        val notificationManager = NotificationManagerCompat.from(context)
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                                val channel =
                                        NotificationChannel(
                                                channelId,
                                                context.getString(R.string.backup_channel_name),
                                                NotificationManager.IMPORTANCE_DEFAULT
                                        )
                                channel.description =
                                        context.getString(R.string.backup_channel_description)
                                notificationManager.createNotificationChannel(channel)
                        }

                        // Denying notifications must not prevent the actual data backup.
                        val notificationsAllowed =
                                Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU ||
                                ActivityCompat.checkSelfPermission(
                                        context,
                                        Manifest.permission.POST_NOTIFICATIONS
                                ) == PackageManager.PERMISSION_GRANTED

                        val dir = DocumentFile.fromTreeUri(context, backupUri)
                        if (dir == null) {
                                setAutomaticBackups(context, false)
                                showError(context, R.string.backup_failed_directory_access)
                                return false
                        }

                        val yyyyMMdd = SimpleDateFormat("yyyy-MM-dd", Locale.US).format(Date())
                        val fileName = "fitbook-${yyyyMMdd}.zip"
                        val file = dir.createFile("application/zip", fileName)
                        if (file == null) {
                                showError(context, R.string.backup_failed_retry)
                                return false
                        }
                        incompleteFile = file

                        Log.d("BackupWorker", "file.uri=${file.uri}")
                        notificationBuilder = notificationBuilder.setContentText(file.name)

                        val openIntent =
                                Intent().apply {
                                        action = Intent.ACTION_GET_CONTENT
                                        setDataAndType(dir.uri, "*/*")
                                }
                        val pendingOpen =
                                PendingIntent.getActivity(
                                        context,
                                        0,
                                        openIntent,
                                        PendingIntent.FLAG_IMMUTABLE
                                )
                        notificationBuilder = notificationBuilder.setContentIntent(pendingOpen)

                        val shareIntent =
                                Intent().apply {
                                        action = Intent.ACTION_SEND
                                        putExtra(Intent.EXTRA_STREAM, file.uri)
                                        type = "application/zip"
                                        addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                                }
                        val pendingShare =
                                PendingIntent.getActivity(
                                        context,
                                        0,
                                        shareIntent,
                                        PendingIntent.FLAG_IMMUTABLE
                                )
                        notificationBuilder =
                                notificationBuilder.addAction(
                                        R.drawable.baseline_download_24,
                                        context.getString(R.string.share),
                                        pendingShare
                                )

                        val filesDir = context.filesDir
                        if (filesDir == null) {
                                setAutomaticBackups(context, false)
                                showError(context, R.string.backup_failed_app_files_directory)
                                return false
                        }
                        val parentDir = filesDir.parentFile
                        if (parentDir == null) {
                                setAutomaticBackups(context, false)
                                showError(context, R.string.backup_failed_parent_directory)
                                return false
                        }
                        val dbFolder = File(parentDir, "app_flutter").absolutePath

                        val dbFile = File(dbFolder, "fitbook.sqlite")

                        if (!dbFile.exists()) {
                                setAutomaticBackups(context, false)
                                showError(context, R.string.backup_failed_database_missing)
                                return false
                        }

                        val temporaryDatabase =
                                File.createTempFile("fitbook-backup-", ".sqlite", context.cacheDir)
                        try {
                                val images = createPortableDatabaseCopy(dbFile, temporaryDatabase)
                                val outputStream = context.contentResolver.openOutputStream(file.uri)
                                if (outputStream == null) {
                                        showError(context, R.string.backup_failed_retry)
                                        return false
                                }
                                outputStream.use { output ->
                                        ZipOutputStream(BufferedOutputStream(output)).use { zip ->
                                                addFileToZip(zip, temporaryDatabase, "fitbook.sqlite")
                                                images.forEach { (image, archivePath) ->
                                                        if (image.exists()) {
                                                                addFileToZip(zip, image, archivePath)
                                                        }
                                                }
                                        }
                                }
                                notificationBuilder =
                                        notificationBuilder.setContentTitle(
                                                context.getString(R.string.backup_success_title)
                                        )
                                incompleteFile = null
                                if (notificationsAllowed) {
                                        try {
                                                notificationManager.notify(2, notificationBuilder.build())
                                        } catch (e: SecurityException) {
                                                Log.w("BackupWorker", "Backup saved, but notification blocked", e)
                                        }
                                }
                        } finally {
                                temporaryDatabase.delete()
                        }
                        return true
                } catch (e: Exception) {
                        Log.e("BackupWorker", "Error during backup: ${e.message}", e)
                        // A transient failure must not disable every subsequent daily backup.
                        showError(context, R.string.backup_failed_retry)
                        return false
                } finally {
                        // Never leave corrupt/empty ZIPs when an attempt fails.
                        try {
                                incompleteFile?.delete()
                        } catch (cleanupError: Exception) {
                                Log.w("BackupWorker", "Could not remove incomplete backup", cleanupError)
                        }
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
