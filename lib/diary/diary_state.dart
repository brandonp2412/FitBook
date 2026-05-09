import 'package:drift/drift.dart';
import 'package:fit_book/database/settings.dart';
import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';

class DiaryState extends ChangeNotifier {
  late Stream<List<DiaryFood>> _stream;

  int _limit = 100;
  List<String> fieldNames = defaultFields;
  String _search = '';
  String? _foodGroup;
  DateTime? _startDate;
  DateTime? _endDate;

  DiaryState({List<String>? fields}) {
    if (fields != null) fieldNames = fields;
    setStream();
  }

  Stream<List<DiaryFood>> get stream => _stream;
  String? get foodGroup => _foodGroup;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  String get search => _search;
  int get limit => _limit;

  int get filterCount =>
      (foodGroup?.isNotEmpty == true ? 1 : 0) +
      (endDate != null ? 1 : 0) +
      (startDate != null ? 1 : 0);

  void clear() {
    _search = '';
    _foodGroup = null;
    _startDate = null;
    _endDate = null;
    setStream();
  }

  set search(String value) {
    _search = value;
    _limit = 100;
    setStream();
  }

  set limit(int value) {
    _limit = value;
    setStream();
  }

  set foodGroup(String? value) {
    _foodGroup = value;
    setStream();
  }

  set startDate(DateTime? value) {
    _startDate = value;
    setStream();
  }

  set endDate(DateTime? value) {
    _endDate = value;
    setStream();
  }

  void setStream() {
    // SQL fragments reused in both food and meal expressions.
    const foodQuantityInGramsSql = '''
      CASE
        WHEN diaries.unit = 'serving'
        THEN diaries.quantity * (
          CASE
            WHEN foods.serving_size IS NULL THEN 100
            WHEN foods.serving_unit IS NULL THEN foods.serving_size
            WHEN foods.serving_unit = 'ounces' THEN foods.serving_size * 28.35
            WHEN foods.serving_unit = 'grams' THEN foods.serving_size
            WHEN foods.serving_unit = 'milliliters' THEN foods.serving_size
            WHEN foods.serving_unit = 'cups' THEN foods.serving_size * 250
            WHEN foods.serving_unit = 'tablespoons' THEN foods.serving_size * 15
            WHEN foods.serving_unit = 'teaspoons' THEN foods.serving_size * 5
            WHEN foods.serving_unit = 'pounds' THEN foods.serving_size * 453.592
            WHEN foods.serving_unit = 'serving' THEN foods.serving_size
            ELSE 100
          END
        )
        WHEN diaries.unit IN ('grams', 'milliliters') THEN diaries.quantity
        WHEN diaries.unit = 'milligrams' THEN diaries.quantity / 1000
        WHEN diaries.unit = 'cups' THEN diaries.quantity * 250
        WHEN diaries.unit = 'tablespoons' THEN diaries.quantity * 15
        WHEN diaries.unit = 'teaspoons' THEN diaries.quantity * 5
        WHEN diaries.unit = 'ounces' THEN diaries.quantity * 28.35
        WHEN diaries.unit = 'pounds' THEN diaries.quantity * 453.592
        WHEN diaries.unit = 'liters' THEN diaries.quantity * 1000
        WHEN diaries.unit = 'kilojoules' THEN diaries.quantity / 4.184
        ELSE diaries.quantity
      END
    ''';

    const foodServingGSql = '''
      CASE
        WHEN foods.serving_size IS NULL THEN 100
        WHEN foods.serving_unit IS NULL THEN foods.serving_size
        WHEN foods.serving_unit = 'ounces' THEN foods.serving_size * 28.35
        WHEN foods.serving_unit = 'grams' THEN foods.serving_size
        WHEN foods.serving_unit = 'milliliters' THEN foods.serving_size
        WHEN foods.serving_unit = 'cups' THEN foods.serving_size * 250
        WHEN foods.serving_unit = 'tablespoons' THEN foods.serving_size * 15
        WHEN foods.serving_unit = 'teaspoons' THEN foods.serving_size * 5
        WHEN foods.serving_unit = 'pounds' THEN foods.serving_size * 453.592
        WHEN foods.serving_unit = 'serving' THEN foods.serving_size
        ELSE 100
      END
    ''';

    if (!fieldNames.contains(db.foods.calories.name))
      fieldNames.add(db.foods.calories.name);

    // For meal entries, sum the field across all meal_foods using the meal's
    // own quantity/unit, then multiply by the diary quantity (# of servings).
    final expressions = fieldNames.map((field) {
      return CustomExpression<double>('''
        CASE
          WHEN diaries.meal IS NOT NULL THEN
            diaries.quantity * COALESCE((
              SELECT SUM(
                CASE
                  WHEN mf.unit = 'serving'
                    THEN mf.quantity * COALESCE(mf_f.serving_size, 100.0)
                  WHEN mf.unit IN ('grams', 'milliliters') THEN mf.quantity
                  WHEN mf.unit = 'milligrams' THEN mf.quantity / 1000.0
                  WHEN mf.unit = 'ounces' THEN mf.quantity * 28.35
                  WHEN mf.unit = 'pounds' THEN mf.quantity * 453.592
                  WHEN mf.unit = 'cups' THEN mf.quantity * 250.0
                  WHEN mf.unit = 'tablespoons' THEN mf.quantity * 15.0
                  WHEN mf.unit = 'teaspoons' THEN mf.quantity * 5.0
                  WHEN mf.unit = 'liters' THEN mf.quantity * 1000.0
                  ELSE mf.quantity
                END
                * COALESCE(mf_f.$field, 0.0)
                / NULLIF(COALESCE(mf_f.serving_size, 100.0), 0.0)
              )
              FROM meal_foods AS mf
              JOIN foods AS mf_f ON mf_f.id = mf.food
              WHERE mf.meal = diaries.meal
            ), 0.0)
          ELSE
            ($foodQuantityInGramsSql)
            * COALESCE(foods.$field, 0.0)
            / NULLIF(($foodServingGSql), 0.0)
        END
      ''');
    }).toList();

    var query = (db.diaries.selectOnly().join([
      leftOuterJoin(db.foods, db.diaries.food.equalsExp(db.foods.id)),
      leftOuterJoin(db.meals, db.diaries.meal.equalsExp(db.meals.id)),
    ])
      ..addColumns([
        db.diaries.id,
        db.diaries.created,
        db.diaries.unit,
        db.diaries.quantity,
        db.diaries.food,
        db.diaries.meal,
        db.foods.name,
        db.meals.name,
        db.foods.imageFile,
        db.meals.imageFile,
        db.foods.smallImage,
        db.foods.foodGroup,
        ...expressions,
      ])
      ..where(
        search.isEmpty
            ? const Constant(true)
            : db.foods.name.contains(search.toLowerCase()) |
                db.meals.name.contains(search.toLowerCase()),
      )
      ..orderBy([
        OrderingTerm(
          expression: db.diaries.created,
          mode: OrderingMode.desc,
        ),
      ])
      ..limit(_limit));

    if (_foodGroup != null)
      query = query..where(db.foods.foodGroup.equals(_foodGroup!));
    if (_startDate != null)
      query = query..where(db.diaries.created.isBiggerThanValue(_startDate!));
    if (_endDate != null)
      query = query..where(db.diaries.created.isSmallerThanValue(_endDate!));

    _stream = query.watch().map(
          (results) => results.map(
            (row) {
              Map<String, double> metrics = {};
              for (var i = 0; i < fieldNames.length; i++) {
                metrics[fieldNames[i]] = row.read(expressions[i]) ?? 0.0;
              }

              return DiaryFood(
                entryId: row.read(db.diaries.id)!,
                foodId: row.read(db.diaries.food),
                mealId: row.read(db.diaries.meal),
                created: row.read(db.diaries.created)!.toLocal(),
                unit: row.read(db.diaries.unit)!,
                quantity: row.read(db.diaries.quantity)!,
                name: row.read(db.foods.name) ?? row.read(db.meals.name) ?? '',
                imageFile: row.read(db.foods.imageFile) ??
                    row.read(db.meals.imageFile),
                smallImage: row.read(db.foods.smallImage),
                metrics: metrics,
              );
            },
          ).toList(),
        );

    notifyListeners();
  }
}
