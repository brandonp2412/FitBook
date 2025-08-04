import 'package:drift/drift.dart' hide isNull;
import 'package:fit_book/database/database.dart';
import 'package:fit_book/entry/entry_state.dart';
import 'package:fit_book/food/food_filters.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  group('FoodFilters Widget Tests', () {
    testWidgets(
        'FoodFilters serving unit dropdown should not cause deactivated widget error',
        (WidgetTester tester) async {
      await mockTests();
      final settings = await (db.settings.select()).getSingle();
      final settingsState = SettingsState(settings);

      // Add some test foods with different food groups
      await db.foods.deleteAll();
      await (db.foods.insertAll([
        FoodsCompanion.insert(
          name: 'Chicken',
          calories: const Value(300),
          foodGroup: const Value('Protein'),
          servingUnit: const Value('grams'),
          servingSize: const Value(100.0),
        ),
        FoodsCompanion.insert(
          name: 'Apple',
          calories: const Value(80),
          foodGroup: const Value('Fruits'),
          servingUnit: const Value('ounces'),
          servingSize: const Value(1.0),
        ),
      ]));

      final servingSizeGtController = TextEditingController();
      final servingSizeLtController = TextEditingController();
      final groupCtrl = TextEditingController();

      bool onChangeCallbackCalled = false;
      String? selectedServingUnit;

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => EntryState()),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: FoodFilters(
                groupCtrl: groupCtrl,
                servingUnit: selectedServingUnit,
                servingSizeGtController: servingSizeGtController,
                servingSizeLtController: servingSizeLtController,
                onChange: ({foodGroup, servingUnit}) {
                  onChangeCallbackCalled = true;
                  selectedServingUnit = servingUnit;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find and tap the filter button to open the dialog
      final filterButton = find.byTooltip('Filter foods');
      expect(filterButton, findsOneWidget);
      await tester.tap(filterButton);
      await tester.pumpAndSettle();

      // Find the serving unit dropdown in the dialog (it's the second one)
      final servingUnitDropdown =
          find.byType(DropdownButtonFormField<String>).last;
      expect(servingUnitDropdown, findsOneWidget);

      // Tap the serving unit dropdown to open it
      await tester.tap(servingUnitDropdown);
      await tester.pumpAndSettle();

      // Find and tap the "ounces" option
      final ouncesOption = find.text('ounces').last;
      expect(ouncesOption, findsOneWidget);

      // This should not cause any errors with the new implementation
      await tester.tap(ouncesOption);
      await tester.pumpAndSettle();

      // Close the dialog
      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      // Verify the onChange callback was called
      expect(onChangeCallbackCalled, isTrue);
      expect(selectedServingUnit, equals('ounces'));

      // Clean up
      servingSizeGtController.dispose();
      servingSizeLtController.dispose();
      await db.close();
    });

    testWidgets(
        'FoodFilters clear button should not cause deactivated widget error',
        (WidgetTester tester) async {
      await mockTests();
      final settings = await (db.settings.select()).getSingle();
      final settingsState = SettingsState(settings);

      // Add some test foods
      await db.foods.deleteAll();
      await (db.foods.insertAll([
        FoodsCompanion.insert(
          name: 'Chicken',
          calories: const Value(300),
          foodGroup: const Value('Protein'),
          servingUnit: const Value('grams'),
          servingSize: const Value(100.0),
        ),
      ]));

      final servingSizeGtController = TextEditingController();
      final servingSizeLtController = TextEditingController();
      final groupCtrl = TextEditingController(text: 'Protein');

      bool onChangeCallbackCalled = false;
      String? selectedServingUnit = 'grams';

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => settingsState),
            ChangeNotifierProvider(create: (context) => EntryState()),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: FoodFilters(
                groupCtrl: groupCtrl,
                servingUnit: selectedServingUnit,
                servingSizeGtController: servingSizeGtController,
                servingSizeLtController: servingSizeLtController,
                onChange: ({foodGroup, servingUnit}) {
                  onChangeCallbackCalled = true;
                  selectedServingUnit = servingUnit;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find and tap the filter button to open the dialog
      final filterButton = find.byTooltip('Filter foods');
      expect(filterButton, findsOneWidget);
      await tester.tap(filterButton);
      await tester.pumpAndSettle();

      // Find and tap the clear all button
      final clearButton = find.text('Clear All');
      expect(clearButton, findsOneWidget);

      // This should not cause any errors with the new implementation
      await tester.tap(clearButton);
      await tester.pumpAndSettle();

      // Verify the onChange callback was called
      expect(onChangeCallbackCalled, isTrue);
      expect(groupCtrl.text, isEmpty);
      expect(selectedServingUnit, isNull);

      // Clean up
      servingSizeGtController.dispose();
      servingSizeLtController.dispose();
      await db.close();
    });
  });
}
