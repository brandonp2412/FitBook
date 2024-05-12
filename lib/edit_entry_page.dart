import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_state.dart';
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
  final _repsController = TextEditingController();
  final _weightController = TextEditingController();
  DateTime _created = DateTime.now();
  late String _name;
  late SettingsState _settings;
  Food? _selectedFood;

  List<String> _nameOptions = [];

  @override
  void initState() {
    super.initState();
    _settings = context.read<SettingsState>();
    _name = widget.food?.name ?? "";
    _selectedFood = widget.food;
    (db.foods.selectOnly()..addColumns([db.foods.name])).get().then(
          (results) => setState(() {
            _nameOptions =
                results.map((result) => result.read(db.foods.name)!).toList();
          }),
        );
  }

  @override
  void dispose() {
    _repsController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    Navigator.pop(context);
    if (_selectedFood == null) return;
    var entry = EntriesCompanion.insert(
      food: _selectedFood!.id,
      created: _created,
      quantity: 0,
      unit: 'g',
    );

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
          widget.food != null ? 'Edit ${widget.food!.name}' : 'Add entry',
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
                return _nameOptions.where(
                  (option) => option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()),
                );
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
                  controller: textEditingController,
                  focusNode: focusNode,
                  onFieldSubmitted: (String value) {
                    onFieldSubmitted();
                  },
                  onChanged: (value) => setState(() {
                    _name = value;
                  }),
                );
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
