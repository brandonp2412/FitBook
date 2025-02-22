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
  var kg = amount;
  if (unit == 'lb') kg *= 2.2;

  /*
    Phillips SM, Van Loon LJ. (2011). 
    Dietary protein for athletes: from requirements to optimum adaptation. 
    Journal of Sports Sciences, 29(sup1), S29–S38. 
    https://doi.org/10.1080/02640414.2011.619204
    
    Institute of Medicine. (2005). 
    Dietary Reference Intakes for Energy, Carbohydrate, Fiber, Fat, Fatty Acids, Cholesterol, Protein, and Amino Acids. 
    The National Academies Press. 
    https://www.nap.edu/catalog/10490/dietary-reference-intakes-for-energy-carbohydrate-fiber-fat-fatty-acids-cholesterol-protein-and-amino-acids
  */
  return Macros(
    carb: kg * 5,
    fat: kg * 0.8,
    protein: kg * 1.6,
    calories: kg * 27.5,
  );
}

String sentenceCase(String value) {
  if (value.isEmpty) return '';
  if (value == '_18_3_n_3_c_c_c_ala_mg')
    return 'Alpha-linolenic acid (ALA)';
  else if (value == '_200_calorie_weight_g')
    return '200-Calorie Equivalent Weight';
  else if (value == '_20_5_n_3_epa_mg')
    return 'Eicosapentaenoic acid (EPA)';
  else if (value == '_22_5_n_3_dpa_mg')
    return 'Docosapentaenoic acid (DPA)';
  else if (value == '_22_6_n_3_dha_mg')
    return 'Docosahexaenoic acid (DHA)';
  else if (value == 'vitamin_b_12_mcg')
    return 'Vitamin B12 (Cobalamin)';
  else if (value == 'vitamin_a_iu_iu')
    return 'Vitamin A (International Units)';
  else if (value == 'vitamin_d_iu_iu')
    return 'Vitamin D (International Units)';
  else if (value == 'vitamin_a_rae_mcg')
    return 'Vitamin A (Retinol Activity Equivalents)';

  return value[0].toUpperCase() + value.substring(1).replaceAll('_', ' ');
}

void toast(BuildContext context, String message, [SnackBarAction? action]) {
  final defaultAction = SnackBarAction(label: 'OK', onPressed: () {});

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
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

FoodsCompanion mapOpenFoodFacts(Product product, String foodUnit) {
  var perSize = PerSize.oneHundredGrams;
  var servingSize = 100.0;
  if (foodUnit == 'serving') {
    servingSize = product.servingQuantity ?? 1;
    perSize = PerSize.serving;
  }

  final kj = product.nutriments?.getComputedKJ(
    perSize,
  );

  return FoodsCompanion.insert(
    name: product.productName ?? "",
    servingSize: Value(servingSize),
    servingUnit: const Value('grams'),
    calories: Value((kj ?? 0) / 4.184),
    smallImage: Value(product.imageFrontSmallUrl),
    bigImage: Value(product.imageFrontUrl),
    proteinG: Value(
      product.nutriments?.getValue(
        Nutrient.proteins,
        perSize,
      ),
    ),
    fatG: Value(
      product.nutriments?.getValue(
        Nutrient.fat,
        perSize,
      ),
    ),
    carbohydrateG: Value(
      product.nutriments?.getValue(
        Nutrient.carbohydrates,
        perSize,
      ),
    ),
    sugarsG: Value(
      product.nutriments?.getValue(
        Nutrient.sugars,
        perSize,
      ),
    ),
    fiberG: Value(
      product.nutriments?.getValue(
        Nutrient.fiber,
        perSize,
      ),
    ),
    cholesterolMg: Value(
      product.nutriments?.getValue(
        Nutrient.cholesterol,
        perSize,
      ),
    ),
    saturatedFatsG: Value(
      product.nutriments?.getValue(
        Nutrient.saturatedFat,
        perSize,
      ),
    ),
    calciumMg: Value(
      product.nutriments?.getValue(
        Nutrient.calcium,
        perSize,
      ),
    ),
    ironFeMg: Value(
      product.nutriments?.getValue(
        Nutrient.iron,
        perSize,
      ),
    ),
    potassiumKMg: Value(
      product.nutriments?.getValue(
        Nutrient.potassium,
        perSize,
      ),
    ),
    magnesiumMg: Value(
      product.nutriments?.getValue(
        Nutrient.magnesium,
        perSize,
      ),
    ),
    vitaminAIuIu: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminA,
        perSize,
      ),
    ),
    vitaminCMg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminC,
        perSize,
      ),
    ),
    vitaminB12Mcg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB12,
        perSize,
      ),
    ),
    vitaminDMcg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminD,
        perSize,
      ),
    ),
    vitaminEAlphaTocopherolMg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminE,
        perSize,
      ),
    ),
    addedSugarG: Value(
      product.nutriments?.getValue(
        Nutrient.addedSugars,
        perSize,
      ),
    ),
    omega3sMg: Value(
      product.nutriments?.getValue(
        Nutrient.omega3,
        perSize,
      ),
    ),
    omega6sMg: Value(
      product.nutriments?.getValue(
        Nutrient.omega6,
        perSize,
      ),
    ),
    transFattyAcidsG: Value(
      product.nutriments?.getValue(
        Nutrient.transFat,
        perSize,
      ),
    ),
    solubleFiberG: Value(
      product.nutriments?.getValue(
        Nutrient.fiber,
        perSize,
      ),
    ),
    phosphorusPMg: Value(
      product.nutriments?.getValue(
        Nutrient.phosphorus,
        perSize,
      ),
    ),
    sodiumMg: Value(
      product.nutriments?.getValue(
        Nutrient.sodium,
        perSize,
      ),
    ),
    zincZnMg: Value(
      product.nutriments?.getValue(
        Nutrient.zinc,
        perSize,
      ),
    ),
    copperCuMg: Value(
      product.nutriments?.getValue(
        Nutrient.copper,
        perSize,
      ),
    ),
    manganeseMg: Value(
      product.nutriments?.getValue(
        Nutrient.manganese,
        perSize,
      ),
    ),
    seleniumSeMcg: Value(
      product.nutriments?.getValue(
        Nutrient.selenium,
        perSize,
      ),
    ),
    fluorideFMcg: Value(
      product.nutriments?.getValue(
        Nutrient.fluoride,
        perSize,
      ),
    ),
    thiaminB1Mg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB1,
        perSize,
      ),
    ),
    riboflavinB2Mg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB2,
        perSize,
      ),
    ),
    pantothenicAcidB5Mg: Value(
      product.nutriments?.getValue(
        Nutrient.pantothenicAcid,
        perSize,
      ),
    ),
    vitaminB6Mg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB6,
        perSize,
      ),
    ),
    biotinB7Mcg: Value(
      product.nutriments?.getValue(
        Nutrient.biotin,
        perSize,
      ),
    ),
    folateB9Mcg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminB9,
        perSize,
      ),
    ),
    caroteneBetaMcg: Value(
      product.nutriments?.getValue(
        Nutrient.betaCarotene,
        perSize,
      ),
    ),
    vitaminDIuIu: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminD,
        perSize,
      ),
    ),
    vitaminKMcg: Value(
      product.nutriments?.getValue(
        Nutrient.vitaminK,
        perSize,
      ),
    ),
    fattyAcidsTotalMonounsaturatedMg: Value(
      product.nutriments?.getValue(
        Nutrient.monounsaturatedFat,
        perSize,
      ),
    ),
    fattyAcidsTotalPolyunsaturatedMg: Value(
      product.nutriments?.getValue(
        Nutrient.polyunsaturatedFat,
        perSize,
      ),
    ),
    alcoholG: Value(
      product.nutriments?.getValue(
        Nutrient.alcohol,
        perSize,
      ),
    ),
    caffeineMg: Value(
      product.nutriments?.getValue(
        Nutrient.caffeine,
        perSize,
      ),
    ),
  );
}
