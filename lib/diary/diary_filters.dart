import 'package:drift/drift.dart';
import 'package:fit_book/diary/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DiaryFilters extends StatefulWidget {
  const DiaryFilters({super.key});

  @override
  createState() => _DiaryFiltersState();
}

class _DiaryFiltersState extends State<DiaryFilters> {
  late final groupStream = (db.foods.selectOnly(distinct: true)
        ..orderBy([
          OrderingTerm(expression: db.foods.foodGroup),
        ])
        ..where(db.foods.foodGroup.isNotNull())
        ..addColumns([db.foods.foodGroup]))
      .watch();

  @override
  Widget build(BuildContext context) {
    final entriesState = context.watch<EntriesState>();

    return Badge.count(
      count: entriesState.filterCount,
      backgroundColor: Theme.of(context).colorScheme.primary,
      isLabelVisible: entriesState.filterCount > 0,
      child: PopupMenuButton(
        icon: const Icon(Icons.filter_list),
        itemBuilder: (popupContext) => [
          PopupMenuItem(
            child: StreamBuilder(
              stream: groupStream,
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
                    Navigator.pop(popupContext);
                  },
                );
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: const Text('Start date'),
              subtitle: Selector<SettingsState, String>(
                selector: (p0, p1) => p1.shortDateFormat,
                builder: (context, shortDateFormat, child) =>
                    entriesState.startDate != null
                        ? Text(
                            DateFormat(shortDateFormat)
                                .format(entriesState.startDate!),
                          )
                        : Text(shortDateFormat),
              ),
              onLongPress: () {
                entriesState.startDate = null;
                Navigator.pop(popupContext);
              },
              leading: const Icon(Icons.calendar_today),
              onTap: () async {
                Navigator.pop(popupContext);
                final DateTime? pickedDate = await showDatePicker(
                  context: popupContext,
                  initialDate: entriesState.startDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null)
                  entriesState.startDate = pickedDate.toLocal();
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: const Text('Stop date'),
              subtitle: Selector<SettingsState, String>(
                selector: (p0, p1) => p1.shortDateFormat,
                builder: (context, shortDateFormat, child) =>
                    entriesState.endDate != null
                        ? Text(
                            DateFormat(shortDateFormat)
                                .format(entriesState.endDate!),
                          )
                        : Text(shortDateFormat),
              ),
              onLongPress: () {
                entriesState.endDate = null;
                Navigator.pop(popupContext);
              },
              leading: const Icon(Icons.calendar_today),
              onTap: () async {
                Navigator.pop(popupContext);
                final DateTime? pickedDate = await showDatePicker(
                  context: popupContext,
                  initialDate: entriesState.endDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null)
                  entriesState.endDate = pickedDate.toLocal();
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.clear_all),
              title: Text("Clear (${entriesState.filterCount})"),
              onTap: () {
                entriesState.clear();
                Navigator.pop(popupContext);
              },
            ),
          ),
        ],
      ),
    );
  }
}
