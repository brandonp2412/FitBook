import 'package:drift/drift.dart' hide isNull;
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/data_settings.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_tests.dart';

void main() {
  setUp(() async {
    await mockTests();
  });

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(androidChannel, null);
    await db.close();
  });

  testWidgets('cancelled backup folder selection stays disabled',
      (tester) async {
    var pickerCalls = 0;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(androidChannel, (call) async {
      pickerCalls++;
      expect(call.method, 'pick');
      expect(call.arguments, isNull);
      return null;
    });

    await tapBackup(true);

    final settings = await db.settings.select().getSingle();
    expect(settings.automaticBackups, isFalse);
    expect(pickerCalls, 1);
  });

  testWidgets('failed backup folder selection stays disabled', (tester) async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(androidChannel, (call) async {
      throw PlatformException(code: 'picker-failed');
    });

    await expectLater(
      tapBackup(true),
      throwsA(isA<PlatformException>()),
    );

    final settings = await db.settings.select().getSingle();
    expect(settings.automaticBackups, isFalse);
  });

  testWidgets('disabling backups does not open the folder picker',
      (tester) async {
    await db.settings.update().write(
          const SettingsCompanion(automaticBackups: Value(true)),
        );
    var pickerCalls = 0;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(androidChannel, (call) async {
      pickerCalls++;
      return null;
    });

    await tapBackup(false);

    final settings = await db.settings.select().getSingle();
    expect(settings.automaticBackups, isFalse);
    expect(pickerCalls, 0);
  });
}
