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
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  createState() => DiaryPageState();
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

          return material.Column(
            children: [
              AppSearch(
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
              if (snapshot.data?.isEmpty == true)
                const ListTile(
                  title: Text("No entries today."),
                  subtitle: Text(
                    "Tap the plus button to start logging your food.",
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
          );
        },
      ),
      floatingActionButton: AnimatedFab(
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
    );
  }
}
