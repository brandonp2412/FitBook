package com.presley.fit_book

import android.Manifest
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.database.sqlite.SQLiteDatabase
import android.net.Uri
import android.os.Build
import android.util.Log
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.documentfile.provider.DocumentFile
import java.io.BufferedInputStream
import java.io.BufferedOutputStream
import java.io.File
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

class BackupReceiver : BroadcastReceiver() {
        @RequiresApi(Build.VERSION_CODES.O)
        override fun onReceive(context: Context?, intent: Intent?) {
                Log.d("BackupReceiver", "onReceive")
                if (context == null) return

                try {
                        val (enabled, backupPath) = getSettings(context)
                        if (!enabled) return

                        if (backupPath == null) {
                                setAutomaticBackups(context, false)
                                Toast.makeText(
                                                context,
                                                "Backup failed: Backup path not set. Automatic backups disabled.",
                                                Toast.LENGTH_LONG
                                        )
                                        .show()
                                return
                        }

                        val backupUri = Uri.parse(backupPath)

                        val channelId = "backup_channel"
                        var notificationBuilder =
                                NotificationCompat.Builder(context, channelId)
                                        .setSmallIcon(R.drawable.baseline_download_24)
                                        .setAutoCancel(true)

                        val notificationManager = NotificationManagerCompat.from(context)
                        val channel =
                                NotificationChannel(
                                        channelId,
                                        "Backup channel",
                                        NotificationManager.IMPORTANCE_DEFAULT
                                )
                        channel.description = "Automatic backups of the database"
                        notificationManager.createNotificationChannel(channel)

                        if (ActivityCompat.checkSelfPermission(
                                        context,
                                        Manifest.permission.POST_NOTIFICATIONS
                                ) != PackageManager.PERMISSION_GRANTED
                        ) {
                                return
                        }

                        val dir = DocumentFile.fromTreeUri(context, backupUri)
                        if (dir == null) {
                                setAutomaticBackups(context, false)
                                Toast.makeText(
                                                context,
                                                "Backup failed: Could not access backup directory. Automatic backups disabled.",
                                                Toast.LENGTH_LONG
                                        )
                                        .show()
                                return
                        }

                        val currentDate = LocalDate.now() // Get today's date
                        val formatter =
                                DateTimeFormatter.ofPattern("yyyy-MM-dd") // Define the pattern
                        val yyyyMMdd = formatter.format(currentDate)
                        val fileName = "fitbook-${yyyyMMdd}.zip"
                        val file = dir.createFile("application/zip", fileName)
                        if (file == null) {
                                setAutomaticBackups(context, false)
                                Toast.makeText(
                                                context,
                                                "Backup failed: Could not create backup file. Automatic backups disabled.",
                                                Toast.LENGTH_LONG
                                        )
                                        .show()
                                return
                        }

                        Log.d("BackupReceiver", "file.uri=${file.uri}")
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
                                        "Share",
                                        pendingShare
                                )

                        val filesDir = context.filesDir
                        if (filesDir == null) {
                                setAutomaticBackups(context, false)
                                Toast.makeText(
                                                context,
                                                "Backup failed: Could not access application files directory. Automatic backups disabled.",
                                                Toast.LENGTH_LONG
                                        )
                                        .show()
                                return
                        }
                        val parentDir = filesDir.parentFile
                        if (parentDir == null) {
                                setAutomaticBackups(context, false)
                                Toast.makeText(
                                                context,
                                                "Backup failed: Could not access parent directory. Automatic backups disabled.",
                                                Toast.LENGTH_LONG
                                        )
                                        .show()
                                return
                        }
                        val dbFolder = File(parentDir, "app_flutter").absolutePath

                        val dbFile = File(dbFolder, "fitbook.sqlite")

                        val outputStream = context.contentResolver.openOutputStream(file.uri)
                        if (outputStream == null) {
                                setAutomaticBackups(context, false)
                                Toast.makeText(
                                                context,
                                                "Backup failed: Could not open output stream. Automatic backups disabled.",
                                                Toast.LENGTH_LONG
                                        )
                                        .show()
                                return
                        }

                        if (!dbFile.exists()) {
                                setAutomaticBackups(context, false)
                                Toast.makeText(
                                                context,
                                                "Backup failed: Database file not found. Automatic backups disabled.",
                                                Toast.LENGTH_LONG
                                        )
                                        .show()
                                return
                        }

                        val temporaryDatabase =
                                File.createTempFile("fitbook-backup-", ".sqlite", context.cacheDir)
                        try {
                                val images = createPortableDatabaseCopy(dbFile, temporaryDatabase)
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
                                        notificationBuilder.setContentTitle("Backed up data and images")
                                notificationManager.notify(2, notificationBuilder.build())
                        } finally {
                                temporaryDatabase.delete()
                        }
                } catch (e: Exception) {
                        Log.e("BackupReceiver", "Error during backup: ${e.message}", e)
                        setAutomaticBackups(context, false)
                        Toast.makeText(
                                        context,
                                        "Backup failed: ${e.message}. Automatic backups disabled.",
                                        Toast.LENGTH_LONG
                                )
                                .show()
                        return
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
                try {
                        // Include committed WAL data before copying the database file.
                        sourceDatabase.rawQuery("PRAGMA wal_checkpoint(FULL)", null).use { cursor ->
                                if (cursor.moveToFirst() && cursor.getInt(0) != 0) {
                                        throw IllegalStateException("Database is busy")
                                }
                        }
                } finally {
                        sourceDatabase.close()
                }
                sourceFile.copyTo(destinationFile, overwrite = true)

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
