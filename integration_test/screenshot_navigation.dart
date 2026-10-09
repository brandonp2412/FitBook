import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Navigate using the tab control rendered at the current viewport width.
Future<void> selectScreenshotTab(WidgetTester tester, String tab) async {
  final mobileTab = find.byKey(Key(tab));
  final desktopTab = find.byKey(Key('desktop-$tab'));
  final mobileCount = mobileTab.evaluate().length;
  final desktopCount = desktopTab.evaluate().length;

  expect(
    mobileCount + desktopCount,
    1,
    reason: 'Exactly one $tab navigation item must be present for the '
        'current viewport; found $mobileCount mobile and $desktopCount desktop',
  );
  await tester.tap(desktopCount == 1 ? desktopTab : mobileTab);
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
}
