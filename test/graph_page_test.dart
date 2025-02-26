import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/entry/entry_state.dart';
import 'package:fit_book/graph_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('GraphPage entries', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await (db.entries.insertAll(
      [
        EntriesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test 3',
              calories: const Value(1),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now(),
          quantity: 1,
          unit: 'serving',
        ),
        EntriesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test 2',
              calories: const Value(1),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now().subtract(const Duration(days: 1)),
          quantity: 1,
          unit: 'serving',
        ),
        EntriesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test 1',
              calories: const Value(1),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now().subtract(const Duration(days: 2)),
          quantity: 1,
          unit: 'serving',
        ),
      ],
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntryState()),
        ],
        child: const MaterialApp(
          home: GraphPage(),
        ),
      ),
    );
    await tester.pump();
    await tester.tap(find.text('Calories'));
    await tester.pump();
    await tester.tap(find.text('Protein g'));
    await tester.pumpAndSettle();
    expect(find.byType(LineChart), findsOne);

    await tester.tap(find.text('Protein g'));
    await tester.pump();
    await tester.tap(find.text('Fat g'));
    await tester.pumpAndSettle();
    expect(find.byType(LineChart), findsOne);

    await tester.tap(find.text('Fat g'));
    await tester.pump();
    await tester.tap(find.text('Carbohydrate g'));
    await tester.pumpAndSettle();
    expect(find.byType(LineChart), findsOne);

    await db.close();
  });

  testWidgets('GraphPage body weight', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await (db.weights.insertAll(
      [
        WeightsCompanion.insert(
          created: DateTime.now(),
          unit: 'kg',
          amount: 60,
        ),
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 1)),
          unit: 'kg',
          amount: 70,
        ),
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 2)),
          unit: 'kg',
          amount: 80,
        ),
      ],
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntryState()),
        ],
        child: const MaterialApp(
          home: GraphPage(),
        ),
      ),
    );
    await tester.pump();
    await tester.tap(find.text('Calories'));
    await tester.pump();
    await tester.tap(find.text('Body weight'));
    await tester.pumpAndSettle();
    expect(find.byType(LineChart), findsOne);

    await db.close();
  });
}
