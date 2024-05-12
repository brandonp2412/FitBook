import 'package:drift/drift.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/foods.dart';
import 'package:fit_book/main.dart';
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

Stream<EntryWithFood> watchEntry(int id) {
  // load information about the entry
  final entryQuery = db.select(db.entries)
    ..where((entry) => entry.id.equals(id));

  // and also load information about the food for this entry
  final foodQuery = db.select(db.foods).join(
    [
      innerJoin(
        db.entries,
        db.entries.food.equalsExp(db.foods.id),
      ),
    ],
  )..where(db.entries.id.equals(id));

  final entryStream = entryQuery.watchSingle();

  final foodStream = foodQuery.watch().map((rows) {
    // we join the entries with the foods, but we
    // only care about the food here.
    return rows.map((row) => row.readTable(db.foods)).toList();
  });

  // now, we can merge the two queries together in one stream
  return Rx.combineLatest2(entryStream, foodStream,
      (Entry entry, List<Food> foods) {
    return (entry: entry, food: foods.first);
  });
}
