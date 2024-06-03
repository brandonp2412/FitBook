import 'package:drift_dev/api/migrations.dart';
import 'package:fit_book/database.dart';
import 'package:flutter_test/flutter_test.dart';

// The generated directory from before.
import 'generated_migrations/schema.dart';

void main() {
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('upgrade from v1 to v3', () async {
    final connection = await verifier.startAt(1);
    final db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, 3);
    await db.close();
  });

  test('upgrade from v3 to v4', () async {
    final connection = await verifier.startAt(3);
    final db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, 4);
    await db.close();
  });

  test('upgrade from v4 to v5', () async {
    final connection = await verifier.startAt(4);
    final db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, 5);
    await db.close();
  });

  test('upgrade from v5 to v6', () async {
    final connection = await verifier.startAt(5);
    final db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, 6);
    await db.close();
  });

  test('upgrade from v6 to v7', () async {
    final connection = await verifier.startAt(6);
    final db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, 7);
    await db.close();
  });

  test('upgrade from v7 to v8', () async {
    final connection = await verifier.startAt(7);
    final db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, 8);
    await db.close();
  });

  test('upgrade from v8 to v9', () async {
    final connection = await verifier.startAt(8);
    final db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, 9);
    await db.close();
  });

  test('upgrade from v9 to v10', () async {
    final connection = await verifier.startAt(9);
    final db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, 10);
    await db.close();
  });

  test('upgrade from v10 to v11', () async {
    final connection = await verifier.startAt(10);
    final db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, 11);
    await db.close();
  });
}
