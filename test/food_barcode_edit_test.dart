import 'package:drift/drift.dart' hide isNull;
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

void main() {
  testWidgets('scanning in an existing food edits only its barcode',
      (tester) async {
    await mockTests();
    await db.foods.deleteAll();
    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Manually entered protein bar',
        calories: const Value(220),
        proteinG: const Value(18),
        servingSize: const Value(60),
        servingUnit: const Value('grams'),
      ),
    );
    final otherId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Already catalogued product',
        barcode: const Value('9421234567890'),
      ),
    );
    final settings = await db.settings.select().getSingle();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsState(settings)),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: localizedApp(home: EditFoodPage(id: foodId)),
      ),
    );
    await tester.pumpAndSettle();

    final scanner = tester.widget<ScanBarcode>(find.byType(ScanBarcode));
    expect(scanner.barcodeOnly, isTrue);
    final context = tester.element(find.byType(ScanBarcode));
    final result = await resolveScannedBarcode(
      context,
      '9421234567890',
      barcodeOnly: scanner.barcodeOnly,
    );
    expect(result.food, isNull);
    expect(result.barcode, '9421234567890');
    scanner.onBarcode(result.barcode!);
    await tester.pump();

    expect(find.text('Edit food'), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is TextField &&
            widget.decoration?.labelText == 'Barcode' &&
            widget.controller?.text == '9421234567890',
      ),
      findsOneWidget,
    );
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final foods = await db.foods.select().get();
    expect(foods, hasLength(2));
    final edited = foods.singleWhere((food) => food.id == foodId);
    expect(edited.name, 'Manually entered protein bar');
    expect(edited.barcode, '9421234567890');
    expect(edited.calories, 220);
    expect(edited.proteinG, 18);
    expect(edited.servingSize, 60);
    expect(
      foods.singleWhere((food) => food.id == otherId).name,
      'Already catalogued product',
    );

    await db.close();
  });

  testWidgets('clearing an existing barcode persists after reopening',
      (tester) async {
    await mockTests();
    await db.foods.deleteAll();
    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'My existing snack',
        barcode: const Value('9412345678901'),
        calories: const Value(180),
        proteinG: const Value(12),
      ),
    );
    final settings = await db.settings.select().getSingle();
    Widget page() => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SettingsState(settings)),
            ChangeNotifierProvider(create: (_) => DiaryState()),
          ],
          child: localizedApp(home: EditFoodPage(id: foodId)),
        );
    await tester.pumpWidget(page());
    await tester.pumpAndSettle();
    final barcodeField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField && widget.decoration?.labelText == 'Barcode',
    );
    expect(
      tester.widget<TextField>(barcodeField).controller?.text,
      '9412345678901',
    );
    await tester.enterText(barcodeField, '');
    await tester.pump();
    expect(tester.widget<TextField>(barcodeField).controller?.text, '');
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();
    var saved = await (db.foods.select()..where((f) => f.id.equals(foodId)))
        .getSingle();
    expect(saved.barcode, isNull, reason: 'Clearing should erase the barcode');
    expect(saved.name, 'My existing snack');
    expect(saved.proteinG, 12);
    expect((await db.foods.select().get()), hasLength(1));
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
    await tester.pumpWidget(page());
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(barcodeField).controller?.text, '');
    await db.close();
  });

  testWidgets('the normal scanner still resolves catalogued foods',
      (tester) async {
    await mockTests();
    await db.foods.deleteAll();
    final existingId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Catalogued bar',
        barcode: const Value('1234567890123'),
      ),
    );
    final settings = await db.settings.select().getSingle();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsState(settings)),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: localizedApp(home: const EditFoodPage()),
      ),
    );
    await tester.pump();
    final result = await resolveScannedBarcode(
      tester.element(find.byType(ScanBarcode)),
      '1234567890123',
    );
    expect(result.food?.id, existingId);
    expect((await db.foods.select().get()), hasLength(1));
    await db.close();
  });
}
