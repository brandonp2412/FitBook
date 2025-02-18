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
  final String metric;
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

  late Stream<List<GraphData>> stream;
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

  Expression<String> getCreated(String table) {
    Expression<String> createdCol = CustomExpression<String>(
      "STRFTIME('%Y-%m-%d', DATE($table.created, 'unixepoch', 'localtime'))",
    );
    if (widget.groupBy == Period.month)
      createdCol = CustomExpression<String>(
        "STRFTIME('%Y-%m', DATE($table.created, 'unixepoch', 'localtime'))",
      );
    else if (widget.groupBy == Period.week)
      createdCol = CustomExpression<String>(
        "STRFTIME('%Y-%m-%W', DATE($table.created, 'unixepoch', 'localtime'))",
      );
    else if (widget.groupBy == Period.year)
      createdCol = CustomExpression<String>(
        "STRFTIME('%Y', DATE($table.created, 'unixepoch', 'localtime'))",
      );
    return createdCol;
  }

  void _setStream() {
    final fields = context.read<SettingsState>().value.fields?.split(',') ?? [];
    Map<String, CustomExpression> metricColumns = {
      'calories': CustomExpression<double>(
        "SUM(foods.calories)",
        watchedTables: {db.foods},
      ),
    };
    for (final field in fields) {
      metricColumns[field] = CustomExpression<double>(
        "SUM(foods.$field)",
        watchedTables: {db.foods},
      );
    }

    if (widget.groupBy != Period.day) {
      metricColumns['calories'] = CustomExpression<double>(
        "SUM(foods.calories) / COUNT(DISTINCT date(entries.created, 'unixepoch'))",
        watchedTables: {db.foods},
      );
      for (final field in fields)
        metricColumns[field] = CustomExpression<double>(
          "SUM(foods.$field) / COUNT(DISTINCT date(entries.created, 'unixepoch'))",
          watchedTables: {db.foods},
        );
    }

    if (widget.metric == 'body-weight') {
      final createdCol = getCreated('weights');
      stream = (db.weights.selectOnly()
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
            ..limit(settings.limit))
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
    } else {
      final createdCol = getCreated('entries');
      stream = (db.entries.selectOnly()
            ..addColumns([
              db.entries.created,
              ...metricColumns.values,
            ])
            ..join(
              [innerJoin(db.foods, db.entries.food.equalsExp(db.foods.id))],
            )
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
            ..limit(settings.limit))
          .watch()
          .map((results) {
        return results.map((result) {
          final created = result.read(db.entries.created)!.toLocal();
          double value =
              (result.read(metricColumns[widget.metric]!) ?? 0.0) as double;
          String unit = widget.metric == 'calories' ? 'kcal' : 'g';

          return GraphData(created: created, value: value, unit: unit);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    settings = context.watch<SettingsState>().value;

    double goal = 0;

    switch (widget.metric) {
      case 'calories':
        goal = (settings.dailyCalories ?? 0).toDouble();
        break;
      case 'protein':
        goal = (settings.dailyProtein ?? 0).toDouble();
        break;
      case 'body-weight':
        goal = settings.targetWeight ?? 0;
        break;
      case 'fat':
        goal = (settings.dailyFat ?? 0).toDouble();
        break;
      case 'carbs':
        goal = (settings.dailyCarb ?? 0).toDouble();
        break;
    }

    return StreamBuilder(
      stream: stream,
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
        for (var index = 0; index < rows.length; index++) {
          spots.add(FlSpot(index.toDouble(), rows[index].value));
          average += rows[index].value;
        }
        average /= spots.length;

        return material.Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
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
                                .map((color) => color.withValues(alpha: 0.3))
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
        DateFormat(settings.shortDateFormat).format(createdDate),
        style: style,
      );
    } else {
      text = const Text('', style: style);
    }

    return SideTitleWidget(
      meta: meta,
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
