import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
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

    return Material(
      type: MaterialType.transparency,
      child: Padding(
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
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeOutCubic,
                      height: 48,
                      padding: EdgeInsets.symmetric(
                        horizontal: isSelected ? 16 : 12,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? color.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getIconForTab(tab),
                            color:
                                isSelected ? color.onPrimary : color.onSurface,
                            size: 24,
                            semanticLabel: label,
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeOutCubic,
                            child: isSelected
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      label,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(color: color.onPrimary),
                                    ),
                                  )
                                : const SizedBox.shrink(),
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
