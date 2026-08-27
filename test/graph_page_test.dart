import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/graph_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

Future<void> _selectMetric(WidgetTester tester, String metric) async {
  final picker = tester.widget<DropdownButton<String>>(
    find.byType(DropdownButton<String>),
  );
  expect(picker.items!.map((item) => item.value), contains(metric));
  picker.onChanged!(metric);
  await tester.pumpAndSettle();

  final updatedPicker = tester.widget<DropdownButton<String>>(
    find.byType(DropdownButton<String>),
  );
  expect(updatedPicker.value, metric);
}

void main() async {
  testWidgets('GraphPage renders diary metrics', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);
    final now = DateTime.now();

    for (var i = 0; i < 3; i++) {
      final foodId = await db.foods.insertOne(
        FoodsCompanion.insert(
          name: 'Test ${i + 1}',
          calories: Value(100 + i.toDouble()),
          proteinG: Value(20 + i.toDouble()),
          fatG: Value(10 + i.toDouble()),
          carbohydrateG: Value(30 + i.toDouble()),
          servingWeight1G: const Value(1),
        ),
      );
      await db.diaries.insertOne(
        DiariesCompanion.insert(
          food: Value(foodId),
          created: now.subtract(Duration(days: i)),
          quantity: 1,
          unit: 'serving',
        ),
      );
    }

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(home: GraphPage()),
      ),
    );
    await tester.pumpAndSettle();

    for (final metric in [
      db.foods.proteinG.name,
      db.foods.fatG.name,
      db.foods.carbohydrateG.name,
    ]) {
      await _selectMetric(tester, metric);
      expect(find.byType(LineChart), findsOne);
    }

    await db.close();
  });

  testWidgets('GraphPage includes meal diary entries in calorie graph',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Rice',
        calories: const Value(130),
        servingSize: const Value(100),
        servingUnit: const Value('grams'),
      ),
    );
    final mealId = await db.meals.insertOne(
      MealsCompanion.insert(name: 'Rice Bowl', created: DateTime.now()),
    );
    await db.mealFoods.insertOne(
      MealFoodsCompanion.insert(
        meal: mealId,
        food: foodId,
        quantity: 1,
        unit: 'serving',
      ),
    );
    await db.diaries.insertOne(
      DiariesCompanion.insert(
        meal: Value(mealId),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(home: GraphPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No data yet'), findsNothing);
    expect(find.byType(LineChart), findsOne);

    await db.close();
  });

  testWidgets('GraphPage renders body weight', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);
    final now = DateTime.now();

    await db.weights.insertAll(
      [
        WeightsCompanion.insert(created: now, unit: 'kg', amount: 60),
        WeightsCompanion.insert(
          created: now.subtract(const Duration(days: 1)),
          unit: 'kg',
          amount: 70,
        ),
        WeightsCompanion.insert(
          created: now.subtract(const Duration(days: 2)),
          unit: 'kg',
          amount: 80,
        ),
      ],
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(home: GraphPage()),
      ),
    );
    await tester.pumpAndSettle();

    await _selectMetric(tester, 'body-weight');
    expect(find.byType(LineChart), findsOne);

    await db.close();
  });

  testWidgets('GraphPage defaults to calories grouped weekly',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(home: GraphPage()),
      ),
    );
    await tester.pump();

    final state = tester.state<GraphPageState>(find.byType(GraphPage));
    expect(state.metric, db.foods.calories.name);
    expect(state.groupBy, Period.week);

    await db.close();
  });
}
