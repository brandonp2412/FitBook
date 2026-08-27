import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:path_provider/path_provider.dart';

class Macros {
  final double protein;
  final double fat;
  final double carb;
  final double calories;

  Macros({
    required this.protein,
    required this.fat,
    required this.carb,
    required this.calories,
  });
}

Macros getMacros(double amount, String unit) {
  // Convert to kg: lb -> kg conversion is divide by 2.2
  final kg = unit == 'lb' ? amount / 2.2 : amount;

  return Macros(
    carb: kg * 5,
    fat: kg * 0.8,
    protein: kg * 1.6,
    calories: kg * 27.5,
  );
}

String sentenceCase(String value) {
  if (value.isEmpty) return '';

  const specialCases = {
    '_18_3_n_3_c_c_c_ala_mg': 'Alpha-linolenic acid (ALA)',
    '_200_calorie_weight_g': '200-Calorie Equivalent Weight',
    '_20_5_n_3_epa_mg': 'Eicosapentaenoic acid (EPA)',
    '_22_5_n_3_dpa_mg': 'Docosapentaenoic acid (DPA)',
    '_22_6_n_3_dha_mg': 'Docosahexaenoic acid (DHA)',
    'protein_g': 'Protein',
    'fiber_g': 'Fiber',
    'alcohol_g': 'Alcohol',
    'vitamin_b_12_mcg': 'Vitamin B12 (Cobalamin)',
    'vitamin_a_iu_iu': 'Vitamin A (International Units)',
    'vitamin_d_iu_iu': 'Vitamin D (International Units)',
    'vitamin_a_rae_mcg': 'Vitamin A (Retinol Activity Equivalents)',
  };

  return specialCases[value] ??
      value[0].toUpperCase() + value.substring(1).replaceAll('_', ' ');
}

void toast(BuildContext context, String message, [SnackBarAction? action]) {
  final defaultAction = SnackBarAction(label: 'OK', onPressed: () {});

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.only(bottom: 89, left: 16, right: 16),
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      action: action ?? defaultAction,
      persist: false,
    ),
  );
}

Future<String?> pickAndSaveImage(String prefix, {ImageSource? source}) async {
  String? path;
  if (source == null) {
    final file = await FilePicker.pickFile(type: FileType.image);
    path = file?.path;
  } else {
    path = (await ImagePicker().pickImage(source: source))?.path;
  }
  if (path == null) return null;

  final docsDir = (await getApplicationDocumentsDirectory()).path;
  final destPath =
      '$docsDir/${prefix}_${DateTime.now().millisecondsSinceEpoch}.jpg';
  await File(path).copy(destPath);
  return destPath;
}

Future<void> showImageOptionsSheet({
  required BuildContext context,
  required VoidCallback onReplace,
  required VoidCallback onCamera,
  required VoidCallback onDelete,
}) {
  return showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    builder: (ctx) => SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Replace image'),
            onTap: () {
              Navigator.pop(ctx);
              onReplace();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take photo'),
            onTap: () {
              Navigator.pop(ctx);
              onCamera();
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete image'),
            onTap: () {
              Navigator.pop(ctx);
              onDelete();
            },
          ),
        ],
      ),
    ),
  );
}

String getShortUnit(String unit) {
  const shortUnits = {
    'serving': 'srv',
    'grams': 'g',
    'milliliters': 'ml',
    'kilojoules': 'kJ',
    'cups': 'cup',
    'tablespoons': 'tbsp',
    'milligrams': 'mg',
    'teaspoons': 'tsp',
    'ounces': 'oz',
    'pounds': 'lb',
    'kilograms': 'kg',
    'liters': 'L',
  };
  return shortUnits[unit.toLowerCase()] ?? unit;
}

String nutrientUnit(String field) {
  if (field == 'calories') return 'kcal';
  if (field.endsWith('_iu_iu') || field.endsWith('_iu')) return 'IU';
  if (field.endsWith('_mcg')) return 'mcg';
  if (field.endsWith('_mg')) return 'mg';
  if (field.endsWith('_g')) return 'g';
  return '';
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

/// Groups per-row `(created, value)` entries into local-calendar-day buckets
/// (matching the day grouping used by the Diary page), then rolls those days
/// up into the requested [period]. Week/month/year buckets are averaged
/// across the number of days within the bucket that have data, mirroring the
/// previous SQL `SUM(...) / COUNT(DISTINCT day)` behavior. Returns at most
/// [limit] of the most recent buckets, ordered oldest to newest.
List<({DateTime created, double val})> bucketGraphData(
  List<({DateTime created, double value})> entries,
  Period period,
  int limit,
) {
  DateTime dayKey(DateTime date) => DateTime(date.year, date.month, date.day);

  final dayTotals = <DateTime, double>{};
  for (final entry in entries) {
    final key = dayKey(entry.created);
    dayTotals[key] = (dayTotals[key] ?? 0.0) + entry.value;
  }

  DateTime periodKey(DateTime day) {
    switch (period) {
      case Period.week:
        return day.subtract(Duration(days: day.weekday - 1));
      case Period.month:
        return DateTime(day.year, day.month);
      case Period.year:
        return DateTime(day.year);
      case Period.day:
        return day;
    }
  }

  final periodSums = <DateTime, double>{};
  final periodDayCounts = <DateTime, int>{};
  for (final day in dayTotals.entries) {
    final key = periodKey(day.key);
    periodSums[key] = (periodSums[key] ?? 0.0) + day.value;
    periodDayCounts[key] = (periodDayCounts[key] ?? 0) + 1;
  }

  final sortedKeys = periodSums.keys.toList()..sort();
  final limitedKeys = sortedKeys.length > limit
      ? sortedKeys.sublist(sortedKeys.length - limit)
      : sortedKeys;

  return limitedKeys
      .map(
        (key) => (
          created: key,
          val: periodSums[key]! / periodDayCounts[key]!,
        ),
      )
      .toList();
}
