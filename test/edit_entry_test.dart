import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/edit_entry_page.dart';
import 'package:fit_book/diary/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('EditEntry converts units', (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState();
    await settingsState.init();

    final foodId = await (db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Test',
        calories: const Value(1),
        servingWeight1G: const Value(1),
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
          ChangeNotifierProvider(create: (context) => EntriesState()),
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
    var calories = findTextWidget(find.text('Calories'));
    expect(calories.controller!.text, equals('250.00'));

    await tester.tap(find.text('Unit'), warnIfMissed: false);
    await tester.pump();
    await tester.tap(find.text('tablespoons'));
    await tester.pump();
    expect(calories.controller!.text, equals('15.00'));

    await tester.tap(find.text('Unit'), warnIfMissed: false);
    await tester.pump();
    await tester.tap(find.text('teaspoons'));
    await tester.pump();
    expect(calories.controller!.text, equals('5.00'));

    await db.close();
  });

  testWidgets('EditEntry updates', (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState();
    await settingsState.init();

    final foodId = await (db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Hamburger',
        calories: const Value(240),
        proteinG: const Value(20),
      ),
    ));
    final entryId = await (db.entries.insertOne(
      EntriesCompanion.insert(
        food: foodId,
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
        kCalories: const Value(600),
        proteinG: const Value(40),
      ),
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntriesState()),
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

    await tester.enterText(find.bySemanticsLabel('Calories'), '601');
    await tester.pump();
    expect(find.text('601'), findsOne);

    await tester.enterText(find.bySemanticsLabel('Protein'), '41');
    await tester.pump();
    expect(find.text('41'), findsOne);

    await tester.tap(find.byTooltip('Save'));
    await tester.pump();
    expect(find.text('Add entry'), findsNothing);

    await db.close();
  });
}
