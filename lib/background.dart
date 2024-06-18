import 'package:background_fetch/background_fetch.dart';
import 'package:fit_book/main.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void registerBackground() async {
  await BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 15,
        stopOnTerminate: false,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.NONE,
      ), (String taskId) async {
    debugPrint("[BackgroundFetch] Event received $taskId");
    BackgroundFetch.finish(taskId);
  }, (String taskId) async {
    debugPrint("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
    BackgroundFetch.finish(taskId);
  }).then((value) => debugPrint("BackgroundFetch configure success $value"));

  BackgroundFetch.start().then((int status) {
    debugPrint('[BackgroundFetch] start success: $status');
  }).catchError((e) {
    debugPrint('[BackgroundFetch] start FAILURE: $e');
  });
}

@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    debugPrint("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }
  debugPrint('[BackgroundFetch] Headless event received.');

  final now = DateTime.now();
  if (now.hour >= 7 && now.hour < 9) {
    final startOfBreakfast = DateTime(now.year, now.month, now.day, 7);
    final endOfBreakfast = DateTime(now.year, now.month, now.day, 9);
    final entries = await (db.entries.select()
          ..where((u) =>
              u.created.isBetweenValues(startOfBreakfast, endOfBreakfast)))
        .get();
    if (entries.isNotEmpty) return;
    await breakfastReminder();
  } else if (now.hour >= 12 && now.hour < 14) {
    final startOfLunch = DateTime(now.year, now.month, now.day, 12);
    final endOfLunch = DateTime(now.year, now.month, now.day, 14);
    final entries = await (db.entries.select()
          ..where((u) => u.created.isBetweenValues(startOfLunch, endOfLunch)))
        .get();
    if (entries.isNotEmpty) return;
    await lunchReminder();
  } else if (now.hour >= 19 && now.hour < 21) {
    final startOfDinner = DateTime(now.year, now.month, now.day, 19);
    final endOfDinner = DateTime(now.year, now.month, now.day, 21);
    final entries = await (db.entries.select()
          ..where((u) => u.created.isBetweenValues(startOfDinner, endOfDinner)))
        .get();
    if (entries.isNotEmpty) return;
    await dinnerReminder();
  }

  BackgroundFetch.finish(taskId);
}

breakfastReminder() async {
  var settings = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initialization = InitializationSettings(android: settings);
  final notifyPlugin = FlutterLocalNotificationsPlugin();
  await notifyPlugin.initialize(initialization);

  const details = NotificationDetails(
    android: AndroidNotificationDetails(
      'breakfast_reminders',
      'Breakfast reminders',
    ),
  );
  await notifyPlugin.show(
    0,
    'Log breakfast',
    "Don't forget to log your breakfast.",
    details,
  );
}

lunchReminder() async {
  var settings = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initialization = InitializationSettings(android: settings);
  final notifyPlugin = FlutterLocalNotificationsPlugin();
  await notifyPlugin.initialize(initialization);

  const details = NotificationDetails(
    android: AndroidNotificationDetails(
      'lunch_reminders',
      'Lunch reminders',
    ),
  );
  await notifyPlugin.show(
    1,
    'Log lunch',
    "Don't forget to log your lunch.",
    details,
  );
}

dinnerReminder() async {
  var settings = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initialization = InitializationSettings(android: settings);
  final notifyPlugin = FlutterLocalNotificationsPlugin();
  await notifyPlugin.initialize(initialization);

  const details = NotificationDetails(
    android: AndroidNotificationDetails(
      'lunch_reminders',
      'Lunch reminders',
    ),
  );
  await notifyPlugin.show(
    2,
    'Log dinner',
    "Don't forget to log your dinner.",
    details,
  );
}
