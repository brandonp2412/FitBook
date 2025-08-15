import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/diary/edit_diaries_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('EditDiaries', (WidgetTester tester) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);

    final richId = await (db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Rich piana',
        calories: const Value(1000),
      ),
    ));

    await (db.diaries.insertAll([
      DiariesCompanion.insert(
        food: await (db.foods.insertOne(
          FoodsCompanion.insert(
            name: 'Cookie',
          ),
        )),
        created: DateTime.now(),
        quantity: 3,
        unit: 'serving',
      ),
      DiariesCompanion.insert(
        food: await (db.foods.insertOne(
          FoodsCompanion.insert(
            name: 'Chicken',
          ),
        )),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
      DiariesCompanion.insert(
        food: await (db.foods.insertOne(
          FoodsCompanion.insert(
            name: 'Coke',
          ),
        )),
        created: DateTime.now(),
        quantity: 1,
        unit: 'serving',
      ),
    ]));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: MaterialApp(
          home: EditDiariesPage(
            diaryIds: (await (db.diaries.select()).get())
                .map((entry) => entry.id)
                .toList(),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Edit 3 entries'), findsOne);
    expect(find.text('Quantity'), findsOne);
    expect(find.text('Unit'), findsOne);
    expect(find.text('Created date'), findsOne);

    await tester.enterText(find.bySemanticsLabel('Name'), 'Rich piana');
    await tester.pump();
    await tester.tap(find.text('Rich piana').last);
    await tester.pump();

    await tester.enterText(find.bySemanticsLabel('Quantity'), '2');
    await tester.pump();

    await tester.tap(find.text('Unit'), warnIfMissed: false);
    await tester.pump();
    await tester.tap(find.text('cups'));
    await tester.pump();

    await tester.enterText(find.bySemanticsLabel('Calories'), '200');
    await tester.pump();

    await tester.enterText(find.bySemanticsLabel('Protein'), '30');
    await tester.pump();

    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final diaries =
        await (db.diaries.select()..where((u) => u.food.equals(richId))).get();
    expect(diaries.length, equals(3));

    await db.close();
  });
}
