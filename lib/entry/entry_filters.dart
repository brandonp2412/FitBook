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
  void _showFiltersDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Filters'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Food group',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    isDense: true,
                    hintText: 'Fruit',
                  ),
                  initialValue: context.read<EntryState>().foodGroup,
                  onFieldSubmitted: (value) {
                    context.read<EntryState>().foodGroup =
                        value.isNotEmpty ? value : null;
                    Navigator.of(dialogContext).pop();
                  },
                  onEditingComplete: () {},
                ),
              ),
              const SizedBox(height: 16),

              // Start date filter
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Start date'),
                subtitle: Consumer<SettingsState>(
                  builder: (context, settingsState, child) {
                    final state = context.watch<EntryState>();
                    final shortDateFormat = settingsState.value.shortDateFormat;
                    return state.startDate != null
                        ? Text(
                            DateFormat(shortDateFormat)
                                .format(state.startDate!),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            shortDateFormat,
                            overflow: TextOverflow.ellipsis,
                          );
                  },
                ),
                onLongPress: () {
                  context.read<EntryState>().startDate = null;
                },
                leading: const Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: context.read<EntryState>().startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null && mounted) {
                    context.read<EntryState>().startDate = pickedDate.toLocal();
                  }
                },
              ),

              // End date filter
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Stop date'),
                subtitle: Consumer<SettingsState>(
                  builder: (context, settingsState, child) {
                    final state = context.watch<EntryState>();
                    final shortDateFormat = settingsState.value.shortDateFormat;
                    return state.endDate != null
                        ? Text(
                            DateFormat(shortDateFormat).format(state.endDate!),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            shortDateFormat,
                            overflow: TextOverflow.ellipsis,
                          );
                  },
                ),
                onLongPress: () {
                  context.read<EntryState>().endDate = null;
                },
                leading: const Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: context.read<EntryState>().endDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null && mounted) {
                    context.read<EntryState>().endDate = pickedDate.toLocal();
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<EntryState>().clear();
              Navigator.of(dialogContext).pop();
            },
            child: Consumer<EntryState>(
              builder: (context, state, child) => Text(
                "Clear (${state.filterCount})",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EntryState>();

    return Badge.count(
      count: state.filterCount,
      backgroundColor: Theme.of(context).colorScheme.primary,
      isLabelVisible: state.filterCount > 0,
      child: IconButton(
        icon: const Icon(Icons.filter_list),
        tooltip: 'Show filters',
        onPressed: _showFiltersDialog,
      ),
    );
  }
}
