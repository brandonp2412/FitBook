import 'package:drift/drift.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/reminders.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

Future<void> pumpFitBook(WidgetTester tester) async {
  final setting = await db.settings.select().getSingle();
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsState(setting)),
        ChangeNotifierProvider(create: (_) => DiaryState()),
      ],
      child: const App(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  setUp(() => openDiaryFromReminder.value = false);
  tearDown(() => openDiaryFromReminder.value = false);

  test('meal reminders have a diary route; settings notifications do not', () {
    expect(isDiaryReminderTap(id: 1, payload: diaryReminderPayload), isTrue);
    expect(isDiaryReminderTap(id: 2), isTrue); // Older notifications.
    expect(isDiaryReminderTap(id: 3), isTrue);
    expect(isDiaryReminderTap(id: 0), isFalse);
    expect(isDiaryReminderTap(id: 1, payload: 'another-action'), isFalse);
    expect(isDiaryReminderTap(), isFalse);
  });

  testWidgets('cold launch opens diary in custom tab order', (tester) async {
    await mockTests();
    await db.settings.update().write(
          const SettingsCompanion(
            tabs: Value('GraphPage,DiaryPage,FoodPage,WeightPage'),
          ),
        );
    openDiaryFromReminder.value = true; // Tapped while app was terminated.
    await pumpFitBook(tester);
    expect(tester.widget<BottomNav>(find.byType(BottomNav)).currentIndex, 1);
    expect(find.byType(DiaryPage), findsOneWidget);
    expect(openDiaryFromReminder.value, isFalse);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await db.close();
  });

  testWidgets('warm tap pops settings and switches to diary', (tester) async {
    await mockTests();
    await pumpFitBook(tester);
    tester.widget<BottomNav>(find.byType(BottomNav)).onTap(1);
    await tester.pumpAndSettle();
    expect(tester.widget<BottomNav>(find.byType(BottomNav)).currentIndex, 1);
    Navigator.of(tester.element(find.byType(HomePage))).push(
      MaterialPageRoute<void>(
        builder: (_) => const Scaffold(body: Text('Other screen')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Other screen'), findsOneWidget);
    openDiaryFromReminder.value = true;
    await tester.pumpAndSettle();
    expect(find.text('Other screen'), findsNothing);
    expect(tester.widget<BottomNav>(find.byType(BottomNav)).currentIndex, 0);
    expect(find.byType(DiaryPage), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await db.close();
  });

  testWidgets('hidden diary still opens via a temporary route', (tester) async {
    await mockTests();
    await db.settings.update().write(
          const SettingsCompanion(tabs: Value('GraphPage,FoodPage,WeightPage')),
        );
    await pumpFitBook(tester);
    openDiaryFromReminder.value = true;
    await tester.pumpAndSettle();
    expect(find.byType(DiaryPage), findsOneWidget);
    expect(openDiaryFromReminder.value, isFalse);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await db.close();
  });
}
