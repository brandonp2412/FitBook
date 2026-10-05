import 'package:drift/drift.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

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
