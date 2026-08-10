import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/database/database.dart';
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
    Widget? image;
    if (showImages) {
      if (food.imageFile.value?.isNotEmpty == true)
        image = Image.file(
          File(food.imageFile.value!),
          cacheWidth: 64,
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
        return Row(
          children: [
            Text("${formatter.format(food.calories.value ?? 0)} kcal"),
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
      trailing: isSelected
          ? Checkbox(value: isSelected, onChanged: onCheckboxChanged)
          : null,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
