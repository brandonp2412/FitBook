import 'package:fit_book/animated_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpeedDialAction {
  final IconData icon;
  final String label;
  final VoidCallback onSelected;

  const SpeedDialAction({
    required this.icon,
    required this.label,
    required this.onSelected,
  });
}

class SpeedDialFab extends StatefulWidget {
  final VoidCallback onTap;
  final String label;
  final IconData icon;
  final ScrollController scroll;
  final List<SpeedDialAction> actions;

  const SpeedDialFab({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.scroll,
    required this.actions,
  });

  @override
  State<SpeedDialFab> createState() => _SpeedDialFabState();
}

class _SpeedDialFabState extends State<SpeedDialFab> {
  bool dragging = false;
  int? hoveredIndex;
  late final _actionKeys =
      List.generate(widget.actions.length, (_) => GlobalKey());

  int? _hitTest(Offset globalPosition) {
    for (var i = 0; i < _actionKeys.length; i++) {
      final renderObject = _actionKeys[i].currentContext?.findRenderObject();
      if (renderObject is! RenderBox) continue;
      final topLeft = renderObject.localToGlobal(Offset.zero);
      final rect = (topLeft & renderObject.size).inflate(12);
      if (rect.contains(globalPosition)) return i;
    }
    return null;
  }

  void _onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    final hit = _hitTest(details.globalPosition);
    if (hit != hoveredIndex) {
      HapticFeedback.selectionClick();
      setState(() {
        hoveredIndex = hit;
      });
    }
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    final index = hoveredIndex;
    setState(() {
      dragging = false;
      hoveredIndex = null;
    });
    if (index != null) widget.actions[index].onSelected();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (dragging)
          for (var i = widget.actions.length - 1; i >= 0; i--) ...[
            _SpeedDialSatellite(
              key: _actionKeys[i],
              action: widget.actions[i],
              hovered: hoveredIndex == i,
            ),
            const SizedBox(height: 8),
          ],
        GestureDetector(
          onLongPressStart: (_) => setState(() {
            dragging = true;
          }),
          onLongPressMoveUpdate: _onLongPressMoveUpdate,
          onLongPressEnd: _onLongPressEnd,
          onLongPressCancel: () => setState(() {
            dragging = false;
            hoveredIndex = null;
          }),
          child: AnimatedFab(
            onTap: widget.onTap,
            label: widget.label,
            icon: widget.icon,
            scroll: widget.scroll,
            showTooltip: false,
          ),
        ),
      ],
    );
  }
}

class _SpeedDialSatellite extends StatelessWidget {
  final SpeedDialAction action;
  final bool hovered;

  const _SpeedDialSatellite({
    required super.key,
    required this.action,
    required this.hovered,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final background = hovered ? colors.primary : colors.secondaryContainer;
    final foreground = hovered ? colors.onPrimary : colors.onSecondaryContainer;

    return AnimatedScale(
      scale: hovered ? 1.15 : 1.0,
      duration: const Duration(milliseconds: 120),
      child: Material(
        elevation: 4,
        color: background,
        borderRadius: BorderRadius.circular(28),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(action.icon, color: foreground),
              const SizedBox(width: 8),
              Text(action.label, style: TextStyle(color: foreground)),
            ],
          ),
        ),
      ),
    );
  }
}
