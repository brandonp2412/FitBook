package com.presley.fit_book

import android.app.AlarmManager
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log

/** ADB-only QA entry point; not packaged into release APKs. */
class MealReminderTestReceiver : BroadcastReceiver() {
    private val requestCode = 9103
    private val tag = "FitBookReminders"

    private fun pendingTestAlarm(context: Context): PendingIntent {
        return PendingIntent.getBroadcast(
            context, requestCode,
            Intent(context, MealReminderTestReceiver::class.java).putExtra("mode", "fire"),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }

    override fun onReceive(context: Context, intent: Intent?) {
        if (!BuildConfig.DEBUG) return
        val mode = intent?.getStringExtra("mode") ?: return
        val manager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        when (mode) {
            "cancel" -> {
                manager.cancel(pendingTestAlarm(context))
                (context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager)
                    .cancel(9103)
                Log.i(tag, "QA cleanup complete")
            }
            "schedule" -> {
                val seconds = intent.getIntExtra("seconds", 30).coerceIn(5, 180)
                val triggerAt = System.currentTimeMillis() + seconds * 1000L
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    manager.setAndAllowWhileIdle(
                        AlarmManager.RTC_WAKEUP, triggerAt, pendingTestAlarm(context),
                    )
                } else {
                    manager.set(AlarmManager.RTC_WAKEUP, triggerAt, pendingTestAlarm(context))
                }
                Log.i(tag, "QA alarm scheduled for $seconds seconds later")
            }
            "fire", "logged", "unlogged", "live" -> {
                val reminderIntent = Intent(context, MealReminderReceiver::class.java)
                    .putExtra("mealId", 103)
                    .putExtra("debugTest", true)
                    .putExtra("debugForce", true)
                if (mode == "logged") reminderIntent.putExtra("debugAssumeLogged", true)
                if (mode == "unlogged" || mode == "fire") {
                    reminderIntent.putExtra("debugAssumeLogged", false)
                }
                Log.i(tag, "QA request=$mode")
                context.sendBroadcast(reminderIntent)
            }
            else -> Log.w(tag, "QA unknown mode: $mode")
        }
    }
}
