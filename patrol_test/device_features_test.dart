import 'dart:io';

import 'package:fit_book/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

Future<void> _waitForNotification({
  required PatrolIntegrationTester $,
  required String title,
  String? content,
}) async {
  final deadline = DateTime.now().add(const Duration(seconds: 15));
  while (DateTime.now().isBefore(deadline)) {
    final notifications = await $.platform.mobile.getNotifications();
    if (notifications.any(
      (notification) =>
          notification.title == title &&
          (content == null || notification.content == content),
    )) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }

  fail(
    content == null
        ? 'Notification not found: $title'
        : 'Notification not found: $title — $content',
  );
}

void main() {
  patrolTest(
    'automatic backup writes an archive and posts a device notification',
    ($) async {
      if (!Platform.isAndroid) return;

      app.main();
      await $.pumpAndSettle();

      await $(Icons.more_vert).tap();
      await $('Settings').tap();
      await $('Data').tap();

      // Android may restore app data after Patrol reinstalls the APK. Ensure
      // the tap below always enables backups (and therefore opens the picker).
      if ($(Switch).which<Switch>((widget) => widget.value).exists) {
        await $('Automatic backup').tap();
        await $.pumpAndSettle();
      }
      await $('Automatic backup').tap();

      // ACTION_OPEN_DOCUMENT_TREE exposes folder creation in the overflow
      // menu on current DocumentsUI builds. Open the menu first, then select
      // the visible menu item instead of looking for a toolbar icon.
      final backupFolderName =
          'FitBook Patrol ${DateTime.now().millisecondsSinceEpoch}';
      await $.platform.android.tap(
        const AndroidSelector(contentDescription: 'More options'),
      );
      await $.platform.android.tap(
        const AndroidSelector(text: 'New folder'),
      );
      await $.platform.android.enterText(
        const AndroidSelector(resourceName: 'android:id/text1'),
        text: backupFolderName,
      );
      await $.platform.android.tap(
        const AndroidSelector(text: 'OK', resourceName: 'android:id/button1'),
      );
      await $.platform.android.tap(
        const AndroidSelector(
          text: 'USE THIS FOLDER',
          resourceName: 'android:id/button1',
        ),
      );
      await $.platform.android.allowPermission();

      if (await $.platform.mobile.isPermissionDialogVisible(
        timeout: const Duration(seconds: 5),
      )) {
        await $.platform.mobile.grantPermissionWhenInUse();
      }

      await $.pumpAndSettle();
      expect(
        $(Switch).which<Switch>((widget) => widget.value).exists,
        isTrue,
      );

      await _waitForNotification(
        $: $,
        title: 'Automatic backups enabled',
        content:
            'FitBook will automatically back up your data and images to the selected folder each day.',
      );

      // Invoke the production BackupReceiver without waiting for its 2am alarm.
      const channel = MethodChannel('com.presley.fit_book/android');
      await channel.invokeMethod<void>('runBackupNow');
      await Future<void>.delayed(const Duration(seconds: 3));

      await _waitForNotification(
        $: $,
        title: 'Backed up data and images',
      );
    },
  );

  patrolTest(
    'reminders can be enabled and disabled',
    ($) async {
      if (!Platform.isAndroid) return;

      app.main();
      await $.pumpAndSettle();

      await $(Icons.more_vert).tap();
      await $('Settings').tap();
      await $('Diary').tap();
      await $('Reminders').scrollTo().tap();

      expect(
        $(Switch).which<Switch>((widget) => !widget.value).exists,
        isTrue,
      );

      if (await $.platform.mobile.isPermissionDialogVisible(
        timeout: const Duration(seconds: 5),
      )) {
        await $.platform.mobile.grantPermissionWhenInUse();
      }

      await $.pumpAndSettle();
      expect(
        $(Switch).which<Switch>((widget) => widget.value).exists,
        isTrue,
      );

      await _waitForNotification(
        $: $,
        title: 'Meal reminders enabled',
        content:
            "We'll remind you to log breakfast, lunch, or dinner if you haven't logged it yet.",
      );

      await $('Reminders').scrollTo().tap();
      await $.pumpAndSettle();
      expect(
        $(Switch).which<Switch>((widget) => !widget.value).exists,
        isTrue,
      );
    },
    tags: 'reminders',
  );

  patrolTest(
    'reminders setting persists after reopening diary settings',
    ($) async {
      if (!Platform.isAndroid) return;

      app.main();
      await $.pumpAndSettle();

      await $(Icons.more_vert).tap();
      await $('Settings').tap();
      await $('Diary').tap();
      await $('Reminders').scrollTo().tap();

      if (await $.platform.mobile.isPermissionDialogVisible(
        timeout: const Duration(seconds: 5),
      )) {
        await $.platform.mobile.grantPermissionWhenInUse();
      }
      await $.pumpAndSettle();

      await $.platform.android.pressBack();
      await $.platform.android.pressBack();
      await $.pumpAndSettle();

      await $(Icons.more_vert).tap();
      await $('Settings').tap();
      await $('Diary').tap();
      await $('Reminders').scrollTo();

      expect(
        $(Switch).which<Switch>((widget) => widget.value).exists,
        isTrue,
      );
    },
    tags: 'reminders',
  );
}
