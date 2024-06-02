import 'package:fit_book/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() async {
  testWidgets('App', (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState();
    await settingsState.init();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => EntriesState()),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No entries today.'), findsOne);
    expect(find.text('Diary'), findsOne);
    expect(find.text('Graph'), findsOne);
    expect(find.text('Food'), findsOne);
    expect(find.text('Weight'), findsOne);

    await tester.tap(find.byTooltip('Show menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    await tester.enterText(find.bySemanticsLabel('Search...'), 'System');
    await tester.pumpAndSettle();
    await tester.tap(find.text('System color scheme'));
    await tester.pumpAndSettle();

    await db.close();
  });
}
