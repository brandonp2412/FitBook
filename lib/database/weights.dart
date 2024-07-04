import 'package:drift/drift.dart';

// coverage:ignore-file

class Weights extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get created => dateTime()();
  TextColumn get unit => text()();
  RealColumn get amount => real()();
}
