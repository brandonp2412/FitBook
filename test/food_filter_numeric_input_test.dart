import 'package:drift/drift.dart' hide isNull;
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/food/food_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() {
  testWidgets('serving-size filters tolerate partial numeric input',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await db.settings.select().getSingle();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsState(settings)),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: const MaterialApp(home: FoodPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Filter foods'));
    await tester.pumpAndSettle();

    final minimum = find.widgetWithText(TextField, 'Minimum');
    final maximum = find.widgetWithText(TextField, 'Maximum');

    await tester.enterText(minimum, '.');
    await tester.pump();
    expect(tester.takeException(), isNull);

    await tester.enterText(maximum, '-');
    await tester.pump();
    expect(tester.takeException(), isNull);

    await db.close();
  });
}
