import 'package:drift/drift.dart';
import 'package:fit_book/database/foods.dart';
import 'package:fit_book/database/meals.dart';

class Diaries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get food => integer().nullable().references(Foods, #id)();
  IntColumn get meal => integer().nullable().references(Meals, #id)();
  DateTimeColumn get created => dateTime()();
  RealColumn get quantity => real()();
  TextColumn get unit => text()();
}
