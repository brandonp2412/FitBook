bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

double convertToKcal(double quantity, String unit, double caloriesPer100g) {
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
    case 'kilojoules':
      return quantity / 4.184;
    default:
      throw Exception('Unit not recognized');
  }

  return (quantityInGrams / 100) * caloriesPer100g;
}
