import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
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
  final _quantityController = TextEditingController(text: "1");
  final _caloriesController = TextEditingController(text: "0");
  final _kilojoulesController = TextEditingController(text: "0");
  final _proteinController = TextEditingController(text: "0");
  final _quantityNode = FocusNode();

  late SettingsState _settings;
  late String _unit;

  DateTime _created = DateTime.now();
  bool _foodDirty = false;
  Food? _selectedFood;
  TextEditingController? _nameController;

  @override
  void initState() {
    super.initState();
    _settings = context.read<SettingsState>();
    _unit = _settings.entryUnit;
    if (widget.id == null) return;
    (db.entries.select()..where((u) => u.id.equals(widget.id!)))
        .getSingle()
        .then(
      (entry) async {
        setState(() {
          _quantityController.text = entry.quantity.toString();
          _created = entry.created;
          _unit = entry.unit;
        });

        final food = await (db.foods.select()
              ..where((u) => u.id.equals(entry.food)))
            .getSingleOrNull();
        if (food == null) return;

        setState(() {
          _nameController?.text = food.name;
          _selectedFood = food;
          _caloriesController.text = entry.kCalories?.toStringAsFixed(2) ?? "0";
          _proteinController.text = entry.proteinG?.toStringAsFixed(2) ?? "0";
          _kilojoulesController.text = entry.kCalories == null
              ? ''
              : (food.calories! * 4.184).toStringAsFixed(2);
        });
      },
    );
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
  void dispose() {
    super.dispose();
  }

  Future<void> _saveFood() async {
    if (_selectedFood?.name != _nameController?.text) {
      final foodId = await (db.foods.insertOne(
        FoodsCompanion.insert(
          name: _nameController!.text,
          calories: Value(double.tryParse(_caloriesController.text)),
          proteinG: Value(double.tryParse(_proteinController.text)),
          favorite: Value(_settings.favoriteNew),
          servingSize: Value(double.tryParse(_quantityController.text)),
          servingUnit: Value(_unit),
        ),
      ));
      final food = await (db.foods.select()..where((u) => u.id.equals(foodId)))
          .getSingle();

      setState(() {
        _selectedFood = food;
      });
    } else {
      await (db.foods.update()
            ..where((u) => u.id.equals(_selectedFood?.id ?? -1)))
          .write(
        FoodsCompanion(
          proteinG: Value(double.tryParse(_proteinController.text)),
          calories: Value(double.tryParse(_caloriesController.text)),
        ),
      );
      final food = await (db.foods.select()
            ..where((u) => u.id.equals(_selectedFood!.id)))
          .getSingle();

      setState(() {
        _selectedFood = food;
      });
    }
  }

  Future<void> _save() async {
    if (_foodDirty) await _saveFood();
    final food = _selectedFood!;
    final quantity = double.parse(_quantityController.text);
    final entry = calculateEntry(
      food: food,
      quantity: quantity,
      unit: _unit,
    ).copyWith(
      created: Value(_created),
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
      initialTime: TimeOfDay.fromDateTime(_created),
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

  void _recalc() {
    final food = _selectedFood!;
    final quantity = double.parse(_quantityController.text);
    final entry = calculateEntry(
      food: food,
      quantity: quantity,
      unit: _unit,
    ).copyWith(
      created: Value(_created),
    );

    setState(() {
      _caloriesController.text =
          entry.kCalories.value?.toStringAsFixed(2) ?? "0";
      _proteinController.text = entry.proteinG.value?.toStringAsFixed(2) ?? "0";
      _kilojoulesController.text =
          ((entry.kCalories.value ?? 0) * 4.184).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    _settings = context.watch<SettingsState>();

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
                      title: const Text('Confirm Delete'),
                      content: Text(
                        'Are you sure you want to delete ${_selectedFood?.name}?',
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
                return _search(textEditingValue.text);
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
                  _foodDirty = false;
                  _selectedFood = food;
                  if (lastEntry == null) return;
                  _quantityController.text = lastEntry.quantity.toString();
                  _unit = lastEntry.unit;
                });

                _recalc();
                _quantityNode.requestFocus();
                selectAll(_quantityController);
              },
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                _nameController = textEditingController;
                return TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  autofocus: widget.id == null,
                  controller: textEditingController,
                  focusNode: focusNode,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (String value) {
                    if (!_settings.selectEntryOnSubmit) return;
                    onFieldSubmitted();
                  },
                  onChanged: (value) => setState(() {
                    _foodDirty = true;
                  }),
                  textInputAction: _settings.selectEntryOnSubmit
                      ? TextInputAction.next
                      : null,
                );
              },
            ),
            TextField(
              controller: _quantityController,
              focusNode: _quantityNode,
              decoration: const InputDecoration(label: Text("Quantity")),
              keyboardType: TextInputType.number,
              onTap: () => _quantityController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: _quantityController.text.length,
              ),
              onChanged: (value) {
                _recalc();
              },
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                if (_selectedFood != null) _save();
              },
            ),
            DropdownButtonFormField<String>(
              value: _unit,
              decoration: const InputDecoration(labelText: 'Unit'),
              items: units.map((String value) {
                if (value == 'serving' && _selectedFood != null)
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      "serving (${(_selectedFood?.servingSize ?? 100)} ${_selectedFood?.servingUnit ?? _settings.foodUnit})",
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
                  _unit = newValue!;
                });
                _recalc();
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _caloriesController,
                    decoration: const InputDecoration(
                      labelText: 'Calories',
                    ),
                    onTap: () => selectAll(_caloriesController),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        _foodDirty = true;
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
                      decoration: const InputDecoration(
                        labelText: 'Kilojoules',
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        setState(() {
                          _foodDirty = true;
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
              decoration: const InputDecoration(
                labelText: 'Protein',
              ),
              onTap: () => selectAll(_proteinController),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  _foodDirty = true;
                });
              },
              textInputAction: TextInputAction.next,
            ),
            ListTile(
              title: const Text('Created Date'),
              subtitle:
                  Text(DateFormat(_settings.longDateFormat).format(_created)),
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
