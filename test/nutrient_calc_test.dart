import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_tests.dart';

void main() {
  setUp(mockTests);

  test('mealAwareFieldExpr converts a non-gram diary unit to grams', () async {
    final foodId = await db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Chicken',
        calories: const Value(100),
        servingSize: const Value(100),
        servingUnit: const Value('grams'),
      ),
    );
    await db.diaries.insertOne(
      DiariesCompanion.insert(
        food: Value(foodId),
        created: DateTime.now(),
        quantity: 8,
        unit: 'ounces',
      ),
    );

    final row = await db.customSelect(
      'SELECT (${mealAwareFieldExpr('calories')}) AS val '
      'FROM diaries LEFT JOIN foods ON foods.id = diaries.food',
      readsFrom: {db.diaries, db.foods},
    ).getSingle();

    expect(row.read<double>('val'), closeTo(8 * 28.35, 0.001));
  });

  test(
    'mealAwareFieldExpr applies a meal-food serving_unit conversion instead '
    'of treating serving_size as grams',
    () async {
      final foodId = await db.foods.insertOne(
        FoodsCompanion.insert(
          name: 'Almonds',
          calories: const Value(200),
          servingSize: const Value(4),
          servingUnit: const Value('ounces'),
        ),
      );
      final mealId = await db.meals.insertOne(
        MealsCompanion.insert(name: 'Snack', created: DateTime.now()),
      );
      await db.mealFoods.insertOne(
        MealFoodsCompanion.insert(
          meal: mealId,
          food: foodId,
          quantity: 2,
          unit: 'serving',
        ),
      );
      await db.diaries.insertOne(
        DiariesCompanion.insert(
          food: const Value.absent(),
          meal: Value(mealId),
          created: DateTime.now(),
          quantity: 1,
          unit: 'serving',
        ),
      );

      final row = await db.customSelect(
        'SELECT (${mealAwareFieldExpr('calories')}) AS val '
        'FROM diaries LEFT JOIN foods ON foods.id = diaries.food',
        readsFrom: {db.diaries, db.foods, db.mealFoods, db.meals},
      ).getSingle();

      // 4oz serving = 113.4g providing 200kcal; 2 servings = 226.8g -> 400kcal.
      expect(row.read<double>('val'), closeTo(400, 0.001));
    },
  );

  test(
    'mealFoodsFieldSumSql agrees with mealAwareFieldExpr for the same meal',
    () async {
      final foodId = await db.foods.insertOne(
        FoodsCompanion.insert(
          name: 'Almonds',
          proteinG: const Value(20),
          servingSize: const Value(4),
          servingUnit: const Value('ounces'),
        ),
      );
      final mealId = await db.meals.insertOne(
        MealsCompanion.insert(name: 'Snack', created: DateTime.now()),
      );
      await db.mealFoods.insertOne(
        MealFoodsCompanion.insert(
          meal: mealId,
          food: foodId,
          quantity: 2,
          unit: 'serving',
        ),
      );

      final row = await db.customSelect(
        'SELECT meal_foods.meal, ${mealFoodsFieldSumSql('protein_g')} '
        'AS total FROM meal_foods '
        'INNER JOIN foods ON foods.id = meal_foods.food '
        'GROUP BY meal_foods.meal',
        readsFrom: {db.mealFoods, db.foods},
      ).getSingle();

      // 4oz serving = 113.4g providing 20g protein; 2 servings -> 40g.
      expect(row.read<double>('total'), closeTo(40, 0.001));
      expect(row.read<int>('meal'), mealId);
    },
  );
}
