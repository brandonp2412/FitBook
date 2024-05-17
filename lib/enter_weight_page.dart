import 'package:drift/drift.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:drift/drift.dart' as drift;

class EnterWeightPage extends StatefulWidget {
  const EnterWeightPage({super.key});

  @override
  createState() => _EnterWeightPageState();
}

class _EnterWeightPageState extends State<EnterWeightPage> {
  final TextEditingController _valueController = TextEditingController();
  String _yesterdaysWeight = "";
  String _unit = 'kg';

  @override
  void initState() {
    super.initState();
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
            _yesterdaysWeight = value?.amount.toString() ?? "0";
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Weight')),
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
                autofocus: true,
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
                controller: TextEditingController(text: _yesterdaysWeight),
                decoration: const InputDecoration(labelText: 'Previous weight'),
                enabled: false,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pop(context);
          db.weights.insertOne(
            WeightsCompanion.insert(
              created: DateTime.now().toLocal(),
              unit: _unit,
              amount: double.parse(_valueController.text),
            ),
          );
        },
        tooltip: "Save today's weight",
        child: const Icon(Icons.save),
      ),
    );
  }
}
