import 'package:fit_book/l10n/l10n.dart';
import 'package:flutter/material.dart';

const double largeScreenBreakpoint = 900;
const double extendedRailBreakpoint = 1200;

bool usesSideNavigation(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= largeScreenBreakpoint;

bool usesDesktopInteractions(BuildContext context) {
  if (!usesSideNavigation(context)) return false;
  return switch (Theme.of(context).platform) {
    TargetPlatform.windows ||
    TargetPlatform.macOS ||
    TargetPlatform.linux =>
      true,
    _ => false,
  };
}

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

String labelForTab(BuildContext context, String tab) {
  switch (tab) {
    case 'DiaryPage':
      return context.l10n.navDiary;
    case 'GraphPage':
      return context.l10n.navGraph;
    case 'FoodPage':
      return context.l10n.navFood;
    case 'WeightPage':
      return context.l10n.navWeight;
    default:
      return context.l10n.navError;
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
    this.desktopActions = const [],
  });

  final Widget child;
  final double maxWidth;
  final List<Widget> desktopActions;

  @override
  Widget build(BuildContext context) {
    final wide = usesSideNavigation(context);
    if (!wide) {
      return AdaptivePageBody(
        maxWidth: maxWidth,
        child: Padding(padding: const EdgeInsets.all(16), child: child),
      );
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final radius = BorderRadius.circular(12);
    final enabledBorder = OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: colorScheme.outlineVariant),
    );
    final desktopTheme = theme.copyWith(
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: colorScheme.surfaceContainerLowest,
        border: enabledBorder,
        enabledBorder: enabledBorder,
        disabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.65),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );

    final form = Theme(data: desktopTheme, child: child);
    final cardChild = desktopActions.isEmpty
        ? Padding(padding: const EdgeInsets.all(20), child: form)
        : Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: form,
                ),
              ),
              const Divider(height: 1),
              ColoredBox(
                color: colorScheme.surfaceContainerLow,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: desktopActions,
                    ),
                  ),
                ),
              ),
            ],
          );

    return AdaptivePageBody(
      maxWidth: maxWidth,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: cardChild,
        ),
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
              final label = labelForTab(context, tab);

              return Semantics(
                label: label,
                button: true,
                selected: isSelected,
                excludeSemantics: true,
                child: GestureDetector(
                  key: Key(tab),
                  onTap: () => onTap(index),
                  onLongPress:
                      !usesDesktopInteractions(context) && onLongPress != null
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
    final colors = Theme.of(context).colorScheme;
    final compact = MediaQuery.sizeOf(context).width < extendedRailBreakpoint;

    return Container(
      width: compact ? 80 : 232,
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        border: Border(right: BorderSide(color: colors.outlineVariant)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            compact ? 12 : 16,
            20,
            compact ? 12 : 16,
            16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (compact)
                Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.menu_book_rounded,
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colors.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.menu_book_rounded,
                          color: colors.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          context.l10n.appTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 24),
              ...tabs.asMap().entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: _DesktopNavItem(
                        key: Key('desktop-${entry.value}'),
                        icon: iconForTab(entry.value),
                        label: labelForTab(context, entry.value),
                        selected: entry.key == currentIndex,
                        compact: compact,
                        onTap: () => onTap(entry.key),
                      ),
                    ),
                  ),
              const Spacer(),
              const Divider(),
              const SizedBox(height: 8),
              _DesktopNavItem(
                icon: Icons.settings_rounded,
                label: context.l10n.settings,
                compact: compact,
                onTap: onOpenSettings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopNavItem extends StatelessWidget {
  const _DesktopNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
    this.compact = false,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final bool compact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final foreground =
        selected ? colors.onSecondaryContainer : colors.onSurfaceVariant;

    final child = Material(
      color: selected ? colors.secondaryContainer : Colors.transparent,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: compact
            ? SizedBox(
                height: 48,
                child: Center(child: Icon(icon, size: 22, color: foreground)),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                child: Row(
                  children: [
                    Icon(icon, size: 22, color: foreground),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: foreground,
                              fontWeight:
                                  selected ? FontWeight.w700 : FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: compact ? Tooltip(message: label, child: child) : child,
    );
  }
}
