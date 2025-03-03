import 'dart:io';

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/food/meal_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/search_open_food_facts.dart';
import 'package:fit_book/settings/fields_picker.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

class EditFoodPage extends StatefulWidget {
  final int? id;

  const EditFoodPage({super.key, this.id});

  @override
  createState() => _EditFoodPageState();
}

class _EditFoodPageState extends State<EditFoodPage> {
  late Setting settings;
  late String servingUnit;
  String? imageFile;
  final formatter = NumberFormat('#,##0.00');
  final caloriesController = TextEditingController(text: "0");
  final barcodeController = TextEditingController();
  final nameController = TextEditingController();
  final kilojoulesController = TextEditingController(text: "0");
  final servingSizeController = TextEditingController(text: "1");
  late SettingsState settingsState;

  Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    settingsState = context.read<SettingsState>();
    settings = settingsState.value;
    servingUnit = settings.foodUnit;

    setControllers();
    settingsState.addListener(setControllers);
    if (servingUnit == 'serving')
      servingSizeController.text = '1';
    else if (servingUnit == 'grams') servingSizeController.text = '100';

    if (widget.id == null) return;

    (db.foods.select()..where((u) => u.id.equals(widget.id!)))
        .getSingle()
        .then((food) {
      for (final field in food.toColumns(true).entries)
        if (controllers.containsKey(field.key))
          controllers[field.key]!.text =
              (field.value as Variable).value.toString();

      setState(() {
        barcodeController.text = food.barcode ?? "";
        servingUnit = food.servingUnit ?? servingUnit;
        nameController.text = food.name;
        imageFile = food.imageFile;
        caloriesController.text = food.calories?.toStringAsFixed(2) ?? '';
        kilojoulesController.text = food.calories == null
            ? ''
            : formatter.format(food.calories! * 4.184);
        servingSizeController.text =
            food.servingSize?.toStringAsFixed(0) ?? '100';
      });
    });
  }

  void setControllers() async {
    settings = context.read<SettingsState>().value;
    final fields = settings.fields == null
        ? db.foods.$columns.map((column) => column.name)
        : settings.fields!.split(',');
    final food = await (db.foods.select()
          ..where(
            (u) => widget.id != null
                ? u.id.equals(widget.id!)
                : CustomExpression('true'),
          )
          ..limit(1))
        .getSingle();
    final columns = food.toColumns(true);
    for (final field in fields) {
      if (field.isEmpty) {
        controllers = {};
        continue;
      }
      if (excludedFields.contains(field)) continue;
      final expression = columns[field];
      if (expression is Variable<Object>)
        controllers[field] =
            TextEditingController(text: expression.value.toString());
      else
        controllers[field] = TextEditingController();
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (final controller in controllers.values) {
      controller.dispose();
    }
    if (mounted) settingsState.removeListener(setControllers);
  }

  Future<void> save() async {
    Navigator.pop(context);
    var food = FoodsCompanion.insert(
      name: nameController.text,
      barcode: Value(barcodeController.text),
      imageFile: Value(imageFile),
      calories: Value(double.tryParse(caloriesController.text)),
      servingUnit: Value(servingUnit),
      servingSize: Value(double.parse(servingSizeController.text)),
      created: Value(DateTime.now()),
    );

    var columns = food.toColumns(false);
    for (final entry in controllers.entries) {
      if (excludedFields.contains(entry.key)) continue;

      final column = db.foods.$columns.firstWhere((c) => c.name == entry.key);
      Variable value = Variable(entry.value.text);
      if (column.type == DriftSqlType.double)
        value = Variable(double.tryParse(entry.value.text));
      else if (column.type == DriftSqlType.dateTime)
        value = Variable(DateTime.tryParse(entry.value.text));
      columns[entry.key] = value;
    }

    if (widget.id != null)
      columns['id'] = Variable(widget.id);
    else
      columns['favorite'] = Variable(settings.favoriteNew);

    if (widget.id != null)
      db.update(db.foods).replace(RawValuesInsertable(columns));
    else
      db.into(db.foods).insert(RawValuesInsertable(columns));
  }

  @override
  Widget build(BuildContext context) {
    settings = context.watch<SettingsState>().value;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id != null ? 'Edit food' : 'Add food',
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
                        'Are you sure you want to delete ${nameController.text}?',
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
                            await db.foods.deleteWhere(
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
            TextField(
              controller: nameController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              onSubmitted: (_) => selectAll(caloriesController),
              textInputAction: TextInputAction.next,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: caloriesController,
                    decoration: const InputDecoration(
                      labelText: 'Calories (kcal)',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      kilojoulesController.text =
                          (double.parse(value) * 4.184).toStringAsFixed(2);
                    },
                    onTap: () => selectAll(caloriesController),
                    onSubmitted: (_) => selectAll(kilojoulesController),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: kilojoulesController,
                    decoration: const InputDecoration(
                      labelText: 'Kilojoules (kj)',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      caloriesController.text =
                          (double.parse(value.replaceAll(r',', '')) / 4.184)
                              .toStringAsFixed(2);
                    },
                    onSubmitted: (_) => selectAll(controllers['protein_g']!),
                    onTap: () => selectAll(kilojoulesController),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Serving size'),
                    controller: servingSizeController,
                    onTap: () => selectAll(servingSizeController),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: servingUnit,
                    decoration:
                        const InputDecoration(labelText: 'Serving unit'),
                    items: unitOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        servingUnit = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            TextField(
              controller: barcodeController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Barcode',
                suffixIcon: ScanBarcode(
                  text: true,
                  value: barcodeController.text,
                  onBarcode: (value) {
                    barcodeController.text = value;
                    toast(context, 'Barcode not found. Save to insert.');
                  },
                  onFood: (food) {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFoodPage(id: food.id),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (imageFile?.isNotEmpty == true && settings.showImages) ...[
              const SizedBox(height: 16),
              Image.file(
                File(imageFile!),
                errorBuilder: (context, error, stackTrace) => TextButton.icon(
                  onPressed: () {},
                  label: const Text('Image error'),
                  icon: const Icon(Icons.error),
                ),
              ),
            ],
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    int? id = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MealPage(),
                      ),
                    );

                    if (id != null && context.mounted)
                      Navigator.of(context).pop();
                  },
                  label: Text("Create meal"),
                  icon: Icon(Icons.restaurant),
                ),
                if (settings.showImages)
                  TextButton.icon(
                    icon: const Icon(Icons.image),
                    label: const Text('Set image'),
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image);
                      final path = result?.files.single.path;
                      if (path == null) return;
                      setState(() {
                        imageFile = path;
                      });
                    },
                  ),
                if (settings.showImages && imageFile?.isNotEmpty == true)
                  TextButton.icon(
                    icon: const Icon(Icons.delete),
                    label: const Text("Remove image"),
                    onPressed: () => setState(() {
                      imageFile = null;
                    }),
                  ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  label: const Text("OpenFoodFacts"),
                  onPressed: () async {
                    Food? food = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchOpenFoodFacts(
                          terms: nameController.text,
                        ),
                      ),
                    );
                    if (food == null) return;

                    if (!context.mounted) return;
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFoodPage(id: food.id),
                      ),
                    );
                  },
                ),
                TextButton.icon(
                  onPressed: () => Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => FieldsPicker(),
                        ),
                      )
                      .then((_) => setControllers()),
                  label: Text("Fields"),
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            ...controllers.entries.map(
              (entry) {
                final column =
                    db.foods.$columns.firstWhere((c) => c.name == entry.key);

                return TextField(
                  controller: entry.value,
                  textInputAction: TextInputAction.next,
                  keyboardType: column.type == DriftSqlType.double
                      ? TextInputType.numberWithOptions(decimal: true)
                      : null,
                  onTap: () => selectAll(entry.value),
                  onSubmitted: (_) {
                    final currentIndex =
                        controllers.values.toList().indexOf(entry.value);
                    if (currentIndex < controllers.length - 1) {
                      selectAll(controllers.values.elementAt(currentIndex + 1));
                    }
                  },
                  decoration:
                      InputDecoration(labelText: sentenceCase(entry.key)),
                );
              },
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
