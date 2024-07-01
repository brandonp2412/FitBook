import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

import 'database/database.dart';

class QuickAddPage extends StatefulWidget {
  const QuickAddPage({super.key});

  @override
  createState() => _QuickAddPageState();
}

class _QuickAddPageState extends State<QuickAddPage> {
  final caloriesController = TextEditingController(text: "600");

  @override
  void initState() {
    super.initState();
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
      ),
    ));

    final quantity = double.parse(caloriesController.text);
    var entry = EntriesCompanion.insert(
      food: foodId,
      created: DateTime.now(),
      quantity: quantity,
      unit: 'grams',
    );
    entry = entry.copyWith(
      kCalories: Value(quantity),
    );
    db.into(db.entries).insert(entry);
  }

  @override
  Widget build(BuildContext context) {
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
