import 'package:drift/drift.dart' hide isNull;
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

Widget _wrap(Widget child, SettingsState settingsState) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => settingsState),
        ChangeNotifierProvider(create: (_) => DiaryState()),
      ],
      child: MaterialApp(home: child),
    );

void main() async {
  testWidgets('EditDiary updates', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final foodId = await (db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Hamburger',
        calories: const Value(240),
        proteinG: const Value(20),
        carbohydrateG: const Value(3),
        fatG: const Value(4),
      ),
    ));
    final entryId = await (db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(foodId),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: MaterialApp(
          home: EditDiaryPage(
            id: entryId,
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Edit diary entry'), findsOne);
    expect(find.text('Hamburger'), findsOne);

    await tester.enterText(
      find.bySemanticsLabel('Calories (per 100.0 g)'),
      '601',
    );
    await tester.pump();
    expect(find.text('601'), findsOne);

    await tester.enterText(
      find.bySemanticsLabel('Protein (per 100.0 g)'),
      '41',
    );
    await tester.pump();
    expect(find.text('41'), findsOne);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('Add diary entry'), findsNothing);

    await db.close();
  });

  testWidgets('EditDiary preserves OpenFoodFacts serving size on save',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    // 1. Create a Food in the database with specific servingSize and servingUnit
    const double initialServingSize = 250.0;
    const String initialServingUnit = 'ml';
    final foodId = await (db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Pure Premium Orange Juice Calcium And Vitamin D No Pulp',
        calories: const Value(110),
        servingSize: const Value(initialServingSize),
        servingUnit: const Value(initialServingUnit),
        proteinG: const Value(2),
        carbohydrateG: const Value(3),
        fatG: const Value(4),
      ),
    ));
    final entryId = await (db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(foodId),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: MaterialApp(
          home: EditDiaryPage(
            id: entryId,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Edit diary entry'), findsOne);
    expect(
      find.text('Pure Premium Orange Juice Calcium And Vitamin D No Pulp'),
      findsOne,
    );

    // 2. Change the quantity in the quantity text field
    const String newQuantity = '3.5';
    await tester.enterText(find.bySemanticsLabel('Quantity'), newQuantity);
    await tester.pumpAndSettle();

    // 3. Change the name to trigger the 'foodDirty' and new food insertion logic
    final Finder nameField = find.bySemanticsLabel('Name');
    await tester.enterText(
      nameField,
      'Pure Premium Orange Juice Calcium And Vitamin D No Pulp (Edited)',
    );
    await tester.pump();

    // 4. Tap the save button
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // 5. Query the database for the saved food and entry
    final updatedEntry = await (db.diaries.select()
          ..where((e) => e.id.equals(entryId)))
        .getSingle();
    final savedFood = await (db.foods.select()
          ..where((f) => f.id.equals(updatedEntry.food!)))
        .getSingle();

    // 6. Assert that the saved food's servingSize and servingUnit are still the original values
    expect(savedFood.servingSize, equals(initialServingSize));
    expect(savedFood.servingUnit, equals(initialServingUnit));

    // 7. Assert that the entry quantity is the new quantity entered by the user
    expect(updatedEntry.quantity, equals(double.parse(newQuantity)));

    await db.close();
  });

  testWidgets(
      'Selecting a meal in edit diary creates diary entry referencing that meal',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final mealId = await db.meals.insertOne(
      MealsCompanion.insert(name: 'Chicken Bowl', created: DateTime.now()),
    );

    await tester.pumpWidget(_wrap(const EditDiaryPage(), settingsState));
    await tester.pumpAndSettle();
    expect(find.text('Add diary entry'), findsOne);

    // Search for the meal by typing in the name field
    await tester.enterText(find.byKey(const Key('name_field')), 'Chicken');
    await tester.pumpAndSettle();

    // Tap the 'Meal' subtitle result (the meal tile)
    await tester.tap(
      find
          .ancestor(
              of: find.text('Chicken Bowl'), matching: find.byType(ListTile),)
          .first,
    );
    await tester.pumpAndSettle();

    expect(find.text('Chicken Bowl'), findsOne);

    // Save
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    final entries = await db.diaries.select().get();
    expect(entries.length, 1);
    expect(entries.first.meal, mealId);
    expect(entries.first.food, isNull);

    await db.close();
  });

  testWidgets('Editing a meal diary entry persists the update to the database',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final meal1Id = await db.meals.insertOne(
      MealsCompanion.insert(name: 'Breakfast Bowl', created: DateTime.now()),
    );
    final meal2Id = await db.meals.insertOne(
      MealsCompanion.insert(name: 'Lunch Wrap', created: DateTime.now()),
    );
    final entryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        meal: Value(meal1Id),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
    );

    await tester.pumpWidget(_wrap(EditDiaryPage(id: entryId), settingsState));
    await tester.pumpAndSettle();

    expect(find.text('Edit diary entry'), findsOne);
    expect(find.text('Breakfast Bowl'), findsOne);

    // Clear and type to search for the second meal
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('name_field')), 'Lunch');
    await tester.pumpAndSettle();

    await tester.tap(
      find
          .ancestor(
              of: find.text('Lunch Wrap'), matching: find.byType(ListTile),)
          .first,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    final updated = await (db.diaries.select()
          ..where((t) => t.id.equals(entryId)))
        .getSingle();
    expect(updated.meal, meal2Id);
    expect(updated.food, isNull);

    await db.close();
  });

  testWidgets(
      'Editing a food diary entry persists quantity change to the database',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Oatmeal',
        calories: const Value(68),
        servingSize: const Value(100),
      ),
    );
    final entryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(foodId),
        created: DateTime.now(),
        quantity: 100,
        unit: 'grams',
      ),
    );

    await tester.pumpWidget(_wrap(EditDiaryPage(id: entryId), settingsState));
    await tester.pumpAndSettle();

    expect(find.text('Edit diary entry'), findsOne);
    expect(find.text('Oatmeal'), findsOne);

    await tester.enterText(find.bySemanticsLabel('Quantity'), '250');
    await tester.pump();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    final updated = await (db.diaries.select()
          ..where((t) => t.id.equals(entryId)))
        .getSingle();
    expect(updated.quantity, 250.0);
    expect(updated.food, foodId);

    await db.close();
  });
}
