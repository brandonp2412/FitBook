import 'package:drift/drift.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/food/edit_foods_page.dart';
import 'package:fit_book/food/food_filters.dart';
import 'package:fit_book/food/food_list.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  createState() => FoodPageState();
}

class FoodPageState extends State<FoodPage> with AutomaticKeepAliveClientMixin {
  late Stream<List<TypedResult>> stream;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController servingSizeGtController = TextEditingController();
  final TextEditingController servingSizeLtController = TextEditingController();
  final Set<int> selected = {};
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String search = '';
  int limit = 100;

  String? _foodGroup;
  String? _servingUnit;

  @override
  void initState() {
    super.initState();
    setStream();
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
      ..orderBy([
        OrderingTerm(
          expression: db.foods.favorite,
          mode: OrderingMode.desc,
        ),
        OrderingTerm(
          expression: db.foods.created,
          mode: OrderingMode.desc,
        ),
      ])
      ..limit(limit));

    if (search.isNotEmpty)
      query = query..where(db.foods.name.contains(search.toLowerCase()));
    if (_foodGroup != null)
      query = query..where(db.foods.foodGroup.equals(_foodGroup!));
    if (_servingUnit != null)
      query = query..where(db.foods.servingUnit.equals(_servingUnit!));
    if (servingSizeGtController.text.isNotEmpty)
      query = query
        ..where(
          db.foods.servingSize
              .isBiggerThanValue(double.parse(servingSizeGtController.text)),
        );
    if (servingSizeLtController.text.isNotEmpty)
      query = query
        ..where(
          db.foods.servingSize
              .isSmallerThanValue(double.parse(servingSizeLtController.text)),
        );

    setState(() {
      stream = query.watch();
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NavigatorPopHandler(
      onPopWithResult: (result) {
        if (navigatorKey.currentState!.canPop() == false) return;
        if (navigatorKey.currentState?.focusNode.hasFocus == false) return;
        navigatorKey.currentState!.pop();
      },
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => _foodsPage(),
          settings: settings,
        ),
      ),
    );
  }

  Scaffold _foodsPage() {
    return Scaffold(
      body: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) throw snapshot.error!;
          final foods = resultsToCompanions(snapshot.data ?? []);

          return material.Column(
            children: [
              AppSearch(
                controller: searchController,
                onChange: (value) {
                  setState(() {
                    search = value;
                  });
                  setStream();
                },
                filter: FoodFilters(
                  foodGroup: _foodGroup,
                  servingUnit: _servingUnit,
                  servingSizeGtController: servingSizeGtController,
                  servingSizeLtController: servingSizeLtController,
                  onChange: ({
                    foodGroup,
                    servingUnit,
                  }) {
                    setState(() {
                      limit = 100;
                      _foodGroup = foodGroup;
                      _servingUnit = servingUnit;
                    });
                    setStream();
                  },
                ),
                onClear: () => setState(() {
                  selected.clear();
                }),
                onDelete: () async {
                  final selectedCopy = selected.toList();
                  setState(() {
                    selected.clear();
                  });
                  await (db.delete(db.foods)
                        ..where((tbl) => tbl.id.isIn(selectedCopy)))
                      .go();
                },
                onSelect: () => setState(() {
                  selected.addAll(
                    foods.map((food) => food.id.value),
                  );
                }),
                selected: selected,
                onEdit: () async {
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
                  final first = await (db.foods.select()
                        ..where((tbl) => tbl.id.equals(selected.first)))
                      .getSingle();
                  await (db.foods.update()
                        ..where((tbl) => tbl.id.isIn(selected)))
                      .write(
                    FoodsCompanion(
                      favorite: Value(first.favorite == true ? false : true),
                    ),
                  );
                  setState(() {
                    selected.clear();
                  });
                },
              ),
              if (snapshot.data?.isEmpty == true)
                const ListTile(
                  title: Text("No food yet."),
                  subtitle: Text(
                    "Tap the plus button to add foods.",
                  ),
                ),
              FoodList(
                foods: foods,
                selected: selected,
                onSelect: (id) {
                  if (selected.contains(id))
                    setState(() {
                      selected.remove(id);
                    });
                  else
                    setState(() {
                      selected.add(id);
                    });
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          navigatorKey.currentState!.push(
            MaterialPageRoute(
              builder: (context) => const EditFoodPage(),
            ),
          );
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
