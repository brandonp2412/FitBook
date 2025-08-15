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
  testWidgets('QuickAdd edit preserves macro-nutrients',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    // First, create a Quick-add entry with specific macro-nutrients
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
        food: originalFoodId,
        created: DateTime.now(),
        quantity: 500.0,
        unit: 'grams',
      ),
    );

    // Now edit the entry
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: MaterialApp(
          home: QuickAddPage(id: entryId),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Verify the form is populated with existing values
    expect(find.text('500.00'), findsOne); // calories
    expect(find.text('20.0'), findsOne); // protein
    expect(find.text('30.0'), findsOne); // carbs
    expect(find.text('10.0'), findsOne); // fat

    // Edit the macro-nutrients
    await tester.enterText(
      find.widgetWithText(TextField, '20.0'),
      '25.0',
    ); // protein
    await tester.enterText(
      find.widgetWithText(TextField, '30.0'),
      '35.0',
    ); // carbs
    await tester.enterText(
      find.widgetWithText(TextField, '10.0'),
      '15.0',
    ); // fat

    // Save the changes
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    // Verify the entry was updated
    final updatedEntry = await (db.diaries.select()
          ..where((u) => u.id.equals(entryId)))
        .getSingle();

    final updatedFood = await (db.foods.select()
          ..where((u) => u.id.equals(updatedEntry.food)))
        .getSingle();

    // Verify the entry now points to a new food record with updated macro-nutrients
    expect(
      updatedEntry.food,
      isNot(equals(originalFoodId)),
    ); // Should point to new food
    expect(updatedFood.proteinG, equals(25.0));
    expect(updatedFood.carbohydrateG, equals(35.0));
    expect(updatedFood.fatG, equals(15.0));
    expect(updatedFood.name, equals('Quick-add'));

    await db.close();
  });

  testWidgets('QuickAdd edit updates daily macro goals calculation',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    // Create a Quick-add entry
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
        food: originalFoodId,
        created: DateTime.now(),
        quantity: 100.0, // 1 serving
        unit: 'grams',
      ),
    );

    // Calculate initial totals
    final initialTotals = await (db.diaries.selectOnly().join([
      innerJoin(db.foods, db.diaries.food.equalsExp(db.foods.id)),
    ])
          ..addColumns([
            (db.foods.proteinG * db.diaries.quantity / Variable(100.0)).sum(),
            (db.foods.carbohydrateG * db.diaries.quantity / Variable(100.0))
                .sum(),
            (db.foods.fatG * db.diaries.quantity / Variable(100.0)).sum(),
          ]))
        .getSingle();

    final initialProtein = initialTotals.read(
          (db.foods.proteinG * db.diaries.quantity / Variable(100.0)).sum(),
        ) ??
        0.0;
    final initialCarbs = initialTotals.read(
          (db.foods.carbohydrateG * db.diaries.quantity / Variable(100.0))
              .sum(),
        ) ??
        0.0;
    final initialFat = initialTotals.read(
          (db.foods.fatG * db.diaries.quantity / Variable(100.0)).sum(),
        ) ??
        0.0;

    // Edit the entry with new macro values
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: MaterialApp(
          home: QuickAddPage(id: entryId),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Update macro-nutrients
    await tester.enterText(
      find.widgetWithText(TextField, '10.0'),
      '30.0',
    ); // protein: 10 -> 30
    await tester.enterText(
      find.widgetWithText(TextField, '20.0'),
      '40.0',
    ); // carbs: 20 -> 40
    await tester.enterText(
      find.widgetWithText(TextField, '5.0'),
      '15.0',
    ); // fat: 5 -> 15

    // Save the changes
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    // Calculate new totals
    final newTotals = await (db.diaries.selectOnly().join([
      innerJoin(db.foods, db.diaries.food.equalsExp(db.foods.id)),
    ])
          ..addColumns([
            (db.foods.proteinG * db.diaries.quantity / Variable(100.0)).sum(),
            (db.foods.carbohydrateG * db.diaries.quantity / Variable(100.0))
                .sum(),
            (db.foods.fatG * db.diaries.quantity / Variable(100.0)).sum(),
          ]))
        .getSingle();

    final newProtein = newTotals.read(
          (db.foods.proteinG * db.diaries.quantity / Variable(100.0)).sum(),
        ) ??
        0.0;
    final newCarbs = newTotals.read(
          (db.foods.carbohydrateG * db.diaries.quantity / Variable(100.0))
              .sum(),
        ) ??
        0.0;
    final newFat = newTotals.read(
          (db.foods.fatG * db.diaries.quantity / Variable(100.0)).sum(),
        ) ??
        0.0;

    // Verify the totals reflect the updated macro-nutrients
    expect(newProtein, equals(30.0)); // Should be 30g protein for 100g serving
    expect(newCarbs, equals(40.0)); // Should be 40g carbs for 100g serving
    expect(newFat, equals(15.0)); // Should be 15g fat for 100g serving

    // Verify the changes are reflected (not the old values)
    expect(newProtein, isNot(equals(initialProtein)));
    expect(newCarbs, isNot(equals(initialCarbs)));
    expect(newFat, isNot(equals(initialFat)));

    await db.close();
  });
}
