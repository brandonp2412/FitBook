import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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
  late String unit;
  String? imgFile;
  String? smallImg;
  String? bigImg;
  final formatter = NumberFormat('#,##0.00');
  final calCtrl = TextEditingController(text: "0");
  final barcodeCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final kjCtrl = TextEditingController(text: "0");
  final sizeCtrl = TextEditingController(text: "1");
  late SettingsState settingsState;

  Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    settingsState = context.read<SettingsState>();
    settings = settingsState.value;
    unit = settings.foodUnit;

    setCtrls();
    settingsState.addListener(setCtrls);
    if (unit == 'serving')
      sizeCtrl.text = '1';
    else if (unit == 'grams') sizeCtrl.text = '100';

    if (widget.id == null) return;

    (db.foods.select()..where((u) => u.id.equals(widget.id!)))
        .getSingle()
        .then((food) {
      for (final field in food.toColumns(true).entries)
        if (controllers.containsKey(field.key))
          controllers[field.key]!.text =
              (field.value as Variable).value.toString();

      setState(() {
        barcodeCtrl.text = food.barcode ?? "";
        unit = food.servingUnit ?? unit;
        nameCtrl.text = food.name;
        imgFile = food.imageFile;
        smallImg = food.smallImage;
        bigImg = food.bigImage;
        calCtrl.text = food.calories?.toStringAsFixed(2) ?? '';
        kjCtrl.text = food.calories == null
            ? ''
            : formatter.format(food.calories! * 4.184);
        sizeCtrl.text = food.servingSize?.toStringAsFixed(0) ?? '100';
      });
    });
  }

  void setCtrls() async {
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

    Map<String, TextEditingController> newControllers = {};

    for (final field in fields) {
      if (field.isEmpty) continue;
      if (excludedFields.contains(field)) continue;

      final expression = columns[field];
      if (expression is Variable<Object>)
        newControllers[field] =
            TextEditingController(text: expression.value.toString());
      else
        newControllers[field] = TextEditingController();
    }

    for (final entry in controllers.entries) {
      if (!newControllers.containsKey(entry.key)) {
        entry.value.dispose();
      }
    }

    controllers = newControllers;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (final controller in controllers.values) {
      controller.dispose();
    }
    if (mounted) settingsState.removeListener(setCtrls);
  }

  Future<void> save() async {
    Navigator.pop(context);
    var food = FoodsCompanion.insert(
      name: nameCtrl.text,
      barcode: Value(barcodeCtrl.text),
      imageFile: Value(imgFile),
      calories: Value(double.tryParse(calCtrl.text)),
      servingUnit: Value(unit),
      servingSize: Value(double.parse(sizeCtrl.text)),
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
                  builder: (BuildContext dlgCtx) {
                    return AlertDialog(
                      title: const Text('Confirm delete'),
                      content: Text(
                        'Are you sure you want to delete ${nameCtrl.text}?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(dlgCtx);
                          },
                        ),
                        TextButton(
                          child: const Text('Delete'),
                          onPressed: () async {
                            Navigator.pop(dlgCtx);
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
              controller: nameCtrl,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              onSubmitted: (_) => selectAll(calCtrl),
              textInputAction: TextInputAction.next,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: calCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Calories (kcal)',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      kjCtrl.text =
                          (double.parse(value) * 4.184).toStringAsFixed(2);
                    },
                    onTap: () => selectAll(calCtrl),
                    onSubmitted: (_) => selectAll(kjCtrl),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: kjCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Kilojoules (kj)',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      calCtrl.text =
                          (double.parse(value.replaceAll(r',', '')) / 4.184)
                              .toStringAsFixed(2);
                    },
                    onSubmitted: (_) => selectAll(controllers['protein_g']!),
                    onTap: () => selectAll(kjCtrl),
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
                    controller: sizeCtrl,
                    onTap: () => selectAll(sizeCtrl),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: unit,
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
                        unit = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            TextField(
              controller: barcodeCtrl,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Barcode',
                suffixIcon: ScanBarcode(
                  text: true,
                  value: barcodeCtrl.text,
                  onBarcode: (value) {
                    barcodeCtrl.text = value;
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
            if ((smallImg?.isNotEmpty == true || bigImg?.isNotEmpty == true) &&
                settings.showImages) ...[
              const SizedBox(height: 16),
              SizedBox(
                height: 80,
                width: 50,
                child: CachedNetworkImage(
                  imageUrl: smallImg ?? bigImg!,
                ),
              ),
            ],
            if (imgFile?.isNotEmpty == true && settings.showImages) ...[
              const SizedBox(height: 16),
              Image.file(
                File(imgFile!),
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
                        imgFile = path;
                      });
                    },
                  ),
                if (settings.showImages && imgFile?.isNotEmpty == true)
                  TextButton.icon(
                    icon: const Icon(Icons.delete),
                    label: const Text("Remove image"),
                    onPressed: () => setState(() {
                      imgFile = null;
                    }),
                  ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  label: const Text("OpenFoodFacts"),
                  onPressed: () async {
                    Food? food = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchOpenFoodFacts(
                          terms: nameCtrl.text,
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
                      .then((_) => setCtrls()),
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
