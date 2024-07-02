import 'package:drift/drift.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/food/food_list.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  createState() => FoodPageState();
}

class PartialFood {
  final int id;
  final String name;
  final double? calories;
  final bool? favorite;
  final double? servingSize;
  final String? servingUnit;

  PartialFood({
    required this.id,
    required this.name,
    required this.calories,
    required this.favorite,
    required this.servingSize,
    required this.servingUnit,
  });
}

class FoodPageState extends State<FoodPage> with AutomaticKeepAliveClientMixin {
  late Stream<List<PartialFood>> stream;

  final TextEditingController searchController = TextEditingController();
  final Set<int> selected = {};
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String search = '';
  int limit = 100;

  @override
  void initState() {
    super.initState();
    _setStream();
  }

  void _setStream() {
    stream = (db.foods.selectOnly()
          ..addColumns([
            db.foods.id,
            db.foods.name,
            db.foods.calories,
            db.foods.favorite,
            db.foods.servingSize,
            db.foods.servingUnit,
          ])
          ..where(db.foods.name.contains(search.toLowerCase()))
          ..orderBy([
            OrderingTerm(
              expression: db.foods.favorite,
              mode: OrderingMode.desc,
            ),
            OrderingTerm(
              expression: db.foods.name,
              mode: OrderingMode.asc,
            ),
          ])
          ..limit(limit))
        .watch()
        .map(
          (results) => results
              .map(
                (result) => PartialFood(
                  id: result.read(db.foods.id)!,
                  name: result.read(db.foods.name)!,
                  calories: result.read(db.foods.calories),
                  favorite: result.read(db.foods.favorite),
                  servingSize: result.read(db.foods.servingSize),
                  servingUnit: result.read(db.foods.servingUnit),
                ),
              )
              .toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NavigatorPopHandler(
      onPop: () {
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
          if (snapshot.hasError) return ErrorWidget(snapshot.error.toString());
          final foods = snapshot.data ?? [];

          return material.Column(
            children: [
              AppSearch(
                controller: searchController,
                onChange: (value) {
                  setState(() {
                    search = value;
                  });
                  _setStream();
                },
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
                    foods.map((food) => food.id),
                  );
                }),
                selected: selected,
                onEdit: () async {
                  final food = foods.firstWhere(
                    (element) => element.id == selected.first,
                  );

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditFoodPage(
                        id: food.id,
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
                  _setStream();
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
