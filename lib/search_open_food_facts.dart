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

  List<Product> products = [];
  bool searching = false;

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
        products = search.products ?? [];
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
                      icon: const Icon(Icons.arrow_back),
                      tooltip: 'Clear',
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 8.0,
                      ),
                    ),
            ),
          ),
          Builder(
            builder: (context) {
              if (searching) return const CircularProgressIndicator();
              return Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    final kj = product.nutriments?.getComputedKJ(
                      PerSize.oneHundredGrams,
                    );
                    final calories = (kj ?? 0) / 4.184;

                    return ListTile(
                      title: Text(product.productName ?? ""),
                      subtitle: Text("${calories.toStringAsFixed(2)} kcal"),
                      trailing: product.imageFrontSmallUrl != null
                          ? Image.network(product.imageFrontSmallUrl!)
                          : null,
                      onTap: () async {
                        var companion = mapOpenFoodFacts(product);
                        final settings = context.read<SettingsState>();
                        if (settings.favoriteNew)
                          companion =
                              companion.copyWith(favorite: const Value(true));

                        final id = await db.foods.insertOne(companion);
                        final food = await (db.foods.select()
                              ..where((u) => u.id.equals(id)))
                            .getSingle();
                        if (context.mounted)
                          Navigator.pop(
                            context,
                            food,
                          );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
