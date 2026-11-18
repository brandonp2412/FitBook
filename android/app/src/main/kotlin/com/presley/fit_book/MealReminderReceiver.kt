package com.presley.fit_book

import android.Manifest
import android.app.AlarmManager
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import java.util.Calendar

/**
 * WorkManager's four-hour periodic task cannot reliably hit the dinner window.
 * Schedule an Android alarm for each meal instead; the receiver checks today's
 * diary data before showing anything, including when FitBook isn't running.
 */
internal data class MealReminder(
    val id: Int,
    val hour: Int,
    val startHour: Int,
    val endHour: Int,
    val channelId: String,
    val titleKey: String,
    val defaultTitle: String,
    val channelName: String,
)

internal val mealReminders = listOf(
    MealReminder(101, 10, 6, 12, "breakfast-reminders", "breakfast", "Don't forget to log breakfast", "Breakfast reminders"),
    MealReminder(102, 14, 12, 16, "lunch-reminders", "lunch", "Don't forget to log lunch", "Lunch reminders"),
    MealReminder(103, 20, 16, 22, "dinner-reminders", "dinner", "Don't forget to log dinner", "Dinner reminders"),
)

private const val prefsName = "fitbook-meal-reminders"
private const val extraMeal = "mealId"
private const val notificationPermission = Manifest.permission.POST_NOTIFICATIONS

internal fun setMealReminders(context: Context, enabled: Boolean, titles: Map<String, String>) {
    val editor = context.getSharedPreferences(prefsName, Context.MODE_PRIVATE).edit()
        .putBoolean("enabled", enabled)
    titles.forEach { (meal, title) -> editor.putString("title_$meal", title) }
    editor.apply()
    if (enabled) scheduleMealReminders(context)
    else cancelMealReminders(context)
}

private fun remindersEnabled(context: Context): Boolean {
    val prefs = context.getSharedPreferences(prefsName, Context.MODE_PRIVATE)
    if (prefs.contains("enabled")) return prefs.getBoolean("enabled", false)

    // Upgrading from WorkManager should restore alarms even if the user
    // hasn't opened FitBook since the APK was updated.
    val db = openDb(context) ?: return false
    try {
        db.rawQuery("SELECT reminders FROM settings LIMIT 1", null).use { cursor ->
            return cursor.moveToFirst() && cursor.getInt(0) == 1
        }
    } catch (error: Exception) {
        Log.e("FitBookReminders", "Could not read reminder setting", error)
        return false
    } finally {
        db.close()
    }
}

private fun pendingReminder(context: Context, reminder: MealReminder, flags: Int): PendingIntent? {
    val intent = Intent(context, MealReminderReceiver::class.java)
        .putExtra(extraMeal, reminder.id)
    return PendingIntent.getBroadcast(
        context, reminder.id, intent, flags or PendingIntent.FLAG_IMMUTABLE
    )
}

internal fun cancelMealReminders(context: Context) {
    val alarms = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
    mealReminders.forEach { reminder ->
        pendingReminder(context, reminder, PendingIntent.FLAG_NO_CREATE)?.let {
            alarms.cancel(it)
            it.cancel()
        }
    }
}

internal fun scheduleMealReminders(context: Context, replace: Boolean = false) {
    if (!remindersEnabled(context)) return
    mealReminders.forEach { scheduleMealReminder(context, it, replace) }
}

private fun scheduleMealReminder(
    context: Context, reminder: MealReminder, replace: Boolean, afterFire: Boolean = false
) {
    // Keep a pending alarm when the app reopens; don't push a delayed dinner
    // reminder to tomorrow just because the user opened FitBook at 8:30 pm.
    if (!replace && pendingReminder(context, reminder, PendingIntent.FLAG_NO_CREATE) != null) return

    val now = System.currentTimeMillis()
    val whenToRing = Calendar.getInstance().apply {
        set(Calendar.HOUR_OF_DAY, reminder.hour)
        set(Calendar.MINUTE, 0)
        set(Calendar.SECOND, 0)
        set(Calendar.MILLISECOND, 0)
        if (afterFire) {
            add(Calendar.DAY_OF_YEAR, 1)
        } else if (timeInMillis <= now) {
            // If the app restarted shortly after the target, still allow a
            // prompt before 9 pm rather than losing the reminder entirely.
            if (reminder.id == 103 && Calendar.getInstance().get(Calendar.HOUR_OF_DAY) == 20) {
                timeInMillis = now + 1_000L
            } else {
                add(Calendar.DAY_OF_YEAR, 1)
            }
        }
    }.timeInMillis

    val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
    val pending = pendingReminder(context, reminder, PendingIntent.FLAG_UPDATE_CURRENT)!!
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
        alarmManager.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, whenToRing, pending)
    } else {
        alarmManager.set(AlarmManager.RTC_WAKEUP, whenToRing, pending)
    }
}

private fun mealLoggedToday(context: Context, reminder: MealReminder): Boolean {
    val db = openDb(context) ?: return true // Fail closed rather than send a false reminder.
    try {
        val start = Calendar.getInstance().apply {
            set(Calendar.HOUR_OF_DAY, reminder.startHour)
            set(Calendar.MINUTE, 0)
            set(Calendar.SECOND, 0)
            set(Calendar.MILLISECOND, 0)
        }.timeInMillis / 1000
        val end = Calendar.getInstance().apply {
            set(Calendar.HOUR_OF_DAY, reminder.endHour)
            set(Calendar.MINUTE, 0)
            set(Calendar.SECOND, 0)
            set(Calendar.MILLISECOND, 0)
        }.timeInMillis / 1000
        db.rawQuery(
            "SELECT 1 FROM diaries WHERE created >= ? AND created < ? LIMIT 1",
            arrayOf(start.toString(), end.toString()),
        ).use { cursor -> return cursor.moveToFirst() }
    } finally {
        db.close()
    }
}

class MealReminderReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        val reminder = mealReminders.firstOrNull {
            it.id == intent?.getIntExtra(extraMeal, -1)
        } ?: return
        try {
            if (!remindersEnabled(context)) return
            val hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY)
            val cutoff = if (reminder.id == 103) 21 else reminder.endHour
            val debugForce = BuildConfig.DEBUG && intent?.getBooleanExtra("debugForce", false) == true
            if (!debugForce && (hour < reminder.hour || hour >= cutoff)) return
            if (mealLoggedToday(context, reminder)) return
            if (Build.VERSION.SDK_INT >= 33 &&
                context.checkSelfPermission(notificationPermission) != PackageManager.PERMISSION_GRANTED
            ) return

            val notifications = NotificationManagerCompat.from(context)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                notifications.createNotificationChannel(
                    NotificationChannel(
                        reminder.channelId,
                        reminder.channelName,
                        NotificationManager.IMPORTANCE_DEFAULT,
                    )
                )
            }
            val launchIntent = context.packageManager.getLaunchIntentForPackage(context.packageName)
            val notification = NotificationCompat.Builder(context, reminder.channelId)
                .setSmallIcon(R.drawable.nutrition)
                .setContentTitle(
                    context.getSharedPreferences(prefsName, Context.MODE_PRIVATE)
                        .getString("title_${reminder.titleKey}", reminder.defaultTitle)
                )
                .setAutoCancel(true)
                .setPriority(NotificationCompat.PRIORITY_DEFAULT)
            if (launchIntent != null) {
                notification.setContentIntent(
                    PendingIntent.getActivity(
                        context, reminder.id, launchIntent,
                        PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
                    )
                )
            }
            notifications.notify(reminder.id, notification.build())
        } catch (error: Exception) {
            Log.e("FitBookReminders", "Meal reminder failed", error)
        } finally {
            if (remindersEnabled(context)) scheduleMealReminder(context, reminder, replace = true, afterFire = true)
        }
    }
}

/** One-shot alarms must be restored after reboot, app upgrades and clock changes. */
class MealReminderRescheduleReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        scheduleMealReminders(context, replace = true)
    }
}
