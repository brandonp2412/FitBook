import 'package:drift/drift.dart';
import 'package:fit_book/entry/entry_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_page.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('SettingsPage', (WidgetTester tester) async {
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
          home: SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Appearance'), findsOne);
    expect(find.text('Data'), findsOne);
    expect(find.text('Diary'), findsOne);
    expect(find.text('Food'), findsOne);
    expect(find.text('Weight'), findsOne);

    await db.close();
  });

  testWidgets('SettingsPage search', (WidgetTester tester) async {
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
          home: SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.bySemanticsLabel('Search...'), 'Weight');
    await tester.pumpAndSettle();
    expect(find.text('Weight'), findsOne);
    expect(find.text('Appearance'), findsNothing);

    await db.close();
  });

  testWidgets('SettingsPage navigates', (WidgetTester tester) async {
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
          home: SettingsPage(),
        ),
      ),
    );

    await tester.tap(find.text('Appearance'));
    await tester.pumpAndSettle();
    expect(find.text('Theme'), findsOne);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Data'));
    await tester.pumpAndSettle();
    expect(find.text('Export data'), findsOne);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Diary'));
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('Daily calories'), findsOne);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Food'));
    await tester.pumpAndSettle();
    expect(find.text('Food unit'), findsOne);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Weight'));
    await tester.pumpAndSettle();
    expect(find.text('Target weight'), findsOne);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    await db.close();
  });
}
