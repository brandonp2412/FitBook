import 'package:drift/drift.dart';

class Meals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get created => dateTime()();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();
  TextColumn get imageFile => text().nullable()();
}
