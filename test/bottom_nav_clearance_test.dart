import 'package:drift/drift.dart' hide isNull;
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

Widget _wrap(Widget child, SettingsState settingsState) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => settingsState),
        ChangeNotifierProvider(create: (_) => DiaryState()),
      ],
      child: MaterialApp(home: child),
    );

Future<void> _expectFieldsClearBottomNav(WidgetTester tester) async {
  await tester.drag(
    find.byType(ListView).first,
    const Offset(0, -5000),
    warnIfMissed: false,
  );
  await tester.pump();

  final screenBottom = tester.getRect(find.byType(Scaffold).first).bottom;
  final navTop = screenBottom - BottomNav.totalOverlayHeight;
  final fieldBottoms = find
      .byType(TextField)
      .evaluate()
      .map((e) => tester.getRect(find.byWidget(e.widget)).bottom);

  expect(fieldBottoms, isNotEmpty);
  for (final bottom in fieldBottoms) {
    expect(bottom, lessThanOrEqualTo(navTop));
  }
}

void main() async {
  testWidgets('EditFoodPage fields scroll past the bottom nav',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();

    await tester.pumpWidget(
      _wrap(const EditFoodPage(), SettingsState(settings)),
    );
    await tester.pump();

    await _expectFieldsClearBottomNav(tester);

    await db.close();
  });

  testWidgets('EditDiaryPage fields scroll past the bottom nav',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();

    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Hamburger',
        calories: const Value(240),
        proteinG: const Value(20),
        carbohydrateG: const Value(3),
        fatG: const Value(4),
      ),
    );
    final entryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(foodId),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
    );

    await tester.pumpWidget(
      _wrap(EditDiaryPage(id: entryId), SettingsState(settings)),
    );
    await tester.pump();

    await _expectFieldsClearBottomNav(tester);

    await db.close();
  });
}
