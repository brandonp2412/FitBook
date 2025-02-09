package com.presley.fit_book

import android.content.ContentValues
import android.content.Intent
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val (automaticBackups, backupPath) = getSettings(context)
        if (!automaticBackups || backupPath == null) return

        scheduleBackups(context)
    }

    private fun pick(path: String) {
        Log.d("MainActivity.pick", "dbPath=$path")
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
        activity.startActivityForResult(intent, WRITE_REQUEST_CODE)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        data?.data?.also { uri ->
            if (requestCode != WRITE_REQUEST_CODE) return

            val contentResolver = applicationContext.contentResolver
            val takeFlags: Int =
                Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
            contentResolver.takePersistableUriPermission(uri, takeFlags)
            Log.d("auto backup", "uri=$uri")
            scheduleBackups(context)

            val db = openDb(context)!!
            val values = ContentValues().apply {
                put("backup_path", uri.toString())
            }
            db.update("settings", values, null, null)
            db.close()
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            FLUTTER_CHANNEL
        )
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "pick" -> {
                    val dbPath = call.argument<String>("dbPath")!!
                    pick(dbPath)
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    companion object {
        const val FLUTTER_CHANNEL = "com.presley.fit_book/android"
        const val WRITE_REQUEST_CODE = 1
    }
}
