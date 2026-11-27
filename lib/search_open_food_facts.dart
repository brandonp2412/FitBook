import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/empty_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/logging.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/off_search_client.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';

class SearchOpenFoodFacts extends StatefulWidget {
  const SearchOpenFoodFacts({
    super.key,
    this.terms,
    this.client = const OffSearchClient(),
  });
  final OffSearchClient client;
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
  bool selecting = false;
  bool failed = false;
  int searchGeneration = 0;

  @override
  void initState() {
    super.initState();
    if (widget.terms?.isNotEmpty == true) {
      searchCtrl.text = widget.terms!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) search(searchCtrl.text);
      });
    }
  }

  Future<void> search(String term) async {
    final generation = ++searchGeneration;
    final trimmed = term.trim();
    if (trimmed.isEmpty) {
      setState(() {
        products = [];
        searching = false;
        hasSearched = false;
        failed = false;
      });
      return;
    }
    setState(() {
      searching = true;
      hasSearched = true;
      failed = false;
    });
    talker.info('Searching Open Food Facts');

    try {
      final results = await widget.client
          .search(trimmed, Localizations.localeOf(context).languageCode);
      if (!mounted || generation != searchGeneration) return;
      setState(() => products = results);
      talker.info(
        'Open Food Facts search completed with ${products.length} results',
      );
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace, 'Open Food Facts search failed');
      if (mounted && generation == searchGeneration) {
        setState(() {
          products = [];
          failed = true;
        });
      }
    } finally {
      if (mounted && generation == searchGeneration)
        setState(() {
          searching = false;
        });
    }
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  Widget productsBuilder(BuildContext context) {
    if (searching || selecting)
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    if (products.isEmpty == true)
      return Expanded(
        child: AppEmptyState(
          icon: hasSearched
              ? Icons.search_off_rounded
              : Icons.manage_search_rounded,
          title: failed
              ? context.l10n.loadDataFailed
              : hasSearched
                  ? context.l10n.noMatchingProducts
                  : context.l10n.searchOpenFoodFacts,
          message: hasSearched
              ? context.l10n.tryAnotherNameOrScanBarcode
              : context.l10n.enterFoodNameToSearch,
        ),
      );

    if (cards)
      return Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: navigationBottomClearance(context)),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            runSpacing: 8.0,
            children: products.map((product) {
              return factCard(product, context);
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
          return factTile(product, context);
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
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.searchOpenFoodFacts)),
      body: material.Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SearchBar(
              hintText: context.l10n.submitToSearch,
              enabled: !selecting,
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
                      onPressed: selecting
                          ? null
                          : () {
                              searchCtrl.text = '';
                              search('');
                            },
                      icon: const Icon(Icons.clear),
                      tooltip: context.l10n.clear,
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
          Builder(builder: (context) => productsBuilder(context)),
        ],
      ),
      floatingActionButton: supportsBarcodeCamera
          ? Padding(
              padding: EdgeInsets.only(
                bottom: navigationBottomClearance(context),
              ),
              child: FloatingActionButton.extended(
                label: Text(context.l10n.scanBarcode),
                onPressed: selecting ? null : scan,
                icon: const Icon(Icons.barcode_reader),
              ),
            )
          : null,
    );
  }

  Future<void> tap(Product product) async {
    if (selecting || product.barcode == null) return;
    setState(() => selecting = true);
    try {
      final full = await widget.client.details(product.barcode!);
      if (!mounted) return;
      full.productName = product.productName ?? full.productName;
      final settings = context.read<SettingsState>().value;
      final companion = mapOpenFoodFacts(full, settings.foodUnit).copyWith(
        favorite: Value(settings.favoriteNew),
        barcode: Value(product.barcode),
        created: Value(DateTime.now()),
      );
      final id = await db.foods.insertOne(companion);
      final food =
          await (db.foods.select()..where((u) => u.id.equals(id))).getSingle();
      if (mounted) Navigator.of(context).pop(food);
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace, 'Open Food Facts product lookup failed');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.loadDataFailed)),
        );
      }
    } finally {
      if (mounted) setState(() => selecting = false);
    }
  }

  Widget factCard(Product product, BuildContext context) {
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
                  memCacheWidth:
                      (165 * MediaQuery.devicePixelRatioOf(context)).round(),
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
    material.BuildContext context,
  ) {
    return ListTile(
      title: Text(product.productName ?? ""),
      subtitle: Text(
        [product.brands, product.quantity].whereType<String>().join(' · '),
      ),
      trailing: product.imageFrontSmallUrl?.isNotEmpty == true
          ? CachedNetworkImage(
              imageUrl: product.imageFrontSmallUrl!,
              memCacheWidth:
                  (96 * MediaQuery.devicePixelRatioOf(context)).round(),
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
