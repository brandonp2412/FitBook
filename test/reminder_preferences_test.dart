import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_page.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sqlite3/sqlite3.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

void main() {
  test('reminder settings have the requested defaults and survive updates',
      () async {
    await mockTests();
    final initial = await db.settings.select().getSingle();
    expect(initial.breakfastReminderMinutes, 9 * 60);
    expect(initial.lunchReminderMinutes, 13 * 60);
    expect(initial.dinnerReminderMinutes, 20 * 60);

    await db.settings.update().write(
          const SettingsCompanion(
            breakfastReminderMinutes: Value(7 * 60 + 25),
            lunchReminderMinutes: Value(14 * 60 + 5),
            dinnerReminderMinutes: Value(21 * 60 + 40),
          ),
        );
    final updated = await db.settings.select().getSingle();
    expect(updated.breakfastReminderMinutes, 445);
    expect(updated.lunchReminderMinutes, 845);
    expect(updated.dinnerReminderMinutes, 1300);
    await db.close();
  });

  test('upgrading an existing v57 database preserves preferences', () async {
    final root =
        await Directory.systemTemp.createTemp('fitbook-reminders-upgrade-');
    addTearDown(() => root.delete(recursive: true));
    final file = File('${root.path}/fitbook.sqlite');
    final legacy = AppDatabase(executor: NativeDatabase(file));
    await legacy.settings.update().write(
          const SettingsCompanion(
            reminders: Value(true),
            dailyCalories: Value(2350),
          ),
        );
    await legacy.close();

    // Reconstruct an existing v57 database by removing only the three new
    // columns and restoring the old user_version. All other data survives.
    final sqlite = sqlite3.open(file.path);
    try {
      sqlite.execute(
        'ALTER TABLE settings DROP COLUMN breakfast_reminder_minutes',
      );
      sqlite.execute('ALTER TABLE settings DROP COLUMN lunch_reminder_minutes');
      sqlite
          .execute('ALTER TABLE settings DROP COLUMN dinner_reminder_minutes');
      sqlite.execute('PRAGMA user_version = 57');
    } finally {
      sqlite.close();
    }

    final upgraded = AppDatabase(executor: NativeDatabase(file));
    try {
      final row = await upgraded.settings.select().getSingle();
      expect(row.reminders, isTrue);
      expect(row.dailyCalories, 2350);
      expect(row.breakfastReminderMinutes, 540);
      expect(row.lunchReminderMinutes, 780);
      expect(row.dinnerReminderMinutes, 1200);
      expect(
        (await upgraded.customSelect('PRAGMA user_version').getSingle())
            .read<int>('user_version'),
        58,
      );
    } finally {
      await upgraded.close();
    }
  });

  testWidgets('Diary settings show editable reminder time rows',
      (tester) async {
    await mockTests();
    await db.settings.update().write(
          const SettingsCompanion(reminders: Value(true)),
        );
    final state = SettingsState(await db.settings.select().getSingle());
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: state,
        child: localizedApp(home: const SettingsPage()),
      ),
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.bySemanticsLabel('Search settings...'),
      'reminders',
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('breakfastReminderTimeTile')), findsOneWidget);
    expect(find.byKey(const Key('lunchReminderTimeTile')), findsOneWidget);
    expect(find.byKey(const Key('dinnerReminderTimeTile')), findsOneWidget);
    expect(find.text('9:00 AM'), findsOneWidget);
    expect(find.text('1:00 PM'), findsOneWidget);
    expect(find.text('8:00 PM'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('lunchReminderTimeTile')));
    await tester.tap(find.byKey(const Key('lunchReminderTimeTile')));
    await tester.pumpAndSettle();
    expect(find.byType(TimePickerDialog), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect((await db.settings.select().getSingle()).lunchReminderMinutes, 780);

    // Change the actual time through Flutter's native picker, not by direct SQL.
    await tester.tap(find.byKey(const Key('lunchReminderTimeTile')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.keyboard_outlined));
    await tester.pumpAndSettle();
    final timeFields = find.descendant(
      of: find.byType(TimePickerDialog),
      matching: find.byType(TextField),
    );
    expect(timeFields, findsNWidgets(2));
    await tester.enterText(timeFields.at(0), '2');
    await tester.enterText(timeFields.at(1), '30');
    await tester.tap(find.text('OK').last);
    await tester.pumpAndSettle();
    expect((await db.settings.select().getSingle()).lunchReminderMinutes, 870);
    await db.close();
  });
}
