import 'package:fit_book/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Performance Tests', () {
    testWidgets('scroll performance test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final listFinder = find.byType(ListView);

      // Measure scroll performance
      await binding.traceAction(
        () async {
          // Perform scroll
          await tester.fling(listFinder, Offset(0, -300), 1000);
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
