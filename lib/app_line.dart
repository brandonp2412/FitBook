import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GraphData {
  final DateTime created;
  final double value;
  final String unit;

  GraphData({required this.created, required this.value, required this.unit});
}

class AppLine extends StatefulWidget {
  final AppMetric metric;
  final Period groupBy;
  final DateTime? startDate;
  final DateTime? endDate;

  const AppLine({
    super.key,
    required this.metric,
    required this.groupBy,
    this.startDate,
    this.endDate,
  });

  @override
  createState() => _AppLineState();
}

class _AppLineState extends State<AppLine> {
  late Stream<List<GraphData>> _graphStream;
  late SettingsState _settings;
  final formatter = NumberFormat('#,##0');

  @override
  void didUpdateWidget(covariant AppLine oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setStream();
  }

  @override
  void initState() {
    super.initState();
    _setStream();
    _settings = context.read<SettingsState>();
  }

  void _setStream() {
    Expression<String> createdCol = const CustomExpression<String>(
      "STRFTIME('%Y-%m-%d', DATE(created, 'unixepoch', 'localtime'))",
    );
    if (widget.groupBy == Period.month)
      createdCol = const CustomExpression<String>(
        "STRFTIME('%Y-%m', DATE(created, 'unixepoch', 'localtime'))",
      );
    else if (widget.groupBy == Period.week)
      createdCol = const CustomExpression<String>(
        "STRFTIME('%Y-%m-%W', DATE(created, 'unixepoch', 'localtime'))",
      );
    else if (widget.groupBy == Period.year)
      createdCol = const CustomExpression<String>(
        "STRFTIME('%Y', DATE(created, 'unixepoch', 'localtime'))",
      );

    var cals = db.entries.kCalories.sum();
    var fat = db.entries.fatG.sum();
    var protein = db.entries.proteinG.sum();
    var carb = db.entries.carbG.sum();

    if (widget.groupBy != Period.day) {
      cals = db.entries.kCalories.sum() /
          db.entries.created.date.count(distinct: true).cast<double>();
      fat = db.entries.fatG.sum() /
          db.entries.created.date.count(distinct: true).cast<double>();
      protein = db.entries.proteinG.sum() /
          db.entries.created.date.count(distinct: true).cast<double>();
      carb = db.entries.carbG.sum() /
          db.entries.created.date.count(distinct: true).cast<double>();
    }

    if (widget.metric == AppMetric.bodyWeight)
      _graphStream = (db.weights.selectOnly()
            ..orderBy([
              OrderingTerm(
                expression: db.weights.created,
                mode: OrderingMode.desc,
              ),
            ])
            ..addColumns([
              db.weights.created,
              db.weights.amount,
              db.weights.unit,
            ])
            ..groupBy([createdCol]))
          .watch()
          .map(
            (results) => results
                .map(
                  (result) => GraphData(
                    created: result.read(db.weights.created)!,
                    value: result.read(db.weights.amount)!,
                    unit: result.read(db.weights.unit)!,
                  ),
                )
                .toList(),
          );
    else
      _graphStream = (db.entries.selectOnly()
            ..addColumns([
              db.entries.created,
              cals,
              fat,
              protein,
              carb,
            ])
            ..orderBy([
              OrderingTerm(
                expression: db.entries.created,
                mode: OrderingMode.desc,
              ),
            ])
            ..groupBy([createdCol])
            ..limit(11))
          .watch()
          .map((results) {
        return results.map((result) {
          final created = result.read(db.entries.created)!.toLocal();
          final totalCals = result.read(cals);
          final totalFat = result.read(fat);
          final totalProtein = result.read(protein);
          final totalCarb = result.read(carb);

          double value = 0.0;
          String unit = 'g';

          switch (widget.metric) {
            case AppMetric.calories:
              value = totalCals ?? 0;
              unit = 'kcal';
              break;
            case AppMetric.protein:
              value = totalProtein ?? 0;
              break;
            case AppMetric.fat:
              value = totalFat ?? 0;
              break;
            case AppMetric.carbs:
              value = totalCarb ?? 0;
              break;
            case AppMetric.bodyWeight:
              throw Exception("Body weight isn't recorded here.");
          }

          return GraphData(created: created, value: value, unit: unit);
        }).toList();
      });
  }

  double getValue(TypedResult row, AppMetric metric) {
    if (metric == AppMetric.bodyWeight) {
      return row.read(db.entries.quantity)!;
    } else if (metric == AppMetric.calories) {
      return row.read(db.entries.quantity)!;
    } else if (metric == AppMetric.protein) {
      return row.read(db.entries.quantity)!;
    } else {
      throw Exception("Metric not supported.");
    }
  }

  @override
  Widget build(BuildContext context) {
    _settings = context.watch<SettingsState>();

    double goal = 0;

    switch (widget.metric) {
      case AppMetric.calories:
        goal = (_settings.dailyCalories ?? 0).toDouble();
        break;
      case AppMetric.protein:
        goal = (_settings.dailyProtein ?? 0).toDouble();
        break;
      case AppMetric.bodyWeight:
        goal = _settings.targetWeight ?? 0;
        break;
      case AppMetric.fat:
        goal = (_settings.dailyFat ?? 0).toDouble();
        break;
      case AppMetric.carbs:
        goal = (_settings.dailyCarbs ?? 0).toDouble();
        break;
    }

    return StreamBuilder(
      stream: _graphStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();
        if (snapshot.data?.isEmpty == true)
          return const ListTile(
            title: Text("No data yet"),
            subtitle: Text("Complete some plans to view graphs here"),
            contentPadding: EdgeInsets.zero,
          );
        if (snapshot.hasError) return ErrorWidget(snapshot.error.toString());

        final rows = snapshot.data!.reversed.toList();
        List<FlSpot> spots = [];
        var average = 0.0;
        for (var index = 0; index < rows.length; index++) {
          spots.add(FlSpot(index.toDouble(), rows[index].value));
          average += rows[index].value;
        }
        average /= spots.length;

        return material.Column(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.only(right: 32.0, top: 16.0),
                child: LineChart(
                  LineChartData(
                    extraLinesData: ExtraLinesData(
                      horizontalLines: [
                        if (goal > 0)
                          HorizontalLine(
                            y: goal.toDouble(),
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        if (average > 0)
                          HorizontalLine(
                            y: average,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                      ],
                    ),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 45,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 27,
                          interval: 1,
                          getTitlesWidget: (value, meta) =>
                              _bottomTitleWidgets(value, meta, rows),
                        ),
                      ),
                    ),
                    lineTouchData: LineTouchData(
                      touchTooltipData:
                          _tooltipData(context, rows, rows.first.unit),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: _settings.curveLines,
                        color: Theme.of(context).colorScheme.primary,
                        barWidth: 3,
                        isStrokeCapRound: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (goal > 0) ...[
                  const Text("Goal"),
                  Tooltip(
                    message: '${formatter.format(goal)} ${rows.first.unit}',
                    child: Radio(
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {},
                      fillColor: WidgetStateProperty.resolveWith(
                        (states) => Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
                Tooltip(
                  message: '${formatter.format(average)} ${rows.first.unit}',
                  child: Radio(
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                    fillColor: WidgetStateProperty.resolveWith(
                      (states) => Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
                const Text("Average"),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _bottomTitleWidgets(
    double value,
    TitleMeta meta,
    List<GraphData> rows,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    double labelWidth = 100;
    int labelCount = (screenWidth / labelWidth).floor();

    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;

    List<int> indices = List.generate(labelCount, (index) {
      return ((rows.length - 1) * index / (labelCount - 1)).round();
    });

    if (indices.contains(value.toInt())) {
      DateTime createdDate = rows[value.toInt()].created;
      text = Text(
        DateFormat(_settings.shortDateFormat).format(createdDate),
        style: style,
      );
    } else {
      text = const Text('', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineTouchTooltipData _tooltipData(
    BuildContext context,
    List<GraphData> rows,
    String unit,
  ) {
    return LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Theme.of(context).colorScheme.surface,
      getTooltipItems: (touchedSpots) {
        final row = rows.elementAt(touchedSpots.first.spotIndex);
        final created =
            DateFormat(_settings.shortDateFormat).format(row.created);
        final value = formatter.format(row.value);

        String text = "$value $unit\n";

        return [
          LineTooltipItem(
            text,
            TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
            children: [TextSpan(text: created)],
          ),
        ];
      },
    );
  }
}
