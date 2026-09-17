import 'package:drift/drift.dart';
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FieldsPicker extends StatefulWidget {
  const FieldsPicker({super.key});

  @override
  State<FieldsPicker> createState() => _FieldsPickerState();
}

class _FieldsPickerState extends State<FieldsPicker> {
  var fields = db.foods.$columns.map((column) => column.name).toList();
  var search = '';
  bool showSelected = false;
  final ctrl = ScrollController();

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
        title: Text(context.l10n.pickFields),
      ),
      body: ListView(
        controller: ctrl,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              hintText: context.l10n.search,
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
                label: Text(context.l10n.selectAll),
                icon: Icon(Icons.check),
              ),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    showSelected = !showSelected;
                  });
                },
                label: showSelected
                    ? Text(context.l10n.all)
                    : Text(context.l10n.onlySelected),
                icon: showSelected
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_outlined),
              ),
            ],
          ),
          ...db.foods.$columns.where(
            (column) {
              if (showSelected && !fields.contains(column.name)) return false;

              return localizedFoodFieldLabel(context.l10n, column.name)
                      .toLowerCase()
                      .contains(search.toLowerCase()) &&
                  !excludedFields.contains(column.name);
            },
          ).map(
            (column) => ListTile(
              title: Text(localizedFoodFieldLabel(context.l10n, column.name)),
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
      floatingActionButton: AnimatedFab(
        onTap: () async {
          final updates = await (db.settings.update().writeReturning(
                SettingsCompanion(
                  fields: Value(
                    fields.where((field) => field.isNotEmpty).join(','),
                  ),
                ),
              ));
          if (!context.mounted) return;

          final state = context.read<SettingsState>();
          state.setValue(updates.first);
          Navigator.pop(context);
        },
        icon: Icons.save,
        label: context.l10n.save,
        scroll: ctrl,
      ),
    );
  }
}
