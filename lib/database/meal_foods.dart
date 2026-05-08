import 'package:drift/drift.dart';
import 'package:fit_book/database/foods.dart';
import 'package:fit_book/database/meals.dart';

class MealFoods extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get meal => integer().references(Meals, #id)();
  IntColumn get food => integer().references(Foods, #id)();
  RealColumn get quantity => real()();
  TextColumn get unit => text()();
}
