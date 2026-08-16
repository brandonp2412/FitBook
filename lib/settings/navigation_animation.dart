import 'package:flutter/material.dart';

/// The animation used when navigating between screens.
enum NavigationAnimation {
  fade('fade', 'Fade'),
  zoom('zoom', 'Zoom'),
  slide('slide', 'Slide'),
  rise('rise', 'Rise'),
  none('none', 'None');

  const NavigationAnimation(this.value, this.label);

  /// Stable value persisted in the settings database.
  final String value;

  /// User-facing name shown in appearance settings.
  final String label;

  /// Returns the saved animation, falling back to fade for unknown values.
  static NavigationAnimation fromValue(String value) => values.firstWhere(
        (animation) => animation.value == value,
        orElse: () => fade,
      );

  /// Creates the page transition used by the application theme.
  PageTransitionsBuilder get builder => switch (this) {
        fade => const FadeForwardsPageTransitionsBuilder(),
        zoom => const ZoomPageTransitionsBuilder(),
        slide => const _SlidePageTransitionsBuilder(),
        rise => const OpenUpwardsPageTransitionsBuilder(),
        none => const _NoPageTransitionsBuilder(),
      };
}

class _SlidePageTransitionsBuilder extends PageTransitionsBuilder {
  const _SlidePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final direction =
        Directionality.of(context) == TextDirection.rtl ? -1.0 : 1.0;
    return SlideTransition(
      position: animation.drive(
        Tween(
          begin: Offset(direction, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
      ),
      child: child,
    );
  }
}

class _NoPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoPageTransitionsBuilder();

  @override
  Duration get transitionDuration => Duration.zero;

  @override
  Duration get reverseTransitionDuration => Duration.zero;

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}

/// Creates platform mappings for the selected navigation animation.
PageTransitionsTheme navigationTransitionsTheme(String value) {
  final builder = NavigationAnimation.fromValue(value).builder;
  return PageTransitionsTheme(
    builders: {
      for (final platform in TargetPlatform.values) platform: builder,
    },
  );
}
