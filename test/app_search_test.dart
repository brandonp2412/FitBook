import 'package:fit_book/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  testWidgets('search popup uses one interactive hover layer', (
    WidgetTester tester,
  ) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      localizedApp(
        home: Scaffold(
          body: AppSearch(
            selected: const {},
            onChange: (_) {},
            onClear: () {},
            onEdit: () {},
            onDelete: () {},
            onSelect: () {},
            onFavorite: () {},
            ctrl: controller,
          ),
        ),
      ),
    );

    await tester.tap(find.byTooltip('Show menu'));
    await tester.pumpAndSettle();

    final selectAllTile = tester.widget<ListTile>(
      find.widgetWithText(ListTile, 'Select all'),
    );
    expect(selectAllTile.onTap, isNull);
  });
}
