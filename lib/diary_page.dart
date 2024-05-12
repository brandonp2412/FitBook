import 'package:fit_book/app_search.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/edit_entry_page.dart';
import 'package:fit_book/entries.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings_state.dart';
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
  late Stream<List<EntryWithFood>> _stream;

  final Set<int> _selected = {};
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _search = '';

  @override
  void initState() {
    super.initState();

    _stream = watchAllEntries();
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
          builder: (context) => _graphsPage(),
          settings: settings,
        ),
      ),
    );
  }

  Scaffold _graphsPage() {
    final settings = context.watch<SettingsState>();

    return Scaffold(
      body: StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorWidget(snapshot.error.toString());

          final entryFoods = snapshot.data?.where((entry) {
                final name = entry.food.name.toLowerCase();
                final searchText = _search.toLowerCase();
                return name.contains(searchText);
              }).toList() ??
              [];

          return material.Column(
            children: [
              AppSearch(
                onChange: (value) {
                  setState(() {
                    _search = value;
                  });
                },
                onClear: () => setState(() {
                  _selected.clear();
                }),
                onDelete: () async {
                  final selectedCopy = _selected.toList();
                  setState(() {
                    _selected.clear();
                  });
                  await (db.delete(db.entries)
                        ..where((tbl) => tbl.id.isIn(selectedCopy)))
                      .go();
                },
                onSelect: () => setState(() {
                  _selected.addAll(
                    entryFoods.map((entryFood) => entryFood.entry.id),
                  );
                }),
                selected: _selected,
                onEdit: () {
                  final entryFood = entryFoods.firstWhere(
                    (element) => element.entry.id == _selected.first,
                  );

                  final food = entryFood.food;
                  final entry = entryFood.entry;
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditEntryPage(
                        entry: entry,
                        food: food,
                      ),
                    ),
                  );
                },
              ),
              if (snapshot.data?.isEmpty == true)
                const ListTile(
                  title: Text("No entries today."),
                  subtitle: Text(
                    "Tap the plus button to start logging your food.",
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: entryFoods.length,
                  itemBuilder: (context, index) {
                    final entryFood = entryFoods[index];
                    final food = entryFood.food;
                    final entry = entryFood.entry;
                    final previousEntryFood =
                        index > 0 ? entryFoods[index - 1] : null;
                    final showDivider = previousEntryFood != null &&
                        !isSameDay(
                          previousEntryFood.entry.created,
                          entryFood.entry.created,
                        );

                    return Column(
                      children: [
                        if (showDivider) const Divider(),
                        ListTile(
                          title: Text(food.name),
                          subtitle: Text(entry.created.toString()),
                          selected: _selected.contains(entry.id),
                          onLongPress: () {
                            if (_selected.contains(entry.id))
                              setState(() {
                                _selected.remove(entry.id);
                              });
                            else
                              setState(() {
                                _selected.add(entry.id);
                              });
                          },
                          onTap: () {
                            if (_selected.isEmpty)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditEntryPage(
                                    entry: entry,
                                    food: food,
                                  ),
                                ),
                              );
                            else if (_selected.contains(entry.id))
                              setState(() {
                                _selected.remove(entry.id);
                              });
                            else
                              setState(() {
                                _selected.add(entry.id);
                              });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              Text("1 / ${settings.dailyCalories} kcal"),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditEntryPage(
                entry: Entry(
                  created: DateTime.now(),
                  food: 0,
                  id: 0,
                  quantity: 0,
                  unit: 'g',
                ),
              ),
            ),
          );
        },
        tooltip: 'Add exercise',
        child: const Icon(Icons.add),
      ),
    );
  }
}
