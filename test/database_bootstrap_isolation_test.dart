import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fit_book/database/database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('independent databases seed their own starter foods', () async {
    for (var attempt = 0; attempt < 2; attempt++) {
      final database = AppDatabase(executor: NativeDatabase.memory());
      try {
        final count = await database
            .customSelect('SELECT COUNT(*) AS total FROM foods')
            .getSingle();
        expect(count.read<int>('total'), 7083);
        expect((await database.settings.select().get()).length, 1);
      } finally {
        await database.close();
      }
    }
  });
}
