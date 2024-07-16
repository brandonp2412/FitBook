import 'package:drift/drift.dart';

// coverage:ignore-file

class Settings extends Table {
  BoolColumn get curveLines => boolean()();
  IntColumn get dailyCalories => integer().nullable()();
  IntColumn get dailyCarb => integer().nullable()();
  IntColumn get dailyFat => integer().nullable()();
  IntColumn get dailyProtein => integer().nullable()();
  TextColumn get diarySummary => text()();
  TextColumn get entryUnit => text()();
  BoolColumn get favoriteNew => boolean()();
  TextColumn get foodUnit => text()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get longDateFormat => text()();
  BoolColumn get notifications => boolean()();
  BoolColumn get selectEntryOnSubmit => boolean()();
  TextColumn get shortDateFormat => text()();
  BoolColumn get showImages => boolean().withDefault(const Constant(true))();
  BoolColumn get showOthers => boolean()();
  BoolColumn get systemColors => boolean()();
  RealColumn get targetWeight => real().nullable()();
  TextColumn get themeMode => text()();
  TextColumn get offLogin => text().nullable()();
  TextColumn get offPassword => text().nullable()();
}
