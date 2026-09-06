import 'package:fit_book/database/database.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Serving Unit Bug Fix Tests', () {
    test('convertCustomServing handles non-gram serving units correctly', () {
      final food = Food(
        id: 1,
        name: 'Test Food',
        servingSize: 1.0,
        servingUnit: 'ounces',
        calories: 100.0,
        proteinG: 10.0,
        fatG: 5.0,
        carbohydrateG: 15.0,
      );

      final result = convertCustomServing(
        food: food,
        qty: 2.0,
        unit: 'serving',
      );

      expect(result.calories, equals(200.0));
      expect(result.proteinG, equals(20.0));
      expect(result.fatG, equals(10.0));
      expect(result.carbohydrateG, equals(30.0));
      expect(result.servingSize, equals(2.0));
      expect(result.servingUnit, equals('serving'));
    });

    test('convertCustomServing handles gram serving units correctly', () {
      final food = Food(
        id: 2,
        name: 'Test Food Grams',
        servingSize: 100.0,
        servingUnit: 'grams',
        calories: 200.0,
        proteinG: 20.0,
        fatG: 10.0,
        carbohydrateG: 30.0,
      );

      final result = convertCustomServing(
        food: food,
        qty: 1.5,
        unit: 'serving',
      );

      expect(result.calories, equals(300.0));
      expect(result.proteinG, equals(30.0));
      expect(result.fatG, equals(15.0));
      expect(result.carbohydrateG, equals(45.0));
      expect(result.servingSize, equals(1.5));
      expect(result.servingUnit, equals('serving'));
    });

    test('convertCustomServing handles other units correctly', () {
      final food = Food(
        id: 3,
        name: 'Test Food Ounces',
        servingSize: 1.0,
        servingUnit: 'ounces',
        calories: 100.0,
        proteinG: 10.0,
        fatG: 5.0,
        carbohydrateG: 15.0,
      );

      final result = convertCustomServing(
        food: food,
        qty: 28.35,
        unit: 'grams',
      );

      expect(result.calories, closeTo(100.0, 0.1));
      expect(result.proteinG, closeTo(10.0, 0.1));
      expect(result.fatG, closeTo(5.0, 0.1));
      expect(result.carbohydrateG, closeTo(15.0, 0.1));
      expect(result.servingSize, equals(28.35));
      expect(result.servingUnit, equals('grams'));
    });

    test('convertToGrams throws exception for serving unit', () {
      expect(() => convertToGrams(1.0, 'serving'), throwsException);
    });

    test('convertFromGrams throws exception for serving unit', () {
      expect(() => convertFromGrams(100.0, 'serving'), throwsException);
    });
  });
}
