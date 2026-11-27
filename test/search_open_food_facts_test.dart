import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/empty_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/search_open_food_facts.dart';
import 'package:fit_book/off_search_client.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

class FakeOffClient extends OffSearchClient {
  final queries = <String, Completer<List<Product>>>{};
  final requestedCodes = <String>[];
  final previewRequests = <List<String>>[];
  final previewCompleter = Completer<Map<String, Product>>();

  @override
  Future<Map<String, Product>> previews(List<String> codes) {
    previewRequests.add(codes);
    return previewCompleter.future;
  }

  @override
  Future<List<Product>> search(String term, String language) =>
      (queries[term] = Completer<List<Product>>()).future;

  @override
  Future<Product> details(String code) async {
    requestedCodes.add(code);
    return Product.fromJson({
      'code': code,
      'product_name': 'Nutella',
      'nutriments': {'energy-kj_100g': 2252, 'proteins_100g': 6.3},
    });
  }
}

void main() {
  test('Search-a-licious hits preserve ranking and normalize brands', () {
    final products = OffSearchClient.parseResults(
      {
        'hits': [
          {
            'code': '001',
            'product_name': 'Original',
            'product_name_fr': 'Chocolat',
            'brands': ['xx:Ferrero'],
            'quantity': '100 g',
          },
          {
            'code': '002',
            'product_name': 'Second',
            'nutriments': {'energy-kcal_100g': 0},
          },
          {'code': '001', 'product_name': 'Duplicate'},
          {'code': '003', 'product_name': ''},
        ],
      },
      'fr',
    );
    expect(products.map((p) => p.barcode), ['001', '002']);
    expect(products.first.productName, 'Chocolat');
    expect(products.first.brands, 'Ferrero');
    expect(products.first.nutriments, equals(null));
    expect(products.last.nutriments?.getComputedKJ(PerSize.oneHundredGrams), 0);
  });

  testWidgets('Search ignores stale results and imports full nutrition on tap',
      (tester) async {
    await mockTests();
    final settings = SettingsState(await db.settings.select().getSingle());
    final client = FakeOffClient();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => settings),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: localizedApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SearchOpenFoodFacts(client: client),
                  ),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    final field = find.byType(TextField);
    await tester.enterText(field, 'old');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    await tester.enterText(field, 'nutella');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    client.queries['nutella']!.complete([
      Product(barcode: '001', productName: 'Nutella'),
      Product.fromJson({
        'code': '003',
        'product_name': 'Zero',
        'nutriments': {'energy-kcal_100g': 0},
      }),
    ]);
    await tester.pumpAndSettle();
    client.queries['old']!
        .complete([Product(barcode: '002', productName: 'Old')]);
    await tester.pumpAndSettle();
    expect(find.textContaining('Old'), findsNothing);
    expect(client.requestedCodes, isEmpty);
    expect(client.previewRequests, [
      ['001'],
    ]);
    expect(find.text('0.00 kcal'), findsOneWidget);
    expect(find.textContaining('Nutella -'), findsOneWidget);
    client.previewCompleter.complete({
      '001': Product.fromJson({
        'code': '001',
        'nutriments': {'energy-kj_100g': 2252},
      }),
    });
    await tester.pumpAndSettle();
    expect(find.text('538.24 kcal'), findsOneWidget);

    await tester.tap(find.textContaining('Nutella -'));
    await tester.pumpAndSettle();
    expect(client.requestedCodes, ['001']);
    final food = await (db.foods.select()
          ..where((row) => row.barcode.equals('001')))
        .getSingle();
    expect(food.barcode, '001');
    expect(food.calories, closeTo(2252 / 4.184, 0.01));
    expect(food.proteinG, 6.3);
    await db.close();
  });

  testWidgets('Open Food Facts starts with search guidance',
      (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => settingsState),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: localizedApp(home: const SearchOpenFoodFacts()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Search Open Food Facts'), findsNWidgets(2));
    expect(
      find.text('Enter a food name above, then submit to search.'),
      findsOneWidget,
    );
    expect(find.text('No products found'), findsNothing);

    // Simulate an empty completed search without calling the external API.
    final dynamic searchState = tester.state(find.byType(SearchOpenFoodFacts));
    searchState.setState(() {
      searchState.hasSearched = true;
    });
    await tester.pumpAndSettle();

    expect(find.text('No matching products'), findsOneWidget);
    final emptyState = tester.widget<AppEmptyState>(find.byType(AppEmptyState));
    expect(emptyState.actionLabel, equals(null));
    expect(emptyState.onAction, equals(null));

    await db.close();
  });
}
