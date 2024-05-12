import 'package:fit_book/edit_entry_page.dart';
import 'package:fit_book/entries.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';

class EntryList extends StatelessWidget {
  const EntryList({
    super.key,
    required this.entryFoods,
    required this.selected,
    required this.onSelect,
  });

  final List<EntryWithFood> entryFoods;
  final Set<int> selected;
  final Function(int) onSelect;

  double convertToKcal(double quantity, String unit, double caloriesPer100g) {
    double quantityInGrams;
    switch (unit) {
      case 'grams':
        quantityInGrams = quantity;
        break;
      case 'milligrams':
        quantityInGrams = quantity / 1000;
        break;
      case 'kilograms':
        quantityInGrams = quantity * 1000;
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
    return (quantityInGrams / 100) * caloriesPer100g;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: entryFoods.length,
        itemBuilder: (context, index) {
          final entryFood = entryFoods[index];
          final food = entryFood.food;
          final entry = entryFood.entry;
          final previousEntryFood = index > 0 ? entryFoods[index - 1] : null;
          final showDivider = previousEntryFood != null &&
              !isSameDay(
                previousEntryFood.entry.created,
                entryFood.entry.created,
              );
          final kcal =
              convertToKcal(entry.quantity, entry.unit, food.calories ?? 0);

          return Column(
            children: [
              if (showDivider) const Divider(),
              ListTile(
                title: Text(food.name),
                subtitle: Text(entry.created.toString()),
                trailing: Text(
                  "$kcal kcal",
                  style: const TextStyle(fontSize: 16),
                ),
                selected: selected.contains(entry.id),
                onLongPress: () => onSelect(entry.id),
                onTap: () {
                  if (selected.isEmpty)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEntryPage(
                          entry: entry,
                          food: food,
                        ),
                      ),
                    );
                  else
                    onSelect(entry.id);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
