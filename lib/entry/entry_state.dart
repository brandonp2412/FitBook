import 'package:drift/drift.dart';
import 'package:fit_book/database/settings.dart';
import 'package:fit_book/entry/entry_food.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';

class EntryState extends ChangeNotifier {
  late Stream<List<EntryFood>> _stream;

  int _limit = 100;
  List<String> fieldNames = defaultFields;
  String _search = '';
  String? _foodGroup;
  DateTime? _startDate;
  DateTime? _endDate;

  EntryState({List<String>? fields}) {
    if (fields != null) fieldNames = fields;
    setStream();
  }

  Stream<List<EntryFood>> get stream => _stream;
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
    final quantityInGrams = CustomExpression<double>('''
   CASE 
     WHEN entries.unit = 'serving' 
     THEN entries.quantity * (
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
     WHEN entries.unit IN ('grams', 'milliliters') THEN entries.quantity
     WHEN entries.unit = 'milligrams' THEN entries.quantity / 1000
     WHEN entries.unit = 'cups' THEN entries.quantity * 250
     WHEN entries.unit = 'tablespoons' THEN entries.quantity * 15
     WHEN entries.unit = 'teaspoons' THEN entries.quantity * 5
     WHEN entries.unit = 'ounces' THEN entries.quantity * 28.35
     WHEN entries.unit = 'pounds' THEN entries.quantity * 453.592
     WHEN entries.unit = 'liters' THEN entries.quantity * 1000
     WHEN entries.unit = 'kilojoules' THEN entries.quantity / 4.184
     ELSE entries.quantity
   END
 ''');
    final servingG = CustomExpression<double>('''
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
''');

    if (!fieldNames.contains(db.foods.calories.name))
      fieldNames.add(db.foods.calories.name);

    final expressions = fieldNames.map((field) {
      return quantityInGrams *
          coalesce([CustomExpression("foods.$field"), const Constant(0)]) /
          servingG;
    });

    var query = (db.entries
        .selectOnly()
        .join([innerJoin(db.foods, db.entries.food.equalsExp(db.foods.id))])
      ..addColumns([
        db.entries.id,
        db.entries.created,
        db.entries.unit,
        db.entries.quantity,
        db.entries.food,
        servingG,
        db.foods.name,
        db.foods.imageFile,
        db.foods.smallImage,
        db.foods.foodGroup,
        ...expressions,
      ])
      ..where(db.foods.name.contains(search.toLowerCase()))
      ..orderBy([
        OrderingTerm(
          expression: db.entries.created,
          mode: OrderingMode.desc,
        ),
      ])
      ..limit(_limit));

    if (_foodGroup != null)
      query = query..where(db.foods.foodGroup.like(_foodGroup!));
    if (_startDate != null)
      query = query..where(db.entries.created.isBiggerThanValue(_startDate!));
    if (_endDate != null)
      query = query..where(db.entries.created.isSmallerThanValue(_endDate!));

    _stream = query.watch().map(
          (results) => results.map(
            (row) {
              Map<String, double> metrics = {};
              for (var i = 0; i < fieldNames.length; i++) {
                metrics[fieldNames[i]] = row.read(expressions.elementAt(i))!;
              }

              return EntryFood(
                entryId: row.read(db.entries.id)!,
                foodId: row.read(db.entries.food)!,
                created: row.read(db.entries.created)!.toLocal(),
                unit: row.read(db.entries.unit)!,
                quantity: row.read(db.entries.quantity)!,
                name: row.read(db.foods.name)!,
                imageFile: row.read(db.foods.imageFile),
                smallImage: row.read(db.foods.smallImage),
                metrics: metrics,
              );
            },
          ).toList(),
        );

    notifyListeners();
  }
}
