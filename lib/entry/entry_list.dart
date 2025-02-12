import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/database/entries.dart';
import 'package:fit_book/entry/edit_entry_page.dart';
import 'package:fit_book/settings/settings_state.dart';
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
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels <
        scrollController.position.maxScrollExtent - 200) return;
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.entryFoods.length,
        itemBuilder: (context, index) {
          final entryFood = widget.entryFoods[index];
          final foodName = entryFood.foodName;
          final entry = entryFood.entry;
          final previous = index > 0 ? widget.entryFoods[index - 1] : null;
          final selected = widget.selected.contains(entry.id);
          final showDivider = previous != null &&
              !isSameDay(
                previous.entry.created,
                entryFood.entry.created,
              );
          final suffix = entry.unit == 'serving' && entry.quantity > 1
              ? " x${entry.quantity.toInt()}"
              : "";

          Widget? image;
          if (settings.showImages) {
            if (entryFood.imageFile?.isNotEmpty == true)
              image = Image.file(File(entryFood.imageFile!));
            else if (entryFood.smallImage?.isNotEmpty == true)
              image = SizedBox(
                height: 80,
                width: 50,
                child: CachedNetworkImage(
                  imageUrl: entryFood.smallImage!,
                ),
              );
          }

          return Column(
            children: [
              if (showDivider)
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    const Icon(Icons.today),
                    Text(
                      DateFormat(settings.shortDateFormat)
                          .format(previous.entry.created),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
              ListTile(
                leading: image,
                title: Text("$foodName$suffix"),
                subtitle: Text(
                  DateFormat(settings.longDateFormat).format(entry.created),
                ),
                trailing: Stack(
                  children: [
                    AnimatedScale(
                      duration: const Duration(milliseconds: 150),
                      scale: selected ? 0.0 : 1.0,
                      child: Visibility(
                        visible: !selected,
                        child: Text(
                          "${entry.kCalories?.toStringAsFixed(0) ?? 0} kcal",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    AnimatedScale(
                      duration: const Duration(milliseconds: 150),
                      scale: selected ? 1.0 : 0.0,
                      child: Visibility(
                        visible: selected,
                        child: Checkbox(
                          value: selected,
                          onChanged: (_) => widget.onSelect(entry.id),
                        ),
                      ),
                    ),
                  ],
                ),
                selected: selected,
                onLongPress: () => widget.onSelect(entry.id),
                onTap: () {
                  if (widget.selected.isEmpty)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEntryPage(
                          id: entry.id,
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
