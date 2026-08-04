import 'dart:io';

import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/utils.dart';
import 'package:fit_book/weight/edit_weight_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum WeightVariant { defaultView, ledger, timeline, statCards, gallery, chips }

extension WeightVariantLabel on WeightVariant {
  String get label {
    switch (this) {
      case WeightVariant.defaultView:
        return 'Default';
      case WeightVariant.ledger:
        return 'Ledger';
      case WeightVariant.timeline:
        return 'Timeline';
      case WeightVariant.statCards:
        return 'Stat cards';
      case WeightVariant.gallery:
        return 'Gallery';
      case WeightVariant.chips:
        return 'Chips';
    }
  }
}

/// The formatted, signed change versus the next-older entry in [weights],
/// or null when there is no older entry or the change rounds to zero.
String? weightDeltaLabel(List<Weight> weights, int index) {
  if (index >= weights.length - 1) return null;
  final delta = weights[index].amount - weights[index + 1].amount;
  if (delta.abs() < 0.01) return null;
  final sign = delta > 0 ? '▲' : '▼';
  return '$sign${delta.abs().toStringAsFixed(1)}';
}

bool weightDeltaIsUp(String delta) => delta.startsWith('▲');

/// Theme-relevant color for a delta label produced by [weightDeltaLabel].
Color weightDeltaColor(ColorScheme colorScheme, String delta) =>
    weightDeltaIsUp(delta) ? colorScheme.tertiary : colorScheme.secondary;

class VariantProps {
  const VariantProps({
    required this.context,
    required this.weights,
    required this.selected,
    required this.onSelect,
    required this.ctrl,
    required this.bottomPadding,
    required this.topPadding,
    required this.now,
    required this.settings,
  });

  final BuildContext context;
  final List<Weight> weights;
  final Set<int> selected;
  final ValueChanged<int> onSelect;
  final ScrollController ctrl;
  final double bottomPadding;
  final double topPadding;
  final DateTime now;
  final Setting settings;

  void onTap(BuildContext context, Weight weight) {
    if (selected.isEmpty) {
      showEditWeight(context, weight.toCompanion(false));
    } else {
      onSelect(weight.id);
    }
  }
}

Widget buildWeightVariant(WeightVariant variant, VariantProps p) {
  switch (variant) {
    case WeightVariant.defaultView:
      throw ArgumentError('defaultView is handled by WeightList directly');
    case WeightVariant.ledger:
      return _buildLedger(p);
    case WeightVariant.timeline:
      return _buildTimeline(p);
    case WeightVariant.statCards:
      return _buildStatCards(p);
    case WeightVariant.gallery:
      return _buildGallery(p);
    case WeightVariant.chips:
      return _buildChips(p);
  }
}

// ---------------------------------------------------------------------------
// 1. Ledger — dense, tabular rows with a delta column.
// ---------------------------------------------------------------------------

Widget _buildLedger(VariantProps p) {
  final colorScheme = Theme.of(p.context).colorScheme;

  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.topPadding + 8,
        left: 16,
        right: 16,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      itemCount: p.weights.length,
      itemBuilder: (context, index) {
        final weight = p.weights[index];
        final isToday = isSameDay(weight.created, p.now);
        final isSelected = p.selected.contains(weight.id);
        final delta = weightDeltaLabel(p.weights, index);

        return DecoratedBox(
          decoration: BoxDecoration(
            color: isToday ? colorScheme.primary.withValues(alpha: 0.08) : null,
            border: Border(
              bottom: BorderSide(
                color: colorScheme.outlineVariant.withValues(alpha: 0.4),
              ),
            ),
            borderRadius: isSelected ? BorderRadius.circular(8) : null,
          ),
          child: Container(
            decoration: isSelected
                ? BoxDecoration(
                    border: Border.all(color: colorScheme.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  )
                : null,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => p.onTap(context, weight),
              onLongPress: () => p.onSelect(weight.id),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 11),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(
                      width: 74,
                      child: Text(
                        isToday
                            ? 'Today'
                            : DateFormat(p.settings.shortDateFormat)
                                .format(weight.created),
                        style: TextStyle(
                          fontSize: 12.5,
                          color: isToday
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                          fontWeight: isToday ? FontWeight.w700 : null,
                        ),
                      ),
                    ),
                    Text(
                      weight.amount.toStringAsFixed(1),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      weight.unit,
                      style: TextStyle(
                        fontSize: 11,
                        color:
                            colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        delta ?? '—',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: delta == null
                              ? colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.5)
                              : weightDeltaColor(colorScheme, delta),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

// ---------------------------------------------------------------------------
// 2. Timeline — connected rail with a dot per entry.
// ---------------------------------------------------------------------------

Widget _buildTimeline(VariantProps p) {
  final theme = Theme.of(p.context);
  final colorScheme = theme.colorScheme;

  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.topPadding + 8,
        left: 16,
        right: 16,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      itemCount: p.weights.length,
      itemBuilder: (context, index) {
        final weight = p.weights[index];
        final isToday = isSameDay(weight.created, p.now);
        final isSelected = p.selected.contains(weight.id);
        final isLast = index == p.weights.length - 1;
        final hasImage =
            p.settings.showImages && weight.image?.isNotEmpty == true;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 26,
                child: Column(
                  children: [
                    Container(
                      width: 2,
                      height: 6,
                      color: index == 0
                          ? Colors.transparent
                          : colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                    Container(
                      width: isToday ? 16 : 12,
                      height: isToday ? 16 : 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isToday ? colorScheme.primary : colorScheme.surface,
                        border: Border.all(
                          color: isSelected
                              ? colorScheme.primary
                              : colorScheme.outlineVariant,
                          width: isToday ? 0 : 2,
                        ),
                        boxShadow: isToday
                            ? [
                                BoxShadow(
                                  color: colorScheme.primary
                                      .withValues(alpha: 0.25),
                                  blurRadius: 0,
                                  spreadRadius: 4,
                                ),
                              ]
                            : null,
                      ),
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          color:
                              colorScheme.outlineVariant.withValues(alpha: 0.5),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: () => p.onTap(context, weight),
                  onLongPress: () => p.onSelect(weight.id),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colorScheme.primary.withValues(alpha: 0.08)
                          : null,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isToday
                                    ? 'Today · ${DateFormat('hh:mm a').format(weight.created)}'
                                    : DateFormat(
                                        '${p.settings.shortDateFormat} · hh:mm a',
                                      ).format(weight.created),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: isToday
                                      ? colorScheme.primary
                                      : colorScheme.onSurfaceVariant,
                                  fontWeight: isToday ? FontWeight.w600 : null,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(
                                    weight.amount.toStringAsFixed(1),
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color:
                                          isToday ? colorScheme.primary : null,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    weight.unit,
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (hasImage) ...[
                          const SizedBox(width: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(weight.image!),
                              width: 36,
                              height: 36,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                width: 36,
                                height: 36,
                                color: colorScheme.surfaceContainerHighest,
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  size: 16,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        ],
                        if (isSelected) ...[
                          const SizedBox(width: 8),
                          Icon(
                            Icons.check_circle,
                            color: colorScheme.primary,
                            size: 18,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

// ---------------------------------------------------------------------------
// 3. Stat cards — hero number, trend chip, and a sparkline of nearby entries.
// ---------------------------------------------------------------------------

List<double> _sparkValues(List<Weight> weights, int index) {
  final start = (index - 2).clamp(0, weights.length);
  final end = (index + 3).clamp(0, weights.length);
  final slice = weights.sublist(start, end).reversed.map((w) => w.amount);
  final values = slice.toList();
  return values.length >= 2
      ? values
      : [weights[index].amount, weights[index].amount];
}

class _Spark extends StatelessWidget {
  const _Spark({required this.values, required this.color});

  final List<double> values;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      width: double.infinity,
      child: CustomPaint(painter: _SparkPainter(values, color)),
    );
  }
}

class _SparkPainter extends CustomPainter {
  _SparkPainter(this.values, this.color);

  final List<double> values;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final minValue = values.reduce((a, b) => a < b ? a : b);
    final maxValue = values.reduce((a, b) => a > b ? a : b);
    final range =
        (maxValue - minValue).abs() < 0.01 ? 1.0 : maxValue - minValue;

    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final x = size.width * i / (values.length - 1);
      final y = size.height - (values[i] - minValue) / range * size.height;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(covariant _SparkPainter oldDelegate) =>
      oldDelegate.values != values || oldDelegate.color != color;
}

Widget _buildStatCards(VariantProps p) {
  final theme = Theme.of(p.context);
  final colorScheme = theme.colorScheme;

  return Expanded(
    child: GridView.builder(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.topPadding + 8,
        left: 12,
        right: 12,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 190,
        mainAxisExtent: 128,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: p.weights.length,
      itemBuilder: (context, index) {
        final weight = p.weights[index];
        final isToday = isSameDay(weight.created, p.now);
        final isSelected = p.selected.contains(weight.id);
        final delta = weightDeltaLabel(p.weights, index);
        final sparkColor = isToday
            ? colorScheme.primary
            : colorScheme.onSurfaceVariant.withValues(alpha: 0.5);

        return DecoratedBox(
          decoration: BoxDecoration(
            color: isToday
                ? colorScheme.primary.withValues(alpha: 0.1)
                : colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(14),
            border: isSelected
                ? Border.all(color: colorScheme.primary, width: 2)
                : null,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => p.onTap(context, weight),
            onLongPress: () => p.onSelect(weight.id),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weight.amount.toStringAsFixed(1),
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                height: 1.0,
                                color: isToday ? colorScheme.primary : null,
                              ),
                            ),
                            Text(
                              '${weight.unit.toUpperCase()}${isToday ? ' · TODAY' : ''}',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (delta != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: weightDeltaColor(colorScheme, delta)
                                .withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            delta,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: weightDeltaColor(colorScheme, delta),
                            ),
                          ),
                        ),
                    ],
                  ),
                  _Spark(
                    values: _sparkValues(p.weights, index),
                    color: sparkColor,
                  ),
                  Text(
                    isToday
                        ? 'Today'
                        : DateFormat(
                            p.settings.shortDateFormat,
                          ).format(weight.created),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
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

// ---------------------------------------------------------------------------
// 4. Gallery — image-forward tiles, falling back to a plain numeric tile.
// ---------------------------------------------------------------------------

Widget _buildGallery(VariantProps p) {
  final theme = Theme.of(p.context);
  final colorScheme = theme.colorScheme;

  return Expanded(
    child: GridView.builder(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.topPadding + 8,
        left: 12,
        right: 12,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 190,
        mainAxisExtent: 180,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: p.weights.length,
      itemBuilder: (context, index) {
        final weight = p.weights[index];
        final isToday = isSameDay(weight.created, p.now);
        final isSelected = p.selected.contains(weight.id);
        final hasImage =
            p.settings.showImages && weight.image?.isNotEmpty == true;

        return ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isToday
                  ? colorScheme.primary.withValues(alpha: 0.1)
                  : colorScheme.surfaceContainerHigh,
              border: isSelected
                  ? Border.all(color: colorScheme.primary, width: 2.5)
                  : null,
            ),
            child: InkWell(
              onTap: () => p.onTap(context, weight),
              onLongPress: () => p.onSelect(weight.id),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (hasImage)
                    Image.file(
                      File(weight.image!),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: colorScheme.surfaceContainerHighest,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  else
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            weight.amount.toStringAsFixed(1),
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: isToday ? colorScheme.primary : null,
                            ),
                          ),
                          Text(
                            '${DateFormat(p.settings.shortDateFormat).format(weight.created)} · ${weight.unit}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isToday)
                    Positioned(
                      top: 7,
                      left: 7,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'TODAY',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  if (hasImage)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.72),
                              Colors.black.withValues(alpha: 0),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${weight.amount.toStringAsFixed(1)} ${weight.unit}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              DateFormat('hh:mm a').format(weight.created),
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.85),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
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

// ---------------------------------------------------------------------------
// 5. Chips — single-line pill-per-row list built for speed.
// ---------------------------------------------------------------------------

Widget _buildChips(VariantProps p) {
  final theme = Theme.of(p.context);
  final colorScheme = theme.colorScheme;

  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: appSearchHeight + p.topPadding + 8,
        left: 12,
        right: 12,
        bottom: p.bottomPadding,
      ),
      controller: p.ctrl,
      itemCount: p.weights.length,
      itemBuilder: (context, index) {
        final weight = p.weights[index];
        final isToday = isSameDay(weight.created, p.now);
        final isSelected = p.selected.contains(weight.id);

        return InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => p.onTap(context, weight),
          onLongPress: () => p.onSelect(weight.id),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primary.withValues(alpha: 0.08)
                  : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 64),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: isToday
                        ? colorScheme.primary
                        : colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${weight.amount.toStringAsFixed(1)}${weight.unit}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: isToday ? colorScheme.onPrimary : null,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isToday
                            ? 'Today'
                            : DateFormat(p.settings.shortDateFormat)
                                .format(weight.created),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: isToday ? FontWeight.w700 : null,
                          color: isToday ? colorScheme.primary : null,
                        ),
                      ),
                      Text(
                        DateFormat('hh:mm a').format(weight.created),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check_circle, size: 18, color: colorScheme.primary)
                else if (p.selected.isNotEmpty)
                  Icon(
                    Icons.circle_outlined,
                    size: 18,
                    color: colorScheme.outlineVariant,
                  ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
