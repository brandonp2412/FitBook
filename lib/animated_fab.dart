import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  final VoidCallback onTap;
  final String label;
  final ScrollController scroll;
  final IconData icon;

  const AnimatedFab({
    super.key,
    required this.onTap,
    required this.label,
    required this.scroll,
    required this.icon,
  });

  @override
  State<AnimatedFab> createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab> {
  bool extend = true;

  @override
  void initState() {
    super.initState();
    widget.scroll.addListener(onScroll);
  }

  @override
  void dispose() {
    widget.scroll.removeListener(onScroll);
    super.dispose();
  }

  void onScroll() {
    final newExtend =
        widget.scroll.position.atEdge && widget.scroll.position.pixels == 0;
    if (extend != newExtend) {
      setState(() {
        extend = newExtend;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: extend ? 100 : 56,
      height: 56,
      child: FloatingActionButton.extended(
        tooltip: widget.label,
        onPressed: widget.onTap,
        heroTag: 'hero',
        label: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: extend ? 1.0 : 0.0,
          child: Text(widget.label),
        ),
        icon: Icon(widget.icon),
        isExtended: extend,
      ),
    );
  }
}
