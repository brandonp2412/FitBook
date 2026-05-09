import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/food/edit_meal_page.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodList extends StatefulWidget {
  const FoodList({
    super.key,
    required this.foods,
    required this.selected,
    required this.onSelect,
    required this.onNext,
    required this.ctrl,
    this.meals = const [],
    this.selectedMeals = const {},
    this.onMealSelect,
    this.mealCalories = const {},
  });

  final List<FoodsCompanion> foods;
  final List<Meal> meals;
  final Set<int> selected;
  final Set<int> selectedMeals;
  final Function(int) onSelect;
  final Function(int)? onMealSelect;
  final Function() onNext;
  final ScrollController ctrl;
  final Map<int, double> mealCalories;

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  void initState() {
    super.initState();
    widget.ctrl.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.ctrl.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.ctrl.position.pixels <
        widget.ctrl.position.maxScrollExtent - 200) return;
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final mealCount = widget.meals.length;
    final totalCount = mealCount + widget.foods.length;

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8),
        controller: widget.ctrl,
        itemCount: totalCount,
        itemBuilder: (context, index) {
          if (index < mealCount) {
            final meal = widget.meals[index];
            return KeyedSubtree(
              key: ValueKey('meal_${meal.id}'),
              child: _buildMealTile(context, meal),
            );
          }

          final foodIndex = index - mealCount;
          final food = widget.foods[foodIndex];
          final selected = widget.selected.contains(food.id.value);

          final shortUnit = getShortUnit(food.servingUnit.value ?? 'grams');
          final settings = context.watch<SettingsState>().value;

          Widget? image;
          if (settings.showImages) {
            if (food.imageFile.value?.isNotEmpty == true)
              image = Image.file(
                File(food.imageFile.value!),
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              );
            else if (food.smallImage.value?.isNotEmpty == true)
              image = material.SizedBox(
                height: 80,
                width: 50,
                child: CachedNetworkImage(imageUrl: food.smallImage.value!),
              );
          }

          return material.Container(
            key: ValueKey('food_${food.id.value}'),
            decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
                  : Colors.transparent,
              border: Border.all(
                color: selected
                    ? Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.3)
                    : Colors.transparent,
                width: 1,
              ),
            ),
            child: ListTile(
              leading: image,
              title: Text(food.name.value),
              subtitle: Row(
                children: [
                  Text(
                    "${food.calories.value?.toStringAsFixed(0) ?? 0} kcal",
                  ),
                  if (food.favorite.value == true) ...[
                    const SizedBox(width: 6),
                    Icon(
                      Icons.favorite,
                      size: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ],
              ),
              trailing: Stack(
                children: [
                  AnimatedScale(
                    duration: const Duration(milliseconds: 150),
                    scale: selected ? 0.0 : 1.0,
                    child: Visibility(
                      visible: !selected,
                      child: Text(
                        "${food.servingSize.value?.toInt() ?? "100"} $shortUnit",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  AnimatedScale(
                    duration: const Duration(milliseconds: 150),
                    scale: selected ? 1.0 : 0.0,
                    child: Visibility(
                      visible: selected,
                      child: Checkbox(
                        value: selected,
                        onChanged: (_) => widget.onSelect(food.id.value),
                      ),
                    ),
                  ),
                ],
              ),
              onLongPress: () => widget.onSelect(food.id.value),
              onTap: () {
                if (widget.selected.isEmpty && widget.selectedMeals.isEmpty)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditFoodPage(id: food.id.value),
                    ),
                  );
                else
                  widget.onSelect(food.id.value);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildMealTile(BuildContext context, Meal meal) {
    final selected = widget.selectedMeals.contains(meal.id);
    final settings = context.watch<SettingsState>().value;

    Widget leading;
    if (settings.showImages && meal.imageFile?.isNotEmpty == true) {
      leading = Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.file(
                File(meal.imageFile!),
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.restaurant,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Positioned(
            right: -4,
            bottom: -4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Icons.restaurant, size: 10, color: Colors.white),
            ),
          ),
        ],
      );
    } else {
      leading = Icon(
        Icons.restaurant,
        color: Theme.of(context).colorScheme.primary,
      );
    }

    return material.Container(
      decoration: BoxDecoration(
        color: selected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
            : Colors.transparent,
        border: Border.all(
          color: selected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)
              : Colors.transparent,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: leading,
        title: Text(meal.name),
        subtitle: Text(
          widget.mealCalories.containsKey(meal.id)
              ? '${widget.mealCalories[meal.id]!.toStringAsFixed(0)} kcal'
              : 'Meal',
        ),
        trailing: selected
            ? Checkbox(
                value: true,
                onChanged: (_) => widget.onMealSelect?.call(meal.id),
              )
            : null,
        onLongPress: () => widget.onMealSelect?.call(meal.id),
        onTap: () {
          if (widget.selected.isEmpty && widget.selectedMeals.isEmpty)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditMealPage(id: meal.id),
              ),
            );
          else
            widget.onMealSelect?.call(meal.id);
        },
      ),
    );
  }
}
