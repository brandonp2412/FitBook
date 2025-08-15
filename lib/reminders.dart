import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workmanager/workmanager.dart';

Timer? timer;

void setupReminders() {
  if (kIsWeb) return;

  if (Platform.isAndroid || Platform.isIOS) {
    Permission.notification.request();
    Workmanager().initialize(doMobileReminders);
    Workmanager().registerPeriodicTask(
      "reminders",
      "reminders",
      frequency: const Duration(hours: 4),
    );
  } else {
    timer = Timer.periodic(
      const Duration(hours: 4),
      (timer) => doDesktopReminders(),
    );
  }
}

doDesktopReminders() async {
  const linux =
      LinuxInitializationSettings(defaultActionName: 'Open notification');
  const darwin = DarwinInitializationSettings();
  const init = InitializationSettings(
    linux: linux,
    macOS: darwin,
  );
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(init);

  final db = AppDatabase();

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
    final entered = diaries
        .where((entry) => entry.created.hour >= 6 && entry.created.hour < 12);
    if (entered.isEmpty)
      await plugin.show(
        1,
        "Don't forget to log breakfast",
        null,
        null,
      );
  } else if (hour >= 12 && hour < 16) {
    final entered = diaries.where(
      (entry) => entry.created.hour >= 12 && entry.created.hour < 16,
    );
    if (entered.isEmpty)
      await plugin.show(
        2,
        "Don't forget to log lunch",
        null,
        null,
      );
  } else if (hour >= 16 && hour < 22) {
    final entered = diaries.where(
      (entry) => entry.created.hour >= 16 && entry.created.hour < 22,
    );
    if (entered.isEmpty)
      await plugin.show(
        3,
        "Don't forget to log dinner",
        null,
        null,
      );
  }
}

void cancelReminders() {
  if (kIsWeb) return;

  if (Platform.isAndroid || Platform.isIOS)
    Workmanager().cancelByUniqueName('reminders');
  else
    timer?.cancel();
}

/// This is used by WorkManager so you can't reference any external variables.
@pragma(
  'vm:entry-point',
)
void doMobileReminders() {
  Workmanager().executeTask((task, inputData) async {
    const darwin = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/nutrition');
    const init = InitializationSettings(
      iOS: darwin,
      android: android,
    );
    final plugin = FlutterLocalNotificationsPlugin();
    await plugin.initialize(init);

    final db = AppDatabase();

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
        1,
        "Don't forget to log breakfast",
        null,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'breakfast-reminders',
            'Breakfast reminders',
            channelDescription: 'Reminders to log breakfast',
          ),
        ),
      );
    } else if (isLunch(hour)) {
      final lunch = diaries.where((entry) => isLunch(entry.created.hour));
      if (lunch.isNotEmpty) return Future.value(true);

      await plugin.show(
        2,
        "Don't forget to log lunch",
        null,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'lunch-reminders',
            'Lunch reminders',
            channelDescription: 'Reminders to log lunch',
          ),
        ),
      );
    } else if (isDinner(hour)) {
      final dins = diaries.where((entry) => isDinner(entry.created.hour));
      if (dins.isNotEmpty) return Future.value(true);

      await plugin.show(
        3,
        "Don't forget to log dinner",
        null,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'dinner-reminders',
            'Dinner reminders',
            channelDescription: 'Reminders to log dinner',
          ),
        ),
      );
    }

    return Future.value(true);
  });
}
