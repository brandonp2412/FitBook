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

Finder _fieldStarting(String label) => find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration?.labelText?.startsWith(label) == true,
    );

void main() async {
  testWidgets('EditDiary persists nutrient updates',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Hamburger',
        calories: const Value(240),
        proteinG: const Value(20),
        carbohydrateG: const Value(3),
        fatG: const Value(4),
      ),
    );
    final entryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(foodId),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
    );

    await tester.pumpWidget(
      _wrap(EditDiaryPage(id: entryId), settingsState),
    );
    await tester.pumpAndSettle();

    await tester.enterText(_fieldStarting('Calories'), '601');
    await tester.enterText(_fieldStarting('Protein'), '41');
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final savedFood = await (db.foods.select()
          ..where((food) => food.id.equals(foodId)))
        .getSingle();
    expect(savedFood.calories, 601);
    expect(savedFood.proteinG, 41);

    await db.close();
  });

  testWidgets('EditDiary preserves OpenFoodFacts serving size on save',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    const initialServingSize = 250.0;
    const initialServingUnit = 'ml';
    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Pure Premium Orange Juice Calcium And Vitamin D No Pulp',
        calories: const Value(110),
        servingSize: const Value(initialServingSize),
        servingUnit: const Value(initialServingUnit),
        proteinG: const Value(2),
        carbohydrateG: const Value(3),
        fatG: const Value(4),
      ),
    );
    final entryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(foodId),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
    );

    await tester.pumpWidget(
      _wrap(EditDiaryPage(id: entryId), settingsState),
    );
    await tester.pumpAndSettle();

    const newQuantity = '3.5';
    await tester.enterText(find.bySemanticsLabel('Quantity'), newQuantity);
    await tester.enterText(
      find.byKey(const Key('name_field')),
      'Pure Premium Orange Juice Calcium And Vitamin D No Pulp (Edited)',
    );
    await tester.pump();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final updatedEntry = await (db.diaries.select()
          ..where((entry) => entry.id.equals(entryId)))
        .getSingle();
    final savedFood = await (db.foods.select()
          ..where((food) => food.id.equals(updatedEntry.food!)))
        .getSingle();

    expect(savedFood.servingSize, initialServingSize);
    expect(savedFood.servingUnit, initialServingUnit);
    expect(updatedEntry.quantity, double.parse(newQuantity));

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

    await tester.enterText(find.byKey(const Key('name_field')), 'Chicken');
    await tester.pumpAndSettle();
    await tester.tap(
      find
          .ancestor(
            of: find.text('Chicken Bowl'),
            matching: find.byType(ListTile),
          )
          .first,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final entries = await db.diaries.select().get();
    expect(entries, hasLength(1));
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

    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('name_field')), 'Lunch');
    await tester.pumpAndSettle();
    await tester.tap(
      find
          .ancestor(
            of: find.text('Lunch Wrap'),
            matching: find.byType(ListTile),
          )
          .first,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final updated = await (db.diaries.select()
          ..where((entry) => entry.id.equals(entryId)))
        .getSingle();
    expect(updated.meal, meal2Id);
    expect(updated.food, isNull);

    await db.close();
  });

  testWidgets('Editing a meal diary entry persists its image change',
      (WidgetTester tester) async {
    await mockTests();
    await db.settings.update().write(
          const SettingsCompanion(showImages: Value(true)),
        );
    final settings = await db.settings.select().getSingle();
    final settingsState = SettingsState(settings);

    final mealId = await db.meals.insertOne(
      MealsCompanion.insert(
        name: 'Breakfast Bowl',
        created: DateTime.now(),
        imageFile: const Value('/tmp/breakfast.jpg'),
      ),
    );
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

    final imageTarget = find.ancestor(
      of: find.byType(Image),
      matching: find.byType(InkWell),
    );
    expect(imageTarget, findsOne);
    await tester.tap(imageTarget);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete image'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final updatedMeal = await (db.meals.select()
          ..where((meal) => meal.id.equals(mealId)))
        .getSingle();
    expect(updatedMeal.imageFile, isNull);

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

    await tester.enterText(find.bySemanticsLabel('Quantity'), '250');
    await tester.pump();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final updated = await (db.diaries.select()
          ..where((entry) => entry.id.equals(entryId)))
        .getSingle();
    expect(updated.quantity, 250.0);
    expect(updated.food, foodId);

    await db.close();
  });

  testWidgets('EditDiary defaults a serving quantity to one',
      (WidgetTester tester) async {
    await mockTests();
    await db.settings.update().write(
          const SettingsCompanion(entryUnit: Value('serving')),
        );
    final settingsState = SettingsState(await db.settings.select().getSingle());
    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(name: 'Soup', calories: const Value(120)),
    );
    final food = await (db.foods.select()..where((f) => f.id.equals(foodId)))
        .getSingle();

    await tester.pumpWidget(
      _wrap(EditDiaryPage(initialFood: food), settingsState),
    );
    await tester.pumpAndSettle();

    final quantity = tester.widget<EditableText>(
      find.descendant(
        of: find.bySemanticsLabel('Quantity'),
        matching: find.byType(EditableText),
      ),
    );
    expect(quantity.controller.text, '1');

    await db.close();
  });

  testWidgets('Repeat entry logs the same meal again',
      (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());
    final mealId = await db.meals.insertOne(
      MealsCompanion.insert(name: 'Lunch', created: DateTime.now()),
    );
    final entryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        meal: Value(mealId),
        created: DateTime(2020),
        quantity: 2,
        unit: 'serving',
      ),
    );

    await tester.pumpWidget(_wrap(EditDiaryPage(id: entryId), settingsState));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Repeat entry'));
    await tester.pumpAndSettle();

    final entries = await db.diaries.select().get();
    expect(entries, hasLength(2));
    final repeated = entries.singleWhere((entry) => entry.id != entryId);
    expect(repeated.meal, mealId);
    expect(repeated.quantity, 2);
    expect(repeated.unit, 'serving');

    await db.close();
  });
}
