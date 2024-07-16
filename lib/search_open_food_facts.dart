import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';

class SearchOpenFoodFacts extends StatefulWidget {
  const SearchOpenFoodFacts({super.key, this.terms});
  final String? terms;

  @override
  createState() => _SearchOpenFoodFactsState();
}

class _SearchOpenFoodFactsState extends State<SearchOpenFoodFacts> {
  final searchController = TextEditingController();

  List<Product> products = [];
  bool searching = false;
  bool cards = true;

  @override
  void initState() {
    super.initState();
    if (widget.terms?.isNotEmpty == true) {
      search(widget.terms!);
      searchController.text = widget.terms!;
    }
  }

  Future<void> search(String term) async {
    if (term.isEmpty) return;
    setState(() {
      searching = true;
    });

    try {
      final search = await OpenFoodAPIClient.searchProducts(
        null,
        ProductSearchQueryConfiguration(
          parametersList: [
            SearchTerms(terms: [term]),
          ],
          version: ProductQueryVersion.v3,
        ),
      );
      setState(() {
        products = search.products ?? [];
      });
    } finally {
      setState(() {
        searching = false;
      });
    }
  }

  Widget productsBuilder(BuildContext context, String foodUnit) {
    if (searching)
      return const material.Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      );
    if (products.isEmpty == true)
      return const ListTile(title: Text("No products found"));

    PerSize perSize = PerSize.oneHundredGrams;
    if (foodUnit == 'serving') perSize = PerSize.serving;

    if (cards)
      return Expanded(
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            runSpacing: 8.0,
            children: products.map((product) {
              final kj = product.nutriments?.getComputedKJ(perSize);
              final calories = (kj ?? 0) / 4.184;
              return factCard(product, calories, context);
            }).toList(),
          ),
        ),
      );
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final kj = product.nutriments?.getComputedKJ(perSize);
          final calories = (kj ?? 0) / 4.184;

          return factTile(product, calories, context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final foodUnit = context
        .select<SettingsState, String>((settings) => settings.value.foodUnit);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search open food facts"),
      ),
      body: material.Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SearchBar(
              hintText: "Search...",
              onSubmitted: (value) => search(value),
              onChanged: (value) => setState(() {}),
              padding: WidgetStateProperty.all(
                const EdgeInsets.only(right: 8.0),
              ),
              controller: searchController,
              textCapitalization: TextCapitalization.sentences,
              leading: searchController.text.isEmpty == true
                  ? const Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 8.0),
                      child: Icon(Icons.search),
                    )
                  : IconButton(
                      onPressed: () {
                        searchController.text = '';
                        setState(() {
                          products = [];
                          searching = false;
                        });
                      },
                      icon: const Icon(Icons.clear),
                      tooltip: 'Clear',
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 8.0,
                      ),
                    ),
              trailing: [
                if (Platform.isAndroid || Platform.isIOS)
                  ScanBarcode(
                    onBarcode: (_) =>
                        Fluttertoast.showToast(msg: 'Barcode not found'),
                    onFood: (food) {
                      Navigator.of(context).pop(food);
                    },
                  ),
                cards
                    ? IconButton(
                        icon: const Icon(Icons.list),
                        onPressed: () {
                          setState(() {
                            cards = false;
                          });
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.crop_portrait),
                        onPressed: () {
                          setState(() {
                            cards = true;
                          });
                        },
                      ),
              ],
            ),
          ),
          Builder(
            builder: (context) => productsBuilder(context, foodUnit),
          ),
        ],
      ),
    );
  }

  tap(Product product) async {
    final settings = context.read<SettingsState>().value;
    var companion = mapOpenFoodFacts(product, settings.foodUnit);
    if (settings.favoriteNew)
      companion = companion.copyWith(
        favorite: const Value(true),
        barcode: Value(product.barcode),
      );

    final id = await db.foods
        .insertOne(companion.copyWith(created: Value(DateTime.now())));
    final food =
        await (db.foods.select()..where((u) => u.id.equals(id))).getSingle();
    if (mounted) Navigator.of(context).pop(food);
  }

  Widget factCard(
    Product product,
    double calories,
    BuildContext context,
  ) {
    String brand = product.brands?.split(',').first ?? '';
    String title =
        product.productName != null ? "${product.productName} - " : '';

    return GestureDetector(
      onTap: () => tap(product),
      child: Card(
        child: material.SizedBox(
          width: 165,
          child: material.Column(
            children: [
              if (product.imageFrontUrl?.isNotEmpty == true)
                CachedNetworkImage(
                  imageUrl: product.imageFrontUrl!,
                  placeholder: (context, url) => const SizedBox(
                    height: 80,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              material.Padding(
                padding: const EdgeInsets.all(8.0),
                child: material.Column(
                  children: [
                    Text(
                      '$title$brand ${product.quantity ?? ''}',
                    ),
                    Text("${calories.toStringAsFixed(2)} kcal"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile factTile(
    Product product,
    double calories,
    material.BuildContext context,
  ) {
    return ListTile(
      title: Text(product.productName ?? ""),
      subtitle: Text("${calories.toStringAsFixed(2)} kcal"),
      trailing: product.imageFrontSmallUrl != null
          ? CachedNetworkImage(
              imageUrl: product.imageFrontUrl!,
              placeholder: (context, url) => const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              ),
            )
          : null,
      onTap: () => tap(product),
    );
  }
}
