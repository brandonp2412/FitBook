import 'package:drift/drift.dart';

class Weights extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get created => dateTime()();
  TextColumn get unit => text()();
  RealColumn get amount => real()();
  TextColumn get image => text().nullable()();
}
