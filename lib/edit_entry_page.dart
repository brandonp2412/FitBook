import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
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
  late String _name;
  late SettingsState _settings;

  DateTime _created = DateTime.now();
  Food? _selectedFood;
  var _unit = 'serving';

  @override
  void initState() {
    super.initState();
    _settings = context.read<SettingsState>();
    _name = widget.food?.name ?? "";
    _selectedFood = widget.food;
    _quantityController.text = widget.entry.quantity.toString();
    _created = widget.entry.created;
    _unit = widget.entry.unit;
  }

  Future<List<String>> _search(String term) async {
    return await (db.foods.selectOnly()
          ..where(db.foods.name.contains(term.toLowerCase()))
          ..limit(30)
          ..addColumns([db.foods.name]))
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

  Future<void> _save() async {
    Navigator.pop(context);
    if (_selectedFood == null) return;
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
      db.update(db.entries).replace(
            entry.copyWith(
              id: Value(widget.entry.id),
            ),
          );
    else
      db.into(db.entries).insert(entry);
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
    if (!_settings.longDateFormat.contains('h:mm')) return;

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

  void _updateFields(Food food, Entry entry) {
    setState(() {
      _selectedFood = food;
    });
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
        child: material.Column(
          children: [
            Autocomplete<String>(
              optionsBuilder: (textEditingValue) {
                return _search(textEditingValue.text);
              },
              onSelected: (option) async {
                final last = await (db.foods.select()
                      ..where((tbl) => tbl.name.equals(option))
                      ..limit(1))
                    .getSingleOrNull();
                if (last == null) return;
                _updateFields(last, widget.entry);
              },
              initialValue: TextEditingValue(text: _name),
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                return TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  autofocus: true,
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
