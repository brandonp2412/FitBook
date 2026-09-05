import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/empty_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
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
  final int? maxBottomTitles;

  const AppLine({
    super.key,
    required this.metric,
    required this.groupBy,
    this.start,
    this.end,
    this.maxBottomTitles,
  });

  @override
  State<AppLine> createState() => _AppLineState();
}

class _AppLineState extends State<AppLine> {
  final formatter = NumberFormat('#,##0.00');

  static const int _smoothWindow = 7;

  late Stream<List<GraphData>> stream;
  late Setting settings;
  bool showMain = true;
  bool showGoal = true;
  bool showTrend = false;
  bool showSmooth = false;

  @override
  void initState() {
    super.initState();
    settings = context.read<SettingsState>().value;
    final selected = settings.graphSeries.split(',');
    showMain = selected.contains('value');
    showGoal = selected.contains('goal');
    showTrend = selected.contains('trend');
    showSmooth = selected.contains('smooth');
    _setStream();
  }

  void _updateSeries({bool? value, bool? goal, bool? trend, bool? smooth}) {
    setState(() {
      showMain = value ?? showMain;
      showGoal = goal ?? showGoal;
      showTrend = trend ?? showTrend;
      showSmooth = smooth ?? showSmooth;
    });
    final series = [
      if (showMain) 'value',
      if (showGoal) 'goal',
      if (showTrend) 'trend',
      if (showSmooth) 'smooth',
    ];
    db.settings.update().write(
      SettingsCompanion(graphSeries: Value(series.join(','))),
    );
  }

  /// Least-squares regression of `val` against days elapsed since the
  /// earliest entry. Using elapsed days (rather than index position) keeps
  /// the slope correct when entries aren't evenly spaced in time.
  Map<String, double> _calcTrend(List<GraphData> data) {
    if (data.length < 2) {
      return {
        'slope': 0.0,
        'intercept': data.isNotEmpty ? data.first.val : 0.0,
      };
    }

    final sortedData = List<GraphData>.from(data)
      ..sort((a, b) => a.created.compareTo(b.created));
    final firstCreated = sortedData.first.created;
    double sumX = 0, sumY = 0, sumXY = 0, sumXX = 0;
    final n = sortedData.length;

    for (final row in sortedData) {
      final x = row.created.difference(firstCreated).inDays.toDouble();
      final y = row.val;
      sumX += x;
      sumY += y;
      sumXY += x * y;
      sumXX += x * x;
    }

    final denominator = n * sumXX - sumX * sumX;
    if (denominator == 0) {
      return {'slope': 0.0, 'intercept': sumY / n};
    }

    final slope = (n * sumXY - sumX * sumY) / denominator;
    final intercept = (sumY - slope * sumX) / n;

    return {'slope': slope, 'intercept': intercept};
  }

  String _getTrendText(List<GraphData> data) {
    if (data.length < 2) return "0.00 ${data.first.unit}";

    final slopePerWeek = _calcTrend(data)['slope']! * 7;

    final sign = slopePerWeek >= 0 ? "+" : "";
    return "$sign${formatter.format(slopePerWeek)} ${data.first.unit}";
  }

  List<FlSpot> _getTrendSpots(List<GraphData> data) {
    if (data.length < 2) return [];

    final trend = _calcTrend(data);
    final slope = trend['slope']!;
    final intercept = trend['intercept']!;
    final firstCreated = (List<GraphData>.from(
      data,
    )..sort((a, b) => a.created.compareTo(b.created))).first.created;

    final trendSpots = <FlSpot>[];
    for (int i = 0; i < data.length; i++) {
      final days = data[i].created.difference(firstCreated).inDays.toDouble();
      final trendVal = slope * days + intercept;
      trendSpots.add(FlSpot(i.toDouble(), trendVal));
    }

    return trendSpots;
  }

  /// Trailing rolling average of `val`, one output per input point, using up
  /// to `window` of the preceding points (fewer near the start of the list).
  List<double> _rollingAverage(List<double> values, int window) {
    final result = <double>[];
    for (int i = 0; i < values.length; i++) {
      final start = (i - window + 1).clamp(0, i);
      final slice = values.sublist(start, i + 1);
      result.add(slice.reduce((a, b) => a + b) / slice.length);
    }
    return result;
  }

  List<FlSpot> _getSmoothSpots(List<GraphData> data) {
    final smoothed = _rollingAverage(
      data.map((row) => row.val).toList(),
      _smoothWindow,
    );
    return [
      for (int i = 0; i < smoothed.length; i++)
        FlSpot(i.toDouble(), smoothed[i]),
    ];
  }

  @override
  void didUpdateWidget(covariant AppLine oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setStream();
  }

  Expression<String> getCreated(String table) {
    // SQLite's 'localtime' modifier doesn't consult a timezone database; it
    // just asks the OS for the current UTC offset, which is unreliable across
    // platforms (https://sqlite.org/lang_datefunc.html). Compute the offset
    // in Dart, which resolves the device timezone through Flutter's platform
    // channel, so day/week/month/year buckets line up with the Dart-side
    // grouping used by the Diary page.
    final offset = DateTime.now().timeZoneOffset;
    final offsetModifier =
        "${offset.isNegative ? '-' : '+'}${offset.inMinutes.abs()} minutes";

    Expression<String> createdCol = CustomExpression<String>(
      "STRFTIME('%Y-%m-%d', $table.created, 'unixepoch', '$offsetModifier')",
    );
    if (widget.groupBy == Period.month)
      createdCol = CustomExpression<String>(
        "STRFTIME('%Y-%m', $table.created, 'unixepoch', '$offsetModifier')",
      );
    else if (widget.groupBy == Period.week)
      createdCol = CustomExpression<String>(
        "STRFTIME('%Y-%m-%W', $table.created, 'unixepoch', '$offsetModifier')",
      );
    else if (widget.groupBy == Period.year)
      createdCol = CustomExpression<String>(
        "STRFTIME('%Y', $table.created, 'unixepoch', '$offsetModifier')",
      );
    return createdCol;
  }

  void _setStream() {
    if (widget.metric == 'body-weight') {
      final createdCol = getCreated('weights');
      stream =
          (db.weights.selectOnly()
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
                    .toList()
                    .reversed
                    .toList(),
              );
    } else {
      final valueCol = CustomExpression<double>(
        mealAwareFieldExpr(widget.metric),
        watchedTables: {db.foods, db.diaries},
      );

      stream =
          (db.diaries.selectOnly()
                ..addColumns([db.diaries.created, valueCol])
                ..join([
                  leftOuterJoin(
                    db.foods,
                    db.diaries.food.equalsExp(db.foods.id),
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
                ))
              .watch()
              .map((results) {
                final entries = results
                    .map(
                      (result) => (
                        created: result.read(db.diaries.created)!.toLocal(),
                        value: result.read(valueCol) ?? 0.0,
                      ),
                    )
                    .toList();
                final unit = nutrientUnit(widget.metric);
                return bucketGraphData(entries, widget.groupBy, settings.limit)
                    .map(
                      (bucket) => GraphData(
                        created: bucket.created,
                        val: bucket.val,
                        unit: unit,
                      ),
                    )
                    .toList();
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sel = context
        .select<
          SettingsState,
          ({
            int? dailyCalories,
            int? dailyProtein,
            double? targetWeight,
            int? dailyFat,
            int? dailyCarb,
            bool curveLines,
            bool graphsStartAtZero,
            String shortDateFormat,
          })
        >(
          (s) => (
            dailyCalories: s.value.dailyCalories,
            dailyProtein: s.value.dailyProtein,
            targetWeight: s.value.targetWeight,
            dailyFat: s.value.dailyFat,
            dailyCarb: s.value.dailyCarb,
            curveLines: s.value.curveLines,
            graphsStartAtZero: s.value.graphsStartAtZero,
            shortDateFormat: s.value.shortDateFormat,
          ),
        );
    settings = context.read<SettingsState>().value;

    double goal = 0;

    switch (widget.metric) {
      case 'calories':
        goal = (sel.dailyCalories ?? 0).toDouble();
        break;
      case 'protein':
      case 'protein_g':
        goal = (sel.dailyProtein ?? 0).toDouble();
        break;
      case 'body-weight':
        goal = sel.targetWeight ?? 0;
        break;
      case 'fat':
      case 'fat_g':
        goal = (sel.dailyFat ?? 0).toDouble();
        break;
      case 'carbs':
      case 'carbohydrate_g':
        goal = (sel.dailyCarb ?? 0).toDouble();
        break;
    }

    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();
        if (snapshot.data?.isEmpty == true)
          return const AppEmptyState(
            icon: Icons.show_chart_rounded,
            title: 'No data yet',
            message: 'Complete some plans to view graphs here.',
          );
        if (snapshot.hasError) return ErrorWidget(snapshot.error.toString());

        List<Color> gradColors = [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.surface,
        ];

        final rows = snapshot.data!;
        List<FlSpot> spots = [
          for (var index = 0; index < rows.length; index++)
            FlSpot(index.toDouble(), rows[index].val),
        ];

        List<FlSpot> trendSpots = showTrend ? _getTrendSpots(rows) : [];
        List<FlSpot> smoothSpots = showSmooth ? _getSmoothSpots(rows) : [];

        final lineBars = <LineChartBarData>[];
        // Keep this in the same order as lineBarsData so each tooltip can use
        // the same color as its series checkbox and line.
        final seriesColors = <Color>[];

        if (showMain) {
          seriesColors.add(Theme.of(context).colorScheme.primary);
          lineBars.add(
            LineChartBarData(
              spots: spots,
              isCurved: sel.curveLines,
              preventCurveOverShooting: true,
              color: Theme.of(context).colorScheme.primary,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradColors
                      .map((color) => color.withValues(alpha: 0.3))
                      .toList(),
                ),
              ),
            ),
          );
        }

        if (showTrend && trendSpots.isNotEmpty) {
          seriesColors.add(Theme.of(context).colorScheme.secondary);
          lineBars.add(
            LineChartBarData(
              spots: trendSpots,
              isCurved: false,
              color: Theme.of(context).colorScheme.secondary,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          );
        }

        if (showSmooth && smoothSpots.isNotEmpty) {
          seriesColors.add(Theme.of(context).colorScheme.tertiary);
          lineBars.add(
            LineChartBarData(
              spots: smoothSpots,
              isCurved: sel.curveLines,
              preventCurveOverShooting: true,
              color: Theme.of(context).colorScheme.tertiary,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          );
        }

        // fl_chart derives its bounds from line-bar spots, not extra lines.
        // Extend the relevant bound when the goal is visible so the goal line
        // remains inside the graph rather than being drawn beyond its edge.
        final visibleSpots = lineBars.isEmpty
            ? spots
            : lineBars.expand((bar) => bar.spots);
        double? lowestVisibleValue;
        double? highestVisibleValue;
        for (final spot in visibleSpots) {
          lowestVisibleValue = lowestVisibleValue == null
              ? spot.y
              : spot.y < lowestVisibleValue
              ? spot.y
              : lowestVisibleValue;
          highestVisibleValue = highestVisibleValue == null
              ? spot.y
              : spot.y > highestVisibleValue
              ? spot.y
              : highestVisibleValue;
        }
        final shouldIncludeGoal =
            showGoal && goal > 0 && highestVisibleValue != null;
        final minY = sel.graphsStartAtZero
            ? 0.0
            : shouldIncludeGoal && goal < lowestVisibleValue!
            ? goal
            : null;
        final maxY = shouldIncludeGoal && goal > highestVisibleValue
            ? goal
            : null;
        final maxBottomTitles = widget.maxBottomTitles;
        final bottomTitleInterval =
            maxBottomTitles == null || rows.length <= maxBottomTitles
            ? 1.0
            : (rows.length / maxBottomTitles).ceilToDouble();

        return material.Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 32.0, top: 16.0),
                child: LineChart(
                  LineChartData(
                    minY: minY,
                    maxY: maxY,
                    extraLinesData: ExtraLinesData(
                      horizontalLines: [
                        if (goal > 0 && showGoal)
                          HorizontalLine(
                            y: goal.toDouble(),
                            color: Theme.of(context).colorScheme.onSurface,
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
                          interval: bottomTitleInterval,
                          getTitlesWidget: (value, meta) =>
                              _bottomTitleWidgets(value, meta, rows),
                        ),
                      ),
                    ),
                    lineTouchData: LineTouchData(
                      touchTooltipData: _tooltipData(
                        context,
                        rows,
                        rows.first.unit,
                        seriesColors,
                      ),
                    ),
                    lineBarsData: lineBars,
                    gridData: const FlGridData(show: false),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 4,
              runSpacing: 2,
              children: [
                _statTile(
                  leading: Checkbox(
                    value: showMain,
                    onChanged: (value) => _updateSeries(value: value),
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                      (states) => states.contains(WidgetState.selected)
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                  label: 'Value',
                  value:
                      "${formatter.format(rows.last.val)} ${rows.first.unit}",
                  onTap: () => _updateSeries(value: !showMain),
                ),
                _statTile(
                  leading: Checkbox(
                    value: showGoal,
                    onChanged: goal > 0
                        ? (value) => _updateSeries(goal: value)
                        : null,
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                      (states) => states.contains(WidgetState.selected)
                          ? Theme.of(context).colorScheme.onSurface
                          : null,
                    ),
                  ),
                  label: 'Goal',
                  value: goal > 0
                      ? "${formatter.format(goal)} ${rows.first.unit}"
                      : "Not set",
                  onTap: goal > 0
                      ? () => _updateSeries(goal: !showGoal)
                      : () {},
                ),
                _statTile(
                  leading: Checkbox(
                    value: showTrend,
                    onChanged: (value) => _updateSeries(trend: value),
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                      (states) => states.contains(WidgetState.selected)
                          ? Theme.of(context).colorScheme.secondary
                          : null,
                    ),
                  ),
                  label: "Trend",
                  value: _getTrendText(rows),
                  onTap: () => _updateSeries(trend: !showTrend),
                ),
                _statTile(
                  leading: Checkbox(
                    value: showSmooth,
                    onChanged: (value) => _updateSeries(smooth: value),
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                      (states) => states.contains(WidgetState.selected)
                          ? Theme.of(context).colorScheme.tertiary
                          : null,
                    ),
                  ),
                  label: "Smooth",
                  value: "$_smoothWindow pt avg",
                  onTap: () => _updateSeries(smooth: !showSmooth),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  /// A compact, tappable stat shown beneath the chart (trend or goal): a leading
  /// indicator next to a stacked label and value, sized to its content so the
  /// pair can be centered as a group.
  Widget _statTile({
    required Widget leading,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading,
            const SizedBox(width: 5),
            material.Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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

    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
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

    return SideTitleWidget(meta: meta, child: text);
  }

  LineTouchTooltipData _tooltipData(
    BuildContext context,
    List<GraphData> rows,
    String unit,
    List<Color> seriesColors,
  ) {
    return LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Theme.of(context).colorScheme.surface,
      getTooltipItems: (touchedSpots) {
        if (touchedSpots.isEmpty) return const [];

        // Several series can have a point at the same cursor position. Show
        // only the topmost one, while keeping its series-specific color.
        var highestSpotIndex = 0;
        for (var index = 1; index < touchedSpots.length; index++) {
          if (touchedSpots[index].y > touchedSpots[highestSpotIndex].y) {
            highestSpotIndex = index;
          }
        }

        return List.generate(touchedSpots.length, (index) {
          final spot = touchedSpots[index];
          if (index != highestSpotIndex ||
              spot.barIndex >= seriesColors.length ||
              spot.spotIndex >= rows.length) {
            return null;
          }
          final row = rows.elementAt(spot.spotIndex);
          final dateStr = DateFormat(
            settings.shortDateFormat,
          ).format(row.created);
          return LineTooltipItem(
            "${formatter.format(spot.y)} $unit\n$dateStr",
            TextStyle(color: seriesColors[spot.barIndex]),
          );
        });
      },
    );
  }
}
