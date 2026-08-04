import 'dart:io';

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
            bottom: MediaQuery.paddingOf(context).bottom +
                BottomNav.totalOverlayHeight,
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
                    if (delta != null) ...[
                      Text(
                        delta,
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.w700,
                          color: weightDeltaColor(colorScheme, delta),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    if (isSelected)
                      Icon(
                        Icons.check_circle,
                        size: 18,
                        color: colorScheme.primary,
                      )
                    else if (widget.selected.isNotEmpty)
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
    } else {
      return Expanded(
        child: GridView.builder(
          padding: EdgeInsets.only(
            top: appSearchHeight + widget.extraTopPadding + 12,
            left: 12,
            right: 12,
            bottom: MediaQuery.paddingOf(context).bottom +
                BottomNav.totalOverlayHeight,
          ),
          controller: widget.ctrl,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 190,
            mainAxisExtent: 140,
            mainAxisSpacing: 8,
          ),
          itemCount: widget.weights.length,
          itemBuilder: (context, index) {
            final weight = widget.weights[index];
            final isToday = isSameDay(weight.created, now);
            final isSelected = widget.selected.contains(weight.id);

            return WeightCard(
              weight: weight,
              isToday: isToday,
              isSelected: isSelected,
              showImages: settings.showImages,
              dateFormat: settings.shortDateFormat,
              onTap: () {
                if (widget.selected.isEmpty) {
                  showEditWeight(context, weight.toCompanion(false));
                } else {
                  widget.onSelect(weight.id);
                }
              },
              onLongPress: () => widget.onSelect(weight.id),
            );
          },
        ),
      );
    }
  }
}

class WeightCard extends StatelessWidget {
  const WeightCard({
    super.key,
    required this.weight,
    required this.isToday,
    required this.isSelected,
    required this.showImages,
    required this.dateFormat,
    required this.onTap,
    required this.onLongPress,
  });

  final Weight weight;
  final bool isToday;
  final bool isSelected;
  final bool showImages;
  final String dateFormat;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final accent = isToday ? colorScheme.primary : colorScheme.onSurfaceVariant;
    final hasImage = showImages && weight.image?.isNotEmpty == true;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: isSelected ? 6 : 0,
      shadowColor: colorScheme.primary.withValues(alpha: 0.4),
      color: isSelected
          ? colorScheme.primaryContainer.withValues(alpha: 0.35)
          : colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.outlineVariant.withValues(alpha: 0.6),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.all(14),
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
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                            color: isToday ? colorScheme.primary : null,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          weight.unit,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSelected)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: colorScheme.onPrimary,
                        size: 16,
                      ),
                    )
                  else if (isToday)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Today',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              if (hasImage) ...[
                const SizedBox(height: 12),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(weight.image!),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: colorScheme.surfaceContainerHighest,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: colorScheme.onSurfaceVariant,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ] else
                const Spacer(),
              const SizedBox(height: 12),
              Divider(
                height: 1,
                thickness: 1,
                color: colorScheme.outlineVariant.withValues(alpha: 0.4),
              ),
              const SizedBox(height: 8),
              _footerLine(
                theme,
                icon: isToday ? Icons.today : Icons.calendar_today,
                color: accent,
                text: _formatDateForCard(weight.created, dateFormat),
                bold: isToday,
              ),
              const SizedBox(height: 4),
              _footerLine(
                theme,
                icon: Icons.schedule,
                color: colorScheme.onSurfaceVariant,
                text: DateFormat('hh:mm a').format(weight.created),
                bold: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerLine(
    ThemeData theme, {
    required IconData icon,
    required Color color,
    required String text,
    required bool bold,
  }) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: bold ? FontWeight.w600 : null,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _formatDateForCard(DateTime date, String format) {
    // Use a more compact format for cards
    final now = DateTime.now();
    if (isSameDay(date, now)) return 'Today';
    if (isSameDay(date, now.subtract(const Duration(days: 1))))
      return 'Yesterday';

    // For cards, use a shorter format
    return DateFormat(format).format(date);
  }
}
