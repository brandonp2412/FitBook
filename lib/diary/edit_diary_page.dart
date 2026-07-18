import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart' hide Table;
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/search_open_food_facts.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

enum _ResultType { food, meal, openFoodFacts }

class _SearchResult {
  final _ResultType type;
  final String name;
  final Food? food;
  final Meal? meal;

  _SearchResult.food(Food f)
      : type = _ResultType.food,
        name = f.name,
        food = f,
        meal = null;

  _SearchResult.meal(Meal m)
      : type = _ResultType.meal,
        name = m.name,
        food = null,
        meal = m;

  _SearchResult.openFoodFacts(String term)
      : type = _ResultType.openFoodFacts,
        name = term,
        food = null,
        meal = null;
}

class EditDiaryPage extends StatefulWidget {
  final int? id;

  const EditDiaryPage({super.key, this.id});

  @override
  State<EditDiaryPage> createState() => _EditDiaryPageState();
}

class _EditDiaryPageState extends State<EditDiaryPage> {
  final nameController = TextEditingController();
  final quantity = TextEditingController(text: "100");
  final calories = TextEditingController(text: "0");
  final kilojoules = TextEditingController(text: "0");
  final protein = TextEditingController(text: "0");
  final carb = TextEditingController(text: "0");
  final fat = TextEditingController(text: "0");
  final fiber = TextEditingController(text: "0");
  final nameFocusNode = FocusNode();
  final quantityNode = FocusNode();
  final caloriesNode = FocusNode();
  final barcode = TextEditingController();
  final scrollCtrl = ScrollController();
  bool _transitionListenerAdded = false;

  late var settings = context.read<SettingsState>().value;
  late var unit = settings.entryUnit;

  DateTime? created;
  bool foodDirty = false;
  Food? selectedFood;
  int? _selectedMealId;
  String? imageFile;
  List<_SearchResult> searchResults = [];
  final formatter = NumberFormat.decimalPattern()..maximumFractionDigits = 2;

  double _mealCalsPerServing = 0;
  double _mealProteinPerServing = 0;
  double _mealCarbPerServing = 0;
  double _mealFatPerServing = 0;
  double _mealFiberPerServing = 0;

  double _num(TextEditingController c) {
    return formatter.tryParse(c.text)?.toDouble() ?? 0.0;
  }

  double get _entryServings {
    final q = _num(quantity);
    if (q == 0) return 0;
    final s = (selectedFood?.servingSize ?? 100).toDouble();
    if (s == 0) return 0;
    if (unit == 'serving') return q;
    return q / s;
  }

  double get entryCalories => _num(calories) * _entryServings;
  double get entryProtein => _num(protein) * _entryServings;
  double get entryCarb => _num(carb) * _entryServings;
  double get entryFat => _num(fat) * _entryServings;
  double get entryFiber => _num(fiber) * _entryServings;
  double get entryKJ => entryCalories * 4.184;

  Widget totalCell({required String label, required String value}) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      child: Text(value),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_transitionListenerAdded) {
      _transitionListenerAdded = true;
      final animation = ModalRoute.of(context)?.animation;
      if (animation == null || animation.status == AnimationStatus.completed) {
        _onTransitionComplete();
      } else {
        animation.addStatusListener(_onRouteAnimation);
      }
    }
  }

  void _onRouteAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      ModalRoute.of(context)
          ?.animation
          ?.removeStatusListener(_onRouteAnimation);
      if (mounted) _onTransitionComplete();
    }
  }

  void _onTransitionComplete() {
    if (widget.id == null) nameFocusNode.requestFocus();
  }

  @override
  void initState() {
    super.initState();
    _performSearch('');

    if (widget.id == null) return;

    (db.diaries.select()..where((u) => u.id.equals(widget.id!)))
        .getSingle()
        .then((entry) async {
      setState(() {
        quantity.text = entry.quantity.toString();
        created = entry.created;
        unit = entry.unit;
      });

      if (entry.meal != null) {
        final meal = await (db.meals.select()
              ..where((u) => u.id.equals(entry.meal!)))
            .getSingleOrNull();
        if (meal == null || !mounted) return;
        setState(() {
          _selectedMealId = meal.id;
          nameController.text = meal.name;
          imageFile = meal.imageFile;
        });
        _loadMealNutrients(meal.id);
        return;
      }

      if (entry.food == null) return;
      final food = await (db.foods.select()
            ..where((u) => u.id.equals(entry.food!)))
          .getSingleOrNull();
      if (food == null) return;

      setState(() {
        imageFile = food.imageFile;
        barcode.text = food.barcode ?? "";
        nameController.text = food.name;
        selectedFood = food;
        calories.text =
            food.calories != null ? formatter.format(food.calories!) : "0";
        protein.text =
            food.proteinG != null ? formatter.format(food.proteinG!) : "0";
        carb.text = food.carbohydrateG != null
            ? formatter.format(food.carbohydrateG!)
            : "0";
        fat.text = food.fatG != null ? formatter.format(food.fatG!) : "0";
        fiber.text = food.fiberG != null ? formatter.format(food.fiberG!) : "0";
        kilojoules.text = food.calories != null
            ? formatter.format(food.calories! * 4.184)
            : "0";
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  Future<void> _performSearch(String term) async {
    final foods = await (db.foods.select()
          ..where(
            (f) => term.isEmpty
                ? const Constant(true)
                : f.name.contains(term.toLowerCase()),
          )
          ..orderBy([
            (f) =>
                OrderingTerm(expression: f.favorite, mode: OrderingMode.desc),
          ])
          ..limit(20))
        .get();

    final meals = await (db.meals.select()
          ..where(
            (m) => term.isEmpty
                ? const Constant(true)
                : m.name.contains(term.toLowerCase()),
          )
          ..orderBy([
            (m) =>
                OrderingTerm(expression: m.favorite, mode: OrderingMode.desc),
          ])
          ..limit(10))
        .get();

    final results = <_SearchResult>[
      ...meals.map((m) => _SearchResult.meal(m)),
      ...foods.map((f) => _SearchResult.food(f)),
    ];

    if (term.isNotEmpty) {
      results.add(_SearchResult.openFoodFacts(term));
    }

    if (!mounted) return;
    setState(() {
      searchResults = results;
    });
  }

  /// Loads the component foods of [mealId] and computes per-serving nutrient
  /// totals, accounting for each food's quantity and unit within the meal.
  Future<void> _loadMealNutrients(int mealId) async {
    final rows = await (db.mealFoods.select().join([
      innerJoin(db.foods, db.foods.id.equalsExp(db.mealFoods.food)),
    ])
          ..where(db.mealFoods.meal.equals(mealId)))
        .get();

    var cals = 0.0;
    var prot = 0.0;
    var carbs = 0.0;
    var fat = 0.0;
    var fiber = 0.0;

    for (final row in rows) {
      final mf = row.readTable(db.mealFoods);
      final food = row.readTable(db.foods);
      final servingSize = food.servingSize ?? 100.0;
      final qtyInGrams = switch (mf.unit) {
        'serving' => mf.quantity * servingSize,
        'grams' || 'milliliters' => mf.quantity,
        'milligrams' => mf.quantity / 1000.0,
        'ounces' => mf.quantity * 28.35,
        'pounds' => mf.quantity * 453.592,
        'cups' => mf.quantity * 250.0,
        'tablespoons' => mf.quantity * 15.0,
        'teaspoons' => mf.quantity * 5.0,
        'liters' => mf.quantity * 1000.0,
        _ => mf.quantity,
      };
      final ratio = qtyInGrams / servingSize;
      cals += (food.calories ?? 0) * ratio;
      prot += (food.proteinG ?? 0) * ratio;
      carbs += (food.carbohydrateG ?? 0) * ratio;
      fat += (food.fatG ?? 0) * ratio;
      fiber += (food.fiberG ?? 0) * ratio;
    }

    if (!mounted) return;
    setState(() {
      _mealCalsPerServing = cals;
      _mealProteinPerServing = prot;
      _mealCarbPerServing = carbs;
      _mealFatPerServing = fat;
      _mealFiberPerServing = fiber;
    });
  }

  void _applyMeal(Meal meal) {
    setState(() {
      _selectedMealId = meal.id;
      selectedFood = null;
      nameController.text = meal.name;
      imageFile = meal.imageFile;
      unit = 'serving';
      quantity.text = '1';
    });
    _loadMealNutrients(meal.id);
    quantityNode.requestFocus();
    selectAll(quantity);
  }

  void _applyFood(Food food, {double? lastQuantity, String? lastUnit}) {
    setState(() {
      foodDirty = false;
      selectedFood = food;
      nameController.text = food.name;
      calories.text =
          food.calories != null ? formatter.format(food.calories!) : "0";
      protein.text =
          food.proteinG != null ? formatter.format(food.proteinG!) : "0";
      carb.text = food.carbohydrateG != null
          ? formatter.format(food.carbohydrateG!)
          : "0";
      fat.text = food.fatG != null ? formatter.format(food.fatG!) : "0";
      fiber.text = food.fiberG != null ? formatter.format(food.fiberG!) : "0";
      kilojoules.text = food.calories != null
          ? formatter.format(food.calories! * 4.184)
          : "0";
      if (lastQuantity != null) quantity.text = lastQuantity.toString();
      if (lastUnit != null) unit = lastUnit;
    });
    quantityNode.requestFocus();
    selectAll(quantity);
  }

  Future<void> _onResultTap(_SearchResult result) async {
    if (result.type == _ResultType.openFoodFacts) {
      final Food? food = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchOpenFoodFacts(terms: result.name),
        ),
      );
      if (food == null) return;
      _applyFood(food);
      return;
    }

    if (result.type == _ResultType.meal) {
      _applyMeal(result.meal!);
      return;
    }

    final food = result.food!;
    final lastEntry = await (db.diaries.select()
          ..where((u) => u.food.equals(food.id))
          ..orderBy([
            (u) => OrderingTerm(
                  expression: u.created,
                  mode: OrderingMode.desc,
                ),
          ])
          ..limit(1))
        .getSingleOrNull();

    _applyFood(
      food,
      lastQuantity: lastEntry?.quantity,
      lastUnit: lastEntry?.unit,
    );
  }

  Future<void> saveFood() async {
    final parsedCalories = formatter.tryParse(calories.text)?.toDouble();
    final parsedProtein = formatter.tryParse(protein.text)?.toDouble();
    final parsedCarb = formatter.tryParse(carb.text)?.toDouble();
    final parsedFat = formatter.tryParse(fat.text)?.toDouble();
    final parsedFiber = formatter.tryParse(fiber.text)?.toDouble();

    if (selectedFood?.name != nameController.text) {
      final foodId = await (db.foods.insertOne(
        FoodsCompanion.insert(
          name: nameController.text,
          calories: Value(parsedCalories),
          proteinG: Value(parsedProtein),
          carbohydrateG: Value(parsedCarb),
          fatG: Value(parsedFat),
          fiberG: Value(parsedFiber),
          favorite: Value(settings.favoriteNew),
          servingSize: Value(selectedFood?.servingSize ?? 100.0),
          servingUnit: Value(selectedFood?.servingUnit ?? settings.foodUnit),
          created: Value(DateTime.now()),
          barcode: Value(barcode.text),
          imageFile: Value(imageFile),
        ),
      ));
      final food = await (db.foods.select()..where((u) => u.id.equals(foodId)))
          .getSingle();
      setState(() {
        selectedFood = food;
      });
    } else {
      await (db.foods.update()
            ..where((u) => u.id.equals(selectedFood?.id ?? -1)))
          .write(
        FoodsCompanion(
          calories: Value(parsedCalories),
          proteinG: Value(parsedProtein),
          carbohydrateG: Value(parsedCarb),
          fatG: Value(parsedFat),
          fiberG: Value(parsedFiber),
          imageFile: Value(imageFile),
        ),
      );
      final food = await (db.foods.select()
            ..where((u) => u.id.equals(selectedFood!.id)))
          .getSingle();
      setState(() {
        selectedFood = food;
      });
    }
  }

  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: created,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) pickTime(pickedDate);
  }

  Future<void> pickTime(DateTime pickedDate) async {
    if (!settings.longDateFormat.contains('h:mm') &&
        !settings.longDateFormat.contains('H:mm'))
      return setState(() {
        created = pickedDate;
      });

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(created ?? DateTime.now()),
    );
    if (pickedTime != null) {
      setState(() {
        created = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  Future<void> save() async {
    final qty = double.tryParse(quantity.text) ?? 1.0;
    final date = created ?? DateTime.now();

    if (_selectedMealId != null) {
      if (widget.id == null)
        await db.into(db.diaries).insert(
              DiariesCompanion.insert(
                meal: Value(_selectedMealId!),
                created: date,
                quantity: qty,
                unit: unit,
              ),
            );
      else
        await (db.update(db.diaries)..where((u) => u.id.equals(widget.id!)))
            .write(
          DiariesCompanion(
            meal: Value(_selectedMealId!),
            food: const Value(null),
            created: Value(date),
            quantity: Value(qty),
            unit: Value(unit),
          ),
        );
      if (!mounted) return;
      Navigator.pop(context);
      return;
    }

    if (foodDirty) await saveFood();
    final food = selectedFood!;

    if (widget.id == null)
      await db.into(db.diaries).insert(
            DiariesCompanion.insert(
              food: Value(food.id),
              created: date,
              quantity: qty,
              unit: unit,
            ),
          );
    else
      await (db.update(db.diaries)..where((u) => u.id.equals(widget.id!)))
          .write(
        DiariesCompanion(
          food: Value(food.id),
          meal: const Value(null),
          created: Value(date),
          quantity: Value(qty),
          unit: Value(unit),
        ),
      );
    if (!mounted) return;
    Navigator.pop(context);
  }

  void setImage() async {
    final file = await FilePicker.pickFile(
      type: FileType.image,
    );
    final path = file?.path;
    if (path == null) return;
    final docsDir = (await getApplicationDocumentsDirectory()).path;
    final fileName = 'diary_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final destPath = '$docsDir/$fileName';
    await File(path).copy(destPath);
    setState(() {
      imageFile = destPath;
      foodDirty = true;
    });
  }

  Widget _buildResultLeading(_SearchResult result) {
    if (result.type == _ResultType.openFoodFacts)
      return const SizedBox(
        width: 48,
        height: 48,
        child: Center(child: Icon(Icons.search)),
      );

    if (result.type == _ResultType.meal) {
      final imageFile = result.meal!.imageFile;
      if (settings.showImages && imageFile?.isNotEmpty == true) {
        return SizedBox(
          height: 48,
          width: 48,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.file(
              File(imageFile!),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Center(
                child: Icon(
                  Icons.restaurant,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        );
      }
      return SizedBox(
        width: 48,
        height: 48,
        child: Center(
          child: Icon(
            Icons.restaurant,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    final food = result.food!;
    if (settings.showImages) {
      if (food.imageFile?.isNotEmpty == true)
        return SizedBox(
          height: 48,
          width: 48,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.file(
              File(food.imageFile!),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
        );
      if (food.smallImage?.isNotEmpty == true)
        return SizedBox(
          height: 48,
          width: 48,
          child: CachedNetworkImage(imageUrl: food.smallImage!),
        );
    }
    return const SizedBox(
      width: 48,
      height: 48,
      child: Center(child: Icon(Icons.food_bank_outlined)),
    );
  }

  @override
  Widget build(BuildContext context) {
    settings = context.watch<SettingsState>().value;

    final shortUnit =
        getShortUnit(selectedFood?.servingUnit ?? settings.foodUnit);
    final servingSize = selectedFood?.servingSize ?? 100;
    final showList = selectedFood == null && _selectedMealId == null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id == null ? 'Add diary entry' : 'Edit diary entry',
        ),
        actions: [
          if (widget.id != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text('Confirm delete'),
                      content: Text(
                        'Are you sure you want to delete ${selectedFood?.name}?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.pop(dialogContext),
                        ),
                        TextButton(
                          child: const Text('Delete'),
                          onPressed: () async {
                            Navigator.pop(dialogContext);
                            await db.diaries.deleteWhere(
                              (tbl) => tbl.id.equals(widget.id!),
                            );
                            if (context.mounted) Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          controller: scrollCtrl,
          children: [
            TextField(
              key: const Key('name_field'),
              controller: nameController,
              focusNode: nameFocusNode,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Name',
                hintText: 'Search foods and meals...',
                suffixIcon: (selectedFood != null || _selectedMealId != null)
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            selectedFood = null;
                            _selectedMealId = null;
                            foodDirty = false;
                          });
                          nameController.clear();
                          _performSearch('');
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () async {
                          final Food? food = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchOpenFoodFacts(
                                terms: nameController.text,
                              ),
                            ),
                          );
                          if (food == null) return;
                          _applyFood(food);
                        },
                      ),
              ),
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                if (selectedFood == null) {
                  _performSearch(value);
                } else {
                  setState(() {
                    foodDirty = true;
                  });
                }
              },
            ),
            const SizedBox(height: 8),
            if (showList) ...[
              for (final result in searchResults)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: _buildResultLeading(result),
                  title: Text(
                    result.type == _ResultType.openFoodFacts
                        ? 'Search OpenFoodFacts for "${result.name}"'
                        : result.name,
                  ),
                  subtitle: result.type == _ResultType.meal
                      ? const Text('Meal')
                      : result.food?.calories != null
                          ? Text(
                              '${result.food!.calories!.toStringAsFixed(0)} kcal',
                            )
                          : null,
                  onTap: () => _onResultTap(result),
                ),
            ] else ...[
              TextField(
                controller: quantity,
                focusNode: quantityNode,
                decoration: const InputDecoration(label: Text("Quantity")),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onTap: () => quantity.selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: quantity.text.length,
                ),
                textInputAction: TextInputAction.next,
                onChanged: (value) => setState(() {}),
                onSubmitted: (value) {
                  if (selectedFood != null) save();
                },
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: unit,
                decoration: const InputDecoration(labelText: 'Unit'),
                items: unitOptions.map((String value) {
                  if (value == 'serving' && selectedFood != null)
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text("serving ($servingSize $shortUnit)"),
                    );
                  else
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    unit = newValue!;
                  });
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Created date'),
                subtitle: Text(
                  DateFormat(settings.longDateFormat)
                      .format(created ?? DateTime.now()),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => pickDate(),
              ),
              if (_selectedMealId == null && !kIsWeb)
                TextField(
                  controller: barcode,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Barcode',
                    suffixIcon: ScanBarcode(
                      text: true,
                      value: barcode.text,
                      onBarcode: (value) {
                        barcode.text = value;
                        toast(context, 'Barcode not found. Save to insert.');
                      },
                      onFood: (food) {
                        barcode.text = food.barcode!;
                        _applyFood(food);
                      },
                    ),
                  ),
                ),
              if (_selectedMealId == null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: calories,
                        focusNode: caloriesNode,
                        decoration: InputDecoration(
                          labelText: 'Calories (per $servingSize $shortUnit)',
                        ),
                        onTap: () => selectAll(calories),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onChanged: (value) {
                          setState(() {
                            foodDirty = true;
                            kilojoules.text = formatter
                                .format(formatter.parse(value) * 4.184);
                          });
                        },
                        onSubmitted: (value) => selectAll(kilojoules),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    if (unit != 'kilojoules') ...[
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          controller: kilojoules,
                          decoration: InputDecoration(
                            labelText:
                                'Kilojoules (per $servingSize $shortUnit)',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (value) {
                            setState(() {
                              foodDirty = true;
                              calories.text = formatter
                                  .format(formatter.parse(value) / 4.184);
                            });
                          },
                          onSubmitted: (value) => selectAll(protein),
                          onTap: () => selectAll(kilojoules),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: protein,
                        decoration: InputDecoration(
                          labelText: 'Protein (per $servingSize $shortUnit)',
                        ),
                        onTap: () => selectAll(protein),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onChanged: (value) {
                          setState(() {
                            foodDirty = true;
                          });
                        },
                        onSubmitted: (value) => selectAll(carb),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: carb,
                        decoration: InputDecoration(
                          labelText: 'Carbs (per $servingSize $shortUnit)',
                        ),
                        onTap: () => selectAll(carb),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onChanged: (value) {
                          setState(() {
                            foodDirty = true;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        onSubmitted: (value) => selectAll(fat),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: fat,
                        decoration: InputDecoration(
                          labelText: 'Fat (per $servingSize $shortUnit)',
                        ),
                        onTap: () => selectAll(fat),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onChanged: (value) {
                          setState(() {
                            foodDirty = true;
                          });
                        },
                        onSubmitted: (value) => selectAll(fiber),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: fiber,
                        decoration: InputDecoration(
                          labelText: 'Fiber (per $servingSize $shortUnit)',
                        ),
                        onTap: () => selectAll(fiber),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onChanged: (value) {
                          setState(() {
                            foodDirty = true;
                          });
                        },
                        onSubmitted: (value) => save(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (imageFile?.isNotEmpty == true &&
                    settings.showImages &&
                    !kIsWeb) ...[
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: Image.file(
                      File(imageFile!),
                      errorBuilder: (context, error, stackTrace) =>
                          TextButton.icon(
                        onPressed: setImage,
                        label: const Text('Image error'),
                        icon: const Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
                if (settings.showImages && imageFile == null) ...[
                  const SizedBox(height: 8),
                  TextButton.icon(
                    icon: const Icon(Icons.image),
                    label: const Text('Set image'),
                    onPressed: setImage,
                  ),
                ],
                if (imageFile != null && settings.showImages)
                  TextButton.icon(
                    icon: const Icon(Icons.delete),
                    label: const Text("Remove image"),
                    onPressed: () => setState(() {
                      imageFile = null;
                      foodDirty = true;
                    }),
                  ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: totalCell(
                        label: 'Calories per ${quantity.text} $shortUnit',
                        value: '${formatter.format(entryCalories)} kcal',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: totalCell(
                        label: 'Kilojoules',
                        value: '${formatter.format(entryKJ)} kJ',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: totalCell(
                        label: 'Protein',
                        value: '${formatter.format(entryProtein)} g',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: totalCell(
                        label: 'Carbs',
                        value: '${formatter.format(entryCarb)} g',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: totalCell(
                        label: 'Fat',
                        value: '${formatter.format(entryFat)} g',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: totalCell(
                        label: 'Fiber',
                        value: '${formatter.format(entryFiber)} g',
                      ),
                    ),
                  ],
                ),
              ], // end if (_selectedMealId == null)
              if (_selectedMealId != null) ...[
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: totalCell(
                        label: 'Calories per ${quantity.text} serving',
                        value:
                            '${formatter.format(_mealCalsPerServing * _num(quantity))} kcal',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: totalCell(
                        label: 'Kilojoules',
                        value:
                            '${formatter.format(_mealCalsPerServing * _num(quantity) * 4.184)} kJ',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: totalCell(
                        label: 'Protein',
                        value:
                            '${formatter.format(_mealProteinPerServing * _num(quantity))} g',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: totalCell(
                        label: 'Carbs',
                        value:
                            '${formatter.format(_mealCarbPerServing * _num(quantity))} g',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: totalCell(
                        label: 'Fat',
                        value:
                            '${formatter.format(_mealFatPerServing * _num(quantity))} g',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: totalCell(
                        label: 'Fiber',
                        value:
                            '${formatter.format(_mealFiberPerServing * _num(quantity))} g',
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ],
        ),
      ),
      floatingActionButton: (selectedFood != null || _selectedMealId != null)
          ? Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.paddingOf(context).bottom +
                    BottomNav.totalOverlayHeight,
              ),
              child: AnimatedFab(
                onTap: save,
                label: 'Save',
                icon: Icons.save,
                scroll: scrollCtrl,
              ),
            )
          : null,
    );
  }
}
