import 'package:drafter/drafter.dart';
import 'package:drafter/painting.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AppLineChartPoint {
  final int index;
  final double value;

  const AppLineChartPoint(this.index, this.value);
}

@immutable
class AppLineChartSeries {
  final List<AppLineChartPoint> points;
  final Color color;
  final double strokeWidth;
  final bool curved;
  final bool fill;

  const AppLineChartSeries({
    required this.points,
    required this.color,
    required this.strokeWidth,
    this.curved = false,
    this.fill = false,
  });
}

class AppLineChart extends StatelessWidget {
  final List<AppLineChartSeries> series;
  final List<AppLineChartPoint> fallbackPoints;
  final List<String> bottomLabels;
  final int? maxBottomTitles;
  final double? referenceValue;
  final Color referenceColor;
  final bool startAtZero;
  final String Function(double value) axisLabelFormatter;
  final String Function(int index, double value) tooltipText;
  final String accessibilityLabel;
  final String accessibilityValue;

  const AppLineChart({
    super.key,
    required this.series,
    required this.fallbackPoints,
    required this.bottomLabels,
    required this.referenceColor,
    required this.startAtZero,
    required this.axisLabelFormatter,
    required this.tooltipText,
    required this.accessibilityLabel,
    required this.accessibilityValue,
    this.maxBottomTitles,
    this.referenceValue,
  });

  @visibleForTesting
  static (double, double) calculateBounds({
    required List<AppLineChartPoint> points,
    required bool startAtZero,
    double? referenceValue,
  }) {
    if (points.isEmpty) return (0, 1);

    var minY = points.first.value;
    var maxY = points.first.value;
    for (final point in points.skip(1)) {
      if (point.value < minY) minY = point.value;
      if (point.value > maxY) maxY = point.value;
    }

    final reference = referenceValue;
    if (reference != null) {
      if (reference < minY) minY = reference;
      if (reference > maxY) maxY = reference;
    }
    if (startAtZero) minY = 0;

    if (minY == maxY) {
      if (minY == 0) {
        maxY = 1;
      } else {
        final padding = minY.abs() * 0.05;
        final resolvedPadding = padding == 0 ? 0.5 : padding;
        minY -= resolvedPadding;
        maxY += resolvedPadding;
      }
    }
    return (minY, maxY);
  }

  Set<int> _bottomLabelIndexes(double width) {
    if (bottomLabels.isEmpty) return const {};
    final widthBasedCount = (width / 88).floor();
    final requestedCount = maxBottomTitles == null
        ? widthBasedCount
        : widthBasedCount < maxBottomTitles!
            ? widthBasedCount
            : maxBottomTitles!;
    final labelCount = bottomLabels.length == 1
        ? 1
        : requestedCount.clamp(2, bottomLabels.length).toInt();

    return {
      if (labelCount == 1)
        0
      else
        for (var i = 0; i < labelCount; i++)
          ((bottomLabels.length - 1) * i / (labelCount - 1)).round(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final visiblePoints = [
      for (final line in series) ...line.points,
    ];
    final boundsPoints = visiblePoints.isEmpty ? fallbackPoints : visiblePoints;
    final valueBounds = calculateBounds(
      points: boundsPoints,
      startAtZero: startAtZero,
      referenceValue: referenceValue,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        final renderer = _AppLineChartRenderer(
          series: series,
          rowCount: bottomLabels.length,
          minY: valueBounds.$1,
          maxY: valueBounds.$2,
          referenceValue: referenceValue,
          referenceColor: referenceColor,
          axisLabelFormatter: axisLabelFormatter,
          accessibilityLabel: accessibilityLabel,
          accessibilityValue: accessibilityValue,
        );
        final scale = renderer.scaleFor(size);
        final labelIndexes = _bottomLabelIndexes(scale.bounds.width);

        return Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            _AppLineChartInteraction(
              renderer: renderer,
              tooltipText: tooltipText,
            ),
            IgnorePointer(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  for (final index in labelIndexes)
                    if (index >= 0 &&
                        index < bottomLabels.length &&
                        scale.count > index)
                      Positioned(
                        key: ValueKey('app-line-x-label-$index'),
                        left: scale.xForIndex(index) - 44,
                        top: scale.bounds.bottom + 8,
                        width: 88,
                        child: Text(
                          bottomLabels[index],
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AppLineChartInteraction extends StatefulWidget {
  final _AppLineChartRenderer renderer;
  final String Function(int index, double value) tooltipText;

  const _AppLineChartInteraction({
    required this.renderer,
    required this.tooltipText,
  });

  @override
  State<_AppLineChartInteraction> createState() =>
      _AppLineChartInteractionState();
}

class _AppLineChartInteractionState extends State<_AppLineChartInteraction> {
  final ValueNotifier<int?> _activeIndex = ValueNotifier(null);

  void _activate(Offset position, ChartScene scene) {
    final bounds = scene.bounds;
    if (bounds == null || !bounds.rect.contains(position)) {
      _activeIndex.value = null;
      return;
    }
    _activeIndex.value = ChartHitTest.nearestIndexAtX(scene, position.dx);
  }

  void _clear() {
    _activeIndex.value = null;
  }

  bool get _keepTooltipOnTapUp {
    if (kIsWeb) return true;
    return switch (defaultTargetPlatform) {
      TargetPlatform.linux ||
      TargetPlatform.macOS ||
      TargetPlatform.windows =>
        true,
      _ => false,
    };
  }

  @override
  void didUpdateWidget(_AppLineChartInteraction oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.renderer, widget.renderer)) _clear();
  }

  @override
  void dispose() {
    _activeIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = DrafterTheme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final scene = widget.renderer.buildScene(constraints.biggest);
        return MouseRegion(
          onHover: (event) => _activate(event.localPosition, scene),
          onExit: (_) => _clear(),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanDown: (details) => _activate(details.localPosition, scene),
            onPanStart: (details) => _activate(details.localPosition, scene),
            onPanUpdate: (details) => _activate(details.localPosition, scene),
            onPanEnd: (_) => _clear(),
            onPanCancel: _clear,
            onTapDown: (details) => _activate(details.localPosition, scene),
            onTapUp: (details) {
              _activate(details.localPosition, scene);
              if (!_keepTooltipOnTapUp) _clear();
            },
            onTapCancel: _clear,
            onLongPressStart: (details) =>
                _activate(details.localPosition, scene),
            onLongPressMoveUpdate: (details) =>
                _activate(details.localPosition, scene),
            onLongPressEnd: (_) => _clear(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ChartCanvas(renderer: widget.renderer, animate: false),
                Positioned.fill(
                  child: IgnorePointer(
                    child: RepaintBoundary(
                      child: CustomPaint(
                        painter: _AppLineTooltipPainter(
                          activeIndex: _activeIndex,
                          scene: scene,
                          theme: theme,
                          tooltipText: widget.tooltipText,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AppLineTooltipPainter extends CustomPainter {
  final ValueNotifier<int?> activeIndex;
  final ChartScene scene;
  final DrafterThemeColors theme;
  final String Function(int index, double value) tooltipText;

  _AppLineTooltipPainter({
    required this.activeIndex,
    required this.scene,
    required this.theme,
    required this.tooltipText,
  }) : super(repaint: activeIndex);

  @override
  void paint(Canvas canvas, Size size) {
    final index = activeIndex.value;
    final bounds = scene.bounds;
    if (index == null || bounds == null) return;

    final marks = ChartHitTest.marksAtIndex(scene, index);
    if (marks.isEmpty) return;

    var highest = marks.first;
    for (final mark in marks.skip(1)) {
      if (mark.value > highest.value) highest = mark;
    }

    final x = scene.scale?.xForIndex(index) ?? highest.center.dx;
    drawTrackball(
      canvas,
      x: x,
      top: bounds.top,
      bottom: bounds.bottom,
      lineColor: theme.crosshair,
      markers: [for (final mark in marks) mark.center],
      markerColors: [for (final mark in marks) mark.color],
    );
    drawTooltip(
      canvas,
      anchor: Offset(x, bounds.top),
      container: size,
      background: theme.tooltipBackground,
      textColor: highest.color,
      mutedTextColor: theme.tooltipMutedText,
      rows: [
        TooltipRow(tooltipText(highest.index, highest.value)),
      ],
    );
  }

  @override
  bool shouldRepaint(covariant _AppLineTooltipPainter oldDelegate) =>
      oldDelegate.scene != scene ||
      oldDelegate.theme != theme ||
      oldDelegate.tooltipText != tooltipText;
}

class _AppLineChartRenderer extends ChartRenderer
    implements InteractiveRenderer {
  final List<AppLineChartSeries> series;
  final int rowCount;
  final double minY;
  final double maxY;
  final double? referenceValue;
  final Color referenceColor;
  final String Function(double value) axisLabelFormatter;
  final String _accessibilityLabel;
  final String _accessibilityValue;

  const _AppLineChartRenderer({
    required this.series,
    required this.rowCount,
    required this.minY,
    required this.maxY,
    required this.referenceValue,
    required this.referenceColor,
    required this.axisLabelFormatter,
    required String accessibilityLabel,
    required String accessibilityValue,
  })  : _accessibilityLabel = accessibilityLabel,
        _accessibilityValue = accessibilityValue;

  ChartBounds boundsFor(Size size) => ChartBounds.insets(
        size,
        left: 45,
        top: 0,
        right: 0,
        bottom: 34,
      );

  CartesianScale scaleFor(Size size) => CartesianScale(
        bounds: boundsFor(size),
        count: rowCount,
        minValue: minY,
        maxValue: maxY,
      );

  Path _linePath(List<Offset> points, {required bool curved}) {
    if (!curved || points.length < 3) return polylinePath(points);

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 0; i < points.length - 1; i++) {
      final p0 = points[i == 0 ? i : i - 1];
      final p1 = points[i];
      final p2 = points[i + 1];
      final p3 = points[i + 2 >= points.length ? i + 1 : i + 2];
      final lowY = p1.dy < p2.dy ? p1.dy : p2.dy;
      final highY = p1.dy > p2.dy ? p1.dy : p2.dy;
      final c1 = Offset(
        p1.dx + (p2.dx - p0.dx) / 6,
        (p1.dy + (p2.dy - p0.dy) / 6).clamp(lowY, highY),
      );
      final c2 = Offset(
        p2.dx - (p3.dx - p1.dx) / 6,
        (p2.dy - (p3.dy - p1.dy) / 6).clamp(lowY, highY),
      );
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p2.dx, p2.dy);
    }
    return path;
  }

  List<Offset> _pixelPoints(
    AppLineChartSeries line,
    CartesianScale scale,
  ) =>
      [
        for (final point in line.points)
          Offset(scale.xForIndex(point.index), scale.yForValue(point.value)),
      ];

  void _drawAxes(
    Canvas canvas,
    CartesianScale scale,
    DrafterThemeColors theme,
  ) {
    const tickCount = 4;
    for (var i = 0; i <= tickCount; i++) {
      final value = minY + (maxY - minY) * i / tickCount;
      drawChartText(
        canvas,
        axisLabelFormatter(value),
        Offset(scale.bounds.left - 7, scale.yForValue(value)),
        color: theme.label,
        fontSize: 10,
        h: HAlign.end,
        v: VAlign.center,
      );
    }
  }

  void _drawReference(Canvas canvas, CartesianScale scale) {
    final value = referenceValue;
    if (value == null) return;
    final y = scale.yForValue(value);
    canvas.drawLine(
      Offset(scale.bounds.left, y),
      Offset(scale.bounds.right, y),
      Paint()
        ..color = referenceColor
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawSeries(
    Canvas canvas,
    AppLineChartSeries line,
    CartesianScale scale,
    DrafterThemeColors theme,
    double progress,
  ) {
    final points = _pixelPoints(line, scale);
    if (points.length < 2) return;

    final path = _linePath(points, curved: line.curved);
    if (line.fill) {
      final fillPath = Path.from(path)
        ..lineTo(points.last.dx, scale.bounds.bottom)
        ..lineTo(points.first.dx, scale.bounds.bottom)
        ..close();
      canvas.drawPath(
        fillPath,
        Paint()
          ..style = PaintingStyle.fill
          ..shader = LinearGradient(
            colors: [
              line.color.withValues(alpha: 0.3),
              theme.surface.withValues(alpha: 0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(scale.bounds.rect),
      );
    }

    canvas.drawPath(
      trimPath(path, progress),
      Paint()
        ..color = line.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = line.strokeWidth
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..isAntiAlias = true,
    );
  }

  @override
  void draw(
    Canvas canvas,
    Size size,
    DrafterThemeColors theme,
    double progress,
  ) {
    if (size.isEmpty) return;
    final scale = scaleFor(size);
    _drawAxes(canvas, scale, theme);
    _drawReference(canvas, scale);
    for (final line in series) {
      _drawSeries(canvas, line, scale, theme, progress);
    }
  }

  @override
  ChartScene buildScene(Size size) {
    final scale = scaleFor(size);
    final marks = <PlotMark>[];
    for (var seriesIndex = 0; seriesIndex < series.length; seriesIndex++) {
      final line = series[seriesIndex];
      for (final point in line.points) {
        if (point.index < 0 || point.index >= rowCount) continue;
        marks.add(
          PlotMark(
            index: point.index,
            seriesIndex: seriesIndex,
            seriesName: '',
            label: '',
            value: point.value,
            center: Offset(
              scale.xForIndex(point.index),
              scale.yForValue(point.value),
            ),
            color: line.color,
          ),
        );
      }
    }
    return ChartScene(
      bounds: scale.bounds,
      scale: scale,
      categories: const [],
      marks: marks,
    );
  }

  @override
  String get accessibilityLabel => _accessibilityLabel;

  @override
  String get accessibilityValue => _accessibilityValue;
}
