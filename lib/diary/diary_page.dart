import 'package:drift/drift.dart';
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_filters.dart';
import 'package:fit_book/diary/diary_list.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/diary/edit_diaries_page.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/quick_add_page.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => DiaryPageState();
}

class DiaryPageState extends State<DiaryPage> {
  final Set<int> selected = {};
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final ScrollController scrollCtrl = ScrollController();
  late var entriesState = context.read<DiaryState>();
  late final TextEditingController searchController =
      TextEditingController(text: entriesState.search);

  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
      onPopWithResult: (result) {
        if (navigatorKey.currentState!.canPop() == false) return;
        if (navigatorKey.currentState?.focusNode.hasFocus == false) return;
        navigatorKey.currentState!.pop();
      },
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => _diaryPage(),
          settings: settings,
        ),
      ),
    );
  }

  Scaffold _diaryPage() {
    entriesState = context.watch<DiaryState>();

    return Scaffold(
      body: StreamBuilder(
        stream: entriesState.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint(snapshot.stackTrace.toString());
            return ErrorWidget(snapshot.error!);
          }

          final entryFoods = snapshot.data ?? [];

          return Stack(
            children: [
              material.Column(
                children: [
                  if (snapshot.data?.isEmpty == true)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: appSearchHeight + 16,
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: ListTile(
                        title: const Text("No entries today."),
                        subtitle:
                            const Text("Tap here to start logging your food."),
                        onTap: () => navigatorKey.currentState!.push(
                          MaterialPageRoute(
                            builder: (context) => const EditDiaryPage(),
                          ),
                        ),
                      ),
                    ),
                  DiaryList(
                    ctrl: scrollCtrl,
                    diaryFoods: entryFoods,
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
                      entriesState.limit += 100;
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
                  filter: const DiaryFilters(),
                  onChange: (value) {
                    entriesState.search = value;
                  },
                  onClear: () => setState(() {
                    selected.clear();
                  }),
                  onDelete: () async {
                    final selectedCopy = selected.toList();
                    setState(() {
                      selected.clear();
                    });
                    await (db.delete(db.diaries)
                          ..where((tbl) => tbl.id.isIn(selectedCopy)))
                        .go();
                  },
                  onSelect: () => setState(() {
                    selected.addAll(
                      entryFoods.map((entryFood) => entryFood.entryId),
                    );
                  }),
                  selected: selected,
                  onFavorite: () async {
                    final diaries = await (db.diaries.selectOnly()
                          ..addColumns([db.diaries.id, db.diaries.food])
                          ..where(db.diaries.id.isIn(selected)))
                        .get();
                    final foodIds =
                        diaries.map((entry) => entry.read(db.diaries.food)!);
                    await (db.foods.update()
                          ..where((tbl) => tbl.id.isIn(foodIds)))
                        .write(const FoodsCompanion(favorite: Value(true)));
                    setState(() {
                      selected.clear();
                    });
                  },
                  onEdit: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditDiariesPage(
                          diaryIds: selected.toList(),
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
        },
      ),
      floatingActionButton: material.Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: 'quickAdd',
            tooltip: 'Quick-add',
            onPressed: () {
              navigatorKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => const QuickAddPage(),
                ),
              );
            },
            child: const Icon(Icons.electric_bolt),
          ),
          const SizedBox(height: 8),
          AnimatedFab(
            onTap: () async {
              navigatorKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => const EditDiaryPage(),
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
}
