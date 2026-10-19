import 'package:fit_book/settings/settings_surface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Desktop setting tiles fill their hoverable card',
      (tester) async {
    tester.view.physicalSize = const Size(1600, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SettingsSurface(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListTile(
                  title: const Text('Fields'),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );

    expect(
      tester.getRect(find.byType(ListTile)),
      tester.getRect(find.byType(Card)),
    );
  });
}
