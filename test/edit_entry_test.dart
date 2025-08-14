import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/entry/edit_entry_page.dart';
import 'package:fit_book/entry/entry_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('EditEntry converts units', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final foodId = await (db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Test',
        calories: const Value(1),
        servingSize: const Value(1),
        proteinG: const Value(2),
        carbohydrateG: const Value(3),
        fatG: const Value(4),
      ),
    ));
    final entryId = await (db.entries.insertOne(
      EntriesCompanion.insert(
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
          ChangeNotifierProvider(create: (context) => EntryState()),
        ],
        child: MaterialApp(
          home: EditEntryPage(
            id: entryId,
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Edit entry'), findsOne);
    expect(find.text('Test'), findsOne);

    await tester.tap(find.text('Unit'), warnIfMissed: false);
    await tester.pump();
    await tester.tap(find.text('cups'));
    await tester.pump();
    var calories = findTextWidget(find.textContaining('Calories'));
    expect(calories.controller!.text, equals('250'));

    await tester.tap(find.text('Unit'), warnIfMissed: false);
    await tester.pump();
    await tester.tap(find.text('tablespoons'));
    await tester.pump();
    expect(calories.controller!.text, equals('15'));

    await tester.tap(find.text('Unit'), warnIfMissed: false);
    await tester.pump();
    await tester.tap(find.text('teaspoons'));
    await tester.pump();
    expect(calories.controller!.text, equals('5'));

    await db.close();
  });

  testWidgets('EditEntry updates', (WidgetTester tester) async {
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
    final entryId = await (db.entries.insertOne(
      EntriesCompanion.insert(
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
          ChangeNotifierProvider(create: (context) => EntryState()),
        ],
        child: MaterialApp(
          home: EditEntryPage(
            id: entryId,
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Edit entry'), findsOne);
    expect(find.text('Hamburger'), findsOne);

    await tester.enterText(
      find.bySemanticsLabel('Calories (per 1.0 serving)'),
      '601',
    );
    await tester.pump();
    expect(find.text('601'), findsOne);

    await tester.enterText(
      find.bySemanticsLabel('Protein (per 1.0 serving)'),
      '41',
    );
    await tester.pump();
    expect(find.text('41'), findsOne);

    await tester.tap(find.byTooltip('Save'));
    await tester.pump();
    expect(find.text('Add entry'), findsNothing);

    await db.close();
  });

  testWidgets('EditEntry preserves OpenFoodFacts serving size on save',
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
    final entryId = await (db.entries.insertOne(
      EntriesCompanion.insert(
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
          ChangeNotifierProvider(create: (context) => EntryState()),
        ],
        child: MaterialApp(
          home: EditEntryPage(
            id: entryId,
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Edit entry'), findsOne);
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
    final updatedEntry = await (db.entries.select()
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
