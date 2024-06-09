import 'package:fit_book/settings/delete_records_button.dart';
import 'package:fit_book/diary/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('DeleteRecords diary', (WidgetTester tester) async {
    await mockTests();
    final prefs = await SharedPreferences.getInstance();
    final settingsState = SettingsState(prefs);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntriesState()),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => DeleteRecordsButton(pageContext: context),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.tap(find.text('Delete records'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Diary'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(find.text('Delete records'), findsNothing);

    await db.close();
  });

  testWidgets('DeleteRecords foods', (WidgetTester tester) async {
    await mockTests();
    final prefs = await SharedPreferences.getInstance();
    final settingsState = SettingsState(prefs);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntriesState()),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => DeleteRecordsButton(pageContext: context),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.tap(find.text('Delete records'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Food'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(find.text('Delete records'), findsNothing);

    await db.close();
  });

  testWidgets('DeleteRecords weight', (WidgetTester tester) async {
    await mockTests();
    final prefs = await SharedPreferences.getInstance();
    final settingsState = SettingsState(prefs);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntriesState()),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => DeleteRecordsButton(pageContext: context),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.tap(find.text('Delete records'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Weight'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(find.text('Delete records'), findsNothing);

    await db.close();
  });
}
