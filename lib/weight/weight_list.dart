import 'package:fit_book/app_search.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:fit_book/weight/edit_weight_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// Formatted, signed change versus the next-older entry, or null at the
/// oldest entry or when the change rounds to zero.
String? weightDeltaLabel(List<Weight> weights, int index) {
  if (index >= weights.length - 1) return null;
  final delta = weights[index].amount - weights[index + 1].amount;
  if (delta.abs() < 0.01) return null;
  final sign = delta > 0 ? '▲' : '▼';
  return '$sign${delta.abs().toStringAsFixed(1)}';
}

bool weightDeltaIsUp(String delta) => delta.startsWith('▲');

Color weightDeltaColor(ColorScheme colorScheme, String delta) =>
    weightDeltaIsUp(delta) ? colorScheme.tertiary : colorScheme.secondary;

class WeightList extends StatefulWidget {
  const WeightList({
    super.key,
    required this.weights,
    required this.selected,
    required this.onSelect,
    required this.onNext,
    required this.ctrl,
    this.extraTopPadding = 0,
  });

  final List<Weight> weights;
  final Set<int> selected;
  final ValueChanged<int> onSelect;
  final VoidCallback onNext;
  final ScrollController ctrl;
  final double extraTopPadding;

  @override
  State<WeightList> createState() => _WeightListState();
}

class _WeightListState extends State<WeightList> with WidgetsBindingObserver {
  var now = DateTime.now();

  @override
  void initState() {
    super.initState();
    widget.ctrl.addListener(_scrollListener);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    widget.ctrl.removeListener(_scrollListener);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      setState(() {
        now = DateTime.now();
      });
    }
  }

  void _scrollListener() {
    if (widget.ctrl.position.pixels <
        widget.ctrl.position.maxScrollExtent - 200) return;
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    if (settings.compactWeights) {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;

      return Expanded(
        child: ListView.builder(
          padding: EdgeInsets.only(
            top: appSearchHeight + widget.extraTopPadding + 8,
            left: 12,
            right: 12,
            bottom: navigationBottomClearance(context),
          ),
          controller: widget.ctrl,
          itemCount: widget.weights.length,
          itemBuilder: (context, index) {
            final weight = widget.weights[index];
            final isToday = isSameDay(weight.created, now);
            final isSelected = widget.selected.contains(weight.id);
            final delta = weightDeltaLabel(widget.weights, index);

            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                if (widget.selected.isEmpty) {
                  showEditWeight(context, weight.toCompanion(false));
                } else {
                  widget.onSelect(weight.id);
                }
              },
              onLongPress: () => widget.onSelect(weight.id),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 4,
                      ),
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
                                : DateFormat(settings.shortDateFormat)
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
                    if (delta != null)
                      Text(
                        delta,
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.w700,
                          color: weightDeltaColor(colorScheme, delta),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;

      return Expanded(
        child: GridView.builder(
          padding: EdgeInsets.only(
            top: appSearchHeight + widget.extraTopPadding + 16,
            left: 12,
            right: 12,
            bottom: navigationBottomClearance(context),
          ),
          controller: widget.ctrl,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 190,
            mainAxisExtent: 128,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: widget.weights.length,
          itemBuilder: (context, index) {
            final weight = widget.weights[index];
            final isToday = isSameDay(weight.created, now);
            final isSelected = widget.selected.contains(weight.id);
            final delta = weightDeltaLabel(widget.weights, index);
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
                onTap: () {
                  if (widget.selected.isEmpty) {
                    showEditWeight(context, weight.toCompanion(false));
                  } else {
                    widget.onSelect(weight.id);
                  }
                },
                onLongPress: () => widget.onSelect(weight.id),
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
                        values: _sparkValues(widget.weights, index),
                        color: sparkColor,
                      ),
                      Text(
                        isToday
                            ? 'Today'
                            : DateFormat(
                                settings.shortDateFormat,
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
  }
}

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
