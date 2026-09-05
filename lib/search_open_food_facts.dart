import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/empty_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/logging.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';

class SearchOpenFoodFacts extends StatefulWidget {
  const SearchOpenFoodFacts({super.key, this.terms});
  final String? terms;

  @override
  State<SearchOpenFoodFacts> createState() => _SearchOpenFoodFactsState();
}

class _SearchOpenFoodFactsState extends State<SearchOpenFoodFacts> {
  final searchCtrl = TextEditingController();

  List<Product> products = [];
  bool searching = false;
  bool hasSearched = false;
  bool cards = true;

  @override
  void initState() {
    super.initState();
    if (widget.terms?.isNotEmpty == true) {
      search(widget.terms!);
      searchCtrl.text = widget.terms!;
    }
  }

  Future<void> search(String term) async {
    final trimmed = term.trim();
    if (trimmed.isEmpty) {
      setState(() {
        products = [];
        searching = false;
        hasSearched = false;
      });
      return;
    }
    setState(() {
      searching = true;
      hasSearched = true;
    });
    talker.info('Searching Open Food Facts');

    try {
      final search = await OpenFoodAPIClient.searchProducts(
        null,
        ProductSearchQueryConfiguration(
          parametersList: [
            SearchTerms(terms: [trimmed]),
          ],
          version: ProductQueryVersion.v3,
        ),
      );
      setState(() {
        products = search.products ?? [];
      });
      talker.info(
        'Open Food Facts search completed with ${products.length} results',
      );
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace, 'Open Food Facts search failed');
      if (mounted) {
        setState(() => products = []);
      }
    } finally {
      if (mounted)
        setState(() {
          searching = false;
        });
    }
  }

  Widget productsBuilder(BuildContext context, String foodUnit) {
    if (searching)
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    if (products.isEmpty == true)
      return Expanded(
        child: AppEmptyState(
          icon: hasSearched
              ? Icons.search_off_rounded
              : Icons.manage_search_rounded,
          title:
              hasSearched ? 'No matching products' : 'Search Open Food Facts',
          message: hasSearched
              ? 'Try another name or scan a barcode.'
              : 'Enter a food name above, then submit to search.',
          actionLabel: hasSearched ? 'Scan barcode' : null,
          actionIcon: Icons.barcode_reader,
          onAction: hasSearched ? scan : null,
        ),
      );

    PerSize perSize = PerSize.oneHundredGrams;
    if (foodUnit == 'serving') perSize = PerSize.serving;

    if (cards)
      return Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: navigationBottomClearance(context)),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            runSpacing: 8.0,
            children: products.map((product) {
              final kj = product.nutriments?.getComputedKJ(perSize);
              final cals = (kj ?? 0) / 4.184;
              return factCard(product, cals, context);
            }).toList(),
          ),
        ),
      );
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: navigationBottomClearance(context)),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final kj = product.nutriments?.getComputedKJ(perSize);
          final cals = (kj ?? 0) / 4.184;

          return factTile(product, cals, context);
        },
      ),
    );
  }

  Future<void> scan() async {
    final result = await performBarcodeScan(context);
    if (!mounted) return;
    if (result.food != null) Navigator.of(context).pop(result.food);
  }

  @override
  Widget build(BuildContext context) {
    final foodUnit = context.select<SettingsState, String>(
      (settings) => settings.value.foodUnit,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Search open food facts")),
      body: material.Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SearchBar(
              hintText: "Submit to search...",
              onSubmitted: (value) => search(value),
              onChanged: (value) => setState(() {}),
              padding: WidgetStateProperty.all(
                const EdgeInsets.only(right: 8.0),
              ),
              controller: searchCtrl,
              textCapitalization: TextCapitalization.sentences,
              leading: searchCtrl.text.isEmpty == true
                  ? const Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 8.0),
                      child: Icon(Icons.search),
                    )
                  : IconButton(
                      onPressed: () {
                        searchCtrl.text = '';
                        setState(() {
                          products = [];
                          searching = false;
                          hasSearched = false;
                        });
                      },
                      icon: const Icon(Icons.clear),
                      tooltip: 'Clear',
                      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    ),
              trailing: [
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
          Builder(builder: (context) => productsBuilder(context, foodUnit)),
        ],
      ),
      floatingActionButton: kIsWeb
          ? null
          : Padding(
              padding: EdgeInsets.only(
                bottom: navigationBottomClearance(context),
              ),
              child: FloatingActionButton.extended(
                label: const Text("Scan barcode"),
                onPressed: scan,
                icon: const Icon(Icons.barcode_reader),
              ),
            ),
    );
  }

  Future<void> tap(Product product) async {
    final settings = context.read<SettingsState>().value;
    var companion = mapOpenFoodFacts(product, settings.foodUnit);
    if (settings.favoriteNew)
      companion = companion.copyWith(
        favorite: const Value(true),
        barcode: Value(product.barcode),
      );

    final id = await db.foods.insertOne(
      companion.copyWith(created: Value(DateTime.now())),
    );
    final food =
        await (db.foods.select()..where((u) => u.id.equals(id))).getSingle();
    if (mounted) Navigator.of(context).pop(food);
  }

  Widget factCard(Product product, double cals, BuildContext context) {
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
                    Text('$title$brand ${product.quantity ?? ''}'),
                    Text("${cals.toStringAsFixed(2)} kcal"),
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
    double cals,
    material.BuildContext context,
  ) {
    return ListTile(
      title: Text(product.productName ?? ""),
      subtitle: Text("${cals.toStringAsFixed(2)} kcal"),
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
