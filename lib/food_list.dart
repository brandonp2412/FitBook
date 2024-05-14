import 'package:fit_book/database.dart';
import 'package:fit_book/edit_food_page.dart';
import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  const FoodList({
    super.key,
    required this.foods,
    required this.selected,
    required this.onSelect,
    required this.onNext,
  });

  final List<Food> foods;
  final Set<int> selected;
  final Function(int) onSelect;
  final Function() onNext;

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels <
        _scrollController.position.maxScrollExtent - 200) return;
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.foods.length,
        itemBuilder: (context, index) {
          final food = widget.foods[index];
          final previous = index > 0 ? widget.foods[index - 1] : null;
          final showDivider = previous != null &&
              (food.favorite ?? false) != (previous.favorite ?? false);

          return Column(
            children: [
              if (showDivider) const Divider(),
              ListTile(
                title: Text(food.name),
                subtitle: Text(
                  "${food.calories?.toStringAsFixed(0)} kcal",
                ),
                selected: widget.selected.contains(food.id),
                onLongPress: () => widget.onSelect(food.id),
                onTap: () {
                  if (widget.selected.isEmpty)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFoodPage(
                          food: food,
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
