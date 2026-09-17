import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
    'vitamin_b_12_mcg': 'Vitamin B12 (Cobalamin)',
    'vitamin_a_iu_iu': 'Vitamin A (International Units)',
    'vitamin_d_iu_iu': 'Vitamin D (International Units)',
    'vitamin_a_rae_mcg': 'Vitamin A (Retinol Activity Equivalents)',
  };

  return specialCases[value] ??
      value[0].toUpperCase() + value.substring(1).replaceAll('_', ' ');
}

/// Returns a localized label for common food fields while preserving the
/// persisted database column name used by queries and settings.
String localizedFoodFieldLabel(AppLocalizations l10n, String field) =>
    switch (field) {
      'calories' => l10n.calories,
      'protein_g' || 'proteinG' => l10n.protein,
      'carbohydrate_g' || 'carbohydrateG' => l10n.carbs,
      'fat_g' || 'fatG' => l10n.fat,
      'fiber_g' || 'fiberG' => l10n.fiber,
      'food_group' || 'foodGroup' => l10n.foodGroup,
      'serving_size' || 'servingSize' => l10n.servingSize,
      'serving_unit' || 'servingUnit' => l10n.servingUnit,
      'created' => l10n.createdDate,
      'favorite' => l10n.favorite,
      'name' => l10n.name,
      'barcode' => l10n.barcode,
      'sugars_g' || 'sugarsG' => l10n.nutrientSugars,
      'cholesterol_mg' || 'cholesterolMg' => l10n.nutrientCholesterol,
      'saturated_fats_g' || 'saturatedFatsG' => l10n.nutrientSaturatedFat,
      'calcium_mg' || 'calciumMg' => l10n.nutrientCalcium,
      'iron_fe_mg' || 'ironFeMg' => l10n.nutrientIron,
      'potassium_k_mg' || 'potassiumKMg' => l10n.nutrientPotassium,
      'magnesium_mg' || 'magnesiumMg' => l10n.nutrientMagnesium,
      'vitamin_a_iu_iu' ||
      'vitaminAIuIu' ||
      'vitamin_a_rae_mcg' ||
      'vitaminARaeMcg' =>
        l10n.nutrientVitaminA,
      'vitamin_c_mg' || 'vitaminCMg' => l10n.nutrientVitaminC,
      'vitamin_b_12_mcg' || 'vitaminB12Mcg' => l10n.nutrientVitaminB12,
      'vitamin_d_mcg' ||
      'vitaminDMcg' ||
      'vitamin_d_iu_iu' ||
      'vitaminDIuIu' =>
        l10n.nutrientVitaminD,
      'vitamin_e_alpha_tocopherol_mg' ||
      'vitaminEAlphaTocopherolMg' =>
        l10n.nutrientVitaminE,
      'added_sugar_g' || 'addedSugarG' => l10n.nutrientAddedSugar,
      'net_carbs_g' || 'netCarbsG' => l10n.nutrientNetCarbs,
      'water_g' || 'waterG' => l10n.nutrientWater,
      'omega_3s_mg' || 'omega3sMg' => l10n.nutrientOmega3,
      'omega_6s_mg' || 'omega6sMg' => l10n.nutrientOmega6,
      'pral_score' || 'pralScore' => l10n.nutrientPralScore,
      'trans_fatty_acids_g' || 'transFattyAcidsG' => l10n.nutrientTransFat,
      'soluble_fiber_g' || 'solubleFiberG' => l10n.nutrientSolubleFiber,
      'insoluble_fiber_g' || 'insolubleFiberG' => l10n.nutrientInsolubleFiber,
      'phosphorus_p_mg' || 'phosphorusPMg' => l10n.nutrientPhosphorus,
      'sodium_mg' || 'sodiumMg' => l10n.nutrientSodium,
      'zinc_zn_mg' || 'zincZnMg' => l10n.nutrientZinc,
      'copper_cu_mg' || 'copperCuMg' => l10n.nutrientCopper,
      'manganese_mg' || 'manganeseMg' => l10n.nutrientManganese,
      'selenium_se_mcg' || 'seleniumSeMcg' => l10n.nutrientSelenium,
      'fluoride_f_mcg' || 'fluorideFMcg' => l10n.nutrientFluoride,
      'molybdenum_mcg' || 'molybdenumMcg' => l10n.nutrientMolybdenum,
      'chlorine_mg' || 'chlorineMg' => l10n.nutrientChloride,
      'sucrose_g' || 'sucroseG' => l10n.nutrientSucrose,
      'glucose_dextrose_g' || 'glucoseDextroseG' => l10n.nutrientGlucose,
      'fructose_g' || 'fructoseG' => l10n.nutrientFructose,
      'lactose_g' || 'lactoseG' => l10n.nutrientLactose,
      'maltose_g' || 'maltoseG' => l10n.nutrientMaltose,
      'galactose_g' || 'galactoseG' => l10n.nutrientGalactose,
      'starch_g' || 'starchG' => l10n.nutrientStarch,
      'total_sugar_alcohols_g' ||
      'totalSugarAlcoholsG' =>
        l10n.nutrientSugarAlcohols,
      'thiamin_b1_mg' || 'thiaminB1Mg' => l10n.nutrientThiaminB1,
      'riboflavin_b2_mg' || 'riboflavinB2Mg' => l10n.nutrientRiboflavinB2,
      'niacin_b3_mg' || 'niacinB3Mg' => l10n.nutrientNiacinB3,
      'pantothenic_acid_b5_mg' ||
      'pantothenicAcidB5Mg' =>
        l10n.nutrientPantothenicAcidB5,
      'vitamin_b6_mg' || 'vitaminB6Mg' => l10n.nutrientVitaminB6,
      'biotin_b7_mcg' || 'biotinB7Mcg' => l10n.nutrientBiotinB7,
      'folate_b9_mcg' || 'folateB9Mcg' => l10n.nutrientFolateB9,
      'folic_acid_mcg' || 'folicAcidMcg' => l10n.nutrientFolicAcid,
      'food_folate_mcg' || 'foodFolateMcg' => l10n.nutrientFoodFolate,
      'folate_dfe_mcg' || 'folateDfeMcg' => l10n.nutrientFolateDfe,
      'choline_mg' || 'cholineMg' => l10n.nutrientCholine,
      'betaine_mg' || 'betaineMg' => l10n.nutrientBetaine,
      'retinol_mcg' || 'retinolMcg' => l10n.nutrientRetinol,
      'carotene_beta_mcg' || 'caroteneBetaMcg' => l10n.nutrientBetaCarotene,
      'carotene_alpha_mcg' || 'caroteneAlphaMcg' => l10n.nutrientAlphaCarotene,
      'lycopene_mcg' || 'lycopeneMcg' => l10n.nutrientLycopene,
      'lutein_zeaxanthin_mcg' ||
      'luteinZeaxanthinMcg' =>
        l10n.nutrientLuteinZeaxanthin,
      'vitamin_d2_ergocalciferol_mcg' ||
      'vitaminD2ErgocalciferolMcg' =>
        l10n.nutrientVitaminD2,
      'vitamin_d3_cholecalciferol_mcg' ||
      'vitaminD3CholecalciferolMcg' =>
        l10n.nutrientVitaminD3,
      'vitamin_k_mcg' || 'vitaminKMcg' => l10n.nutrientVitaminK,
      'dihydrophylloquinone_mcg' ||
      'dihydrophylloquinoneMcg' =>
        l10n.nutrientDihydrophylloquinone,
      'menaquinone_4_mcg' || 'menaquinone4Mcg' => l10n.nutrientMenaquinone4,
      'fatty_acids_total_monounsaturated_mg' ||
      'fattyAcidsTotalMonounsaturatedMg' =>
        l10n.nutrientMonounsaturatedFat,
      'fatty_acids_total_polyunsaturated_mg' ||
      'fattyAcidsTotalPolyunsaturatedMg' =>
        l10n.nutrientPolyunsaturatedFat,
      '_18_3_n_3_c_c_c_ala_mg' || 'u183N3CCCAlaMg' => l10n.nutrientAla,
      '_20_5_n_3_epa_mg' || 'u205N3EpaMg' => l10n.nutrientEpa,
      '_22_5_n_3_dpa_mg' || 'u225N3DpaMg' => l10n.nutrientDpa,
      '_22_6_n_3_dha_mg' || 'u226N3DhaMg' => l10n.nutrientDha,
      'alanine_mg' || 'alanineMg' => l10n.nutrientAlanine,
      'alcohol_g' || 'alcoholG' => l10n.nutrientAlcohol,
      'arginine_mg' || 'arginineMg' => l10n.nutrientArginine,
      'aspartic_acid_mg' || 'asparticAcidMg' => l10n.nutrientAsparticAcid,
      'cystine_mg' || 'cystineMg' => l10n.nutrientCystine,
      'glutamic_acid_mg' || 'glutamicAcidMg' => l10n.nutrientGlutamicAcid,
      'glycine_mg' || 'glycineMg' => l10n.nutrientGlycine,
      'histidine_mg' || 'histidineMg' => l10n.nutrientHistidine,
      'hydroxyproline_mg' || 'hydroxyprolineMg' => l10n.nutrientHydroxyproline,
      'isoleucine_mg' || 'isoleucineMg' => l10n.nutrientIsoleucine,
      'leucine_mg' || 'leucineMg' => l10n.nutrientLeucine,
      'lysine_mg' || 'lysineMg' => l10n.nutrientLysine,
      'methionine_mg' || 'methionineMg' => l10n.nutrientMethionine,
      'phenylalanine_mg' || 'phenylalanineMg' => l10n.nutrientPhenylalanine,
      'proline_mg' || 'prolineMg' => l10n.nutrientProline,
      'serine_mg' || 'serineMg' => l10n.nutrientSerine,
      'threonine_mg' || 'threonineMg' => l10n.nutrientThreonine,
      'tryptophan_mg' || 'tryptophanMg' => l10n.nutrientTryptophan,
      'tyrosine_mg' || 'tyrosineMg' => l10n.nutrientTyrosine,
      'valine_mg' || 'valineMg' => l10n.nutrientValine,
      'caffeine_mg' || 'caffeineMg' => l10n.nutrientCaffeine,
      'theobromine_mg' || 'theobromineMg' => l10n.nutrientTheobromine,
      _ => sentenceCase(field),
    };

void toast(BuildContext context, String message, [SnackBarAction? action]) {
  final defaultAction = SnackBarAction(
    label: context.l10n.ok,
    onPressed: () {},
  );

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
            title: Text(ctx.l10n.replaceImage),
            onTap: () {
              Navigator.pop(ctx);
              onReplace();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(ctx.l10n.takePhoto),
            onTap: () {
              Navigator.pop(ctx);
              onCamera();
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: Text(ctx.l10n.deleteImage),
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

/// Formats [value] with [pattern] using the active app locale.
String formatDisplayDate(
  BuildContext context,
  DateTime value,
  String pattern,
) =>
    DateFormat(
      pattern,
      Localizations.localeOf(context).toLanguageTag(),
    ).format(value);

/// Formats [value] as a locale-appropriate time.
String formatDisplayTime(BuildContext context, DateTime value) => DateFormat.jm(
      Localizations.localeOf(context).toLanguageTag(),
    ).format(value);

/// Formats [value] using the active app locale and fraction-digit bounds.
String formatDisplayNumber(
  BuildContext context,
  num value, {
  int minimumFractionDigits = 0,
  int maximumFractionDigits = 2,
}) {
  final formatter = NumberFormat.decimalPattern(
    Localizations.localeOf(context).toLanguageTag(),
  )
    ..minimumFractionDigits = minimumFractionDigits
    ..maximumFractionDigits = maximumFractionDigits;
  return formatter.format(value);
}

/// Parses a number using the active locale's decimal and grouping separators.
double? parseDisplayNumber(BuildContext context, String value) {
  final text = value.trim();
  if (text.isEmpty) return null;
  try {
    return NumberFormat.decimalPattern(
      Localizations.localeOf(context).toLanguageTag(),
    ).parse(text).toDouble();
  } on FormatException {
    return null;
  }
}

/// Parses a whole number using the active locale's grouping separators.
int? parseDisplayInt(BuildContext context, String value) {
  final parsed = parseDisplayNumber(context, value);
  if (parsed == null ||
      !parsed.isFinite ||
      parsed != parsed.truncateToDouble()) {
    return null;
  }
  return parsed.toInt();
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

double convertFromGrams(double qtyInGrams, String targetUnit) {
  const conversionFactors = {
    'grams': 1.0,
    'milliliters': 1.0,
    'milligrams': 1000.0,
    'cups': 1.0 / 250,
    'tablespoons': 1.0 / 15,
    'teaspoons': 1.0 / 5,
    'ounces': 1.0 / 28.35,
    'pounds': 1.0 / 453.592,
    'liters': 1.0 / 1000,
    'kilojoules': 4.184,
  };

  if (targetUnit == 'serving') {
    throw Exception('Serving unit should be handled separately');
  }

  final factor = conversionFactors[targetUnit];
  if (factor == null) throw Exception('Unit not recognized');
  return qtyInGrams * factor;
}

Food convertCustomServing({
  required Food food, // This contains original per-serving values
  required double qty,
  required String unit,
}) {
  if (unit == 'serving') {
    return Food(
      id: food.id,
      name: food.name,
      servingSize: qty,
      servingUnit: unit,
      calories: (food.calories ?? 0) * qty,
      proteinG: (food.proteinG ?? 0) * qty,
      fatG: (food.fatG ?? 0) * qty,
      carbohydrateG: (food.carbohydrateG ?? 0) * qty,
      fiberG: (food.fiberG ?? 0) * qty,
    );
  }

  final originalServingSize = food.servingSize ?? 100;
  final originalServingUnit = food.servingUnit ?? 'grams';

  double originalServingG;
  if (originalServingUnit == 'serving') {
    originalServingG = originalServingSize;
  } else {
    originalServingG = convertToGrams(originalServingSize, originalServingUnit);
  }

  final calsPerGram = (food.calories ?? 0) / originalServingG;
  final proteinPerGram = (food.proteinG ?? 0) / originalServingG;
  final fatPerGram = (food.fatG ?? 0) / originalServingG;
  final carbPerGram = (food.carbohydrateG ?? 0) / originalServingG;
  final fiberPerGram = (food.fiberG ?? 0) / originalServingG;

  final targetServingG = convertToGrams(qty, unit);

  return Food(
    id: food.id,
    name: food.name,
    servingSize: qty,
    servingUnit: unit,
    calories: calsPerGram * targetServingG,
    proteinG: proteinPerGram * targetServingG,
    fatG: fatPerGram * targetServingG,
    carbohydrateG: carbPerGram * targetServingG,
    fiberG: fiberPerGram * targetServingG,
  );
}

double convertToGrams(double qty, String unit) {
  const conversionFactors = {
    'grams': 1.0,
    'milliliters': 1.0,
    'milligrams': 1.0 / 1000,
    'cups': 250.0,
    'tablespoons': 15.0,
    'teaspoons': 5.0,
    'ounces': 28.35,
    'pounds': 453.592,
    'kilograms': 1000.0,
    'liters': 1000.0,
    'kilojoules': 1.0 / 4.184,
  };

  if (unit == 'serving') {
    throw Exception('Serving unit should be handled separately');
  }

  final factor = conversionFactors[unit];
  if (factor == null) throw Exception('Unit not recognized');
  return qty * factor;
}

/// Resolves a food's configured serving size to grams. A legacy `serving`
/// unit is treated as a gram weight, matching the historic database model.
double servingGrams(double servingSize, String servingUnit) {
  if (servingSize <= 0) return 0;
  if (servingUnit == 'serving') return servingSize;
  try {
    return convertToGrams(servingSize, servingUnit);
  } on Exception {
    return servingSize;
  }
}

/// Returns a nutrient value normalized to 100 grams, or `null` when the
/// serving unit does not describe a weight/volume that can be converted to
/// grams (for example `serving` or `unit`).
double? valuePer100g({
  required double value,
  required double servingSize,
  required String servingUnit,
}) {
  if (servingSize <= 0) return null;
  const gramConvertibleUnits = {
    'grams',
    'milliliters',
    'milligrams',
    'cups',
    'tablespoons',
    'teaspoons',
    'ounces',
    'pounds',
    'kilograms',
    'liters',
  };
  if (!gramConvertibleUnits.contains(servingUnit)) return null;

  try {
    final servingGrams = convertToGrams(servingSize, servingUnit);
    if (servingGrams <= 0) return null;
    return value * 100 / servingGrams;
  } on Exception {
    return null;
  }
}

/// SQL CASE expression converting a food row's serving_size/serving_unit
/// into grams. [foodsTable] lets callers target either the top-level
/// `foods` table or a joined alias (e.g. `mf_f` for meal-food components).
String servingGramsSql(String foodsTable) => '''
  CASE
    WHEN $foodsTable.serving_size IS NULL THEN 100
    WHEN $foodsTable.serving_unit IS NULL THEN $foodsTable.serving_size
    WHEN $foodsTable.serving_unit = 'ounces' THEN $foodsTable.serving_size * 28.35
    WHEN $foodsTable.serving_unit = 'grams' THEN $foodsTable.serving_size
    WHEN $foodsTable.serving_unit = 'milliliters' THEN $foodsTable.serving_size
    WHEN $foodsTable.serving_unit = 'cups' THEN $foodsTable.serving_size * 250
    WHEN $foodsTable.serving_unit = 'tablespoons' THEN $foodsTable.serving_size * 15
    WHEN $foodsTable.serving_unit = 'teaspoons' THEN $foodsTable.serving_size * 5
    WHEN $foodsTable.serving_unit = 'pounds' THEN $foodsTable.serving_size * 453.592
    WHEN $foodsTable.serving_unit = 'serving' THEN $foodsTable.serving_size
    ELSE 100
  END
''';

/// SQL CASE expression converting an entry row's quantity/unit into grams.
/// [entryTable] carries `quantity`/`unit` (e.g. `diaries` or `meal_foods`);
/// [foodsTable] is the joined foods row used to resolve serving size when
/// `unit = 'serving'`.
String entryQuantityInGramsSql(String entryTable, String foodsTable) => '''
  CASE
    WHEN $entryTable.unit = 'serving'
      THEN $entryTable.quantity * (${servingGramsSql(foodsTable)})
    WHEN $entryTable.unit IN ('grams', 'milliliters') THEN $entryTable.quantity
    WHEN $entryTable.unit = 'milligrams' THEN $entryTable.quantity / 1000
    WHEN $entryTable.unit = 'cups' THEN $entryTable.quantity * 250
    WHEN $entryTable.unit = 'tablespoons' THEN $entryTable.quantity * 15
    WHEN $entryTable.unit = 'teaspoons' THEN $entryTable.quantity * 5
    WHEN $entryTable.unit = 'ounces' THEN $entryTable.quantity * 28.35
    WHEN $entryTable.unit = 'pounds' THEN $entryTable.quantity * 453.592
    WHEN $entryTable.unit = 'liters' THEN $entryTable.quantity * 1000
    WHEN $entryTable.unit = 'kilojoules' THEN $entryTable.quantity / 4.184
    ELSE $entryTable.quantity
  END
''';

/// SQL expression summing [field] across a meal's component meal_foods rows,
/// converting each component's quantity/unit to grams and scaling by its
/// food's nutrient-per-100g value. Used both as a top-level `GROUP BY`
/// aggregate and as a correlated-subquery aggregate via [mealFoodsTable]/
/// [foodsTable] aliases.
String mealFoodsFieldSumSql(
  String field, {
  String mealFoodsTable = 'meal_foods',
  String foodsTable = 'foods',
}) =>
    '''
  SUM(
    (${entryQuantityInGramsSql(mealFoodsTable, foodsTable)})
    * COALESCE($foodsTable.$field, 0.0)
    / NULLIF((${servingGramsSql(foodsTable)}), 0.0)
  )
''';

/// SQL CASE expression for a diary row's nutrient [field], handling both
/// standalone food entries and meal entries (which sum across the meal's
/// component foods). Assumes the query joins `diaries` with `foods` on
/// `diaries.food`.
String mealAwareFieldExpr(String field) => '''
  CASE
    WHEN diaries.meal IS NOT NULL THEN
      diaries.quantity * COALESCE((
        SELECT ${mealFoodsFieldSumSql(field, mealFoodsTable: 'mf', foodsTable: 'mf_f')}
        FROM meal_foods AS mf
        JOIN foods AS mf_f ON mf_f.id = mf.food
        WHERE mf.meal = diaries.meal
      ), 0.0)
    ELSE
      (${entryQuantityInGramsSql('diaries', 'foods')})
      * COALESCE(foods.$field, 0.0)
      / NULLIF((${servingGramsSql('foods')}), 0.0)
  END
''';

void selectAll(TextEditingController ctrl) {
  ctrl.selection = TextSelection(
    baseOffset: 0,
    extentOffset: ctrl.text.length,
  );
}

bool shouldNotify(
  double lastWeight,
  double? secondLastWeight,
  double goalWeight,
) {
  if (secondLastWeight == null) return false;

  final trending = (secondLastWeight > lastWeight && lastWeight > goalWeight) ||
      (secondLastWeight < lastWeight && lastWeight < goalWeight);
  if (!trending) return false;

  final withinGoal =
      (goalWeight <= lastWeight && lastWeight - goalWeight <= 1) ||
          (goalWeight >= lastWeight && goalWeight - lastWeight <= 1);
  if (!withinGoal) return false;

  return Random().nextInt(100) < 30;
}

Value<double?> _getNutrimentValue(
  Nutriments? nutriments,
  Nutrient nutrient,
  PerSize perSize,
) {
  return Value(nutriments?.getValue(nutrient, perSize));
}

FoodsCompanion mapOpenFoodFacts(Product product, String foodUnit) {
  final perSize =
      foodUnit == 'serving' ? PerSize.serving : PerSize.oneHundredGrams;
  final servingSize =
      foodUnit == 'serving' ? product.servingQuantity ?? 1 : 100.0;
  final kj = product.nutriments?.getComputedKJ(perSize);

  return FoodsCompanion.insert(
    name: product.productName ?? "",
    servingSize: Value(servingSize),
    servingUnit: const Value('grams'),
    calories: Value((kj ?? 0) / 4.184),
    smallImage: Value(product.imageFrontSmallUrl),
    bigImage: Value(product.imageFrontUrl),
    proteinG:
        _getNutrimentValue(product.nutriments, Nutrient.proteins, perSize),
    fatG: _getNutrimentValue(product.nutriments, Nutrient.fat, perSize),
    carbohydrateG:
        _getNutrimentValue(product.nutriments, Nutrient.carbohydrates, perSize),
    sugarsG: _getNutrimentValue(product.nutriments, Nutrient.sugars, perSize),
    fiberG: _getNutrimentValue(product.nutriments, Nutrient.fiber, perSize),
    cholesterolMg:
        _getNutrimentValue(product.nutriments, Nutrient.cholesterol, perSize),
    saturatedFatsG:
        _getNutrimentValue(product.nutriments, Nutrient.saturatedFat, perSize),
    calciumMg:
        _getNutrimentValue(product.nutriments, Nutrient.calcium, perSize),
    ironFeMg: _getNutrimentValue(product.nutriments, Nutrient.iron, perSize),
    potassiumKMg:
        _getNutrimentValue(product.nutriments, Nutrient.potassium, perSize),
    magnesiumMg:
        _getNutrimentValue(product.nutriments, Nutrient.magnesium, perSize),
    vitaminAIuIu:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminA, perSize),
    vitaminCMg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminC, perSize),
    vitaminB12Mcg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB12, perSize),
    vitaminDMcg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminD, perSize),
    vitaminEAlphaTocopherolMg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminE, perSize),
    addedSugarG:
        _getNutrimentValue(product.nutriments, Nutrient.addedSugars, perSize),
    omega3sMg: _getNutrimentValue(product.nutriments, Nutrient.omega3, perSize),
    omega6sMg: _getNutrimentValue(product.nutriments, Nutrient.omega6, perSize),
    transFattyAcidsG:
        _getNutrimentValue(product.nutriments, Nutrient.transFat, perSize),
    solubleFiberG:
        _getNutrimentValue(product.nutriments, Nutrient.fiber, perSize),
    phosphorusPMg:
        _getNutrimentValue(product.nutriments, Nutrient.phosphorus, perSize),
    sodiumMg: _getNutrimentValue(product.nutriments, Nutrient.sodium, perSize),
    zincZnMg: _getNutrimentValue(product.nutriments, Nutrient.zinc, perSize),
    copperCuMg:
        _getNutrimentValue(product.nutriments, Nutrient.copper, perSize),
    manganeseMg:
        _getNutrimentValue(product.nutriments, Nutrient.manganese, perSize),
    seleniumSeMcg:
        _getNutrimentValue(product.nutriments, Nutrient.selenium, perSize),
    fluorideFMcg:
        _getNutrimentValue(product.nutriments, Nutrient.fluoride, perSize),
    thiaminB1Mg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB1, perSize),
    riboflavinB2Mg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB2, perSize),
    pantothenicAcidB5Mg: _getNutrimentValue(
      product.nutriments,
      Nutrient.pantothenicAcid,
      perSize,
    ),
    vitaminB6Mg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB6, perSize),
    biotinB7Mcg:
        _getNutrimentValue(product.nutriments, Nutrient.biotin, perSize),
    folateB9Mcg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminB9, perSize),
    caroteneBetaMcg:
        _getNutrimentValue(product.nutriments, Nutrient.betaCarotene, perSize),
    vitaminDIuIu:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminD, perSize),
    vitaminKMcg:
        _getNutrimentValue(product.nutriments, Nutrient.vitaminK, perSize),
    fattyAcidsTotalMonounsaturatedMg: _getNutrimentValue(
      product.nutriments,
      Nutrient.monounsaturatedFat,
      perSize,
    ),
    fattyAcidsTotalPolyunsaturatedMg: _getNutrimentValue(
      product.nutriments,
      Nutrient.polyunsaturatedFat,
      perSize,
    ),
    alcoholG: _getNutrimentValue(product.nutriments, Nutrient.alcohol, perSize),
    caffeineMg:
        _getNutrimentValue(product.nutriments, Nutrient.caffeine, perSize),
  );
}
