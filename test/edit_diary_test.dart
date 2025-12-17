import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

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
        food: foodId,
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

    await tester.tap(find.byTooltip('Save'));
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
        food: foodId,
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
    expect(
      find.text('Pure Premium Orange Juice Calcium And Vitamin D No Pulp'),
      findsOne,
    );

    // 2. Change the quantity in the quantity text field
    const String newQuantity = '3.5';
    await tester.enterText(find.bySemanticsLabel('Quantity'), newQuantity);
    await tester.pump();

    // 3. Change the name to trigger the 'foodDirty' and new food insertion logic
    final Finder nameField = find.bySemanticsLabel('Name');
    await tester.enterText(
      nameField,
      'Pure Premium Orange Juice Calcium And Vitamin D No Pulp (Edited)',
    );
    await tester.pump();

    // 4. Tap the save button
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // 5. Query the database for the saved food and entry
    final updatedEntry = await (db.diaries.select()
          ..where((e) => e.id.equals(entryId)))
        .getSingle();
    final savedFood = await (db.foods.select()
          ..where((f) => f.id.equals(updatedEntry.food)))
        .getSingle();

    // 6. Assert that the saved food's servingSize and servingUnit are still the original values
    expect(savedFood.servingSize, equals(initialServingSize));
    expect(savedFood.servingUnit, equals(initialServingUnit));

    // 7. Assert that the entry quantity is the new quantity entered by the user
    expect(updatedEntry.quantity, equals(double.parse(newQuantity)));

    await db.close();
  });
}
