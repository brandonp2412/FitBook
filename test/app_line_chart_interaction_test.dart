import 'package:fit_book/app_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('touch scrubs to the nearest visible Drafter point', (
    WidgetTester tester,
  ) async {
    final tooltipIndexes = <int>[];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 300,
            height: 200,
            child: AppLineChart(
              series: const [
                AppLineChartSeries(
                  points: [
                    AppLineChartPoint(0, 10),
                    AppLineChartPoint(1, 20),
                    AppLineChartPoint(2, 15),
                  ],
                  color: Colors.blue,
                  strokeWidth: 3,
                ),
              ],
              fallbackPoints: const [
                AppLineChartPoint(0, 10),
                AppLineChartPoint(1, 20),
                AppLineChartPoint(2, 15),
              ],
              bottomLabels: const ['A', 'B', 'C'],
              referenceColor: Colors.black,
              startAtZero: false,
              axisLabelFormatter: (value) => value.toStringAsFixed(0),
              tooltipText: (index, value) {
                tooltipIndexes.add(index);
                return 'Point $index';
              },
              accessibilityLabel: 'Value chart',
              accessibilityValue: '3 points',
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final chart = find.byType(AppLineChart);
    final topLeft = tester.getTopLeft(chart);
    final gesture = await tester.startGesture(topLeft + const Offset(150, 80));
    await tester.pump();

    expect(tooltipIndexes, contains(1));

    await gesture.up();
    await tester.pump();
  });
}
