import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'database.dart';

class EditEntryPage extends StatefulWidget {
  final Entry entry;
  final Food? food;

  const EditEntryPage({super.key, required this.entry, this.food});

  @override
  createState() => _EditEntryPageState();
}

class _EditEntryPageState extends State<EditEntryPage> {
  final _quantityController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _kilojoulesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _proteinNode = FocusNode();

  late String _name;
  late SettingsState _settings;

  DateTime _created = DateTime.now();
  Food? _selectedFood;
  TextEditingController? _nameController;
  var _unit = 'serving';
  bool _foodDirty = false;

  @override
  void initState() {
    super.initState();
    _settings = context.read<SettingsState>();
    _name = widget.food?.name ?? "";
    _selectedFood = widget.food;
    _quantityController.text = widget.entry.quantity.toString();
    _created = widget.entry.created;
    _unit = widget.entry.unit;

    if (widget.food != null) {
      _caloriesController.text = widget.food?.calories?.toString() ?? "";
      _proteinController.text = widget.food?.proteinG?.toString() ?? "";
      _kilojoulesController.text = widget.food?.calories == null
          ? ''
          : (widget.food!.calories! * 4.184).toStringAsFixed(2);
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
    var entry = EntriesCompanion.insert(
      food: food.id,
      created: _created,
      quantity: quantity,
      unit: _unit,
    );

    if (_unit == 'kilojoules') {
      final grams = quantity / 4.184;
      entry = entry.copyWith(
        kCalories: Value(grams / 100 * (food.calories ?? 1)),
      );
    } else {
      final quantity100G = _unit == 'serving'
          ? (quantity * (food.servingWeight1G ?? 100)) / 100
          : convertToGrams(quantity, _unit) / 100;
      final kCalories = quantity100G * (food.calories ?? 100);
      final proteinG = quantity100G * (food.proteinG ?? 0);
      final fatG = quantity100G * (food.fatG ?? 0);
      final carbG = quantity100G * (food.carbohydrateG ?? 0);
      entry = entry.copyWith(
        kCalories: Value(kCalories),
        fatG: Value(fatG),
        carbG: Value(carbG),
        proteinG: Value(proteinG),
      );
    }

    if (widget.entry.id > 0)
      await db.update(db.entries).replace(
            entry.copyWith(
              id: Value(widget.entry.id),
            ),
          );
    else
      await db.into(db.entries).insert(entry);
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

  @override
  Widget build(BuildContext context) {
    _settings = context.watch<SettingsState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.food != null ? 'Edit entry' : 'Add entry',
        ),
        actions: [
          if (widget.food != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: Text(
                        'Are you sure you want to delete ${widget.food!.name}?',
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
                            await db.delete(db.entries).delete(widget.entry);
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
                  _foodDirty = false;
                  _selectedFood = food;
                  final quantity = double.parse(_quantityController.text);
                  if (_unit == 'kilojoules') {
                    final grams = quantity / 4.184;
                    final kCalories = grams / 100 * (food.calories ?? 1);
                    _caloriesController.text = kCalories.toString();
                  } else {
                    final quantity100G = _unit == 'serving'
                        ? (quantity * (food.servingWeight1G ?? 100)) / 100
                        : convertToGrams(quantity, _unit) / 100;
                    final kCalories = quantity100G * (food.calories ?? 100);
                    final proteinG = quantity100G * (food.proteinG ?? 0);
                    _caloriesController.text = kCalories.toString();
                    _proteinController.text = proteinG.toString();
                    _kilojoulesController.text =
                        (kCalories * 4.184).toStringAsFixed(2);
                  }
                });
              },
              initialValue: TextEditingValue(text: _name),
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                _nameController = textEditingController;
                return TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  autofocus: widget.entry.id == 0,
                  controller: textEditingController,
                  focusNode: focusNode,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (String value) {
                    onFieldSubmitted();
                  },
                  onChanged: (value) => setState(() {
                    _name = value;
                  }),
                );
              },
            ),
            TextField(
              controller: _quantityController,
              decoration: const InputDecoration(label: Text("Quantity")),
              keyboardType: TextInputType.number,
              onTap: () => _quantityController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: _quantityController.text.length,
              ),
              onChanged: (value) {
                final food = _selectedFood!;
                final quantity = double.parse(_quantityController.text);
                if (_unit == 'kilojoules') {
                  final grams = quantity / 4.184;
                  final kCalories = grams / 100 * (food.calories ?? 1);
                  _caloriesController.text = kCalories.toString();
                } else {
                  final quantity100G = _unit == 'serving'
                      ? (quantity * (food.servingWeight1G ?? 100)) / 100
                      : convertToGrams(quantity, _unit) / 100;
                  final kCalories = quantity100G * (food.calories ?? 100);
                  final proteinG = quantity100G * (food.proteinG ?? 0);
                  _caloriesController.text = kCalories.toString();
                  _proteinController.text = proteinG.toString();
                }
              },
            ),
            DropdownButtonFormField<String>(
              value: _unit,
              decoration: const InputDecoration(labelText: 'Unit'),
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
            TextField(
              controller: _caloriesController,
              decoration: InputDecoration(
                labelText: 'Calories ${_foodDirty ? '(per 100g)' : ''}',
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
                _proteinNode.requestFocus();
                selectAll(_proteinController);
              },
            ),
            if (_unit != 'kilojoules')
              TextField(
                controller: _kilojoulesController,
                decoration: InputDecoration(
                  labelText: 'Kilojoules ${_foodDirty ? '(per 100g)' : ''}',
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
              ),
            TextField(
              controller: _proteinController,
              focusNode: _proteinNode,
              decoration: InputDecoration(
                labelText: 'Protein ${_foodDirty ? '(per 100g)' : ''}',
              ),
              onTap: () => selectAll(_proteinController),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  _foodDirty = true;
                });
              },
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
        child: const Icon(Icons.save),
      ),
    );
  }
}
