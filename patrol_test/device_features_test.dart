import 'dart:io';

import 'package:fit_book/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

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

      // Android's Storage Access Framework owns this screen. Create a fresh
      // folder in the current location so the test never depends on a
      // particular standard folder such as Download.
      final backupFolderName =
          'FitBook Patrol ${DateTime.now().millisecondsSinceEpoch}';
      await $.platform.android.tap(
        const AndroidSelector(contentDescription: 'New folder'),
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

      if (await $.platform.mobile.isPermissionDialogVisible()) {
        await $.platform.mobile.grantPermissionWhenInUse();
      }

      await $.pumpAndSettle();
      expect(
        $(Switch).which<Switch>((widget) => widget.value).exists,
        isTrue,
      );

      await $.platform.mobile.openNotifications();
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(text: 'Automatic backups enabled'),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(
          text:
              'FitBook will automatically back up your data and images to the selected folder each day.',
        ),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.pressBack();

      // Invoke the production BackupReceiver without waiting for its 2am alarm.
      const channel = MethodChannel('com.presley.fit_book/android');
      await channel.invokeMethod<void>('runBackupNow');
      await Future<void>.delayed(const Duration(seconds: 3));

      await $.platform.mobile.openNotifications();
      await $.platform.android.tap(
        const AndroidSelector(text: 'Backed up data and images'),
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

      if (await $.platform.mobile.isPermissionDialogVisible()) {
        await $.platform.mobile.grantPermissionWhenInUse();
      }

      await $.pumpAndSettle();
      expect(
        $(Switch).which<Switch>((widget) => widget.value).exists,
        isTrue,
      );

      await $.platform.mobile.openNotifications();
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(text: 'Meal reminders enabled'),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(
          text:
              "We'll remind you to log breakfast, lunch, or dinner if you haven't logged it yet.",
        ),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.pressBack();

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

      if (await $.platform.mobile.isPermissionDialogVisible()) {
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
