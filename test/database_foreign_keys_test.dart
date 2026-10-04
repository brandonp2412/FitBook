import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_tests.dart';

void main() {
  test('normal database opens enforce foreign keys', () async {
    await mockTests();
    addTearDown(db.close);

    final result = await db.customSelect('PRAGMA foreign_keys').getSingle();
    expect(result.read<int>('foreign_keys'), 1);

    await expectLater(
      db.diaries.insertOne(
        DiariesCompanion.insert(
          food: const Value(-1),
          created: DateTime(2026, 10, 5),
          quantity: 1,
          unit: 'grams',
        ),
      ),
      throwsA(anything),
    );
  });
}
