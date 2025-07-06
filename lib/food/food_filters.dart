import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class FoodFilters extends StatefulWidget {
  const FoodFilters({
    super.key,
    this.foodGroup,
    this.servingUnit,
    required this.onChange,
    required this.servingSizeGtController,
    required this.servingSizeLtController,
  });

  final String? foodGroup;
  final String? servingUnit;
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
  late final groupStream = (db.foods.selectOnly(distinct: true)
        ..orderBy([
          OrderingTerm(expression: db.foods.foodGroup),
        ])
        ..where(db.foods.foodGroup.isNotNull())
        ..addColumns([db.foods.foodGroup]))
      .watch();

  int get filterCount =>
      (widget.foodGroup?.isNotEmpty == true ? 1 : 0) +
      (widget.servingSizeGtController.text.isNotEmpty ? 1 : 0) +
      (widget.servingSizeLtController.text.isNotEmpty ? 1 : 0) +
      (widget.servingUnit?.isNotEmpty == true ? 1 : 0);

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Filter Foods'),
        content: SingleChildScrollView(
          child: material.Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder(
                stream: groupStream,
                builder: (context, snapshot) {
                  return DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'Food group',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    value: widget.foodGroup,
                    items: snapshot.data
                        ?.map(
                          (result) => DropdownMenuItem(
                            value: result.read(db.foods.foodGroup)!,
                            child: Text(
                              result.read(db.foods.foodGroup)!,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      widget.onChange(
                        foodGroup: value,
                        servingUnit: widget.servingUnit,
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: widget.servingUnit,
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
                  widget.onChange(
                    foodGroup: widget.foodGroup,
                    servingUnit: newValue,
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.servingSizeGtController,
                      onChanged: (value) => widget.onChange(
                        foodGroup: widget.foodGroup,
                        servingUnit: widget.servingUnit,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Serving size >",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: widget.servingSizeLtController,
                      onChanged: (value) => widget.onChange(
                        foodGroup: widget.foodGroup,
                        servingUnit: widget.servingUnit,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Serving size <",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              widget.servingSizeGtController.clear();
              widget.servingSizeLtController.clear();
              widget.onChange(
                foodGroup: null,
                servingUnit: null,
              );
            },
            child: const Text('Clear All'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
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
