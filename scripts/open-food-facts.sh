#!/bin/bash

set -ex

fields="product_name,food_groups,energy-kcal_100g,fat_100g,proteins_100g,carbohydrates_100g,sugars_100g,fiber_100g,serving_size,serving_quantity,code"
csvcut -t -c "$fields" en.openfoodfacts.org.products.csv >foods.csv
sqlite3 "CREATE TEMP TABLE foods_import(
  name TEXT,
  food_group TEXT,
  calories REAL,
  fat_g REAL,
  protein_g REAL,
  carbohydrate_g REAL,
  sugars_g REAL,
  fiber_g REAL,
  serving_size REAL,
  serving_unit TEXT,
  barcode TEXT
);
.mode csv;
.import ./foods.csv foods_import;
DELETE FROM foods_import WHERE calories = '';
DELETE FROM foods_import WHERE name = '';
UPDATE foods_import SET fat_g = null WHERE fat_g = '';
UPDATE foods_import SET protein_g = null WHERE protein_g = '';
UPDATE foods_import SET carbohydrate_g = null WHERE carbohydrate_g = '';
UPDATE foods_import SET sugars_g = null WHERE sugars_g = '';
UPDATE foods_import SET fiber_g = null WHERE fiber_g = '';
UPDATE foods_import SET serving_size = null WHERE serving_size = '';
INSERT INTO foods(name,food_group,calories,fat_g,protein_g,
  carbohydrate_g,sugars_g,fiber_g,serving_unit,serving_size,barcode)
  SELECT * FROM foods_import;
"
