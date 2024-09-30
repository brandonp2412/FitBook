import 'package:fit_book/shared/widgets/open_container_wrapper.dart';
import 'package:flutter/material.dart';

@immutable
class OpenContainerFAB extends StatelessWidget {
  final Widget Function() onTap;
  final String tooltip;
  final Icon icon;
  final double size;
  final double borderRadius;
  final Color? background;

  const OpenContainerFAB({
    required this.onTap,
    this.tooltip = 'Add',
    this.icon = const Icon(Icons.add),
    this.size = 56.0,
    this.borderRadius = 16,
    this.background,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainerWrapper(
      duration: const Duration(milliseconds: 500),
      closedElevation: 6,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      closedColor: background ?? Theme.of(context).colorScheme.primaryContainer,
      tooltip: tooltip,
      closedChild: SizedBox(
        width: size,
        height: size,
        child: icon,
      ),
      openChild: onTap.call(),
    );
  }
}
