import 'package:drift/drift.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/foods.dart';
import 'package:fit_book/main.dart';

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
}

typedef EntryWithFood = ({
  Entry entry,
  String foodName,
});

Stream<List<EntryWithFood>> watchEntries(String search, int limit) {
  return (db.entries
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
        ..limit(limit))
      .watch()
      .map(
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
}
