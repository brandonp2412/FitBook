import 'package:drift/drift.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/food/food_page.dart';
import 'package:fit_book/graph_page.dart';
import 'package:fit_book/weight/weight_page.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../integration_test/screenshot_navigation.dart';
import 'mock_tests.dart';

void main() async {
  testWidgets('App', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No entries today.'), findsOne);
    expect(find.text('Diary'), findsOne);
    expect(find.bySemanticsLabel('Graph'), findsOne);
    expect(find.bySemanticsLabel('Food'), findsOne);
    expect(find.bySemanticsLabel('Weight'), findsOne);

    await tester.tap(find.byTooltip('Show menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.bySemanticsLabel('Search settings...'),
      'System',
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('System color scheme'));
    await tester.pumpAndSettle();

    await db.close();
  });
  for (final width in [390.0, 899.0, 900.0, 960.0, 1400.0]) {
    testWidgets('screenshot navigation selects all tabs at ${width.toInt()}px',
        (WidgetTester tester) async {
      tester.view.physicalSize = Size(width, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await mockTests();
      final settings = await db.settings.select().getSingle();
      final settingsState = SettingsState(settings);

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: settingsState),
            ChangeNotifierProvider(create: (context) => DiaryState()),
          ],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle();

      final desktop = width >= largeScreenBreakpoint;
      expect(find.byType(SideNav), desktop ? findsOneWidget : findsNothing);
      expect(find.byType(BottomNav), desktop ? findsNothing : findsOneWidget);

      for (final (index, tab) in [
        'DiaryPage',
        'GraphPage',
        'FoodPage',
        'WeightPage',
      ].indexed) {
        await selectScreenshotTab(tester, tab);
        final selected = desktop
            ? tester.widget<SideNav>(find.byType(SideNav)).currentIndex
            : tester.widget<BottomNav>(find.byType(BottomNav)).currentIndex;
        expect(
          selected,
          index,
          reason: '$tab was not activated at ${width.toInt()}px',
        );
        final expectedPage = switch (tab) {
          'DiaryPage' => find.byType(DiaryPage),
          'GraphPage' => find.byType(GraphPage),
          'FoodPage' => find.byType(FoodPage),
          'WeightPage' => find.byType(WeightPage),
          _ => throw StateError('Unknown screenshot tab: $tab'),
        };
        expect(
          expectedPage,
          findsOneWidget,
          reason: '$tab did not render at ${width.toInt()}px',
        );
      }
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(milliseconds: 1));
      await tester.pump(const Duration(milliseconds: 1));
    });
  }

  testWidgets('desktop tab changes are immediate', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await mockTests();
    final settings = await db.settings.select().getSingle();
    final settingsState = SettingsState(settings);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const App(),
      ),
    );
    await tester.pump();

    await tester.tap(find.byKey(const Key('desktop-GraphPage')));
    await tester.pump();

    final graphRect = tester.getRect(
      find.byKey(const Key('desktop-graph-controls')),
    );
    expect(graphRect.left, lessThan(1400));
    expect(graphRect.right, greaterThan(232));

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump(const Duration(milliseconds: 1));
  });
}
