import 'package:drift/drift.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/quick_add_page.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  Future<void> pumpQuickAdd(WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(
          home: QuickAddPage(),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('QuickAdd', (WidgetTester tester) async {
    await pumpQuickAdd(tester);
    expect(find.text('Quick add'), findsOne);
    await tester.tap(find.bySemanticsLabel('Calories'));

    await tester.enterText(find.text('600'), '800');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Quick add'), findsNothing);

    await db.close();
  });

  testWidgets('QuickAdd tolerates empty input while editing', (
    WidgetTester tester,
  ) async {
    await pumpQuickAdd(tester);

    await tester.enterText(find.bySemanticsLabel('Calories'), '');
    await tester.pump();

    expect(tester.takeException(), equals(null));
    expect(find.text('Quick add'), findsOne);

    await db.close();
  });

  testWidgets('QuickAdd saves locale-formatted nutrition values', (
    WidgetTester tester,
  ) async {
    await pumpQuickAdd(tester);

    await tester.enterText(find.bySemanticsLabel('Calories'), '1,200');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final food = await (db.foods.select()
          ..where((food) => food.name.equals('Quick-add'))
          ..orderBy([(food) => OrderingTerm.desc(food.id)])
          ..limit(1))
        .getSingle();
    expect(food.calories, 1200.0);
    expect(find.text('Quick add'), findsNothing);

    await db.close();
  });

  testWidgets('QuickAdd rejects invalid nutrition values without closing', (
    WidgetTester tester,
  ) async {
    await pumpQuickAdd(tester);

    await tester.enterText(find.bySemanticsLabel('Calories'), '');
    await tester.tap(find.byTooltip('Save'));
    await tester.pump();

    expect(find.text('Enter valid nutrition values'), findsOne);
    expect(find.text('Quick add'), findsOne);

    await db.close();
  });
}
