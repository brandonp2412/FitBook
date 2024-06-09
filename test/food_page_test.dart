import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/entries_state.dart';
import 'package:fit_book/food/food_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('FoodsPage CRUD', (WidgetTester tester) async {
    await mockTests();
    final prefs = await SharedPreferences.getInstance();
    final settingsState = SettingsState(prefs);

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
          ChangeNotifierProvider(create: (context) => EntriesState()),
        ],
        child: const MaterialApp(
          home: FoodPage(),
        ),
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

    await tester.tap(find.byTooltip('Add'));
    await tester.pumpAndSettle();
    expect(find.text('Add food'), findsOne);
    await tester.enterText(find.bySemanticsLabel('Name'), 'Buns');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Add food'), findsNothing);

    await db.close();
  });
}
