import 'dart:io';

import 'package:fit_book/database/database.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class MealRow extends StatelessWidget {
  const MealRow({
    super.key,
    required this.meal,
    required this.isSelected,
    required this.showImages,
    required this.totals,
    required this.onTap,
    required this.onLongPress,
  });

  final Meal meal;
  final bool isSelected;
  final bool showImages;
  final ({double calories, double protein})? totals;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    Widget leading;
    if (showImages && meal.imageFile?.isNotEmpty == true) {
      leading = Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.file(
                File(meal.imageFile!),
                cacheWidth:
                    (48 * MediaQuery.devicePixelRatioOf(context)).round(),
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.restaurant,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Positioned(
            right: -4,
            bottom: -4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Icons.restaurant, size: 10, color: Colors.white),
            ),
          ),
        ],
      );
    } else {
      leading = Icon(
        Icons.restaurant,
        color: Theme.of(context).colorScheme.primary,
      );
    }

    return material.DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)
              : Colors.transparent,
          width: 1,
        ),
      ),
      child: ListTile(
        tileColor: isSelected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: .08)
            : null,
        leading: leading,
        title: Text(meal.name),
        subtitle: totals == null
            ? Text(context.l10n.meal)
            : Text(
                totals!.protein > 0
                    ? '${context.l10n.kcalValue(formatDisplayNumber(context, totals!.calories, maximumFractionDigits: 0))} · ${context.l10n.proteinGramsValue(formatDisplayNumber(context, totals!.protein, maximumFractionDigits: 0))}'
                    : context.l10n.kcalValue(
                        formatDisplayNumber(
                          context,
                          totals!.calories,
                          maximumFractionDigits: 0,
                        ),
                      ),
              ),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}
