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

typedef PartialFood = ({int id, String name, double? calories, bool? favorite});

class FoodPageState extends State<FoodPage> {
  late Stream<List<PartialFood>> _stream;

  final Set<int> _selected = {};
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _search = '';
  int _limit = 100;

  @override
  void initState() {
    super.initState();
    _setStream();
  }

  void _setStream() {
    _stream = (db.foods.selectOnly()
          ..addColumns([
            db.foods.id,
            db.foods.name,
            db.foods.calories,
            db.foods.favorite,
          ])
          ..where(db.foods.name.contains(_search.toLowerCase()))
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
          ..limit(_limit))
        .watch()
        .map(
          (results) => results
              .map(
                (result) => (
                  id: result.read(db.foods.id)!,
                  name: result.read(db.foods.name)!,
                  calories: result.read(db.foods.calories),
                  favorite: result.read(db.foods.favorite),
                ),
              )
              .toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
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
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorWidget(snapshot.error.toString());
          final foods = snapshot.data ?? [];

          return material.Column(
            children: [
              AppSearch(
                onChange: (value) {
                  setState(() {
                    _search = value;
                  });
                  _setStream();
                },
                onClear: () => setState(() {
                  _selected.clear();
                }),
                onDelete: () async {
                  final selectedCopy = _selected.toList();
                  setState(() {
                    _selected.clear();
                  });
                  await (db.delete(db.foods)
                        ..where((tbl) => tbl.id.isIn(selectedCopy)))
                      .go();
                },
                onSelect: () => setState(() {
                  _selected.addAll(
                    foods.map((food) => food.id),
                  );
                }),
                selected: _selected,
                onEdit: () async {
                  final food = foods.firstWhere(
                    (element) => element.id == _selected.first,
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
                    _selected.clear();
                  });
                },
                onFavorite: () async {
                  final first = await (db.foods.select()
                        ..where((tbl) => tbl.id.equals(_selected.first)))
                      .getSingle();
                  await (db.foods.update()
                        ..where((tbl) => tbl.id.isIn(_selected)))
                      .write(
                    FoodsCompanion(
                      favorite: Value(first.favorite == true ? false : true),
                    ),
                  );
                  setState(() {
                    _selected.clear();
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
                selected: _selected,
                onSelect: (id) {
                  if (_selected.contains(id))
                    setState(() {
                      _selected.remove(id);
                    });
                  else
                    setState(() {
                      _selected.add(id);
                    });
                },
                onNext: () async {
                  setState(() {
                    _limit += 10;
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
}
