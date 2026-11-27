import 'package:drift/drift.dart' hide isNull;
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

Widget _wrap(
  Widget child,
  SettingsState settingsState, {
  Locale locale = const Locale('en'),
}) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => settingsState),
        ChangeNotifierProvider(create: (_) => DiaryState()),
      ],
      child: localizedApp(home: child, locale: locale),
    );

Finder _fieldStarting(String label) => find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration?.labelText?.startsWith(label) == true,
    );

void main() async {
  testWidgets('Diary picker sorts favorites then latest diary datetime', (
    tester,
  ) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());
    Future<void> addFood(
      String name,
      bool favorite,
      List<DateTime> dates,
    ) async {
      final id = await db.foods.insertOne(
        FoodsCompanion.insert(name: name, favorite: Value(favorite)),
      );
      for (final date in dates) {
        await db.diaries.insertOne(
          DiariesCompanion.insert(
            food: Value(id),
            created: date,
            quantity: 100,
            unit: 'grams',
          ),
        );
      }
    }

    await addFood('Apple old favorite', true, [DateTime(2026, 1, 1)]);
    await addFood('Apple new favorite', true, [
      DateTime(2026, 1, 2, 18),
      DateTime(2026, 1, 1),
    ]);
    await addFood('Apple never logged', true, []);
    await addFood('Apple old regular', false, [DateTime(2026, 1, 2)]);
    await addFood('Apple new regular', false, [DateTime(2026, 1, 3)]);
    await addFood('Apple same day favorite', true, [DateTime(2026, 1, 2, 8)]);

    tester.view.physicalSize = const Size(800, 1100);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(_wrap(const EditDiaryPage(), settingsState));
    await tester.pumpAndSettle();
    final expected = [
      'Apple new favorite',
      'Apple same day favorite',
      'Apple old favorite',
      'Apple never logged',
      'Apple new regular',
      'Apple old regular',
    ];
    List<String?> visibleFoods() => tester
        .widgetList<ListTile>(find.byType(ListTile))
        .map((tile) => (tile.title as Text).data)
        .where((title) => title?.startsWith('Apple') == true)
        .toList();
    expect(visibleFoods(), expected);
    await tester.enterText(find.byKey(const Key('name_field')), 'Apple');
    await tester.pumpAndSettle();
    expect(visibleFoods(), expected);
    await db.close();
  });

  testWidgets('Diary picker creates and logs a typed new food directly', (
    tester,
  ) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());
    await tester.pumpWidget(_wrap(const EditDiaryPage(), settingsState));
    await tester.pumpAndSettle();
    expect(find.text('Add food'), findsOneWidget);
    await tester.tap(find.text('Add food'));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Save'), findsNothing);
    await tester.tap(find.byTooltip('Clear selection'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('name_field')),
      '  Homemade soup  ',
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add food'));
    await tester.pumpAndSettle();
    expect(find.text('Add food to diary'), findsOneWidget);
    expect(
      tester
          .widget<TextField>(find.byKey(const Key('name_field')))
          .controller!
          .text,
      'Homemade soup',
    );
    await tester.enterText(_fieldStarting('Calories'), '120');
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    final food = await (db.foods.select()
          ..where((food) => food.name.equals('Homemade soup')))
        .getSingle();
    final entry = await db.diaries.select().getSingle();
    expect(food.name, 'Homemade soup');
    expect(food.calories, 120);
    expect(entry.food, food.id);
    await db.close();
  });
}
