import 'package:fit_book/diary/diary_filters.dart';
import 'package:fit_book/food/food_filters.dart';
import 'package:fit_book/about_page.dart';
import 'package:fit_book/diary/edit_diaries_page.dart';
import 'package:fit_book/diary/repeat_entry_page.dart';
import 'package:fit_book/food/edit_foods_page.dart';
import 'package:fit_book/food/edit_meal_page.dart';
import 'package:fit_book/quick_add_page.dart';
import 'package:fit_book/search_open_food_facts.dart';
import 'package:fit_book/settings/appearance_settings.dart';
import 'package:fit_book/settings/chart_settings.dart';
import 'package:fit_book/settings/data_settings.dart';
import 'package:fit_book/settings/diary_settings.dart';
import 'package:fit_book/settings/food_settings.dart';
import 'package:fit_book/settings/open_food_facts_login.dart';
import 'package:fit_book/settings/delete_records_button.dart';
import 'package:fit_book/settings/tab_settings.dart';
import 'package:fit_book/settings/weight_settings.dart';
import 'package:fit_book/settings/whats_new.dart';
import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
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
import 'package:package_info_plus/package_info_plus.dart';

import 'screenshot_navigation.dart';

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

List<DiariesCompanion> diaries = [
  DiariesCompanion.insert(
    food: Value(0),
    created: DateTime.now(),
    quantity: 200,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(1),
    created: DateTime.now(),
    quantity: 500,
    unit: 'milliliters',
  ),
  DiariesCompanion.insert(
    food: Value(2),
    created: DateTime.now(),
    quantity: 300,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(3),
    created: DateTime.now(),
    quantity: 250,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(4),
    created: DateTime.now(),
    quantity: 250,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(0),
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 250,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(1),
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 600,
    unit: 'milliliters',
  ),
  DiariesCompanion.insert(
    food: Value(2),
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 400,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(3),
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 350,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(4),
    created: DateTime.now().subtract(const Duration(days: 1)),
    quantity: 251,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(0),
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 500,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(1),
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 600,
    unit: 'milliliters',
  ),
  DiariesCompanion.insert(
    food: Value(2),
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 800,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(3),
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 750,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(4),
    created: DateTime.now().subtract(const Duration(days: 2)),
    quantity: 250,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(4),
    created: DateTime.now().subtract(const Duration(days: 3)),
    quantity: 250,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(4),
    created: DateTime.now().subtract(const Duration(days: 4)),
    quantity: 250,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(0),
    created: DateTime.now().subtract(const Duration(days: 7)),
    quantity: 480,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(0),
    created: DateTime.now().subtract(const Duration(days: 14)),
    quantity: 560,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(0),
    created: DateTime.now().subtract(const Duration(days: 21)),
    quantity: 400,
    unit: 'grams',
  ),
  DiariesCompanion.insert(
    food: Value(0),
    created: DateTime.now().subtract(const Duration(days: 28)),
    quantity: 640,
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

enum TabBarState { diary, graph, foods, weights }

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

BuildContext getBuildContext(WidgetTester tester, TabBarState tabBarState) {
  switch (tabBarState) {
    case TabBarState.diary:
      return (tester.state(find.byType(DiaryPage)) as DiaryPageState)
          .navigatorKey
          .currentContext!;
    case TabBarState.graph:
      return (tester.state(find.byType(GraphPage)) as GraphPageState).context;
    case TabBarState.foods:
      return (tester.state(find.byType(FoodPage)) as FoodPageState)
          .navKey
          .currentContext!;
    case TabBarState.weights:
      return (tester.state(find.byType(WeightPage)) as WeightPageState)
          .navigatorKey
          .currentContext!;
  }
}

String tabNavigationKey(TabBarState tabBarState) => switch (tabBarState) {
      TabBarState.diary => 'DiaryPage',
      TabBarState.graph => 'GraphPage',
      TabBarState.foods => 'FoodPage',
      TabBarState.weights => 'WeightPage',
    };

void navigateTo({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

Future<void> generateScreenshot({
  required IntegrationTestWidgetsFlutterBinding binding,
  required WidgetTester tester,
  required String screenshotName,
  required TabBarState tabBarState,
  Future<void> Function(BuildContext context)? navigateToPage,
  bool skipSettle = false,
  Future<void> Function(WidgetTester tester)? interact,
}) async {
  await appWrapper();
  await tester.pumpAndSettle();
  expect(find.textContaining('New version '), findsNothing);

  await selectScreenshotTab(tester, tabNavigationKey(tabBarState));

  if (navigateToPage != null) {
    final navState = getBuildContext(tester, tabBarState);
    // ignore: use_build_context_synchronously
    await navigateToPage(navState);
  }

  skipSettle ? await tester.pump() : await tester.pumpAndSettle();
  if (interact != null) {
    await interact(tester);
    await tester.pumpAndSettle();
  }
  await binding.convertFlutterSurfaceToImage();
  skipSettle ? await tester.pump() : await tester.pumpAndSettle();
  await binding.takeScreenshot(screenshotName);
}

void main() {
  IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    app.db = AppDatabase(dontLog: true);
    await app.db.mealFoods.deleteAll();
    await app.db.diaries.deleteAll();
    await app.db.meals.deleteAll();
    await app.db.foods.deleteAll();
    await app.db.weights.deleteAll();
    await app.db.metadata.deleteAll();

    await app.db.foods.insertAll(foods);
    await app.db.diaries.insertAll(diaries);
    await app.db.weights.insertAll(weights);
    if (Uri.base.queryParameters['gallery'] == 'full') {
      await app.db.meals.insertOne(
        MealsCompanion.insert(
          id: const Value(1),
          name: 'Lunch',
          created: DateTime.now(),
        ),
      );
      await app.db.mealFoods.insertAll([
        MealFoodsCompanion.insert(
          meal: 1,
          food: 2,
          quantity: 150,
          unit: 'grams',
        ),
        MealFoodsCompanion.insert(
          meal: 1,
          food: 3,
          quantity: 100,
          unit: 'grams',
        ),
      ]);
    }

    final packageInfo = await PackageInfo.fromPlatform();
    final buildNumber = int.parse(packageInfo.buildNumber);
    await app.db.metadata.insertOne(
      MetadataCompanion(buildNumber: Value(buildNumber)),
    );
  });

  if (Uri.base.queryParameters['gallery'] == 'full') {
    group('Full gallery', () {
      testWidgets('settings-appearance', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-settings-appearance',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const AppearanceSettings()),
        );
      });
      testWidgets('settings-diary', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-settings-diary',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const DiarySettings()),
        );
      });
      testWidgets('settings-food', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-settings-food',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const FoodSettings()),
        );
      });
      testWidgets('settings-weight', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-settings-weight',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const WeightSettings()),
        );
      });
      testWidgets('settings-charts', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-settings-charts',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const ChartSettingsPage()),
        );
      });
      testWidgets('settings-tabs', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-settings-tabs',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const TabSettings()),
        );
      });
      testWidgets('settings-data', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-settings-data',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const DataSettings()),
        );
      });
      testWidgets('about', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-about',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const AboutPage()),
        );
      });
      testWidgets('whats-new', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-whats-new',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const WhatsNew()),
        );
      });
      testWidgets('open-food-facts-login', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-open-food-facts-login',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const DataSettings()),
          interact: (tester) async {
            final login = find.byType(OpenFoodFactsLogin);
            await tester.ensureVisible(login);
            await tester.tap(login);
          },
        );
      });
      testWidgets('open-food-facts-search', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-open-food-facts-search',
          tabBarState: TabBarState.foods,
          navigateToPage: (context) async => navigateTo(
            context: context,
            page: const SearchOpenFoodFacts(),
          ),
        );
      });
      testWidgets('quick-add', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-quick-add',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const QuickAddPage()),
        );
      });
      testWidgets('meal-create', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-meal-create',
          tabBarState: TabBarState.foods,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const EditMealPage()),
        );
      });
      testWidgets('food-create', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-food-create',
          tabBarState: TabBarState.foods,
          navigateToPage: (context) async => navigateTo(
            context: context,
            page: const EditFoodPage(id: null),
          ),
        );
      });
      testWidgets('foods-bulk-edit', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-foods-bulk-edit',
          tabBarState: TabBarState.foods,
          navigateToPage: (context) async => navigateTo(
            context: context,
            page: const EditFoodsPage(ids: [0, 1]),
          ),
        );
      });
      testWidgets('diary-edit', (tester) async {
        final diaryIds =
            (await app.db.diaries.select().get()).map((row) => row.id).toList();
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-diary-edit',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async => navigateTo(
            context: context,
            page: EditDiaryPage(id: diaryIds.first),
          ),
        );
      });
      testWidgets('diary-bulk-edit', (tester) async {
        final diaryIds =
            (await app.db.diaries.select().get()).map((row) => row.id).toList();
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-diary-bulk-edit',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async => navigateTo(
            context: context,
            page: EditDiariesPage(diaryIds: diaryIds.take(2).toList()),
          ),
        );
      });
      testWidgets('diary-repeat', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-diary-repeat',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async => navigateTo(
            context: context,
            page: RepeatEntryPage(
              foodId: 0,
              mealId: null,
              quantity: 200,
              unit: 'grams',
              initialDate: DateTime.now(),
            ),
          ),
        );
      });
      testWidgets('weight-edit', (tester) async {
        final weight = (await app.db.weights.select().get()).first;
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-weight-edit',
          tabBarState: TabBarState.weights,
          navigateToPage: (context) async => navigateTo(
            context: context,
            page: EditWeightPage(
              weight: weight.toCompanion(true),
            ),
          ),
        );
      });
      testWidgets('diary-filters', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-diary-filters',
          tabBarState: TabBarState.diary,
          interact: (tester) async {
            await tester.tap(
              find
                  .descendant(
                    of: find.byType(DiaryFilters),
                    matching: find.byType(IconButton),
                  )
                  .first,
            );
          },
        );
      });
      testWidgets('food-filters', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-food-filters',
          tabBarState: TabBarState.foods,
          interact: (tester) async {
            await tester.tap(
              find
                  .descendant(
                    of: find.byType(FoodFilters),
                    matching: find.byType(IconButton),
                  )
                  .first,
            );
          },
        );
      });
      testWidgets('meal-food-picker', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-meal-food-picker',
          tabBarState: TabBarState.foods,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const EditMealPage()),
          interact: (tester) async {
            await tester.tap(find.text('Add food').first);
          },
        );
      });
      testWidgets('settings-search', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-settings-search',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const SettingsPage()),
          interact: (tester) async {
            await tester.enterText(
              find.descendant(
                of: find.byType(SearchBar),
                matching: find.byType(EditableText),
              ),
              'calories',
            );
          },
        );
      });

      testWidgets('meal-edit', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-meal-edit',
          tabBarState: TabBarState.foods,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const EditMealPage(id: 1)),
        );
      });
      testWidgets('nutrition-details', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-nutrition-details',
          tabBarState: TabBarState.diary,
          interact: (tester) async {
            final button = find.byWidgetPredicate(
              (widget) =>
                  widget is Semantics &&
                  widget.properties.label == 'Nutrition details',
            );
            await tester.tap(button.first);
          },
        );
      });
      testWidgets('graph-weight', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-graph-weight',
          tabBarState: TabBarState.graph,
          interact: (tester) async {
            await tester.tap(find.byType(DropdownButton<String>));
            await tester.pumpAndSettle();
            await tester.tap(find.text('Body weight').last);
          },
        );
      });
      testWidgets('graph-metric-picker', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-graph-metric-picker',
          tabBarState: TabBarState.graph,
          interact: (tester) async =>
              tester.tap(find.byType(DropdownButton<String>)),
        );
      });
      testWidgets('data-delete-picker', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-data-delete-picker',
          tabBarState: TabBarState.diary,
          navigateToPage: (context) async =>
              navigateTo(context: context, page: const DataSettings()),
          interact: (tester) async {
            final button = find.byType(DeleteRecordsButton);
            await tester.ensureVisible(button);
            await tester.tap(button);
          },
        );
      });
      testWidgets('diary-search-empty', (tester) async {
        await generateScreenshot(
          binding: binding,
          tester: tester,
          screenshotName: 'full-diary-search-empty',
          tabBarState: TabBarState.diary,
          interact: (tester) async {
            await tester.enterText(
              find.byType(EditableText).first,
              'No matching food',
            );
          },
        );
      });
    });
    return;
  }

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
        tabBarState: TabBarState.graph,
      ),
    );

    testWidgets(
      "SettingsPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '3_en-US',
        navigateToPage: (context) async =>
            navigateTo(context: context, page: const SettingsPage()),
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
          navigateTo(context: context, page: const FoodPage());
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
          navigateTo(context: context, page: const WeightPage());
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
          navigateTo(context: context, page: const EditFoodPage(id: 1));
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
          navigateTo(context: context, page: const EditDiaryPage(id: null));
        },
        tabBarState: TabBarState.diary,
      ),
    );
  });
}
