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
import 'test_utils.dart';

void main() async {
  testWidgets('EntryPage CRUD', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final food1Id = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Test 1',
        calories: const Value(1),
        servingWeight1G: const Value(1),
      ),
    );
    await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Test 4',
        calories: const Value(100),
      ),
    );

    await (db.diaries.insertAll(
      [
        DiariesCompanion.insert(
          food: Value(food1Id),
          created: DateTime.now(),
          quantity: 1,
          unit: 'grams',
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
    await tester.pumpAndSettle();
    expect(find.text('Test 1'), findsOne);

    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(find.text('Add diary entry'), findsOne);

    await tester.enterText(find.byKey(const Key('name_field')), 'Test 4');
    await tester.pumpAndSettle();
    await tester.tap(
      find
          .ancestor(
            of: find.text('Test 4'),
            matching: find.byType(ListTile),
          )
          .first,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Add'), findsOne);
    dumpTexts();
    expect(find.text('Test 4'), findsOne);

    await tester.tap(find.text('Test 4'));
    await tester.pumpAndSettle();
    expect(find.text('Edit diary entry'), findsOne);
    await tester.enterText(find.byKey(const Key('name_field')), 'Test 5');
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Test 5'), findsOne);

    await tester.longPress(find.text('Test 5'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Delete'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(find.text('Test 5'), findsNothing);

    await db.close();
  });
}
