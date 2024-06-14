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
  final _quantityController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _kilojoulesController = TextEditingController();
  final _proteinController = TextEditingController();
  late SettingsState _settings;

  bool _newFood = false;

  TextEditingController? _nameController;
  String? _unit;
  DateTime? _created;
  Food? _selectedFood;
  String? _oldNames;
  String? _oldUnits;
  String? _oldQuantities;
  String? _oldCalories;
  String? _oldKj;
  String? _oldProtein;

  @override
  void initState() {
    super.initState();
    _settings = context.read<SettingsState>();

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
        _oldNames =
            results.map((result) => result.read(db.foods.name)).join(', ');
        _oldUnits =
            results.map((result) => result.read(db.entries.unit)).join(', ');
        _oldQuantities = results
            .map((result) => result.read(db.entries.quantity))
            .join(', ');
        _oldCalories = results
            .map((result) => result.read(db.entries.kCalories))
            .join(', ');
        _oldProtein = results
            .map((result) => result.read(db.entries.proteinG))
            .join(', ');
        _oldKj = results
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
    final quantity = double.tryParse(_quantityController.text);

    for (final id in widget.entryIds) {
      final oldEntry = await (db.entries.select()
            ..where((u) => u.id.equals(id)))
          .getSingle();
      int foodId;
      if (_newFood)
        foodId = await (db.foods.insertOne(
          FoodsCompanion.insert(
            name: _nameController!.text,
            calories: Value(double.tryParse(_caloriesController.text)),
            proteinG: Value(double.tryParse(_proteinController.text)),
          ),
        ));
      else
        foodId = _selectedFood?.id ?? oldEntry.food;
      final food = await (db.foods.select()..where((u) => u.id.equals(foodId)))
          .getSingle();
      final newEntry = calculateEntry(
        food: food,
        quantity: quantity ?? oldEntry.quantity,
        unit: _unit ?? oldEntry.unit,
      );
      final cals = double.tryParse(_caloriesController.text);
      final protein = double.tryParse(_proteinController.text);
      await (db.entries.update()..where((u) => u.id.equals(id))).write(
        newEntry.copyWith(
          created: _created != null ? Value(_created!) : const Value.absent(),
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
      initialDate: _created,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _selectTime(pickedDate);
    }
  }

  Future<void> _selectTime(DateTime pickedDate) async {
    if (!_settings.longDateFormat.contains('h:mm'))
      return setState(() {
        _created = pickedDate;
      });

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_created ?? DateTime.now()),
    );

    if (pickedTime != null) {
      setState(() {
        _created = DateTime(
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
    _settings = context.watch<SettingsState>();

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
                    title: const Text('Confirm Delete'),
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
                  _selectedFood = food;
                  _newFood = false;
                });
              },
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                _nameController = textEditingController;
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: _oldNames,
                  ),
                  controller: textEditingController,
                  focusNode: focusNode,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) => setState(() {
                    _newFood = true;
                    _caloriesController.text = '';
                    _kilojoulesController.text = '';
                    _proteinController.text = '';
                  }),
                  onFieldSubmitted: (String value) {
                    if (_settings.selectEntryOnSubmit) onFieldSubmitted();
                  },
                  textInputAction: TextInputAction.next,
                );
              },
            ),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(
                label: const Text("Quantity"),
                hintText: _oldQuantities,
              ),
              keyboardType: TextInputType.number,
              onTap: () => _quantityController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: _quantityController.text.length,
              ),
              textInputAction: TextInputAction.next,
            ),
            DropdownButtonFormField<String>(
              value: _unit,
              decoration:
                  InputDecoration(labelText: 'Unit', hintText: _oldUnits),
              items: units.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _unit = newValue!;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _caloriesController,
                    decoration: InputDecoration(
                      labelText: 'Calories',
                      hintText: _oldCalories,
                    ),
                    onTap: () => selectAll(_caloriesController),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        _kilojoulesController.text =
                            ((double.tryParse(value) ?? 0) * 4.184)
                                .toStringAsFixed(2);
                      });
                    },
                    onSubmitted: (value) {
                      selectAll(_proteinController);
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                if (_unit != 'kilojoules') ...[
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: _kilojoulesController,
                      decoration: InputDecoration(
                        labelText: 'Kilojoules',
                        hintText: _oldKj,
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        setState(() {
                          _caloriesController.text =
                              ((double.tryParse(value) ?? 0) / 4.184)
                                  .toStringAsFixed(2);
                        });
                      },
                      onTap: () => selectAll(_kilojoulesController),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ],
            ),
            TextField(
              controller: _proteinController,
              decoration: InputDecoration(
                labelText: 'Protein',
                hintText: _oldProtein,
              ),
              onTap: () => selectAll(_proteinController),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
            ),
            ListTile(
              title: const Text('Created date'),
              subtitle: Text(
                DateFormat(_settings.longDateFormat)
                    .format(_created ?? DateTime.now()),
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
