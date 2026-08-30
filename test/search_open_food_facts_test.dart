import 'package:drift/drift.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/search_open_food_facts.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() {
  testWidgets('Open Food Facts starts with search guidance',
      (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => settingsState),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: const MaterialApp(home: SearchOpenFoodFacts()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Search Open Food Facts'), findsOneWidget);
    expect(
      find.text('Enter a food name above, then submit to search.'),
      findsOneWidget,
    );
    expect(find.text('No products found'), findsNothing);

    await db.close();
  });
}
