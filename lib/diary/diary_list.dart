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

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 4; // More columns for very wide screens
    if (width > 800) return 3; // 3 columns for tablets
    if (width > 600) return 2; // 2 columns for small tablets
    return 1; // Single column on mobile
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;
    final crossAxisCount = _getCrossAxisCount(context);

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
      } else {
        stats[day] = Stats(
          cals: diaryFood.metrics[db.foods.calories.name] ?? 0,
          protein: diaryFood.metrics[db.foods.proteinG.name] ?? 0,
          fat: diaryFood.metrics[db.foods.fatG.name] ?? 0,
          carb: diaryFood.metrics[db.foods.carbohydrateG.name] ?? 0,
          fiber: diaryFood.metrics[db.foods.fiberG.name] ?? 0,
        );
      }
    }

    // Group items by day for proper layout
    List<Widget> items = [];
    DateTime? lastDate;
    List<DiaryFood> currentDayFoods = [];

    for (int index = 0; index < widget.diaryFoods.length; index++) {
      final diaryFood = widget.diaryFoods[index];
      final currentDate = DateTime(
        diaryFood.created.year,
        diaryFood.created.month,
        diaryFood.created.day,
      );

      if (lastDate != null && !isSameDay(lastDate, currentDate)) {
        // Add previous day's content
        items.add(
          _buildDaySection(
            currentDayFoods,
            lastDate,
            stats[lastDate]!,
            settings,
            crossAxisCount,
          ),
        );
        currentDayFoods = [];
      }

      currentDayFoods.add(diaryFood);
      lastDate = currentDate;
    }

    // Add the last day's content
    if (currentDayFoods.isNotEmpty && lastDate != null) {
      items.add(
        _buildDaySection(
          currentDayFoods,
          lastDate,
          stats[lastDate]!,
          settings,
          crossAxisCount,
        ),
      );
    }

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(12),
        controller: widget.ctrl,
        children: items,
      ),
    );
  }

  Widget _buildDaySection(
    List<DiaryFood> dayFoods,
    DateTime date,
    Stats dayStats,
    dynamic settings,
    int crossAxisCount,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date header with stats
        _buildDateHeader(date, dayStats, settings),
        const SizedBox(height: 12),

        // Food cards - using Wrap instead of GridView for consistent sizing
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: dayFoods
              .map(
                (food) => SizedBox(
                  width: _getCardWidth(context, crossAxisCount),
                  child: _buildFoodCard(food, settings),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  double _getCardWidth(BuildContext context, int crossAxisCount) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth =
        screenWidth - 32; // Account for padding (12 * 2) and some margin
    final spacing =
        (crossAxisCount - 1) * 8; // Account for spacing between cards
    return (availableWidth - spacing) / crossAxisCount;
  }

  Widget _buildDateHeader(DateTime date, Stats dayStats, dynamic settings) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isToday = isSameDay(date, DateTime.now());

    return Card(
      elevation: isToday ? 4 : 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: isToday ? colorScheme.primaryContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Date title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isToday ? Icons.today : Icons.calendar_today,
                  color: isToday
                      ? colorScheme.onPrimaryContainer
                      : colorScheme.onSurface,
                ),
                const SizedBox(width: 8),
                Text(
                  isToday
                      ? 'Today'
                      : DateFormat(settings.shortDateFormat).format(date),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isToday ? colorScheme.onPrimaryContainer : null,
                  ),
                ),
              ],
            ),

            // Stats
            if (settings.diarySummary != 'DiarySummary.none') ...[
              const SizedBox(height: 16),
              _buildStatsSection(dayStats, settings, colorScheme, isToday),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(
    Stats dayStats,
    dynamic settings,
    ColorScheme colorScheme,
    bool isToday,
  ) {
    final List<Widget> statItems = [];

    if (settings.dailyCalories != null) {
      statItems.add(
        _buildStatItem(
          Icons.whatshot,
          _formatStat(
            'calories',
            dayStats.cals,
            settings.dailyCalories,
            settings,
          ),
          colorScheme,
          isToday,
        ),
      );
    }

    if (settings.dailyProtein != null) {
      statItems.add(
        _buildStatItem(
          Icons.egg_outlined,
          _formatStat(
            'protein',
            dayStats.protein,
            settings.dailyProtein,
            settings,
          ),
          colorScheme,
          isToday,
        ),
      );
    }

    if (settings.dailyFat != null) {
      statItems.add(
        _buildStatItem(
          Icons.opacity_outlined,
          _formatStat('fat', dayStats.fat, settings.dailyFat, settings),
          colorScheme,
          isToday,
        ),
      );
    }

    if (settings.dailyCarb != null) {
      statItems.add(
        _buildStatItem(
          Icons.bakery_dining_outlined,
          _formatStat('carbs', dayStats.carb, settings.dailyCarb, settings),
          colorScheme,
          isToday,
        ),
      );
    }

    if (settings.dailyFiber != null) {
      statItems.add(
        _buildStatItem(
          Icons.grass_outlined,
          _formatStat('fiber', dayStats.fiber, settings.dailyFiber, settings),
          colorScheme,
          isToday,
        ),
      );
    }

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DiarySettings()),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 16,
        runSpacing: 12,
        children: statItems,
      ),
    );
  }

  Widget _buildStatItem(
    IconData icon,
    String text,
    ColorScheme colorScheme,
    bool isToday,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isToday
            ? colorScheme.surface.withOpacity(0.5)
            : colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _formatStat(
    String type,
    double current,
    int target,
    dynamic settings,
  ) {
    final formatter = NumberFormat('#,##0');

    switch (settings.diarySummary) {
      case 'DiarySummary.remaining':
        final remaining = target - current;
        if (type == 'calories') {
          return "${formatter.format(remaining)} kcal";
        }
        return "${remaining.toStringAsFixed(0)}g $type";
      case 'DiarySummary.division':
        if (type == 'calories') {
          return "${formatter.format(current)} / ${formatter.format(target)} kcal";
        }
        return "${current.toStringAsFixed(0)} / ${target.toStringAsFixed(0)}g $type";
      case 'DiarySummary.both':
        final remaining = target - current;
        if (type == 'calories') {
          return "${remaining.toStringAsFixed(0)} (${formatter.format(target)} kcal)";
        }
        return "${remaining.toStringAsFixed(0)} (${target.toStringAsFixed(0)}g $type)";
      default:
        return '';
    }
  }

  Widget _buildFoodCard(DiaryFood diaryFood, dynamic settings) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSelected = widget.selected.contains(diaryFood.entryId);
    final suffix = diaryFood.unit == 'serving' && diaryFood.quantity > 1
        ? " x${diaryFood.quantity.toInt()}"
        : "";

    return Card(
      elevation: isSelected ? 8 : 2,
      shadowColor: isSelected ? colorScheme.primary.withOpacity(0.3) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? BorderSide(color: colorScheme.primary, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: () {
          if (widget.selected.isEmpty && diaryFood.name != 'Quick-add') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditDiaryPage(
                  id: diaryFood.entryId,
                ),
              ),
            );
          } else if (widget.selected.isEmpty && diaryFood.name == 'Quick-add') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuickAddPage(
                  id: diaryFood.entryId,
                ),
              ),
            );
          } else {
            widget.onSelect(diaryFood.entryId);
          }
        },
        onLongPress: () => widget.onSelect(diaryFood.entryId),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 80, // Fixed height for all cards
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary.withOpacity(0.1),
                      colorScheme.primary.withOpacity(0.05),
                    ],
                  )
                : null,
          ),
          child: Row(
            children: [
              // Smaller food image
              if (settings.showImages)
                _buildCompactFoodImage(diaryFood, colorScheme),

              // Food info
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: settings.showImages ? 8 : 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${diaryFood.name}$suffix",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        DateFormat('h:mm a').format(diaryFood.created),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Compact calories/selection
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isSelected
                    ? Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: colorScheme.onPrimary,
                          size: 14,
                        ),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${diaryFood.metrics[db.foods.calories.name]?.toStringAsFixed(0) ?? 0}",
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "kcal",
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
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

  Widget _buildCompactFoodImage(DiaryFood diaryFood, ColorScheme colorScheme) {
    Widget? imageWidget;

    if (diaryFood.imageFile?.isNotEmpty == true) {
      imageWidget = Image.file(
        File(diaryFood.imageFile!),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            _buildCompactImagePlaceholder(colorScheme),
      );
    } else if (diaryFood.smallImage?.isNotEmpty == true) {
      imageWidget = CachedNetworkImage(
        imageUrl: diaryFood.smallImage!,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            _buildCompactImagePlaceholder(colorScheme),
        errorWidget: (context, url, error) =>
            _buildCompactImagePlaceholder(colorScheme),
      );
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: colorScheme.surfaceContainerHighest,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: imageWidget ?? _buildCompactImagePlaceholder(colorScheme),
      ),
    );
  }

  Widget _buildCompactImagePlaceholder(ColorScheme colorScheme) {
    return Container(
      color: colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.restaurant,
        color: colorScheme.onSurfaceVariant,
        size: 20,
      ),
    );
  }

  Widget _buildFoodImage(DiaryFood diaryFood, ColorScheme colorScheme) {
    Widget? imageWidget;

    if (diaryFood.imageFile?.isNotEmpty == true) {
      imageWidget = Image.file(
        File(diaryFood.imageFile!),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            _buildImagePlaceholder(colorScheme),
      );
    } else if (diaryFood.smallImage?.isNotEmpty == true) {
      imageWidget = CachedNetworkImage(
        imageUrl: diaryFood.smallImage!,
        fit: BoxFit.cover,
        placeholder: (context, url) => _buildImagePlaceholder(colorScheme),
        errorWidget: (context, url, error) =>
            _buildImagePlaceholder(colorScheme),
      );
    }

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorScheme.surfaceContainerHighest,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: imageWidget ?? _buildImagePlaceholder(colorScheme),
      ),
    );
  }

  Widget _buildImagePlaceholder(ColorScheme colorScheme) {
    return Container(
      color: colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.restaurant,
        color: colorScheme.onSurfaceVariant,
        size: 24,
      ),
    );
  }
}
