import 'package:drift/drift.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/edit_food_page.dart';
import 'package:fit_book/food_list.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class FoodsPage extends StatefulWidget {
  const FoodsPage({super.key});

  @override
  createState() => FoodsPageState();
}

class FoodsPageState extends State<FoodsPage> {
  late Stream<List<Food>> _stream;

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
    _stream = (db.foods.select()
          ..where((tbl) => tbl.name.contains(_search.toLowerCase()))
          ..limit(_limit))
        .watch();
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
                onEdit: () {
                  final food = foods.firstWhere(
                    (element) => element.id == _selected.first,
                  );

                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditFoodPage(
                        food: food,
                      ),
                    ),
                  );
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
                onNext: () {
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
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditFoodPage(),
            ),
          );
        },
        tooltip: 'Add food',
        child: const Icon(Icons.add),
      ),
    );
  }
}
