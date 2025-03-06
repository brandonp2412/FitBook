import 'package:drift/drift.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/entry/edit_entries_page.dart';
import 'package:fit_book/entry/edit_entry_page.dart';
import 'package:fit_book/entry/entry_filters.dart';
import 'package:fit_book/entry/entry_list.dart';
import 'package:fit_book/entry/entry_state.dart';
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

  late var entriesState = context.read<EntryState>();
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
    entriesState = context.watch<EntryState>();

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
                controller: searchController,
                filter: const EntryFilters(),
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
                  await (db.delete(db.entries)
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
                  final entries = await (db.entries.selectOnly()
                        ..addColumns([db.entries.id, db.entries.food])
                        ..where(db.entries.id.isIn(selected)))
                      .get();
                  final foodIds =
                      entries.map((entry) => entry.read(db.entries.food)!);
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
                      builder: (context) => EditEntriesPage(
                        entryIds: selected.toList(),
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
              EntryList(
                entryFoods: entryFoods,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          navigatorKey.currentState!.push(
            MaterialPageRoute(
              builder: (context) => const EditEntryPage(),
            ),
          );
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
