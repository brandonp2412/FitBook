import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FoodItemRow extends StatelessWidget {
  const FoodItemRow({
    super.key,
    required this.food,
    required this.isSelected,
    required this.showImages,
    required this.formatter,
    required this.onTap,
    required this.onLongPress,
    required this.onCheckboxChanged,
  });

  final FoodsCompanion food;
  final bool isSelected;
  final bool showImages;
  final NumberFormat formatter;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final ValueChanged<bool?> onCheckboxChanged;

  @override
  Widget build(BuildContext context) {
    final shortUnit = getShortUnit(food.servingUnit.value ?? 'grams');

    Widget? image;
    if (showImages) {
      if (food.imageFile.value?.isNotEmpty == true)
        image = Image.file(
          File(food.imageFile.value!),
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        );
      else if (food.smallImage.value?.isNotEmpty == true)
        image = material.SizedBox(
          height: 80,
          width: 50,
          child: CachedNetworkImage(imageUrl: food.smallImage.value!),
        );
    }

    return ListTile(
      tileColor: isSelected
          ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
          : null,
      leading: image,
      title: Text(food.name.value),
      subtitle: () {
        final cal = food.calories.value ?? 0;
        final size = food.servingSize.value ?? 100;
        final calPer100g = size > 0 ? cal * 100 / size : cal;
        return Row(
          children: [
            Text("${formatter.format(cal)} kcal"),
            if ((size - 100).abs() > 0.5)
              Text(
                " · ${formatter.format(calPer100g)}/100g",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            if (food.favorite.value == true) ...[
              const SizedBox(width: 6),
              Icon(
                Icons.favorite,
                size: 12,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ],
        );
      }(),
      trailing: Stack(
        children: [
          AnimatedScale(
            duration: const Duration(milliseconds: 150),
            scale: isSelected ? 0.0 : 1.0,
            child: Visibility(
              visible: !isSelected,
              child: Text(
                "${food.servingSize.value?.toInt() ?? "100"} $shortUnit",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          AnimatedScale(
            duration: const Duration(milliseconds: 150),
            scale: isSelected ? 1.0 : 0.0,
            child: Visibility(
              visible: isSelected,
              child: Checkbox(
                value: isSelected,
                onChanged: onCheckboxChanged,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
