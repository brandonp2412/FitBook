import 'package:drift/drift.dart';

@TableIndex(
  name: 'weights_created_idx',
  columns: {IndexedColumn(#created, orderBy: OrderingMode.desc)},
)
class Weights extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get created => dateTime()();
  TextColumn get unit => text()();
  RealColumn get amount => real()();
  TextColumn get image => text().nullable()();
}
