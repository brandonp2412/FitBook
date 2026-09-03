import 'package:fit_book/app_search.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/food/edit_meal_page.dart';
import 'package:fit_book/food/food_item_row.dart';
import 'package:fit_book/food/meal_row.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// A food plus the latest diary entry that used it. The food page uses this
/// to keep a stable creation-date ordering while breaking ties by use.
class FoodListFood {
  const FoodListFood({required this.food, this.lastDiaryEntry});

  final FoodsCompanion food;
  final DateTime? lastDiaryEntry;
}

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

  /// Combined list of [FoodListFood] and [Meal] objects, already sorted.
  final List<Object> items;
  final Set<int> selected;
  final Set<int> selectedMeals;
  final ValueChanged<int> onSelect;
  final ValueChanged<int>? onMealSelect;
  final VoidCallback onNext;
  final ScrollController ctrl;
  final Map<int, ({double calories, double protein})> mealCalories;

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
    final settings = context.watch<SettingsState>().value;

    final children = <Widget>[];
    for (final item in widget.items) {
      if (item is Meal) {
        children.add(
          KeyedSubtree(
            key: ValueKey('meal_${item.id}'),
            child: MealRow(
              meal: item,
              isSelected: widget.selectedMeals.contains(item.id),
              showImages: settings.showImages,
              formatter: formatter,
              totals: widget.mealCalories[item.id],
              onTap: () {
                if (widget.selected.isEmpty && widget.selectedMeals.isEmpty)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditMealPage(id: item.id),
                    ),
                  );
                else
                  widget.onMealSelect?.call(item.id);
              },
              onLongPress: () => widget.onMealSelect?.call(item.id),
            ),
          ),
        );
        continue;
      }

      final food = (item as FoodListFood).food;
      final isSelected = widget.selected.contains(food.id.value);

      children.add(
        FoodItemRow(
          food: food,
          isSelected: isSelected,
          showImages: settings.showImages,
          formatter: formatter,
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
          onLongPress: () => widget.onSelect(food.id.value),
        ),
      );
    }

    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(
          top: appSearchHeight + 16,
          bottom: navigationBottomClearance(context),
        ),
        controller: widget.ctrl,
        children: children,
      ),
    );
  }
}
