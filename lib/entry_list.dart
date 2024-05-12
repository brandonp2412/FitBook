import 'package:fit_book/edit_entry_page.dart';
import 'package:fit_book/entries.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';

class EntryList extends StatelessWidget {
  const EntryList({
    super.key,
    required this.entryFoods,
    required this.selected,
    required this.onSelect,
  });

  final List<EntryWithFood> entryFoods;
  final Set<int> selected;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: entryFoods.length,
        itemBuilder: (context, index) {
          final entryFood = entryFoods[index];
          final food = entryFood.food;
          final entry = entryFood.entry;
          final previousEntryFood = index > 0 ? entryFoods[index - 1] : null;
          final showDivider = previousEntryFood != null &&
              !isSameDay(
                previousEntryFood.entry.created,
                entryFood.entry.created,
              );
          final kcal =
              convertToKcal(entry.quantity, entry.unit, food.calories ?? 0);

          return Column(
            children: [
              if (showDivider) const Divider(),
              ListTile(
                title: Text(food.name),
                subtitle: Text(entry.created.toString()),
                trailing: Text(
                  "${kcal.toStringAsFixed(0)} kcal",
                  style: const TextStyle(fontSize: 16),
                ),
                selected: selected.contains(entry.id),
                onLongPress: () => onSelect(entry.id),
                onTap: () {
                  if (selected.isEmpty)
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
                    onSelect(entry.id);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
