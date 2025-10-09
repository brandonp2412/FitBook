import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

import '../main.dart';

class FoodFilters extends StatefulWidget {
  const FoodFilters({
    super.key,
    this.servingUnit,
    required this.groupCtrl,
    required this.onChange,
    required this.servingSizeGtController,
    required this.servingSizeLtController,
  });

  final String? servingUnit;
  final TextEditingController groupCtrl;
  final TextEditingController servingSizeGtController;
  final TextEditingController servingSizeLtController;
  final Function({
    String? foodGroup,
    String? servingUnit,
  }) onChange;

  @override
  createState() => _FoodFiltersState();
}

class _FoodFiltersState extends State<FoodFilters> {
  var controller = TextEditingController();
  String? _servingUnit;

  @override
  void initState() {
    super.initState();
    _servingUnit = widget.servingUnit;
  }

  @override
  void didUpdateWidget(covariant FoodFilters oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.servingUnit != oldWidget.servingUnit) {
      _servingUnit = widget.servingUnit;
    }
  }

  int get filterCount =>
      (widget.groupCtrl.text.isNotEmpty == true ? 1 : 0) +
      (widget.servingSizeGtController.text.isNotEmpty ? 1 : 0) +
      (widget.servingSizeLtController.text.isNotEmpty ? 1 : 0) +
      (_servingUnit?.isNotEmpty == true ? 1 : 0);

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Filter Foods'),
        content: SingleChildScrollView(
          child: material.Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Autocomplete<String>(
                optionsMaxHeight: 300,
                optionsBuilder: (value) async {
                  if (value.text.isEmpty) return [];
                  final results = await (db.foods.selectOnly()
                        ..where(
                          db.foods.foodGroup.like('%${value.text}%') &
                              db.foods.foodGroup.isNotNull(),
                        )
                        ..addColumns([db.foods.foodGroup])
                        ..groupBy([db.foods.foodGroup]))
                      .get();
                  return results
                      .map((result) => result.read(db.foods.foodGroup)!);
                },
                onSelected: (option) async {
                  widget.groupCtrl.text = option;
                  widget.onChange(
                    foodGroup: option,
                    servingUnit: _servingUnit,
                  );
                },
                fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted,
                ) {
                  controller = textEditingController;
                  controller.text = widget.groupCtrl.text;
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Food group',
                      hintText: 'Fruit',
                    ),
                    controller: textEditingController,
                    focusNode: focusNode,
                    textCapitalization: TextCapitalization.sentences,
                    onFieldSubmitted: (String value) {
                      widget.onChange(
                        foodGroup: value,
                        servingUnit: _servingUnit,
                      );
                    },
                    textInputAction: TextInputAction.next,
                  );
                },
              ),
              DropdownButtonFormField<String>(
                initialValue: _servingUnit,
                decoration: const InputDecoration(
                  labelText: 'Serving unit',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                items: unitOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _servingUnit = newValue;
                  });
                  widget.onChange(
                    foodGroup: widget.groupCtrl.text,
                    servingUnit: newValue,
                  );
                },
              ),
              SizedBox(height: 8),
              TextField(
                controller: widget.servingSizeGtController,
                onChanged: (value) => widget.onChange(
                  foodGroup: widget.groupCtrl.text,
                  servingUnit: _servingUnit,
                ),
                decoration: const InputDecoration(
                  labelText: "Serving size greater than",
                  prefixIcon: Icon(Icons.chevron_right),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              TextField(
                controller: widget.servingSizeLtController,
                onChanged: (value) => widget.onChange(
                  foodGroup: widget.groupCtrl.text,
                  servingUnit: _servingUnit,
                ),
                decoration: const InputDecoration(
                  labelText: "Serving size less than",
                  prefixIcon: Icon(Icons.chevron_left),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              widget.servingSizeGtController.clear();
              widget.servingSizeLtController.clear();
              widget.groupCtrl.clear();
              setState(() {
                _servingUnit = null;
              });
              widget.onChange(
                foodGroup: null,
                servingUnit: null,
              );
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Clear All'),
          ),
          TextButton(
            onPressed: () {
              widget.onChange(
                foodGroup: widget.groupCtrl.text,
                servingUnit: _servingUnit,
              );
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      count: filterCount,
      backgroundColor: Theme.of(context).colorScheme.primary,
      isLabelVisible: filterCount > 0,
      child: IconButton(
        tooltip: 'Filter foods',
        icon: const Icon(Icons.filter_list),
        onPressed: _showFilterDialog,
      ),
    );
  }
}
