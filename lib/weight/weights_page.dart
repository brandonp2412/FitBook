import 'package:drift/drift.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/weight/edit_weight_page.dart';
import 'package:fit_book/weight/weight_list.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class WeightsPage extends StatefulWidget {
  const WeightsPage({super.key});

  @override
  createState() => WeightsPageState();
}

class WeightsPageState extends State<WeightsPage>
    with AutomaticKeepAliveClientMixin {
  final Set<int> selected = {};
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final TextEditingController searchController = TextEditingController();
  String search = '';
  int limit = 100;
  late Stream<List<Weight>> stream;

  @override
  void initState() {
    super.initState();
    _setStream();
  }

  void _setStream() {
    final where = CustomExpression<bool>(
      "CAST(amount AS TEXT) LIKE '%$search%'",
    );

    setState(() {
      stream = (db.weights.select()
            ..where((u) => where)
            ..orderBy([
              (u) => OrderingTerm(
                    expression: u.created,
                    mode: OrderingMode.desc,
                  ),
            ])
            ..limit(limit))
          .watch();
    });
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
          builder: (context) => _weightsPage(),
          settings: settings,
        ),
      ),
    );
  }

  Scaffold _weightsPage() {
    return Scaffold(
      body: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorWidget(snapshot.error!);
          final weights = snapshot.data ?? [];

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
                  await (db.delete(db.weights)
                        ..where((tbl) => tbl.id.isIn(selectedCopy)))
                      .go();
                },
                onSelect: () => setState(() {
                  selected.addAll(
                    weights.map((weight) => weight.id),
                  );
                }),
                selected: selected,
                onFavorite: () {},
                onEdit: () async {
                  final weight = weights.firstWhere(
                    (element) => element.id == selected.first,
                  );
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditWeightPage(
                        weight: weight,
                        lastWeight: weights.first,
                      ),
                    ),
                  );
                  setState(() {
                    selected.clear();
                  });
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
                  final result = await stream.first;
                  if (result.length <= limit) return;
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
          final weights = await stream.first;
          final defaultWeight = Weight(
            amount: 0.0,
            created: DateTime.now(),
            id: -1,
            unit: 'kg',
          );
          final editRoute = MaterialPageRoute(
            builder: (context) => EditWeightPage(
              weight: defaultWeight,
              lastWeight: weights.firstOrNull ?? defaultWeight,
            ),
          );
          navigatorKey.currentState!.push(editRoute);
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
