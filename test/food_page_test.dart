import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/food/food_page.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

void main() async {
  testWidgets('Food list values use locale grouping separators', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());
    await db.foods.deleteAll();
    await db.foods.insertOne(
      FoodsCompanion.insert(name: 'Haferflocken', calories: const Value(1200)),
    );
    final l10n = lookupAppLocalizations(const Locale('de'));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(
          home: const FoodPage(),
          locale: const Locale('de'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(l10n.kcalValue('1.200')), findsOneWidget);

    await db.close();
  });

  testWidgets('Food page handles German at 200% text scale', (
    WidgetTester tester,
  ) async {
    await mockTests();
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final settingsState = SettingsState(await db.settings.select().getSingle());
    await db.foods.deleteAll();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(
          home: const FoodPage(),
          locale: const Locale('de'),
          textScaler: const TextScaler.linear(2),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Noch keine Lebensmittel'), findsOneWidget);
    expect(tester.takeException(), equals(null));

    await db.close();
  });

  testWidgets('FoodsPage CRUD', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await db.foods.deleteAll();
    await (db.foods.insertAll(
      [
        FoodsCompanion.insert(name: 'Chicken', calories: const Value(300)),
        FoodsCompanion.insert(name: 'Beef', calories: const Value(200)),
        FoodsCompanion.insert(name: 'Lentils', calories: const Value(100)),
      ],
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const FoodPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Chicken'), findsOne);
    expect(find.text('Beef'), findsOne);
    expect(find.text('Lentils'), findsOne);

    await tester.tap(find.text('Chicken'));
    await tester.pumpAndSettle();
    expect(find.text('Edit food'), findsOne);
    await tester.enterText(find.text('Chicken'), 'Chicken 2.0');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Edit food'), findsNothing);

    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(find.text('Add food'), findsOne);
    await tester.enterText(find.bySemanticsLabel('Name'), 'Buns');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Add food'), findsNothing);

    await db.close();
  });

  testWidgets('Quick-add entries stay out of the food library and search', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());
    await db.foods.deleteAll();
    await db.foods.insertAll([
      FoodsCompanion.insert(
        name: 'Quick-add',
        created: Value(DateTime(2026, 10, 4, 9)),
        calories: const Value(500),
      ),
      FoodsCompanion.insert(
        name: 'Apple',
        created: Value(DateTime(2026, 10, 4, 10)),
        calories: const Value(52),
      ),
    ]);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const FoodPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Quick-add'), findsNothing);

    await tester.enterText(find.bySemanticsLabel('Search...'), 'Quick');
    await tester.pumpAndSettle();

    expect(find.text('Quick-add'), findsNothing);

    await db.close();
  });

  testWidgets('Food search ranks exact, prefix, then substring across meals', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());
    await db.foods.deleteAll();
    await db.meals.deleteAll();

    await db.foods.insertAll([
      FoodsCompanion.insert(
        name: 'Coffee',
        created: Value(DateTime(2026, 10, 4, 7)),
        calories: const Value(5),
      ),
      FoodsCompanion.insert(
        name: 'Coffee with milk',
        created: Value(DateTime(2026, 10, 4, 8)),
        calories: const Value(50),
      ),
      FoodsCompanion.insert(
        name: 'Brand X Coffee Latte',
        created: Value(DateTime(2026, 10, 4, 11)),
        calories: const Value(100),
      ),
    ]);
    await db.meals.insertAll([
      MealsCompanion.insert(
        name: 'Coffee Americano',
        created: DateTime(2026, 10, 4, 6),
      ),
      MealsCompanion.insert(
        name: 'Chocolate Mint Coffee',
        created: DateTime(2026, 10, 4, 12),
      ),
    ]);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const FoodPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.bySemanticsLabel('Search...'), 'coffee');
    await tester.pumpAndSettle();

    for (final name in [
      'Coffee',
      'Coffee with milk',
      'Coffee Americano',
      'Brand X Coffee Latte',
      'Chocolate Mint Coffee',
    ]) {
      expect(find.text(name), findsOneWidget);
    }

    double top(String name) => tester.getTopLeft(find.text(name)).dy;
    final prefixBottom = [
      top('Coffee with milk'),
      top('Coffee Americano'),
    ].reduce((a, b) => a > b ? a : b);
    final substringTop = [
      top('Brand X Coffee Latte'),
      top('Chocolate Mint Coffee'),
    ].reduce((a, b) => a < b ? a : b);

    expect(top('Coffee'), lessThan(top('Coffee with milk')));
    expect(top('Coffee'), lessThan(top('Coffee Americano')));
    expect(prefixBottom, lessThan(substringTop));

    await db.close();
  });
}
