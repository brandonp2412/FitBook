import 'package:drift/drift.dart';

class Settings extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get themeMode => text()();
  TextColumn get longDateFormat => text()();
  TextColumn get shortDateFormat => text()();
  TextColumn get entryUnit => text()();
  TextColumn get foodUnit => text()();
  TextColumn get diarySummary => text()();

  RealColumn get targetWeight => real().nullable()();

  BoolColumn get systemColors => boolean()();
  BoolColumn get curveLines => boolean()();
  BoolColumn get showOthers => boolean()();
  BoolColumn get favoriteNew => boolean()();
  BoolColumn get selectEntryOnSubmit => boolean()();
  BoolColumn get notifications => boolean()();

  IntColumn get dailyCalories => integer().nullable()();
  IntColumn get dailyProtein => integer().nullable()();
  IntColumn get dailyFat => integer().nullable()();
  IntColumn get dailyCarb => integer().nullable()();
}
