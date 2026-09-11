import 'package:fit_book/food/food_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('serving-size filter parser tolerates partial numeric input', () {
    expect(parseServingSizeFilter('.'), isNull);
    expect(parseServingSizeFilter('-'), isNull);
    expect(parseServingSizeFilter(''), isNull);
    expect(parseServingSizeFilter(' 1,234.5 '), 1234.5);
  });
}
