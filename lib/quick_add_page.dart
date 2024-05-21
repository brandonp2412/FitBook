import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

import 'database.dart';

class QuickAddPage extends StatefulWidget {
  const QuickAddPage({super.key});

  @override
  createState() => _QuickAddPageState();
}

class _QuickAddPageState extends State<QuickAddPage> {
  final _quantityController = TextEditingController(text: "600");

  @override
  void initState() {
    super.initState();
    selectAll(_quantityController);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _save() async {
    Navigator.pop(context);
    final food = await (db.foods.select()
          ..where((tbl) => tbl.name.equals('Calories'))
          ..limit(1))
        .getSingle();
    final quantity = double.parse(_quantityController.text);
    var entry = EntriesCompanion.insert(
      food: food.id,
      created: DateTime.now(),
      quantity: quantity,
      unit: 'grams',
    );
    final quantity100G = quantity / 100;
    final kCalories = quantity100G * (food.calories ?? 100);
    entry = entry.copyWith(
      kCalories: Value(kCalories),
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
              controller: _quantityController,
              decoration: const InputDecoration(label: Text("Calories (kcal)")),
              keyboardType: TextInputType.number,
              onTap: () => _quantityController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: _quantityController.text.length,
              ),
              onSubmitted: (value) => _save(),
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
