import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';

final defaultFields = [
  db.foods.calories.name,
  db.foods.proteinG.name,
  db.foods.carbohydrateG.name,
  db.foods.fatG.name,
  db.foods.fiberG.name,
];

// coverage:ignore-file

class Settings extends Table {
  BoolColumn get curveLines => boolean().withDefault(const Constant(true))();
  BoolColumn get autoCalc => boolean().withDefault(const Constant(false))();
  IntColumn get dailyCalories => integer().nullable()();
  IntColumn get dailyCarb => integer().nullable()();
  IntColumn get dailyFat => integer().nullable()();
  IntColumn get dailyProtein => integer().nullable()();
  TextColumn get diarySummary => text()();
  TextColumn get entryUnit => text()();
  BoolColumn get favoriteNew => boolean()();
  TextColumn get foodUnit => text()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lastGraph =>
      text().withDefault(const Constant('AppMetric.calories'))();
  TextColumn get longDateFormat => text()();
  TextColumn get offLogin => text().nullable()();
  TextColumn get offPassword => text().nullable()();
  BoolColumn get positiveReinforcement =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get reminders => boolean().withDefault(const Constant(false))();
  BoolColumn get selectEntryOnSubmit => boolean()();
  TextColumn get shortDateFormat => text()();
  TextColumn get fields => text().nullable().withDefault(
        Constant('calories,protein_g,carbohydrate_g,fat_g,fiber_g'),
      )();
  BoolColumn get showImages => boolean().withDefault(const Constant(true))();
  BoolColumn get showOthers => boolean()();
  BoolColumn get systemColors => boolean()();
  BoolColumn get automaticBackups =>
      boolean().withDefault(const Constant(false))();
  TextColumn get tabs => text().withDefault(
        const Constant("DiaryPage,GraphPage,FoodPage,WeightPage"),
      )();
  RealColumn get targetWeight => real().nullable()();
  IntColumn get limit => integer().withDefault(const Constant(30))();
  TextColumn get themeMode => text()();
  TextColumn get backupPath => text().nullable()();
  TextColumn get convertWeight => text().nullable()();
}
