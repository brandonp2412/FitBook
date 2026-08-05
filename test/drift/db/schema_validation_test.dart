import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  TestWidgetsFlutterBinding.ensureInitialized();

  test('freshly created database matches the declared schema', () async {
    db = AppDatabase(executor: NativeDatabase.memory());
    addTearDown(db.close);

    await db.customSelect('SELECT 1').get();
    await db.validateDatabaseSchema();
  });
}
