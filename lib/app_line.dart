import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/entries.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GraphData {
  final DateTime created;
  final double value;

  GraphData({required this.created, required this.value});
}

class AppLine extends StatefulWidget {
  final GraphMetric metric;
  final AppGroupBy groupBy;
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
  final _weekCol =
      const CustomExpression<int>("STRFTIME('%W', DATE(created, 'unixepoch'))");

  @override
  void didUpdateWidget(covariant AppLine oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.groupBy != widget.groupBy ||
        oldWidget.startDate != widget.startDate ||
        oldWidget.endDate != widget.endDate) _setStream();
  }

  @override
  void initState() {
    super.initState();
    _setStream();
    _settings = context.read<SettingsState>();
  }

  void _setStream() {
    Iterable<Expression> groupBy = [db.entries.created.date];

    if (widget.groupBy == AppGroupBy.month)
      groupBy = [db.entries.created.year, db.entries.created.month];
    else if (widget.groupBy == AppGroupBy.week)
      groupBy = [db.entries.created.year, db.entries.created.month, _weekCol];
    else if (widget.groupBy == AppGroupBy.year)
      groupBy = [db.entries.created.year];

    _graphStream = watchCalories(groupBy, widget.metric);
  }

  double getValue(TypedResult row, GraphMetric metric) {
    if (metric == GraphMetric.bodyWeight) {
      return row.read(db.entries.quantity)!;
    } else if (metric == GraphMetric.calories) {
      return row.read(db.entries.quantity)!;
    } else if (metric == GraphMetric.protein) {
      return row.read(db.entries.quantity)!;
    } else {
      throw Exception("Metric not supported.");
    }
  }

  @override
  Widget build(BuildContext context) {
    _settings = context.watch<SettingsState>();

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
        for (var index = 0; index < rows.length; index++)
          spots.add(FlSpot(index.toDouble(), rows[index].value));

        return SizedBox(
          height: 400,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 80.0, right: 32.0, top: 16.0),
            child: LineChart(
              LineChartData(
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
                  touchTooltipData: _tooltipData(context, rows),
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
        );
      },
    );
  }

  Widget _bottomTitleWidgets(
    double value,
    TitleMeta meta,
    List<GraphData> rows,
  ) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;

    int middleIndex = (rows.length / 2).floor();
    List<int> indices;

    if (rows.length % 2 == 0) {
      indices = [0, rows.length - 1];
    } else {
      indices = [0, middleIndex, rows.length - 1];
    }

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
  ) {
    return LineTouchTooltipData(
      getTooltipColor: (touchedSpot) =>
          Theme.of(context).colorScheme.background,
      getTooltipItems: (touchedSpots) {
        final row = rows.elementAt(touchedSpots.first.spotIndex);
        final created =
            DateFormat(_settings.shortDateFormat).format(row.created);
        final formatter = NumberFormat("#,###.00");
        final value = formatter.format(row.value);

        String text = "$value $created";

        return [
          LineTooltipItem(
            text,
            TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
          ),
        ];
      },
    );
  }
}
