import 'package:fit_book/edit_entry_page.dart';
import 'package:fit_book/entries.dart';
import 'package:fit_book/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EntryList extends StatefulWidget {
  const EntryList({
    super.key,
    required this.entryFoods,
    required this.selected,
    required this.onSelect,
    required this.onNext,
  });

  final List<EntryWithFood> entryFoods;
  final Set<int> selected;
  final Function(int) onSelect;
  final Function() onNext;

  @override
  State<EntryList> createState() => _EntryListState();
}

class _EntryListState extends State<EntryList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels <
        _scrollController.position.maxScrollExtent - 200) return;
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.entryFoods.length,
        itemBuilder: (context, index) {
          final entryFood = widget.entryFoods[index];
          final food = entryFood.food;
          final entry = entryFood.entry;
          final previousEntryFood =
              index > 0 ? widget.entryFoods[index - 1] : null;
          final showDivider = previousEntryFood != null &&
              !isSameDay(
                previousEntryFood.entry.created,
                entryFood.entry.created,
              );

          return Column(
            children: [
              if (showDivider) const Divider(),
              ListTile(
                title: Text(food.name),
                subtitle: Text(
                  DateFormat(settings.longDateFormat).format(entry.created),
                ),
                trailing: Text(
                  "${entry.kCalories?.toStringAsFixed(0) ?? 0} kcal",
                  style: const TextStyle(fontSize: 16),
                ),
                selected: widget.selected.contains(entry.id),
                onLongPress: () => widget.onSelect(entry.id),
                onTap: () {
                  if (widget.selected.isEmpty)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEntryPage(
                          entry: entry,
                          food: food,
                        ),
                      ),
                    );
                  else
                    widget.onSelect(entry.id);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
