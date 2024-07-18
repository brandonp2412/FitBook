import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

class EditEntriesPage extends StatefulWidget {
  final List<int> entryIds;

  const EditEntriesPage({super.key, required this.entryIds});

  @override
  createState() => _EditEntriesPageState();
}

class _EditEntriesPageState extends State<EditEntriesPage> {
  final quantityController = TextEditingController();
  final caloriesController = TextEditingController();
  final kilojoulesController = TextEditingController();
  final proteinController = TextEditingController();
  late var settings = context.read<SettingsState>().value;

  bool newFood = false;

  TextEditingController? nameController;
  String? unit;
  DateTime? created;
  Food? selectedFood;
  String? oldNames;
  String? oldUnits;
  String? oldQuantities;
  String? oldCalories;
  String? oldKj;
  String? oldProtein;

  @override
  void initState() {
    super.initState();

    (db.entries.selectOnly()
          ..addColumns([
            db.entries.id,
            db.entries.quantity,
            db.entries.unit,
            db.entries.kCalories,
            db.entries.proteinG,
            db.foods.name,
          ])
          ..where(db.entries.id.isIn(widget.entryIds))
          ..join([innerJoin(db.foods, db.entries.food.equalsExp(db.foods.id))]))
        .get()
        .then((results) {
      setState(() {
        oldNames =
            results.map((result) => result.read(db.foods.name)).join(', ');
        oldUnits =
            results.map((result) => result.read(db.entries.unit)).join(', ');
        oldQuantities = results
            .map((result) => result.read(db.entries.quantity))
            .join(', ');
        oldCalories = results
            .map((result) => result.read(db.entries.kCalories))
            .map(
              (number) => ((number ?? 0) * 4.184).toStringAsFixed(2),
            )
            .join(', ');
        oldProtein = results
            .map((result) => result.read(db.entries.proteinG))
            .map(
              (number) => ((number ?? 0) * 4.184).toStringAsFixed(2),
            )
            .join(', ');
        oldKj = results
            .map((result) => result.read(db.entries.kCalories))
            .map(
              (number) => ((number ?? 0) * 4.184).toStringAsFixed(2),
            )
            .join(', ');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _save() async {
    final quantity = double.tryParse(quantityController.text);

    for (final id in widget.entryIds) {
      final oldEntry = await (db.entries.select()
            ..where((u) => u.id.equals(id)))
          .getSingle();
      int foodId;
      if (newFood)
        foodId = await (db.foods.insertOne(
          FoodsCompanion.insert(
            name: nameController!.text,
            calories: Value(double.tryParse(caloriesController.text)),
            proteinG: Value(double.tryParse(proteinController.text)),
          ),
        ));
      else
        foodId = selectedFood?.id ?? oldEntry.food;
      final food = await (db.foods.select()..where((u) => u.id.equals(foodId)))
          .getSingle();
      final newEntry = calculateEntry(
        food: food,
        quantity: quantity ?? oldEntry.quantity,
        unit: unit ?? oldEntry.unit,
      );
      final cals = double.tryParse(caloriesController.text);
      final protein = double.tryParse(proteinController.text);
      await (db.entries.update()..where((u) => u.id.equals(id))).write(
        newEntry.copyWith(
          created: created != null ? Value(created!) : const Value.absent(),
          kCalories: cals != null ? Value(cals) : const Value.absent(),
          proteinG: protein != null ? Value(protein) : const Value.absent(),
        ),
      );
    }

    if (mounted) Navigator.pop(context);
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: created,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _selectTime(pickedDate);
    }
  }

  Future<void> _selectTime(DateTime pickedDate) async {
    if (!settings.longDateFormat.contains('h:mm'))
      return setState(() {
        created = pickedDate;
      });

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(created ?? DateTime.now()),
    );

    if (pickedTime != null) {
      setState(() {
        created = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  Future<List<String>> _search(String term) async {
    return await (db.foods.selectOnly()
          ..where(db.foods.name.contains(term.toLowerCase()))
          ..limit(30)
          ..orderBy([
            OrderingTerm(
              expression: db.foods.favorite,
              mode: OrderingMode.desc,
            ),
          ])
          ..addColumns([db.foods.name, db.foods.favorite]))
        .get()
        .then(
          (results) =>
              results.map((result) => result.read(db.foods.name)!).toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    settings = context.watch<SettingsState>().value;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit ${widget.entryIds.length} entries",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: const Text('Confirm delete'),
                    content: Text(
                      'Are you sure you want to delete ${widget.entryIds.length} entries?',
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                      ),
                      TextButton(
                        child: const Text('Delete'),
                        onPressed: () async {
                          Navigator.pop(dialogContext);
                          await db.entries
                              .deleteWhere((u) => u.id.isIn(widget.entryIds));
                          if (context.mounted) Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Autocomplete<String>(
              optionsMaxHeight: 300,
              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text.isEmpty) return [];
                return _search(textEditingValue.text);
              },
              onSelected: (option) async {
                final food = await (db.foods.select()
                      ..where((tbl) => tbl.name.equals(option))
                      ..limit(1))
                    .getSingleOrNull();
                if (food == null) return;
                setState(() {
                  selectedFood = food;
                  newFood = false;
                });
              },
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                nameController = textEditingController;
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: oldNames,
                  ),
                  controller: textEditingController,
                  focusNode: focusNode,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) => setState(() {
                    newFood = true;
                    caloriesController.text = '';
                    kilojoulesController.text = '';
                    proteinController.text = '';
                  }),
                  onFieldSubmitted: (String value) {
                    if (settings.selectEntryOnSubmit) onFieldSubmitted();
                  },
                  textInputAction: TextInputAction.next,
                );
              },
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(
                label: const Text("Quantity"),
                hintText: oldQuantities,
              ),
              keyboardType: TextInputType.number,
              onTap: () => quantityController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: quantityController.text.length,
              ),
              textInputAction: TextInputAction.next,
            ),
            DropdownButtonFormField<String>(
              value: unit,
              decoration:
                  InputDecoration(labelText: 'Unit', hintText: oldUnits),
              items: units.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  unit = newValue!;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: caloriesController,
                    decoration: InputDecoration(
                      labelText: 'Calories',
                      hintText: oldCalories,
                    ),
                    onTap: () => selectAll(caloriesController),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        kilojoulesController.text =
                            ((double.tryParse(value) ?? 0) * 4.184)
                                .toStringAsFixed(2);
                      });
                    },
                    onSubmitted: (value) {
                      selectAll(proteinController);
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                if (unit != 'kilojoules') ...[
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: kilojoulesController,
                      decoration: InputDecoration(
                        labelText: 'Kilojoules',
                        hintText: oldKj,
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        setState(() {
                          caloriesController.text =
                              ((double.tryParse(value) ?? 0) / 4.184)
                                  .toStringAsFixed(2);
                        });
                      },
                      onTap: () => selectAll(kilojoulesController),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ],
            ),
            TextField(
              controller: proteinController,
              decoration: InputDecoration(
                labelText: 'Protein',
                hintText: oldProtein,
              ),
              onTap: () => selectAll(proteinController),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
            ),
            ListTile(
              title: const Text('Created date'),
              subtitle: Text(
                DateFormat(settings.longDateFormat)
                    .format(created ?? DateTime.now()),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _save,
        tooltip: 'Save',
        child: const Icon(Icons.save),
      ),
    );
  }
}
