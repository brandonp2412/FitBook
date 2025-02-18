import 'package:drift/drift.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/entry/edit_entries_page.dart';
import 'package:fit_book/entry/edit_entry_page.dart';
import 'package:fit_book/entry/entry_filters.dart';
import 'package:fit_book/entry/entry_food.dart';
import 'package:fit_book/entry/entry_list.dart';
import 'package:fit_book/entry/entry_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
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
    final settings = context.watch<SettingsState>().value;
    entriesState = context.watch<EntryState>();

    return Scaffold(
      body: StreamBuilder(
        stream: entriesState.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorWidget(snapshot.error!);

          final entryFoods = snapshot.data ?? [];

          double totalCals = 0;
          double totalProtein = 0;
          double totalFat = 0;
          double totalCarb = 0;
          for (EntryFood entryFood in entryFoods)
            if (isSameDay(entryFood.created, DateTime.now().toLocal())) {
              totalCals += entryFood.metrics[db.foods.calories.name] ?? 0;
              totalProtein += entryFood.metrics[db.foods.proteinG.name] ?? 0;
              totalFat += entryFood.metrics[db.foods.fatG.name] ?? 0;
              totalCarb += entryFood.metrics[db.foods.carbohydrateG.name] ?? 0;
            }

          String cals = "";
          String protein = "";
          String fat = "";
          String carb = "";

          switch (settings.diarySummary) {
            case 'DiarySummary.remaining':
              cals =
                  "${((settings.dailyCalories ?? 0) - totalCals).toStringAsFixed(0)} kcal";
              protein =
                  "${((settings.dailyProtein ?? 0) - totalProtein).toStringAsFixed(0)} g";
              fat =
                  "${((settings.dailyFat ?? 0) - totalFat).toStringAsFixed(0)} g";
              carb =
                  "${((settings.dailyCarb ?? 0) - totalCarb).toStringAsFixed(0)} g";
              break;
            case 'DiarySummary.division':
              cals =
                  "${totalCals.toStringAsFixed(0)} / ${settings.dailyCalories} kcal";
              protein =
                  "${totalProtein.toStringAsFixed(0)} / ${settings.dailyProtein} g";
              fat = "${totalFat.toStringAsFixed(0)} / ${settings.dailyFat} g";
              carb =
                  "${totalCarb.toStringAsFixed(0)} / ${settings.dailyCarb} g";
              break;
            case 'DiarySummary.both':
              cals =
                  "${((settings.dailyCalories ?? 0) - totalCals).toStringAsFixed(0)} (${settings.dailyCalories} kcal)";
              protein =
                  "${((settings.dailyProtein ?? 0) - totalProtein).toStringAsFixed(0)} (${settings.dailyProtein} g)";
              fat =
                  "${((settings.dailyFat ?? 0) - totalFat).toStringAsFixed(0)} (${settings.dailyFat} g)";
              carb =
                  "${((settings.dailyCarb ?? 0) - totalCarb).toStringAsFixed(0)} (${settings.dailyCarb} g)";
              break;
            case 'DiarySummary.none':
              break;
          }

          final children = [
            if (settings.dailyCalories != null)
              Text(
                cals,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            if (settings.dailyProtein != null)
              Text(
                protein,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            if (settings.dailyFat != null)
              Text(
                fat,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            if (settings.dailyCarb != null)
              Text(
                carb,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
          ];

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
              material.Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: children,
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
