import 'dart:math';

import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class Macros {
  final double protein;
  final double fat;
  final double carb;
  final double calories;

  Macros({
    required this.protein,
    required this.fat,
    required this.carb,
    required this.calories,
  });
}

Macros getMacros(double amount, String unit) {
  // Convert to kg: lb -> kg conversion is divide by 2.2
  final kg = unit == 'lb' ? amount / 2.2 : amount;

  return Macros(
    carb: kg * 5,
    fat: kg * 0.8,
    protein: kg * 1.6,
    calories: kg * 27.5,
  );
}

String sentenceCase(String value) {
  if (value.isEmpty) return '';

  const specialCases = {
    '_18_3_n_3_c_c_c_ala_mg': 'Alpha-linolenic acid (ALA)',
    '_200_calorie_weight_g': '200-Calorie Equivalent Weight',
    '_20_5_n_3_epa_mg': 'Eicosapentaenoic acid (EPA)',
    '_22_5_n_3_dpa_mg': 'Docosapentaenoic acid (DPA)',
    '_22_6_n_3_dha_mg': 'Docosahexaenoic acid (DHA)',
    'vitamin_b_12_mcg': 'Vitamin B12 (Cobalamin)',
    'vitamin_a_iu_iu': 'Vitamin A (International Units)',
    'vitamin_d_iu_iu': 'Vitamin D (International Units)',
    'vitamin_a_rae_mcg': 'Vitamin A (Retinol Activity Equivalents)',
  };

  return specialCases[value] ??
      value[0].toUpperCase() + value.substring(1).replaceAll('_', ' ');
}

void toast(BuildContext context, String message, [SnackBarAction? action]) {
  final defaultAction = SnackBarAction(label: 'OK', onPressed: () {});

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.only(bottom: 89, left: 16, right: 16),
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      action: action ?? defaultAction,
    ),
  );
}

String getShortUnit(String unit) {
  const shortUnits = {
    'serving': 'srv',
    'grams': 'g',
    'milliliters': 'ml',
    'kilojoules': 'kJ',
    'cups': 'cup',
    'tablespoons': 'tbsp',
    'milligrams': 'mg',
    'teaspoons': 'tsp',
    'ounces': 'oz',
    'pounds': 'lb',
    'kilograms': 'kg',
    'liters': 'L',
  };
  return shortUnits[unit.toLowerCase()] ?? unit;
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

double convertFromGrams(double qtyInGrams, String targetUnit) {
  const conversionFactors = {
    'grams': 1.0,
    'milliliters': 1.0,
    'milligrams': 1000.0,
    'cups': 1.0 / 250,
    'tablespoons': 1.0 / 15,
    'teaspoons': 1.0 / 5,
    'ounces': 1.0 / 28.35,
    'pounds': 1.0 / 453.592,
    'liters': 1.0 / 1000,
    'kilojoules': 4.184,
  };

  if (targetUnit == 'serving') {
    throw Exception('Serving unit should be handled separately');
  }

  final factor = conversionFactors[targetUnit];
  if (factor == null) throw Exception('Unit not recognized');
  return qtyInGrams * factor;
}

Food convertCustomServing({
  required Food food, // This contains original per-serving values
  required double qty,
  required String unit,
}) {
  // Special case handling for 'serving' unit
  if (unit == 'serving') {
    // When user selects 'serving', we want to return the full nutritional values
    // multiplied by the quantity based on the food's original serving size
    return Food(
      id: food.id,
      name: food.name,
      servingSize: qty,
      servingUnit: unit,
      calories: (food.calories ?? 0) * qty,
      proteinG: (food.proteinG ?? 0) * qty,
      fatG: (food.fatG ?? 0) * qty,
      carbohydrateG: (food.carbohydrateG ?? 0) * qty,
      fiberG: (food.fiberG ?? 0) * qty,
    );
  }

  // For other units, proceed with the gram conversion logic
  // Get the original serving size in grams
  final originalServingSize = food.servingSize ?? 100;
  final originalServingUnit = food.servingUnit ?? 'grams';

  // Convert original serving size to grams, handling 'serving' unit properly
  double originalServingG;
  if (originalServingUnit == 'serving') {
    // If the original unit is 'serving', treat the serving size as grams
    originalServingG = originalServingSize;
  } else {
    originalServingG = convertToGrams(originalServingSize, originalServingUnit);
  }

  // Calculate per-gram values
  final calsPerGram = (food.calories ?? 0) / originalServingG;
  final proteinPerGram = (food.proteinG ?? 0) / originalServingG;
  final fatPerGram = (food.fatG ?? 0) / originalServingG;
  final carbPerGram = (food.carbohydrateG ?? 0) / originalServingG;
  final fiberPerGram = (food.fiberG ?? 0) / originalServingG;

  // Convert to the requested serving size
  final targetServingG = convertToGrams(qty, unit);

  return Food(
    id: food.id,
    name: food.name,
    servingSize: qty,
    servingUnit: unit,
    calories: calsPerGram * targetServingG,
    proteinG: proteinPerGram * targetServingG,
    fatG: fatPerGram * targetServingG,
    carbohydrateG: carbPerGram * targetServingG,
    fiberG: fiberPerGram * targetServingG,
  );
}

double convertToGrams(double qty, String unit) {
  const conversionFactors = {
    'grams': 1.0,
    'milliliters': 1.0,
    'milligrams': 1.0 / 1000,
    'cups': 250.0,
    'tablespoons': 15.0,
    'teaspoons': 5.0,
    'ounces': 28.35,
    'pounds': 453.592,
    'liters': 1000.0,
    'kilojoules': 1.0 / 4.184,
  };

  if (unit == 'serving') {
    throw Exception('Serving unit should be handled separately');
  }

  final factor = conversionFactors[unit];
  if (factor == null) throw Exception('Unit not recognized');
  return qty * factor;
}

void selectAll(TextEditingController ctrl) {
  ctrl.selection = TextSelection(
    baseOffset: 0,
    extentOffset: ctrl.text.length,
  );
}

bool shouldNotify(
  double lastWeight,
  double? secondLastWeight,
  double goalWeight,
) {
  if (secondLastWeight == null) return false;

  final trending = (secondLastWeight > lastWeight && lastWeight > goalWeight) ||
      (secondLastWeight < lastWeight && lastWeight < goalWeight);
  if (!trending) return false;

  final withinGoal =
      (goalWeight <= lastWeight && lastWeight - goalWeight <= 1) ||
          (goalWeight >= lastWeight && goalWeight - lastWeight <= 1);
  if (!withinGoal) return false;

  return Random().nextInt(100) < 30;
}

Value<double?> _getNutrimentValue(
  Nutriments? nutriments,
  Nutrient nutrient,
  PerSize perSize,
) {
  return Value(nutriments?.getValue(nutrient, perSize));
}

FoodsCompanion mapOpenFoodFacts(Product product, String foodUnit) {
  final perSize =
      foodUnit == 'serving' ? PerSize.serving : PerSize.oneHundredGrams;
  final servingSize =
      foodUnit == 'serving' ? product.servingQuantity ?? 1 : 100.0;
  final kj = product.nutriments?.getComputedKJ(perSize);

  return FoodsCompanion.insert(
    name: product.productName ?? "",
    servingSize: Value(servingSize),
    servingUnit: const Value('grams'),
    calories: Value((kj ?? 0) / 4.184),
    smallImage: Value(product.imageFrontSmallUrl),
    bigImage: Value(product.imageFrontUrl),
    proteinG:
        _getNutrimentValue(product.nutriments, Nutrient.proteins, perSize),
    fatG: _getNutrimentValue(product.nutriments, Nutrient.fat, perSize),
    carbohydrateG:
        _getNutrimentValue(product.nutriments, Nutrient.carbohydrates, perSize),
    sugarsG: _getNutrimentValue(product.nutriments, Nutrient.sugars, perSize),
    fiberG: _getNutrimentValue(product.nutriments, Nutrient.fiber, perSize),
    cholesterolMg:
        _getNutrimentValue(product.nutriments, Nutrient.cholesterol, perSize),
    saturatedFatsG:
        _getNutrimentValue(product.nutriments, Nutrient.saturatedFat, perSize),
    calciumMg:
        _getNutrimentValue(product.nutriments, Nutrient.calcium, perSize),
    ironFeMg: _getNutrimentValue(product.nutriments, Nutrient.iron, perSize),
    potassiumKMg:
        _getNutrimentValue(product.nutriments, Nutrient.potassium, perSize),
    magnesiumMg:
        _getNutrimentValue(product.nutriments, Nutrient.magnesium, perSize),
    vitaminAIuIu:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminA, perSize),
    vitaminCMg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminC, perSize),
    vitaminB12Mcg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB12, perSize),
    vitaminDMcg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminD, perSize),
    vitaminEAlphaTocopherolMg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminE, perSize),
    addedSugarG:
        _getNutrimentValue(product.nutriments, Nutrient.addedSugars, perSize),
    omega3sMg: _getNutrimentValue(product.nutriments, Nutrient.omega3, perSize),
    omega6sMg: _getNutrimentValue(product.nutriments, Nutrient.omega6, perSize),
    transFattyAcidsG:
        _getNutrimentValue(product.nutriments, Nutrient.transFat, perSize),
    solubleFiberG:
        _getNutrimentValue(product.nutriments, Nutrient.fiber, perSize),
    phosphorusPMg:
        _getNutrimentValue(product.nutriments, Nutrient.phosphorus, perSize),
    sodiumMg: _getNutrimentValue(product.nutriments, Nutrient.sodium, perSize),
    zincZnMg: _getNutrimentValue(product.nutriments, Nutrient.zinc, perSize),
    copperCuMg:
        _getNutrimentValue(product.nutriments, Nutrient.copper, perSize),
    manganeseMg:
        _getNutrimentValue(product.nutriments, Nutrient.manganese, perSize),
    seleniumSeMcg:
        _getNutrimentValue(product.nutriments, Nutrient.selenium, perSize),
    fluorideFMcg:
        _getNutrimentValue(product.nutriments, Nutrient.fluoride, perSize),
    thiaminB1Mg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB1, perSize),
    riboflavinB2Mg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB2, perSize),
    pantothenicAcidB5Mg: _getNutrimentValue(
      product.nutriments,
      Nutrient.pantothenicAcid,
      perSize,
    ),
    vitaminB6Mg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB6, perSize),
    biotinB7Mcg:
        _getNutrimentValue(product.nutriments, Nutrient.biotin, perSize),
    folateB9Mcg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB9, perSize),
    caroteneBetaMcg:
        _getNutrimentValue(product.nutriments, Nutrient.betaCarotene, perSize),
    vitaminDIuIu:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminD, perSize),
    vitaminKMcg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminK, perSize),
    fattyAcidsTotalMonounsaturatedMg: _getNutrimentValue(
      product.nutriments,
      Nutrient.monounsaturatedFat,
      perSize,
    ),
    fattyAcidsTotalPolyunsaturatedMg: _getNutrimentValue(
      product.nutriments,
      Nutrient.polyunsaturatedFat,
      perSize,
    ),
    alcoholG: _getNutrimentValue(product.nutriments, Nutrient.alcohol, perSize),
    caffeineMg:
        _getNutrimentValue(product.nutriments, Nutrient.caffeine, perSize),
  );
}
