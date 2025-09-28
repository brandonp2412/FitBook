import 'dart:io';

import 'package:fit_book/database/database.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:fit_book/weight/edit_weight_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WeightList extends StatefulWidget {
  const WeightList({
    super.key,
    required this.weights,
    required this.selected,
    required this.onSelect,
    required this.onNext,
    required this.ctrl,
  });

  final List<Weight> weights;
  final Set<int> selected;
  final Function(int) onSelect;
  final Function() onNext;
  final ScrollController ctrl;

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
      return Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 8),
          controller: widget.ctrl,
          itemCount: widget.weights.length,
          itemBuilder: (context, index) {
            final weight = widget.weights[index];
            final isToday = isSameDay(weight.created, now);
            Widget? leading;

            if (settings.showImages && weight.image?.isNotEmpty == true) {
              leading = Image.file(
                File(weight.image!),
                errorBuilder: (context, error, stackTrace) => TextButton.icon(
                  onPressed: () {},
                  label: const Text('Image error'),
                  icon: const Icon(Icons.error),
                ),
              );
            }

            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.selected.contains(weight.id)
                        ? Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: .08)
                        : Colors.transparent,
                    border: Border.all(
                      color: widget.selected.contains(weight.id)
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.3)
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    leading: leading,
                    title: Text(
                      "${weight.amount.toStringAsFixed(2)} ${weight.unit}",
                    ),
                    trailing: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: widget.selected.contains(weight.id) ? 1.0 : 0.0,
                      child: Checkbox(
                        value: widget.selected.contains(weight.id),
                        onChanged: (_) => widget.onSelect(weight.id),
                      ),
                    ),
                    subtitle: Text(
                      DateFormat(settings.longDateFormat)
                          .format(weight.created),
                      style: isToday
                          ? const TextStyle(fontWeight: FontWeight.bold)
                          : null,
                    ),
                    onLongPress: () => widget.onSelect(weight.id),
                    onTap: () {
                      if (widget.selected.isEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditWeightPage(
                              weight: weight.toCompanion(false),
                            ),
                          ),
                        );
                      } else {
                        widget.onSelect(weight.id);
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );
    } else {
      return Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          controller: widget.ctrl,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
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
              dateFormat: settings.longDateFormat,
              onTap: () {
                if (widget.selected.isEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditWeightPage(
                        weight: weight.toCompanion(false),
                      ),
                    ),
                  );
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

    return Card(
      elevation: isSelected ? 8 : 2,
      shadowColor:
          isSelected ? colorScheme.primary.withValues(alpha: 0.3) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isSelected
            ? BorderSide(color: colorScheme.primary, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary.withValues(alpha: 0.1),
                      colorScheme.primary.withValues(alpha: 0.05),
                    ],
                  )
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with weight and selection indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${weight.amount.toStringAsFixed(2)} ${weight.unit}",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isToday ? colorScheme.primary : null,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  AnimatedScale(
                    scale: isSelected ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
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
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Image section (if available)
              if (showImages && weight.image?.isNotEmpty == true)
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colorScheme.surfaceContainerHighest,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(weight.image!),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.broken_image_outlined,
                                color: colorScheme.onSurfaceVariant,
                                size: 24,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Image error',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              else
                const Spacer(),

              // Date section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isToday
                      ? colorScheme.primary.withValues(alpha: 0.15)
                      : colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isToday ? Icons.today : Icons.calendar_today,
                      size: 14,
                      color: isToday
                          ? colorScheme.primary
                          : colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        _formatDateForCard(weight.created, dateFormat),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: isToday ? FontWeight.bold : null,
                          color: isToday
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
