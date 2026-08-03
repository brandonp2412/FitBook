import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/utils.dart';
import 'package:fit_book/weight/edit_weight_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum WeightVariant { timeline, bubble, chip, table, journal }

extension WeightVariantLabel on WeightVariant {
  String get label {
    switch (this) {
      case WeightVariant.timeline:
        return 'Timeline';
      case WeightVariant.bubble:
        return 'Bubble';
      case WeightVariant.chip:
        return 'Chip';
      case WeightVariant.table:
        return 'Table';
      case WeightVariant.journal:
        return 'Journal';
    }
  }
}

String? _deltaText(List<Weight> weights, int index) {
  if (index >= weights.length - 1) return null;
  final d = weights[index].amount - weights[index + 1].amount;
  if (d.abs() < 0.01) return null;
  final sign = d > 0 ? '\u25b2' : '\u25bc';
  return '$sign ${d.abs().toStringAsFixed(1)}';
}

class VariantProps {
  final List<Weight> weights;
  final Set<int> selected;
  final ValueChanged<int> onSelect;
  final ScrollController ctrl;
  final VoidCallback onNext;
  final double bottomPadding;
  final double extraTopPadding;
  final DateTime now;
  final Setting settings;
  final BuildContext context;

  VariantProps({
    required this.weights,
    required this.selected,
    required this.onSelect,
    required this.ctrl,
    required this.onNext,
    required this.bottomPadding,
    required this.extraTopPadding,
    required this.now,
    required this.settings,
    required this.context,
  });
}

Widget _buildTimeline(VariantProps p) {
  final theme = Theme.of(p.context);
  final cs = theme.colorScheme;

  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.extraTopPadding + 8,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      itemCount: p.weights.length,
      itemBuilder: (context, index) {
        final weight = p.weights[index];
        final isToday = isSameDay(weight.created, p.now);
        final isSelected = p.selected.contains(weight.id);
        final isLast = index == p.weights.length - 1;
        final delta = _deltaText(p.weights, index);

        return GestureDetector(
          onTap: () {
            if (p.selected.isEmpty) {
              showEditWeight(context, weight.toCompanion(false));
            } else {
              p.onSelect(weight.id);
            }
          },
          onLongPress: () => p.onSelect(weight.id),
          child: Container(
            color: isSelected
                ? cs.primary.withValues(alpha: .08)
                : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 32,
                    child: Column(
                      children: [
                        Container(
                          width: 2,
                          height: 8,
                          color: index == 0
                              ? Colors.transparent
                              : cs.outline.withValues(alpha: 0.25),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isToday ? cs.primary : cs.outline,
                            border: isSelected
                                ? Border.all(color: cs.primary, width: 2)
                                : null,
                          ),
                        ),
                        if (!isLast)
                          Expanded(
                            child: Container(
                              width: 2,
                              color: cs.outline.withValues(alpha: 0.25),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                DateFormat(p.settings.shortDateFormat)
                                    .format(weight.created),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: isToday
                                      ? cs.primary
                                      : cs.onSurfaceVariant,
                                  fontWeight: isToday ? FontWeight.w600 : null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                weight.amount.toStringAsFixed(2),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                weight.unit,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: cs.onSurfaceVariant,
                                ),
                              ),
                              if (delta != null) ...[
                                const SizedBox(width: 10),
                                Text(
                                  delta,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: delta.startsWith('\u25b2')
                                        ? Colors.red
                                        : Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isSelected)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child:
                          Icon(Icons.check_circle, color: cs.primary, size: 20),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget _buildBubble(VariantProps p) {
  final theme = Theme.of(p.context);
  final cs = theme.colorScheme;

  String? lastDateLabel;
  final items = <Widget>[];

  for (var i = 0; i < p.weights.length; i++) {
    final weight = p.weights[i];
    final isToday = isSameDay(weight.created, p.now);
    final isSelected = p.selected.contains(weight.id);
    final delta = _deltaText(p.weights, i);

    final dateLabel =
        DateFormat(p.settings.longDateFormat).format(weight.created);
    if (dateLabel != lastDateLabel) {
      lastDateLabel = dateLabel;
      items.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                dateLabel,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
    }

    items.add(
      GestureDetector(
        onTap: () {
          if (p.selected.isEmpty) {
            showEditWeight(p.context, weight.toCompanion(false));
          } else {
            p.onSelect(weight.id);
          }
        },
        onLongPress: () => p.onSelect(weight.id),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 320),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isToday
                    ? cs.primary.withValues(alpha: 0.12)
                    : cs.surfaceContainerHighest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(4),
                ),
                border: isSelected
                    ? Border.all(color: cs.primary, width: 1.5)
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        weight.amount.toStringAsFixed(2),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isToday ? cs.primary : null,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        weight.unit,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 8),
                        Icon(Icons.check_circle, color: cs.primary, size: 18),
                      ],
                      if (delta != null && !isSelected) ...[
                        const SizedBox(width: 8),
                        Text(
                          delta,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: delta.startsWith('\u25b2')
                                ? Colors.red
                                : Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('hh:mm a').format(weight.created),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: cs.onSurfaceVariant.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.extraTopPadding + 8,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    ),
  );
}

Widget _buildChip(VariantProps p) {
  final theme = Theme.of(p.context);
  final cs = theme.colorScheme;

  const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  return Expanded(
    child: ListView(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.extraTopPadding + 8,
        left: 12,
        right: 12,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: p.weights.asMap().entries.map((entry) {
            final i = entry.key;
            final weight = entry.value;
            final isToday = isSameDay(weight.created, p.now);
            final isSelected = p.selected.contains(weight.id);
            final delta = _deltaText(p.weights, i);
            final day = days[weight.created.weekday - 1];

            return GestureDetector(
              onTap: () {
                if (p.selected.isEmpty) {
                  showEditWeight(p.context, weight.toCompanion(false));
                } else {
                  p.onSelect(weight.id);
                }
              },
              onLongPress: () => p.onSelect(weight.id),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? cs.primaryContainer
                      : isToday
                          ? cs.primary.withValues(alpha: 0.1)
                          : cs.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                  border: isSelected
                      ? Border.all(color: cs.primary, width: 1.5)
                      : Border.all(
                          color: cs.outlineVariant.withValues(alpha: 0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${weight.amount.toStringAsFixed(2)} ${weight.unit}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isToday ? cs.primary : null,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      day,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: cs.onSurfaceVariant.withValues(alpha: 0.6),
                      ),
                    ),
                    if (delta != null) ...[
                      const SizedBox(width: 2),
                      Text(
                        delta.replaceAll(' ', ''),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: delta.startsWith('\u25b2')
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                      ),
                    ],
                    if (isSelected) ...[
                      const SizedBox(width: 4),
                      Icon(Icons.check, size: 14, color: cs.primary),
                    ],
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}

Widget _buildTable(VariantProps p) {
  final theme = Theme.of(p.context);
  final cs = theme.colorScheme;

  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.extraTopPadding + 8,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      itemCount: p.weights.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: cs.outlineVariant, width: 1),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                    width: 28,
                    child: p.selected.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              final all = p.weights.map((w) => w.id).toSet();
                              if (p.selected.length == all.length) {
                                p.onSelect(-1);
                              } else {
                                for (final w in p.weights) {
                                  p.onSelect(w.id);
                                }
                              }
                            },
                            child: Icon(
                              p.selected.length == p.weights.length
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              size: 20,
                              color: cs.primary,
                            ),
                          )
                        : const SizedBox.shrink()),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Text('Date',
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w600)),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Weight',
                      textAlign: TextAlign.right,
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w600)),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Change',
                      textAlign: TextAlign.right,
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          );
        }

        final i = index - 1;
        final weight = p.weights[i];
        final isToday = isSameDay(weight.created, p.now);
        final isSelected = p.selected.contains(weight.id);
        final delta = _deltaText(p.weights, i);

        return GestureDetector(
          onTap: () {
            if (p.selected.isEmpty) {
              showEditWeight(p.context, weight.toCompanion(false));
            } else {
              p.onSelect(weight.id);
            }
          },
          onLongPress: () => p.onSelect(weight.id),
          child: Container(
            color: isSelected
                ? cs.primary.withValues(alpha: .08)
                : (index.isOdd
                    ? cs.surfaceContainerHighest.withValues(alpha: 0.3)
                    : Colors.transparent),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 28,
                  child: p.selected.isNotEmpty
                      ? Icon(
                          isSelected
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          size: 20,
                          color: cs.primary,
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Text(
                    DateFormat(p.settings.shortDateFormat)
                        .format(weight.created),
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: isToday ? FontWeight.w600 : null,
                      color: isToday ? cs.primary : null,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${weight.amount.toStringAsFixed(2)} ${weight.unit}',
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    delta ?? '\u2014',
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: delta == null
                          ? cs.onSurfaceVariant
                          : delta.startsWith('\u25b2')
                              ? Colors.red
                              : Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget _buildJournal(VariantProps p) {
  final theme = Theme.of(p.context);
  final cs = theme.colorScheme;

  const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  DateTime mondayOf(DateTime date) =>
      date.subtract(Duration(days: date.weekday - 1));

  final weeks = <List<Weight>>[];
  List<Weight>? currentWeek;
  DateTime? currentMonday;

  for (final w in p.weights) {
    final monday = mondayOf(w.created);
    if (currentMonday == null || monday != currentMonday) {
      if (currentWeek != null) weeks.add(currentWeek);
      currentWeek = [w];
      currentMonday = monday;
    } else {
      currentWeek!.add(w);
    }
  }
  if (currentWeek != null) weeks.add(currentWeek);

  final all = p.weights.map((w) => w.amount).toList();
  final mn = all.isEmpty ? 0.0 : all.reduce((a, b) => a < b ? a : b);
  final mx = all.isEmpty ? 0.0 : all.reduce((a, b) => a > b ? a : b);

  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.extraTopPadding + 8,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      itemCount: weeks.length,
      itemBuilder: (context, weekIndex) {
        final week = weeks[weekIndex];
        final monday = mondayOf(week.first.created);
        final sunday = monday.add(const Duration(days: 6));
        final dateLabel =
            '${DateFormat('MMM d').format(monday)} \u2014 ${DateFormat('MMM d').format(sunday)}';

        final dayMap = <int, Weight>{};
        for (final w in week) {
          dayMap[w.created.weekday - 1] = w;
        }

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4)),
          ),
          color: cs.surfaceContainerLow,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateLabel,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 60,
                  child: Row(
                    children: List.generate(7, (dayIndex) {
                      final weight = dayMap[dayIndex];
                      final date = monday.add(Duration(days: dayIndex));
                      final isToday = isSameDay(date, p.now);

                      return Expanded(
                        child: GestureDetector(
                          onTap: weight != null
                              ? () {
                                  if (p.selected.isEmpty) {
                                    showEditWeight(
                                        p.context, weight.toCompanion(false));
                                  } else {
                                    p.onSelect(weight.id);
                                  }
                                }
                              : null,
                          onLongPress: weight != null
                              ? () => p.onSelect(weight.id)
                              : null,
                          child: Column(
                            children: [
                              Text(
                                days[dayIndex],
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: isToday
                                      ? cs.primary
                                      : cs.onSurfaceVariant
                                          .withValues(alpha: 0.5),
                                  fontWeight: isToday ? FontWeight.w700 : null,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Container(
                                    width: double.infinity,
                                    height: weight != null
                                        ? ((weight.amount - mn) /
                                                    (mx - mn == 0
                                                        ? 1
                                                        : mx - mn))
                                                .clamp(0.05, 1.0) *
                                            40
                                        : 0,
                                    decoration: BoxDecoration(
                                      color: weight != null
                                          ? (isToday
                                              ? cs.primary
                                              : cs.primary
                                                  .withValues(alpha: 0.5))
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                              if (weight != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  weight.amount.toStringAsFixed(2),
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 9,
                                    color: p.selected.contains(weight.id)
                                        ? cs.primary
                                        : null,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '${mn.toStringAsFixed(2)} \u2014 ${mx.toStringAsFixed(2)} ${week.first.unit}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: cs.onSurfaceVariant.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget buildWeightVariant(
  WeightVariant variant, {
  required List<Weight> weights,
  required Set<int> selected,
  required ValueChanged<int> onSelect,
  required ScrollController ctrl,
  required VoidCallback onNext,
  required double bottomPadding,
  required double extraTopPadding,
  required DateTime now,
  required Setting settings,
  required BuildContext context,
}) {
  final props = VariantProps(
    weights: weights,
    selected: selected,
    onSelect: onSelect,
    ctrl: ctrl,
    onNext: onNext,
    bottomPadding: bottomPadding,
    extraTopPadding: extraTopPadding,
    now: now,
    settings: settings,
    context: context,
  );

  switch (variant) {
    case WeightVariant.timeline:
      return _buildTimeline(props);
    case WeightVariant.bubble:
      return _buildBubble(props);
    case WeightVariant.chip:
      return _buildChip(props);
    case WeightVariant.table:
      return _buildTable(props);
    case WeightVariant.journal:
      return _buildJournal(props);
  }
}
