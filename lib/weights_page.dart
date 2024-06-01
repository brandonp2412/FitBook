import 'package:drift/drift.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/edit_weight_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/weight_list.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class WeightsPage extends StatefulWidget {
  const WeightsPage({super.key});

  @override
  createState() => WeightsPageState();
}

class WeightsPageState extends State<WeightsPage> {
  final Set<int> _selected = {};
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _search = '';
  int _limit = 100;
  late Stream<List<Weight>> _stream;

  @override
  void initState() {
    super.initState();
    _setStream();
  }

  void _setStream() {
    _stream = (db.weights.select()
          ..where((u) => u.created.date.contains(_search))
          ..orderBy([
            (u) => OrderingTerm(
                  expression: u.created,
                  mode: OrderingMode.desc,
                ),
          ])
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
          builder: (context) => _weightsPage(),
          settings: settings,
        ),
      ),
    );
  }

  Scaffold _weightsPage() {
    return Scaffold(
      body: StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorWidget(snapshot.error!);

          final weights = snapshot.data ?? [];

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
                  await (db.delete(db.weights)
                        ..where((tbl) => tbl.id.isIn(selectedCopy)))
                      .go();
                },
                onSelect: () => setState(() {
                  _selected.addAll(
                    weights.map((weight) => weight.id),
                  );
                }),
                selected: _selected,
                onFavorite: () {},
                onEdit: () {
                  final weight = weights.firstWhere(
                    (element) => element.id == _selected.first,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditWeightPage(weight: weight),
                    ),
                  );
                },
              ),
              if (snapshot.data?.isEmpty == true)
                const ListTile(
                  title: Text("No weights today."),
                  subtitle: Text(
                    "Tap the plus button to start logging your weight.",
                  ),
                ),
              WeightList(
                weights: weights,
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
                  final result = await _stream.first;
                  if (result.length <= _limit) return;
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
              builder: (context) => EditWeightPage(
                weight: Weight(
                  amount: 0.0,
                  created: DateTime.now(),
                  id: -1,
                  unit: 'kg',
                ),
              ),
            ),
          );
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
