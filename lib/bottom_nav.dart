import 'package:flutter/material.dart';

const double largeScreenBreakpoint = 900;
const double extendedRailBreakpoint = 1200;

bool usesSideNavigation(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= largeScreenBreakpoint;

double navigationBottomClearance(BuildContext context) =>
    usesSideNavigation(context)
        ? MediaQuery.paddingOf(context).bottom + 16
        : MediaQuery.paddingOf(context).bottom + BottomNav.totalOverlayHeight;

IconData iconForTab(String tab) {
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

String labelForTab(String tab) {
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

class AdaptivePageBody extends StatelessWidget {
  const AdaptivePageBody({
    super.key,
    required this.child,
    this.maxWidth = 1100,
    this.alignment = Alignment.topCenter,
  });

  final Widget child;
  final double maxWidth;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Align(
        alignment: alignment,
        child: SizedBox(
          width:
              constraints.maxWidth < maxWidth ? constraints.maxWidth : maxWidth,
          height: constraints.maxHeight,
          child: child,
        ),
      ),
    );
  }
}

class AdaptiveFormSurface extends StatelessWidget {
  const AdaptiveFormSurface({
    super.key,
    required this.child,
    this.maxWidth = 820,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final wide = usesSideNavigation(context);
    final content = wide
        ? Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: child,
            ),
          )
        : child;

    return AdaptivePageBody(
      maxWidth: maxWidth,
      child: Padding(
        padding: EdgeInsets.all(wide ? 24 : 16),
        child: content,
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  /// Fixed visual footprint of the 60px pill plus its 16px bottom padding.
  /// The system bottom inset is applied separately in [build].
  static const double totalOverlayHeight = 60 + 16;

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
    final color = Theme.of(context).colorScheme;
    final systemBottomInset = MediaQuery.paddingOf(context).bottom;

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
              final label = labelForTab(tab);

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
                          iconForTab(tab),
                          color: isSelected ? color.onPrimary : color.onSurface,
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
    );
  }
}

class SideNav extends StatelessWidget {
  const SideNav({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
    required this.onOpenSettings,
  });

  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final extended = MediaQuery.sizeOf(context).width >= extendedRailBreakpoint;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        border: Border(
          right: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: NavigationRail(
        extended: extended,
        minExtendedWidth: 220,
        selectedIndex: currentIndex,
        groupAlignment: -0.35,
        labelType: extended
            ? NavigationRailLabelType.none
            : NavigationRailLabelType.all,
        leading: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          child: extended
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.menu_book_rounded, color: colorScheme.primary),
                    const SizedBox(width: 12),
                    Text(
                      'FitBook',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                )
              : Icon(
                  Icons.menu_book_rounded,
                  color: colorScheme.primary,
                  size: 30,
                ),
        ),
        trailing: Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: extended
                  ? FilledButton.tonalIcon(
                      onPressed: onOpenSettings,
                      icon: const Icon(Icons.settings_outlined),
                      label: const Text('Settings'),
                    )
                  : IconButton.filledTonal(
                      onPressed: onOpenSettings,
                      tooltip: 'Settings',
                      icon: const Icon(Icons.settings_outlined),
                    ),
            ),
          ),
        ),
        onDestinationSelected: onTap,
        destinations: tabs
            .map(
              (tab) => NavigationRailDestination(
                icon: Icon(iconForTab(tab)),
                selectedIcon: Icon(iconForTab(tab)),
                label: Text(labelForTab(tab), key: Key(tab)),
              ),
            )
            .toList(),
      ),
    );
  }
}
