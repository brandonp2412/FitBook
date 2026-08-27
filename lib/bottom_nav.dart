import 'package:flutter/material.dart';
import 'package:frisbee_flutter_foundation/frisbee_flutter_foundation.dart';

class BottomNav extends StatelessWidget {
  /// Fixed visual footprint of the pill and its 16px outer padding.
  /// The device safe-area inset is handled by [PillBottomNav].
  static const double totalOverlayHeight = PillBottomNav.pillHeight + 32;

  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final void Function(BuildContext, String)? onLongPress;

  const BottomNav({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return PillBottomNav<String>(
      destinations: tabs
          .map(
            (tab) => PillNavDestination(
              value: tab,
              label: _getLabelForTab(tab),
              icon: _getIconForTab(tab),
            ),
          )
          .toList(),
      currentIndex: currentIndex,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }

  IconData _getIconForTab(String tab) {
    switch (tab) {
      case 'DiaryPage':
        return Icons.date_range;
      case 'GraphPage':
        return Icons.insights;
      case 'FoodPage':
        return Icons.restaurant;
      case 'WeightPage':
        return Icons.scale;
      default:
        return Icons.error_rounded;
    }
  }

  String _getLabelForTab(String tab) {
    switch (tab) {
      case 'DiaryPage':
        return 'Diary';
      case 'GraphPage':
        return 'Graph';
      case 'FoodPage':
        return 'Food';
      case 'WeightPage':
        return 'Weight';
      default:
        return 'Error';
    }
  }
}
