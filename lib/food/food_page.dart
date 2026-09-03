import 'package:drift/drift.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/food/edit_foods_page.dart';
import 'package:fit_book/food/edit_meal_page.dart';
import 'package:fit_book/food/food_filters.dart';
import 'package:fit_book/food/food_list.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/speed_dial_fab.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => FoodPageState();
}

class FoodPageState extends State<FoodPage> with AutomaticKeepAliveClientMixin {
  late Stream<List<TypedResult>> stream;
  late Stream<List<Meal>> mealStream;
  late Stream<Map<int, ({double calories, double protein})>> mealCaloriesStream;

  final TextEditingController searchCtrl = TextEditingController();
  final groupCtrl = TextEditingController();
  final TextEditingController gtController = TextEditingController();
  final TextEditingController ltController = TextEditingController();
  final Set<int> selected = {};
  final Set<int> selectedMeals = {};
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  final ScrollController scrollCtrl = ScrollController();

  String search = '';
  int limit = 100;

  String? _servingUnit;

  @override
  void initState() {
    super.initState();

    final state = context.read<DiaryState>();
    groupCtrl.text = state.foodGroup ?? "";
    setStream();
    setMealStream();
    _setMealCaloriesStream();
  }

  void setStream() {
    final lastDiaryEntry = db.diaries.created.max();
    var query = (db.foods.selectOnly().join([
      leftOuterJoin(db.diaries, db.diaries.food.equalsExp(db.foods.id)),
    ])
      ..addColumns([
        db.foods.id,
        db.foods.name,
        db.foods.calories,
        db.foods.favorite,
        db.foods.servingSize,
        db.foods.servingUnit,
        db.foods.smallImage,
        db.foods.imageFile,
        db.foods.created,
        lastDiaryEntry,
      ])
      ..groupBy([db.foods.id])
      ..limit(limit));

    if (search.isNotEmpty) {
      final searchLower = search.toLowerCase();
      query = query
        ..where(db.foods.name.contains(searchLower))
        ..orderBy([
          OrderingTerm(
            expression: db.foods.name.lower().equals(searchLower),
            mode: OrderingMode.desc,
          ),
          OrderingTerm(
            expression: db.foods.name.lower().like('$searchLower%'),
            mode: OrderingMode.desc,
          ),
          OrderingTerm(
            expression: db.foods.favorite,
            mode: OrderingMode.desc,
          ),
          OrderingTerm(
            expression: db.foods.created,
            mode: OrderingMode.desc,
          ),
          OrderingTerm(expression: lastDiaryEntry, mode: OrderingMode.desc),
        ]);
    } else {
      query = query
        ..orderBy([
          OrderingTerm(
            expression: db.foods.created,
            mode: OrderingMode.desc,
          ),
          OrderingTerm(expression: lastDiaryEntry, mode: OrderingMode.desc),
        ]);
    }
    if (groupCtrl.text.isNotEmpty)
      query = query..where(db.foods.foodGroup.like('%${groupCtrl.text}%'));
    if (_servingUnit != null)
      query = query..where(db.foods.servingUnit.equals(_servingUnit!));
    if (gtController.text.isNotEmpty)
      query = query
        ..where(
          db.foods.servingSize
              .isBiggerThanValue(double.parse(gtController.text)),
        );
    if (ltController.text.isNotEmpty)
      query = query
        ..where(
          db.foods.servingSize
              .isSmallerThanValue(double.parse(ltController.text)),
        );

    setState(() {
      stream = query.watch();
    });
  }

  void setMealStream() {
    var query = db.meals.select()
      ..orderBy([
        (t) => OrderingTerm(expression: t.created, mode: OrderingMode.desc),
      ]);
    if (search.isNotEmpty)
      query = query..where((t) => t.name.contains(search.toLowerCase()));
    setState(() {
      mealStream = query.watch();
    });
  }

  void _setMealCaloriesStream() {
    setState(() {
      mealCaloriesStream = db
          .customSelect(
            """
SELECT meal_foods.meal,
${mealFoodsFieldSumSql('calories')} AS total_cal,
${mealFoodsFieldSumSql('protein_g')} AS total_protein
FROM meal_foods
INNER JOIN foods ON foods.id = meal_foods.food
GROUP BY meal_foods.meal
""",
            readsFrom: {db.mealFoods, db.foods},
          )
          .watch()
          .map(
            (rows) => {
              for (final row in rows)
                row.read<int>('meal'): (
                  calories: row.read<double>('total_cal'),
                  protein: row.read<double>('total_protein'),
                ),
            },
          );
    });
  }

  List<FoodListFood> resultsToCompanions(List<TypedResult> results) => results
      .map(
        (result) => FoodListFood(
          food: FoodsCompanion(
            id: Value(result.read(db.foods.id)!),
            name: Value(result.read(db.foods.name)!),
            calories: Value(result.read(db.foods.calories)),
            favorite: Value(result.read(db.foods.favorite)),
            servingSize: Value(result.read(db.foods.servingSize)),
            servingUnit: Value(result.read(db.foods.servingUnit)),
            imageFile: Value(result.read(db.foods.imageFile)),
            smallImage: Value(result.read(db.foods.smallImage)),
            created: Value(result.read(db.foods.created)),
          ),
          lastDiaryEntry: result.read(db.diaries.created.max()),
        ),
      )
      .toList();

  Set<int> get _allSelected => {...selected, ...selectedMeals};

  Widget _libraryPanel(
    BuildContext context, {
    required List<FoodListFood> foods,
    required List<Meal> meals,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final recent = foods.take(4).toList();

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: material.Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Food library',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${foods.length} foods · ${meals.length} meals',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            if (recent.isNotEmpty) ...[
              Text(
                'Recently used',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colors.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              ...recent.map(
                (item) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  leading: const Icon(Icons.restaurant_outlined),
                  title: Text(item.food.name.value),
                  trailing: item.food.calories.value == null
                      ? null
                      : Text(
                          '${item.food.calories.value!.toStringAsFixed(0)} kcal',
                        ),
                  onTap: () => navKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => EditFoodPage(
                        id: item.food.id.value,
                        onSavedNew: () => scrollCtrl.animateTo(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(height: 32),
            ],
            Text(
              'Quick actions',
              style: theme.textTheme.labelLarge?.copyWith(
                color: colors.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => navKey.currentState!.push(
                  MaterialPageRoute(
                    builder: (context) => EditFoodPage(
                      onSavedNew: () => scrollCtrl.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      ),
                    ),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: const Text('Add food'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => navKey.currentState!.push(
                  MaterialPageRoute(
                    builder: (context) => const EditMealPage(),
                  ),
                ),
                icon: const Icon(Icons.restaurant_menu),
                label: const Text('Create meal'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NavigatorPopHandler(
      onPopWithResult: (result) {
        if (navKey.currentState!.canPop() == false) return;
        if (navKey.currentState?.focusNode.hasFocus == false) return;
        navKey.currentState!.pop();
      },
      child: Navigator(
        key: navKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => _foodsPage(),
          settings: settings,
        ),
      ),
    );
  }

  Scaffold _foodsPage() {
    return Scaffold(
      body: StreamBuilder<Map<int, ({double calories, double protein})>>(
        stream: mealCaloriesStream,
        builder: (context, calSnapshot) {
          final mealCalories = calSnapshot.data ?? {};
          return StreamBuilder<List<Meal>>(
            stream: mealStream,
            builder: (context, mealSnapshot) {
              final meals = mealSnapshot.data ?? [];
              return StreamBuilder(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) throw snapshot.error!;
                  final foods = resultsToCompanions(snapshot.data ?? []);

                  final items = <Object>[...meals, ...foods];
                  if (search.isEmpty) {
                    items.sort((a, b) {
                      final aDate = (a is Meal
                              ? a.created
                              : (a as FoodListFood).food.created.value) ??
                          DateTime(0);
                      final bDate = (b is Meal
                              ? b.created
                              : (b as FoodListFood).food.created.value) ??
                          DateTime(0);
                      final createdComparison = bDate.compareTo(aDate);
                      if (createdComparison != 0) return createdComparison;

                      final aLastEntry =
                          a is FoodListFood ? a.lastDiaryEntry : null;
                      final bLastEntry =
                          b is FoodListFood ? b.lastDiaryEntry : null;
                      return (bLastEntry ?? DateTime(0)).compareTo(
                        aLastEntry ?? DateTime(0),
                      );
                    });
                  }

                  final listStack = Stack(
                    children: [
                      material.Column(
                        children: [
                          if (items.isEmpty)
                            const Padding(
                              padding: EdgeInsets.only(top: appSearchHeight),
                              child: ListTile(
                                title: Text("No food yet."),
                                subtitle:
                                    Text("Tap the plus button to add foods."),
                              ),
                            ),
                          FoodList(
                            ctrl: scrollCtrl,
                            items: items,
                            mealCalories: mealCalories,
                            selected: selected,
                            selectedMeals: selectedMeals,
                            onSavedNew: () => scrollCtrl.animateTo(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            ),
                            onSelect: (id) {
                              if (selected.contains(id))
                                setState(() => selected.remove(id));
                              else
                                setState(() => selected.add(id));
                            },
                            onMealSelect: (id) {
                              if (selectedMeals.contains(id))
                                setState(() => selectedMeals.remove(id));
                              else
                                setState(() => selectedMeals.add(id));
                            },
                            onNext: () async {
                              setState(() {
                                limit += 10;
                              });
                              setStream();
                            },
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: AppSearch(
                          ctrl: searchCtrl,
                          onChange: (value) {
                            setState(() {
                              search = value;
                            });
                            setStream();
                            setMealStream();
                          },
                          filter: FoodFilters(
                            groupCtrl: groupCtrl,
                            servingUnit: _servingUnit,
                            servingSizeGtController: gtController,
                            servingSizeLtController: ltController,
                            onChange: ({
                              foodGroup,
                              servingUnit,
                            }) {
                              setState(() {
                                _servingUnit = servingUnit;
                              });
                              setStream();
                            },
                          ),
                          onClear: () => setState(() {
                            selected.clear();
                            selectedMeals.clear();
                          }),
                          onDelete: () async {
                            final selectedCopy = selected.toList();
                            final selectedMealsCopy = selectedMeals.toList();
                            setState(() {
                              selected.clear();
                              selectedMeals.clear();
                            });
                            if (selectedCopy.isNotEmpty)
                              await (db.delete(db.foods)
                                    ..where(
                                      (tbl) => tbl.id.isIn(selectedCopy),
                                    ))
                                  .go();
                            if (selectedMealsCopy.isNotEmpty) {
                              await (db.delete(db.diaries)
                                    ..where(
                                      (tbl) => tbl.meal.isIn(selectedMealsCopy),
                                    ))
                                  .go();
                              await (db.delete(db.mealFoods)
                                    ..where(
                                      (tbl) => tbl.meal.isIn(selectedMealsCopy),
                                    ))
                                  .go();
                              await (db.delete(db.meals)
                                    ..where(
                                      (tbl) => tbl.id.isIn(selectedMealsCopy),
                                    ))
                                  .go();
                            }
                          },
                          onSelect: () => setState(() {
                            selected.addAll(
                              foods.map((food) => food.food.id.value),
                            );
                          }),
                          selected: _allSelected,
                          onEdit: () async {
                            if (selected.isEmpty) return;
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditFoodsPage(
                                  ids: selected.toList(),
                                ),
                              ),
                            );
                            setState(() {
                              selected.clear();
                            });
                          },
                          onFavorite: () async {
                            if (selected.isEmpty) return;
                            final first = await (db.foods.select()
                                  ..where(
                                    (tbl) => tbl.id.equals(selected.first),
                                  ))
                                .getSingle();
                            await (db.foods.update()
                                  ..where((tbl) => tbl.id.isIn(selected)))
                                .write(
                              FoodsCompanion(
                                favorite: Value(
                                  first.favorite == true ? false : true,
                                ),
                              ),
                            );
                            setState(() {
                              selected.clear();
                            });
                          },
                        ),
                      ),
                    ],
                  );

                  if (!usesSideNavigation(context)) {
                    return AdaptivePageBody(maxWidth: 1040, child: listStack);
                  }

                  return AdaptivePageBody(
                    maxWidth: 1320,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: listStack),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 320,
                            child: _libraryPanel(
                              context,
                              foods: foods,
                              meals: meals,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: navigationBottomClearance(context),
        ),
        child: SpeedDialFab(
          onTap: () {
            navKey.currentState!.push(
              MaterialPageRoute(
                builder: (context) => EditFoodPage(
                  onSavedNew: () => scrollCtrl.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                ),
              ),
            );
          },
          label: 'Add',
          icon: Icons.add,
          scroll: scrollCtrl,
          actions: [
            SpeedDialAction(
              icon: Icons.restaurant,
              label: 'Add meal',
              onSelected: () {
                navKey.currentState!.push(
                  MaterialPageRoute(
                    builder: (context) => const EditMealPage(),
                  ),
                );
              },
            ),
            SpeedDialAction(
              icon: Icons.barcode_reader,
              label: 'Scan barcode',
              onSelected: () async {
                final result = await performBarcodeScan(context);
                if (result.food != null) {
                  navKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => EditFoodPage(id: result.food!.id),
                    ),
                  );
                } else if (result.barcode != null) {
                  navKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) =>
                          EditFoodPage(initialBarcode: result.barcode),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
