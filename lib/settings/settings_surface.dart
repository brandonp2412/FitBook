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
                    final unwrapped = child is Padding ? child.child : child;
                    if (unwrapped is ListTile ||
                        unwrapped is SwitchListTile ||
                        unwrapped is CheckboxListTile ||
                        unwrapped is RadioListTile) {
                      return unwrapped!;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 4,
                      ),
                      child: child,
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
                              child: cardContent(child),
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
