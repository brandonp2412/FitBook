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

  @override
  Widget build(BuildContext context) {
    String? servingSize;
    if (widget.servingSizeGtController.text.isNotEmpty)
      servingSize = '> ${widget.servingSizeGtController.text} ';
    if (widget.servingSizeLtController.text.isNotEmpty)
      servingSize =
          '${servingSize ?? ''}< ${widget.servingSizeLtController.text}';

    return Badge.count(
      count: filterCount,
      backgroundColor: Theme.of(context).colorScheme.primary,
      isLabelVisible: filterCount > 0,
      child: PopupMenuButton(
        tooltip: 'Filter foods',
        icon: const Icon(Icons.filter_list),
        itemBuilder: (popupContext) => [
          PopupMenuItem(
            child: StreamBuilder(
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
                    Navigator.pop(popupContext);
                  },
                );
              },
            ),
          ),
          PopupMenuItem(
            child: DropdownButtonFormField<String>(
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
          ),
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.coffee),
              title: const Text("Serving size"),
              subtitle: servingSize != null ? Text(servingSize) : null,
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Serving size filter"),
                    content: SingleChildScrollView(
                      child: material.Column(
                        children: [
                          TextField(
                            controller: widget.servingSizeGtController,
                            onChanged: (value) => widget.onChange(
                              foodGroup: widget.foodGroup,
                              servingUnit: widget.servingUnit,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Greater than",
                            ),
                          ),
                          TextField(
                            controller: widget.servingSizeLtController,
                            onChanged: (value) => widget.onChange(
                              foodGroup: widget.foodGroup,
                              servingUnit: widget.servingUnit,
                            ),
                            decoration:
                                const InputDecoration(labelText: "Less than"),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Clear'),
                        onPressed: () async {
                          Navigator.pop(context);
                          widget.onChange(
                            foodGroup: widget.foodGroup,
                            servingUnit: widget.servingUnit,
                          );
                        },
                      ),
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.close),
              title: Text("Clear ($filterCount)"),
              onTap: () {
                widget.servingSizeGtController.text = '';
                widget.servingSizeLtController.text = '';
                widget.onChange(
                  foodGroup: null,
                  servingUnit: null,
                );
                Navigator.pop(popupContext);
              },
            ),
          ),
        ],
      ),
    );
  }
}
