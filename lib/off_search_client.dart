import 'package:openfoodfacts/openfoodfacts.dart';

class OffSearchClient {
  const OffSearchClient();

  Future<List<Product>> search(String term, String language) async {
    final uri = Uri.https('search.openfoodfacts.org', '/search', {
      'q': term,
      'langs': {language, 'en'}.join(','),
      'boost_phrase': 'true',
      'page_size': '20',
      'fields':
          'code,product_name,product_name_$language,brands,quantity,image_front_url,image_front_small_url,nutriments,serving_quantity',
    });
    final response = await HttpHelper()
        .doGetRequest(
          uri,
          uriHelper: uriHelperFoodProd,
        )
        .timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) {
      throw StateError('Open Food Facts search: ${response.statusCode}');
    }
    return parseResults(HttpHelper().jsonDecodeUtf8(response), language);
  }

  static List<Product> parseResults(dynamic response, String language) {
    final hits = response['hits'] as List;
    final products = <Product>[];
    final seen = <String>{};
    for (final hit in hits.whereType<Map<String, dynamic>>()) {
      final code = hit['code']?.toString();
      if (code == null || code.isEmpty || seen.contains(code)) continue;
      final localized = hit['product_name_$language'];
      final name = localized is String && localized.trim().isNotEmpty
          ? localized
          : hit['product_name'];
      if (name is! String || name.trim().isEmpty) continue;
      seen.add(code);
      final brands = hit['brands'];
      products.add(
        Product.fromJson({
          'code': code,
          'product_name': name,
          'brands': brands is List
              ? brands
                  .whereType<String>()
                  .map((brand) => brand.replaceFirst(RegExp(r'^xx:'), ''))
                  .join(', ')
              : brands,
          'quantity': hit['quantity'],
          'nutriments': hit['nutriments'],
          'serving_quantity': hit['serving_quantity'],
          'image_front_url': hit['image_front_url'],
          'image_front_small_url': hit['image_front_small_url'],
        }),
      );
    }
    return products;
  }

  Future<Map<String, Product>> previews(List<String> codes) async {
    if (codes.isEmpty) return {};
    final uri = Uri.https('world.openfoodfacts.org', '/api/v2/search', {
      'code': codes.join(','),
      'page_size': codes.length.toString(),
      'fields': 'code,nutriments,serving_quantity',
    });
    final response = await HttpHelper()
        .doGetRequest(uri, uriHelper: uriHelperFoodProd)
        .timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) {
      throw StateError(
        'Open Food Facts nutrition preview: ${response.statusCode}',
      );
    }
    final result = HttpHelper().jsonDecodeUtf8(response);
    return {
      for (final json
          in (result['products'] as List).whereType<Map<String, dynamic>>())
        if (json['code'] is String)
          json['code'] as String: Product.fromJson(json),
    };
  }

  Future<Product> details(String code) async {
    final result = await OpenFoodAPIClient.getProductV3(
      ProductQueryConfiguration(
        code,
        version: ProductQueryVersion.v3,
        fields: [
          ProductField.BARCODE,
          ProductField.NAME,
          ProductField.NUTRIMENTS,
          ProductField.SERVING_QUANTITY,
          ProductField.SERVING_SIZE,
          ProductField.IMAGE_FRONT_URL,
          ProductField.IMAGE_FRONT_SMALL_URL,
        ],
      ),
    ).timeout(const Duration(seconds: 15));
    final product = result.product;
    if (product == null) throw StateError('Product not found');
    return product;
  }
}
