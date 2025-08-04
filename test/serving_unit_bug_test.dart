import 'package:fit_book/database/database.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Serving Unit Bug Fix Tests', () {
    test('convertCustomServing handles non-gram serving units correctly', () {
      // Create a food with ounces as the default serving unit
      final food = Food(
        id: 1,
        name: 'Test Food',
        servingSize: 1.0, // 1 ounce
        servingUnit: 'ounces',
        calories: 100.0,
        proteinG: 10.0,
        fatG: 5.0,
        carbohydrateG: 15.0,
      );

      // Test converting to "serving" unit with quantity 2
      final result = convertCustomServing(
        food: food,
        qty: 2.0,
        unit: 'serving',
      );

      // Should return 2x the original values since we want 2 servings
      expect(result.calories, equals(200.0));
      expect(result.proteinG, equals(20.0));
      expect(result.fatG, equals(10.0));
      expect(result.carbohydrateG, equals(30.0));
      expect(result.servingSize, equals(2.0));
      expect(result.servingUnit, equals('serving'));
    });

    test('convertCustomServing handles gram serving units correctly', () {
      // Create a food with grams as the default serving unit
      final food = Food(
        id: 2,
        name: 'Test Food Grams',
        servingSize: 100.0, // 100 grams
        servingUnit: 'grams',
        calories: 200.0,
        proteinG: 20.0,
        fatG: 10.0,
        carbohydrateG: 30.0,
      );

      // Test converting to "serving" unit with quantity 1.5
      final result = convertCustomServing(
        food: food,
        qty: 1.5,
        unit: 'serving',
      );

      // Should return 1.5x the original values
      expect(result.calories, equals(300.0));
      expect(result.proteinG, equals(30.0));
      expect(result.fatG, equals(15.0));
      expect(result.carbohydrateG, equals(45.0));
      expect(result.servingSize, equals(1.5));
      expect(result.servingUnit, equals('serving'));
    });

    test('convertCustomServing handles other units correctly', () {
      // Create a food with ounces as the default serving unit
      final food = Food(
        id: 3,
        name: 'Test Food Ounces',
        servingSize: 1.0, // 1 ounce
        servingUnit: 'ounces',
        calories: 100.0,
        proteinG: 10.0,
        fatG: 5.0,
        carbohydrateG: 15.0,
      );

      // Test converting to grams (1 ounce = 28.35 grams)
      final result = convertCustomServing(
        food: food,
        qty: 28.35,
        unit: 'grams',
      );

      // Should return the same values as the original since 28.35g = 1oz
      expect(result.calories, closeTo(100.0, 0.1));
      expect(result.proteinG, closeTo(10.0, 0.1));
      expect(result.fatG, closeTo(5.0, 0.1));
      expect(result.carbohydrateG, closeTo(15.0, 0.1));
      expect(result.servingSize, equals(28.35));
      expect(result.servingUnit, equals('grams'));
    });

    test('convertToGrams throws exception for serving unit', () {
      // convertToGrams should not handle 'serving' unit directly
      expect(
        () => convertToGrams(1.0, 'serving'),
        throwsException,
      );
    });

    test('convertFromGrams throws exception for serving unit', () {
      // convertFromGrams should not handle 'serving' unit directly
      expect(
        () => convertFromGrams(100.0, 'serving'),
        throwsException,
      );
    });
  });
}
