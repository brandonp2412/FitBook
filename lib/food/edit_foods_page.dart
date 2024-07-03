import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';

class EditFoodsPage extends StatefulWidget {
  const EditFoodsPage({super.key, required this.ids});

  final List<int> ids;

  @override
  createState() => _EditFoodsPageState();
}

class _EditFoodsPageState extends State<EditFoodsPage> {
  final nameController = TextEditingController();
  final foodGroupController = TextEditingController();
  final caloriesController = TextEditingController();
  final kilojoulesController = TextEditingController();
  final fatGController = TextEditingController();
  final proteinGController = TextEditingController();
  final carbohydrateGController = TextEditingController();
  final servingSizeController = TextEditingController();

  String? servingUnit;
  String? oldNames;

  @override
  void initState() {
    super.initState();
    (db.foods.select()..where((u) => u.id.isIn(widget.ids)))
        .get()
        .then((foods) {
      setState(() {
        oldNames = foods.map((food) => food.name).join(',');
      });
    });
  }

  void save() async {
    final food = FoodsCompanion(
      name: nameController.text.isNotEmpty
          ? Value(nameController.text)
          : const Value.absent(),
      foodGroup: foodGroupController.text.isNotEmpty
          ? Value(foodGroupController.text)
          : const Value.absent(),
      calories: caloriesController.text.isNotEmpty
          ? Value(double.parse(caloriesController.text))
          : const Value.absent(),
      proteinG: proteinGController.text.isNotEmpty
          ? Value(double.parse(proteinGController.text))
          : const Value.absent(),
      carbohydrateG: carbohydrateGController.text.isNotEmpty
          ? Value(double.parse(carbohydrateGController.text))
          : const Value.absent(),
      servingSize: servingSizeController.text.isNotEmpty
          ? Value(double.parse(servingSizeController.text))
          : const Value.absent(),
      servingUnit:
          servingUnit != null ? Value(servingUnit) : const Value.absent(),
    );
    await (db.foods.update()..where((u) => u.id.isIn(widget.ids))).write(food);
    if (mounted) Navigator.pop(context);
  }

  String snakeToSentenceCase(String input) {
    if (input.isEmpty) return input;

    return input
        .split('_')
        .map(
          (word) => word.isEmpty
              ? ''
              : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit ${widget.ids.length} foods"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  InputDecoration(labelText: 'Name', hintText: oldNames),
            ),
            TextField(
              controller: foodGroupController,
              decoration: const InputDecoration(labelText: 'Food group'),
            ),
            TextField(
              controller: caloriesController,
              decoration: const InputDecoration(labelText: 'Calories'),
            ),
            TextField(
              controller: kilojoulesController,
              decoration: const InputDecoration(labelText: 'Kilojoules'),
            ),
            TextField(
              controller: fatGController,
              decoration: const InputDecoration(labelText: 'Fat'),
            ),
            TextField(
              controller: proteinGController,
              decoration: const InputDecoration(labelText: 'Protein'),
            ),
            TextField(
              controller: servingSizeController,
              decoration: const InputDecoration(labelText: 'Serving size'),
            ),
            DropdownButtonFormField<String>(
              value: servingUnit,
              decoration: const InputDecoration(labelText: 'Unit'),
              items: units.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  servingUnit = newValue!;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => save(),
        child: const Icon(Icons.save),
      ),
    );
  }
}
