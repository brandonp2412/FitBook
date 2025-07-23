import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/food/edit_food_page.dart';
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
  });

  final List<FoodsCompanion> foods;
  final Set<int> selected;
  final Function(int) onSelect;
  final Function() onNext;
  final ScrollController ctrl;

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
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8),
        controller: widget.ctrl,
        itemCount: widget.foods.length,
        itemBuilder: (context, index) {
          final food = widget.foods[index];
          final previous = index > 0 ? widget.foods[index - 1] : null;
          final selected = widget.selected.contains(food.id.value);
          final showDivider = previous != null &&
              (food.favorite.value ?? false) !=
                  (previous.favorite.value ?? false);

          final shortUnit = getShortUnit(food.servingUnit.value ?? 'grams');

          final settings = context.watch<SettingsState>().value;

          Widget? image;
          if (settings.showImages) {
            if (food.imageFile.value?.isNotEmpty == true)
              image = Image.file(File(food.imageFile.value!));
            else if (food.smallImage.value?.isNotEmpty == true)
              image = material.SizedBox(
                height: 80,
                width: 50,
                child: CachedNetworkImage(
                  imageUrl: food.smallImage.value!,
                ),
              );
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
                leading: image,
                title: Text(food.name.value),
                subtitle: Text(
                  "${food.calories.value?.toStringAsFixed(0) ?? 0} kcal",
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
                  if (widget.selected.isEmpty)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFoodPage(
                          id: food.id.value,
                        ),
                      ),
                    );
                  else
                    widget.onSelect(food.id.value);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
