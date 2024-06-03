import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fit_book/database/schema_versions.dart';
import 'package:fit_book/entries.dart';
import 'package:fit_book/foods.dart';
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
  final bool testing;

  AppDatabase({QueryExecutor? executor, this.testing = false})
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 11;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        if (!testing) {
          await m.addColumn(foods, foods.favorite);
          await m.addColumn(foods, foods.servingUnit);
        }
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('dailyCalories', 2200);
        prefs.setInt('dailyProtein', 100);
      },
      onUpgrade: stepByStep(
        from1To3: (m, schema) async {
          await m.create(schema.entries);
          await m.alterTable(TableMigration(schema.foods));
        },
        from3To4: (m, schema) async {
          await m.alterTable(TableMigration(schema.entries));
        },
        from4To5: (m, schema) async {},
        from5To6: (m, schema) async {
          await m.createIndex(
            Index(
              'Foods',
              "CREATE INDEX IF NOT EXISTS foods_name ON foods(name);",
            ),
          );
        },
        from6To7: (m, schema) async {
          await m.createTable(schema.weights);
          await m.createIndex(
            Index(
              'Foods',
              "CREATE INDEX IF NOT EXISTS foods_name ON foods(name);",
            ),
          );
        },
        from7To8: (m, schema) async {
          await m.addColumn(schema.foods, schema.foods.favorite);
        },
        from8To9: (m, schema) async {
          await m.createIndex(
            Index('Foods', 'CREATE INDEX IF NOT EXISTS foods_id ON foods(id)'),
          );
          await m.createIndex(
            Index(
              'Entries',
              'CREATE INDEX IF NOT EXISTS entries_id ON entries(id)',
            ),
          );
        },
        from9To10: (m, schema) async {
          await m.addColumn(schema.foods, schema.foods.servingUnit);
        },
        from10To11: (m, schema) async {},
      ),
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called sqlite here, into the documents folder
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
