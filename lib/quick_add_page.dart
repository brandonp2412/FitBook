import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'database/database.dart';

final formatter = NumberFormat.decimalPattern()..maximumFractionDigits = 2;

class QuickAddPage extends StatefulWidget {
  final int? entryId;

  const QuickAddPage({super.key, this.entryId});

  @override
  createState() => _QuickAddPageState();
}

class _QuickAddPageState extends State<QuickAddPage> {
  final calories = TextEditingController(text: "600");
  var created = DateTime.now();
  final kilojoules = TextEditingController(text: "2,510.4");
  final protein = TextEditingController(text: "0");
  final carb = TextEditingController(text: "0");
  final fat = TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    if (widget.entryId == null) {
      final last = await (db.entries.selectOnly().join(
        [innerJoin(db.foods, db.entries.food.equalsExp(db.foods.id))],
      )
            ..addColumns(
              [
                db.entries.quantity,
                db.foods.proteinG,
                db.foods.carbohydrateG,
                db.foods.fatG,
              ],
            )
            ..where(db.foods.name.equals('Quick-add'))
            ..orderBy([
              OrderingTerm(
                expression: db.entries.created,
                mode: OrderingMode.desc,
              ),
            ])
            ..limit(1))
          .getSingleOrNull();
      if (last == null) return;
      calories.text = last.read(db.entries.quantity)!.toString();
      kilojoules.text =
          formatter.format(formatter.parse(calories.text) * 4.184);
      protein.text = last.read(db.foods.proteinG)!.toString();
      carb.text = last.read(db.foods.carbohydrateG)!.toString();
      fat.text = last.read(db.foods.fatG)!.toString();

      return;
    }

    final entry = await (db.entries.select()
          ..where((u) => u.id.equals(widget.entryId!)))
        .getSingle();
    final food = await (db.foods.select()
          ..where((u) => u.id.equals(entry.food)))
        .getSingle();
    calories.text = entry.quantity.toStringAsFixed(2);
    protein.text = food.proteinG.toString();
    carb.text = food.carbohydrateG.toString();
    fat.text = food.fatG.toString();
    setState(() {
      created = entry.created;
    });
    selectAll(calories);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> save() async {
    Navigator.pop(context);
    final foodId = await (db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Quick-add',
        created: Value(created),
        calories: Value(100),
        proteinG: Value(double.parse(protein.text)),
        carbohydrateG: Value(double.parse(carb.text)),
        fatG: Value(double.parse(fat.text)),
      ),
    ));

    final quantity = double.parse(calories.text);
    if (widget.entryId == null)
      db.into(db.entries).insert(
            EntriesCompanion.insert(
              food: foodId,
              created: created,
              quantity: quantity,
              unit: 'grams',
            ),
          );
    else
      db.entries.update()
        ..where((u) => u.id.equals(widget.entryId!))
        ..write(
          EntriesCompanion(
            created: Value(created),
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
              controller: calories,
              decoration: const InputDecoration(label: Text("Calories")),
              keyboardType: TextInputType.number,
              onTap: () => selectAll(calories),
              onSubmitted: (value) => save(),
              onChanged: (value) {
                setState(() {
                  kilojoules.text =
                      formatter.format(formatter.parse(value) * 4.184);
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              controller: kilojoules,
              decoration: InputDecoration(
                labelText: 'Kilojoules',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  calories.text =
                      formatter.format(formatter.parse(value) / 4.184);
                });
              },
              onSubmitted: (value) => selectAll(protein),
              onTap: () => selectAll(kilojoules),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: protein,
              decoration: InputDecoration(
                labelText: 'Protein',
              ),
              onTap: () => selectAll(protein),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => selectAll(carb),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: carb,
              decoration: InputDecoration(
                labelText: 'Carbs',
              ),
              onTap: () => selectAll(carb),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              onSubmitted: (value) => selectAll(fat),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: fat,
              decoration: InputDecoration(
                labelText: 'Fat',
              ),
              onTap: () => selectAll(fat),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => save(),
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
        onPressed: save,
        tooltip: 'Save',
        child: const Icon(Icons.save),
      ),
    );
  }
}
