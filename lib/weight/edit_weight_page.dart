import 'package:drift/drift.dart' as drift;
import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditWeightPage extends StatefulWidget {
  final Weight weight;

  const EditWeightPage({super.key, required this.weight});

  @override
  createState() => _EditWeightPageState();
}

class _EditWeightPageState extends State<EditWeightPage> {
  late SettingsState _settings;
  final TextEditingController _valueController = TextEditingController();
  String _lastWeight = "";
  String _unit = 'kg';
  DateTime _created = DateTime.now();

  @override
  void initState() {
    super.initState();
    _valueController.text = widget.weight.amount.toString();
    selectAll(_valueController);
    _created = widget.weight.created;
    _settings = context.read<SettingsState>();
    (db.weights.select()
          ..orderBy([
            (tbl) => OrderingTerm(
                  expression: tbl.created,
                  mode: OrderingMode.desc,
                ),
          ])
          ..limit(1))
        .getSingleOrNull()
        .then(
          (value) => setState(() {
            _lastWeight = value?.amount.toString() ?? "0";
          }),
        );
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

  _save() {
    Navigator.of(context).pop();
    if (widget.weight.id == -1)
      db.weights.insertOne(
        WeightsCompanion.insert(
          created: DateTime.now(),
          unit: _unit,
          amount: double.parse(_valueController.text),
        ),
      );
    else
      (db.weights.update()..where((u) => u.id.equals(widget.weight.id))).write(
        WeightsCompanion(
          unit: Value(_unit),
          amount: Value(double.parse(_valueController.text)),
          created: Value(_created),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    _settings = context.watch<SettingsState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Enter weight')),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: material.Column(
            children: [
              TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Weight'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter weight' : null,
                autofocus: widget.weight.id == -1,
                onTap: () => selectAll(_valueController),
                onFieldSubmitted: (value) => _save(),
              ),
              DropdownButtonFormField<String>(
                value: _unit,
                decoration: const InputDecoration(labelText: 'Unit'),
                items: (['kg', 'lb']).map((String value) {
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
              TextFormField(
                controller: TextEditingController(text: _lastWeight),
                decoration: const InputDecoration(labelText: 'Last weight'),
                enabled: false,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _save,
        tooltip: "Save",
        child: const Icon(Icons.save),
      ),
    );
  }
}
