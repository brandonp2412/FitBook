import 'dart:async';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

String getShortUnit(String unit) {
  switch (unit.toLowerCase()) {
    case 'serving':
      return 'srv';
    case 'grams':
      return 'g';
    case 'milliliters':
      return 'ml';
    case 'kilojoules':
      return 'kJ';
    case 'cups':
      return 'cup';
    case 'tablespoons':
      return 'tbsp';
    case 'milligrams':
      return 'mg';
    case 'teaspoons':
      return 'tsp';
    case 'ounces':
      return 'oz';
    case 'pounds':
      return 'lb';
    case 'kilograms':
      return 'kg';
    case 'liters':
      return 'L';
    default:
      return unit; // Return the original unit if no short form is defined
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

EntriesCompanion calculateEntry({
  required Food food,
  required double quantity,
  required String unit,
}) {
  var entry = EntriesCompanion(
    food: Value(food.id),
    quantity: Value(quantity),
    unit: Value(unit),
  );

  final servingG = convertToGrams(
    food.servingSize ?? 100,
    food.servingUnit ?? 'grams',
  );

  var quantityG = 0.0;
  if (unit == 'serving')
    quantityG = quantity * servingG;
  else
    quantityG = convertToGrams(quantity, unit);

  final caloriesG = (food.calories ?? 0) / servingG;
  final proteinG = (food.proteinG ?? 0) / servingG;
  final fatG = (food.fatG ?? 0) / servingG;
  final carbG = (food.carbohydrateG ?? 0) / servingG;

  return entry.copyWith(
    kCalories: Value(quantityG * caloriesG),
    fatG: Value(quantityG * fatG),
    carbG: Value(quantityG * carbG),
    proteinG: Value(quantityG * proteinG),
  );
}

double convertToGrams(double quantity, String unit) {
  double quantityInGrams;

  switch (unit) {
    case 'grams':
    case 'serving':
    case 'milliliters':
      quantityInGrams = quantity;
      break;
    case 'milligrams':
      quantityInGrams = quantity / 1000;
      break;
    case 'cups':
      quantityInGrams = quantity * 250; // Metric system
      break;
    case 'tablespoons':
      quantityInGrams = quantity * 15;
      break;
    case 'teaspoons':
      quantityInGrams = quantity * 5;
      break;
    case 'ounces':
      quantityInGrams = quantity * 28.35; // Exact conversion
      break;
    case 'pounds':
      quantityInGrams = quantity * 453.592; // Exact conversion
      break;
    case 'liters':
      quantityInGrams = quantity * 1000; // Approximate conversion for water
      break;
    case 'kilojoules':
      quantityInGrams = quantity / 4.184;
      break;
    default:
      throw Exception('Unit not recognized');
  }

  return quantityInGrams;
}

void selectAll(TextEditingController controller) {
  controller.selection = TextSelection(
    baseOffset: 0,
    extentOffset: controller.text.length,
  );
}

bool shouldNotify(
  double lastWeight,
  double? secondLastWeight,
  double goalWeight,
) {
  Random random = Random();
  int chance = random.nextInt(100);

  if (secondLastWeight == null) return false;
  bool trending = (secondLastWeight > lastWeight && lastWeight > goalWeight) ||
      (secondLastWeight < lastWeight && lastWeight < goalWeight);

  if (!trending) {
    return false;
  }

  if ((goalWeight <= lastWeight && goalWeight - lastWeight > 1) ||
      (goalWeight >= lastWeight && lastWeight - goalWeight > 1)) {
    return false;
  }

  if (chance >= 30) {
    return false;
  }

  return true;
}

typedef Debounceable<S, T> = Future<S?> Function(T parameter);

/// Returns a new function that is a debounced version of the given function.
///
/// This means that the original function will be called only after no calls
/// have been made for the given Duration.
Debounceable<S, T> debounce<S, T>(Debounceable<S?, T> function) {
  _DebounceTimer? debounceTimer;

  return (T parameter) async {
    if (debounceTimer != null && !debounceTimer!.isCompleted) {
      debounceTimer!.cancel();
    }
    debounceTimer = _DebounceTimer();
    try {
      await debounceTimer!.future;
    } catch (error) {
      if (error is _CancelException) {
        return null;
      }
      rethrow;
    }
    return function(parameter);
  };
}

// A wrapper around Timer used for debouncing.
class _DebounceTimer {
  _DebounceTimer() {
    _timer = Timer(const Duration(milliseconds: 500), _onComplete);
  }

  late final Timer _timer;
  final Completer<void> _completer = Completer<void>();

  void _onComplete() {
    _completer.complete();
  }

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    _completer.completeError(const _CancelException());
  }
}

// An exception indicating that the timer was canceled.
class _CancelException implements Exception {
  const _CancelException();
}

FoodsCompanion mapOpenFoodFacts(Product product) {
  final kj = product.nutriments?.getComputedKJ(
    PerSize.oneHundredGrams,
  );

  return FoodsCompanion.insert(
    name: product.productName ?? "",
    servingSize: const Value(100),
    servingUnit: const Value('grams'),
    calories: Value((kj ?? 0) / 4.184),
    smallImage: Value(product.imageFrontSmallUrl),
    bigImage: Value(product.imageFrontUrl),
    proteinG: Value(
      product.nutriments?.getValue(
        Nutrient.proteins,
        PerSize.oneHundredGrams,
      ),
    ),
    fatG: Value(
      product.nutriments?.getValue(
        Nutrient.fat,
        PerSize.oneHundredGrams,
      ),
    ),
    carbohydrateG: Value(
      product.nutriments?.getValue(
        Nutrient.carbohydrates,
        PerSize.oneHundredGrams,
      ),
    ),
    sugarsG: Value(
      product.nutriments?.getValue(
        Nutrient.sugars,
        PerSize.oneHundredGrams,
      ),
    ),
    fiberG: Value(
      product.nutriments?.getValue(
        Nutrient.fiber,
        PerSize.oneHundredGrams,
      ),
    ),
    cholesterolMg: Value(
      product.nutriments?.getValue(
        Nutrient.cholesterol,
        PerSize.oneHundredGrams,
      ),
    ),
    saturatedFatsG: Value(
      product.nutriments?.getValue(
        Nutrient.saturatedFat,
        PerSize.oneHundredGrams,
      ),
    ),
    calciumMg: Value(
      product.nutriments?.getValue(
        Nutrient.calcium,
        PerSize.oneHundredGrams,
      ),
    ),
    ironFeMg: Value(
      product.nutriments?.getValue(
        Nutrient.iron,
        PerSize.oneHundredGrams,
      ),
    ),
    potassiumKMg: Value(
      product.nutriments?.getValue(
        Nutrient.potassium,
        PerSize.oneHundredGrams,
      ),
    ),
    magnesiumMg: Value(
      product.nutriments?.getValue(
        Nutrient.magnesium,
        PerSize.oneHundredGrams,
      ),
    ),
    vitaminAIuIu: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminA,
        PerSize.oneHundredGrams,
      ),
    ),
    vitaminCMg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminC,
        PerSize.oneHundredGrams,
      ),
    ),
    vitaminB12Mcg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB12,
        PerSize.oneHundredGrams,
      ),
    ),
    vitaminDMcg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminD,
        PerSize.oneHundredGrams,
      ),
    ),
    vitaminEAlphaTocopherolMg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminE,
        PerSize.oneHundredGrams,
      ),
    ),
    addedSugarG: Value(
      product.nutriments?.getValue(
        Nutrient.addedSugars,
        PerSize.oneHundredGrams,
      ),
    ),
    omega3sMg: Value(
      product.nutriments?.getValue(
        Nutrient.omega3,
        PerSize.oneHundredGrams,
      ),
    ),
    omega6sMg: Value(
      product.nutriments?.getValue(
        Nutrient.omega6,
        PerSize.oneHundredGrams,
      ),
    ),
    transFattyAcidsG: Value(
      product.nutriments?.getValue(
        Nutrient.transFat,
        PerSize.oneHundredGrams,
      ),
    ),
    solubleFiberG: Value(
      product.nutriments?.getValue(
        Nutrient.fiber,
        PerSize.oneHundredGrams,
      ),
    ),
    phosphorusPMg: Value(
      product.nutriments?.getValue(
        Nutrient.phosphorus,
        PerSize.oneHundredGrams,
      ),
    ),
    sodiumMg: Value(
      product.nutriments?.getValue(
        Nutrient.sodium,
        PerSize.oneHundredGrams,
      ),
    ),
    zincZnMg: Value(
      product.nutriments?.getValue(
        Nutrient.zinc,
        PerSize.oneHundredGrams,
      ),
    ),
    copperCuMg: Value(
      product.nutriments?.getValue(
        Nutrient.copper,
        PerSize.oneHundredGrams,
      ),
    ),
    manganeseMg: Value(
      product.nutriments?.getValue(
        Nutrient.manganese,
        PerSize.oneHundredGrams,
      ),
    ),
    seleniumSeMcg: Value(
      product.nutriments?.getValue(
        Nutrient.selenium,
        PerSize.oneHundredGrams,
      ),
    ),
    fluorideFMcg: Value(
      product.nutriments?.getValue(
        Nutrient.fluoride,
        PerSize.oneHundredGrams,
      ),
    ),
    thiaminB1Mg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB1,
        PerSize.oneHundredGrams,
      ),
    ),
    riboflavinB2Mg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB2,
        PerSize.oneHundredGrams,
      ),
    ),
    pantothenicAcidB5Mg: Value(
      product.nutriments?.getValue(
        Nutrient.pantothenicAcid,
        PerSize.oneHundredGrams,
      ),
    ),
    vitaminB6Mg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB6,
        PerSize.oneHundredGrams,
      ),
    ),
    biotinB7Mcg: Value(
      product.nutriments?.getValue(
        Nutrient.biotin,
        PerSize.oneHundredGrams,
      ),
    ),
    folateB9Mcg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB9,
        PerSize.oneHundredGrams,
      ),
    ),
    caroteneBetaMcg: Value(
      product.nutriments?.getValue(
        Nutrient.betaCarotene,
        PerSize.oneHundredGrams,
      ),
    ),
    vitaminDIuIu: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminD,
        PerSize.oneHundredGrams,
      ),
    ),
    vitaminKMcg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminK,
        PerSize.oneHundredGrams,
      ),
    ),
    fattyAcidsTotalMonounsaturatedMg: Value(
      product.nutriments?.getValue(
        Nutrient.monounsaturatedFat,
        PerSize.oneHundredGrams,
      ),
    ),
    fattyAcidsTotalPolyunsaturatedMg: Value(
      product.nutriments?.getValue(
        Nutrient.polyunsaturatedFat,
        PerSize.oneHundredGrams,
      ),
    ),
    alcoholG: Value(
      product.nutriments?.getValue(
        Nutrient.alcohol,
        PerSize.oneHundredGrams,
      ),
    ),
    caffeineMg: Value(
      product.nutriments?.getValue(
        Nutrient.caffeine,
        PerSize.oneHundredGrams,
      ),
    ),
  );
}
