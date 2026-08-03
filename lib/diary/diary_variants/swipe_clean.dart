import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/diary/diary_stats_utils.dart';
import 'package:fit_book/diary/diary_variants/diary_entry_actions.dart';
import 'package:fit_book/diary/diary_variants/diary_entry_row.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Flat list with day dividers and no per-row unit text or persistent
/// selection icons. A stack of thin per-goal progress bars replaces the
/// stat card.
class SwipeCleanDiary extends StatelessWidget {
  const SwipeCleanDiary({
    super.key,
    required this.diaryFoods,
    required this.selected,
    required this.onSelect,
    required this.ctrl,
    required this.settings,
    required this.topPadding,
  });

  final List<DiaryFood> diaryFoods;
  final Set<int> selected;
  final void Function(int) onSelect;
  final ScrollController ctrl;
  final Setting settings;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    final days = groupByDay(diaryFoods);
    final today = days.isEmpty ? null : days.first;

    final children = <Widget>[
      if (today != null) _goalBars(context, today),
    ];

    DiaryFood? previous;
    for (final food in diaryFoods) {
      final showDayDivider =
          previous != null && !isSameDay(previous.created, food.created);

      if (showDayDivider) children.add(_dayDivider(context, food.created));

      children.add(
        DiaryEntryRow(
          food: food,
          isSelected: selected.contains(food.entryId),
          onTap: () => openDiaryEntry(context, food, selected, onSelect),
          onLongPress: () => onSelect(food.entryId),
          showImages: settings.showImages,
        ),
      );

      previous = food;
    }

    return ListView(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom:
            MediaQuery.paddingOf(context).bottom + BottomNav.totalOverlayHeight,
      ),
      controller: ctrl,
      children: children,
    );
  }

  Widget _goalBars(BuildContext context, DayGroup today) {
    final bars = <Widget>[
      if (settings.dailyCalories != null)
        _goalBar(
          context,
          'Calories',
          today.stats.cals,
          settings.dailyCalories!,
          'kcal',
          Colors.orange.shade300,
        ),
      if (settings.dailyProtein != null)
        _goalBar(
          context,
          'Protein',
          today.stats.protein,
          settings.dailyProtein!,
          'g',
          Colors.blue.shade300,
        ),
      if (settings.dailyCarb != null)
        _goalBar(
          context,
          'Carbs',
          today.stats.carb,
          settings.dailyCarb!,
          'g',
          Colors.green.shade300,
        ),
      if (settings.dailyFat != null)
        _goalBar(
          context,
          'Fat',
          today.stats.fat,
          settings.dailyFat!,
          'g',
          Colors.purple.shade300,
        ),
      if (settings.dailyFiber != null)
        _goalBar(
          context,
          'Fiber',
          today.stats.fiber,
          settings.dailyFiber!,
          'g',
          Colors.brown.shade300,
        ),
    ];

    if (bars.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 4),
      child: Column(children: bars),
    );
  }

  Widget _goalBar(
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
                '${current.toStringAsFixed(0)} / $target $unit',
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

  Widget _dayDivider(BuildContext context, DateTime date) {
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
}
