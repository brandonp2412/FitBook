import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
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

void setupReminders({bool requestPermission = true}) {
  if (kIsWeb) return;

  if (!Platform.isAndroid && !Platform.isIOS) {
    timer = Timer.periodic(
      const Duration(hours: 4),
      (timer) => doDesktopReminders(),
    );
    return;
  }

  if (requestPermission) Permission.notification.request();
  Workmanager().initialize(doMobileReminders);
  Workmanager().registerPeriodicTask(
    "reminders",
    "reminders",
    frequency: const Duration(hours: 4),
  );
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

Future<void> doDesktopReminders() async {
  final db = AppDatabase();
  final l10n = await _loadReminderLocalizations(db);
  final linux = LinuxInitializationSettings(
    defaultActionName: l10n.openNotification,
  );
  const darwin = DarwinInitializationSettings();
  final init = InitializationSettings(
    linux: linux,
    macOS: darwin,
    windows: _windowsNotificationSettings,
  );
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(settings: init);

  final diaries = await (db.diaries.select()
        ..where(
          (u) => const CustomExpression(
            "created >= strftime('%s', 'now', 'localtime', '-24 hours')",
          ),
        ))
      .get();
  final now = DateTime.now();
  final hour = now.hour;

  if (hour >= 6 && hour < 12) {
    final entered = diaries.where(
      (entry) => entry.created.hour >= 6 && entry.created.hour < 12,
    );
    if (entered.isEmpty) {
      await plugin.show(
        id: 1,
        title: l10n.breakfastReminderTitle,
        notificationDetails: _desktopNotificationDetails,
      );
    }
  } else if (hour >= 12 && hour < 16) {
    final entered = diaries.where(
      (entry) => entry.created.hour >= 12 && entry.created.hour < 16,
    );
    if (entered.isEmpty) {
      await plugin.show(
        id: 2,
        title: l10n.lunchReminderTitle,
        notificationDetails: _desktopNotificationDetails,
      );
    }
  } else if (hour >= 16 && hour < 22) {
    final entered = diaries.where(
      (entry) => entry.created.hour >= 16 && entry.created.hour < 22,
    );
    if (entered.isEmpty) {
      await plugin.show(
        id: 3,
        title: l10n.dinnerReminderTitle,
        notificationDetails: _desktopNotificationDetails,
      );
    }
  }
}

Future<AppLocalizations> _loadReminderLocalizations(
  AppDatabase database,
) async {
  final settings = await (database.settings.select()..limit(1)).getSingle();
  return localizationsFromPreference(settings.locale);
}

void cancelReminders() {
  if (kIsWeb) return;

  if (Platform.isAndroid || Platform.isIOS)
    Workmanager().cancelByUniqueName('reminders');
  else
    timer?.cancel();
}

/// This is used by WorkManager so you can't reference any external variables.
@pragma('vm:entry-point')
void doMobileReminders() {
  Workmanager().executeTask((task, inputData) async {
    final db = AppDatabase();
    final l10n = await _loadReminderLocalizations(db);
    const darwin = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/nutrition');
    const init = InitializationSettings(iOS: darwin, android: android);
    final plugin = FlutterLocalNotificationsPlugin();
    await plugin.initialize(settings: init);

    final diaries = await (db.diaries.select()
          ..where(
            (u) => const CustomExpression(
              "created >= strftime('%s', 'now', 'localtime', '-24 hours')",
            ),
          ))
        .get();
    final now = DateTime.now();
    final hour = now.hour;

    bool isBreakfast(int value) => value >= 6 && value < 12;
    bool isLunch(int value) => value >= 12 && value < 16;
    bool isDinner(int value) => value >= 16 && value < 22;

    if (isBreakfast(hour)) {
      final brekkie = diaries.where((entry) => isBreakfast(entry.created.hour));
      if (brekkie.isNotEmpty) return Future.value(true);

      await plugin.show(
        id: 1,
        title: l10n.breakfastReminderTitle,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            'breakfast-reminders',
            l10n.breakfastRemindersChannel,
            channelDescription: l10n.breakfastRemindersChannelDescription,
          ),
        ),
      );
    } else if (isLunch(hour)) {
      final lunch = diaries.where((entry) => isLunch(entry.created.hour));
      if (lunch.isNotEmpty) return Future.value(true);

      await plugin.show(
        id: 2,
        title: l10n.lunchReminderTitle,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            'lunch-reminders',
            l10n.lunchRemindersChannel,
            channelDescription: l10n.lunchRemindersChannelDescription,
          ),
        ),
      );
    } else if (isDinner(hour)) {
      final dins = diaries.where((entry) => isDinner(entry.created.hour));
      if (dins.isNotEmpty) return Future.value(true);

      await plugin.show(
        id: 3,
        title: l10n.dinnerReminderTitle,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            'dinner-reminders',
            l10n.dinnerRemindersChannel,
            channelDescription: l10n.dinnerRemindersChannelDescription,
          ),
        ),
      );
    }

    return Future.value(true);
  });
}
