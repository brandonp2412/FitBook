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

  double quantity100G;
  if (unit == 'kilojoules') {
    final grams = quantity / 4.184;
    quantity100G = grams / 100;
  } else if (unit == 'serving') {
    quantity100G = quantity;
  } else {
    quantity100G = convertToGrams(quantity, unit) / 100;
  }

  double servingWeight;
  if (food.servingWeight1G != null) {
    servingWeight = food.servingWeight1G!;
    if (food.servingUnit != 'grams') {
      servingWeight =
          convertToGrams(servingWeight, food.servingUnit ?? 'grams');
    }
  } else {
    servingWeight = 100;
  }

  final servingQuantity = quantity100G * servingWeight;

  final kCalories = servingQuantity * (food.calories ?? 100) / servingWeight;
  final proteinG = servingQuantity * (food.proteinG ?? 0) / servingWeight;
  final fatG = servingQuantity * (food.fatG ?? 0) / servingWeight;
  final carbG = servingQuantity * (food.carbohydrateG ?? 0) / servingWeight;

  entry = entry.copyWith(
    kCalories: Value(kCalories),
    fatG: Value(fatG),
    carbG: Value(carbG),
    proteinG: Value(proteinG),
  );

  return entry;
}

double convertToGrams(double quantity, String unit) {
  double quantityInGrams;

  switch (unit) {
    case 'grams':
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
    case 'milliliters':
      quantityInGrams = quantity; // Approximate conversion for water
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
