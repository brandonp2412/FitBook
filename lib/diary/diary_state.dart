import 'package:drift/drift.dart';
import 'package:fit_book/database/settings.dart';
import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/utils.dart';
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
    if (!fieldNames.contains(db.foods.calories.name))
      fieldNames.add(db.foods.calories.name);

    final expressions = fieldNames
        .map((field) => CustomExpression<double>(mealAwareFieldExpr(field)))
        .toList();

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
