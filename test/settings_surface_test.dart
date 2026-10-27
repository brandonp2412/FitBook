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
              Tooltip(
                message: 'Toggle feature',
                child: ListTile(
                  title: const Text('Feature'),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'system', label: Text('System')),
                    ButtonSegment(value: 'dark', label: Text('Dark')),
                  ],
                  selected: const {'system'},
                  onSelectionChanged: (_) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final cards = find.byType(Card);
    final tiles = find.byType(ListTile);
    expect(tester.getRect(tiles.first), tester.getRect(cards.first));
    expect(tester.getRect(tiles.at(1)), tester.getRect(cards.at(1)));
    expect(
      tester.getSize(cards.first).height,
      tester.getSize(cards.at(1)).height,
    );
    expect(
      tester.getSize(cards.first).height,
      tester.getSize(cards.at(2)).height,
    );
    expect(
      tester.getCenter(find.byType(SegmentedButton<String>)).dy,
      closeTo(tester.getCenter(cards.at(2)).dy, 1),
    );
  });
}
