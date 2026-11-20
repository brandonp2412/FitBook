import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

Future<void> _pumpDiary(
  WidgetTester tester, {
  required int? calorieGoal,
}) async {
  await mockTests();
  await db.settings.update().write(
        SettingsCompanion(
          dailyCalories: Value(calorieGoal),
          dailyProtein: const Value(null),
          dailyCarb: const Value(null),
          dailyFat: const Value(null),
          dailyFiber: const Value(null),
        ),
      );
  final settingsState = SettingsState(await db.settings.select().getSingle());
  final foodId = await db.foods.insertOne(
    FoodsCompanion.insert(
      name: 'Nutrition details test food',
      calories: const Value(450),
      proteinG: const Value(24),
      carbohydrateG: const Value(40),
      fatG: const Value(12),
      fiberG: const Value(6),
    ),
  );
  await db.diaries.insertOne(
    DiariesCompanion.insert(
      food: Value(foodId),
      created: DateTime.now(),
      quantity: 1,
      unit: 'serving',
    ),
  );
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => settingsState),
        ChangeNotifierProvider(create: (_) => DiaryState()),
      ],
      child: localizedApp(home: const DiaryPage()),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Tapping diary progress opens complete nutrition breakdown', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await _pumpDiary(tester, calorieGoal: 2000);
    expect(find.text('Nutrition details'), findsOneWidget);
    await tester.tap(find.text('Nutrition details'));
    await tester.pumpAndSettle();

    expect(find.text('Nutrition details'), findsOneWidget);
    expect(find.text('450 / 2,000 kcal'), findsOneWidget);
    expect(find.text('1,550 kcal remaining'), findsOneWidget);
    expect(find.text('Protein'), findsOneWidget);
    expect(find.text('Carbs'), findsOneWidget);
    expect(find.text('Fat'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Fiber'), 200);
    expect(find.text('Goal: Not set'), findsWidgets);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Nutrition details'), findsOneWidget);
    await db.close();
  });

  testWidgets('Nutrition details accessible even without any configured goals',
      (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await _pumpDiary(tester, calorieGoal: null);
    await tester.tap(find.text('Nutrition details'));
    await tester.pumpAndSettle();
    expect(find.text('450 kcal'), findsOneWidget);
    expect(find.text('Goal: Not set'), findsWidgets);
    await db.close();
  });
}
