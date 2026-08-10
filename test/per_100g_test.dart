import 'package:fit_book/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('valuePer100g', () {
    test('normalizes gram servings', () {
      expect(
        valuePer100g(value: 250, servingSize: 125, servingUnit: 'grams'),
        200,
      );
    });

    test('converts serving units before normalizing', () {
      expect(
        valuePer100g(value: 100, servingSize: 2, servingUnit: 'ounces'),
        closeTo(176.37, 0.01),
      );
    });

    test('does not invent a gram weight for a serving or unit', () {
      expect(
        valuePer100g(value: 513, servingSize: 1, servingUnit: 'serving'),
        isNull,
      );
      expect(
        valuePer100g(value: 513, servingSize: 1, servingUnit: 'unit'),
        isNull,
      );
      expect(
        valuePer100g(value: 513, servingSize: 1, servingUnit: 'kilojoules'),
        isNull,
      );
    });
  });
}
