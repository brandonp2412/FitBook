import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/diary_settings.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/settings/weight_settings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GraphData {
  final DateTime created;
  final double val;
  final String unit;

  GraphData({required this.created, required this.val, required this.unit});
}

class AppLine extends StatefulWidget {
  final String metric;
  final Period groupBy;
  final DateTime? start;
  final DateTime? end;

  const AppLine({
    super.key,
    required this.metric,
    required this.groupBy,
    this.start,
    this.end,
  });

  @override
  createState() => _AppLineState();
}

class _AppLineState extends State<AppLine> {
  final formatter = NumberFormat('#,##0.00');

  late Stream<List<GraphData>> stream;
  late Setting settings = context.read<SettingsState>().value;
  bool showTrend = false;

  Map<String, double> _calcTrend(List<GraphData> data) {
    if (data.length < 2) return {'slope': 0.0, 'intercept': 0.0};

    // Sort data chronologically (oldest first) for proper trend calculation
    final sortedData = data.toList()
      ..sort((a, b) => a.created.compareTo(b.created));
    double sumX = 0, sumY = 0, sumXY = 0, sumXX = 0;
    int n = sortedData.length;

    for (int i = 0; i < n; i++) {
      double x = i.toDouble();
      double y = sortedData[i].val;
      sumX += x;
      sumY += y;
      sumXY += x * y;
      sumXX += x * x;
    }

    double slope = (n * sumXY - sumX * sumY) / (n * sumXX - sumX * sumX);
    double intercept = (sumY - slope * sumX) / n;

    return {'slope': slope, 'intercept': intercept};
  }

  String _getTrendText(List<GraphData> data) {
    if (data.length < 2) return "0.00 ${data.first.unit}";

    // Sort data chronologically for proper calculation
    final sortedData = data.toList()
      ..sort((a, b) => a.created.compareTo(b.created));
    final trend = _calcTrend(data);
    double slope = trend['slope']!;

    double daysSpan = sortedData.last.created
        .difference(sortedData.first.created)
        .inDays
        .toDouble();
    if (daysSpan == 0) daysSpan = 1;

    double slopePerWeek = slope * (7.0 * data.length / daysSpan);

    String sign = slopePerWeek >= 0 ? "+" : "";
    return "$sign${formatter.format(slopePerWeek)} ${data.first.unit}";
  }

  List<FlSpot> _getTrendSpots(List<GraphData> data) {
    if (data.length < 2) return [];

    final trend = _calcTrend(data);
    double slope = trend['slope']!;
    double intercept = trend['intercept']!;

    // Create trend spots that match the display coordinate system
    // The main chart uses rows (oldest-first), so we need to match that
    List<FlSpot> trendSpots = [];
    for (int i = 0; i < data.length; i++) {
      // i represents the chronological index (0 = oldest, n-1 = newest)
      // since we want to match the coordinate system of the main chart
      double trendVal = slope * i.toDouble() + intercept;
      trendSpots.add(FlSpot(i.toDouble(), trendVal));
    }

    return trendSpots;
  }

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

    // Define the quantity in grams expression with proper serving unit handling
    final qtyInGrams = CustomExpression<double>('''
    CASE 
      WHEN diaries.unit = 'serving' 
      THEN diaries.quantity * (
        CASE 
          WHEN foods.serving_size IS NULL THEN 100
          WHEN foods.serving_unit IS NULL THEN foods.serving_size
          WHEN foods.serving_unit = 'ounces' THEN foods.serving_size * 28.35
          WHEN foods.serving_unit = 'grams' THEN foods.serving_size
          WHEN foods.serving_unit = 'milliliters' THEN foods.serving_size
          WHEN foods.serving_unit = 'cups' THEN foods.serving_size * 250
          WHEN foods.serving_unit = 'tablespoons' THEN foods.serving_size * 15
          WHEN foods.serving_unit = 'teaspoons' THEN foods.serving_size * 5
          WHEN foods.serving_unit = 'pounds' THEN foods.serving_size * 453.592
          WHEN foods.serving_unit = 'serving' THEN foods.serving_size
          ELSE 100
        END
      )
      WHEN diaries.unit IN ('grams', 'milliliters') THEN diaries.quantity
      WHEN diaries.unit = 'milligrams' THEN diaries.quantity / 1000
      WHEN diaries.unit = 'cups' THEN diaries.quantity * 250
      WHEN diaries.unit = 'tablespoons' THEN diaries.quantity * 15
      WHEN diaries.unit = 'teaspoons' THEN diaries.quantity * 5
      WHEN diaries.unit = 'ounces' THEN diaries.quantity * 28.35
      WHEN diaries.unit = 'pounds' THEN diaries.quantity * 453.592
      WHEN diaries.unit = 'liters' THEN diaries.quantity * 1000
      WHEN diaries.unit = 'kilojoules' THEN diaries.quantity / 4.184
      ELSE diaries.quantity
    END
  ''');

    // Define serving size with fallback to 100g
    final servingG = CustomExpression<double>('''
      CASE 
        WHEN foods.serving_size IS NULL THEN 100
        WHEN foods.serving_unit IS NULL THEN foods.serving_size
        WHEN foods.serving_unit = 'ounces' THEN foods.serving_size * 28.35
        WHEN foods.serving_unit = 'grams' THEN foods.serving_size
        WHEN foods.serving_unit = 'milliliters' THEN foods.serving_size
        WHEN foods.serving_unit = 'cups' THEN foods.serving_size * 250
        WHEN foods.serving_unit = 'tablespoons' THEN foods.serving_size * 15
        WHEN foods.serving_unit = 'teaspoons' THEN foods.serving_size * 5
        WHEN foods.serving_unit = 'pounds' THEN foods.serving_size * 453.592
        WHEN foods.serving_unit = 'serving' THEN foods.serving_size
        ELSE 100
      END
''');

    // Calculate adjusted metrics with proper unit conversions
    Map<String, CustomExpression> metricCols = {
      'calories': CustomExpression<double>(
        '''SUM((${qtyInGrams.content}) * COALESCE(foods.calories, 0) / ${servingG.content})''',
        watchedTables: {db.foods, db.diaries},
      ),
    };

    for (final field in fields) {
      metricCols[field] = CustomExpression<double>(
        '''SUM((${qtyInGrams.content}) * COALESCE(foods.$field, 0) / ${servingG.content})''',
        watchedTables: {db.foods, db.diaries},
      );
    }

    // Handle averaging for periods other than day
    if (widget.groupBy != Period.day) {
      metricCols['calories'] = CustomExpression<double>(
        '''SUM((${qtyInGrams.content}) * COALESCE(foods.calories, 0) / ${servingG.content}) / 
         COUNT(DISTINCT date(diaries.created, 'unixepoch'))''',
        watchedTables: {db.foods, db.diaries},
      );

      for (final field in fields) {
        metricCols[field] = CustomExpression<double>(
          '''SUM((${qtyInGrams.content}) * COALESCE(foods.$field, 0) / ${servingG.content}) / 
           COUNT(DISTINCT date(diaries.created, 'unixepoch'))''',
          watchedTables: {db.foods, db.diaries},
        );
      }
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
                widget.start ?? DateTime(0),
              ),
            )
            ..where(
              db.weights.created.isSmallerOrEqualValue(
                widget.end ?? DateTime.now().add(const Duration(days: 1)),
              ),
            )
            ..limit(settings.limit))
          .watch()
          .map(
            (results) => results
                .map(
                  (result) => GraphData(
                    created: result.read(db.weights.created)!,
                    val: result.read(db.weights.amount)!,
                    unit: result.read(db.weights.unit)!,
                  ),
                )
                .toList(),
          );
    } else {
      final createdCol = getCreated('diaries');
      stream = (db.diaries.selectOnly()
            ..addColumns([
              db.diaries.created,
              ...metricCols.values,
            ])
            ..join(
              [innerJoin(db.foods, db.diaries.food.equalsExp(db.foods.id))],
            )
            ..orderBy([
              OrderingTerm(
                expression: db.diaries.created,
                mode: OrderingMode.desc,
              ),
            ])
            ..where(
              db.diaries.created.isBiggerOrEqualValue(
                widget.start ?? DateTime(0),
              ),
            )
            ..where(
              db.diaries.created.isSmallerOrEqualValue(
                widget.end ?? DateTime.now().add(const Duration(days: 1)),
              ),
            )
            ..groupBy([createdCol])
            ..limit(settings.limit))
          .watch()
          .map((results) {
        return results.map((result) {
          final created = result.read(db.diaries.created)!.toLocal();
          double val =
              (result.read(metricCols[widget.metric]!) ?? 0.0) as double;
          String unit = widget.metric == 'calories' ? 'kcal' : 'g';
          return GraphData(created: created, val: val, unit: unit);
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

        List<Color> gradColors = [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.surface,
        ];

        final rows = snapshot.data!.reversed.toList();
        List<FlSpot> spots = [];
        var avg = 0.0;
        for (var index = 0; index < rows.length; index++) {
          spots.add(FlSpot(index.toDouble(), rows[index].val));
          avg += rows[index].val;
        }
        avg /= spots.length;

        List<FlSpot> trendSpots = _getTrendSpots(rows);

        List<LineChartBarData> lineBars = [
          // Always show the original data
          LineChartBarData(
            spots: spots,
            isCurved: settings.curveLines,
            preventCurveOverShooting: true,
            color: Theme.of(context).colorScheme.primary,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradColors
                    .map((color) => color.withValues(alpha: 0.3))
                    .toList(),
              ),
            ),
          ),
        ];

        // Add trend line overlay if trend mode is selected
        if (showTrend && trendSpots.isNotEmpty) {
          lineBars.add(
            LineChartBarData(
              spots: trendSpots,
              isCurved: false,
              color: Theme.of(context).colorScheme.secondary,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(show: false),
            ),
          );
        }

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
                        if (!showTrend && spots.isNotEmpty)
                          HorizontalLine(
                            y: avg,
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
                    lineBarsData: lineBars,
                    gridData: const FlGridData(show: false),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            material.Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    material.SizedBox(
                      width: 165,
                      child: ListTile(
                        title: const Text("Average"),
                        subtitle: Text(
                          "${formatter.format(avg)} ${rows.first.unit}",
                        ),
                        onTap: () {
                          setState(() {
                            showTrend = false;
                          });
                        },
                        leading: Radio<bool>(
                          value: false,
                          groupValue: showTrend,
                          onChanged: (value) {
                            setState(() {
                              showTrend = value!;
                            });
                          },
                          fillColor: WidgetStateProperty.resolveWith(
                            (states) => Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ),
                    ),
                    material.SizedBox(
                      width: 165,
                      child: ListTile(
                        title: const Text("Trend"),
                        subtitle: Text(_getTrendText(rows)),
                        onTap: () => setState(() {
                          showTrend = true;
                        }),
                        leading: Radio<bool>(
                          value: true,
                          groupValue: showTrend,
                          onChanged: (value) {
                            setState(() {
                              showTrend = value!;
                            });
                          },
                          fillColor: WidgetStateProperty.resolveWith(
                            (states) => Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (goal > 0)
                  material.SizedBox(
                    width: 150,
                    child: ListTile(
                      onTap: () {
                        if (widget.metric == 'body-weight')
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WeightSettings(),
                            ),
                          );
                        else
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DiarySettings(),
                            ),
                          );
                      },
                      title: const Text("Goal"),
                      subtitle: Text(
                        "${formatter.format(goal)} ${rows.first.unit}",
                      ),
                      leading: Icon(
                        Icons.flag,
                        color: Theme.of(context).colorScheme.onSurface,
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
        if (touchedSpots.isEmpty) return [];

        // Always show tooltip for the original data (first line)
        final originalDataSpot = touchedSpots.firstWhere(
          (spot) => spot.barIndex == 0,
          orElse: () => touchedSpots.first,
        );

        final row = rows.elementAt(originalDataSpot.spotIndex);
        final created =
            DateFormat(settings.shortDateFormat).format(row.created);
        final val = formatter.format(row.val);

        String text = "$val $unit\n";

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
