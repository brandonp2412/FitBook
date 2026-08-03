import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/diary/diary_food_thumbnail.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    this.trailingUnit = false,
    this.dense = true,
  });

  final DiaryFood food;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final bool showImages;
  final bool trailingUnit;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final suffix = food.unit == 'serving' && food.quantity > 1
        ? ' x${food.quantity.toInt()}'
        : '';
    final kcal =
        food.metrics[db.foods.calories.name]?.toStringAsFixed(0) ?? '0';

    return ListTile(
      tileColor: isSelected
          ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
          : null,
      dense: dense,
      leading: DiaryFoodThumbnail(food: food, showImages: showImages),
      title: Text('${food.name}$suffix'),
      subtitle: Text(DateFormat('h:mm a').format(food.created)),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: colorScheme.primary)
          : Text(trailingUnit ? '$kcal kcal' : kcal),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
