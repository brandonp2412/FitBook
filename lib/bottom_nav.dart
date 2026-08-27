import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  static const double totalOverlayHeight = 60 +
      16; // container height + top padding + bottom padding (excl. system inset)

  final List<String> tabs;
  final int currentIndex;
  final Function(int) onTap;
  final Function(BuildContext, String)? onLongPress;

  const BottomNav({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final systemBottomInset = MediaQuery.paddingOf(context).bottom;
    final availableItemWidth = MediaQuery.sizeOf(context).width - 44;
    final itemWidth = tabs.isEmpty
        ? 78.0
        : (availableItemWidth / tabs.length).clamp(64.0, 78.0);

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, systemBottomInset + 16),
      child: Center(
        heightFactor: 1,
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final tab = entry.value;
              final isSelected = index == currentIndex;
              final label = _getLabelForTab(tab);

              return Semantics(
                label: label,
                button: true,
                selected: isSelected,
                excludeSemantics: true,
                child: GestureDetector(
                  key: Key(tab),
                  onTap: () => onTap(index),
                  onLongPress: onLongPress != null
                      ? () => onLongPress!(context, tab)
                      : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOut,
                    width: itemWidth,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected ? color.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _getIconForTab(tab),
                          color: isSelected ? color.onPrimary : color.onSurface,
                          size: 24,
                          semanticLabel: label,
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: itemWidth - 32,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 120),
                            opacity: isSelected ? 1 : 0,
                            child: Text(
                              label,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: color.onPrimary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
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
