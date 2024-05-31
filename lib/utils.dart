import 'package:drift/drift.dart';
import 'package:fit_book/database.dart';
import 'package:flutter/material.dart';

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
    food.servingWeight1G ?? 100,
    food.servingUnit ?? 'grams',
  );

  var quantityG = 0.0;
  if (unit == 'serving')
    quantityG = quantity * (food.servingWeight1G ?? 100);
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
    case 'milliliters':
      quantityInGrams = quantity;
      break;
    case 'milligrams':
      quantityInGrams = quantity / 1000;
      break;
    case 'cups':
      quantityInGrams = quantity * 201; // Approximate conversion for water
      break;
    case 'tablespoons':
      quantityInGrams = quantity * 14.3; // Approximate conversion for water
      break;
    case 'teaspoons':
      quantityInGrams = quantity * 4.8; // Approximate conversion for water
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
