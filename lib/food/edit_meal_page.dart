import 'dart:io';

import 'package:drift/drift.dart' hide Column;
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';

class EditMealPage extends StatefulWidget {
  final int? id;

  const EditMealPage({super.key, this.id});

  @override
  createState() => _EditMealPageState();
}

class _MealFoodEntry {
  final int foodId;
  final String foodName;
  final double? calories;
  final TextEditingController quantityCtrl;
  String unit;

  _MealFoodEntry({
    required this.foodId,
    required this.foodName,
    this.calories,
    required double quantity,
    required this.unit,
  }) : quantityCtrl = TextEditingController(text: quantity.toString());
}

class _EditMealPageState extends State<EditMealPage> {
  final nameCtrl = TextEditingController();
  final scrollCtrl = ScrollController();
  List<_MealFoodEntry> mealFoods = [];
  bool loading = true;
  String? _imageFile;

  @override
  void initState() {
    super.initState();
    if (widget.id != null)
      _load();
    else
      setState(() => loading = false);
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    scrollCtrl.dispose();
    for (final e in mealFoods) {
      e.quantityCtrl.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    final meal =
        await (db.meals.select()..where((t) => t.id.equals(widget.id!)))
            .getSingle();
    final rows = await (db.mealFoods.select().join([
      innerJoin(db.foods, db.foods.id.equalsExp(db.mealFoods.food)),
    ])
          ..where(db.mealFoods.meal.equals(widget.id!)))
        .get();

    setState(() {
      nameCtrl.text = meal.name;
      _imageFile = meal.imageFile;
      mealFoods = rows.map((row) {
        final mf = row.readTable(db.mealFoods);
        final food = row.readTable(db.foods);
        return _MealFoodEntry(
          foodId: mf.food,
          foodName: food.name,
          calories: food.calories,
          quantity: mf.quantity,
          unit: mf.unit,
        );
      }).toList();
      loading = false;
    });
  }

  Future<void> _save() async {
    final name = nameCtrl.text.trim();
    if (name.isEmpty) return;

    int mealId;
    if (widget.id == null) {
      mealId = await db.meals.insertOne(
        MealsCompanion.insert(
          name: name,
          created: DateTime.now(),
          imageFile: Value(_imageFile),
        ),
      );
    } else {
      mealId = widget.id!;
      await (db.meals.update()..where((t) => t.id.equals(mealId)))
          .write(MealsCompanion(name: Value(name), imageFile: Value(_imageFile)));
    }

    await (db.mealFoods.delete()..where((t) => t.meal.equals(mealId))).go();
    for (final entry in mealFoods) {
      await db.mealFoods.insertOne(
        MealFoodsCompanion.insert(
          meal: mealId,
          food: entry.foodId,
          quantity: double.tryParse(entry.quantityCtrl.text) ?? 1,
          unit: entry.unit,
        ),
      );
    }

    if (mounted) Navigator.pop(context);
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;
    setState(() => _imageFile = result.files.single.path);
  }

  Future<void> _pickFood() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) => _FoodPickerSheet(
        onPicked: (food) {
          if (mealFoods.any((e) => e.foodId == food.id)) return;
          setState(
            () => mealFoods.add(
              _MealFoodEntry(
                foodId: food.id,
                foodName: food.name,
                calories: food.calories,
                quantity: 1,
                unit: food.servingUnit ?? 'serving',
              ),
            ),
          );
        },
      ),
    );
  }

  double get _totalCalories => mealFoods.fold(0, (sum, e) {
        final qty = double.tryParse(e.quantityCtrl.text) ?? 1;
        return sum + (e.calories ?? 0) * qty;
      });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalCal = _totalCalories;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == null ? 'Create meal' : 'Edit meal'),
        bottom: mealFoods.isNotEmpty
            ? PreferredSize(
                preferredSize: const Size.fromHeight(32),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '${totalCal.toStringAsFixed(0)} kcal total',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: TextField(
                    controller: nameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => setState(() {}),
                    textCapitalization: TextCapitalization.sentences,
                    autofocus: widget.id == null,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                if (_imageFile != null)
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(_imageFile!),
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 20, 0),
                        child: IconButton.filled(
                          icon: const Icon(Icons.close),
                          style: IconButton.styleFrom(
                            backgroundColor:
                                Colors.black.withValues(alpha: 0.5),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => setState(() => _imageFile = null),
                        ),
                      ),
                    ],
                  )
                else
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.image),
                      label: const Text('Add image'),
                      onPressed: _pickImage,
                    ),
                  ),
                Expanded(
                  child: mealFoods.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.restaurant_menu,
                                size: 64,
                                color: theme.colorScheme.outlineVariant,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'No foods yet. Tap + to add foods.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          controller: scrollCtrl,
                          padding: const EdgeInsets.fromLTRB(12, 4, 12, 100),
                          itemCount: mealFoods.length,
                          itemBuilder: (ctx, i) {
                            final entry = mealFoods[i];
                            return _FoodEntryCard(
                              entry: entry,
                              onRemove: () =>
                                  setState(() => mealFoods.removeAt(i)),
                              onChanged: () => setState(() {}),
                            );
                          },
                        ),
                ),
              ],
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: 'addFood',
            tooltip: 'Add food',
            onPressed: _pickFood,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          AnimatedFab(
            onTap: _save,
            label: 'Save',
            icon: Icons.save,
            scroll: scrollCtrl,
          ),
        ],
      ),
    );
  }
}

class _FoodEntryCard extends StatelessWidget {
  final _MealFoodEntry entry;
  final VoidCallback onRemove;
  final VoidCallback onChanged;

  const _FoodEntryCard({
    required this.entry,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final qty = double.tryParse(entry.quantityCtrl.text) ?? 1;
    final cal = (entry.calories ?? 0) * qty;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
        child: Row(
          children: [
            Icon(
              Icons.set_meal,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.foodName, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      SizedBox(
                        width: 68,
                        child: TextField(
                          controller: entry.quantityCtrl,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onTap: () => selectAll(entry.quantityCtrl),
                          onChanged: (_) => onChanged(),
                          style: theme.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: unitOptions.contains(entry.unit)
                              ? entry.unit
                              : unitOptions.first,
                          isDense: true,
                          style: theme.textTheme.bodyMedium,
                          items: unitOptions
                              .map(
                                (u) => DropdownMenuItem(
                                  value: u,
                                  child: Text(u),
                                ),
                              )
                              .toList(),
                          onChanged: (v) {
                            entry.unit = v!;
                            onChanged();
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${cal.toStringAsFixed(0)} kcal',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              tooltip: 'Remove',
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodPickerSheet extends StatefulWidget {
  final Function(Food) onPicked;

  const _FoodPickerSheet({required this.onPicked});

  @override
  State<_FoodPickerSheet> createState() => _FoodPickerSheetState();
}

class _FoodPickerSheetState extends State<_FoodPickerSheet> {
  final searchCtrl = TextEditingController();
  late Stream<List<Food>> stream;

  @override
  void initState() {
    super.initState();
    _setStream();
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  void _setStream() {
    var q = db.foods.select()
      ..orderBy([
        (t) => OrderingTerm(expression: t.favorite, mode: OrderingMode.desc),
        (t) => OrderingTerm(expression: t.created, mode: OrderingMode.desc),
      ])
      ..limit(100);
    if (searchCtrl.text.isNotEmpty)
      q = q..where((t) => t.name.contains(searchCtrl.text.toLowerCase()));
    setState(() => stream = q.watch());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: TextField(
              controller: searchCtrl,
              autofocus: true,
              onChanged: (_) => _setStream(),
              decoration: InputDecoration(
                hintText: 'Search foods...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Food>>(
              stream: stream,
              builder: (ctx, snap) {
                final foods = snap.data ?? [];
                if (foods.isEmpty)
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 48,
                          color: theme.colorScheme.outlineVariant,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'No foods found.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                return ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (ctx, i) {
                    final food = foods[i];
                    return ListTile(
                      leading: food.favorite == true
                          ? Icon(
                              Icons.favorite,
                              size: 16,
                              color: theme.colorScheme.primary,
                            )
                          : null,
                      title: Text(food.name),
                      subtitle: Text(
                        '${food.calories?.toStringAsFixed(0) ?? 0} kcal'
                        ' · ${food.servingSize?.toStringAsFixed(0) ?? 1}'
                        ' ${food.servingUnit ?? 'serving'}',
                      ),
                      onTap: () {
                        widget.onPicked(food);
                        Navigator.pop(ctx);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
