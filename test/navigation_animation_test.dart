import 'package:fit_book/settings/navigation_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('provides five navigation animation variants', () {
    expect(NavigationAnimation.values, hasLength(5));
    expect(NavigationAnimation.fromValue('slide'), NavigationAnimation.slide);
    expect(NavigationAnimation.fromValue('invalid'), NavigationAnimation.fade);
  });

  test('applies the selected animation to every platform', () {
    final theme = navigationTransitionsTheme('zoom');

    for (final platform in TargetPlatform.values) {
      expect(theme.builders[platform], isA<ZoomPageTransitionsBuilder>());
    }
  });

  test('none has no push or pop transition duration', () {
    final theme = navigationTransitionsTheme('none');

    for (final platform in TargetPlatform.values) {
      final builder = theme.builders[platform]!;
      expect(builder.transitionDuration, Duration.zero);
      expect(builder.reverseTransitionDuration, Duration.zero);
    }
  });
}
