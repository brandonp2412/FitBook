import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/food/food_filters.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealPage extends StatefulWidget {
  final List<int>? ids;

  const MealPage({super.key, this.ids});

  @override
  createState() => _MealPageState();
}

class PickedFood {
  final int id;
  double quantity;
  String unit;

  PickedFood({required this.id, required this.quantity, required this.unit});
}

class _MealPageState extends State<MealPage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController servingSizeGtController = TextEditingController();
  final TextEditingController servingSizeLtController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String? unit;
  String? groupFilter;
  String? unitFilter;
  FoodsCompanion? selectedFood;
  List<PickedFood> pickedFoods = [];
  bool showPicked = false;

  late Stream<List<TypedResult>> stream;

  @override
  void initState() {
    super.initState();
    setStream();
  }

  void setStream() {
    var query = (db.foods.selectOnly()
      ..addColumns([
        db.foods.id,
        db.foods.name,
        db.foods.calories,
        db.foods.favorite,
        db.foods.servingSize,
        db.foods.servingUnit,
        db.foods.smallImage,
        db.foods.imageFile,
      ])
      ..orderBy([
        OrderingTerm(
          expression: db.foods.favorite,
          mode: OrderingMode.desc,
        ),
        OrderingTerm(
          expression: db.foods.created,
          mode: OrderingMode.desc,
        ),
      ])
      ..limit(100));

    if (searchController.text.isNotEmpty)
      query = query
        ..where(db.foods.name.contains(searchController.text.toLowerCase()));
    if (groupFilter != null)
      query = query..where(db.foods.foodGroup.equals(groupFilter!));
    if (unitFilter != null)
      query = query..where(db.foods.servingUnit.equals(unitFilter!));
    if (servingSizeGtController.text.isNotEmpty)
      query = query
        ..where(
          db.foods.servingSize
              .isBiggerThanValue(double.parse(servingSizeGtController.text)),
        );
    if (servingSizeLtController.text.isNotEmpty)
      query = query
        ..where(
          db.foods.servingSize
              .isSmallerThanValue(double.parse(servingSizeLtController.text)),
        );
    if (showPicked)
      query = query..where(db.foods.id.isIn(pickedFoods.map((p) => p.id)));

    setState(() {
      stream = query.watch();
    });
  }

  List<FoodsCompanion> resultsToCompanions(List<TypedResult> results) => results
      .map(
        (result) => FoodsCompanion(
          id: Value(result.read(db.foods.id)!),
          name: Value(result.read(db.foods.name)!),
          calories: Value(result.read(db.foods.calories)),
          favorite: Value(result.read(db.foods.favorite)),
          servingSize: Value(result.read(db.foods.servingSize)),
          servingUnit: Value(result.read(db.foods.servingUnit)),
          imageFile: Value(result.read(db.foods.imageFile)),
          smallImage: Value(result.read(db.foods.smallImage)),
        ),
      )
      .toList();

  void setFields(FoodsCompanion food) {
    setState(() {
      selectedFood = food;
    });

    final pickedIndex = pickedFoods.indexWhere((p) => p.id == food.id.value);
    if (pickedIndex == -1)
      return setState(() {
        unit = 'serving';
        quantityController.text = '1';
      });

    final picked = pickedFoods[pickedIndex];
    setState(() {
      quantityController.text = picked.quantity.toString();
      unit = picked.unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    return Scaffold(
      appBar: AppBar(
        title: Text("Create a Meal"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.restaurant))],
      ),
      body: material.Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
              onChanged: (_) => setState(() {}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: SearchBar(
              controller: searchController,
              padding: WidgetStateProperty.all(
                const EdgeInsets.only(right: 8.0),
              ),
              hintText: 'Search...',
              onChanged: (value) => setStream(),
              leading: searchController.text.isEmpty == true
                  ? const Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 8.0),
                      child: Icon(Icons.search),
                    )
                  : IconButton(
                      onPressed: () {
                        searchController.text = '';
                        setStream();
                      },
                      icon: const Icon(Icons.arrow_back),
                      tooltip: 'Clear',
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 8.0,
                      ),
                    ),
              trailing: [
                IconButton(
                  tooltip: "Only show picked foods",
                  onPressed: () {
                    setState(() {
                      showPicked = !showPicked;
                    });
                    setStream();
                  },
                  icon: showPicked
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                FoodFilters(
                  onChange: ({foodGroup, servingUnit}) {
                    setState(() {
                      groupFilter = foodGroup;
                      unitFilter = servingUnit;
                    });
                    setStream();
                  },
                  servingSizeGtController: servingSizeGtController,
                  servingSizeLtController: servingSizeLtController,
                  servingUnit: unitFilter,
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return SizedBox();
                final foods = resultsToCompanions(snapshot.data ?? []);

                return ListView.builder(
                  padding: EdgeInsets.only(top: 8),
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    Widget? image;
                    if (settings.showImages) {
                      if (food.imageFile.value?.isNotEmpty == true)
                        image = Image.file(File(food.imageFile.value!));
                      else if (food.smallImage.value?.isNotEmpty == true)
                        image = material.SizedBox(
                          height: 80,
                          width: 50,
                          child: CachedNetworkImage(
                            imageUrl: food.smallImage.value!,
                          ),
                        );
                    }

                    return ListTile(
                      leading: image,
                      title: Text(food.name.value),
                      subtitle: Text(
                        "${food.calories.value?.toStringAsFixed(0) ?? 0} kcal",
                      ),
                      onTap: () => setFields(food),
                      trailing: Checkbox(
                        value: pickedFoods
                                .indexWhere((f) => f.id == food.id.value) !=
                            -1,
                        onChanged: (value) {
                          if (nameController.text.isEmpty)
                            nameController.text = food.name.value;
                          setState(() {
                            if (value == true) {
                              pickedFoods.add(
                                PickedFood(
                                  id: food.id.value,
                                  quantity: 1,
                                  unit: 'serving',
                                ),
                              );
                              setFields(food);
                            } else
                              pickedFoods
                                  .removeWhere((f) => f.id == food.id.value);
                          });
                        },
                      ),
                    );
                  },
                  itemCount: foods.length,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              enabled: selectedFood != null,
              controller: quantityController,
              textInputAction: TextInputAction.next,
              onTap: () => selectAll(quantityController),
              onChanged: (value) {
                final index = pickedFoods
                    .indexWhere((f) => f.id == selectedFood?.id.value);
                setState(() {
                  pickedFoods[index].quantity = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText:
                    'Quantity (${selectedFood?.name.value ?? "Pick a food first"})',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 88),
            child: DropdownButtonFormField<String>(
              value: unit,
              decoration: InputDecoration(
                labelText:
                    'Serving unit (${selectedFood?.name.value ?? "Pick a food first"})',
                enabled: selectedFood != null,
              ),
              items: unitOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: selectedFood == null
                  ? null
                  : (String? newValue) {
                      final index = pickedFoods
                          .indexWhere((f) => f.id == selectedFood?.id.value);
                      setState(() {
                        pickedFoods[index].unit = newValue!;
                        unit = newValue;
                      });
                    },
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedScale(
        scale:
            nameController.text.isNotEmpty && pickedFoods.isNotEmpty ? 1.0 : 0,
        duration: const Duration(milliseconds: 150),
        child: Visibility(
          visible: nameController.text.isNotEmpty && pickedFoods.isNotEmpty,
          child: FloatingActionButton.extended(
            onPressed: () async {
              final columns = db.foods.$columns
                  .where((column) => column.type == DriftSqlType.double)
                  .toList();
              Map<String, Variable<double>> combinedFood = {};

              for (final picked in pickedFoods) {
                final food = await (db.foods.select()
                      ..where((u) => u.id.equals(picked.id)))
                    .getSingle();
                final foodCols = food.toColumns(true);

                for (final column in columns) {
                  if (combinedFood[column.name] == null)
                    combinedFood[column.name] = foodCols[column.name] == null
                        ? Variable(0)
                        : (foodCols[column.name] as Variable<double>);
                  else if (foodCols[column.name] != null)
                    combinedFood[column.name] = Variable(
                      ((combinedFood[column.name] as Variable<double>).value! +
                          (foodCols[column.name] as Variable<num>).value!),
                    );
                }
              }

              await (db.foods.insertOne(
                RawValuesInsertable({
                  "name": Variable(nameController.text),
                  "created": Variable(DateTime.now()),
                  "favorite": Variable(settings.favoriteNew),
                  "serving_unit": Variable("serving"),
                  "serving_size": Variable(1),
                  ...combinedFood,
                }),
              ));

              if (context.mounted) Navigator.pop(context);
            },
            label: Text("Save"),
            icon: Icon(Icons.save),
          ),
        ),
      ),
    );
  }
}
