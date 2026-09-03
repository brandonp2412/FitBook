import 'package:drift/drift.dart';
import 'package:fit_book/app_search.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_filters.dart';
import 'package:fit_book/diary/diary_list.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/diary/diary_stats_utils.dart';
import 'package:fit_book/diary/edit_diaries_page.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/logging.dart';
import 'package:fit_book/quick_add_page.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/speed_dial_fab.dart';
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

  Widget _summaryCard(BuildContext context, DayGroup day, Setting settings) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    Widget metric(String label, double value, int? target, String unit) {
      final progress = target == null || target <= 0
          ? null
          : (value / target).clamp(0.0, 1.0);
      return Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: material.Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ),
                Text(
                  target == null
                      ? '${value.toStringAsFixed(0)} $unit'
                      : '${value.toStringAsFixed(0)} / $target $unit',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            if (progress != null) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: colors.surfaceContainerHighest,
                ),
              ),
            ],
          ],
        ),
      );
    }

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: material.Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isToday(day.day) ? "Today's progress" : 'Latest day',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${day.foods.length} logged ${day.foods.length == 1 ? 'entry' : 'entries'}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            metric('Calories', day.stats.cals, settings.dailyCalories, 'kcal'),
            metric('Protein', day.stats.protein, settings.dailyProtein, 'g'),
            metric('Carbs', day.stats.carb, settings.dailyCarb, 'g'),
            metric('Fat', day.stats.fat, settings.dailyFat, 'g'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => navigatorKey.currentState!.push(
                  MaterialPageRoute(
                    builder: (context) => const EditDiaryPage(),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: const Text('Add diary entry'),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            talker.handle(
              snapshot.error!,
              snapshot.stackTrace,
              'Unable to load diary entries',
            );
            return ErrorWidget(snapshot.error!);
          }

          final entryFoods = snapshot.data ?? [];
          final searchTerm = entriesState.search.trim();

          final wide = usesSideNavigation(context);
          final listStack = Stack(
            children: [
              material.Column(
                children: [
                  if (entryFoods.isEmpty)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: appSearchHeight,
                          left: 24,
                          right: 24,
                        ),
                        child: Center(
                          child: Semantics(
                            button: true,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(24),
                              onTap: () => navigatorKey.currentState!.push(
                                MaterialPageRoute(
                                  builder: (context) => searchTerm.isEmpty
                                      ? const EditDiaryPage()
                                      : EditDiaryPage(
                                          initialName: searchTerm,
                                        ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: material.Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      searchTerm.isEmpty
                                          ? Icons.restaurant_menu_rounded
                                          : Icons.add_circle_outline_rounded,
                                      size: 56,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      searchTerm.isEmpty
                                          ? 'No entries today.'
                                          : 'Add "$searchTerm" to your diary',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      searchTerm.isEmpty
                                          ? 'Tap to start logging food.'
                                          : 'No matching diary entries. Tap to create this food and log it.',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    DiaryList(
                      ctrl: scrollCtrl,
                      diaryFoods: entryFoods,
                      showGoalSummary: !wide,
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

          if (!wide || entryFoods.isEmpty) {
            return AdaptivePageBody(maxWidth: 1040, child: listStack);
          }

          final day = groupByDay(entryFoods).first;
          final appSettings = context.watch<SettingsState>().value;
          return AdaptivePageBody(
            maxWidth: 1320,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: listStack),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 320,
                    child: _summaryCard(context, day, appSettings),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: navigationBottomClearance(context),
        ),
        child: SpeedDialFab(
          onTap: () {
            navigatorKey.currentState!.push(
              MaterialPageRoute(
                builder: (context) => const EditDiaryPage(),
              ),
            );
          },
          label: 'Add',
          icon: Icons.add,
          scroll: scrollCtrl,
          actions: [
            SpeedDialAction(
              icon: Icons.electric_bolt,
              label: 'Quick-add',
              onSelected: () {
                navigatorKey.currentState!.push(
                  MaterialPageRoute(
                    builder: (context) => const QuickAddPage(),
                  ),
                );
              },
            ),
            SpeedDialAction(
              icon: Icons.barcode_reader,
              label: 'Scan barcode',
              onSelected: () async {
                final result = await performBarcodeScan(context);
                if (result.food != null) {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) =>
                          EditDiaryPage(initialFood: result.food),
                    ),
                  );
                } else if (result.barcode != null) {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) =>
                          EditDiaryPage(initialBarcode: result.barcode),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
