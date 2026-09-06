import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/quick_add_page.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('QuickAdd edit preserves macro-nutrients', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final originalFoodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Quick-add',
        created: Value(DateTime.now()),
        calories: Value(100),
        proteinG: Value(20.0),
        carbohydrateG: Value(30.0),
        fatG: Value(10.0),
      ),
    );

    final entryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(originalFoodId),
        created: DateTime.now(),
        quantity: 500.0,
        unit: 'grams',
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: MaterialApp(home: QuickAddPage(id: entryId)),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('100.00'), findsOne);
    expect(find.text('20.00'), findsOne);
    expect(find.text('30.00'), findsOne);
    expect(find.text('10.00'), findsOne);

    await tester.enterText(find.widgetWithText(TextField, '20.00'), '25.0');
    await tester.enterText(find.widgetWithText(TextField, '30.00'), '35.0');
    await tester.enterText(find.widgetWithText(TextField, '10.00'), '15.0');

    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final updatedEntry = await (db.diaries.select()
          ..where((u) => u.id.equals(entryId)))
        .getSingle();

    final updatedFood = await (db.foods.select()
          ..where((u) => u.id.equals(updatedEntry.food!)))
        .getSingle();

    expect(updatedEntry.food, isNot(equals(originalFoodId)));
    expect(updatedFood.proteinG, equals(25.0));
    expect(updatedFood.carbohydrateG, equals(35.0));
    expect(updatedFood.fatG, equals(15.0));
    expect(updatedFood.name, equals('Quick-add'));

    await db.close();
  });

  testWidgets('QuickAdd edit updates daily macro goals calculation', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final originalFoodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Quick-add',
        created: Value(DateTime.now()),
        calories: Value(100),
        proteinG: Value(10.0),
        carbohydrateG: Value(20.0),
        fatG: Value(5.0),
      ),
    );

    final entryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(originalFoodId),
        created: DateTime.now(),
        quantity: 100.0,
        unit: 'grams',
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: MaterialApp(home: QuickAddPage(id: entryId)),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.widgetWithText(TextField, '10.00'), '30.0');
    await tester.enterText(find.widgetWithText(TextField, '20.00'), '40.0');
    await tester.enterText(find.widgetWithText(TextField, '5.00'), '15.0');

    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final newTotals = await (db.diaries.selectOnly().join([
      innerJoin(db.foods, db.diaries.food.equalsExp(db.foods.id)),
    ])
          ..addColumns([
            (db.foods.proteinG * db.diaries.quantity).sum(),
            (db.foods.carbohydrateG * db.diaries.quantity).sum(),
            (db.foods.fatG * db.diaries.quantity).sum(),
          ]))
        .getSingle();

    final newProtein =
        newTotals.read((db.foods.proteinG * db.diaries.quantity).sum()) ?? 0.0;
    final newCarbs =
        newTotals.read((db.foods.carbohydrateG * db.diaries.quantity).sum()) ??
            0.0;
    final newFat =
        newTotals.read((db.foods.fatG * db.diaries.quantity).sum()) ?? 0.0;

    expect(newProtein, equals(30.0));
    expect(newCarbs, equals(40.0));
    expect(newFat, equals(15.0));

    await db.close();
  });
}
