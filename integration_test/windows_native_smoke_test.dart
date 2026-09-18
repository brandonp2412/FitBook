import 'dart:io';

import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/reminders.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/settings/data_settings.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Windows reminder notifications initialize and show without throwing',
    (tester) async {
      if (!Platform.isWindows) return;

      final l10n = localizationsFromPreference('en');
      await notifyRemindersEnabled(l10n);
      await doDesktopReminders();
    },
  );

  testWidgets('Windows skips unsupported camera integrations', (tester) async {
    if (!Platform.isWindows) return;

    expect(supportsCameraCapture, isFalse);
    expect(supportsBarcodeCamera, isFalse);
    expect(
      await pickAndSaveImage('windows-test', source: ImageSource.camera),
      isNull,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: SizedBox.shrink(),
      ),
    );

    final result = await performBarcodeScan(
      tester.element(find.byType(SizedBox)),
    );
    expect(result.food, isNull);
    expect(result.barcode, isNull);
  });

  testWidgets('Windows ignores Android-only automatic backup', (tester) async {
    if (!Platform.isWindows) return;

    await tapBackup(true, localizationsFromPreference('en'));
  });
}
