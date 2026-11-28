import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

void main() {
  testWidgets('Existing food has one FAB and an inline copy action',
      (tester) async {
    await mockTests();
    final id = await db.foods.insertOne(FoodsCompanion.insert(name: 'Apple'));
    final settings = await db.settings.select().getSingle();
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => SettingsState(settings),
        child: localizedApp(home: EditFoodPage(id: id)),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.widgetWithText(TextButton, 'Save as new copy'), findsOneWidget);
    await db.close();
  });
}
