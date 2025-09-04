package com.presley.fit_book

import android.Manifest
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.util.Log
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.documentfile.provider.DocumentFile
import java.io.File
import java.time.LocalDate
import java.time.format.DateTimeFormatter

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
                        val fileName = "fitbook-${yyyyMMdd}.sqlite"
                        val file = dir.createFile("application/x-sqlite3", fileName)
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
                                        type = "application/x-sqlite3"
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

                        val outputStream = context.contentResolver.openOutputStream(file.uri)
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

                        dbFile.inputStream().use { input ->
                                outputStream.use { output ->
                                        input.copyTo(output)
                                        notificationBuilder =
                                                notificationBuilder.setContentTitle(
                                                        "Backed up database"
                                                )
                                        notificationManager.notify(2, notificationBuilder.build())
                                }
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
}
