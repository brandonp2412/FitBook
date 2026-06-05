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
  State<EditMealPage> createState() => _EditMealPageState();
}

class _MealFoodEntry {
  final int foodId;
  final String foodName;
  final double? calories;
  final double servingSize;
  final TextEditingController quantityCtrl;
  String unit;

  _MealFoodEntry({
    required this.foodId,
    required this.foodName,
    this.calories,
    double? servingSize,
    required double quantity,
    required this.unit,
  })  : servingSize = servingSize ?? 100.0,
        quantityCtrl = TextEditingController(text: quantity.toString());
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
    final meal = await (db.meals.select()
          ..where((t) => t.id.equals(widget.id!)))
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
          servingSize: food.servingSize,
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
      await (db.meals.update()..where((t) => t.id.equals(mealId))).write(
        MealsCompanion(name: Value(name), imageFile: Value(_imageFile)),
      );
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
    final result = await FilePicker.pickFiles(type: FileType.image);
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
                servingSize: food.servingSize,
                quantity: 1,
                unit: 'serving',
              ),
            ),
          );
        },
      ),
    );
  }

  double _entryCalories(_MealFoodEntry e) {
    final qty = double.tryParse(e.quantityCtrl.text) ?? 1;
    final qtyInGrams = switch (e.unit) {
      'serving' => qty * e.servingSize,
      'grams' || 'milliliters' => qty,
      'milligrams' => qty / 1000.0,
      'ounces' => qty * 28.35,
      'pounds' => qty * 453.592,
      'cups' => qty * 250.0,
      'tablespoons' => qty * 15.0,
      'teaspoons' => qty * 5.0,
      'liters' => qty * 1000.0,
      _ => qty,
    };
    return (e.calories ?? 0) * qtyInGrams / e.servingSize;
  }

  double get _totalCalories =>
      mealFoods.fold(0, (sum, e) => sum + _entryCalories(e));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalCal = _totalCalories;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == null ? 'Create meal' : 'Edit meal'),
        bottom: mealFoods.isNotEmpty
            ? PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          size: 16,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${totalCal.toStringAsFixed(0)} kcal total',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: scrollCtrl,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              itemCount: 2 + (mealFoods.isEmpty ? 1 : mealFoods.length),
              itemBuilder: (ctx, i) {
                if (i == 0)
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
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
                  );
                if (i == 1) {
                  if (_imageFile != null)
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
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
                          padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
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
                    );
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.image),
                      label: const Text('Add image'),
                      onPressed: _pickImage,
                    ),
                  );
                }
                if (mealFoods.isEmpty)
                  return Padding(
                    padding: const EdgeInsets.only(top: 48),
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
                  );
                final idx = i - 2;
                return _FoodEntryCard(
                  entry: mealFoods[idx],
                  onRemove: () => setState(() => mealFoods.removeAt(idx)),
                  onChanged: () => setState(() {}),
                );
              },
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
    final colorScheme = theme.colorScheme;
    final qty = double.tryParse(entry.quantityCtrl.text) ?? 1;
    final qtyInGrams = switch (entry.unit) {
      'serving' => qty * entry.servingSize,
      'grams' || 'milliliters' => qty,
      'milligrams' => qty / 1000.0,
      'ounces' => qty * 28.35,
      'pounds' => qty * 453.592,
      'cups' => qty * 250.0,
      'tablespoons' => qty * 15.0,
      'teaspoons' => qty * 5.0,
      'liters' => qty * 1000.0,
      _ => qty,
    };
    final cal = (entry.calories ?? 0) * qtyInGrams / entry.servingSize;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 8, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.restaurant,
                    size: 20,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    entry.foodName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  tooltip: 'Remove',
                  visualDensity: VisualDensity.compact,
                  color: colorScheme.onSurfaceVariant,
                  onPressed: onRemove,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 76,
                  child: TextField(
                    controller: entry.quantityCtrl,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onTap: () => selectAll(entry.quantityCtrl),
                    onChanged: (_) => onChanged(),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: colorScheme.surface,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: colorScheme.outlineVariant,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorScheme.outlineVariant),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: unitOptions.contains(entry.unit)
                            ? entry.unit
                            : unitOptions.first,
                        isExpanded: true,
                        isDense: true,
                        borderRadius: BorderRadius.circular(12),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
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
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${cal.toStringAsFixed(0)} kcal',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
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
