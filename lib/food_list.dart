import 'package:fit_book/database.dart';
import 'package:fit_book/edit_food_page.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  const FoodList({
    super.key,
    required this.foods,
    required this.selected,
    required this.onSelect,
  });

  final List<Food> foods;
  final Set<int> selected;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];

          return Column(
            children: [
              ListTile(
                title: Text(food.name),
                subtitle: Text(
                  "${food.calories?.toStringAsFixed(0)} kcal",
                ),
                selected: selected.contains(food.id),
                onLongPress: () => onSelect(food.id),
                onTap: () {
                  if (selected.isEmpty)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFoodPage(
                          food: food,
                        ),
                      ),
                    );
                  else
                    onSelect(food.id);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
