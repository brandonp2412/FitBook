import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/entry/edit_entry_page.dart';
import 'package:fit_book/entry/entry_food.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/quick_add_page.dart';
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

  final List<EntryFood> entryFoods;
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
        padding: EdgeInsets.only(top: 8),
        controller: scrollController,
        itemCount: widget.entryFoods.length,
        itemBuilder: (context, index) {
          final entryFood = widget.entryFoods[index];
          final foodName = entryFood.name;
          final previous = index > 0 ? widget.entryFoods[index - 1] : null;
          final selected = widget.selected.contains(entryFood.entryId);
          final showDivider = previous != null &&
              !isSameDay(
                previous.created,
                entryFood.created,
              );
          final suffix = entryFood.unit == 'serving' && entryFood.quantity > 1
              ? " x${entryFood.quantity.toInt()}"
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
                          .format(previous.created),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
              ListTile(
                leading: image,
                title: Text("$foodName$suffix"),
                subtitle: Text(
                  DateFormat(settings.longDateFormat).format(entryFood.created),
                ),
                trailing: Stack(
                  children: [
                    AnimatedScale(
                      duration: const Duration(milliseconds: 150),
                      scale: selected ? 0.0 : 1.0,
                      child: Visibility(
                        visible: !selected,
                        child: Text(
                          "${entryFood.metrics[db.foods.calories.name]?.toStringAsFixed(0) ?? 0} kcal",
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
                          onChanged: (_) => widget.onSelect(entryFood.entryId),
                        ),
                      ),
                    ),
                  ],
                ),
                selected: selected,
                onLongPress: () => widget.onSelect(entryFood.entryId),
                onTap: () {
                  if (widget.selected.isEmpty && entryFood.name != 'Quick-add')
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEntryPage(
                          id: entryFood.entryId,
                        ),
                      ),
                    );
                  else if (widget.selected.isEmpty &&
                      entryFood.name == 'Quick-add')
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuickAddPage(
                          entryId: entryFood.entryId,
                        ),
                      ),
                    );
                  else
                    widget.onSelect(entryFood.entryId);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
