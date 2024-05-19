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
  Food food,
});

Stream<List<EntryWithFood>> watchEntries(String search, int limit) {
  return (db.entries
          .select()
          .join([innerJoin(db.foods, db.entries.food.equalsExp(db.foods.id))])
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
          final food = result.readTable(db.foods);
          final entry = result.readTable(db.entries);
          return (
            entry: entry.copyWith(created: entry.created.toLocal()),
            food: food
          );
        }).toList(),
      );
}
