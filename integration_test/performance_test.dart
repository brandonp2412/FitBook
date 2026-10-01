import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    app.db = AppDatabase(executor: NativeDatabase.memory());

    final food = await (app.db.foods.select()..limit(1)).getSingle();
    final now = DateTime.now();
    await app.db.diaries.insertAll(
      List.generate(
        120,
        (index) => DiariesCompanion.insert(
          food: Value(food.id),
          created: now.subtract(Duration(minutes: index)),
          quantity: 1,
          unit: 'serving',
        ),
      ),
    );
  });

  tearDownAll(() async {
    await app.db.close();
  });

  group('Performance Tests', () {
    testWidgets('scroll performance test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final listFinder = find.descendant(
        of: find.byType(DiaryPage),
        matching: find.byType(ListView),
      );
      expect(listFinder, findsOneWidget);

      await binding.traceAction(
        () async {
          await tester.fling(
            listFinder,
            const Offset(0, -300),
            1000,
          );
          await tester.pumpAndSettle();
        },
        reportKey: 'scroll_performance',
      );
    });

    testWidgets('widget build performance', (tester) async {
      app.main();

      final stopwatch = Stopwatch()..start();
      await tester.pumpAndSettle();
      stopwatch.stop();

      print('App startup time: ${stopwatch.elapsedMilliseconds}ms');
      expect(stopwatch.elapsedMilliseconds, lessThan(1000));
    });
  });
}
