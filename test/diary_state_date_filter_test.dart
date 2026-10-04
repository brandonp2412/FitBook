import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_tests.dart';

void main() {
  test('DiaryState date range includes both selected boundary days', () async {
    await mockTests();
    addTearDown(db.close);

    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(name: 'Boundary food'),
    );

    Future<void> addEntry(DateTime created) => db.diaries.insertOne(
          DiariesCompanion.insert(
            food: Value(foodId),
            created: created,
            quantity: 1,
            unit: 'grams',
          ),
        );

    await addEntry(DateTime(2026, 10, 3));
    await addEntry(DateTime(2026, 10, 4, 12));
    await addEntry(DateTime(2026, 10, 5));

    final state = DiaryState()
      ..startDate = DateTime(2026, 10, 3)
      ..endDate = DateTime(2026, 10, 4);

    final entries = await state.stream.first;

    expect(
      entries.map((entry) => entry.created),
      orderedEquals([
        DateTime(2026, 10, 4, 12),
        DateTime(2026, 10, 3),
      ]),
    );
  });
}
