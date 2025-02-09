// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:fit_book/database/database.dart';
import 'package:test/test.dart';

import 'generated/schema.dart';
import 'generated/schema_v25.dart' as v25;
import 'generated/schema_v26.dart' as v26;
import 'generated/schema_v4.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    final versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(executor: schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // The following template shows how to write tests ensuring your migrations
  // preserve existing data.
  // Testing this can be useful for migrations that change existing columns
  // (e.g. by alterating their type or constraints). Migrations that only add
  // tables or columns typically don't need these advanced tests. For more
  // information, see https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  // TODO: This generated template shows how these tests could be written. Adopt
  // it to your own needs when testing migrations with data integrity.
  test("migration from v25 to v26 does not corrupt data", () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    // TODO: Fill these lists
    final oldFoodsData = <v25.FoodsData>[];
    final expectedNewFoodsData = <v26.FoodsData>[];

    final oldEntriesData = <v25.EntriesData>[];
    final expectedNewEntriesData = <v26.EntriesData>[];

    final oldWeightsData = <v25.WeightsData>[];
    final expectedNewWeightsData = <v26.WeightsData>[];

    final oldSettingsData = <v25.SettingsData>[];
    final expectedNewSettingsData = <v26.SettingsData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 25,
      newVersion: 26,
      createOld: v25.DatabaseAtV25.new,
      createNew: v26.DatabaseAtV26.new,
      openTestedDatabase: (QueryExecutor executor) =>
          AppDatabase(executor: executor),
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.foods, oldFoodsData);
        batch.insertAll(oldDb.entries, oldEntriesData);
        batch.insertAll(oldDb.weights, oldWeightsData);
        batch.insertAll(oldDb.settings, oldSettingsData);
      },
      validateItems: (newDb) async {
        expect(expectedNewFoodsData, await newDb.select(newDb.foods).get());
        expect(expectedNewEntriesData, await newDb.select(newDb.entries).get());
        expect(expectedNewWeightsData, await newDb.select(newDb.weights).get());
        expect(
          expectedNewSettingsData,
          await newDb.select(newDb.settings).get(),
        );
      },
    );
  });
}
