import 'package:drift/drift.dart';
import 'package:fit_book/diary/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DiaryFilters extends StatefulWidget {
  const DiaryFilters({
    super.key,
  });

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
    final state = context.watch<EntriesState>();

    return Badge.count(
      count: state.filterCount,
      backgroundColor: Theme.of(context).colorScheme.primary,
      isLabelVisible: state.filterCount > 0,
      child: PopupMenuButton(
        icon: const Icon(Icons.filter_list),
        tooltip: 'Show filters',
        itemBuilder: (popupContext) => [
          PopupMenuItem(
            child: StreamBuilder(
              stream: groupStream,
              builder: (context, snapshot) {
                return DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Food group',
                  ),
                  value: state.foodGroup,
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
                    state.foodGroup = value;
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
                builder: (context, shortDateFormat, child) => state.startDate !=
                        null
                    ? Text(
                        DateFormat(shortDateFormat).format(state.startDate!),
                      )
                    : Text(shortDateFormat),
              ),
              onLongPress: () {
                state.startDate = null;
                Navigator.pop(popupContext);
              },
              leading: const Icon(Icons.calendar_today),
              onTap: () async {
                Navigator.pop(popupContext);
                final DateTime? pickedDate = await showDatePicker(
                  context: popupContext,
                  initialDate: state.startDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null) state.startDate = pickedDate.toLocal();
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: const Text('Stop date'),
              subtitle: Selector<SettingsState, String>(
                selector: (p0, p1) => p1.shortDateFormat,
                builder: (context, shortDateFormat, child) =>
                    state.endDate != null
                        ? Text(
                            DateFormat(shortDateFormat).format(state.endDate!),
                          )
                        : Text(shortDateFormat),
              ),
              onLongPress: () {
                state.endDate = null;
                Navigator.pop(popupContext);
              },
              leading: const Icon(Icons.calendar_today),
              onTap: () async {
                Navigator.pop(popupContext);
                final DateTime? pickedDate = await showDatePicker(
                  context: popupContext,
                  initialDate: state.endDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null) state.endDate = pickedDate.toLocal();
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.clear_all),
              title: Text("Clear (${state.filterCount})"),
              onTap: () {
                state.clear();
                Navigator.pop(popupContext);
              },
            ),
          ),
        ],
      ),
    );
  }
}
