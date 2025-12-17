import 'package:drift/drift.dart';
import 'package:fit_book/animated_fab.dart';
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
  final int? id;

  const QuickAddPage({super.key, this.id});

  @override
  createState() => _QuickAddPageState();
}

class _QuickAddPageState extends State<QuickAddPage> {
  final cal = TextEditingController(text: "600");
  var created = DateTime.now();
  final kj = TextEditingController(text: "2,510.4");
  final protein = TextEditingController(text: "0");
  final carb = TextEditingController(text: "0");
  final fat = TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    if (widget.id == null) {
      final last = await (db.diaries.selectOnly().join(
        [innerJoin(db.foods, db.diaries.food.equalsExp(db.foods.id))],
      )
            ..addColumns(
              [
                db.foods.calories,
                db.foods.proteinG,
                db.foods.carbohydrateG,
                db.foods.fatG,
              ],
            )
            ..where(db.foods.name.equals('Quick-add'))
            ..orderBy([
              OrderingTerm(
                expression: db.diaries.created,
                mode: OrderingMode.desc,
              ),
            ])
            ..limit(1))
          .getSingleOrNull();
      if (last == null) return;
      cal.text = last.read(db.foods.calories)!.toString();
      kj.text = formatter.format(formatter.parse(cal.text) * 4.184);
      protein.text = last.read(db.foods.proteinG)!.toString();
      carb.text = last.read(db.foods.carbohydrateG)!.toString();
      fat.text = last.read(db.foods.fatG)!.toString();

      return;
    }

    final entry = await (db.diaries.select()
          ..where((u) => u.id.equals(widget.id!)))
        .getSingle();
    final food = await (db.foods.select()
          ..where((u) => u.id.equals(entry.food)))
        .getSingle();
    cal.text = food.calories?.toStringAsFixed(2) ?? "0";
    protein.text = food.proteinG?.toStringAsFixed(2) ?? "0";
    carb.text = food.carbohydrateG?.toStringAsFixed(2) ?? "0";
    fat.text = food.fatG?.toStringAsFixed(2) ?? "0";
    setState(() {
      created = entry.created;
    });
    selectAll(cal);
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
        calories: Value(double.parse(cal.text)),
        proteinG: Value(double.parse(protein.text)),
        carbohydrateG: Value(double.parse(carb.text)),
        fatG: Value(double.parse(fat.text)),
        servingSize: Value(1.0),
        servingUnit: Value('serving'),
      ),
    ));

    final qty = 1.0;
    if (widget.id == null)
      db.into(db.diaries).insert(
            DiariesCompanion.insert(
              food: foodId,
              created: created,
              quantity: qty,
              unit: 'serving',
            ),
          );
    else
      db.diaries.update()
        ..where((u) => u.id.equals(widget.id!))
        ..write(
          DiariesCompanion(
            food: Value(foodId),
            created: Value(created),
            quantity: Value(qty),
            unit: Value('serving'),
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
              controller: cal,
              decoration: const InputDecoration(label: Text("Calories")),
              keyboardType: TextInputType.number,
              onTap: () => selectAll(cal),
              onSubmitted: (value) => save(),
              onChanged: (value) {
                setState(() {
                  kj.text = formatter.format(formatter.parse(value) * 4.184);
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              controller: kj,
              decoration: InputDecoration(
                labelText: 'Kilojoules',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  cal.text = formatter.format(formatter.parse(value) / 4.184);
                });
              },
              onSubmitted: (value) => selectAll(protein),
              onTap: () => selectAll(kj),
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
      floatingActionButton: AnimatedFab(
        onTap: save,
        label: 'Save',
        icon: Icons.save,
        scroll: ScrollController(),
      ),
    );
  }
}
