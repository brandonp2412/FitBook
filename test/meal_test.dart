import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/food/edit_meal_page.dart';
import 'package:fit_book/food/food_page.dart';
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

/// Pumps enough frames for streams and animations to settle.
Future<void> settle(WidgetTester tester) async {
  await tester.pumpAndSettle();
  await tester.pump(const Duration(milliseconds: 100));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Create meal appears in food list with meal icon',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await db.foods.deleteAll();
    await db.foods.insertAll([
      FoodsCompanion.insert(name: 'Chicken', calories: const Value(200)),
      FoodsCompanion.insert(name: 'Rice', calories: const Value(130)),
    ]);

    await tester.pumpWidget(_wrap(const FoodPage(), settingsState));
    await settle(tester);

    // Tap the "Add meal" small FAB (tooltip: 'Add meal')
    await tester.tap(find.byTooltip('Add meal'));
    await settle(tester);

    expect(find.text('Create meal'), findsOne);

    // Enter meal name
    await tester.enterText(find.bySemanticsLabel('Name'), 'Chicken and Rice');
    await tester.pump();

    // Add Chicken food to meal
    await tester.tap(find.byTooltip('Add food'));
    await settle(tester);

    expect(find.text('Search foods...'), findsOne);
    await tester.tap(find.text('Chicken'));
    await settle(tester);

    // Chicken should now appear in the meal food list
    expect(find.text('Chicken'), findsOne);

    // Add Rice food to meal
    await tester.tap(find.byTooltip('Add food'));
    await settle(tester);

    await tester.tap(find.text('Rice'));
    await settle(tester);

    expect(find.text('Rice'), findsOne);

    // Save the meal
    await tester.tap(find.byTooltip('Save'));
    await settle(tester);

    // Back on food page — meal should appear with kcal total
    expect(find.text('Chicken and Rice'), findsOne);
    expect(find.text('330 kcal'), findsOne);

    // Verify the meal icon is shown
    expect(find.byIcon(Icons.restaurant), findsWidgets);

    // Verify DB state
    final meals = await db.meals.select().get();
    expect(meals.length, 1);
    expect(meals.first.name, 'Chicken and Rice');

    final mealFoods = await db.mealFoods.select().get();
    expect(mealFoods.length, 2);

    await db.close();
  });

  testWidgets('Edit meal updates name and foods', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await db.foods.deleteAll();
    final chickenId = await db.foods.insertOne(
      FoodsCompanion.insert(name: 'Chicken', calories: const Value(200)),
    );
    final riceId = await db.foods.insertOne(
      FoodsCompanion.insert(name: 'Rice', calories: const Value(130)),
    );
    final mealId = await db.meals.insertOne(
      MealsCompanion.insert(name: 'Old Meal Name', created: DateTime.now()),
    );
    await db.mealFoods.insertOne(
      MealFoodsCompanion.insert(
        meal: mealId,
        food: chickenId,
        quantity: 1,
        unit: 'serving',
      ),
    );

    await tester.pumpWidget(
      _wrap(EditMealPage(id: mealId), settingsState),
    );
    // Wait for async _load() to complete
    await settle(tester);

    expect(find.text('Edit meal'), findsOne);
    expect(find.text('Chicken'), findsOne);
    expect(find.text('Old Meal Name'), findsOne);

    // Update the name — clear then type
    await tester.enterText(find.bySemanticsLabel('Name'), 'New Meal Name');
    await tester.pump();

    // Add Rice to the meal via the food picker
    await tester.tap(find.byTooltip('Add food'));
    await settle(tester);

    expect(find.text('Search foods...'), findsOne);
    await tester.tap(find.text('Rice'));
    await settle(tester);

    // Both foods should be listed
    expect(find.text('Chicken'), findsOne);
    expect(find.text('Rice'), findsOne);

    // Save
    await tester.tap(find.byTooltip('Save'));
    await settle(tester);

    // Verify in DB
    final updatedMeal = await (db.meals.select()
          ..where((t) => t.id.equals(mealId)))
        .getSingle();
    expect(updatedMeal.name, 'New Meal Name');

    final mealFoods = await db.mealFoods.select().get();
    expect(mealFoods.length, 2);
    expect(mealFoods.map((f) => f.food).toSet(), {chickenId, riceId});

    await db.close();
  });

  testWidgets('Meals and foods both show in food page',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await db.foods.deleteAll();
    await db.meals.insertOne(
      MealsCompanion.insert(name: 'Breakfast Bowl', created: DateTime.now()),
    );
    await db.meals.insertOne(
      MealsCompanion.insert(name: 'Lunch Wrap', created: DateTime.now()),
    );
    await db.foods.insertOne(
      FoodsCompanion.insert(name: 'Apple', calories: const Value(52)),
    );

    await tester.pumpWidget(_wrap(const FoodPage(), settingsState));
    await settle(tester);

    // Both meals and the food should be visible
    expect(find.text('Breakfast Bowl'), findsOne);
    expect(find.text('Lunch Wrap'), findsOne);
    expect(find.text('Apple'), findsOne);

    // Meals show with 'Meal' subtitle and food shows with kcal info
    expect(find.text('Meal'), findsNWidgets(2));
    expect(find.text('52 kcal'), findsOne);

    await db.close();
  });

  testWidgets('Meal search filters meals but not foods',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await db.meals.insertOne(
      MealsCompanion.insert(name: 'Breakfast Bowl', created: DateTime.now()),
    );
    await db.meals.insertOne(
      MealsCompanion.insert(name: 'Lunch Wrap', created: DateTime.now()),
    );
    await db.foods.insertOne(
      FoodsCompanion.insert(name: 'Banana', calories: const Value(89)),
    );

    await tester.pumpWidget(_wrap(const FoodPage(), settingsState));
    await settle(tester);

    // Search for 'Breakfast' — only that meal should appear
    await tester.enterText(find.bySemanticsLabel('Search...'), 'Breakfast');
    await settle(tester);

    expect(find.text('Breakfast Bowl'), findsOne);
    expect(find.text('Lunch Wrap'), findsNothing);
    expect(find.text('Banana'), findsNothing);

    await db.close();
  });

  testWidgets('Delete meal via long-press selection',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await db.meals.insertOne(
      MealsCompanion.insert(name: 'Dinner Salad', created: DateTime.now()),
    );

    await tester.pumpWidget(_wrap(const FoodPage(), settingsState));
    await settle(tester);

    expect(find.text('Dinner Salad'), findsOne);

    // Long-press to select the meal
    await tester.longPress(find.text('Dinner Salad'));
    await tester.pumpAndSettle();

    // Tap delete in search bar
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Confirm delete dialog
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    expect(find.text('Dinner Salad'), findsNothing);

    final meals = await db.meals.select().get();
    expect(meals.isEmpty, true);

    await db.close();
  });

  testWidgets(
      'EditDiaryPage shows nutrient summary when a meal entry is opened',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final chickenId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Chicken',
        calories: const Value(200),
        proteinG: const Value(40),
        carbohydrateG: const Value(0),
        fatG: const Value(5),
        fiberG: const Value(0),
        servingSize: const Value(100),
        servingUnit: const Value('grams'),
      ),
    );
    final riceId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Rice',
        calories: const Value(130),
        proteinG: const Value(3),
        carbohydrateG: const Value(28),
        fatG: const Value(0),
        fiberG: const Value(1),
        servingSize: const Value(100),
        servingUnit: const Value('grams'),
      ),
    );
    final mealId = await db.meals.insertOne(
      MealsCompanion.insert(name: 'Chicken and Rice', created: DateTime.now()),
    );
    // 1 serving (100 g) each
    await db.mealFoods.insertAll([
      MealFoodsCompanion.insert(
        meal: mealId,
        food: chickenId,
        quantity: 1,
        unit: 'serving',
      ),
      MealFoodsCompanion.insert(
        meal: mealId,
        food: riceId,
        quantity: 1,
        unit: 'serving',
      ),
    ]);
    final entryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        meal: Value(mealId),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
    );

    await tester.pumpWidget(_wrap(EditDiaryPage(id: entryId), settingsState));
    await tester.pumpAndSettle();

    expect(find.text('Edit diary entry'), findsOne);
    expect(find.text('Chicken and Rice'), findsOne);

    // Total for 1 serving: 200+130=330 kcal, 40+3=43 g protein
    expect(find.textContaining('330'), findsWidgets);
    expect(find.textContaining('43'), findsWidgets);

    await db.close();
  });

  testWidgets('Remove food from meal', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(name: 'Eggs', calories: const Value(155)),
    );
    final mealId = await db.meals.insertOne(
      MealsCompanion.insert(name: 'Egg Breakfast', created: DateTime.now()),
    );
    await db.mealFoods.insertOne(
      MealFoodsCompanion.insert(
        meal: mealId,
        food: foodId,
        quantity: 2,
        unit: 'serving',
      ),
    );

    await tester.pumpWidget(
      _wrap(EditMealPage(id: mealId), settingsState),
    );
    await settle(tester);

    expect(find.text('Eggs'), findsOne);

    // Remove Eggs from the meal
    await tester.tap(find.byTooltip('Remove'));
    await tester.pumpAndSettle();

    expect(find.text('Eggs'), findsNothing);
    expect(find.text('No foods yet. Tap + to add foods.'), findsOne);

    // Save with no foods
    await tester.tap(find.byTooltip('Save'));
    await settle(tester);

    final mealFoods = await db.mealFoods.select().get();
    expect(mealFoods.isEmpty, true);

    await db.close();
  });
}
