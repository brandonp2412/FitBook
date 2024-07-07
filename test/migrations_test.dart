import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The generated directory from before.
import 'generated_migrations/schema.dart';

void main() {
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('upgrade from all versions', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    final currentVersion =
        AppDatabase(executor: NativeDatabase.memory()).schemaVersion;

    for (int from = 1; from <= currentVersion; from++) {
      if (from == 2) continue;

      for (int to = from + 1; to <= currentVersion; to++) {
        if (to == 2) continue;
        final connection = await verifier.startAt(from);
        db = AppDatabase(executor: connection);
        await verifier.migrateAndValidate(db, to);
        await db.close();
      }
    }

    final connection = await verifier.startAt(currentVersion);
    db = AppDatabase(executor: connection);
    await verifier.migrateAndValidate(db, currentVersion);
  });
}
