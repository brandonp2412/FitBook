import 'package:drift/drift.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/empty_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/search_open_food_facts.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

void main() {
  testWidgets('Open Food Facts starts with search guidance',
      (WidgetTester tester) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => settingsState),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: localizedApp(home: const SearchOpenFoodFacts()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Search Open Food Facts'), findsNWidgets(2));
    expect(
      find.text('Enter a food name above, then submit to search.'),
      findsOneWidget,
    );
    expect(find.text('No products found'), findsNothing);

    // Simulate an empty completed search without calling the external API.
    final dynamic searchState = tester.state(find.byType(SearchOpenFoodFacts));
    searchState.setState(() {
      searchState.hasSearched = true;
    });
    await tester.pumpAndSettle();

    expect(find.text('No matching products'), findsOneWidget);
    final emptyState = tester.widget<AppEmptyState>(find.byType(AppEmptyState));
    expect(emptyState.actionLabel, equals(null));
    expect(emptyState.onAction, equals(null));

    await db.close();
  });
}
