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
    await tester.pump();
    await tester.tap(find.text('Calories & body weight'));
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

  testWidgets('GraphPage combines calories and body weight',
      (WidgetTester tester) async {
    tester.view.devicePixelRatio = 3;
    tester.view.physicalSize = const Size(1080, 2340);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final now = DateTime.now();
    await (db.weights.insertAll(
      [
        WeightsCompanion.insert(
          created: now.subtract(const Duration(hours: 1)),
          unit: 'kg',
          amount: 60,
        ),
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
    ));
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
        child: const MaterialApp(
          home: GraphPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(LineChart), findsOne);
    final chart = tester.widget<LineChart>(find.byType(LineChart));
    expect(chart.data.lineBarsData, hasLength(2));
    expect(find.text('Body weight'), findsOne);
    expect(tester.takeException(), equals(null));

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

    await tester.tap(find.text('Calories & body weight'));
    await tester.pump();
    expect(find.text('Calories'), findsWidgets);
    expect(find.text('Body weight'), findsWidgets);

    await tester.tap(find.text('Calories').last);
    await tester.pumpAndSettle();
    expect(
      tester.widget<LineChart>(find.byType(LineChart)).data.lineBarsData,
      hasLength(1),
    );

    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pump();
    await tester.tap(find.text('Body weight'));
    await tester.pumpAndSettle();
    expect(
      tester.widget<LineChart>(find.byType(LineChart)).data.lineBarsData,
      hasLength(1),
    );

    await db.close();
  });

  testWidgets('GraphPage defaults combined graph to weekly',
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
