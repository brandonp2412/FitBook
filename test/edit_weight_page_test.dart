import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/weight/edit_weight_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('EditWeightPage new', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntriesState()),
        ],
        child: MaterialApp(
          home: EditWeightPage(
            weight: WeightsCompanion.insert(
              amount: 0,
              created: DateTime.now(),
              unit: 'kg',
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Add weight'), findsOne);
    expect(find.text('Weight (kg)'), findsOne);

    await tester.enterText(find.bySemanticsLabel('Weight (kg)'), '100');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Add weight'), findsNothing);

    final weight = await (db.weights.select()).getSingle();
    expect(weight.amount, equals(100));

    await db.close();
  });

  testWidgets('EditWeightPage edit', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);
    var weight = WeightsCompanion.insert(
      created: DateTime.now(),
      unit: 'kg',
      amount: 100,
    );
    final id = await (db.weights.insertOne(weight));
    weight = weight.copyWith(id: Value(id));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntriesState()),
        ],
        child: MaterialApp(
          home: EditWeightPage(
            weight: weight,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Edit weight'), findsOne);
    expect(find.text('Weight (kg)'), findsOne);

    await tester.enterText(find.bySemanticsLabel('Weight (kg)'), '200');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Edit weight'), findsNothing);

    final editedWeight = await (db.weights.select()).getSingle();
    expect(editedWeight.amount, equals(200));

    await db.close();
  });
}
