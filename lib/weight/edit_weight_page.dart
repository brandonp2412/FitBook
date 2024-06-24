import 'dart:math';

import 'package:drift/drift.dart' as drift;
import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class EditWeightPage extends StatefulWidget {
  final Weight weight;
  final Weight lastWeight;

  const EditWeightPage({
    super.key,
    required this.weight,
    required this.lastWeight,
  });

  @override
  createState() => _EditWeightPageState();
}

class _EditWeightPageState extends State<EditWeightPage> {
  late SettingsState _settings;
  final TextEditingController _valueController = TextEditingController();
  String _unit = 'kg';
  DateTime _created = DateTime.now();

  @override
  void initState() {
    super.initState();
    _valueController.text = widget.weight.amount.toString();
    _unit = widget.weight.unit;
    selectAll(_valueController);
    _created = widget.weight.created;
    _settings = context.read<SettingsState>();
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

  _save() async {
    Navigator.of(context).pop();
    final amount = double.parse(_valueController.text);
    if (widget.weight.id == -1)
      db.weights.insertOne(
        WeightsCompanion.insert(
          created: DateTime.now(),
          unit: _unit,
          amount: amount,
        ),
      );
    else
      (db.weights.update()..where((u) => u.id.equals(widget.weight.id))).write(
        WeightsCompanion(
          unit: Value(_unit),
          amount: Value(amount),
          created: Value(_created),
        ),
      );

    if (_settings.targetWeight == null) return;
    final show =
        shouldNotify(amount, widget.lastWeight.amount, _settings.targetWeight!);
    if (!show) return;
    final random = Random();
    final message =
        positiveReinforcements[random.nextInt(positiveReinforcements.length)];

    if (mounted)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    _settings = context.watch<SettingsState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.weight.id == -1 ? "Add weight" : "Edit weight"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share(
                "I just weighed ${widget.weight.amount} ${widget.weight.unit}!",
              );
            },
          ),
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Weight ($_unit)'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter weight' : null,
                autofocus: widget.weight.id == -1,
                onTap: () => selectAll(_valueController),
                onFieldSubmitted: (value) => _save(),
              ),
              TextFormField(
                controller: TextEditingController(
                  text: "${widget.lastWeight.amount} ${widget.lastWeight.unit}",
                ),
                decoration: const InputDecoration(labelText: 'Last weight'),
                enabled: false,
              ),
              const SizedBox(height: 8.0),
              ListTile(
                title: Text("Unit ($_unit)"),
                leading: _unit == 'kg'
                    ? const Icon(Icons.straighten)
                    : const Icon(Icons.square_foot),
                onTap: () => setState(() {
                  _unit = _unit == 'kg' ? 'lb' : 'kg';
                }),
                trailing: Switch(
                  value: _unit == 'kg',
                  onChanged: (value) => setState(() {
                    if (value)
                      _unit = 'kg';
                    else
                      _unit = 'lb';
                  }),
                ),
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
