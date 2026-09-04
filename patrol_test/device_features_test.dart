import 'dart:io';

import 'package:fit_book/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'automatic backup opens the folder picker and cancel leaves it disabled',
    ($) async {
      if (!Platform.isAndroid) return;

      app.main();
      await $.pumpAndSettle();

      await $(Icons.more_vert).tap();
      await $('Settings').tap();
      await $('Data').tap();

      if ($(Switch).which<Switch>((widget) => widget.value).exists) {
        await $('Automatic backup').tap();
        await $.pumpAndSettle();
      }

      expect(
        $(Switch).which<Switch>((widget) => !widget.value).exists,
        isTrue,
      );

      await $('Automatic backup').tap();

      // Back must dismiss ACTION_OPEN_DOCUMENT_TREE and return to this same
      // Flutter route. If the picker never opened, Back would pop Data settings
      // instead and the assertions below would fail.
      await $.platform.android.pressBack();
      await $.pumpAndSettle();

      expect($('Automatic backup').exists, isTrue);
      expect(
        $(Switch).which<Switch>((widget) => !widget.value).exists,
        isTrue,
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
