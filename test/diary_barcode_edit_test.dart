import 'package:drift/drift.dart' hide isNull;
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

void main() {
  testWidgets('scanned diary entry shows loading before filling in local food',
      (tester) async {
    await mockTests();
    const barcode = '9412345678901';
    await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Scanned snack',
        barcode: const Value(barcode),
      ),
    );
    final settings = await db.settings.select().getSingle();
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => SettingsState(settings.copyWith(showImages: true)),
        child: localizedApp(home: const EditDiaryPage(scannedBarcode: barcode)),
      ),
    );

    expect(find.byType(EditDiaryPage), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    expect(find.byIcon(Icons.restaurant_rounded), findsOneWidget);
    expect(find.byType(TextField), findsNothing);

    await tester.pumpAndSettle();

    expect(find.byType(LinearProgressIndicator), findsNothing);
    expect(find.widgetWithText(TextField, 'Scanned snack'), findsOneWidget);
    expect(find.widgetWithText(TextField, barcode), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    await db.close();
  });

  testWidgets('diary editor clears existing food barcode without duplication',
      (tester) async {
    await mockTests();
    await db.foods.deleteAll();
    final id = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Test snack',
        barcode: const Value('9412345678901'),
        calories: const Value(180),
        imageFile: const Value('snack-image.jpg'),
      ),
    );
    final food =
        await (db.foods.select()..where((f) => f.id.equals(id))).getSingle();
    final settings = await db.settings.select().getSingle();
    Widget editor(Food value) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SettingsState(settings)),
            ChangeNotifierProvider(create: (_) => DiaryState()),
          ],
          child: localizedApp(home: EditDiaryPage(initialFood: value)),
        );
    await tester.pumpWidget(editor(food));
    await tester.pumpAndSettle();

    final barcodeField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField && widget.decoration?.labelText == 'Barcode',
    );
    expect(
      tester.widget<TextField>(barcodeField).controller?.text,
      '9412345678901',
    );
    expect(
      tester.widget<ScanBarcode>(find.byType(ScanBarcode)).barcodeOnly,
      isTrue,
    );
    await tester.ensureVisible(barcodeField);
    await tester.enterText(barcodeField, '');
    await tester.pump();
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final updated =
        await (db.foods.select()..where((f) => f.id.equals(id))).getSingle();
    expect(updated.barcode, isNull);
    expect(updated.name, food.name);
    expect(updated.calories, food.calories);
    expect(updated.imageFile, 'snack-image.jpg');
    expect((await db.foods.select().get()), hasLength(1));
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    await tester.pumpWidget(editor(updated));
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(barcodeField).controller?.text, '');
    await db.close();
  });

  testWidgets('diary editor scanned barcode saves onto original food',
      (tester) async {
    await mockTests();
    await db.foods.deleteAll();
    final id = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Another test snack',
        calories: const Value(240),
      ),
    );
    final food =
        await (db.foods.select()..where((f) => f.id.equals(id))).getSingle();
    final settings = await db.settings.select().getSingle();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsState(settings)),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: localizedApp(home: EditDiaryPage(initialFood: food)),
      ),
    );
    await tester.pumpAndSettle();

    final scanner = tester.widget<ScanBarcode>(find.byType(ScanBarcode));
    expect(scanner.barcodeOnly, isTrue);
    final result = await resolveScannedBarcode(
      tester.element(find.byType(ScanBarcode)),
      '9423456789012',
      barcodeOnly: scanner.barcodeOnly,
    );
    expect(result.food, isNull);
    scanner.onBarcode(result.barcode!);
    await tester.pump();
    final barcodeField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField && widget.decoration?.labelText == 'Barcode',
    );
    expect(
      tester.widget<TextField>(barcodeField).controller?.text,
      '9423456789012',
    );
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    final foods = await db.foods.select().get();
    expect(foods, hasLength(1));
    expect(foods.single.id, id);
    expect(foods.single.barcode, '9423456789012');
    expect(foods.single.calories, 240);
    await db.close();
  });
}
