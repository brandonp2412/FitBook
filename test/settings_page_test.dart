import 'package:fit_book/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_page.dart';
import 'package:fit_book/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('SettingsPage', (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState();
    await settingsState.init();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntriesState()),
        ],
        child: const MaterialApp(
          home: SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Light'));
    await tester.pumpAndSettle();
    expect(find.text('Light'), findsOne);

    await tester.enterText(find.bySemanticsLabel('Daily calories'), '3000');
    await tester.pumpAndSettle();
    expect(find.text('3000'), findsOne);

    await tester.enterText(find.bySemanticsLabel('Daily protein'), '200');
    await tester.pumpAndSettle();
    expect(find.text('200'), findsOne);

    await tester.enterText(find.bySemanticsLabel('Search...'), 'data');
    await tester.pumpAndSettle();
    expect(find.text('Export data'), findsOne);
    expect(find.text('Theme'), findsNothing);

    await db.close();
  });
}
