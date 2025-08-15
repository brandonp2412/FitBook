import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('EntryPage CRUD', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await (db.diaries.insertAll(
      [
        DiariesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test 3',
              calories: const Value(1),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now(),
          quantity: 1,
          unit: 'serving',
        ),
        DiariesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test 2',
              calories: const Value(1),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now(),
          quantity: 1,
          unit: 'serving',
        ),
        DiariesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test 1',
              calories: const Value(1),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now(),
          quantity: 1,
          unit: 'serving',
        ),
      ],
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(
          home: DiaryPage(),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Test 1'), findsOne);

    await tester.tap(find.text('Add'));
    await tester.pump();
    expect(find.text('Add entry'), findsOne);
    await tester.enterText(find.bySemanticsLabel('Name'), 'Test 4');
    await tester.pump();
    await tester.tap(find.byTooltip('Save'));
    await tester.pump();
    expect(find.text('Add'), findsOne);
    expect(find.text('Test 4'), findsOne);

    await tester.tap(find.text('Test 4'));
    await tester.pump();
    expect(find.text('Edit entry'), findsOne);
    await tester.enterText(find.bySemanticsLabel('Name'), 'Test 5');
    await tester.pump();
    await tester.tap(find.byTooltip('Save'));
    await tester.pump();
    expect(find.text('Test 5'), findsOne);

    await tester.longPress(find.text('Test 5'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Delete'));
    await tester.pump();
    await tester.tap(find.text('Delete'));
    await tester.pump();
    expect(find.text('Test 5'), findsNothing);

    await db.close();
  });
}
