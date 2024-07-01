import 'package:drift/drift.dart';
import 'package:fit_book/diary/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DiaryFilters extends StatefulWidget {
  final BuildContext dialogContext;

  const DiaryFilters({super.key, required this.dialogContext});

  @override
  createState() => _DiaryFiltersState();
}

class _DiaryFiltersState extends State<DiaryFilters> {
  late final _groupStream = (db.foods.selectOnly(distinct: true)
        ..orderBy([
          OrderingTerm(expression: db.foods.foodGroup),
        ])
        ..where(db.foods.foodGroup.isNotNull())
        ..addColumns([db.foods.foodGroup]))
      .watch();

  @override
  Widget build(BuildContext context) {
    final entriesState = context.watch<EntriesState>();
    final settings = context.watch<SettingsState>();

    return AlertDialog(
      title: const Text("Filter"),
      content: SingleChildScrollView(
        child: material.Column(
          children: [
            StreamBuilder(
              stream: _groupStream,
              builder: (context, snapshot) {
                return DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Food group',
                  ),
                  value: entriesState.foodGroup,
                  items: snapshot.data
                      ?.map(
                        (result) => DropdownMenuItem(
                          value: result.read(db.foods.foodGroup)!,
                          child: Text(
                            result.read(db.foods.foodGroup)!,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    entriesState.foodGroup = value;
                  },
                );
              },
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('Start date'),
              subtitle: entriesState.startDate != null
                  ? Text(
                      DateFormat(settings.shortDateFormat)
                          .format(entriesState.startDate!),
                    )
                  : null,
              onLongPress: () => entriesState.startDate = null,
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: entriesState.startDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null)
                  entriesState.startDate = pickedDate.toLocal();
              },
            ),
            ListTile(
              title: const Text('Stop date'),
              subtitle: entriesState.endDate != null
                  ? Text(
                      DateFormat(settings.shortDateFormat)
                          .format(entriesState.endDate!),
                    )
                  : null,
              onLongPress: () => entriesState.endDate = null,
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: entriesState.endDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null)
                  entriesState.endDate = pickedDate.toLocal();
              },
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: <Widget>[
        TextButton(
          child: const Text('Clear'),
          onPressed: () {
            entriesState.clear();
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
