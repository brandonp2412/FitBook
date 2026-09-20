import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';

class FoodItemRow extends StatelessWidget {
  const FoodItemRow({
    super.key,
    required this.food,
    required this.isSelected,
    required this.showImages,
    required this.onTap,
    required this.onLongPress,
  });

  final FoodsCompanion food;
  final bool isSelected;
  final bool showImages;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Widget? image;
    if (showImages && food.imageFile.value?.isNotEmpty == true)
      image = Image.file(
        File(food.imageFile.value!),
        cacheWidth: (50 * MediaQuery.devicePixelRatioOf(context)).round(),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _placeholder(colorScheme),
      );
    else if (showImages && food.smallImage.value?.isNotEmpty == true)
      image = CachedNetworkImage(
        imageUrl: food.smallImage.value!,
        fit: BoxFit.cover,
        placeholder: (_, __) => _placeholder(colorScheme),
        errorWidget: (_, __, ___) => _placeholder(colorScheme),
      );

    return ListTile(
      tileColor: isSelected
          ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
          : null,
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorScheme.surfaceContainerHighest,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: image ?? _placeholder(colorScheme),
        ),
      ),
      title: Text(food.name.value),
      subtitle: () {
        return Row(
          children: [
            Text(
              context.l10n.kcalValue(
                formatDisplayNumber(
                  context,
                  food.calories.value ?? 0,
                  maximumFractionDigits: 0,
                ),
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
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }

  Widget _placeholder(ColorScheme colorScheme) => Container(
        color: colorScheme.surfaceContainerHighest,
        child: Icon(Icons.restaurant, color: colorScheme.onSurfaceVariant),
      );
}
