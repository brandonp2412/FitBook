import 'package:drift/drift.dart' hide isNull;
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() {
  testWidgets('calorie conversion tolerates cleared numeric fields',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await db.settings.select().getSingle();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsState(settings)),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: const MaterialApp(home: EditFoodPage()),
      ),
    );
    await tester.pump();

    final calories = find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Calories (kcal)',
    );
    final kilojoules = find.byWidgetPredicate(
      (widget) =>
          widget is TextField && widget.decoration?.labelText == 'Kilojoules (kj)',
    );
    final servingSize = find.byWidgetPredicate(
      (widget) =>
          widget is TextField && widget.decoration?.labelText == 'Serving size',
    );

    await tester.enterText(calories, '');
    await tester.pump();
    expect(tester.takeException(), isNull);

    await tester.enterText(kilojoules, '');
    await tester.pump();
    expect(tester.takeException(), isNull);

    await tester.enterText(servingSize, '');
    await tester.tap(find.text('Save'));
    await tester.pump();
    expect(tester.takeException(), isNull);

    await db.close();
  });
}
