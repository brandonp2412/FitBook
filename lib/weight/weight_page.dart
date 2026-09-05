import 'package:drift/drift.dart';
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/app_line.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/empty_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/weight/edit_weight_page.dart';
import 'package:fit_book/weight/weight_list.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => WeightPageState();
}

class WeightPageState extends State<WeightPage>
    with AutomaticKeepAliveClientMixin {
  final Set<int> selected = {};
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollCtrl = ScrollController();

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
      """CAST(amount AS TEXT) LIKE '%$search%' 
        OR strftime('%Y-%m-%d %H:%M:%S', datetime(created, 'unixepoch')) LIKE '%$search%'""",
    );

    setState(() {
      stream =
          (db.weights.select()
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
      onPopWithResult: (value) {
        if (navigatorKey.currentState!.canPop() == false) return;
        if (navigatorKey.currentState?.focusNode.hasFocus == false) return;
        navigatorKey.currentState!.pop();
      },
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(viewInsets: EdgeInsets.zero),
            child: _weightsPage(),
          ),
          settings: settings,
        ),
      ),
    );
  }

  Scaffold _weightsPage() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorWidget(snapshot.error!);
          final weights = snapshot.data ?? [];

          final listPane = Stack(
            children: [
              material.Column(
                children: [
                  if (snapshot.data?.isEmpty == true)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: appSearchHeight),
                        child: AppEmptyState(
                          icon: search.isEmpty
                              ? Icons.monitor_weight_outlined
                              : Icons.search_off_rounded,
                          title: search.isEmpty
                              ? 'No weights yet'
                              : 'No matching weights',
                          message: search.isEmpty
                              ? 'Log your first weight to start tracking your trend.'
                              : 'Nothing matches “$search”. Clear the search to see all entries.',
                          actionLabel: search.isEmpty
                              ? 'Log weight'
                              : 'Clear search',
                          actionIcon: search.isEmpty
                              ? Icons.add_rounded
                              : Icons.close_rounded,
                          onAction: () {
                            if (search.isNotEmpty) {
                              searchController.clear();
                              setState(() => search = '');
                              _setStream();
                              return;
                            }
                            showEditWeight(
                              context,
                              WeightsCompanion.insert(
                                amount: 0.0,
                                created: DateTime.now(),
                                unit: 'kg',
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  else
                    WeightList(
                      ctrl: scrollCtrl,
                      weights: weights,
                      selected: selected,
                      onSelect: (id) {
                        if (selected.contains(id)) {
                          setState(() => selected.remove(id));
                        } else {
                          setState(() => selected.add(id));
                        }
                      },
                      onNext: () async {
                        final result = await stream.first;
                        if (result.length <= limit) return;
                        setState(() => limit += 10);
                        _setStream();
                      },
                    ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppSearch(
                  ctrl: searchController,
                  onChange: (value) {
                    setState(() => search = value);
                    _setStream();
                  },
                  onClear: () => setState(() => selected.clear()),
                  onDelete: () async {
                    final selectedCopy = selected.toList();
                    setState(() => selected.clear());
                    await (db.delete(
                      db.weights,
                    )..where((tbl) => tbl.id.isIn(selectedCopy))).go();
                  },
                  onSelect: () => setState(
                    () => selected.addAll(weights.map((weight) => weight.id)),
                  ),
                  selected: selected,
                  onFavorite: () {},
                  onEdit: () async {
                    final weight = weights.firstWhere(
                      (element) => element.id == selected.first,
                    );
                    await showEditWeight(context, weight.toCompanion(false));
                    setState(() => selected.clear());
                  },
                ),
              ),
            ],
          );

          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < largeScreenBreakpoint) return listPane;

              final theme = Theme.of(context);
              final colorScheme = theme.colorScheme;
              final current = weights.firstOrNull;

              return AdaptivePageBody(
                maxWidth: 1320,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(width: 430, child: listPane),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Card(
                          margin: EdgeInsets.zero,
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                            child: material.Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Weight trend',
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ),
                                    if (current != null)
                                      Text(
                                        '${current.amount.toStringAsFixed(1)} ${current.unit}',
                                        style: theme.textTheme.headlineSmall
                                            ?.copyWith(
                                              color: colorScheme.primary,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Recent measurements and overall direction',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Expanded(
                                  child: AppLine(
                                    metric: 'body-weight',
                                    groupBy: Period.week,
                                    start: null,
                                    end: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: navigationBottomClearance(context)),
        child: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) throw Exception(snapshot.error);

            return AnimatedFab(
              onTap: () async {
                var weight = WeightsCompanion.insert(
                  amount: 0.0,
                  created: DateTime.now(),
                  unit: 'kg',
                );
                if (snapshot.data?.firstOrNull != null)
                  weight = weight.copyWith(
                    amount: Value(snapshot.data!.firstOrNull!.amount),
                    unit: Value(snapshot.data!.firstOrNull!.unit),
                  );

                showEditWeight(context, weight);
              },
              label: 'Add',
              icon: Icons.add,
              scroll: scrollCtrl,
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
