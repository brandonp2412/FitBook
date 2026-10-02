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
import 'test_utils.dart';

Finder _fieldWithLabel(String label) => find.byWidgetPredicate(
      (widget) => widget is TextField && widget.decoration?.labelText == label,
    );

Future<Food> _foodForDiary(int diaryId) async {
  final diary = await (db.diaries.select()..where((d) => d.id.equals(diaryId)))
      .getSingle();
  return (db.foods.select()..where((food) => food.id.equals(diary.food!)))
      .getSingle();
}

void main() async {
  testWidgets('Diary page handles German at 200% text scale', (
    WidgetTester tester,
  ) async {
    await mockTests();
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final settingsState = SettingsState(await db.settings.select().getSingle());
    await db.diaries.deleteAll();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(
          home: const DiaryPage(),
          locale: const Locale('de'),
          textScaler: const TextScaler.linear(2),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Heute keine Einträge.'), findsOneWidget);
    expect(tester.takeException(), equals(null));

    await db.close();
  });

  testWidgets('Diary search can create and log a missing food', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const DiaryPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No entries today.'), findsOneWidget);
    await tester.enterText(find.byType(SearchBar), 'Dragonfruit bowl');
    await tester.pumpAndSettle();

    expect(find.text('Add "Dragonfruit bowl" to your diary'), findsOneWidget);
    expect(find.text('No entries today.'), findsNothing);

    await tester.tap(find.text('Add "Dragonfruit bowl" to your diary'));
    await tester.pumpAndSettle();

    expect(find.text('Add food to diary'), findsOneWidget);
    expect(find.text('Dragonfruit bowl'), findsOneWidget);

    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final createdFood = await (db.foods.select()
          ..where((food) => food.name.equals('Dragonfruit bowl')))
        .getSingle();
    final diaries = await db.diaries.select().get();
    expect(diaries, hasLength(1));
    expect(diaries.single.food, createdFood.id);

    await db.close();
  });

  testWidgets('DiaryPage persists create, edit and delete flows', (
    WidgetTester tester,
  ) async {
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
      FoodsCompanion.insert(name: 'Test 4', calories: const Value(100)),
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
        child: localizedApp(home: const DiaryPage()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Test 1'), findsOne);

    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(find.text('Name'), findsOneWidget);

    await tester.enterText(_fieldWithLabel('Name'), 'Test 4');
    await tester.pumpAndSettle();
    await tester.tap(
      find
          .ancestor(of: find.text('Test 4'), matching: find.byType(ListTile))
          .first,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final afterCreate = await db.diaries.select().get();
    expect(afterCreate, hasLength(2));
    final createdDiary = afterCreate.singleWhere(
      (diary) => diary.id != originalDiaryId,
    );
    expect((await _foodForDiary(createdDiary.id)).name, 'Test 4');

    await tester.tap(find.text('Test 4'));
    await tester.pumpAndSettle();
    expect(find.text('Test 4'), findsOneWidget);

    await tester.enterText(_fieldWithLabel('Name'), 'Test 5');
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
  testWidgets('Diary desktop uses explicit selection and one add action', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1600, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());
    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Desktop diary food',
        calories: const Value(250),
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
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(
          home: Theme(
            data: ThemeData(platform: TargetPlatform.linux),
            child: const DiaryPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Add diary entry'), findsOneWidget);
    expect(find.byType(SpeedDialFab), findsNothing);
    expect(find.byType(Checkbox), findsWidgets);

    final checkbox = find.byType(Checkbox).first;
    expect(tester.widget<Checkbox>(checkbox).value, isFalse);

    final row = find
        .ancestor(
          of: find.text('Desktop diary food'),
          matching: find.byType(ListTile),
        )
        .first;
    expect(tester.widget<ListTile>(row).onLongPress, equals(null));

    tester.widget<Checkbox>(checkbox).onChanged!(true);
    await tester.pump();
    expect(tester.widget<Checkbox>(checkbox).value, isTrue);

    await db.close();
  });
}
