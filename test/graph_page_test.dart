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
  expect(
    tester
        .widget<DropdownButton<String>>(
          find.byType(DropdownButton<String>),
        )
        .value,
    metric,
  );
}

void main() async {
  testWidgets('GraphPage diaries', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await (db.diaries.insertAll(
      [
        DiariesCompanion.insert(
          food: Value(
            await (db.foods.insertOne(
              FoodsCompanion.insert(
                name: 'Test 3',
                calories: const Value(1),
                servingWeight1G: const Value(1),
              ),
            )),
          ),
          created: DateTime.now(),
          quantity: 1,
          unit: 'serving',
        ),
        DiariesCompanion.insert(
          food: Value(
            await (db.foods.insertOne(
              FoodsCompanion.insert(
                name: 'Test 2',
                calories: const Value(1),
                servingWeight1G: const Value(1),
              ),
            )),
          ),
          created: DateTime.now().subtract(const Duration(days: 1)),
          quantity: 1,
          unit: 'serving',
        ),
        DiariesCompanion.insert(
          food: Value(
            await (db.foods.insertOne(
              FoodsCompanion.insert(
                name: 'Test 1',
                calories: const Value(1),
                servingWeight1G: const Value(1),
              ),
            )),
          ),
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
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(
          home: GraphPage(),
        ),
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
    // Add a meal diary entry (food is NULL — previously excluded by innerJoin).
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

    // The chart should render with data rather than showing "No data yet".
    expect(find.text('No data yet'), findsNothing);
    expect(find.byType(LineChart), findsOne);

    await db.close();
  });

  testWidgets('GraphPage retains calories and body weight graphs',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);
    final now = DateTime.now();

    await db.weights.insertOne(
      WeightsCompanion.insert(created: now, unit: 'kg', amount: 75),
    );
    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Test food',
        calories: const Value(500),
      ),
    );
    await db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(foodId),
        created: now,
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

    await tester.tap(find.text('Calories'));
    await tester.pump();
    expect(find.text('Calories & body weight'), findsNothing);
    expect(find.text('Body weight'), findsOne);

    await tester.tap(find.text('Body weight'));
    await tester.pumpAndSettle();
    expect(
      tester.widget<LineChart>(find.byType(LineChart)).data.lineBarsData,
      hasLength(1),
    );

    await db.close();
  });

  testWidgets('GraphPage defaults calories graph to weekly',
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

    final periodPicker = tester.widget<SegmentedButton<Period>>(
      find.byType(SegmentedButton<Period>),
    );
    expect(periodPicker.selected, {Period.week});

    await db.close();
  });
}
