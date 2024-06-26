import 'package:background_fetch/background_fetch.dart';
import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
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
    print("[BackgroundFetch] Event received $taskId");
    backgroundFetchHeadlessTask(HeadlessTask(taskId, false));
    BackgroundFetch.finish(taskId);
  }, (String taskId) async {
    print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
    BackgroundFetch.finish(taskId);
  }).then((value) => print("BackgroundFetch configure success $value"));

  BackgroundFetch.start().then((int status) {
    print('[BackgroundFetch] start success: $status');
  }).catchError((e) {
    print('[BackgroundFetch] start FAILURE: $e');
  });
}

@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }
  print('[BackgroundFetch] Headless event received.');

  const settings = AndroidInitializationSettings(
    '@drawable/nutrition',
  );
  const initialization = InitializationSettings(android: settings);
  final notifyPlugin = FlutterLocalNotificationsPlugin();
  await notifyPlugin.initialize(initialization);

  final now = DateTime.now();
  if (now.hour >= 7 && now.hour < 9) {
    final startOfBreakfast = DateTime(now.year, now.month, now.day, 7);
    final endOfBreakfast = DateTime(now.year, now.month, now.day, 9);
    final entries = await (db.entries.select()
          ..where(
            (u) => u.created.isBetweenValues(startOfBreakfast, endOfBreakfast),
          ))
        .get();
    if (entries.isNotEmpty) return;

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'breakfast_reminders',
        'Breakfast reminders',
      ),
    );
    await notifyPlugin.show(
      0,
      'Breakfast',
      "Don't forget to log your breakfast.",
      details,
    );
  } else if (now.hour >= 12 && now.hour < 14) {
    final startOfLunch = DateTime(now.year, now.month, now.day, 12);
    final endOfLunch = DateTime(now.year, now.month, now.day, 14);
    final entries = await (db.entries.select()
          ..where((u) => u.created.isBetweenValues(startOfLunch, endOfLunch)))
        .get();
    if (entries.isNotEmpty) return;

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'lunch_reminders',
        'Lunch reminders',
      ),
    );
    await notifyPlugin.show(
      1,
      'Lunch',
      "Don't forget to log your lunch.",
      details,
    );
  } else if (now.hour >= 19 && now.hour < 21) {
    final startOfDinner = DateTime(now.year, now.month, now.day, 19);
    final endOfDinner = DateTime(now.year, now.month, now.day, 21);
    final entries = await (db.entries.select()
          ..where((u) => u.created.isBetweenValues(startOfDinner, endOfDinner)))
        .get();
    if (entries.isNotEmpty) return;

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'lunch_reminders',
        'Lunch reminders',
      ),
    );
    await notifyPlugin.show(
      2,
      'Dinner',
      "Don't forget to log your dinner.",
      details,
    );
  }

  BackgroundFetch.finish(taskId);
}
