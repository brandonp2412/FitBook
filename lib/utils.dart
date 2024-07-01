import 'dart:math';

import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:flutter/material.dart';

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
  double secondLastWeight,
  double goalWeight,
) {
  Random random = Random();
  int chance = random.nextInt(100);

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
