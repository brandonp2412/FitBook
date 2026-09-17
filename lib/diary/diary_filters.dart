import 'package:drift/drift.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryFilters extends StatefulWidget {
  const DiaryFilters({
    super.key,
  });

  @override
  State<DiaryFilters> createState() => _DiaryFiltersState();
}

class _DiaryFiltersState extends State<DiaryFilters> {
  var groupCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<DiaryState>();
    groupCtrl.text = state.foodGroup ?? "";
  }

  void _showFiltersDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.l10n.filters),
        content: material.Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Autocomplete<String>(
              optionsMaxHeight: 300,
              optionsBuilder: (value) async {
                if (value.text.isEmpty) return [];
                final results = await (db.foods.selectOnly()
                      ..where(
                        db.foods.foodGroup.like('%${value.text}%') &
                            db.foods.foodGroup.isNotNull(),
                      )
                      ..addColumns([db.foods.foodGroup])
                      ..groupBy([db.foods.foodGroup]))
                    .get();
                return results
                    .map((result) => result.read(db.foods.foodGroup)!);
              },
              onSelected: (option) async {
                groupCtrl.text = option;
                context.read<DiaryState>().foodGroup = option;
              },
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                groupCtrl = textEditingController;
                groupCtrl.text = context.read<DiaryState>().foodGroup ?? "";
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: context.l10n.foodGroup,
                    hintText: context.l10n.exampleFruit,
                  ),
                  controller: textEditingController,
                  focusNode: focusNode,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (String value) {
                    context.read<DiaryState>().foodGroup = value;
                    Navigator.of(context).pop();
                  },
                  textInputAction: TextInputAction.next,
                );
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(dialogContext.l10n.startDate),
              subtitle: Consumer<SettingsState>(
                builder: (context, settingsState, child) {
                  final state = context.watch<DiaryState>();
                  final shortDateFormat = settingsState.value.shortDateFormat;
                  return state.startDate != null
                      ? Text(
                          formatDisplayDate(
                            context,
                            state.startDate!,
                            shortDateFormat,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      : Text(
                          shortDateFormat,
                          overflow: TextOverflow.ellipsis,
                        );
                },
              ),
              onLongPress: () {
                context.read<DiaryState>().startDate = null;
              },
              leading: const Icon(Icons.calendar_today),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: context.read<DiaryState>().startDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null && mounted) {
                  context.read<DiaryState>().startDate = pickedDate.toLocal();
                }
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(dialogContext.l10n.stopDate),
              subtitle: Consumer<SettingsState>(
                builder: (context, settingsState, child) {
                  final state = context.watch<DiaryState>();
                  final shortDateFormat = settingsState.value.shortDateFormat;
                  return state.endDate != null
                      ? Text(
                          formatDisplayDate(
                            context,
                            state.endDate!,
                            shortDateFormat,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      : Text(
                          shortDateFormat,
                          overflow: TextOverflow.ellipsis,
                        );
                },
              ),
              onLongPress: () {
                context.read<DiaryState>().endDate = null;
              },
              leading: const Icon(Icons.calendar_today),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: context.read<DiaryState>().endDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null && mounted) {
                  context.read<DiaryState>().endDate = pickedDate.toLocal();
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<DiaryState>().clear();
              groupCtrl.text = '';
              Navigator.of(dialogContext).pop();
            },
            child: Consumer<DiaryState>(
              builder: (context, state, child) => Text(
                context.l10n.clearFiltersCount(state.filterCount),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              final group = groupCtrl.text;
              context.read<DiaryState>().foodGroup =
                  group.isEmpty ? null : group;
              Navigator.of(dialogContext).pop();
            },
            child: Text(dialogContext.l10n.done),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiaryState>();

    return Badge.count(
      count: state.filterCount,
      backgroundColor: Theme.of(context).colorScheme.primary,
      isLabelVisible: state.filterCount > 0,
      child: IconButton(
        icon: const Icon(Icons.filter_list),
        tooltip: context.l10n.showFilters,
        onPressed: _showFiltersDialog,
      ),
    );
  }
}
