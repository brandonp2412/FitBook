import 'dart:io';

import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/food/food_page.dart';
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
  });

  final List<PartialFood> foods;
  final Set<int> selected;
  final Function(int) onSelect;
  final Function() onNext;

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels <
        scrollController.position.maxScrollExtent - 200) return;
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.foods.length,
        itemBuilder: (context, index) {
          final food = widget.foods[index];
          final previous = index > 0 ? widget.foods[index - 1] : null;
          final showDivider = previous != null &&
              (food.favorite ?? false) != (previous.favorite ?? false);

          final shortUnit = getShortUnit(food.servingUnit ?? 'grams');

          final settings = context.watch<SettingsState>();

          Widget? image;
          if (settings.showImages) {
            if (food.imageFile?.isNotEmpty == true)
              image = Image.file(File(food.imageFile!));
            else if (food.smallImage?.isNotEmpty == true)
              image = Image.network(food.smallImage!);
          }

          return material.Column(
            children: [
              if (showDivider)
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Icon(Icons.favorite_outline),
                    Expanded(child: Divider()),
                  ],
                ),
              ListTile(
                title: Text(food.name),
                subtitle: Text(
                  "${food.calories?.toStringAsFixed(0)} kcal",
                ),
                trailing: Text(
                  "${food.servingSize?.toInt() ?? "100"} $shortUnit",
                  style: const TextStyle(fontSize: 16),
                ),
                leading: image,
                selected: widget.selected.contains(food.id),
                onLongPress: () => widget.onSelect(food.id),
                onTap: () {
                  if (widget.selected.isEmpty)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFoodPage(
                          id: food.id,
                        ),
                      ),
                    );
                  else
                    widget.onSelect(food.id);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
