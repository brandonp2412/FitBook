import 'dart:io';

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/scan_barcode.dart';
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
  final quantity = TextEditingController(text: "1");
  final calories = TextEditingController(text: "0");
  final kilojoules = TextEditingController(text: "0");
  final protein = TextEditingController(text: "0");
  final carb = TextEditingController(text: "0");
  final fat = TextEditingController(text: "0");
  final quantityNode = FocusNode();

  late var settings = context.read<SettingsState>().value;
  late var unit = settings.entryUnit;

  DateTime? created;
  bool foodDirty = false;
  Food? selectedFood;
  TextEditingController? nameController;
  String? barcode;
  String? imageFile;
  final formatter = NumberFormat.decimalPattern()..maximumFractionDigits = 2;

  @override
  void initState() {
    super.initState();
    if (widget.id == null) return;

    (db.entries.select()..where((u) => u.id.equals(widget.id!)))
        .getSingle()
        .then(
      (entry) async {
        setState(() {
          quantity.text = entry.quantity.toString();
          created = entry.created;
          unit = entry.unit;
        });

        final food = await (db.foods.select()
              ..where((u) => u.id.equals(entry.food)))
            .getSingleOrNull();
        if (food == null) return;

        setState(() {
          imageFile = food.imageFile;
          barcode = food.barcode;
          nameController?.text = food.name;
          selectedFood = food;
          calories.text = formatter.format(entry.kCalories);
          protein.text = formatter.format(entry.proteinG);
          carb.text = formatter.format(entry.carbG);
          fat.text = formatter.format(entry.fatG);
          kilojoules.text = entry.kCalories == null
              ? ''
              : formatter.format(food.calories! * 4.184);
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

  Future<void> saveFood() async {
    if (selectedFood?.name != nameController?.text) {
      final foodId = await (db.foods.insertOne(
        FoodsCompanion.insert(
          name: nameController!.text,
          calories: Value(formatter.tryParse(calories.text)?.toDouble()),
          proteinG: Value(formatter.tryParse(protein.text)?.toDouble()),
          carbohydrateG: Value(formatter.tryParse(carb.text)?.toDouble()),
          fatG: Value(formatter.tryParse(fat.text)?.toDouble()),
          favorite: Value(settings.favoriteNew),
          servingSize: Value(formatter.tryParse(quantity.text)?.toDouble()),
          servingUnit: Value(unit),
          created: Value(DateTime.now()),
          barcode: Value(barcode),
          imageFile: Value(imageFile),
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
          calories: Value(formatter.tryParse(calories.text)?.toDouble()),
          proteinG: Value(formatter.tryParse(protein.text)?.toDouble()),
          carbohydrateG: Value(formatter.tryParse(carb.text)?.toDouble()),
          fatG: Value(formatter.tryParse(fat.text)?.toDouble()),
          imageFile: Value(imageFile),
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

  Future<void> save() async {
    if (foodDirty) await saveFood();
    final food = selectedFood!;
    final entry = calculateEntry(
      food: food,
      quantity: formatter.parse(quantity.text).toDouble(),
      unit: unit,
    ).copyWith(
      created: Value(created ?? DateTime.now()),
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

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: created,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      selectTime(pickedDate);
    }
  }

  Future<void> selectTime(DateTime pickedDate) async {
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

  void recalc() {
    final food = selectedFood!;
    final entry = calculateEntry(
      food: food,
      quantity: formatter.parse(quantity.text).toDouble(),
      unit: unit,
    ).copyWith(
      created: Value(created ?? DateTime.now()),
    );

    setState(() {
      barcode = food.barcode ?? '';
      calories.text = formatter.format(entry.kCalories.value);
      protein.text = formatter.format(entry.proteinG.value);
      kilojoules.text = formatter.format((entry.kCalories.value ?? 0) * 4.184);
      carb.text = formatter.format(entry.carbG.value);
      fat.text = formatter.format(entry.fatG.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    settings = context.watch<SettingsState>().value;

    final shortUnit =
        getShortUnit(selectedFood?.servingUnit ?? settings.foodUnit);
    final servingSize = selectedFood?.servingSize ?? 100;

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
                  quantity.text = lastEntry.quantity.toString();
                  unit = lastEntry.unit;
                });

                recalc();
                quantityNode.requestFocus();
                selectAll(quantity);
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
                        Food? food = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchOpenFoodFacts(
                              terms: textEditingController.text,
                            ),
                          ),
                        );
                        if (food == null) return;
                        setState(() {
                          selectedFood = food;
                        });
                        nameController?.text = food.name;
                        recalc();
                        quantityNode.requestFocus();
                        selectAll(quantity);
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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: quantity,
                    focusNode: quantityNode,
                    decoration: const InputDecoration(label: Text("Quantity")),
                    keyboardType: TextInputType.number,
                    onTap: () => quantity.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: quantity.text.length,
                    ),
                    onChanged: (value) {
                      recalc();
                    },
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {
                      if (selectedFood != null) save();
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: unit,
                    decoration: const InputDecoration(labelText: 'Unit'),
                    items: units.map((String value) {
                      if (value == 'serving' && selectedFood != null)
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text("serving ($servingSize $shortUnit)"),
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
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: calories,
                    decoration: const InputDecoration(
                      labelText: 'Calories',
                    ),
                    onTap: () => selectAll(calories),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        foodDirty = true;
                        kilojoules.text =
                            formatter.format(formatter.parse(value) * 4.184);
                      });
                    },
                    onSubmitted: (value) {
                      selectAll(kilojoules);
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                if (unit != 'kilojoules') ...[
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: kilojoules,
                      decoration: const InputDecoration(
                        labelText: 'Kilojoules',
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        setState(() {
                          foodDirty = true;
                          calories.text =
                              formatter.format(formatter.parse(value) / 4.184);
                        });
                      },
                      onSubmitted: (value) => selectAll(protein),
                      onTap: () => selectAll(kilojoules),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: protein,
                    decoration: const InputDecoration(
                      labelText: 'Protein',
                    ),
                    onTap: () => selectAll(protein),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        foodDirty = true;
                      });
                    },
                    onSubmitted: (value) => selectAll(carb),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: carb,
                    decoration: const InputDecoration(
                      labelText: 'Carbs',
                    ),
                    onTap: () => selectAll(carb),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        foodDirty = true;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) => selectAll(fat),
                  ),
                ),
              ],
            ),
            TextField(
              controller: fat,
              decoration: const InputDecoration(
                labelText: 'Fat',
              ),
              onTap: () => selectAll(fat),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  foodDirty = true;
                });
              },
              onSubmitted: (value) => save(),
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
            if (imageFile?.isNotEmpty == true && settings.showImages) ...[
              const SizedBox(height: 8),
              Image.file(
                File(imageFile!),
                errorBuilder: (context, error, stackTrace) => TextButton.icon(
                  onPressed: () {},
                  label: const Text('Image error'),
                  icon: const Icon(Icons.error),
                ),
              ),
            ],
            if (Platform.isAndroid || Platform.isIOS)
              ScanBarcode(
                text: true,
                value: barcode,
                onBarcode: (value) {
                  setState(() {
                    barcode = value;
                    foodDirty = true;
                  });
                  toast(context, 'Barcode not found. Save to insert.');
                },
                onFood: (food) {
                  setState(() {
                    selectedFood = food;
                  });
                },
              ),
            if (settings.showImages) ...[
              const SizedBox(height: 8),
              TextButton.icon(
                icon: const Icon(Icons.image),
                label: const Text('Set image'),
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.image,
                    allowMultiple: false,
                  );
                  final path = result?.files.single.path;
                  if (path == null) return;
                  setState(() {
                    imageFile = path;
                    foodDirty = true;
                  });
                },
              ),
            ],
            if (imageFile != null && settings.showImages)
              TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text("Remove image"),
                onPressed: () => setState(() {
                  imageFile = null;
                  foodDirty = true;
                }),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        tooltip: 'Save',
        child: const Icon(Icons.save),
      ),
    );
  }
}
