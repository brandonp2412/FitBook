import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
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
  final formatter = NumberFormat('#,##0.00');
  final limit = 11;

  late Stream<List<GraphData>> graphStream;
  late Setting settings = context.read<SettingsState>().value;

  @override
  void didUpdateWidget(covariant AppLine oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setStream();
  }

  @override
  void initState() {
    super.initState();
    _setStream();
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
      graphStream = (db.weights.selectOnly()
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
            ..groupBy([createdCol])
            ..where(
              db.weights.created.isBiggerOrEqualValue(
                widget.startDate ?? DateTime(0),
              ),
            )
            ..where(
              db.weights.created.isSmallerOrEqualValue(
                widget.endDate ?? DateTime.now().add(const Duration(days: 1)),
              ),
            )
            ..limit(limit))
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
      graphStream = (db.entries.selectOnly()
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
            ..where(
              db.entries.created.isBiggerOrEqualValue(
                widget.startDate ?? DateTime(0),
              ),
            )
            ..where(
              db.entries.created.isSmallerOrEqualValue(
                widget.endDate ?? DateTime.now().add(const Duration(days: 1)),
              ),
            )
            ..groupBy([createdCol])
            ..limit(limit))
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
    settings = context.watch<SettingsState>().value;

    double goal = 0;

    switch (widget.metric) {
      case AppMetric.calories:
        goal = (settings.dailyCalories ?? 0).toDouble();
        break;
      case AppMetric.protein:
        goal = (settings.dailyProtein ?? 0).toDouble();
        break;
      case AppMetric.bodyWeight:
        goal = settings.targetWeight ?? 0;
        break;
      case AppMetric.fat:
        goal = (settings.dailyFat ?? 0).toDouble();
        break;
      case AppMetric.carbs:
        goal = (settings.dailyCarb ?? 0).toDouble();
        break;
    }

    return StreamBuilder(
      stream: graphStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();
        if (snapshot.data?.isEmpty == true)
          return const ListTile(
            title: Text("No data yet"),
            subtitle: Text("Complete some plans to view graphs here"),
            contentPadding: EdgeInsets.zero,
          );
        if (snapshot.hasError) return ErrorWidget(snapshot.error.toString());

        List<Color> gradientColors = [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.surface,
        ];

        final rows = snapshot.data!.reversed.toList();
        List<FlSpot> spots = [];
        var average = 0.0;
        for (final row in rows) {
          final days = row.created.difference(rows.first.created).inDays;
          spots.add(FlSpot(days.toDouble(), row.value));
          average += row.value;
        }
        average /= spots.length;

        return material.SingleChildScrollView(
          child: material.Column(
            children: [
              material.Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 32.0, top: 16.0),
                      child: LineChart(
                        LineChartData(
                          extraLinesData: ExtraLinesData(
                            horizontalLines: [
                              if (goal > 0)
                                HorizontalLine(
                                  y: goal.toDouble(),
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              if (average > 0)
                                HorizontalLine(
                                  y: average,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                            ],
                          ),
                          titlesData: const FlTitlesData(
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 45,
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
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
                              isCurved: settings.curveLines,
                              color: Theme.of(context).colorScheme.primary,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: gradientColors
                                      .map(
                                        (color) => color.withValues(alpha: 0.3),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                          gridData: const FlGridData(show: false),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  material.Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat(settings.shortDateFormat)
                              .format(rows.first.created),
                        ),
                        if (rows.length > 2)
                          Text(
                            DateFormat(settings.shortDateFormat).format(
                              rows[rows.length ~/ 2].created,
                            ), // middle date
                          ),
                        if (rows.length > 1)
                          Text(
                            DateFormat(settings.shortDateFormat)
                                .format(rows.last.created), // last date
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text("Average"),
                      subtitle: Text(
                        "${formatter.format(average)} ${rows.first.unit}",
                      ),
                      leading: Radio(
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {},
                        fillColor: WidgetStateProperty.resolveWith(
                          (states) => Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ),
                  if (goal > 0)
                    Expanded(
                      child: ListTile(
                        title: const Text("Goal"),
                        subtitle: Text(
                          "${formatter.format(goal)} ${rows.first.unit}",
                        ),
                        leading: Radio(
                          value: 1,
                          groupValue: 1,
                          onChanged: (value) {},
                          fillColor: WidgetStateProperty.resolveWith(
                            (states) => Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
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
            DateFormat(settings.shortDateFormat).format(row.created);
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
