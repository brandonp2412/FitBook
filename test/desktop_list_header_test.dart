import 'package:fit_book/desktop_list_header.dart';
import 'package:fit_book/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Desktop header selects and clears the whole visible table', (
    tester,
  ) async {
    var toggles = 0;

    Future<void> showHeader(int selectedCount) => tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(
              body: DesktopListHeader(
                totalCount: 3,
                selectedCount: selectedCount,
                onToggleAll: () => toggles++,
              ),
            ),
          ),
        );

    await showHeader(0);
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, false);
    await tester.tap(find.text('Select all'));
    expect(toggles, 1);

    await showHeader(1);
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isNull);
    await tester.tap(find.byType(Checkbox));
    expect(toggles, 2);

    await showHeader(3);
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, true);
    await tester.tap(find.text('Select all'));
    expect(toggles, 3);
  });
}
