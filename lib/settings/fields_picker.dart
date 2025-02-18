import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FieldsPicker extends StatefulWidget {
  const FieldsPicker({super.key});

  @override
  createState() => _FieldsPickerState();
}

class _FieldsPickerState extends State<FieldsPicker> {
  var fields = db.foods.$columns.map((column) => column.name).toList();
  var search = '';
  bool showSelected = false;

  @override
  void initState() {
    super.initState();
    final settings = context.read<SettingsState>().value;
    if (settings.fields != null) fields = settings.fields!.split(',');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick fields"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              hintText: 'Search...',
              onChanged: (value) => setState(() {
                search = value;
              }),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  if (fields.length <= 1)
                    setState(() {
                      fields = db.foods.$columns
                          .map((column) => column.name)
                          .toList();
                    });
                  else
                    setState(() {
                      fields = [];
                    });
                },
                label: Text("Select all"),
                icon: Icon(Icons.check),
              ),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    showSelected = !showSelected;
                  });
                },
                label: Text("Show selected"),
                icon: showSelected
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_outlined),
              ),
            ],
          ),
          ...db.foods.$columns.where(
            (column) {
              if (showSelected && !fields.contains(column.name)) return false;

              return sentenceCase(column.name.toLowerCase())
                      .toLowerCase()
                      .contains(search.toLowerCase()) &&
                  !excludedFields.contains(column.name);
            },
          ).map(
            (column) => ListTile(
              title: Text(sentenceCase(column.name)),
              onTap: () {
                setState(() {
                  if (fields.contains(column.name))
                    fields.remove(column.name);
                  else
                    fields.add(column.name);
                });
              },
              leading: Switch(
                value: fields.contains(column.name),
                onChanged: (value) {
                  setState(() {
                    if (value)
                      fields.add(column.name);
                    else
                      fields.remove(column.name);
                  });
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          db.settings.update().write(
                SettingsCompanion(
                  fields: Value(
                    fields.where((field) => field.isNotEmpty).join(','),
                  ),
                ),
              );
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
