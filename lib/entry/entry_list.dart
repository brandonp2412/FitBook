import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/entry/edit_entry_page.dart';
import 'package:fit_book/entry/entry_food.dart';
import 'package:fit_book/entry/stats.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/quick_add_page.dart';
import 'package:fit_book/settings/diary_settings.dart';
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

    Map<DateTime, Stats> stats = {};
    for (final entryFood in widget.entryFoods) {
      final day = DateTime(
        entryFood.created.year,
        entryFood.created.month,
        entryFood.created.day,
      );
      if (stats.containsKey(day)) {
        stats[day]!.cals += entryFood.metrics[db.foods.calories.name] ?? 0;
        stats[day]!.protein += entryFood.metrics[db.foods.proteinG.name] ?? 0;
        stats[day]!.fat += entryFood.metrics[db.foods.fatG.name] ?? 0;
        stats[day]!.carb += entryFood.metrics[db.foods.carbohydrateG.name] ?? 0;
        stats[day]!.fiber += entryFood.metrics[db.foods.fiberG.name] ?? 0;
      } else
        stats[day] = Stats(
          cals: entryFood.metrics[db.foods.calories.name] ?? 0,
          protein: entryFood.metrics[db.foods.proteinG.name] ?? 0,
          fat: entryFood.metrics[db.foods.fatG.name] ?? 0,
          carb: entryFood.metrics[db.foods.carbohydrateG.name] ?? 0,
          fiber: entryFood.metrics[db.foods.fiberG.name] ?? 0,
        );
    }

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

          Widget? statsRow;
          if (showDivider) {
            String cals = "";
            String protein = "";
            String fat = "";
            String carb = "";
            String fiber = "";
            final formatter = NumberFormat('#,##0');

            final day = DateTime(
              previous.created.year,
              previous.created.month,
              previous.created.day,
            );

            switch (settings.diarySummary) {
              case 'DiarySummary.remaining':
                cals =
                    "${formatter.format((settings.dailyCalories ?? 0) - stats[day]!.cals)} kcal";
                protein =
                    "${((settings.dailyProtein ?? 0) - stats[day]!.protein).toStringAsFixed(0)}g protein";
                fat =
                    "${((settings.dailyFat ?? 0) - stats[day]!.fat).toStringAsFixed(0)}g fat";
                carb =
                    "${((settings.dailyCarb ?? 0) - stats[day]!.carb).toStringAsFixed(0)}g carbs";
                fiber =
                    "${((settings.dailyFiber ?? 0) - stats[day]!.fiber).toStringAsFixed(0)}g fiber";
                break;
              case 'DiarySummary.division':
                cals =
                    "${formatter.format(stats[day]!.cals)} / ${formatter.format(settings.dailyCalories ?? 0)} kcal";
                protein =
                    "${stats[day]!.protein.toStringAsFixed(0)} / ${settings.dailyProtein}g protein";
                fat =
                    "${stats[day]!.fat.toStringAsFixed(0)} / ${settings.dailyFat}g fat";
                carb =
                    "${stats[day]!.carb.toStringAsFixed(0)} / ${settings.dailyCarb}g carbs";
                fiber =
                    "${stats[day]!.fiber.toStringAsFixed(0)} / ${settings.dailyFiber}g fiber";
                break;
              case 'DiarySummary.both':
                cals =
                    "${((settings.dailyCalories ?? 0) - stats[day]!.cals).toStringAsFixed(0)} (${formatter.format(settings.dailyCalories ?? 0)} kcal)";
                protein =
                    "${((settings.dailyProtein ?? 0) - stats[day]!.protein).toStringAsFixed(0)} (${settings.dailyProtein}g protein)";
                fat =
                    "${((settings.dailyFat ?? 0) - stats[day]!.fat).toStringAsFixed(0)} (${settings.dailyFat}g fat)";
                carb =
                    "${((settings.dailyCarb ?? 0) - stats[day]!.carb).toStringAsFixed(0)} (${settings.dailyCarb}g carbs)";
                fiber =
                    "${((settings.dailyFiber ?? 0) - stats[day]!.fiber).toStringAsFixed(0)} (${settings.dailyFiber}g fiber)";
                break;
              case 'DiarySummary.none':
                break;
            }

            statsRow = GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DiarySettings()),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        if (settings.dailyCalories != null) ...[
                          Icon(Icons.whatshot),
                          Text(cals),
                        ],
                        if (settings.dailyProtein != null) ...[
                          Icon(Icons.egg_outlined),
                          Text(protein),
                        ],
                      ],
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        if (settings.dailyFat != null) ...[
                          Icon(Icons.opacity_outlined),
                          Text(fat),
                        ],
                        if (settings.dailyCarb != null) ...[
                          Icon(Icons.bakery_dining_outlined),
                          Text(carb),
                        ],
                        if (settings.dailyFiber != null) ...[
                          Icon(Icons.grass_outlined),
                          Text(fiber),
                        ],
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            );
          }

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
              if (statsRow != null) statsRow,
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
