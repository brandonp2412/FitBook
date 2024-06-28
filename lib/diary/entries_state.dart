import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/database/entries.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';

class EntriesState extends ChangeNotifier {
  late Stream<List<EntryWithFood>> _stream;

  int _limit = 100;
  String _search = '';
  String? _foodGroup;
  DateTime? _startDate;
  DateTime? _endDate;

  EntriesState() {
    setStream();
  }

  Stream<List<EntryWithFood>> get stream => _stream;
  String? get foodGroup => _foodGroup;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  String get search => _search;
  int get limit => _limit;

  int get filterCount =>
      (_search.isNotEmpty ? 1 : 0) +
      (_foodGroup != null ? 1 : 0) +
      (_endDate != null ? 1 : 0) +
      (_startDate != null ? 1 : 0);

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
    var query = (db.entries
        .selectOnly()
        .join([innerJoin(db.foods, db.entries.food.equalsExp(db.foods.id))])
      ..addColumns([...db.entries.$columns, db.foods.name])
      ..where(db.foods.name.contains(search.toLowerCase()))
      ..orderBy([
        OrderingTerm(
          expression: db.entries.created,
          mode: OrderingMode.desc,
        ),
      ])
      ..limit(_limit));

    if (_foodGroup != null)
      query = query..where(db.foods.foodGroup.equals(_foodGroup!));
    if (_startDate != null)
      query = query..where(db.entries.created.isBiggerThanValue(_startDate!));
    if (_endDate != null)
      query = query..where(db.entries.created.isSmallerThanValue(_endDate!));

    _stream = query.watch().map(
          (results) => results.map((result) {
            return (
              entry: Entry(
                id: result.read(db.entries.id)!,
                food: result.read(db.entries.food)!,
                created: result.read(db.entries.created)!.toLocal(),
                quantity: result.read(db.entries.quantity)!,
                unit: result.read(db.entries.unit)!,
                kCalories: result.read(db.entries.kCalories),
                proteinG: result.read(db.entries.proteinG),
                fatG: result.read(db.entries.fatG),
                carbG: result.read(db.entries.carbG),
              ),
              foodName: result.read(db.foods.name)!,
            );
          }).toList(),
        );

    notifyListeners();
  }
}
