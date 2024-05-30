import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fit_book/entries.dart';
import 'package:fit_book/foods.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/weights.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Foods, Entries, Weights])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 10;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await m.addColumn(foods, foods.favorite);
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('dailyCalories', 2200);
        prefs.setInt('dailyProtein', 100);
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) await m.create(db.entries);
        if (from < 3) {
          await m.addColumn(db.entries, db.entries.quantity);
          await m.addColumn(db.entries, db.entries.unit);
        }
        if (from < 4) {
          await m.addColumn(db.entries, db.entries.kCalories);
          await m.addColumn(db.entries, db.entries.proteinG);
          await m.addColumn(db.entries, db.entries.fatG);
          await m.addColumn(db.entries, db.entries.carbG);
        }
        if (from < 5)
          await m.createIndex(
            Index(
              'Foods',
              "CREATE INDEX foods_name ON foods(name);",
            ),
          );
        if (from < 6)
          await db.foods.insertOne(
            FoodsCompanion.insert(name: "Calories", calories: const Value(100)),
          );
        if (from < 7) await m.createTable(db.weights);
        if (from < 8) await m.addColumn(foods, foods.favorite);
        if (from < 9) {
          await m.createIndex(
            Index('Foods', 'CREATE INDEX foods_id ON foods(id)'),
          );
          await m.createIndex(
            Index('Entries', 'CREATE INDEX entries_id ON entries(id)'),
          );
        }
        if (from < 10) await m.addColumn(foods, foods.servingUnit);
      },
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fitbook.sqlite'));

    if (!await file.exists()) {
      final blob = await rootBundle.load('assets/fitbook.sqlite');
      await file.writeAsBytes(
        blob.buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes),
      );
    }

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(
      file,
      logStatements: kDebugMode ? true : false,
    );
  });
}
