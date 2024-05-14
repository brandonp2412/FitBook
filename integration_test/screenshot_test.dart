import 'package:drift/drift.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/diary_page.dart';
import 'package:fit_book/foods_page.dart';
import 'package:fit_book/graph_page.dart';
import 'package:fit_book/main.dart' as app;
import 'package:fit_book/settings_page.dart';
import 'package:fit_book/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

List<FoodsCompanion> foods = [
  FoodsCompanion.insert(
    name: "Bacon & Eggs on Toast",
    calories: const Value(375),
    proteinG: const Value(17),
    fatG: const Value(20),
    carbohydrateG: const Value(12),
    id: const Value(0),
  ),
  FoodsCompanion.insert(
    name: "Coca cola",
    calories: const Value(139),
    proteinG: const Value(0),
    fatG: const Value(0),
    carbohydrateG: const Value(35),
    id: const Value(1),
  ),
  FoodsCompanion.insert(
    name: "Chicken drumsticks",
    calories: const Value(167),
    proteinG: const Value(21.9),
    fatG: const Value(8.2),
    carbohydrateG: const Value(0),
    id: const Value(2),
  ),
  FoodsCompanion.insert(
    name: "Chicken sushi",
    calories: const Value(37),
    proteinG: const Value(2.25),
    fatG: const Value(0.725),
    carbohydrateG: const Value(4),
    id: const Value(3),
  ),
  FoodsCompanion.insert(
    name: "Roast pork",
    calories: const Value(180),
    proteinG: const Value(21),
    fatG: const Value(11),
    carbohydrateG: const Value(0),
    id: const Value(4),
  ),
];

List<EntriesCompanion> entries = [
  EntriesCompanion.insert(
    food: 0,
    created: DateTime.now(),
    quantity: 200,
    unit: 'grams',
    kCalories: const Value(600),
    proteinG: const Value(40),
  ),
  EntriesCompanion.insert(
    food: 1,
    created: DateTime.now(),
    quantity: 500,
    unit: 'milliliters',
    kCalories: const Value(250),
    proteinG: const Value(0),
  ),
  EntriesCompanion.insert(
    food: 2,
    created: DateTime.now(),
    quantity: 300,
    unit: 'grams',
    kCalories: const Value(250),
    proteinG: const Value(90),
  ),
  EntriesCompanion.insert(
    food: 3,
    created: DateTime.now(),
    quantity: 250,
    unit: 'grams',
    kCalories: const Value(230),
    proteinG: const Value(30),
  ),
  EntriesCompanion.insert(
    food: 4,
    created: DateTime.now(),
    quantity: 250,
    unit: 'grams',
    kCalories: const Value(543),
    proteinG: const Value(80),
  ),
  EntriesCompanion.insert(
    food: 0,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 250,
    unit: 'grams',
    kCalories: const Value(900),
    proteinG: const Value(40),
  ),
  EntriesCompanion.insert(
    food: 1,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 600,
    unit: 'milliliters',
    kCalories: const Value(850),
    proteinG: const Value(0),
  ),
  EntriesCompanion.insert(
    food: 2,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 400,
    unit: 'grams',
    kCalories: const Value(350),
    proteinG: const Value(90),
  ),
  EntriesCompanion.insert(
    food: 3,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 350,
    unit: 'grams',
    kCalories: const Value(430),
    proteinG: const Value(30),
  ),
  EntriesCompanion.insert(
    food: 4,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 251,
    unit: 'grams',
    kCalories: const Value(743),
    proteinG: const Value(80),
  ),
  EntriesCompanion.insert(
    food: 0,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 500,
    unit: 'grams',
    kCalories: const Value(100),
    proteinG: const Value(40),
  ),
  EntriesCompanion.insert(
    food: 1,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 600,
    unit: 'milliliters',
    kCalories: const Value(150),
    proteinG: const Value(0),
  ),
  EntriesCompanion.insert(
    food: 2,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 800,
    unit: 'grams',
    kCalories: const Value(150),
    proteinG: const Value(90),
  ),
  EntriesCompanion.insert(
    food: 3,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 750,
    unit: 'grams',
    kCalories: const Value(130),
    proteinG: const Value(30),
  ),
  EntriesCompanion.insert(
    food: 4,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 250,
    unit: 'grams',
    kCalories: const Value(343),
    proteinG: const Value(80),
  ),
];

enum TabBarState { diary, graph, foods }

const screenshotFood = "Chicken sushi";

Future<void> appWrapper() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsState = SettingsState();
  await settingsState.init();
  settingsState.setTheme(ThemeMode.dark);
  runApp(app.appProviders(settingsState));
}

BuildContext getBuildContext(WidgetTester tester, TabBarState? tabBarState) {
  switch (tabBarState) {
    case TabBarState.diary:
      return (tester.state(find.byType(DiaryPage)) as DiaryPageState)
          .navigatorKey
          .currentContext!;
    case TabBarState.graph:
      return (tester.state(find.byType(GraphPage)) as GraphPageState).context;
    case TabBarState.foods:
      return (tester.state(find.byType(FoodsPage)) as FoodsPageState)
          .navigatorKey
          .currentContext!;
    case null:
      break;
  }

  return tester.element(find.byType(TabBarView));
}

void navigateTo({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

Future<void> generateScreenshot({
  required IntegrationTestWidgetsFlutterBinding binding,
  required WidgetTester tester,
  required String screenshotName,
  required TabBarState tabBarState,
  Future<void> Function(BuildContext context)? navigateToPage,
  bool skipSettle = false,
}) async {
  await appWrapper();
  await tester.pumpAndSettle();

  final controllerState = getBuildContext(tester, null);
  DefaultTabController.of(controllerState).index = tabBarState.index;
  await tester.pumpAndSettle();

  if (navigateToPage != null) {
    final navState = getBuildContext(tester, tabBarState);
    await navigateToPage(navState);
  }

  skipSettle ? await tester.pump() : await tester.pumpAndSettle();
  await binding.convertFlutterSurfaceToImage();
  skipSettle ? await tester.pump() : await tester.pumpAndSettle();
  await binding.takeScreenshot(screenshotName);
}

void main() {
  IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    app.db = AppDatabase();
    await app.db.entries.deleteAll();
    await app.db.foods.deleteAll();
    await app.db.weights.deleteAll();

    await app.db.entries.insertAll(entries);
    await app.db.foods.insertAll(foods);
  });

  group("Generate default screenshots ", () {
    testWidgets(
      "PlanPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '1_en-US',
        tabBarState: TabBarState.diary,
      ),
    );

    testWidgets(
      "GraphPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '2_en-US',
        navigateToPage: (context) async => navigateTo(
          context: context,
          page: const GraphPage(),
        ),
        tabBarState: TabBarState.graph,
      ),
    );

    testWidgets(
      "SettingsPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '3_en-US',
        navigateToPage: (context) async => navigateTo(
          context: context,
          page: const SettingsPage(),
        ),
        tabBarState: TabBarState.diary,
      ),
    );

    testWidgets(
      "FoodsPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '4_en-US',
        navigateToPage: (context) async {
          navigateTo(
            context: context,
            page: const FoodsPage(),
          );
        },
        tabBarState: TabBarState.foods,
      ),
    );
  });
}