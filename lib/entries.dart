import 'package:drift/drift.dart';
import 'package:fit_book/app_line.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/foods.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/utils.dart';
import 'package:rxdart/rxdart.dart';

class Entries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get food => integer().references(Foods, #id)();
  DateTimeColumn get created => dateTime()();
  RealColumn get quantity => real()();
  TextColumn get unit => text()();
}

typedef EntryWithFood = ({
  Entry entry,
  Food food,
});

Stream<List<EntryWithFood>> watchAllEntries() {
  // start by watching all entries
  final entryStream = (db.select(db.entries)
        ..orderBy([
          (u) => OrderingTerm(
                expression: u.created,
                mode: OrderingMode.desc,
              ),
        ]))
      .watch();

  return entryStream.switchMap((entryList) {
    // this method is called whenever the list of entries changes. For each
    // entry, now we want to load the associated food.
    // (we create a map from id to entry here just for performance reasons)
    final idToEntry = {for (var entry in entryList) entry.id: entry};
    final ids = idToEntry.keys;

    // select all foods that are associated with any entry that we found
    final foodQuery = db.select(db.foods).join(
      [
        innerJoin(
          db.entries,
          db.entries.food.equalsExp(db.foods.id),
        ),
      ],
    )..where(db.entries.id.isIn(ids));

    return foodQuery.watch().map((rows) {
      // Store the list of foods for each entry, again using maps for faster
      // lookups.
      final idToFoods = <int, List<Food>>{};

      // for each food (row) that is associated with an entry, put it in the map
      // of foods.
      for (final row in rows) {
        final food = row.readTable(db.foods);
        final id = row.readTable(db.entries).id;

        idToFoods.putIfAbsent(id, () => []).add(food);
      }

      // finally, all that's left is to merge the map of entries with the map of
      // foods
      return [
        for (var id in ids) (entry: idToEntry[id]!, food: idToFoods[id]!.first),
      ];
    });
  });
}

Stream<List<GraphData>> watchCalories(
  Iterable<Expression> group,
  GraphMetric metric,
) {
  final entryQuery = (db.select(db.entries)).join([
    innerJoin(
      db.foods,
      db.entries.food.equalsExp(db.foods.id),
    ),
  ])
    ..addColumns([db.foods.calories.sum(), db.entries.quantity.sum()])
    ..groupBy(group)
    ..orderBy([
      OrderingTerm(
        expression: db.entries.created,
        mode: OrderingMode.desc,
      ),
    ])
    ..limit(10);

  return entryQuery.watch().map((rows) {
    List<GraphData> result = [];

    for (var row in rows) {
      final food = row.readTable(db.foods);
      final entry = row.readTable(db.entries);
      var value = 0.0;

      value = convertToKcal(entry.quantity, entry.unit, food.calories!);

      result.add(
        GraphData(
          created: entry.created,
          value: value,
        ),
      );
    }

    return result;
  });
}
