import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_book/diary/diary_food.dart';
import 'package:flutter/material.dart';

/// Fixed-size, clipped food thumbnail used as the leading widget across
/// every diary row variant. Falls back to a themed placeholder icon when
/// there's no image, the image fails to load, or [showImages] is off —
/// instead of a meal-based icon or an unsized/broken image.
class DiaryFoodThumbnail extends StatelessWidget {
  const DiaryFoodThumbnail({
    super.key,
    required this.food,
    required this.showImages,
    this.size = 40,
  });

  final DiaryFood food;
  final bool showImages;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget? image;
    if (showImages) {
      if (food.imageFile?.isNotEmpty == true) {
        image = Image.file(
          File(food.imageFile!),
          cacheWidth: (size * MediaQuery.devicePixelRatioOf(context)).round(),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _placeholder(colorScheme),
        );
      } else if (food.smallImage?.isNotEmpty == true) {
        image = CachedNetworkImage(
          imageUrl: food.smallImage!,
          fit: BoxFit.cover,
          placeholder: (context, url) => _placeholder(colorScheme),
          errorWidget: (context, url, error) => _placeholder(colorScheme),
        );
      }
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 4),
        color: colorScheme.surfaceContainerHighest,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 4),
        child: image ?? _placeholder(colorScheme),
      ),
    );
  }

  Widget _placeholder(ColorScheme colorScheme) {
    return Container(
      color: colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.restaurant,
        color: colorScheme.onSurfaceVariant,
        size: size / 2,
      ),
    );
  }
}
