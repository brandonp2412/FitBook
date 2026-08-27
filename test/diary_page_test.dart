import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/speed_dial_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

Future<Food> _foodForDiary(int diaryId) async {
  final diary = await (db.diaries.select()..where((d) => d.id.equals(diaryId)))
      .getSingle();
  return (db.foods.select()..where((food) => food.id.equals(diary.food!)))
      .getSingle();
}

void main() async {
  testWidgets('DiaryPage persists create, edit and delete flows',
      (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final food1Id = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Test 1',
        calories: const Value(1),
        servingWeight1G: const Value(1),
      ),
    );
    await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Test 4',
        calories: const Value(100),
      ),
    );

    final originalDiaryId = await db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(food1Id),
        created: DateTime.now(),
        quantity: 1,
        unit: 'grams',
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: const MaterialApp(home: DiaryPage()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Test 1'), findsOne);

    await tester.tap(find.byType(SpeedDialFab));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('name_field')), findsOne);

    await tester.enterText(find.byKey(const Key('name_field')), 'Test 4');
    await tester.pumpAndSettle();
    await tester.tap(
      find
          .ancestor(
            of: find.text('Test 4'),
            matching: find.byType(ListTile),
          )
          .first,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final afterCreate = await db.diaries.select().get();
    expect(afterCreate, hasLength(2));
    final createdDiary =
        afterCreate.singleWhere((diary) => diary.id != originalDiaryId);
    expect((await _foodForDiary(createdDiary.id)).name, 'Test 4');

    await tester.tap(find.text('Test 4'));
    await tester.pumpAndSettle();
    final nameField = tester.widget<TextField>(
      find.byKey(const Key('name_field')),
    );
    expect(nameField.controller!.text, 'Test 4');

    await tester.enterText(find.byKey(const Key('name_field')), 'Test 5');
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    expect((await _foodForDiary(createdDiary.id)).name, 'Test 5');

    await tester.longPress(find.text('Test 5'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Delete'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextButton, 'Delete'));
    await tester.pumpAndSettle();

    final afterDelete = await db.diaries.select().get();
    expect(afterDelete, hasLength(1));
    expect(afterDelete.single.id, originalDiaryId);

    await db.close();
  });
}
