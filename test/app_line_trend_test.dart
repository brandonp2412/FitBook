import 'package:drift/drift.dart';
import 'package:fit_book/app_line.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  group('AppLine Trend Tests', () {
    testWidgets('Trend radio button appears and functions',
        (WidgetTester tester) async {
      await mockTests();
      final settings = await (db.settings.select()).getSingle();
      final settingsState = SettingsState(settings);

      await (db.weights.insertAll([
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 6)),
          unit: 'kg',
          amount: 80,
        ),
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 4)),
          unit: 'kg',
          amount: 79,
        ),
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 2)),
          unit: 'kg',
          amount: 78,
        ),
        WeightsCompanion.insert(
          created: DateTime.now(),
          unit: 'kg',
          amount: 77,
        ),
      ]));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => DiaryState()),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: AppLine(
                metric: 'body-weight',
                groupBy: Period.day,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Average'), findsOneWidget);
      expect(find.text('Trend'), findsOneWidget);

      await tester.tap(find.text('Trend'));
      await tester.pumpAndSettle();

      expect(find.textContaining('kg/week'), findsOneWidget);

      await db.close();
    });

    testWidgets('Trend calculation shows positive slope for weight gain',
        (WidgetTester tester) async {
      await mockTests();
      final settings = await (db.settings.select()).getSingle();
      final settingsState = SettingsState(settings);

      await (db.weights.insertAll([
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 14)),
          unit: 'kg',
          amount: 75,
        ),
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 7)),
          unit: 'kg',
          amount: 76,
        ),
        WeightsCompanion.insert(
          created: DateTime.now(),
          unit: 'kg',
          amount: 77,
        ),
      ]));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => DiaryState()),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: AppLine(
                metric: 'body-weight',
                groupBy: Period.day,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Trend'));
      await tester.pumpAndSettle();

      final trendText = tester.widget<Text>(
        find
            .descendant(
              of: find.ancestor(
                of: find.text('Trend'),
                matching: find.byType(ListTile),
              ),
              matching: find.byType(Text),
            )
            .last,
      );

      expect(trendText.data, contains('+'));
      expect(trendText.data, contains('kg/week'));

      await db.close();
    });

    testWidgets('Trend calculation shows negative slope for weight loss',
        (WidgetTester tester) async {
      await mockTests();
      final settings = await (db.settings.select()).getSingle();
      final settingsState = SettingsState(settings);

      await (db.weights.insertAll([
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 14)),
          unit: 'kg',
          amount: 80,
        ),
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 7)),
          unit: 'kg',
          amount: 79,
        ),
        WeightsCompanion.insert(
          created: DateTime.now(),
          unit: 'kg',
          amount: 78,
        ),
      ]));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => DiaryState()),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: AppLine(
                metric: 'body-weight',
                groupBy: Period.day,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Trend'));
      await tester.pumpAndSettle();

      final trendText = tester.widget<Text>(
        find
            .descendant(
              of: find.ancestor(
                of: find.text('Trend'),
                matching: find.byType(ListTile),
              ),
              matching: find.byType(Text),
            )
            .last,
      );

      expect(trendText.data, contains('-'));
      expect(trendText.data, contains('kg/week'));

      await db.close();
    });

    testWidgets('Trend works with calories data', (WidgetTester tester) async {
      await mockTests();
      final settings = await (db.settings.select()).getSingle();
      final settingsState = SettingsState(settings);

      await (db.diaries.insertAll([
        DiariesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test Food 1',
              calories: const Value(100),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now().subtract(const Duration(days: 6)),
          quantity: 20,
          unit: 'serving',
        ),
        DiariesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test Food 2',
              calories: const Value(100),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now().subtract(const Duration(days: 4)),
          quantity: 18,
          unit: 'serving',
        ),
        DiariesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test Food 3',
              calories: const Value(100),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now().subtract(const Duration(days: 2)),
          quantity: 16,
          unit: 'serving',
        ),
        DiariesCompanion.insert(
          food: await (db.foods.insertOne(
            FoodsCompanion.insert(
              name: 'Test Food 4',
              calories: const Value(100),
              servingWeight1G: const Value(1),
            ),
          )),
          created: DateTime.now(),
          quantity: 14,
          unit: 'serving',
        ),
      ]));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => DiaryState()),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: AppLine(
                metric: 'calories',
                groupBy: Period.day,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Trend'), findsOneWidget);

      await tester.tap(find.text('Trend'));
      await tester.pumpAndSettle();

      expect(find.textContaining('kcal/week'), findsOneWidget);

      await db.close();
    });

    testWidgets('Average line disappears when trend is selected',
        (WidgetTester tester) async {
      await mockTests();
      final settings = await (db.settings.select()).getSingle();
      final settingsState = SettingsState(settings);

      await (db.weights.insertAll([
        WeightsCompanion.insert(
          created: DateTime.now().subtract(const Duration(days: 2)),
          unit: 'kg',
          amount: 80,
        ),
        WeightsCompanion.insert(
          created: DateTime.now(),
          unit: 'kg',
          amount: 78,
        ),
      ]));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => DiaryState()),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: AppLine(
                metric: 'body-weight',
                groupBy: Period.day,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Trend'));
      await tester.pumpAndSettle();

      await db.close();
    });

    testWidgets('Handles insufficient data gracefully',
        (WidgetTester tester) async {
      await mockTests();
      final settings = await (db.settings.select()).getSingle();
      final settingsState = SettingsState(settings);

      await (db.weights.insertAll([
        WeightsCompanion.insert(
          created: DateTime.now(),
          unit: 'kg',
          amount: 80,
        ),
      ]));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => DiaryState()),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: AppLine(
                metric: 'body-weight',
                groupBy: Period.day,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Trend'));
      await tester.pumpAndSettle();

      expect(find.text('0.00 kg/week'), findsOneWidget);

      await db.close();
    });
  });
}
