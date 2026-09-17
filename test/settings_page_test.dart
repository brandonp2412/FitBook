import 'package:drift/drift.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_page.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

Future<SettingsState> _settingsState() async =>
    SettingsState(await db.settings.select().getSingle());

Widget _wrap(
  SettingsState settingsState, {
  Locale locale = const Locale('en'),
  TextScaler? textScaler,
}) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => settingsState),
        ChangeNotifierProvider(create: (_) => DiaryState()),
      ],
      child: localizedApp(
        home: const SettingsPage(),
        locale: locale,
        textScaler: textScaler,
      ),
    );

void main() async {
  testWidgets('SettingsPage search filters categories', (
    WidgetTester tester,
  ) async {
    await mockTests();
    await tester.pumpWidget(_wrap(await _settingsState()));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.bySemanticsLabel('Search settings...'),
      'Weight',
    );
    await tester.pumpAndSettle();

    expect(find.text('Weight'), findsOne);
    expect(find.text('Appearance'), findsNothing);

    await db.close();
  });

  testWidgets('Language selection persists the locale preference', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settingsState = await _settingsState();
    await tester.pumpWidget(_wrap(settingsState));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Appearance'));
    await tester.pumpAndSettle();
    final languageField = find.byWidgetPredicate(
      (widget) =>
          widget is DropdownButtonFormField<String> &&
          widget.decoration.labelText == 'Language',
    );
    await tester.tap(languageField);
    await tester.pumpAndSettle();
    await tester.tap(find.text('German').last);
    await tester.pumpAndSettle();

    expect((await db.settings.select().getSingle()).locale, 'de');
    expect(settingsState.value.locale, 'de');

    await db.close();
  });

  testWidgets('SettingsPage handles German at 200% text scale', (
    WidgetTester tester,
  ) async {
    await mockTests();
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      _wrap(
        await _settingsState(),
        locale: const Locale('de'),
        textScaler: const TextScaler.linear(2),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Einstellungen'), findsOneWidget);
    expect(tester.takeException(), equals(null));

    await db.close();
  });

  testWidgets('SettingsPage opens each settings section', (
    WidgetTester tester,
  ) async {
    await mockTests();
    await tester.pumpWidget(_wrap(await _settingsState()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Appearance'));
    await tester.pumpAndSettle();
    expect(find.text('Appearance settings'), findsOne);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Data'));
    await tester.pumpAndSettle();
    expect(find.text('Data settings'), findsOne);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Diary'));
    await tester.pumpAndSettle();
    expect(find.text('Diary settings'), findsOne);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Food'));
    await tester.pumpAndSettle();
    expect(find.text('Food settings'), findsOne);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tabs'));
    await tester.pumpAndSettle();
    expect(find.text('Tabs'), findsOne);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Weight'));
    await tester.pumpAndSettle();
    expect(find.text('Weight settings'), findsOne);

    await db.close();
  });
}
