import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/l10n/l10n.dart';
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
    required String? foodGroup,
    required String? servingUnit,
  }) onChange;

  @override
  State<FoodFilters> createState() => _FoodFiltersState();
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
        icon: const Icon(Icons.tune),
        title: Text(dialogContext.l10n.filterFoods),
        contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: SingleChildScrollView(
            child: material.Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  dialogContext.l10n.narrowFoodsFilters,
                  style: Theme.of(dialogContext).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(dialogContext)
                            .colorScheme
                            .onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 24),
                _SectionLabel(
                  icon: Icons.restaurant_menu,
                  title: dialogContext.l10n.foodDetails,
                ),
                const SizedBox(height: 12),
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
                        labelText: dialogContext.l10n.foodGroup,
                        hintText: dialogContext.l10n.exampleFruitHint,
                        prefixIcon: const Icon(Icons.category_outlined),
                        border: const OutlineInputBorder(),
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
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _servingUnit,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: dialogContext.l10n.servingUnit,
                    prefixIcon: const Icon(Icons.straighten),
                    border: const OutlineInputBorder(),
                  ),
                  items: unitOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(localizedUnit(dialogContext.l10n, value)),
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
                const SizedBox(height: 24),
                _SectionLabel(
                  icon: Icons.numbers,
                  title: dialogContext.l10n.servingSize,
                ),
                const SizedBox(height: 4),
                Text(
                  dialogContext.l10n.servingSizeRangeHint,
                  style: Theme.of(dialogContext).textTheme.bodySmall?.copyWith(
                        color: Theme.of(dialogContext)
                            .colorScheme
                            .onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 12),
                if (MediaQuery.sizeOf(dialogContext).width < 500)
                  material.Column(
                    children: [
                      _ServingSizeField(
                        controller: widget.servingSizeGtController,
                        label: dialogContext.l10n.minimum,
                        hint: dialogContext.l10n.noMinimum,
                        onChanged: _notifyChange,
                      ),
                      const SizedBox(height: 12),
                      _ServingSizeField(
                        controller: widget.servingSizeLtController,
                        label: dialogContext.l10n.maximum,
                        hint: dialogContext.l10n.noMaximum,
                        onChanged: _notifyChange,
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: _ServingSizeField(
                          controller: widget.servingSizeGtController,
                          label: dialogContext.l10n.minimum,
                          hint: dialogContext.l10n.noMinimum,
                          onChanged: _notifyChange,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ServingSizeField(
                          controller: widget.servingSizeLtController,
                          label: dialogContext.l10n.maximum,
                          hint: dialogContext.l10n.noMaximum,
                          onChanged: _notifyChange,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
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
            child: Text(dialogContext.l10n.clearAll),
          ),
          FilledButton(
            onPressed: () {
              final groupChanged = controller.text != widget.groupCtrl.text;
              widget.groupCtrl.text = controller.text;
              if (groupChanged) {
                widget.onChange(
                  foodGroup: controller.text,
                  servingUnit: _servingUnit,
                );
              }
              Navigator.of(dialogContext).pop();
            },
            child: Text(dialogContext.l10n.done),
          ),
        ],
      ),
    );
  }

  void _notifyChange(String value) {
    widget.onChange(
      foodGroup: widget.groupCtrl.text,
      servingUnit: _servingUnit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      count: filterCount,
      backgroundColor: Theme.of(context).colorScheme.primary,
      isLabelVisible: filterCount > 0,
      child: IconButton(
        tooltip: context.l10n.filterFoods,
        icon: const Icon(Icons.filter_list),
        onPressed: _showFilterDialog,
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(icon, size: 18, color: colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}

class _ServingSizeField extends StatelessWidget {
  const _ServingSizeField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
