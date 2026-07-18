import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/food/edit_meal_page.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FoodList extends StatefulWidget {
  const FoodList({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
    required this.onNext,
    required this.ctrl,
    this.selectedMeals = const {},
    this.onMealSelect,
    this.mealCalories = const {},
    this.onSavedNew,
  });

  /// Combined list of [FoodsCompanion] and [Meal] objects, already sorted.
  final List<Object> items;
  final Set<int> selected;
  final Set<int> selectedMeals;
  final ValueChanged<int> onSelect;
  final ValueChanged<int>? onMealSelect;
  final VoidCallback onNext;
  final ScrollController ctrl;
  final Map<int, double> mealCalories;

  /// Called after a new food is created (save-as or add-new), so the parent
  /// can scroll back to the top of the list.
  final VoidCallback? onSavedNew;

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final formatter = NumberFormat('#,##0');

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
    final width = MediaQuery.of(context).size.width;
    final hPad = width > 800 ? (width - 800) / 2 : 0.0;
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: appSearchHeight + 8,
          left: hPad,
          right: hPad,
          bottom: MediaQuery.paddingOf(context).bottom +
              BottomNav.totalOverlayHeight,
        ),
        controller: widget.ctrl,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];

          if (item is Meal) {
            return KeyedSubtree(
              key: ValueKey('meal_${item.id}'),
              child: _buildMealTile(context, item),
            );
          }

          final food = item as FoodsCompanion;
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

          return material.DecoratedBox(
            key: ValueKey('food_${food.id.value}'),
            decoration: BoxDecoration(
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
              tileColor: selected
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
                  : null,
              leading: image,
              title: Text(food.name.value),
              subtitle: () {
                final cal = food.calories.value ?? 0;
                final size = food.servingSize.value ?? 100;
                final calPer100g = size > 0 ? cal * 100 / size : cal;
                return Row(
                  children: [
                    Text("${formatter.format(cal)} kcal"),
                    if ((size - 100).abs() > 0.5)
                      Text(
                        " · ${formatter.format(calPer100g)}/100g",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
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
                );
              }(),
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
                      builder: (context) => EditFoodPage(
                        id: food.id.value,
                        onSavedNew: widget.onSavedNew,
                      ),
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

    return material.DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: selected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)
              : Colors.transparent,
          width: 1,
        ),
      ),
      child: ListTile(
        tileColor: selected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
            : null,
        leading: leading,
        title: Text(meal.name),
        subtitle: Text(
          widget.mealCalories.containsKey(meal.id)
              ? '${formatter.format(widget.mealCalories[meal.id])} kcal'
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
