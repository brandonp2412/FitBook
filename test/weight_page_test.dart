import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/weight/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('WeightPage deletes selected weights',
      (WidgetTester tester) async {
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
        child: const MaterialApp(home: WeightPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.longPress(find.textContaining('60'));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.check_circle), findsNothing);
    expect(find.byIcon(Icons.circle_outlined), findsNothing);
    await tester.tap(find.textContaining('70'));
    await tester.tap(find.textContaining('80'));
    await tester.tap(find.byTooltip('Delete'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextButton, 'Delete'));
    await tester.pumpAndSettle();

    expect(await db.weights.select().get(), isEmpty);

    await db.close();
  });

  testWidgets('Compact weight rows keep their original search bar gap',
      (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());

    await db.weights.insertOne(
      WeightsCompanion.insert(
        created: DateTime.now(),
        unit: 'kg',
        amount: 75,
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(home: WeightPage()),
      ),
    );
    await tester.pumpAndSettle();

    final list = tester.widget<ListView>(find.byType(ListView));
    expect((list.padding! as EdgeInsets).top, 80);

    await db.close();
  });

  testWidgets('Weight stat cards use the standard search bar gap',
      (WidgetTester tester) async {
    await mockTests();
    await db.settings.update().write(
          const SettingsCompanion(compactWeights: Value(false)),
        );
    final settingsState = SettingsState(await db.settings.select().getSingle());

    await db.weights.insertOne(
      WeightsCompanion.insert(
        created: DateTime.now(),
        unit: 'kg',
        amount: 75,
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(home: WeightPage()),
      ),
    );
    await tester.pumpAndSettle();

    final grid = tester.widget<GridView>(find.byType(GridView));
    expect((grid.padding! as EdgeInsets).top, 88);

    await db.close();
  });
}
