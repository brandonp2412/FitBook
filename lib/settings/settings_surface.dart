import 'package:fit_book/bottom_nav.dart';
import 'package:flutter/material.dart';

class SettingsSurface extends StatelessWidget {
  const SettingsSurface({
    super.key,
    required this.children,
    this.maxWidth = 1100,
  });

  final List<Widget> children;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final desktop = usesSideNavigation(context);

    return AdaptivePageBody(
      maxWidth: maxWidth,
      child: Padding(
        padding: EdgeInsets.all(desktop ? 24 : 8),
        child: desktop
            ? LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = (constraints.maxWidth - 16) / 2;
                  Widget cardContent(Widget child) {
                    if (child is Padding && child.child != null) {
                      return cardContent(child.child!);
                    }
                    if (child is Tooltip && child.child != null) {
                      return Tooltip(
                        message: child.message,
                        child: cardContent(child.child!),
                      );
                    }
                    if (child is ListTile ||
                        child is SwitchListTile ||
                        child is CheckboxListTile ||
                        child is RadioListTile) {
                      return child;
                    }
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: child,
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        for (final child in children)
                          SizedBox(
                            width: itemWidth,
                            child: Card(
                              margin: EdgeInsets.zero,
                              clipBehavior: Clip.antiAlias,
                              child: SizedBox(
                                height: 120,
                                child: cardContent(child),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              )
            : ListView(children: children),
      ),
    );
  }
}
