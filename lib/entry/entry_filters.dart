import 'package:fit_book/entry/entry_state.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EntryFilters extends StatefulWidget {
  const EntryFilters({
    super.key,
  });

  @override
  createState() => _EntryFiltersState();
}

class _EntryFiltersState extends State<EntryFilters> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<EntryState>();

    return Badge.count(
      count: state.filterCount,
      backgroundColor: Theme.of(context).colorScheme.primary,
      isLabelVisible: state.filterCount > 0,
      child: PopupMenuButton(
        icon: const Icon(Icons.filter_list),
        tooltip: 'Show filters',
        constraints: const BoxConstraints(
          minWidth: 220,
          maxWidth: 220,
        ),
        itemBuilder: (popupContext) => [
          PopupMenuItem(
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Food group',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  isDense: true,
                  hintText: 'Fruit',
                ),
                initialValue: state.foodGroup,
                onFieldSubmitted: (value) {
                  state.foodGroup = value.isNotEmpty ? value : null;
                  Navigator.pop(popupContext);
                },
                onEditingComplete: () {
                  // This prevents the default behavior and lets onFieldSubmitted handle it
                },
              ),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: const Text('Start date'),
              subtitle: Selector<SettingsState, String>(
                selector: (p0, settings) => settings.value.shortDateFormat,
                builder: (context, shortDateFormat, child) => state.startDate !=
                        null
                    ? Text(
                        DateFormat(shortDateFormat).format(state.startDate!),
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(
                        shortDateFormat,
                        overflow: TextOverflow.ellipsis,
                      ),
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
                selector: (p0, settings) => settings.value.shortDateFormat,
                builder: (context, shortDateFormat, child) =>
                    state.endDate != null
                        ? Text(
                            DateFormat(shortDateFormat).format(state.endDate!),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            shortDateFormat,
                            overflow: TextOverflow.ellipsis,
                          ),
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
              title: Text(
                "Clear (${state.filterCount})",
                overflow: TextOverflow.ellipsis,
              ),
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
