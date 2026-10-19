import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/diary/diary_food_thumbnail.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';

/// Shared minimal row used across the decluttered diary variants. Always
/// leads with the entry's real food thumbnail (see [DiaryFoodThumbnail])
/// rather than a meal-based icon or dot, so every variant shows what was
/// actually logged at a glance.
class DiaryEntryRow extends StatelessWidget {
  const DiaryEntryRow({
    super.key,
    required this.food,
    required this.isSelected,
    required this.onTap,
    required this.onLongPress,
    required this.showImages,
    this.dense = false,
  });

  final DiaryFood food;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final bool showImages;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final suffix = food.unit == 'serving' && food.quantity > 1
        ? ' x${food.quantity.toInt()}'
        : '';
    final kcal = formatDisplayNumber(
      context,
      food.metrics[db.foods.calories.name] ?? 0,
      maximumFractionDigits: 0,
    );
    final subtitle = '$kcal kcal · ${formatDisplayTime(context, food.created)}';
    final thumbnail = DiaryFoodThumbnail(food: food, showImages: showImages);

    if (usesDesktopInteractions(context)) {
      final secondaryStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          );
      return ListTile(
        tileColor: isSelected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
            : null,
        dense: true,
        visualDensity: VisualDensity.compact,
        minVerticalPadding: 0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: Checkbox(
          key: ValueKey('diary-select-${food.entryId}'),
          value: isSelected,
          onChanged: (_) => onLongPress(),
        ),
        title: Row(
          children: [
            DiaryFoodThumbnail(food: food, showImages: showImages, size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                food.name + suffix,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12),
            Text('$kcal kcal', style: secondaryStyle),
            const SizedBox(width: 16),
            Text(
              formatDisplayTime(context, food.created),
              style: secondaryStyle,
            ),
          ],
        ),
        onTap: onTap,
      );
    }

    return ListTile(
      tileColor: isSelected
          ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
          : null,
      dense: dense,
      leading: thumbnail,
      title: Text(food.name + suffix),
      subtitle: Text(subtitle),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
