import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'database/database.dart';

class QuickAddPage extends StatefulWidget {
  final int? entryId;

  const QuickAddPage({super.key, this.entryId});

  @override
  createState() => _QuickAddPageState();
}

class _QuickAddPageState extends State<QuickAddPage> {
  final caloriesController = TextEditingController(text: "600");
  var created = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.entryId != null) initCalories();
    selectAll(caloriesController);
  }

  void initCalories() async {
    final entry = await (db.entries.select()
          ..where((u) => u.id.equals(widget.entryId!)))
        .getSingle();
    caloriesController.text = entry.quantity.toStringAsFixed(2);
    selectAll(caloriesController);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _save() async {
    Navigator.pop(context);
    final food = await (db.foods.select()
          ..where((tbl) => tbl.name.equals('Quick-add'))
          ..limit(1))
        .getSingleOrNull();
    var foodId = food?.id;
    foodId ??= await (db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Quick-add',
        created: Value(DateTime.now()),
        calories: Value(100),
      ),
    ));

    final quantity = double.parse(caloriesController.text);
    if (widget.entryId == null)
      db.into(db.entries).insert(
            EntriesCompanion.insert(
              food: foodId,
              created: DateTime.now(),
              quantity: quantity,
              unit: 'grams',
            ),
          );
    else
      db.entries.update()
        ..where((u) => u.id.equals(widget.entryId!))
        ..write(
          EntriesCompanion(
            created: Value(DateTime.now()),
            quantity: Value(quantity),
          ),
        );
  }

  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: created,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      pickTime(pickedDate);
    }
  }

  Future<void> pickTime(DateTime pickedDate) async {
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

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quick add",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: material.Column(
          children: [
            TextField(
              autofocus: true,
              controller: caloriesController,
              decoration: const InputDecoration(label: Text("Calories")),
              keyboardType: TextInputType.number,
              onTap: () => selectAll(caloriesController),
              onSubmitted: (value) => _save(),
            ),
            ListTile(
              title: const Text('Created date'),
              subtitle: Text(
                DateFormat(settings.longDateFormat).format(created),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => pickDate(),
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
