import 'package:fit_book/food/food_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  test('serving-size filter parser tolerates partial numeric input', () {
    final formatter = NumberFormat.decimalPattern('en');
    expect(parseServingSizeFilter('.', formatter), isNull);
    expect(parseServingSizeFilter('-', formatter), isNull);
    expect(parseServingSizeFilter('', formatter), isNull);
    expect(parseServingSizeFilter(' 1,234.5 ', formatter), 1234.5);
  });

  test('serving-size filter parser respects locale separators', () {
    final formatter = NumberFormat.decimalPattern('de');
    expect(parseServingSizeFilter('1.234,5', formatter), 1234.5);
    expect(parseServingSizeFilter('12,75', formatter), 12.75);
  });
}
