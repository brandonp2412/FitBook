import 'package:drift/drift.dart';
import 'package:fit_book/database/foods.dart';

// coverage:ignore-file

class Entries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get food => integer().references(Foods, #id)();
  DateTimeColumn get created => dateTime()();
  RealColumn get quantity => real()();
  TextColumn get unit => text()();
  RealColumn get kCalories => real().nullable()();
  RealColumn get proteinG => real().nullable()();
  RealColumn get fatG => real().nullable()();
  RealColumn get carbG => real().nullable()();
  RealColumn get sodiumG => real().nullable()();
  RealColumn get fiberG => real().nullable()();
}
