import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/diary/stats.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/quick_add_page.dart';
import 'package:fit_book/settings/diary_settings.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DiaryList extends StatefulWidget {
  const DiaryList({
    super.key,
    required this.diaryFoods,
    required this.selected,
    required this.onSelect,
    required this.onNext,
    required this.ctrl,
  });

  final List<DiaryFood> diaryFoods;
  final ScrollController ctrl;
  final Set<int> selected;
  final Function(int) onSelect;
  final Function() onNext;

  @override
  State<DiaryList> createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  @override
  void initState() {
    super.initState();
    widget.ctrl.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.ctrl.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.ctrl.position.pixels <
        widget.ctrl.position.maxScrollExtent - 200) return;
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    Map<DateTime, Stats> stats = {};
    for (final diaryFood in widget.diaryFoods) {
      final day = DateTime(
        diaryFood.created.year,
        diaryFood.created.month,
        diaryFood.created.day,
      );
      if (stats.containsKey(day)) {
        stats[day]!.cals += diaryFood.metrics[db.foods.calories.name] ?? 0;
        stats[day]!.protein += diaryFood.metrics[db.foods.proteinG.name] ?? 0;
        stats[day]!.fat += diaryFood.metrics[db.foods.fatG.name] ?? 0;
        stats[day]!.carb += diaryFood.metrics[db.foods.carbohydrateG.name] ?? 0;
        stats[day]!.fiber += diaryFood.metrics[db.foods.fiberG.name] ?? 0;
      } else
        stats[day] = Stats(
          cals: diaryFood.metrics[db.foods.calories.name] ?? 0,
          protein: diaryFood.metrics[db.foods.proteinG.name] ?? 0,
          fat: diaryFood.metrics[db.foods.fatG.name] ?? 0,
          carb: diaryFood.metrics[db.foods.carbohydrateG.name] ?? 0,
          fiber: diaryFood.metrics[db.foods.fiberG.name] ?? 0,
        );
    }

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8),
        controller: widget.ctrl,
        itemCount: widget.diaryFoods.length,
        itemBuilder: (context, index) {
          final diaryFood = widget.diaryFoods[index];
          final foodName = diaryFood.name;
          final previous = index > 0 ? widget.diaryFoods[index - 1] : null;
          final selected = widget.selected.contains(diaryFood.entryId);
          final showDivider = previous != null &&
              !isSameDay(
                previous.created,
                diaryFood.created,
              );
          final suffix = diaryFood.unit == 'serving' && diaryFood.quantity > 1
              ? " x${diaryFood.quantity.toInt()}"
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
            if (diaryFood.imageFile?.isNotEmpty == true)
              image = Image.file(File(diaryFood.imageFile!));
            else if (diaryFood.smallImage?.isNotEmpty == true)
              image = SizedBox(
                height: 80,
                width: 50,
                child: CachedNetworkImage(
                  imageUrl: diaryFood.smallImage!,
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
                  DateFormat(settings.longDateFormat).format(diaryFood.created),
                ),
                trailing: Stack(
                  children: [
                    AnimatedScale(
                      duration: const Duration(milliseconds: 150),
                      scale: selected ? 0.0 : 1.0,
                      child: Visibility(
                        visible: !selected,
                        child: Text(
                          "${diaryFood.metrics[db.foods.calories.name]?.toStringAsFixed(0) ?? 0} kcal",
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
                          onChanged: (_) => widget.onSelect(diaryFood.entryId),
                        ),
                      ),
                    ),
                  ],
                ),
                selected: selected,
                onLongPress: () => widget.onSelect(diaryFood.entryId),
                onTap: () {
                  if (widget.selected.isEmpty && diaryFood.name != 'Quick-add')
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditDiaryPage(
                          id: diaryFood.entryId,
                        ),
                      ),
                    );
                  else if (widget.selected.isEmpty &&
                      diaryFood.name == 'Quick-add')
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuickAddPage(
                          id: diaryFood.entryId,
                        ),
                      ),
                    );
                  else
                    widget.onSelect(diaryFood.entryId);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
