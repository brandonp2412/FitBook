import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';

import 'package:fit_book/database/database.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/main.dart' as app;
import 'package:fit_book/reminder_schedule.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

Timer? timer;

const _windowsNotificationSettings = WindowsInitializationSettings(
  appName: 'FitBook',
  appUserModelId: 'FrisbeeSoftware.FitBook.CalorieTracker',
  guid: '0efbdadd-a415-4ecc-ae12-bfa6bfd94af2',
);
const _desktopNotificationDetails = NotificationDetails(
  macOS: DarwinNotificationDetails(),
  linux: LinuxNotificationDetails(),
  windows: WindowsNotificationDetails(),
);

Future<void> setupReminders({bool requestPermission = true}) async {
  if (kIsWeb) return;

  if (!Platform.isAndroid && !Platform.isIOS) {
    timer?.cancel();
    timer = Timer.periodic(
      reminderCheckInterval,
      (_) => unawaited(doDesktopReminders()),
    );
    // Checking immediately avoids missing dinner when FitBook opens mid-window.
    unawaited(doDesktopReminders());
    return;
  }

  if (requestPermission) await Permission.notification.request();
  final manager = Workmanager();
  await manager.initialize(doMobileReminders);
  await manager.registerPeriodicTask(
    'reminders',
    'reminders',
    frequency: reminderCheckInterval,
    existingWorkPolicy: ExistingPeriodicWorkPolicy.update,
  );
}

Future<void> cancelReminders() async {
  if (kIsWeb) return;
  if (Platform.isAndroid || Platform.isIOS) {
    await Workmanager().cancelByUniqueName('reminders');
  } else {
    timer?.cancel();
    timer = null;
  }
}

/// Explains the reminder schedule the first time reminders are enabled.
Future<void> notifyRemindersEnabled(AppLocalizations l10n) async {
  if (kIsWeb) return;
  if (Platform.isAndroid || Platform.isIOS) {
    final permission = await Permission.notification.request();
    if (!permission.isGranted) return;
  }
  const darwin = DarwinInitializationSettings();
  const android = AndroidInitializationSettings('@drawable/nutrition');
  final linux = LinuxInitializationSettings(
    defaultActionName: l10n.openNotification,
  );
  final init = InitializationSettings(
    android: android,
    iOS: darwin,
    macOS: darwin,
    linux: linux,
    windows: _windowsNotificationSettings,
  );
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(settings: init);
  await plugin.show(
    id: 0,
    title: l10n.mealRemindersEnabled,
    body: l10n.mealRemindersEnabledBody,
    notificationDetails: NotificationDetails(
      android: AndroidNotificationDetails(
        'reminder-settings',
        l10n.reminderSettingsChannel,
        channelDescription: l10n.reminderSettingsChannelDescription,
      ),
      iOS: const DarwinNotificationDetails(),
      macOS: const DarwinNotificationDetails(),
      linux: const LinuxNotificationDetails(),
      windows: const WindowsNotificationDetails(),
    ),
  );
}

Future<AppLocalizations> _loadReminderLocalizations(
  AppDatabase database,
) async {
  final settings = await (database.settings.select()..limit(1)).getSingle();
  return localizationsFromPreference(settings.locale);
}

Future<void> _checkAndNotify({
  required AppDatabase database,
  required NotificationDetails Function(ReminderMeal, AppLocalizations) details,
  required InitializationSettings initialization,
}) async {
  final now = DateTime.now();
  final settings = await (database.settings.select()..limit(1)).getSingle();
  if (!settings.reminders) {
    debugPrint('FitBookReminders: reminders disabled');
    return;
  }

  final reminderTimes = {
    ReminderMeal.breakfast: settings.breakfastReminderMinutes,
    ReminderMeal.lunch: settings.lunchReminderMinutes,
    ReminderMeal.dinner: settings.dinnerReminderMinutes,
  };
  final dueMeals = eligibleReminderMealsAt(
    now,
    reminderTimes: reminderTimes,
  ).toList();
  if (dueMeals.isEmpty) {
    debugPrint('FitBookReminders: outside meal reminder windows');
    return;
  }

  final startOfDay = DateTime(now.year, now.month, now.day);
  final endOfDay = DateTime(now.year, now.month, now.day + 1);
  final diaries = await (database.diaries.select()
        ..where(
          (diary) =>
              diary.created.isBiggerOrEqualValue(startOfDay) &
              diary.created.isSmallerThanValue(endOfDay),
        ))
      .get();
  final entries = diaries.map((diary) => diary.created);
  final prefs = SharedPreferencesAsync();
  final l10n = await _loadReminderLocalizations(database);
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(settings: initialization);
  for (final meal in dueMeals) {
    final sentKey = 'fitbook.reminder.lastSent.${meal.name}';
    final previouslySent = await prefs.getString(sentKey);
    if (!shouldSendMealReminder(
      now: now,
      meal: meal,
      reminderTimes: reminderTimes,
      diaryEntries: entries,
      lastSentDayKey: previouslySent,
    )) {
      debugPrint('FitBookReminders: ${meal.name} already logged or reminded');
      continue;
    }

    final title = switch (meal) {
      ReminderMeal.breakfast => l10n.breakfastReminderTitle,
      ReminderMeal.lunch => l10n.lunchReminderTitle,
      ReminderMeal.dinner => l10n.dinnerReminderTitle,
    };
    await plugin.show(
      id: meal.index + 1,
      title: title,
      notificationDetails: details(meal, l10n),
    );
    await prefs.setString(sentKey, reminderDayKey(meal, now));
    debugPrint('FitBookReminders: ${meal.name} reminder posted');
  }
}

Future<void> doDesktopReminders() async {
  final l10n = await _loadReminderLocalizations(app.db);
  await _checkAndNotify(
    database: app.db,
    initialization: InitializationSettings(
      linux: LinuxInitializationSettings(
        defaultActionName: l10n.openNotification,
      ),
      macOS: const DarwinInitializationSettings(),
      windows: _windowsNotificationSettings,
    ),
    details: (_, __) => _desktopNotificationDetails,
  );
}

/// WorkManager invokes this Dart entry point even when the UI isn't running.
@pragma('vm:entry-point')
void doMobileReminders() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = AppDatabase();
    try {
      await _checkAndNotify(
        database: database,
        initialization: const InitializationSettings(
          iOS: DarwinInitializationSettings(),
          android: AndroidInitializationSettings('@drawable/nutrition'),
        ),
        details: (meal, l10n) => NotificationDetails(
          android: AndroidNotificationDetails(
            '${meal.name}-reminders',
            switch (meal) {
              ReminderMeal.breakfast => l10n.breakfastRemindersChannel,
              ReminderMeal.lunch => l10n.lunchRemindersChannel,
              ReminderMeal.dinner => l10n.dinnerRemindersChannel,
            },
            channelDescription: switch (meal) {
              ReminderMeal.breakfast =>
                l10n.breakfastRemindersChannelDescription,
              ReminderMeal.lunch => l10n.lunchRemindersChannelDescription,
              ReminderMeal.dinner => l10n.dinnerRemindersChannelDescription,
            },
          ),
          iOS: const DarwinNotificationDetails(),
        ),
      );
      return true;
    } catch (error, stack) {
      debugPrint('FitBookReminders: background check failed: $error\n$stack');
      return false; // Allow the platform to retry a failed background check.
    } finally {
      await database.close();
    }
  });
}
