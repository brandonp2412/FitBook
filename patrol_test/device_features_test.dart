import 'dart:io';

import 'package:fit_book/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

const _uiTimeout = Duration(seconds: 15);
const _nativeTimeout = Duration(seconds: 15);

Future<void> _openSettingsSection(
  PatrolIntegrationTester $,
  String section,
) async {
  await $(Icons.more_vert).waitUntilVisible(timeout: _uiTimeout).tap();
  await $('Settings').waitUntilVisible(timeout: _uiTimeout).tap();
  await $(section).waitUntilVisible(timeout: _uiTimeout).tap();
}

Future<void> _grantPermissionIfShown(PatrolIntegrationTester $) async {
  if (await $.platform.mobile.isPermissionDialogVisible(
    timeout: const Duration(seconds: 5),
  )) {
    await $.platform.mobile.grantPermissionWhenInUse();
  }
}

void main() {
  patrolTest(
    'automatic backup opens the folder picker and cancel leaves it disabled',
    ($) async {
      if (!Platform.isAndroid) return;

      app.main();
      await _openSettingsSection($, 'Data');

      final backupTile = $(#automaticBackupTile);
      final backupSwitch = $(#automaticBackupSwitch);
      await backupTile.waitUntilVisible(timeout: _uiTimeout);

      if (backupSwitch.which<Switch>((widget) => widget.value).exists) {
        await backupTile.tap();
        await backupSwitch
            .which<Switch>((widget) => !widget.value)
            .waitUntilExists(timeout: _uiTimeout);
      }

      await backupTile.tap();
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(textContains: 'Use this folder'),
        timeout: _nativeTimeout,
      );
      await $.platform.android.pressBack();

      await backupTile.waitUntilVisible(timeout: _uiTimeout);
      await backupSwitch
          .which<Switch>((widget) => !widget.value)
          .waitUntilExists(timeout: _uiTimeout);
    },
    tags: 'backup',
  );

  patrolTest(
    'reminders can be enabled and disabled',
    ($) async {
      if (!Platform.isAndroid) return;

      app.main();
      await _openSettingsSection($, 'Diary');

      final remindersTile = $(#remindersTile);
      final remindersSwitch = $(#remindersSwitch);
      await remindersTile.scrollTo().tap();
      await _grantPermissionIfShown($);
      await remindersSwitch
          .which<Switch>((widget) => widget.value)
          .waitUntilExists(timeout: _uiTimeout);

      await remindersTile.scrollTo().tap();
      await remindersSwitch
          .which<Switch>((widget) => !widget.value)
          .waitUntilExists(timeout: _uiTimeout);
    },
    tags: 'reminders',
  );

  patrolTest(
    'reminders setting persists after reopening diary settings',
    (
      $,
    ) async {
      if (!Platform.isAndroid) return;

      app.main();
      await _openSettingsSection($, 'Diary');

      final remindersTile = $(#remindersTile);
      final remindersSwitch = $(#remindersSwitch);
      await remindersTile.scrollTo().tap();
      await _grantPermissionIfShown($);
      await remindersSwitch
          .which<Switch>((widget) => widget.value)
          .waitUntilExists(timeout: _uiTimeout);

      await $.platform.android.pressBack();
      await $.platform.android.pressBack();
      await $(Icons.more_vert).waitUntilVisible(timeout: _uiTimeout);

      await _openSettingsSection($, 'Diary');
      await remindersTile.scrollTo();
      await remindersSwitch
          .which<Switch>((widget) => widget.value)
          .waitUntilExists(timeout: _uiTimeout);
    },
    tags: 'reminders',
  );
}
