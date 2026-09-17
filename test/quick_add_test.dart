import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/quick_add_page.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

void main() async {
  Future<void> pumpQuickAdd(
    WidgetTester tester, {
    Locale locale = const Locale('en'),
    String? settingLocale,
  }) async {
    await mockTests();
    if (settingLocale != null) {
      await db.settings.update().write(
            SettingsCompanion(locale: Value(settingLocale)),
          );
    }
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(
          home: const QuickAddPage(),
          locale: locale,
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

  testWidgets('QuickAdd uses the selected locale for decimal input', (
    WidgetTester tester,
  ) async {
    await pumpQuickAdd(
      tester,
      locale: const Locale('de'),
      settingLocale: 'de',
    );
    final l10n = lookupAppLocalizations(const Locale('de'));

    await tester.enterText(find.bySemanticsLabel(l10n.calories), '123,5');
    await tester.enterText(find.bySemanticsLabel(l10n.protein), '12,5');
    await tester.enterText(find.bySemanticsLabel(l10n.carbs), '34,5');
    await tester.enterText(find.bySemanticsLabel(l10n.fat), '5,5');
    await tester.pump();

    expect(find.text('516,72'), findsOneWidget);

    await tester.tap(find.byTooltip(l10n.save));
    await tester.pumpAndSettle();

    final food = await (db.foods.select()
          ..where((food) => food.name.equals('Quick-add'))
          ..orderBy([(food) => OrderingTerm.desc(food.id)])
          ..limit(1))
        .getSingle();
    expect(food.calories, 123.5);
    expect(food.proteinG, 12.5);
    expect(food.carbohydrateG, 34.5);
    expect(food.fatG, 5.5);

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
