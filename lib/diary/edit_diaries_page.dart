import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

class EditDiariesPage extends StatefulWidget {
  final List<int> diaryIds;

  const EditDiariesPage({super.key, required this.diaryIds});

  @override
  createState() => _EditDiariesPageState();
}

class _EditDiariesPageState extends State<EditDiariesPage> {
  final quantityController = TextEditingController();
  final caloriesController = TextEditingController();
  final kilojoulesController = TextEditingController();
  final proteinController = TextEditingController();
  final carbController = TextEditingController();
  final fatController = TextEditingController();
  final fiberController = TextEditingController();
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
  String? oldCarb;
  String? oldFat;
  String? oldFiber;
  @override
  void initState() {
    super.initState();

    (db.diaries.selectOnly()
          ..addColumns([
            db.diaries.id,
            db.diaries.quantity,
            db.diaries.unit,
            db.foods.name,
            db.foods.calories,
            db.foods.proteinG,
            db.foods.carbohydrateG,
            db.foods.fatG,
            db.foods.fiberG,
          ])
          ..where(db.diaries.id.isIn(widget.diaryIds))
          ..join([innerJoin(db.foods, db.diaries.food.equalsExp(db.foods.id))]))
        .get()
        .then((results) {
      setState(() {
        oldNames =
            results.map((result) => result.read(db.foods.name)).join(', ');
        oldUnits =
            results.map((result) => result.read(db.diaries.unit)).join(', ');
        oldQuantities = results
            .map((result) => result.read(db.diaries.quantity))
            .join(', ');
        oldCalories = results
            .map(
              (result) =>
                  result.read(db.foods.calories)?.toStringAsFixed(2) ?? '0',
            )
            .join(', ');
        oldKj = results
            .map(
              (result) => ((result.read(db.foods.calories) ?? 0) * 4.184)
                  .toStringAsFixed(2),
            )
            .join(', ');
        oldProtein = results
            .map(
              (result) =>
                  result.read(db.foods.proteinG)?.toStringAsFixed(2) ?? '0',
            )
            .join(', ');
        oldCarb = results
            .map(
              (result) =>
                  result.read(db.foods.carbohydrateG)?.toStringAsFixed(2) ??
                  '0',
            )
            .join(', ');
        oldFat = results
            .map(
              (result) => result.read(db.foods.fatG)?.toStringAsFixed(2) ?? '0',
            )
            .join(', ');
        oldFiber = results
            .map(
              (result) =>
                  result.read(db.foods.fiberG)?.toStringAsFixed(2) ?? '0',
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

    for (final id in widget.diaryIds) {
      final oldEntry = await (db.diaries.select()
            ..where((u) => u.id.equals(id)))
          .getSingle();
      int foodId;
      if (newFood) {
        foodId = await (db.foods.insertOne(
          FoodsCompanion.insert(
            name: nameController!.text,
            calories: Value(double.tryParse(caloriesController.text)),
            proteinG: Value(double.tryParse(proteinController.text)),
            carbohydrateG: Value(double.tryParse(carbController.text)),
            fatG: Value(double.tryParse(fatController.text)),
            fiberG: Value(double.tryParse(fiberController.text)),
            favorite: Value(settings.favoriteNew),
          ),
        ));
      } else {
        foodId = selectedFood?.id ?? oldEntry.food;
        await (db.foods.update()..where((u) => u.id.equals(foodId))).write(
          FoodsCompanion(
            calories: caloriesController.text.isNotEmpty
                ? Value(double.tryParse(caloriesController.text))
                : const Value.absent(),
            proteinG: proteinController.text.isNotEmpty
                ? Value(double.tryParse(proteinController.text))
                : const Value.absent(),
            carbohydrateG: carbController.text.isNotEmpty
                ? Value(double.tryParse(carbController.text))
                : const Value.absent(),
            fatG: fatController.text.isNotEmpty
                ? Value(double.tryParse(fatController.text))
                : const Value.absent(),
            fiberG: fiberController.text.isNotEmpty
                ? Value(double.tryParse(fiberController.text))
                : const Value.absent(),
          ),
        );
      }
      final food = await (db.foods.select()..where((u) => u.id.equals(foodId)))
          .getSingle();
      final newEntry = DiariesCompanion(
        food: Value(food.id),
        quantity: Value(quantity ?? oldEntry.quantity),
        unit: Value(unit ?? oldEntry.unit),
      );
      await (db.diaries.update()..where((u) => u.id.equals(id))).write(
        newEntry.copyWith(
          created: created != null ? Value(created!) : const Value.absent(),
        ),
      );
    }

    if (mounted) Navigator.pop(context);
  }

  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: created,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      pickTime(pickedDate);
    }
  }

  Future<void> pickTime(DateTime pickedDate) async {
    if (!settings.longDateFormat.contains('h:mm') &&
        !settings.longDateFormat.contains('H:mm'))
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
          "Edit ${widget.diaryIds.length} entries",
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
                      'Are you sure you want to delete ${widget.diaryIds.length} entries?',
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
                          await db.diaries
                              .deleteWhere((u) => u.id.isIn(widget.diaryIds));
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
              keyboardType: TextInputType.numberWithOptions(decimal: true),
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
              items: unitOptions.map((String value) {
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
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: carbController,
                    decoration: InputDecoration(
                      labelText: 'Carbs',
                      hintText: oldCarb,
                    ),
                    onTap: () => selectAll(carbController),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: fatController,
                    decoration: InputDecoration(
                      labelText: 'Fat',
                      hintText: oldFat,
                    ),
                    onTap: () => selectAll(fatController),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: fiberController,
              decoration: InputDecoration(
                labelText: 'Fiber',
                hintText: oldFiber,
              ),
              onTap: () => selectAll(fiberController),
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
              onTap: () => pickDate(),
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
