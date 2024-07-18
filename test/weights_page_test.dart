import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/entry/entry_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/weight/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets(
    'WeightsPage list',
    (WidgetTester tester) async {
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
            home: WeightPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('60'), findsOne);
      expect(find.textContaining('70'), findsOne);
      expect(find.textContaining('80'), findsOne);

      await db.close();
    },
  );

  testWidgets(
    'WeightsPage update',
    (WidgetTester tester) async {
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
        ],
      ));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => EntryState()),
          ],
          child: const MaterialApp(
            home: WeightPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('60'), findsOne);
      await tester.tap(find.text('60.0 kg'));
      await tester.pumpAndSettle();
      expect(find.text('Edit weight'), findsOne);

      await tester.enterText(find.bySemanticsLabel('Weight (kg)'), '61');
      await tester.tap(find.byTooltip('Save'));
      await tester.pumpAndSettle();
      expect(find.text('61.0 kg'), findsOne);

      await db.close();
    },
  );

  testWidgets(
    'WeightsPage delete',
    (WidgetTester tester) async {
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
            home: WeightPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('60'), findsOne);
      await tester.longPress(find.text('60.0 kg'));
      await tester.pump();
      await tester.tap(find.text('70.0 kg'));
      await tester.tap(find.text('80.0 kg'));
      await tester.tap(find.byTooltip('Delete'));
      await tester.pump();
      expect(find.textContaining('Are you sure'), findsOne);
      await tester.tap(find.text('Delete'));

      await tester.pumpAndSettle();
      expect(find.text('No weights found'), findsOne);

      await db.close();
    },
  );

  testWidgets(
    'WeightsPage create',
    (WidgetTester tester) async {
      await mockTests();
      final settings = await (db.settings.select()).getSingle();
      final settingsState = SettingsState(settings);

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => EntryState()),
          ],
          child: const MaterialApp(
            home: WeightPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No weights found'), findsOne);
      await tester.tap(find.byTooltip('Add'));
      await tester.pumpAndSettle();
      expect(find.text('Add weight'), findsOne);
      await tester.enterText(find.bySemanticsLabel('Weight (kg)'), '61');
      await tester.tap(find.byTooltip('Save'));
      await tester.pumpAndSettle();
      expect(find.text('Add weight'), findsNothing);

      final weight = await (db.weights.select()).getSingle();
      expect(weight.amount, equals(61));

      await db.close();
    },
  );
}
