import 'package:drift/drift.dart';
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/food/edit_foods_page.dart';
import 'package:fit_book/food/edit_meal_page.dart';
import 'package:fit_book/food/food_filters.dart';
import 'package:fit_book/food/food_list.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  createState() => FoodPageState();
}

class FoodPageState extends State<FoodPage> with AutomaticKeepAliveClientMixin {
  late Stream<List<TypedResult>> stream;
  late Stream<List<Meal>> mealStream;

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
  }

  void setStream() {
    var query = (db.foods.selectOnly()
      ..addColumns([
        db.foods.id,
        db.foods.name,
        db.foods.calories,
        db.foods.favorite,
        db.foods.servingSize,
        db.foods.servingUnit,
        db.foods.smallImage,
        db.foods.imageFile,
      ])
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
        ]);
    } else {
      query = query
        ..orderBy([
          OrderingTerm(
            expression: db.foods.favorite,
            mode: OrderingMode.desc,
          ),
          OrderingTerm(
            expression: db.foods.created,
            mode: OrderingMode.desc,
          ),
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

  List<FoodsCompanion> resultsToCompanions(List<TypedResult> results) => results
      .map(
        (result) => FoodsCompanion(
          id: Value(result.read(db.foods.id)!),
          name: Value(result.read(db.foods.name)!),
          calories: Value(result.read(db.foods.calories)),
          favorite: Value(result.read(db.foods.favorite)),
          servingSize: Value(result.read(db.foods.servingSize)),
          servingUnit: Value(result.read(db.foods.servingUnit)),
          imageFile: Value(result.read(db.foods.imageFile)),
          smallImage: Value(result.read(db.foods.smallImage)),
        ),
      )
      .toList();

  Set<int> get _allSelected => {...selected, ...selectedMeals};

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
      body: StreamBuilder<List<Meal>>(
        stream: mealStream,
        builder: (context, mealSnapshot) {
          final meals = mealSnapshot.data ?? [];
          return StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) throw snapshot.error!;
              final foods = resultsToCompanions(snapshot.data ?? []);

              return material.Column(
                children: [
                  AppSearch(
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
                              ..where((tbl) => tbl.id.isIn(selectedCopy)))
                            .go();
                      if (selectedMealsCopy.isNotEmpty) {
                        await (db.delete(db.mealFoods)
                              ..where(
                                (tbl) => tbl.meal.isIn(selectedMealsCopy),
                              ))
                            .go();
                        await (db.delete(db.meals)
                              ..where((tbl) => tbl.id.isIn(selectedMealsCopy)))
                            .go();
                      }
                    },
                    onSelect: () => setState(() {
                      selected.addAll(foods.map((food) => food.id.value));
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
                            ..where((tbl) => tbl.id.equals(selected.first)))
                          .getSingle();
                      await (db.foods.update()
                            ..where((tbl) => tbl.id.isIn(selected)))
                          .write(
                        FoodsCompanion(
                          favorite:
                              Value(first.favorite == true ? false : true),
                        ),
                      );
                      setState(() {
                        selected.clear();
                      });
                    },
                  ),
                  if (snapshot.data?.isEmpty == true && meals.isEmpty)
                    const ListTile(
                      title: Text("No food yet."),
                      subtitle: Text("Tap the plus button to add foods."),
                    ),
                  FoodList(
                    ctrl: scrollCtrl,
                    foods: foods,
                    meals: meals,
                    selected: selected,
                    selectedMeals: selectedMeals,
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
              );
            },
          );
        },
      ),
      floatingActionButton: material.Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: 'addMeal',
            tooltip: 'Add meal',
            onPressed: () {
              navKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => const EditMealPage(),
                ),
              );
            },
            child: const Icon(Icons.restaurant),
          ),
          const SizedBox(height: 8),
          AnimatedFab(
            onTap: () async {
              navKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => const EditFoodPage(),
                ),
              );
            },
            label: 'Add',
            icon: Icons.add,
            scroll: scrollCtrl,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
