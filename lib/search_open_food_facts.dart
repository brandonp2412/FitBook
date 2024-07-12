import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

class SearchOpenFoodFacts extends StatefulWidget {
  const SearchOpenFoodFacts({super.key, this.terms});
  final String? terms;

  @override
  createState() => _SearchOpenFoodFactsState();
}

class _SearchOpenFoodFactsState extends State<SearchOpenFoodFacts> {
  late final debouncedSearch = debounce(search);
  final searchController = TextEditingController();

  List<Product>? products;
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
    setState(() {
      searching = true;
    });
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      OpenFoodAPIConfiguration.userAgent = UserAgent(
        name:
            '${packageInfo.appName}/${packageInfo.version} (brandon@presley.nz)',
      );
      final search = await OpenFoodAPIClient.searchProducts(
        const User(userId: '', password: ''),
        ProductSearchQueryConfiguration(
          parametersList: [
            SearchTerms(terms: [term]),
          ],
          version: ProductQueryVersion.v3,
        ),
      );
      setState(() {
        products = search.products;
      });
    } finally {
      setState(() {
        searching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search OpenFoodFacts"),
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
                          products = null;
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
            builder: (context) {
              if (searching)
                return const material.Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                );
              if (products?.isEmpty == true)
                return const ListTile(title: Text("No products found"));

              if (cards)
                return Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: products!.map((product) {
                        final kj = product.nutriments?.getComputedKJ(
                          PerSize.oneHundredGrams,
                        );
                        final calories = (kj ?? 0) / 4.184;
                        return factCard(product, calories, context);
                      }).toList(),
                    ),
                  ),
                );
              return Expanded(
                child: ListView.builder(
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
                    final product = products![index];
                    final kj = product.nutriments?.getComputedKJ(
                      PerSize.oneHundredGrams,
                    );
                    final calories = (kj ?? 0) / 4.184;

                    return factTile(product, calories, context);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  tap(Product product) async {
    var companion = mapOpenFoodFacts(product);
    final settings = context.read<SettingsState>();
    if (settings.favoriteNew)
      companion = companion.copyWith(favorite: const Value(true));

    final id = await db.foods
        .insertOne(companion.copyWith(created: Value(DateTime.now())));
    final food =
        await (db.foods.select()..where((u) => u.id.equals(id))).getSingle();
    if (mounted)
      Navigator.pop(
        context,
        food,
      );
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
                      '$title$brand ${product.quantity}',
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
