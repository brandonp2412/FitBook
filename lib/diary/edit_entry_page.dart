import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/search_open_food_facts.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

class EditEntryPage extends StatefulWidget {
  final int? id;

  const EditEntryPage({super.key, this.id});

  @override
  createState() => _EditEntryPageState();
}

class _EditEntryPageState extends State<EditEntryPage> {
  final quantityController = TextEditingController(text: "1");
  final caloriesController = TextEditingController(text: "0");
  final kilojoulesController = TextEditingController(text: "0");
  final proteinController = TextEditingController(text: "0");
  final carbController = TextEditingController(text: "0");
  final fatController = TextEditingController(text: "0");
  final quantityNode = FocusNode();

  late var settings = context.read<SettingsState>();
  late var unit = settings.entryUnit;

  DateTime created = DateTime.now();
  bool foodDirty = false;
  Food? selectedFood;
  TextEditingController? nameController;

  @override
  void initState() {
    super.initState();
    if (widget.id == null) return;

    (db.entries.select()..where((u) => u.id.equals(widget.id!)))
        .getSingle()
        .then(
      (entry) async {
        setState(() {
          quantityController.text = entry.quantity.toString();
          created = entry.created;
          unit = entry.unit;
        });

        final food = await (db.foods.select()
              ..where((u) => u.id.equals(entry.food)))
            .getSingleOrNull();
        if (food == null) return;

        setState(() {
          nameController?.text = food.name;
          selectedFood = food;
          caloriesController.text = entry.kCalories?.toStringAsFixed(2) ?? "0";
          proteinController.text = entry.proteinG?.toStringAsFixed(2) ?? "0";
          carbController.text = entry.carbG?.toStringAsFixed(2) ?? "0";
          fatController.text = entry.fatG?.toStringAsFixed(2) ?? "0";
          kilojoulesController.text = entry.kCalories == null
              ? ''
              : (food.calories! * 4.184).toStringAsFixed(2);
        });
      },
    );
  }

  Future<List<String>> searchDrift(String term) async {
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
  void dispose() {
    super.dispose();
  }

  Future<void> _saveFood() async {
    if (selectedFood?.name != nameController?.text) {
      final foodId = await (db.foods.insertOne(
        FoodsCompanion.insert(
          name: nameController!.text,
          calories: Value(double.tryParse(caloriesController.text)),
          proteinG: Value(double.tryParse(proteinController.text)),
          carbohydrateG: Value(double.tryParse(carbController.text)),
          fatG: Value(double.tryParse(fatController.text)),
          favorite: Value(settings.favoriteNew),
          servingSize: Value(double.tryParse(quantityController.text)),
          servingUnit: Value(unit),
        ),
      ));
      final food = await (db.foods.select()..where((u) => u.id.equals(foodId)))
          .getSingle();

      setState(() {
        selectedFood = food;
      });
    } else {
      await (db.foods.update()
            ..where((u) => u.id.equals(selectedFood?.id ?? -1)))
          .write(
        FoodsCompanion(
          proteinG: Value(double.tryParse(proteinController.text)),
          calories: Value(double.tryParse(caloriesController.text)),
          carbohydrateG: Value(double.tryParse(carbController.text)),
          fatG: Value(double.tryParse(fatController.text)),
        ),
      );
      final food = await (db.foods.select()
            ..where((u) => u.id.equals(selectedFood!.id)))
          .getSingle();

      setState(() {
        selectedFood = food;
      });
    }
  }

  Future<void> _save() async {
    if (foodDirty) await _saveFood();
    final food = selectedFood!;
    final quantity = double.parse(quantityController.text);
    final entry = calculateEntry(
      food: food,
      quantity: quantity,
      unit: unit,
    ).copyWith(
      created: Value(created),
    );

    if (widget.id == null)
      await db.into(db.entries).insert(entry);
    else
      await db.update(db.entries).replace(
            entry.copyWith(
              id: Value(widget.id!),
            ),
          );
    if (!mounted) return;
    Navigator.pop(context);
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
      initialTime: TimeOfDay.fromDateTime(created),
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

  void recalc() {
    final food = selectedFood!;
    final quantity = double.parse(quantityController.text);
    final entry = calculateEntry(
      food: food,
      quantity: quantity,
      unit: unit,
    ).copyWith(
      created: Value(created),
    );

    setState(() {
      caloriesController.text =
          entry.kCalories.value?.toStringAsFixed(2) ?? "0";
      proteinController.text = entry.proteinG.value?.toStringAsFixed(2) ?? "0";
      kilojoulesController.text =
          ((entry.kCalories.value ?? 0) * 4.184).toStringAsFixed(2);
      carbController.text = entry.carbG.value?.toStringAsFixed(2) ?? "0";
      fatController.text = entry.fatG.value?.toStringAsFixed(2) ?? "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    settings = context.watch<SettingsState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id == null ? 'Add entry' : 'Edit entry',
        ),
        actions: [
          if (widget.id != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text('Confirm delete'),
                      content: Text(
                        'Are you sure you want to delete ${selectedFood?.name}?',
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
                            await db.entries.deleteWhere(
                              (tbl) => tbl.id.equals(widget.id!),
                            );
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
                return searchDrift(textEditingValue.text);
              },
              onSelected: (option) async {
                final food = await (db.foods.select()
                      ..where((tbl) => tbl.name.equals(option))
                      ..limit(1))
                    .getSingleOrNull();
                if (food == null) return;

                final lastEntry = await (db.entries.select()
                      ..where((u) => u.food.equals(food.id))
                      ..orderBy([
                        (u) => OrderingTerm(
                              expression: u.created,
                              mode: OrderingMode.desc,
                            ),
                      ])
                      ..limit(1))
                    .getSingleOrNull();

                setState(() {
                  foodDirty = false;
                  selectedFood = food;
                  if (lastEntry == null) return;
                  quantityController.text = lastEntry.quantity.toString();
                  unit = lastEntry.unit;
                });

                recalc();
                quantityNode.requestFocus();
                selectAll(quantityController);
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
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async {
                        Food food = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchOpenFoodFacts(
                              terms: textEditingController.text,
                            ),
                          ),
                        );
                        setState(() {
                          selectedFood = food;
                        });
                        nameController?.text = food.name;
                        recalc();
                        quantityNode.requestFocus();
                        selectAll(quantityController);
                      },
                    ),
                  ),
                  autofocus: widget.id == null,
                  controller: textEditingController,
                  focusNode: focusNode,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (String value) {
                    if (!settings.selectEntryOnSubmit) return;
                    onFieldSubmitted();
                  },
                  onChanged: (value) => setState(() {
                    foodDirty = true;
                  }),
                  textInputAction: settings.selectEntryOnSubmit
                      ? TextInputAction.next
                      : null,
                );
              },
            ),
            TextField(
              controller: quantityController,
              focusNode: quantityNode,
              decoration: const InputDecoration(label: Text("Quantity")),
              keyboardType: TextInputType.number,
              onTap: () => quantityController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: quantityController.text.length,
              ),
              onChanged: (value) {
                recalc();
              },
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                if (selectedFood != null) _save();
              },
            ),
            DropdownButtonFormField<String>(
              value: unit,
              decoration: const InputDecoration(labelText: 'Unit'),
              items: units.map((String value) {
                if (value == 'serving' && selectedFood != null)
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      "serving (${(selectedFood?.servingSize ?? 100)} ${selectedFood?.servingUnit ?? settings.foodUnit})",
                    ),
                  );
                else
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  unit = newValue!;
                });
                recalc();
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: caloriesController,
                    decoration: const InputDecoration(
                      labelText: 'Calories',
                    ),
                    onTap: () => selectAll(caloriesController),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        foodDirty = true;
                        kilojoulesController.text =
                            ((double.tryParse(value) ?? 0) * 4.184)
                                .toStringAsFixed(2);
                      });
                    },
                    onSubmitted: (value) {
                      selectAll(kilojoulesController);
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                if (unit != 'kilojoules') ...[
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: kilojoulesController,
                      decoration: const InputDecoration(
                        labelText: 'Kilojoules',
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        setState(() {
                          foodDirty = true;
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
              decoration: const InputDecoration(
                labelText: 'Protein',
              ),
              onTap: () => selectAll(proteinController),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  foodDirty = true;
                });
              },
              onSubmitted: (value) => selectAll(carbController),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: carbController,
              decoration: const InputDecoration(
                labelText: 'Carbs',
              ),
              onTap: () => selectAll(carbController),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  foodDirty = true;
                });
              },
              textInputAction: TextInputAction.next,
              onSubmitted: (value) => selectAll(fatController),
            ),
            TextField(
              controller: fatController,
              decoration: const InputDecoration(
                labelText: 'Fat',
              ),
              onTap: () => selectAll(fatController),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  foodDirty = true;
                });
              },
              onSubmitted: (value) => _save(),
            ),
            ListTile(
              title: const Text('Created Date'),
              subtitle:
                  Text(DateFormat(settings.longDateFormat).format(created)),
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
