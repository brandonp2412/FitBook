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
  final WeightsCompanion weight;

  const EditWeightPage({
    super.key,
    required this.weight,
  });

  @override
  createState() => _EditWeightPageState();
}

class _EditWeightPageState extends State<EditWeightPage> {
  final TextEditingController valueController = TextEditingController();

  String unit = 'kg';
  String convertTo = 'kg';
  DateTime created = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectAll(valueController);
    created = widget.weight.created.value;
    final settings = context.read<SettingsState>().value;
    if (settings.convertWeight != null && !widget.weight.id.present)
      setState(() {
        convertTo = settings.convertWeight!;
        valueController.text = widget.weight.amount.value.toStringAsFixed(2);

        if (convertTo == 'kg') {
          valueController.text =
              (widget.weight.amount.value * 2.20462262185).toStringAsFixed(2);
          unit = 'lb';
        }

        if (convertTo == 'lb') {
          valueController.text =
              (widget.weight.amount.value / 2.20462262185).toStringAsFixed(2);
          unit = 'kg';
        }
      });
    else
      setState(() {
        unit = widget.weight.unit.value;
        valueController.text = widget.weight.amount.value.toStringAsFixed(2);
      });
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: created,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _selectTime(pickedDate);
    }
  }

  Future<void> _selectTime(DateTime pickedDate) async {
    final settings = context.read<SettingsState>().value;
    if (!settings.longDateFormat.contains('h:mm') &&
        !settings.longDateFormat.contains('H:mm'))
      return setState(() {
        created = pickedDate;
      });

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(created),
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

  save() async {
    Navigator.of(context).pop();
    var amount = double.parse(valueController.text);
    if (unit == 'kg' && convertTo == 'lb') {
      amount *= 2.20462262185;
      unit = 'lb';
    }
    if (unit == 'lb' && convertTo == 'kg') {
      amount /= 2.20462262185;
      unit = 'kg';
    }

    if (widget.weight.id.present)
      (db.weights.update()..where((u) => u.id.equals(widget.weight.id.value)))
          .write(
        WeightsCompanion(
          unit: Value(unit),
          amount: Value(amount),
          created: Value(created),
        ),
      );
    else
      db.weights.insertOne(
        WeightsCompanion.insert(
          created: DateTime.now(),
          unit: unit,
          amount: amount,
        ),
      );

    final settings = context.read<SettingsState>().value;
    if (settings.targetWeight == null) return;
    final show = shouldNotify(
      amount,
      widget.weight.amount.value,
      settings.targetWeight!,
    );
    if (!show) return;
    final random = Random();
    final message =
        positiveReinforcements[random.nextInt(positiveReinforcements.length)];

    toast(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.weight.id.present ? "Edit weight" : "Add weight"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share(
                "I just weighed ${valueController.text} $unit!",
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
                controller: valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Weight ($unit)'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter weight' : null,
                autofocus: !widget.weight.id.present,
                onTap: () => selectAll(valueController),
                onFieldSubmitted: (value) => save(),
              ),
              TextFormField(
                controller: TextEditingController(
                  text:
                      "${widget.weight.amount.value.toStringAsFixed(2)} ${widget.weight.unit.value}",
                ),
                decoration: const InputDecoration(labelText: 'Last weight'),
                enabled: false,
              ),
              const SizedBox(height: 8.0),
              ListTile(
                title: Text("Unit ($unit)"),
                leading: unit == 'kg'
                    ? const Icon(Icons.straighten)
                    : const Icon(Icons.square_foot),
                onTap: () => setState(() {
                  unit = unit == 'kg' ? 'lb' : 'kg';
                  convertTo = unit;
                }),
                trailing: Switch(
                  value: unit == 'kg',
                  onChanged: (value) => setState(() {
                    if (value)
                      unit = 'kg';
                    else
                      unit = 'lb';
                    convertTo = unit;
                  }),
                ),
              ),
              ListTile(
                title: convertTo == unit
                    ? Text("Keep unit as $unit")
                    : Text("Convert to $convertTo"),
                leading: const Icon(Icons.conveyor_belt),
                onTap: () {
                  setState(() {
                    convertTo = convertTo == 'kg' ? 'lb' : 'kg';
                  });
                  db.settings.update().write(
                        SettingsCompanion(
                          convertWeight: Value(convertTo),
                        ),
                      );
                },
                trailing: Switch(
                  value: convertTo == 'kg',
                  onChanged: (value) {
                    setState(() {
                      if (value)
                        convertTo = 'kg';
                      else
                        convertTo = 'lb';
                    });

                    db.settings.update().write(
                          SettingsCompanion(
                            convertWeight: Value(convertTo),
                          ),
                        );
                  },
                ),
              ),
              ListTile(
                title: const Text('Created Date'),
                subtitle: Selector<SettingsState, String>(
                  selector: (p0, settings) => settings.value.longDateFormat,
                  builder: (context, longDateFormat, child) =>
                      Text(DateFormat(longDateFormat).format(created)),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        tooltip: "Save",
        child: const Icon(Icons.save),
      ),
    );
  }
}
