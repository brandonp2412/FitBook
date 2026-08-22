// ignore_for_file: experimental_member_use
import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:drift/drift.dart';
import 'package:drift/internal/versioned_schema.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.steps.dart';
import 'package:fit_book/database/diaries.dart';
import 'package:fit_book/database/foods.dart';
import 'package:fit_book/database/meal_foods.dart';
import 'package:fit_book/database/meals.dart';
import 'package:fit_book/database/metadata.dart';
import 'package:fit_book/database/settings.dart';
import 'package:fit_book/database/weights.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';

import 'database_connection_web.dart'
    if (dart.library.io) 'database_connection_native.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Foods, Diaries, Weights, Settings, Metadata, Meals, MealFoods],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? executor, bool? dontLog})
      : super(
          executor ??
              (kIsWeb ? createWebConnection() : createNativeConnection()),
        );

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        final blob = await rootBundle.load('assets/food-data.zip');
        final archive = ZipDecoder().decodeBytes(
          blob.buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes),
        );
        List<int> bytes = archive.first.content;
        final json = utf8.decode(bytes);
        List<dynamic> rows = jsonDecode(json);
        List<Insertable<Food>> insertables = [];

        for (final row in rows) {
          Map<String, Expression<Object>> map = {};
          for (var entry in row.entries) {
            map[entry.key] = Variable(entry.value);
          }
          insertables.add(RawValuesInsertable<Food>(map));
        }

        await db.foods.insertAll(insertables);

        await settings.insertOne(defaultSettings);
      },
      onUpgrade: (m, from, to) async {
        // Following the advice from https://drift.simonbinder.eu/Migrations/api/#general-tips
        await customStatement('PRAGMA foreign_keys = OFF');

        await transaction(() async {
          await VersionedSchema.runMigrationSteps(
            migrator: m,
            from: from,
            to: to,
            steps: _upgrade,
          );
        });

        if (kDebugMode) {
          final wrongForeignKeys =
              await customSelect('PRAGMA foreign_key_check').get();
          assert(
            wrongForeignKeys.isEmpty,
            '${wrongForeignKeys.map((e) => e.data)}',
          );
        }

        await customStatement('PRAGMA foreign_keys = ON');
      },
      beforeOpen: (details) async {
        // A device that already attempted the 51 -> 52 migration may have
        // reached schema 52 before its old orphaned rows were reported. Make
        // the repair idempotent so that database can recover on the next app
        // launch as well. Historical schema verification also invokes this
        // callback, so don't refer to tables or columns introduced after the
        // schema currently being opened.
        if (details.versionNow < 52) return;

        await customUpdate('''
          UPDATE diaries SET food = NULL
          WHERE food IS NOT NULL
            AND NOT EXISTS (SELECT 1 FROM foods WHERE foods.id = diaries.food)
        ''');
        await customUpdate('''
          UPDATE diaries SET meal = NULL
          WHERE meal IS NOT NULL
            AND NOT EXISTS (SELECT 1 FROM meals WHERE meals.id = diaries.meal)
        ''');
        await customUpdate('''
          DELETE FROM meal_foods
          WHERE NOT EXISTS (SELECT 1 FROM foods WHERE foods.id = meal_foods.food)
             OR NOT EXISTS (SELECT 1 FROM meals WHERE meals.id = meal_foods.meal)
        ''');
      },
    );
  }

  static final _upgrade = migrationSteps(
    from1To3: (m, schema) async {
      await m.create(schema.entries);
      await m.drop(schema.foods);
      await m.create(schema.foods);
    },
    from3To4: (m, schema) async {
      await m.addColumn(schema.entries, schema.entries.kCalories);
      await m.addColumn(schema.entries, schema.entries.proteinG);
      await m.addColumn(schema.entries, schema.entries.carbG);
      await m.addColumn(schema.entries, schema.entries.fatG);
      await m.alterTable(TableMigration(schema.entries));
    },
    from4To5: (m, schema) async {},
    from5To6: (m, schema) async {
      await m.createIndex(
        Index(
          'Foods',
          "CREATE INDEX IF NOT EXISTS foods_name ON foods(name);",
        ),
      );
    },
    from6To7: (m, schema) async {
      await m.createTable(schema.weights);
      await m.createIndex(
        Index(
          'Foods',
          "CREATE INDEX IF NOT EXISTS foods_name ON foods(name);",
        ),
      );
    },
    from7To8: (m, schema) async {
      await m.addColumn(schema.foods, schema.foods.favorite);
    },
    from8To9: (m, schema) async {
      await m.createIndex(
        Index('Foods', 'CREATE INDEX IF NOT EXISTS foods_id ON foods(id)'),
      );
      await m.createIndex(
        Index(
          'Entries',
          'CREATE INDEX IF NOT EXISTS entries_id ON entries(id)',
        ),
      );
    },
    from9To10: (m, schema) async {
      await m.addColumn(schema.foods, schema.foods.servingUnit);
    },
    from10To11: (m, schema) async {},
    from11To12: (Migrator m, Schema12 schema) async {
      await m.addColumn(schema.foods, schema.foods.servingSize);
    },
    from12To13: (Migrator m, Schema13 schema) async {
      // Serving size wasn't properly initialized in version 12.
      // It needed to be added in onCreate as well.
      await m
          .addColumn(schema.foods, schema.foods.servingSize)
          .catchError((_) {});
    },
    from13To14: (Migrator m, Schema14 schema) async {
      await m.createTable(schema.settings);
    },
    from14To15: (Migrator m, Schema15 schema) async {
      await m.addColumn(schema.settings, schema.settings.shortDateFormat);
      material.ThemeMode themeMode = material.ThemeMode.system;
      String longDateFormat = 'dd/MM/yy';
      String shortDateFormat = 'd/M/yy';
      String entryUnit = 'grams';
      String foodUnit = 'grams';
      DiarySummary diarySummary = DiarySummary.division;

      bool systemColors = false;
      bool curveLines = false;
      bool showOthers = false;
      bool favoriteNew = false;
      bool selectEntryOnSubmit = false;
      bool notifications = false;

      int? dailyCals;
      int? dailyProtein;
      int? dailyFat;
      int? dailyCarbs;
      double? targetWeight;

      await (schema.settings.insertOne(
        RawValuesInsertable({
          "long_date_format": Variable(longDateFormat),
          "short_date_format": Variable(shortDateFormat),
          "entry_unit": Variable(entryUnit),
          "food_unit": Variable(foodUnit),
          "theme_mode": Variable(themeMode.toString()),
          "curve_lines": Variable(curveLines),
          "diary_summary": Variable(diarySummary.toString()),
          "favorite_new": Variable(favoriteNew),
          "notifications": Variable(notifications),
          "select_entry_on_submit": Variable(selectEntryOnSubmit),
          "show_others": Variable(showOthers),
          "system_colors": Variable(systemColors),
          "daily_calories": Variable(dailyCals),
          "daily_carb": Variable(dailyCarbs),
          "daily_fat": Variable(dailyFat),
          "daily_protein": Variable(dailyProtein),
          "target_weight": Variable(targetWeight),
        }),
      ));
    },
    from15To16: (Migrator m, Schema16 schema) async {
      await (schema.foods.update()
            ..where((u) => const CustomExpression("serving_unit is null")))
          .write(
        const RawValuesInsertable({"serving_unit": Variable("grams")}),
      );
      await (schema.foods.update()
            ..where((u) => const CustomExpression("serving_size is null")))
          .write(
        const RawValuesInsertable({"serving_size": Variable(100)}),
      );
    },
    from16To17: (Migrator m, Schema17 schema) async {
      await m.addColumn(schema.foods, schema.foods.smallImage);
      await m.addColumn(schema.foods, schema.foods.bigImage);
      await m.addColumn(schema.foods, schema.foods.imageFile);
      await m.addColumn(schema.settings, schema.settings.showImages);
    },
    from17To18: (Migrator m, Schema18 schema) async {
      // Because I forgot to add these statements in onCreate at version 17
      // we need to do it again to fix people who installed the app at 17.
      await m
          .addColumn(schema.foods, schema.foods.smallImage)
          .catchError((_) {});
      await m.addColumn(schema.foods, schema.foods.bigImage).catchError((_) {});
      await m
          .addColumn(schema.foods, schema.foods.imageFile)
          .catchError((_) {});
    },
    from18To19: (Migrator m, Schema19 schema) async {
      await m.addColumn(schema.foods, schema.foods.created);
    },
    from19To20: (Migrator m, Schema20 schema) async {
      await m.addColumn(schema.foods, schema.foods.barcode);
    },
    from20To21: (Migrator m, Schema21 schema) async {
      await m.addColumn(schema.settings, schema.settings.offLogin);
      await m.addColumn(schema.settings, schema.settings.offPassword);
    },
    from21To22: (Migrator m, Schema22 schema) async {
      await m.createIndex(
        Index(
          'Foods',
          "CREATE INDEX IF NOT EXISTS foods_created ON foods(created);",
        ),
      );
      await m.createIndex(
        Index(
          'Foods',
          "CREATE INDEX IF NOT EXISTS foods_favorite ON foods(favorite);",
        ),
      );
    },
    from22To23: (Migrator m, Schema23 schema) async {
      await m.addColumn(
        schema.settings,
        schema.settings.positiveReinforcement,
      );
      await m.addColumn(schema.settings, schema.settings.reminders);

      final result = await (schema.settings.select()).getSingleOrNull();
      if (result != null) {
        final positive = result.read<bool>('notifications');
        await schema.settings.update().write(
              RawValuesInsertable(
                {'positive_reinforcement': Variable(positive)},
              ),
            );
      }

      await m.alterTable(TableMigration(schema.settings));
    },
    from23To24: (Migrator m, Schema24 schema) async {
      await m.addColumn(schema.settings, schema.settings.tabs);
    },
    from24To25: (Migrator m, Schema25 schema) async {
      await m.addColumn(schema.settings, schema.settings.lastGraph);
    },
    from25To26: (m, schema) async {
      await m.addColumn(schema.entries, schema.entries.sodiumG);
      await m.addColumn(schema.entries, schema.entries.fiberG);
    },
    from26To27: (Migrator m, Schema27 schema) async {
      await m.addColumn(schema.settings, schema.settings.automaticBackups);
      await m.addColumn(schema.settings, schema.settings.backupPath);
    },
    from27To28: (Migrator m, Schema28 schema) async {
      await m.alterTable(TableMigration(schema.settings));
    },
    from28To29: (Migrator m, Schema29 schema) async {
      await m.addColumn(schema.settings, schema.settings.limit);
    },
    from29To30: (Migrator m, Schema30 schema) async {
      await m.addColumn(schema.settings, schema.settings.convertWeight);
    },
    from30To31: (Migrator m, Schema31 schema) async {
      await m.addColumn(schema.weights, schema.weights.image);
    },
    from31To32: (Migrator m, Schema32 schema) async {
      await m.addColumn(schema.settings, schema.settings.fields);
    },
    from32To33: (Migrator m, Schema33 schema) async {
      await m.alterTable(TableMigration(schema.settings));
    },
    from33To34: (Migrator m, Schema34 schema) async {
      await schema.settings
          .update()
          .write(RawValuesInsertable({'last_graph': Constant('calories')}));
    },
    from34To35: (Migrator m, Schema35 schema) async {
      await m.addColumn(schema.settings, schema.settings.autoCalc);
    },
    from35To36: (Migrator m, Schema36 schema) async {
      await m.dropColumn(schema.entries, "k_calories");
      await m.dropColumn(schema.entries, "protein_g");
      await m.dropColumn(schema.entries, "fat_g");
      await m.dropColumn(schema.entries, "carb_g");
      await m.dropColumn(schema.entries, "sodium_g");
      await m.dropColumn(schema.entries, "fiber_g");
    },
    from36To37: (Migrator m, Schema37 schema) async {
      await m.database.customUpdate(
        "UPDATE foods SET calories = 100, serving_unit = 'grams' WHERE name = 'Quick-add'",
      );
    },
    from37To38: (Migrator m, Schema38 schema) async {
      await m.database.customUpdate("""
        UPDATE foods SET 
          protein_g = 0,
          fat_g = 0,
          carbohydrate_g = 0,
          sodium_mg = 0,
          fiber_g = 0
        WHERE name = 'Quick-add'
      """);
    },
    from38To39: (Migrator m, Schema39 schema) async {
      await m.database.customUpdate("""UPDATE settings 
        SET fields='calories,protein_g,carbohydrate_g,fat_g,fiber_g'
        WHERE fields IS NULL
        """);
    },
    from39To40: (Migrator m, Schema40 schema) async {
      await m.addColumn(schema.settings, schema.settings.dailyFiber);
    },
    from40To41: (Migrator m, Schema41 schema) async {
      await m.createTable(schema.diaries);
      await m.database.customStatement(
        "INSERT INTO ${schema.diaries.actualTableName} SELECT * FROM entries",
      );
      await m.database.customStatement("DROP TABLE entries");
    },
    from41To42: (Migrator m, Schema42 schema) async {
      await m.addColumn(schema.settings, schema.settings.scrollableTabs);
    },
    from42To43: (Migrator m, Schema43 schema) async {
      await m.addColumn(schema.settings, schema.settings.compactDiary);
    },
    from43To44: (Migrator m, Schema44 schema) async {
      await m.createTable(schema.metadata);
    },
    from44To45: (Migrator m, Schema45 schema) async {
      await m.addColumn(schema.settings, schema.settings.compactWeights);
    },
    from45To46: (Migrator m, Schema46 schema) async {
      await m.database.customUpdate("""UPDATE settings
        SET entry_unit='grams'
        WHERE entry_unit='serving'
        """);
      await m.database.customUpdate("""UPDATE settings
        SET food_unit='grams'
        WHERE food_unit='serving'
        """);
    },
    from46To47: (Migrator m, Schema47 schema) async {
      await m.createTable(schema.meals);
      await m.createTable(schema.mealFoods);
    },
    from47To48: (Migrator m, Schema48 schema) async {
      await m.addColumn(schema.meals, schema.meals.imageFile);
    },
    from48To49: (Migrator m, Schema49 schema) async {
      await m.addColumn(schema.diaries, schema.diaries.meal);
    },
    from49To50: (Migrator m, Schema50 schema) async {
      await m.addColumn(
        schema.settings,
        schema.settings.graphsStartAtZero,
      );
    },
    from50To51: (Migrator m, Schema51 schema) async {
      await m.createIndex(schema.foodsFavoriteCreatedIdx);
      await m.createIndex(schema.foodsBarcodeIdx);
      await m.createIndex(schema.diariesCreatedIdx);
      await m.createIndex(schema.diariesFoodCreatedIdx);
      await m.createIndex(schema.diariesMealIdx);
      await m.createIndex(schema.weightsCreatedIdx);
      await m.createIndex(schema.mealsCreatedIdx);
      await m.createIndex(schema.mealFoodsMealIdx);
      await m.createIndex(schema.mealFoodsFoodIdx);
    },
    from51To52: (Migrator m, Schema51 schema) async {
      // Older versions allowed food/meal deletes to leave orphaned diary rows.
      // Keep those diary records, but clear the broken optional relationship so
      // the foreign-key audit after this migration can succeed.
      await m.database.customUpdate('''
        UPDATE diaries SET food = NULL
        WHERE food IS NOT NULL
          AND NOT EXISTS (SELECT 1 FROM foods WHERE foods.id = diaries.food)
      ''');
      await m.database.customUpdate('''
        UPDATE diaries SET meal = NULL
        WHERE meal IS NOT NULL
          AND NOT EXISTS (SELECT 1 FROM meals WHERE meals.id = diaries.meal)
      ''');
      await m.database.customUpdate('''
        DELETE FROM meal_foods
        WHERE NOT EXISTS (SELECT 1 FROM foods WHERE foods.id = meal_foods.food)
           OR NOT EXISTS (SELECT 1 FROM meals WHERE meals.id = meal_foods.meal)
      ''');

      // Nutrients used to be stored per configured serving. Normalize every
      // nutrient column so food values are consistently per 100g; serving
      // size/unit remain only for resolving diary and meal servings.
      const nonNutrientColumns = {
        'id',
        'serving_size',
        '_200_calorie_weight_g',
        'serving_weight_1_g',
        'serving_weight_2_g',
        'serving_weight_3_g',
        'serving_weight_4_g',
        'serving_weight_5_g',
        'serving_weight_6_g',
        'serving_weight_7_g',
        'serving_weight_8_g',
        'serving_weight_9_g',
      };
      final columns =
          await m.database.customSelect('PRAGMA table_info(foods)').get();
      final nutrientColumns = columns
          .where(
            (column) =>
                column.read<String>('type').toUpperCase() == 'REAL' &&
                !nonNutrientColumns.contains(column.read<String>('name')),
          )
          .map((column) => column.read<String>('name'));
      const servingGrams = '''CASE
        WHEN serving_size IS NULL THEN 100
        WHEN serving_unit IS NULL THEN serving_size
        WHEN serving_unit = 'ounces' THEN serving_size * 28.35
        WHEN serving_unit = 'grams' THEN serving_size
        WHEN serving_unit = 'milliliters' THEN serving_size
        WHEN serving_unit = 'milligrams' THEN serving_size / 1000.0
        WHEN serving_unit = 'cups' THEN serving_size * 250
        WHEN serving_unit = 'tablespoons' THEN serving_size * 15
        WHEN serving_unit = 'teaspoons' THEN serving_size * 5
        WHEN serving_unit = 'pounds' THEN serving_size * 453.592
        WHEN serving_unit = 'kilograms' THEN serving_size * 1000
        WHEN serving_unit = 'liters' THEN serving_size * 1000
        WHEN serving_unit = 'serving' THEN serving_size
        ELSE 100
      END''';
      for (final column in nutrientColumns) {
        await m.database.customUpdate(
          'UPDATE foods SET "$column" = "$column" * 100.0 '
          '/ NULLIF(($servingGrams), 0.0) WHERE "$column" IS NOT NULL',
        );
      }
    },
    from52To53: (Migrator m, Schema51 schema) async {
      // Version 52 incorrectly normalized existing nutrient values. Apply the
      // exact inverse so all existing foods return to their original values.
      const nonNutrientColumns = {
        'id',
        'serving_size',
        '_200_calorie_weight_g',
        'serving_weight_1_g',
        'serving_weight_2_g',
        'serving_weight_3_g',
        'serving_weight_4_g',
        'serving_weight_5_g',
        'serving_weight_6_g',
        'serving_weight_7_g',
        'serving_weight_8_g',
        'serving_weight_9_g',
      };
      final columns =
          await m.database.customSelect('PRAGMA table_info(foods)').get();
      final nutrientColumns = columns
          .where(
            (column) =>
                column.read<String>('type').toUpperCase() == 'REAL' &&
                !nonNutrientColumns.contains(column.read<String>('name')),
          )
          .map((column) => column.read<String>('name'));
      const servingGrams = '''CASE
        WHEN serving_size IS NULL THEN 100
        WHEN serving_unit IS NULL THEN serving_size
        WHEN serving_unit = 'ounces' THEN serving_size * 28.35
        WHEN serving_unit = 'grams' THEN serving_size
        WHEN serving_unit = 'milliliters' THEN serving_size
        WHEN serving_unit = 'milligrams' THEN serving_size / 1000.0
        WHEN serving_unit = 'cups' THEN serving_size * 250
        WHEN serving_unit = 'tablespoons' THEN serving_size * 15
        WHEN serving_unit = 'teaspoons' THEN serving_size * 5
        WHEN serving_unit = 'pounds' THEN serving_size * 453.592
        WHEN serving_unit = 'kilograms' THEN serving_size * 1000
        WHEN serving_unit = 'liters' THEN serving_size * 1000
        WHEN serving_unit = 'serving' THEN serving_size
        ELSE 100
      END''';
      for (final column in nutrientColumns) {
        await m.database.customUpdate(
          'UPDATE foods SET "$column" = "$column" * ($servingGrams) '
          '/ 100.0 WHERE "$column" IS NOT NULL',
        );
      }
    },
    from53To54: (Migrator m, Schema51 schema) async {
      await m.database.customStatement(
        "ALTER TABLE settings ADD COLUMN navigation_animation "
        "TEXT NOT NULL DEFAULT 'fade'",
      );
    },
    from54To55: (Migrator m, Schema51 schema) async {
      await m.database.customStatement(
        "ALTER TABLE settings ADD COLUMN graph_series "
        "TEXT NOT NULL DEFAULT 'value,goal'",
      );
    },
  );

  @override
  int get schemaVersion => 55;
}
