import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/entry/diary_page.dart';
import 'package:fit_book/entry/edit_entry_page.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/food/food_page.dart';
import 'package:fit_book/graph_page.dart';
import 'package:fit_book/main.dart' as app;
import 'package:fit_book/settings/settings_page.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/weight/edit_weight_page.dart';
import 'package:fit_book/weight/weight_page.dart';
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
  ),
  EntriesCompanion.insert(
    food: 1,
    created: DateTime.now(),
    quantity: 500,
    unit: 'milliliters',
  ),
  EntriesCompanion.insert(
    food: 2,
    created: DateTime.now(),
    quantity: 300,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 3,
    created: DateTime.now(),
    quantity: 250,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 4,
    created: DateTime.now(),
    quantity: 250,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 0,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 250,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 1,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 600,
    unit: 'milliliters',
  ),
  EntriesCompanion.insert(
    food: 2,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 400,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 3,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 350,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 4,
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 251,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 0,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 500,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 1,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 600,
    unit: 'milliliters',
  ),
  EntriesCompanion.insert(
    food: 2,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 800,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 3,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 750,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 4,
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 250,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 4,
    created: DateTime.now().subtract(const Duration(days: 3)),
    quantity: 250,
    unit: 'grams',
  ),
  EntriesCompanion.insert(
    food: 4,
    created: DateTime.now().subtract(const Duration(days: 4)),
    quantity: 250,
    unit: 'grams',
  ),
];

List<WeightsCompanion> weights = [
  WeightsCompanion.insert(created: DateTime.now(), unit: 'kg', amount: 70),
  WeightsCompanion.insert(
    created: DateTime.now().subtract(const Duration(days: 1)),
    unit: 'kg',
    amount: 71.2,
  ),
  WeightsCompanion.insert(
    created: DateTime.now().subtract(const Duration(days: 2)),
    unit: 'kg',
    amount: 68.5,
  ),
  WeightsCompanion.insert(
    created: DateTime.now().subtract(const Duration(days: 3)),
    unit: 'kg',
    amount: 71.5,
  ),
  WeightsCompanion.insert(
    created: DateTime.now().subtract(const Duration(days: 4)),
    unit: 'kg',
    amount: 73.5,
  ),
];

enum TabBarState { entry, graph, foods, weights }

const screenshotFood = "Chicken sushi";

Future<void> appWrapper() async {
  WidgetsFlutterBinding.ensureInitialized();
  await (app.db.settings.insertOnConflictUpdate(
    SettingsCompanion.insert(
      id: const Value(1),
      longDateFormat: "dd/MM/yy",
      shortDateFormat: 'd/M/yy',
      entryUnit: 'serving',
      foodUnit: 'grams',
      themeMode: ThemeMode.dark.toString(),
      dailyCalories: Value(2000),
      diarySummary: DiarySummary.division.toString(),
      favoriteNew: false,
      positiveReinforcement: const Value(false),
      reminders: const Value(false),
      selectEntryOnSubmit: false,
      showOthers: false,
      systemColors: false,
    ),
  ));
  final settings = await (app.db.settings.select()).getSingle();
  final settingsState = SettingsState(settings);
  runApp(app.appProviders(settingsState));
}

BuildContext getBuildContext(WidgetTester tester, TabBarState? tabBarState) {
  switch (tabBarState) {
    case TabBarState.entry:
      return (tester.state(find.byType(DiaryPage)) as DiaryPageState)
          .navigatorKey
          .currentContext!;
    case TabBarState.graph:
      return (tester.state(find.byType(GraphPage)) as GraphPageState).context;
    case TabBarState.foods:
      return (tester.state(find.byType(FoodPage)) as FoodPageState)
          .navigatorKey
          .currentContext!;
    case null:
      break;
    case TabBarState.weights:
      return (tester.state(find.byType(WeightPage)) as WeightPageState)
          .navigatorKey
          .currentContext!;
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
    app.db = AppDatabase(dontLog: true);
    await app.db.entries.deleteAll();
    await app.db.foods.deleteAll();
    await app.db.weights.deleteAll();

    await app.db.entries.insertAll(entries);
    await app.db.foods.insertAll(foods);
    await app.db.weights.insertAll(weights);
  });

  group("Generate default screenshots ", () {
    testWidgets(
      "PlanPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '1_en-US',
        tabBarState: TabBarState.entry,
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
        tabBarState: TabBarState.entry,
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
            page: const FoodPage(),
          );
        },
        tabBarState: TabBarState.foods,
      ),
    );

    testWidgets(
      "WeightsPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '5_en-US',
        navigateToPage: (context) async {
          navigateTo(
            context: context,
            page: const WeightPage(),
          );
        },
        tabBarState: TabBarState.weights,
      ),
    );

    testWidgets(
      "EditWeightPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '6_en-US',
        navigateToPage: (context) async {
          navigateTo(
            context: context,
            page: EditWeightPage(
              weight: WeightsCompanion.insert(
                amount: 0,
                created: DateTime.now(),
                unit: 'kg',
              ),
            ),
          );
        },
        tabBarState: TabBarState.weights,
      ),
    );

    testWidgets(
      "EditFoodPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '7_en-US',
        navigateToPage: (context) async {
          navigateTo(
            context: context,
            page: const EditFoodPage(
              id: 1,
            ),
          );
        },
        tabBarState: TabBarState.foods,
      ),
    );

    testWidgets(
      "EditEntryPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '8_en-US',
        navigateToPage: (context) async {
          navigateTo(
            context: context,
            page: const EditEntryPage(id: null),
          );
        },
        tabBarState: TabBarState.entry,
      ),
    );
  });
}
