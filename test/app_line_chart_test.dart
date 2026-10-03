import 'package:drafter/painting.dart';
import 'package:fit_book/app_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('chart bounds preserve zero baseline and visible reference line', () {
    final bounds = AppLineChart.calculateBounds(
      points: const [
        AppLineChartPoint(0, 70),
        AppLineChartPoint(1, 80),
      ],
      startAtZero: true,
      referenceValue: 90,
    );

    expect(bounds.$1, 0);
    expect(bounds.$2, 90);
  });

  test('chart bounds include a goal below visible data when not zero-based',
      () {
    final bounds = AppLineChart.calculateBounds(
      points: const [
        AppLineChartPoint(0, 70),
        AppLineChartPoint(1, 80),
      ],
      startAtZero: false,
      referenceValue: 65,
    );

    expect(bounds.$1, 65);
    expect(bounds.$2, 80);
  });

  testWidgets('line chart renders through Drafter with responsive labels', (
    WidgetTester tester,
  ) async {
    final labels = List.generate(20, (index) => 'D$index');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 1000,
            height: 300,
            child: AppLineChart(
              series: const [
                AppLineChartSeries(
                  points: [
                    AppLineChartPoint(0, 70),
                    AppLineChartPoint(1, 72),
                    AppLineChartPoint(2, 71),
                  ],
                  color: Colors.blue,
                  strokeWidth: 3,
                  curved: true,
                  fill: true,
                ),
              ],
              fallbackPoints: const [
                AppLineChartPoint(0, 70),
                AppLineChartPoint(1, 72),
                AppLineChartPoint(2, 71),
              ],
              bottomLabels: labels,
              referenceValue: 75,
              referenceColor: Colors.black,
              startAtZero: false,
              axisLabelFormatter: (value) => value.toStringAsFixed(0),
              tooltipText: (index, value) => '$value at $index',
              accessibilityLabel: 'Value chart',
              accessibilityValue: 'Latest 71 kg',
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(ChartCanvas), findsOneWidget);
    expect(find.byKey(const ValueKey('app-line-x-label-0')), findsOneWidget);
    expect(find.byKey(const ValueKey('app-line-x-label-19')), findsOneWidget);

    final visibleLabels = tester
        .widgetList<Text>(find.byType(Text))
        .where((widget) => widget.data?.startsWith('D') ?? false)
        .length;
    expect(visibleLabels, inInclusiveRange(7, 12));

    final semantics = tester.getSemantics(find.byType(ChartCanvas));
    expect(semantics.label, 'Value chart');
    expect(semantics.value, 'Latest 71 kg');

    expect(tester.takeException(), isNull);
  });
}
