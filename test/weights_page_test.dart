import 'package:drift/drift.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_state.dart';
import 'package:fit_book/weights_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('WeightsPage CRUD', (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState();
    await settingsState.init();

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
          ChangeNotifierProvider(create: (context) => EntriesState()),
        ],
        child: const MaterialApp(
          home: WeightsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('60'), findsOne);
    expect(find.textContaining('70'), findsOne);
    expect(find.textContaining('80'), findsOne);

    await tester.tap(find.byTooltip('Add'));
    await tester.pumpAndSettle();
    expect(find.text('Enter weight'), findsOne);
    await tester.enterText(find.text('0.0'), '85');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect(find.text('85.0'), findsOne);

    await tester.tap(find.text('85.0'));
    await tester.pumpAndSettle();
    await tester.enterText(find.text('85.0').first, '86');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect(find.text('86.0'), findsOne);

    await tester.longPress(find.text('86.0'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Delete'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(find.text('86.0'), findsNothing);

    await db.close();
  });
}
