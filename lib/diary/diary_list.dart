import 'package:fit_book/app_search.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/diary/diary_entry_actions.dart';
import 'package:fit_book/diary/diary_entry_row.dart';
import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/diary/diary_stats_utils.dart';
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
  final ValueChanged<int> onSelect;
  final VoidCallback onNext;

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
    widget.ctrl.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.ctrl.position.pixels <
        widget.ctrl.position.maxScrollExtent - 200) {
      return;
    }
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    Widget dayDivider(BuildContext context, DateTime date) {
      final theme = Theme.of(context);
      return Padding(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 2),
        child: Text(
          isToday(DateTime(date.year, date.month, date.day))
              ? 'Today'
              : DateFormat(settings.shortDateFormat).format(date),
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
      );
    }

    Widget goalBar(
      BuildContext context,
      String label,
      double current,
      int target,
      String unit,
      Color color,
    ) {
      final theme = Theme.of(context);
      final progress = target > 0 ? (current / target).clamp(0.0, 1.0) : 0.0;

      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
                Text(
                  _summaryText(
                    settings.diarySummary,
                    current: current,
                    target: target,
                    unit: unit,
                  ),
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 4,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(color),
              ),
            ),
          ],
        ),
      );
    }

    Widget goalBars(BuildContext context, DayGroup today) {
      final bars = <Widget>[
        if (settings.dailyCalories != null)
          goalBar(
            context,
            'Calories',
            today.stats.cals,
            settings.dailyCalories!,
            'kcal',
            Theme.of(context).colorScheme.primary,
          ),
        if (settings.dailyProtein != null)
          goalBar(
            context,
            'Protein',
            today.stats.protein,
            settings.dailyProtein!,
            'g',
            Theme.of(context).colorScheme.secondary,
          ),
        if (settings.dailyCarb != null)
          goalBar(
            context,
            'Carbs',
            today.stats.carb,
            settings.dailyCarb!,
            'g',
            Theme.of(context).colorScheme.tertiary,
          ),
        if (settings.dailyFat != null)
          goalBar(
            context,
            'Fat',
            today.stats.fat,
            settings.dailyFat!,
            'g',
            Theme.of(context).colorScheme.onPrimaryFixedVariant,
          ),
        if (settings.dailyFiber != null)
          goalBar(
            context,
            'Fiber',
            today.stats.fiber,
            settings.dailyFiber!,
            'g',
            Theme.of(context).colorScheme.shadow,
          ),
      ];

      if (bars.isEmpty ||
          settings.diarySummary == DiarySummary.none.toString()) {
        return const SizedBox.shrink();
      }

      return Padding(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 4),
        child: Column(children: bars),
      );
    }

    final days = groupByDay(widget.diaryFoods);
    final today = days.isEmpty ? null : days.first;

    // Store cheap builders instead of eagerly constructing every row widget.
    // ListView.builder only invokes these for visible/near-visible children,
    // which reduces build/layout work while the diary page slides onscreen.
    final itemBuilders = <WidgetBuilder>[];
    if (today != null) {
      itemBuilders.add((context) => goalBars(context, today));
    }

    DiaryFood? previous;
    for (final food in widget.diaryFoods) {
      final showDayDivider =
          previous != null && !isSameDay(previous.created, food.created);

      if (showDayDivider) {
        final date = food.created;
        itemBuilders.add((context) => dayDivider(context, date));
      }

      itemBuilders.add(
        (context) => DiaryEntryRow(
          food: food,
          isSelected: widget.selected.contains(food.entryId),
          onTap: () =>
              openDiaryEntry(context, food, widget.selected, widget.onSelect),
          onLongPress: () => widget.onSelect(food.entryId),
          showImages: settings.showImages,
        ),
      );

      previous = food;
    }

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: appSearchHeight,
          bottom: MediaQuery.paddingOf(context).bottom +
              BottomNav.totalOverlayHeight,
        ),
        controller: widget.ctrl,
        itemCount: itemBuilders.length,
        itemBuilder: (context, index) => itemBuilders[index](context),
      ),
    );
  }

  String _summaryText(
    String setting, {
    required double current,
    required int target,
    required String unit,
  }) {
    final currentText = current.toStringAsFixed(0);
    final remainingText = (target - current).toStringAsFixed(0);
    switch (setting) {
      case 'DiarySummary.remaining':
        return '$remainingText $unit remaining';
      case 'DiarySummary.both':
        return '$remainingText remaining ($target $unit)';
      case 'DiarySummary.none':
        return '';
      case 'DiarySummary.division':
      default:
        return '$currentText / $target $unit';
    }
  }
}
