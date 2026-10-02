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
      return ListTile(
        tileColor: isSelected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
            : null,
        dense: dense,
        leading: Checkbox(
          key: ValueKey('diary-select-${food.entryId}'),
          value: isSelected,
          onChanged: (_) => onLongPress(),
        ),
        title: Row(
          children: [
            thumbnail,
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name + suffix),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
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
