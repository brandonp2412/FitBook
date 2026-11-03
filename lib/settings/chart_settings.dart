import 'package:drift/drift.dart' hide Column;
import 'package:fit_book/app_line_chart.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartSettingsPage extends StatefulWidget {
  const ChartSettingsPage({super.key});

  @override
  State<ChartSettingsPage> createState() => _ChartSettingsPageState();
}

class _ChartSettingsPageState extends State<ChartSettingsPage> {
  double? _draggedSmoothness;

  void _update(SettingsCompanion change) {
    db.settings.update().write(change);
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;
    final l10n = context.l10n;
    final colors = Theme.of(context).colorScheme;
    final smoothness = _draggedSmoothness ?? settings.curveSmoothness;

    final preview = Card(
      key: const Key('chart-visuals-preview'),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.chartPreview,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: AppLineChart(
                  series: [
                    AppLineChartSeries(
                      points: const [
                        AppLineChartPoint(0, 71),
                        AppLineChartPoint(1, 76),
                        AppLineChartPoint(2, 73),
                        AppLineChartPoint(3, 79),
                        AppLineChartPoint(4, 75),
                      ],
                      color: colors.primary,
                      strokeWidth: 3,
                      curved: settings.curveLines,
                      fill: settings.fillChartArea,
                    ),
                  ],
                  fallbackPoints: const [
                    AppLineChartPoint(0, 71),
                    AppLineChartPoint(1, 76),
                    AppLineChartPoint(2, 73),
                    AppLineChartPoint(3, 79),
                    AppLineChartPoint(4, 75),
                  ],
                  bottomLabels: const ['1', '2', '3', '4', '5'],
                  showGridlines: settings.showChartGridlines,
                  curveSmoothness: smoothness,
                  referenceColor: colors.onSurface,
                  startAtZero: settings.graphsStartAtZero,
                  axisLabelFormatter: (value) => value.toStringAsFixed(0),
                  tooltipText: (index, value) => value.toStringAsFixed(1),
                  accessibilityLabel: l10n.chartPreview,
                  accessibilityValue: '5',
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final controls = Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          SwitchListTile(
            key: const Key('chart-gridlines-switch'),
            secondary: const Icon(Icons.grid_on_outlined),
            title: Text(l10n.chartGridlines),
            value: settings.showChartGridlines,
            onChanged: (value) => _update(
              SettingsCompanion(showChartGridlines: Value(value)),
            ),
          ),
          SwitchListTile(
            key: const Key('chart-shading-switch'),
            secondary: const Icon(Icons.gradient_outlined),
            title: Text(l10n.chartShading),
            value: settings.fillChartArea,
            onChanged: (value) => _update(
              SettingsCompanion(fillChartArea: Value(value)),
            ),
          ),
          SwitchListTile(
            key: const Key('curve-lines-switch'),
            secondary: const Icon(Icons.insights_outlined),
            title: Text(l10n.curveLineGraphs),
            value: settings.curveLines,
            onChanged: (value) => _update(
              SettingsCompanion(curveLines: Value(value)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.tune, size: 24),
                    const SizedBox(width: 16),
                    Expanded(child: Text(l10n.curveSmoothness)),
                    Text(smoothness.toStringAsFixed(2)),
                  ],
                ),
                Slider(
                  key: const Key('curve-smoothness-slider'),
                  min: 0,
                  max: 1,
                  divisions: 20,
                  value: smoothness.clamp(0, 1),
                  onChanged: (value) =>
                      setState(() => _draggedSmoothness = value),
                  onChangeEnd: (value) async {
                    await db.settings.update().write(
                          SettingsCompanion(curveSmoothness: Value(value)),
                        );
                    if (mounted) setState(() => _draggedSmoothness = null);
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 8),
          SwitchListTile(
            key: const Key('chart-zero-switch'),
            secondary: const Icon(Icons.vertical_align_bottom),
            title: Text(l10n.graphsStartAtZero),
            value: settings.graphsStartAtZero,
            onChanged: (value) => _update(
              SettingsCompanion(graphsStartAtZero: Value(value)),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.charts)),
      body: AdaptivePageBody(
        maxWidth: 1100,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 780;
            return SingleChildScrollView(
              padding: EdgeInsets.all(wide ? 24 : 16),
              child: wide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: controls),
                        const SizedBox(width: 16),
                        Expanded(child: preview),
                      ],
                    )
                  : Column(
                      children: [
                        preview,
                        const SizedBox(height: 12),
                        controls,
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
