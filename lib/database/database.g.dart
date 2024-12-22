// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addedSugarGMeta =
      const VerificationMeta('addedSugarG');
  @override
  late final GeneratedColumn<double> addedSugarG = GeneratedColumn<double>(
      'added_sugar_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _alanineMgMeta =
      const VerificationMeta('alanineMg');
  @override
  late final GeneratedColumn<double> alanineMg = GeneratedColumn<double>(
      'alanine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _alcoholGMeta =
      const VerificationMeta('alcoholG');
  @override
  late final GeneratedColumn<double> alcoholG = GeneratedColumn<double>(
      'alcohol_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _arginineMgMeta =
      const VerificationMeta('arginineMg');
  @override
  late final GeneratedColumn<double> arginineMg = GeneratedColumn<double>(
      'arginine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asparticAcidMgMeta =
      const VerificationMeta('asparticAcidMg');
  @override
  late final GeneratedColumn<double> asparticAcidMg = GeneratedColumn<double>(
      'aspartic_acid_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _betaineMgMeta =
      const VerificationMeta('betaineMg');
  @override
  late final GeneratedColumn<double> betaineMg = GeneratedColumn<double>(
      'betaine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _bigImageMeta =
      const VerificationMeta('bigImage');
  @override
  late final GeneratedColumn<String> bigImage = GeneratedColumn<String>(
      'big_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _biotinB7McgMeta =
      const VerificationMeta('biotinB7Mcg');
  @override
  late final GeneratedColumn<double> biotinB7Mcg = GeneratedColumn<double>(
      'biotin_b7_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _caffeineMgMeta =
      const VerificationMeta('caffeineMg');
  @override
  late final GeneratedColumn<double> caffeineMg = GeneratedColumn<double>(
      'caffeine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _calciumMgMeta =
      const VerificationMeta('calciumMg');
  @override
  late final GeneratedColumn<double> calciumMg = GeneratedColumn<double>(
      'calcium_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
      'calories', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _carbohydrateGMeta =
      const VerificationMeta('carbohydrateG');
  @override
  late final GeneratedColumn<double> carbohydrateG = GeneratedColumn<double>(
      'carbohydrate_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _caroteneAlphaMcgMeta =
      const VerificationMeta('caroteneAlphaMcg');
  @override
  late final GeneratedColumn<double> caroteneAlphaMcg = GeneratedColumn<double>(
      'carotene_alpha_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _caroteneBetaMcgMeta =
      const VerificationMeta('caroteneBetaMcg');
  @override
  late final GeneratedColumn<double> caroteneBetaMcg = GeneratedColumn<double>(
      'carotene_beta_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _chlorineMgMeta =
      const VerificationMeta('chlorineMg');
  @override
  late final GeneratedColumn<double> chlorineMg = GeneratedColumn<double>(
      'chlorine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cholesterolMgMeta =
      const VerificationMeta('cholesterolMg');
  @override
  late final GeneratedColumn<double> cholesterolMg = GeneratedColumn<double>(
      'cholesterol_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cholineMgMeta =
      const VerificationMeta('cholineMg');
  @override
  late final GeneratedColumn<double> cholineMg = GeneratedColumn<double>(
      'choline_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _copperCuMgMeta =
      const VerificationMeta('copperCuMg');
  @override
  late final GeneratedColumn<double> copperCuMg = GeneratedColumn<double>(
      'copper_cu_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cystineMgMeta =
      const VerificationMeta('cystineMg');
  @override
  late final GeneratedColumn<double> cystineMg = GeneratedColumn<double>(
      'cystine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _dihydrophylloquinoneMcgMeta =
      const VerificationMeta('dihydrophylloquinoneMcg');
  @override
  late final GeneratedColumn<double> dihydrophylloquinoneMcg =
      GeneratedColumn<double>('dihydrophylloquinone_mcg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fatGMeta = const VerificationMeta('fatG');
  @override
  late final GeneratedColumn<double> fatG = GeneratedColumn<double>(
      'fat_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fattyAcidsTotalMonounsaturatedMgMeta =
      const VerificationMeta('fattyAcidsTotalMonounsaturatedMg');
  @override
  late final GeneratedColumn<double> fattyAcidsTotalMonounsaturatedMg =
      GeneratedColumn<double>(
          'fatty_acids_total_monounsaturated_mg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fattyAcidsTotalPolyunsaturatedMgMeta =
      const VerificationMeta('fattyAcidsTotalPolyunsaturatedMg');
  @override
  late final GeneratedColumn<double> fattyAcidsTotalPolyunsaturatedMg =
      GeneratedColumn<double>(
          'fatty_acids_total_polyunsaturated_mg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _favoriteMeta =
      const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
      'favorite', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("favorite" IN (0, 1))'));
  static const VerificationMeta _fiberGMeta = const VerificationMeta('fiberG');
  @override
  late final GeneratedColumn<double> fiberG = GeneratedColumn<double>(
      'fiber_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fluorideFMcgMeta =
      const VerificationMeta('fluorideFMcg');
  @override
  late final GeneratedColumn<double> fluorideFMcg = GeneratedColumn<double>(
      'fluoride_f_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _folateB9McgMeta =
      const VerificationMeta('folateB9Mcg');
  @override
  late final GeneratedColumn<double> folateB9Mcg = GeneratedColumn<double>(
      'folate_b9_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _folateDfeMcgMeta =
      const VerificationMeta('folateDfeMcg');
  @override
  late final GeneratedColumn<double> folateDfeMcg = GeneratedColumn<double>(
      'folate_dfe_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _folicAcidMcgMeta =
      const VerificationMeta('folicAcidMcg');
  @override
  late final GeneratedColumn<double> folicAcidMcg = GeneratedColumn<double>(
      'folic_acid_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _foodFolateMcgMeta =
      const VerificationMeta('foodFolateMcg');
  @override
  late final GeneratedColumn<double> foodFolateMcg = GeneratedColumn<double>(
      'food_folate_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _foodGroupMeta =
      const VerificationMeta('foodGroup');
  @override
  late final GeneratedColumn<String> foodGroup = GeneratedColumn<String>(
      'food_group', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fructoseGMeta =
      const VerificationMeta('fructoseG');
  @override
  late final GeneratedColumn<double> fructoseG = GeneratedColumn<double>(
      'fructose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _galactoseGMeta =
      const VerificationMeta('galactoseG');
  @override
  late final GeneratedColumn<double> galactoseG = GeneratedColumn<double>(
      'galactose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _glucoseDextroseGMeta =
      const VerificationMeta('glucoseDextroseG');
  @override
  late final GeneratedColumn<double> glucoseDextroseG = GeneratedColumn<double>(
      'glucose_dextrose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _glutamicAcidMgMeta =
      const VerificationMeta('glutamicAcidMg');
  @override
  late final GeneratedColumn<double> glutamicAcidMg = GeneratedColumn<double>(
      'glutamic_acid_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _glycineMgMeta =
      const VerificationMeta('glycineMg');
  @override
  late final GeneratedColumn<double> glycineMg = GeneratedColumn<double>(
      'glycine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _histidineMgMeta =
      const VerificationMeta('histidineMg');
  @override
  late final GeneratedColumn<double> histidineMg = GeneratedColumn<double>(
      'histidine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _hydroxyprolineMgMeta =
      const VerificationMeta('hydroxyprolineMg');
  @override
  late final GeneratedColumn<double> hydroxyprolineMg = GeneratedColumn<double>(
      'hydroxyproline_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _imageFileMeta =
      const VerificationMeta('imageFile');
  @override
  late final GeneratedColumn<String> imageFile = GeneratedColumn<String>(
      'image_file', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _insolubleFiberGMeta =
      const VerificationMeta('insolubleFiberG');
  @override
  late final GeneratedColumn<double> insolubleFiberG = GeneratedColumn<double>(
      'insoluble_fiber_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _ironFeMgMeta =
      const VerificationMeta('ironFeMg');
  @override
  late final GeneratedColumn<double> ironFeMg = GeneratedColumn<double>(
      'iron_fe_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isoleucineMgMeta =
      const VerificationMeta('isoleucineMg');
  @override
  late final GeneratedColumn<double> isoleucineMg = GeneratedColumn<double>(
      'isoleucine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lactoseGMeta =
      const VerificationMeta('lactoseG');
  @override
  late final GeneratedColumn<double> lactoseG = GeneratedColumn<double>(
      'lactose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _leucineMgMeta =
      const VerificationMeta('leucineMg');
  @override
  late final GeneratedColumn<double> leucineMg = GeneratedColumn<double>(
      'leucine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _luteinZeaxanthinMcgMeta =
      const VerificationMeta('luteinZeaxanthinMcg');
  @override
  late final GeneratedColumn<double> luteinZeaxanthinMcg =
      GeneratedColumn<double>('lutein_zeaxanthin_mcg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lycopeneMcgMeta =
      const VerificationMeta('lycopeneMcg');
  @override
  late final GeneratedColumn<double> lycopeneMcg = GeneratedColumn<double>(
      'lycopene_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lysineMgMeta =
      const VerificationMeta('lysineMg');
  @override
  late final GeneratedColumn<double> lysineMg = GeneratedColumn<double>(
      'lysine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _magnesiumMgMeta =
      const VerificationMeta('magnesiumMg');
  @override
  late final GeneratedColumn<double> magnesiumMg = GeneratedColumn<double>(
      'magnesium_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maltoseGMeta =
      const VerificationMeta('maltoseG');
  @override
  late final GeneratedColumn<double> maltoseG = GeneratedColumn<double>(
      'maltose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _manganeseMgMeta =
      const VerificationMeta('manganeseMg');
  @override
  late final GeneratedColumn<double> manganeseMg = GeneratedColumn<double>(
      'manganese_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _menaquinone4McgMeta =
      const VerificationMeta('menaquinone4Mcg');
  @override
  late final GeneratedColumn<double> menaquinone4Mcg = GeneratedColumn<double>(
      'menaquinone_4_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _methionineMgMeta =
      const VerificationMeta('methionineMg');
  @override
  late final GeneratedColumn<double> methionineMg = GeneratedColumn<double>(
      'methionine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _molybdenumMcgMeta =
      const VerificationMeta('molybdenumMcg');
  @override
  late final GeneratedColumn<double> molybdenumMcg = GeneratedColumn<double>(
      'molybdenum_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _netCarbsGMeta =
      const VerificationMeta('netCarbsG');
  @override
  late final GeneratedColumn<double> netCarbsG = GeneratedColumn<double>(
      'net_carbs_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _niacinB3MgMeta =
      const VerificationMeta('niacinB3Mg');
  @override
  late final GeneratedColumn<double> niacinB3Mg = GeneratedColumn<double>(
      'niacin_b3_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _omega3sMgMeta =
      const VerificationMeta('omega3sMg');
  @override
  late final GeneratedColumn<double> omega3sMg = GeneratedColumn<double>(
      'omega_3s_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _omega6sMgMeta =
      const VerificationMeta('omega6sMg');
  @override
  late final GeneratedColumn<double> omega6sMg = GeneratedColumn<double>(
      'omega_6s_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pantothenicAcidB5MgMeta =
      const VerificationMeta('pantothenicAcidB5Mg');
  @override
  late final GeneratedColumn<double> pantothenicAcidB5Mg =
      GeneratedColumn<double>('pantothenic_acid_b5_mg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _phenylalanineMgMeta =
      const VerificationMeta('phenylalanineMg');
  @override
  late final GeneratedColumn<double> phenylalanineMg = GeneratedColumn<double>(
      'phenylalanine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _phosphorusPMgMeta =
      const VerificationMeta('phosphorusPMg');
  @override
  late final GeneratedColumn<double> phosphorusPMg = GeneratedColumn<double>(
      'phosphorus_p_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _potassiumKMgMeta =
      const VerificationMeta('potassiumKMg');
  @override
  late final GeneratedColumn<double> potassiumKMg = GeneratedColumn<double>(
      'potassium_k_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pralScoreMeta =
      const VerificationMeta('pralScore');
  @override
  late final GeneratedColumn<double> pralScore = GeneratedColumn<double>(
      'pral_score', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _prolineMgMeta =
      const VerificationMeta('prolineMg');
  @override
  late final GeneratedColumn<double> prolineMg = GeneratedColumn<double>(
      'proline_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _proteinGMeta =
      const VerificationMeta('proteinG');
  @override
  late final GeneratedColumn<double> proteinG = GeneratedColumn<double>(
      'protein_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _retinolMcgMeta =
      const VerificationMeta('retinolMcg');
  @override
  late final GeneratedColumn<double> retinolMcg = GeneratedColumn<double>(
      'retinol_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _riboflavinB2MgMeta =
      const VerificationMeta('riboflavinB2Mg');
  @override
  late final GeneratedColumn<double> riboflavinB2Mg = GeneratedColumn<double>(
      'riboflavin_b2_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _saturatedFatsGMeta =
      const VerificationMeta('saturatedFatsG');
  @override
  late final GeneratedColumn<double> saturatedFatsG = GeneratedColumn<double>(
      'saturated_fats_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _seleniumSeMcgMeta =
      const VerificationMeta('seleniumSeMcg');
  @override
  late final GeneratedColumn<double> seleniumSeMcg = GeneratedColumn<double>(
      'selenium_se_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _serineMgMeta =
      const VerificationMeta('serineMg');
  @override
  late final GeneratedColumn<double> serineMg = GeneratedColumn<double>(
      'serine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription1GMeta =
      const VerificationMeta('servingDescription1G');
  @override
  late final GeneratedColumn<String> servingDescription1G =
      GeneratedColumn<String>('serving_description_1_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription2GMeta =
      const VerificationMeta('servingDescription2G');
  @override
  late final GeneratedColumn<String> servingDescription2G =
      GeneratedColumn<String>('serving_description_2_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription3GMeta =
      const VerificationMeta('servingDescription3G');
  @override
  late final GeneratedColumn<String> servingDescription3G =
      GeneratedColumn<String>('serving_description_3_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription4GMeta =
      const VerificationMeta('servingDescription4G');
  @override
  late final GeneratedColumn<String> servingDescription4G =
      GeneratedColumn<String>('serving_description_4_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription5GMeta =
      const VerificationMeta('servingDescription5G');
  @override
  late final GeneratedColumn<String> servingDescription5G =
      GeneratedColumn<String>('serving_description_5_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription6GMeta =
      const VerificationMeta('servingDescription6G');
  @override
  late final GeneratedColumn<String> servingDescription6G =
      GeneratedColumn<String>('serving_description_6_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription7GMeta =
      const VerificationMeta('servingDescription7G');
  @override
  late final GeneratedColumn<String> servingDescription7G =
      GeneratedColumn<String>('serving_description_7_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription8GMeta =
      const VerificationMeta('servingDescription8G');
  @override
  late final GeneratedColumn<String> servingDescription8G =
      GeneratedColumn<String>('serving_description_8_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription9GMeta =
      const VerificationMeta('servingDescription9G');
  @override
  late final GeneratedColumn<String> servingDescription9G =
      GeneratedColumn<String>('serving_description_9_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingSizeMeta =
      const VerificationMeta('servingSize');
  @override
  late final GeneratedColumn<double> servingSize = GeneratedColumn<double>(
      'serving_size', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingUnitMeta =
      const VerificationMeta('servingUnit');
  @override
  late final GeneratedColumn<String> servingUnit = GeneratedColumn<String>(
      'serving_unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight1GMeta =
      const VerificationMeta('servingWeight1G');
  @override
  late final GeneratedColumn<double> servingWeight1G = GeneratedColumn<double>(
      'serving_weight_1_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight2GMeta =
      const VerificationMeta('servingWeight2G');
  @override
  late final GeneratedColumn<double> servingWeight2G = GeneratedColumn<double>(
      'serving_weight_2_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight3GMeta =
      const VerificationMeta('servingWeight3G');
  @override
  late final GeneratedColumn<double> servingWeight3G = GeneratedColumn<double>(
      'serving_weight_3_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight4GMeta =
      const VerificationMeta('servingWeight4G');
  @override
  late final GeneratedColumn<double> servingWeight4G = GeneratedColumn<double>(
      'serving_weight_4_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight5GMeta =
      const VerificationMeta('servingWeight5G');
  @override
  late final GeneratedColumn<double> servingWeight5G = GeneratedColumn<double>(
      'serving_weight_5_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight6GMeta =
      const VerificationMeta('servingWeight6G');
  @override
  late final GeneratedColumn<double> servingWeight6G = GeneratedColumn<double>(
      'serving_weight_6_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight7GMeta =
      const VerificationMeta('servingWeight7G');
  @override
  late final GeneratedColumn<double> servingWeight7G = GeneratedColumn<double>(
      'serving_weight_7_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight8GMeta =
      const VerificationMeta('servingWeight8G');
  @override
  late final GeneratedColumn<double> servingWeight8G = GeneratedColumn<double>(
      'serving_weight_8_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight9GMeta =
      const VerificationMeta('servingWeight9G');
  @override
  late final GeneratedColumn<double> servingWeight9G = GeneratedColumn<double>(
      'serving_weight_9_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _smallImageMeta =
      const VerificationMeta('smallImage');
  @override
  late final GeneratedColumn<String> smallImage = GeneratedColumn<String>(
      'small_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sodiumMgMeta =
      const VerificationMeta('sodiumMg');
  @override
  late final GeneratedColumn<double> sodiumMg = GeneratedColumn<double>(
      'sodium_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _solubleFiberGMeta =
      const VerificationMeta('solubleFiberG');
  @override
  late final GeneratedColumn<double> solubleFiberG = GeneratedColumn<double>(
      'soluble_fiber_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _starchGMeta =
      const VerificationMeta('starchG');
  @override
  late final GeneratedColumn<double> starchG = GeneratedColumn<double>(
      'starch_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sucroseGMeta =
      const VerificationMeta('sucroseG');
  @override
  late final GeneratedColumn<double> sucroseG = GeneratedColumn<double>(
      'sucrose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sugarsGMeta =
      const VerificationMeta('sugarsG');
  @override
  late final GeneratedColumn<double> sugarsG = GeneratedColumn<double>(
      'sugars_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _theobromineMgMeta =
      const VerificationMeta('theobromineMg');
  @override
  late final GeneratedColumn<double> theobromineMg = GeneratedColumn<double>(
      'theobromine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _thiaminB1MgMeta =
      const VerificationMeta('thiaminB1Mg');
  @override
  late final GeneratedColumn<double> thiaminB1Mg = GeneratedColumn<double>(
      'thiamin_b1_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _threonineMgMeta =
      const VerificationMeta('threonineMg');
  @override
  late final GeneratedColumn<double> threonineMg = GeneratedColumn<double>(
      'threonine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _totalSugarAlcoholsGMeta =
      const VerificationMeta('totalSugarAlcoholsG');
  @override
  late final GeneratedColumn<double> totalSugarAlcoholsG =
      GeneratedColumn<double>('total_sugar_alcohols_g', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _transFattyAcidsGMeta =
      const VerificationMeta('transFattyAcidsG');
  @override
  late final GeneratedColumn<double> transFattyAcidsG = GeneratedColumn<double>(
      'trans_fatty_acids_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tryptophanMgMeta =
      const VerificationMeta('tryptophanMg');
  @override
  late final GeneratedColumn<double> tryptophanMg = GeneratedColumn<double>(
      'tryptophan_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tyrosineMgMeta =
      const VerificationMeta('tyrosineMg');
  @override
  late final GeneratedColumn<double> tyrosineMg = GeneratedColumn<double>(
      'tyrosine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _u183N3CCCAlaMgMeta =
      const VerificationMeta('u183N3CCCAlaMg');
  @override
  late final GeneratedColumn<double> u183N3CCCAlaMg = GeneratedColumn<double>(
      '_18_3_n_3_c_c_c_ala_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _u200calorieWeightGMeta =
      const VerificationMeta('u200calorieWeightG');
  @override
  late final GeneratedColumn<double> u200calorieWeightG =
      GeneratedColumn<double>('_200_calorie_weight_g', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _u205N3EpaMgMeta =
      const VerificationMeta('u205N3EpaMg');
  @override
  late final GeneratedColumn<double> u205N3EpaMg = GeneratedColumn<double>(
      '_20_5_n_3_epa_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _u225N3DpaMgMeta =
      const VerificationMeta('u225N3DpaMg');
  @override
  late final GeneratedColumn<double> u225N3DpaMg = GeneratedColumn<double>(
      '_22_5_n_3_dpa_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _u226N3DhaMgMeta =
      const VerificationMeta('u226N3DhaMg');
  @override
  late final GeneratedColumn<double> u226N3DhaMg = GeneratedColumn<double>(
      '_22_6_n_3_dha_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _valineMgMeta =
      const VerificationMeta('valineMg');
  @override
  late final GeneratedColumn<double> valineMg = GeneratedColumn<double>(
      'valine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminAIuIuMeta =
      const VerificationMeta('vitaminAIuIu');
  @override
  late final GeneratedColumn<double> vitaminAIuIu = GeneratedColumn<double>(
      'vitamin_a_iu_iu', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminARaeMcgMeta =
      const VerificationMeta('vitaminARaeMcg');
  @override
  late final GeneratedColumn<double> vitaminARaeMcg = GeneratedColumn<double>(
      'vitamin_a_rae_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminB12McgMeta =
      const VerificationMeta('vitaminB12Mcg');
  @override
  late final GeneratedColumn<double> vitaminB12Mcg = GeneratedColumn<double>(
      'vitamin_b_12_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminB6MgMeta =
      const VerificationMeta('vitaminB6Mg');
  @override
  late final GeneratedColumn<double> vitaminB6Mg = GeneratedColumn<double>(
      'vitamin_b6_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminCMgMeta =
      const VerificationMeta('vitaminCMg');
  @override
  late final GeneratedColumn<double> vitaminCMg = GeneratedColumn<double>(
      'vitamin_c_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminD2ErgocalciferolMcgMeta =
      const VerificationMeta('vitaminD2ErgocalciferolMcg');
  @override
  late final GeneratedColumn<double> vitaminD2ErgocalciferolMcg =
      GeneratedColumn<double>(
          'vitamin_d2_ergocalciferol_mcg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminD3CholecalciferolMcgMeta =
      const VerificationMeta('vitaminD3CholecalciferolMcg');
  @override
  late final GeneratedColumn<double> vitaminD3CholecalciferolMcg =
      GeneratedColumn<double>(
          'vitamin_d3_cholecalciferol_mcg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminDIuIuMeta =
      const VerificationMeta('vitaminDIuIu');
  @override
  late final GeneratedColumn<double> vitaminDIuIu = GeneratedColumn<double>(
      'vitamin_d_iu_iu', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminDMcgMeta =
      const VerificationMeta('vitaminDMcg');
  @override
  late final GeneratedColumn<double> vitaminDMcg = GeneratedColumn<double>(
      'vitamin_d_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminEAlphaTocopherolMgMeta =
      const VerificationMeta('vitaminEAlphaTocopherolMg');
  @override
  late final GeneratedColumn<double> vitaminEAlphaTocopherolMg =
      GeneratedColumn<double>(
          'vitamin_e_alpha_tocopherol_mg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminKMcgMeta =
      const VerificationMeta('vitaminKMcg');
  @override
  late final GeneratedColumn<double> vitaminKMcg = GeneratedColumn<double>(
      'vitamin_k_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _waterGMeta = const VerificationMeta('waterG');
  @override
  late final GeneratedColumn<double> waterG = GeneratedColumn<double>(
      'water_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _zincZnMgMeta =
      const VerificationMeta('zincZnMg');
  @override
  late final GeneratedColumn<double> zincZnMg = GeneratedColumn<double>(
      'zinc_zn_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        barcode,
        addedSugarG,
        alanineMg,
        alcoholG,
        arginineMg,
        asparticAcidMg,
        betaineMg,
        bigImage,
        biotinB7Mcg,
        caffeineMg,
        calciumMg,
        calories,
        carbohydrateG,
        caroteneAlphaMcg,
        caroteneBetaMcg,
        chlorineMg,
        cholesterolMg,
        cholineMg,
        copperCuMg,
        created,
        cystineMg,
        dihydrophylloquinoneMcg,
        fatG,
        fattyAcidsTotalMonounsaturatedMg,
        fattyAcidsTotalPolyunsaturatedMg,
        favorite,
        fiberG,
        fluorideFMcg,
        folateB9Mcg,
        folateDfeMcg,
        folicAcidMcg,
        foodFolateMcg,
        foodGroup,
        fructoseG,
        galactoseG,
        glucoseDextroseG,
        glutamicAcidMg,
        glycineMg,
        histidineMg,
        hydroxyprolineMg,
        id,
        imageFile,
        insolubleFiberG,
        ironFeMg,
        isoleucineMg,
        lactoseG,
        leucineMg,
        luteinZeaxanthinMcg,
        lycopeneMcg,
        lysineMg,
        magnesiumMg,
        maltoseG,
        manganeseMg,
        menaquinone4Mcg,
        methionineMg,
        molybdenumMcg,
        name,
        netCarbsG,
        niacinB3Mg,
        omega3sMg,
        omega6sMg,
        pantothenicAcidB5Mg,
        phenylalanineMg,
        phosphorusPMg,
        potassiumKMg,
        pralScore,
        prolineMg,
        proteinG,
        retinolMcg,
        riboflavinB2Mg,
        saturatedFatsG,
        seleniumSeMcg,
        serineMg,
        servingDescription1G,
        servingDescription2G,
        servingDescription3G,
        servingDescription4G,
        servingDescription5G,
        servingDescription6G,
        servingDescription7G,
        servingDescription8G,
        servingDescription9G,
        servingSize,
        servingUnit,
        servingWeight1G,
        servingWeight2G,
        servingWeight3G,
        servingWeight4G,
        servingWeight5G,
        servingWeight6G,
        servingWeight7G,
        servingWeight8G,
        servingWeight9G,
        smallImage,
        sodiumMg,
        solubleFiberG,
        starchG,
        sucroseG,
        sugarsG,
        theobromineMg,
        thiaminB1Mg,
        threonineMg,
        totalSugarAlcoholsG,
        transFattyAcidsG,
        tryptophanMg,
        tyrosineMg,
        u183N3CCCAlaMg,
        u200calorieWeightG,
        u205N3EpaMg,
        u225N3DpaMg,
        u226N3DhaMg,
        valineMg,
        vitaminAIuIu,
        vitaminARaeMcg,
        vitaminB12Mcg,
        vitaminB6Mg,
        vitaminCMg,
        vitaminD2ErgocalciferolMcg,
        vitaminD3CholecalciferolMcg,
        vitaminDIuIu,
        vitaminDMcg,
        vitaminEAlphaTocopherolMg,
        vitaminKMcg,
        waterG,
        zincZnMg
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'foods';
  @override
  VerificationContext validateIntegrity(Insertable<Food> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('added_sugar_g')) {
      context.handle(
          _addedSugarGMeta,
          addedSugarG.isAcceptableOrUnknown(
              data['added_sugar_g']!, _addedSugarGMeta));
    }
    if (data.containsKey('alanine_mg')) {
      context.handle(_alanineMgMeta,
          alanineMg.isAcceptableOrUnknown(data['alanine_mg']!, _alanineMgMeta));
    }
    if (data.containsKey('alcohol_g')) {
      context.handle(_alcoholGMeta,
          alcoholG.isAcceptableOrUnknown(data['alcohol_g']!, _alcoholGMeta));
    }
    if (data.containsKey('arginine_mg')) {
      context.handle(
          _arginineMgMeta,
          arginineMg.isAcceptableOrUnknown(
              data['arginine_mg']!, _arginineMgMeta));
    }
    if (data.containsKey('aspartic_acid_mg')) {
      context.handle(
          _asparticAcidMgMeta,
          asparticAcidMg.isAcceptableOrUnknown(
              data['aspartic_acid_mg']!, _asparticAcidMgMeta));
    }
    if (data.containsKey('betaine_mg')) {
      context.handle(_betaineMgMeta,
          betaineMg.isAcceptableOrUnknown(data['betaine_mg']!, _betaineMgMeta));
    }
    if (data.containsKey('big_image')) {
      context.handle(_bigImageMeta,
          bigImage.isAcceptableOrUnknown(data['big_image']!, _bigImageMeta));
    }
    if (data.containsKey('biotin_b7_mcg')) {
      context.handle(
          _biotinB7McgMeta,
          biotinB7Mcg.isAcceptableOrUnknown(
              data['biotin_b7_mcg']!, _biotinB7McgMeta));
    }
    if (data.containsKey('caffeine_mg')) {
      context.handle(
          _caffeineMgMeta,
          caffeineMg.isAcceptableOrUnknown(
              data['caffeine_mg']!, _caffeineMgMeta));
    }
    if (data.containsKey('calcium_mg')) {
      context.handle(_calciumMgMeta,
          calciumMg.isAcceptableOrUnknown(data['calcium_mg']!, _calciumMgMeta));
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    }
    if (data.containsKey('carbohydrate_g')) {
      context.handle(
          _carbohydrateGMeta,
          carbohydrateG.isAcceptableOrUnknown(
              data['carbohydrate_g']!, _carbohydrateGMeta));
    }
    if (data.containsKey('carotene_alpha_mcg')) {
      context.handle(
          _caroteneAlphaMcgMeta,
          caroteneAlphaMcg.isAcceptableOrUnknown(
              data['carotene_alpha_mcg']!, _caroteneAlphaMcgMeta));
    }
    if (data.containsKey('carotene_beta_mcg')) {
      context.handle(
          _caroteneBetaMcgMeta,
          caroteneBetaMcg.isAcceptableOrUnknown(
              data['carotene_beta_mcg']!, _caroteneBetaMcgMeta));
    }
    if (data.containsKey('chlorine_mg')) {
      context.handle(
          _chlorineMgMeta,
          chlorineMg.isAcceptableOrUnknown(
              data['chlorine_mg']!, _chlorineMgMeta));
    }
    if (data.containsKey('cholesterol_mg')) {
      context.handle(
          _cholesterolMgMeta,
          cholesterolMg.isAcceptableOrUnknown(
              data['cholesterol_mg']!, _cholesterolMgMeta));
    }
    if (data.containsKey('choline_mg')) {
      context.handle(_cholineMgMeta,
          cholineMg.isAcceptableOrUnknown(data['choline_mg']!, _cholineMgMeta));
    }
    if (data.containsKey('copper_cu_mg')) {
      context.handle(
          _copperCuMgMeta,
          copperCuMg.isAcceptableOrUnknown(
              data['copper_cu_mg']!, _copperCuMgMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    if (data.containsKey('cystine_mg')) {
      context.handle(_cystineMgMeta,
          cystineMg.isAcceptableOrUnknown(data['cystine_mg']!, _cystineMgMeta));
    }
    if (data.containsKey('dihydrophylloquinone_mcg')) {
      context.handle(
          _dihydrophylloquinoneMcgMeta,
          dihydrophylloquinoneMcg.isAcceptableOrUnknown(
              data['dihydrophylloquinone_mcg']!, _dihydrophylloquinoneMcgMeta));
    }
    if (data.containsKey('fat_g')) {
      context.handle(
          _fatGMeta, fatG.isAcceptableOrUnknown(data['fat_g']!, _fatGMeta));
    }
    if (data.containsKey('fatty_acids_total_monounsaturated_mg')) {
      context.handle(
          _fattyAcidsTotalMonounsaturatedMgMeta,
          fattyAcidsTotalMonounsaturatedMg.isAcceptableOrUnknown(
              data['fatty_acids_total_monounsaturated_mg']!,
              _fattyAcidsTotalMonounsaturatedMgMeta));
    }
    if (data.containsKey('fatty_acids_total_polyunsaturated_mg')) {
      context.handle(
          _fattyAcidsTotalPolyunsaturatedMgMeta,
          fattyAcidsTotalPolyunsaturatedMg.isAcceptableOrUnknown(
              data['fatty_acids_total_polyunsaturated_mg']!,
              _fattyAcidsTotalPolyunsaturatedMgMeta));
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    if (data.containsKey('fiber_g')) {
      context.handle(_fiberGMeta,
          fiberG.isAcceptableOrUnknown(data['fiber_g']!, _fiberGMeta));
    }
    if (data.containsKey('fluoride_f_mcg')) {
      context.handle(
          _fluorideFMcgMeta,
          fluorideFMcg.isAcceptableOrUnknown(
              data['fluoride_f_mcg']!, _fluorideFMcgMeta));
    }
    if (data.containsKey('folate_b9_mcg')) {
      context.handle(
          _folateB9McgMeta,
          folateB9Mcg.isAcceptableOrUnknown(
              data['folate_b9_mcg']!, _folateB9McgMeta));
    }
    if (data.containsKey('folate_dfe_mcg')) {
      context.handle(
          _folateDfeMcgMeta,
          folateDfeMcg.isAcceptableOrUnknown(
              data['folate_dfe_mcg']!, _folateDfeMcgMeta));
    }
    if (data.containsKey('folic_acid_mcg')) {
      context.handle(
          _folicAcidMcgMeta,
          folicAcidMcg.isAcceptableOrUnknown(
              data['folic_acid_mcg']!, _folicAcidMcgMeta));
    }
    if (data.containsKey('food_folate_mcg')) {
      context.handle(
          _foodFolateMcgMeta,
          foodFolateMcg.isAcceptableOrUnknown(
              data['food_folate_mcg']!, _foodFolateMcgMeta));
    }
    if (data.containsKey('food_group')) {
      context.handle(_foodGroupMeta,
          foodGroup.isAcceptableOrUnknown(data['food_group']!, _foodGroupMeta));
    }
    if (data.containsKey('fructose_g')) {
      context.handle(_fructoseGMeta,
          fructoseG.isAcceptableOrUnknown(data['fructose_g']!, _fructoseGMeta));
    }
    if (data.containsKey('galactose_g')) {
      context.handle(
          _galactoseGMeta,
          galactoseG.isAcceptableOrUnknown(
              data['galactose_g']!, _galactoseGMeta));
    }
    if (data.containsKey('glucose_dextrose_g')) {
      context.handle(
          _glucoseDextroseGMeta,
          glucoseDextroseG.isAcceptableOrUnknown(
              data['glucose_dextrose_g']!, _glucoseDextroseGMeta));
    }
    if (data.containsKey('glutamic_acid_mg')) {
      context.handle(
          _glutamicAcidMgMeta,
          glutamicAcidMg.isAcceptableOrUnknown(
              data['glutamic_acid_mg']!, _glutamicAcidMgMeta));
    }
    if (data.containsKey('glycine_mg')) {
      context.handle(_glycineMgMeta,
          glycineMg.isAcceptableOrUnknown(data['glycine_mg']!, _glycineMgMeta));
    }
    if (data.containsKey('histidine_mg')) {
      context.handle(
          _histidineMgMeta,
          histidineMg.isAcceptableOrUnknown(
              data['histidine_mg']!, _histidineMgMeta));
    }
    if (data.containsKey('hydroxyproline_mg')) {
      context.handle(
          _hydroxyprolineMgMeta,
          hydroxyprolineMg.isAcceptableOrUnknown(
              data['hydroxyproline_mg']!, _hydroxyprolineMgMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image_file')) {
      context.handle(_imageFileMeta,
          imageFile.isAcceptableOrUnknown(data['image_file']!, _imageFileMeta));
    }
    if (data.containsKey('insoluble_fiber_g')) {
      context.handle(
          _insolubleFiberGMeta,
          insolubleFiberG.isAcceptableOrUnknown(
              data['insoluble_fiber_g']!, _insolubleFiberGMeta));
    }
    if (data.containsKey('iron_fe_mg')) {
      context.handle(_ironFeMgMeta,
          ironFeMg.isAcceptableOrUnknown(data['iron_fe_mg']!, _ironFeMgMeta));
    }
    if (data.containsKey('isoleucine_mg')) {
      context.handle(
          _isoleucineMgMeta,
          isoleucineMg.isAcceptableOrUnknown(
              data['isoleucine_mg']!, _isoleucineMgMeta));
    }
    if (data.containsKey('lactose_g')) {
      context.handle(_lactoseGMeta,
          lactoseG.isAcceptableOrUnknown(data['lactose_g']!, _lactoseGMeta));
    }
    if (data.containsKey('leucine_mg')) {
      context.handle(_leucineMgMeta,
          leucineMg.isAcceptableOrUnknown(data['leucine_mg']!, _leucineMgMeta));
    }
    if (data.containsKey('lutein_zeaxanthin_mcg')) {
      context.handle(
          _luteinZeaxanthinMcgMeta,
          luteinZeaxanthinMcg.isAcceptableOrUnknown(
              data['lutein_zeaxanthin_mcg']!, _luteinZeaxanthinMcgMeta));
    }
    if (data.containsKey('lycopene_mcg')) {
      context.handle(
          _lycopeneMcgMeta,
          lycopeneMcg.isAcceptableOrUnknown(
              data['lycopene_mcg']!, _lycopeneMcgMeta));
    }
    if (data.containsKey('lysine_mg')) {
      context.handle(_lysineMgMeta,
          lysineMg.isAcceptableOrUnknown(data['lysine_mg']!, _lysineMgMeta));
    }
    if (data.containsKey('magnesium_mg')) {
      context.handle(
          _magnesiumMgMeta,
          magnesiumMg.isAcceptableOrUnknown(
              data['magnesium_mg']!, _magnesiumMgMeta));
    }
    if (data.containsKey('maltose_g')) {
      context.handle(_maltoseGMeta,
          maltoseG.isAcceptableOrUnknown(data['maltose_g']!, _maltoseGMeta));
    }
    if (data.containsKey('manganese_mg')) {
      context.handle(
          _manganeseMgMeta,
          manganeseMg.isAcceptableOrUnknown(
              data['manganese_mg']!, _manganeseMgMeta));
    }
    if (data.containsKey('menaquinone_4_mcg')) {
      context.handle(
          _menaquinone4McgMeta,
          menaquinone4Mcg.isAcceptableOrUnknown(
              data['menaquinone_4_mcg']!, _menaquinone4McgMeta));
    }
    if (data.containsKey('methionine_mg')) {
      context.handle(
          _methionineMgMeta,
          methionineMg.isAcceptableOrUnknown(
              data['methionine_mg']!, _methionineMgMeta));
    }
    if (data.containsKey('molybdenum_mcg')) {
      context.handle(
          _molybdenumMcgMeta,
          molybdenumMcg.isAcceptableOrUnknown(
              data['molybdenum_mcg']!, _molybdenumMcgMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('net_carbs_g')) {
      context.handle(
          _netCarbsGMeta,
          netCarbsG.isAcceptableOrUnknown(
              data['net_carbs_g']!, _netCarbsGMeta));
    }
    if (data.containsKey('niacin_b3_mg')) {
      context.handle(
          _niacinB3MgMeta,
          niacinB3Mg.isAcceptableOrUnknown(
              data['niacin_b3_mg']!, _niacinB3MgMeta));
    }
    if (data.containsKey('omega_3s_mg')) {
      context.handle(
          _omega3sMgMeta,
          omega3sMg.isAcceptableOrUnknown(
              data['omega_3s_mg']!, _omega3sMgMeta));
    }
    if (data.containsKey('omega_6s_mg')) {
      context.handle(
          _omega6sMgMeta,
          omega6sMg.isAcceptableOrUnknown(
              data['omega_6s_mg']!, _omega6sMgMeta));
    }
    if (data.containsKey('pantothenic_acid_b5_mg')) {
      context.handle(
          _pantothenicAcidB5MgMeta,
          pantothenicAcidB5Mg.isAcceptableOrUnknown(
              data['pantothenic_acid_b5_mg']!, _pantothenicAcidB5MgMeta));
    }
    if (data.containsKey('phenylalanine_mg')) {
      context.handle(
          _phenylalanineMgMeta,
          phenylalanineMg.isAcceptableOrUnknown(
              data['phenylalanine_mg']!, _phenylalanineMgMeta));
    }
    if (data.containsKey('phosphorus_p_mg')) {
      context.handle(
          _phosphorusPMgMeta,
          phosphorusPMg.isAcceptableOrUnknown(
              data['phosphorus_p_mg']!, _phosphorusPMgMeta));
    }
    if (data.containsKey('potassium_k_mg')) {
      context.handle(
          _potassiumKMgMeta,
          potassiumKMg.isAcceptableOrUnknown(
              data['potassium_k_mg']!, _potassiumKMgMeta));
    }
    if (data.containsKey('pral_score')) {
      context.handle(_pralScoreMeta,
          pralScore.isAcceptableOrUnknown(data['pral_score']!, _pralScoreMeta));
    }
    if (data.containsKey('proline_mg')) {
      context.handle(_prolineMgMeta,
          prolineMg.isAcceptableOrUnknown(data['proline_mg']!, _prolineMgMeta));
    }
    if (data.containsKey('protein_g')) {
      context.handle(_proteinGMeta,
          proteinG.isAcceptableOrUnknown(data['protein_g']!, _proteinGMeta));
    }
    if (data.containsKey('retinol_mcg')) {
      context.handle(
          _retinolMcgMeta,
          retinolMcg.isAcceptableOrUnknown(
              data['retinol_mcg']!, _retinolMcgMeta));
    }
    if (data.containsKey('riboflavin_b2_mg')) {
      context.handle(
          _riboflavinB2MgMeta,
          riboflavinB2Mg.isAcceptableOrUnknown(
              data['riboflavin_b2_mg']!, _riboflavinB2MgMeta));
    }
    if (data.containsKey('saturated_fats_g')) {
      context.handle(
          _saturatedFatsGMeta,
          saturatedFatsG.isAcceptableOrUnknown(
              data['saturated_fats_g']!, _saturatedFatsGMeta));
    }
    if (data.containsKey('selenium_se_mcg')) {
      context.handle(
          _seleniumSeMcgMeta,
          seleniumSeMcg.isAcceptableOrUnknown(
              data['selenium_se_mcg']!, _seleniumSeMcgMeta));
    }
    if (data.containsKey('serine_mg')) {
      context.handle(_serineMgMeta,
          serineMg.isAcceptableOrUnknown(data['serine_mg']!, _serineMgMeta));
    }
    if (data.containsKey('serving_description_1_g')) {
      context.handle(
          _servingDescription1GMeta,
          servingDescription1G.isAcceptableOrUnknown(
              data['serving_description_1_g']!, _servingDescription1GMeta));
    }
    if (data.containsKey('serving_description_2_g')) {
      context.handle(
          _servingDescription2GMeta,
          servingDescription2G.isAcceptableOrUnknown(
              data['serving_description_2_g']!, _servingDescription2GMeta));
    }
    if (data.containsKey('serving_description_3_g')) {
      context.handle(
          _servingDescription3GMeta,
          servingDescription3G.isAcceptableOrUnknown(
              data['serving_description_3_g']!, _servingDescription3GMeta));
    }
    if (data.containsKey('serving_description_4_g')) {
      context.handle(
          _servingDescription4GMeta,
          servingDescription4G.isAcceptableOrUnknown(
              data['serving_description_4_g']!, _servingDescription4GMeta));
    }
    if (data.containsKey('serving_description_5_g')) {
      context.handle(
          _servingDescription5GMeta,
          servingDescription5G.isAcceptableOrUnknown(
              data['serving_description_5_g']!, _servingDescription5GMeta));
    }
    if (data.containsKey('serving_description_6_g')) {
      context.handle(
          _servingDescription6GMeta,
          servingDescription6G.isAcceptableOrUnknown(
              data['serving_description_6_g']!, _servingDescription6GMeta));
    }
    if (data.containsKey('serving_description_7_g')) {
      context.handle(
          _servingDescription7GMeta,
          servingDescription7G.isAcceptableOrUnknown(
              data['serving_description_7_g']!, _servingDescription7GMeta));
    }
    if (data.containsKey('serving_description_8_g')) {
      context.handle(
          _servingDescription8GMeta,
          servingDescription8G.isAcceptableOrUnknown(
              data['serving_description_8_g']!, _servingDescription8GMeta));
    }
    if (data.containsKey('serving_description_9_g')) {
      context.handle(
          _servingDescription9GMeta,
          servingDescription9G.isAcceptableOrUnknown(
              data['serving_description_9_g']!, _servingDescription9GMeta));
    }
    if (data.containsKey('serving_size')) {
      context.handle(
          _servingSizeMeta,
          servingSize.isAcceptableOrUnknown(
              data['serving_size']!, _servingSizeMeta));
    }
    if (data.containsKey('serving_unit')) {
      context.handle(
          _servingUnitMeta,
          servingUnit.isAcceptableOrUnknown(
              data['serving_unit']!, _servingUnitMeta));
    }
    if (data.containsKey('serving_weight_1_g')) {
      context.handle(
          _servingWeight1GMeta,
          servingWeight1G.isAcceptableOrUnknown(
              data['serving_weight_1_g']!, _servingWeight1GMeta));
    }
    if (data.containsKey('serving_weight_2_g')) {
      context.handle(
          _servingWeight2GMeta,
          servingWeight2G.isAcceptableOrUnknown(
              data['serving_weight_2_g']!, _servingWeight2GMeta));
    }
    if (data.containsKey('serving_weight_3_g')) {
      context.handle(
          _servingWeight3GMeta,
          servingWeight3G.isAcceptableOrUnknown(
              data['serving_weight_3_g']!, _servingWeight3GMeta));
    }
    if (data.containsKey('serving_weight_4_g')) {
      context.handle(
          _servingWeight4GMeta,
          servingWeight4G.isAcceptableOrUnknown(
              data['serving_weight_4_g']!, _servingWeight4GMeta));
    }
    if (data.containsKey('serving_weight_5_g')) {
      context.handle(
          _servingWeight5GMeta,
          servingWeight5G.isAcceptableOrUnknown(
              data['serving_weight_5_g']!, _servingWeight5GMeta));
    }
    if (data.containsKey('serving_weight_6_g')) {
      context.handle(
          _servingWeight6GMeta,
          servingWeight6G.isAcceptableOrUnknown(
              data['serving_weight_6_g']!, _servingWeight6GMeta));
    }
    if (data.containsKey('serving_weight_7_g')) {
      context.handle(
          _servingWeight7GMeta,
          servingWeight7G.isAcceptableOrUnknown(
              data['serving_weight_7_g']!, _servingWeight7GMeta));
    }
    if (data.containsKey('serving_weight_8_g')) {
      context.handle(
          _servingWeight8GMeta,
          servingWeight8G.isAcceptableOrUnknown(
              data['serving_weight_8_g']!, _servingWeight8GMeta));
    }
    if (data.containsKey('serving_weight_9_g')) {
      context.handle(
          _servingWeight9GMeta,
          servingWeight9G.isAcceptableOrUnknown(
              data['serving_weight_9_g']!, _servingWeight9GMeta));
    }
    if (data.containsKey('small_image')) {
      context.handle(
          _smallImageMeta,
          smallImage.isAcceptableOrUnknown(
              data['small_image']!, _smallImageMeta));
    }
    if (data.containsKey('sodium_mg')) {
      context.handle(_sodiumMgMeta,
          sodiumMg.isAcceptableOrUnknown(data['sodium_mg']!, _sodiumMgMeta));
    }
    if (data.containsKey('soluble_fiber_g')) {
      context.handle(
          _solubleFiberGMeta,
          solubleFiberG.isAcceptableOrUnknown(
              data['soluble_fiber_g']!, _solubleFiberGMeta));
    }
    if (data.containsKey('starch_g')) {
      context.handle(_starchGMeta,
          starchG.isAcceptableOrUnknown(data['starch_g']!, _starchGMeta));
    }
    if (data.containsKey('sucrose_g')) {
      context.handle(_sucroseGMeta,
          sucroseG.isAcceptableOrUnknown(data['sucrose_g']!, _sucroseGMeta));
    }
    if (data.containsKey('sugars_g')) {
      context.handle(_sugarsGMeta,
          sugarsG.isAcceptableOrUnknown(data['sugars_g']!, _sugarsGMeta));
    }
    if (data.containsKey('theobromine_mg')) {
      context.handle(
          _theobromineMgMeta,
          theobromineMg.isAcceptableOrUnknown(
              data['theobromine_mg']!, _theobromineMgMeta));
    }
    if (data.containsKey('thiamin_b1_mg')) {
      context.handle(
          _thiaminB1MgMeta,
          thiaminB1Mg.isAcceptableOrUnknown(
              data['thiamin_b1_mg']!, _thiaminB1MgMeta));
    }
    if (data.containsKey('threonine_mg')) {
      context.handle(
          _threonineMgMeta,
          threonineMg.isAcceptableOrUnknown(
              data['threonine_mg']!, _threonineMgMeta));
    }
    if (data.containsKey('total_sugar_alcohols_g')) {
      context.handle(
          _totalSugarAlcoholsGMeta,
          totalSugarAlcoholsG.isAcceptableOrUnknown(
              data['total_sugar_alcohols_g']!, _totalSugarAlcoholsGMeta));
    }
    if (data.containsKey('trans_fatty_acids_g')) {
      context.handle(
          _transFattyAcidsGMeta,
          transFattyAcidsG.isAcceptableOrUnknown(
              data['trans_fatty_acids_g']!, _transFattyAcidsGMeta));
    }
    if (data.containsKey('tryptophan_mg')) {
      context.handle(
          _tryptophanMgMeta,
          tryptophanMg.isAcceptableOrUnknown(
              data['tryptophan_mg']!, _tryptophanMgMeta));
    }
    if (data.containsKey('tyrosine_mg')) {
      context.handle(
          _tyrosineMgMeta,
          tyrosineMg.isAcceptableOrUnknown(
              data['tyrosine_mg']!, _tyrosineMgMeta));
    }
    if (data.containsKey('_18_3_n_3_c_c_c_ala_mg')) {
      context.handle(
          _u183N3CCCAlaMgMeta,
          u183N3CCCAlaMg.isAcceptableOrUnknown(
              data['_18_3_n_3_c_c_c_ala_mg']!, _u183N3CCCAlaMgMeta));
    }
    if (data.containsKey('_200_calorie_weight_g')) {
      context.handle(
          _u200calorieWeightGMeta,
          u200calorieWeightG.isAcceptableOrUnknown(
              data['_200_calorie_weight_g']!, _u200calorieWeightGMeta));
    }
    if (data.containsKey('_20_5_n_3_epa_mg')) {
      context.handle(
          _u205N3EpaMgMeta,
          u205N3EpaMg.isAcceptableOrUnknown(
              data['_20_5_n_3_epa_mg']!, _u205N3EpaMgMeta));
    }
    if (data.containsKey('_22_5_n_3_dpa_mg')) {
      context.handle(
          _u225N3DpaMgMeta,
          u225N3DpaMg.isAcceptableOrUnknown(
              data['_22_5_n_3_dpa_mg']!, _u225N3DpaMgMeta));
    }
    if (data.containsKey('_22_6_n_3_dha_mg')) {
      context.handle(
          _u226N3DhaMgMeta,
          u226N3DhaMg.isAcceptableOrUnknown(
              data['_22_6_n_3_dha_mg']!, _u226N3DhaMgMeta));
    }
    if (data.containsKey('valine_mg')) {
      context.handle(_valineMgMeta,
          valineMg.isAcceptableOrUnknown(data['valine_mg']!, _valineMgMeta));
    }
    if (data.containsKey('vitamin_a_iu_iu')) {
      context.handle(
          _vitaminAIuIuMeta,
          vitaminAIuIu.isAcceptableOrUnknown(
              data['vitamin_a_iu_iu']!, _vitaminAIuIuMeta));
    }
    if (data.containsKey('vitamin_a_rae_mcg')) {
      context.handle(
          _vitaminARaeMcgMeta,
          vitaminARaeMcg.isAcceptableOrUnknown(
              data['vitamin_a_rae_mcg']!, _vitaminARaeMcgMeta));
    }
    if (data.containsKey('vitamin_b_12_mcg')) {
      context.handle(
          _vitaminB12McgMeta,
          vitaminB12Mcg.isAcceptableOrUnknown(
              data['vitamin_b_12_mcg']!, _vitaminB12McgMeta));
    }
    if (data.containsKey('vitamin_b6_mg')) {
      context.handle(
          _vitaminB6MgMeta,
          vitaminB6Mg.isAcceptableOrUnknown(
              data['vitamin_b6_mg']!, _vitaminB6MgMeta));
    }
    if (data.containsKey('vitamin_c_mg')) {
      context.handle(
          _vitaminCMgMeta,
          vitaminCMg.isAcceptableOrUnknown(
              data['vitamin_c_mg']!, _vitaminCMgMeta));
    }
    if (data.containsKey('vitamin_d2_ergocalciferol_mcg')) {
      context.handle(
          _vitaminD2ErgocalciferolMcgMeta,
          vitaminD2ErgocalciferolMcg.isAcceptableOrUnknown(
              data['vitamin_d2_ergocalciferol_mcg']!,
              _vitaminD2ErgocalciferolMcgMeta));
    }
    if (data.containsKey('vitamin_d3_cholecalciferol_mcg')) {
      context.handle(
          _vitaminD3CholecalciferolMcgMeta,
          vitaminD3CholecalciferolMcg.isAcceptableOrUnknown(
              data['vitamin_d3_cholecalciferol_mcg']!,
              _vitaminD3CholecalciferolMcgMeta));
    }
    if (data.containsKey('vitamin_d_iu_iu')) {
      context.handle(
          _vitaminDIuIuMeta,
          vitaminDIuIu.isAcceptableOrUnknown(
              data['vitamin_d_iu_iu']!, _vitaminDIuIuMeta));
    }
    if (data.containsKey('vitamin_d_mcg')) {
      context.handle(
          _vitaminDMcgMeta,
          vitaminDMcg.isAcceptableOrUnknown(
              data['vitamin_d_mcg']!, _vitaminDMcgMeta));
    }
    if (data.containsKey('vitamin_e_alpha_tocopherol_mg')) {
      context.handle(
          _vitaminEAlphaTocopherolMgMeta,
          vitaminEAlphaTocopherolMg.isAcceptableOrUnknown(
              data['vitamin_e_alpha_tocopherol_mg']!,
              _vitaminEAlphaTocopherolMgMeta));
    }
    if (data.containsKey('vitamin_k_mcg')) {
      context.handle(
          _vitaminKMcgMeta,
          vitaminKMcg.isAcceptableOrUnknown(
              data['vitamin_k_mcg']!, _vitaminKMcgMeta));
    }
    if (data.containsKey('water_g')) {
      context.handle(_waterGMeta,
          waterG.isAcceptableOrUnknown(data['water_g']!, _waterGMeta));
    }
    if (data.containsKey('zinc_zn_mg')) {
      context.handle(_zincZnMgMeta,
          zincZnMg.isAcceptableOrUnknown(data['zinc_zn_mg']!, _zincZnMgMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Food(
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      addedSugarG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}added_sugar_g']),
      alanineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}alanine_mg']),
      alcoholG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}alcohol_g']),
      arginineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}arginine_mg']),
      asparticAcidMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}aspartic_acid_mg']),
      betaineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}betaine_mg']),
      bigImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}big_image']),
      biotinB7Mcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}biotin_b7_mcg']),
      caffeineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}caffeine_mg']),
      calciumMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calcium_mg']),
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calories']),
      carbohydrateG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbohydrate_g']),
      caroteneAlphaMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}carotene_alpha_mcg']),
      caroteneBetaMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}carotene_beta_mcg']),
      chlorineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}chlorine_mg']),
      cholesterolMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cholesterol_mg']),
      cholineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}choline_mg']),
      copperCuMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}copper_cu_mg']),
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created']),
      cystineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cystine_mg']),
      dihydrophylloquinoneMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}dihydrophylloquinone_mcg']),
      fatG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat_g']),
      fattyAcidsTotalMonounsaturatedMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}fatty_acids_total_monounsaturated_mg']),
      fattyAcidsTotalPolyunsaturatedMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}fatty_acids_total_polyunsaturated_mg']),
      favorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}favorite']),
      fiberG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fiber_g']),
      fluorideFMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fluoride_f_mcg']),
      folateB9Mcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}folate_b9_mcg']),
      folateDfeMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}folate_dfe_mcg']),
      folicAcidMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}folic_acid_mcg']),
      foodFolateMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}food_folate_mcg']),
      foodGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_group']),
      fructoseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fructose_g']),
      galactoseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}galactose_g']),
      glucoseDextroseG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}glucose_dextrose_g']),
      glutamicAcidMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}glutamic_acid_mg']),
      glycineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}glycine_mg']),
      histidineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}histidine_mg']),
      hydroxyprolineMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}hydroxyproline_mg']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      imageFile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_file']),
      insolubleFiberG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}insoluble_fiber_g']),
      ironFeMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}iron_fe_mg']),
      isoleucineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}isoleucine_mg']),
      lactoseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lactose_g']),
      leucineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}leucine_mg']),
      luteinZeaxanthinMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}lutein_zeaxanthin_mcg']),
      lycopeneMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lycopene_mcg']),
      lysineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lysine_mg']),
      magnesiumMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}magnesium_mg']),
      maltoseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}maltose_g']),
      manganeseMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}manganese_mg']),
      menaquinone4Mcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}menaquinone_4_mcg']),
      methionineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}methionine_mg']),
      molybdenumMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}molybdenum_mcg']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      netCarbsG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_carbs_g']),
      niacinB3Mg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}niacin_b3_mg']),
      omega3sMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}omega_3s_mg']),
      omega6sMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}omega_6s_mg']),
      pantothenicAcidB5Mg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}pantothenic_acid_b5_mg']),
      phenylalanineMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}phenylalanine_mg']),
      phosphorusPMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}phosphorus_p_mg']),
      potassiumKMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}potassium_k_mg']),
      pralScore: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pral_score']),
      prolineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}proline_mg']),
      proteinG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein_g']),
      retinolMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}retinol_mcg']),
      riboflavinB2Mg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}riboflavin_b2_mg']),
      saturatedFatsG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}saturated_fats_g']),
      seleniumSeMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}selenium_se_mcg']),
      serineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}serine_mg']),
      servingDescription1G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_1_g']),
      servingDescription2G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_2_g']),
      servingDescription3G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_3_g']),
      servingDescription4G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_4_g']),
      servingDescription5G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_5_g']),
      servingDescription6G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_6_g']),
      servingDescription7G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_7_g']),
      servingDescription8G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_8_g']),
      servingDescription9G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_9_g']),
      servingSize: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}serving_size']),
      servingUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serving_unit']),
      servingWeight1G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_1_g']),
      servingWeight2G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_2_g']),
      servingWeight3G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_3_g']),
      servingWeight4G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_4_g']),
      servingWeight5G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_5_g']),
      servingWeight6G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_6_g']),
      servingWeight7G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_7_g']),
      servingWeight8G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_8_g']),
      servingWeight9G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_9_g']),
      smallImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}small_image']),
      sodiumMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sodium_mg']),
      solubleFiberG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}soluble_fiber_g']),
      starchG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}starch_g']),
      sucroseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sucrose_g']),
      sugarsG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sugars_g']),
      theobromineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}theobromine_mg']),
      thiaminB1Mg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}thiamin_b1_mg']),
      threonineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}threonine_mg']),
      totalSugarAlcoholsG: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}total_sugar_alcohols_g']),
      transFattyAcidsG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}trans_fatty_acids_g']),
      tryptophanMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tryptophan_mg']),
      tyrosineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tyrosine_mg']),
      u183N3CCCAlaMg: attachedDatabase.typeMapping.read(DriftSqlType.double,
          data['${effectivePrefix}_18_3_n_3_c_c_c_ala_mg']),
      u200calorieWeightG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}_200_calorie_weight_g']),
      u205N3EpaMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}_20_5_n_3_epa_mg']),
      u225N3DpaMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}_22_5_n_3_dpa_mg']),
      u226N3DhaMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}_22_6_n_3_dha_mg']),
      valineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}valine_mg']),
      vitaminAIuIu: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_a_iu_iu']),
      vitaminARaeMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}vitamin_a_rae_mcg']),
      vitaminB12Mcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}vitamin_b_12_mcg']),
      vitaminB6Mg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_b6_mg']),
      vitaminCMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_c_mg']),
      vitaminD2ErgocalciferolMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}vitamin_d2_ergocalciferol_mcg']),
      vitaminD3CholecalciferolMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}vitamin_d3_cholecalciferol_mcg']),
      vitaminDIuIu: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_d_iu_iu']),
      vitaminDMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_d_mcg']),
      vitaminEAlphaTocopherolMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}vitamin_e_alpha_tocopherol_mg']),
      vitaminKMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_k_mcg']),
      waterG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}water_g']),
      zincZnMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}zinc_zn_mg']),
    );
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(attachedDatabase, alias);
  }
}

class Food extends DataClass implements Insertable<Food> {
  final String? barcode;
  final double? addedSugarG;
  final double? alanineMg;
  final double? alcoholG;
  final double? arginineMg;
  final double? asparticAcidMg;
  final double? betaineMg;
  final String? bigImage;
  final double? biotinB7Mcg;
  final double? caffeineMg;
  final double? calciumMg;
  final double? calories;
  final double? carbohydrateG;
  final double? caroteneAlphaMcg;
  final double? caroteneBetaMcg;
  final double? chlorineMg;
  final double? cholesterolMg;
  final double? cholineMg;
  final double? copperCuMg;
  final DateTime? created;
  final double? cystineMg;
  final double? dihydrophylloquinoneMcg;
  final double? fatG;
  final double? fattyAcidsTotalMonounsaturatedMg;
  final double? fattyAcidsTotalPolyunsaturatedMg;
  final bool? favorite;
  final double? fiberG;
  final double? fluorideFMcg;
  final double? folateB9Mcg;
  final double? folateDfeMcg;
  final double? folicAcidMcg;
  final double? foodFolateMcg;
  final String? foodGroup;
  final double? fructoseG;
  final double? galactoseG;
  final double? glucoseDextroseG;
  final double? glutamicAcidMg;
  final double? glycineMg;
  final double? histidineMg;
  final double? hydroxyprolineMg;
  final int id;
  final String? imageFile;
  final double? insolubleFiberG;
  final double? ironFeMg;
  final double? isoleucineMg;
  final double? lactoseG;
  final double? leucineMg;
  final double? luteinZeaxanthinMcg;
  final double? lycopeneMcg;
  final double? lysineMg;
  final double? magnesiumMg;
  final double? maltoseG;
  final double? manganeseMg;
  final double? menaquinone4Mcg;
  final double? methionineMg;
  final double? molybdenumMcg;
  final String name;
  final double? netCarbsG;
  final double? niacinB3Mg;
  final double? omega3sMg;
  final double? omega6sMg;
  final double? pantothenicAcidB5Mg;
  final double? phenylalanineMg;
  final double? phosphorusPMg;
  final double? potassiumKMg;
  final double? pralScore;
  final double? prolineMg;
  final double? proteinG;
  final double? retinolMcg;
  final double? riboflavinB2Mg;
  final double? saturatedFatsG;
  final double? seleniumSeMcg;
  final double? serineMg;
  final String? servingDescription1G;
  final String? servingDescription2G;
  final String? servingDescription3G;
  final String? servingDescription4G;
  final String? servingDescription5G;
  final String? servingDescription6G;
  final String? servingDescription7G;
  final String? servingDescription8G;
  final String? servingDescription9G;
  final double? servingSize;
  final String? servingUnit;
  final double? servingWeight1G;
  final double? servingWeight2G;
  final double? servingWeight3G;
  final double? servingWeight4G;
  final double? servingWeight5G;
  final double? servingWeight6G;
  final double? servingWeight7G;
  final double? servingWeight8G;
  final double? servingWeight9G;
  final String? smallImage;
  final double? sodiumMg;
  final double? solubleFiberG;
  final double? starchG;
  final double? sucroseG;
  final double? sugarsG;
  final double? theobromineMg;
  final double? thiaminB1Mg;
  final double? threonineMg;
  final double? totalSugarAlcoholsG;
  final double? transFattyAcidsG;
  final double? tryptophanMg;
  final double? tyrosineMg;
  final double? u183N3CCCAlaMg;
  final double? u200calorieWeightG;
  final double? u205N3EpaMg;
  final double? u225N3DpaMg;
  final double? u226N3DhaMg;
  final double? valineMg;
  final double? vitaminAIuIu;
  final double? vitaminARaeMcg;
  final double? vitaminB12Mcg;
  final double? vitaminB6Mg;
  final double? vitaminCMg;
  final double? vitaminD2ErgocalciferolMcg;
  final double? vitaminD3CholecalciferolMcg;
  final double? vitaminDIuIu;
  final double? vitaminDMcg;
  final double? vitaminEAlphaTocopherolMg;
  final double? vitaminKMcg;
  final double? waterG;
  final double? zincZnMg;
  const Food(
      {this.barcode,
      this.addedSugarG,
      this.alanineMg,
      this.alcoholG,
      this.arginineMg,
      this.asparticAcidMg,
      this.betaineMg,
      this.bigImage,
      this.biotinB7Mcg,
      this.caffeineMg,
      this.calciumMg,
      this.calories,
      this.carbohydrateG,
      this.caroteneAlphaMcg,
      this.caroteneBetaMcg,
      this.chlorineMg,
      this.cholesterolMg,
      this.cholineMg,
      this.copperCuMg,
      this.created,
      this.cystineMg,
      this.dihydrophylloquinoneMcg,
      this.fatG,
      this.fattyAcidsTotalMonounsaturatedMg,
      this.fattyAcidsTotalPolyunsaturatedMg,
      this.favorite,
      this.fiberG,
      this.fluorideFMcg,
      this.folateB9Mcg,
      this.folateDfeMcg,
      this.folicAcidMcg,
      this.foodFolateMcg,
      this.foodGroup,
      this.fructoseG,
      this.galactoseG,
      this.glucoseDextroseG,
      this.glutamicAcidMg,
      this.glycineMg,
      this.histidineMg,
      this.hydroxyprolineMg,
      required this.id,
      this.imageFile,
      this.insolubleFiberG,
      this.ironFeMg,
      this.isoleucineMg,
      this.lactoseG,
      this.leucineMg,
      this.luteinZeaxanthinMcg,
      this.lycopeneMcg,
      this.lysineMg,
      this.magnesiumMg,
      this.maltoseG,
      this.manganeseMg,
      this.menaquinone4Mcg,
      this.methionineMg,
      this.molybdenumMcg,
      required this.name,
      this.netCarbsG,
      this.niacinB3Mg,
      this.omega3sMg,
      this.omega6sMg,
      this.pantothenicAcidB5Mg,
      this.phenylalanineMg,
      this.phosphorusPMg,
      this.potassiumKMg,
      this.pralScore,
      this.prolineMg,
      this.proteinG,
      this.retinolMcg,
      this.riboflavinB2Mg,
      this.saturatedFatsG,
      this.seleniumSeMcg,
      this.serineMg,
      this.servingDescription1G,
      this.servingDescription2G,
      this.servingDescription3G,
      this.servingDescription4G,
      this.servingDescription5G,
      this.servingDescription6G,
      this.servingDescription7G,
      this.servingDescription8G,
      this.servingDescription9G,
      this.servingSize,
      this.servingUnit,
      this.servingWeight1G,
      this.servingWeight2G,
      this.servingWeight3G,
      this.servingWeight4G,
      this.servingWeight5G,
      this.servingWeight6G,
      this.servingWeight7G,
      this.servingWeight8G,
      this.servingWeight9G,
      this.smallImage,
      this.sodiumMg,
      this.solubleFiberG,
      this.starchG,
      this.sucroseG,
      this.sugarsG,
      this.theobromineMg,
      this.thiaminB1Mg,
      this.threonineMg,
      this.totalSugarAlcoholsG,
      this.transFattyAcidsG,
      this.tryptophanMg,
      this.tyrosineMg,
      this.u183N3CCCAlaMg,
      this.u200calorieWeightG,
      this.u205N3EpaMg,
      this.u225N3DpaMg,
      this.u226N3DhaMg,
      this.valineMg,
      this.vitaminAIuIu,
      this.vitaminARaeMcg,
      this.vitaminB12Mcg,
      this.vitaminB6Mg,
      this.vitaminCMg,
      this.vitaminD2ErgocalciferolMcg,
      this.vitaminD3CholecalciferolMcg,
      this.vitaminDIuIu,
      this.vitaminDMcg,
      this.vitaminEAlphaTocopherolMg,
      this.vitaminKMcg,
      this.waterG,
      this.zincZnMg});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || addedSugarG != null) {
      map['added_sugar_g'] = Variable<double>(addedSugarG);
    }
    if (!nullToAbsent || alanineMg != null) {
      map['alanine_mg'] = Variable<double>(alanineMg);
    }
    if (!nullToAbsent || alcoholG != null) {
      map['alcohol_g'] = Variable<double>(alcoholG);
    }
    if (!nullToAbsent || arginineMg != null) {
      map['arginine_mg'] = Variable<double>(arginineMg);
    }
    if (!nullToAbsent || asparticAcidMg != null) {
      map['aspartic_acid_mg'] = Variable<double>(asparticAcidMg);
    }
    if (!nullToAbsent || betaineMg != null) {
      map['betaine_mg'] = Variable<double>(betaineMg);
    }
    if (!nullToAbsent || bigImage != null) {
      map['big_image'] = Variable<String>(bigImage);
    }
    if (!nullToAbsent || biotinB7Mcg != null) {
      map['biotin_b7_mcg'] = Variable<double>(biotinB7Mcg);
    }
    if (!nullToAbsent || caffeineMg != null) {
      map['caffeine_mg'] = Variable<double>(caffeineMg);
    }
    if (!nullToAbsent || calciumMg != null) {
      map['calcium_mg'] = Variable<double>(calciumMg);
    }
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<double>(calories);
    }
    if (!nullToAbsent || carbohydrateG != null) {
      map['carbohydrate_g'] = Variable<double>(carbohydrateG);
    }
    if (!nullToAbsent || caroteneAlphaMcg != null) {
      map['carotene_alpha_mcg'] = Variable<double>(caroteneAlphaMcg);
    }
    if (!nullToAbsent || caroteneBetaMcg != null) {
      map['carotene_beta_mcg'] = Variable<double>(caroteneBetaMcg);
    }
    if (!nullToAbsent || chlorineMg != null) {
      map['chlorine_mg'] = Variable<double>(chlorineMg);
    }
    if (!nullToAbsent || cholesterolMg != null) {
      map['cholesterol_mg'] = Variable<double>(cholesterolMg);
    }
    if (!nullToAbsent || cholineMg != null) {
      map['choline_mg'] = Variable<double>(cholineMg);
    }
    if (!nullToAbsent || copperCuMg != null) {
      map['copper_cu_mg'] = Variable<double>(copperCuMg);
    }
    if (!nullToAbsent || created != null) {
      map['created'] = Variable<DateTime>(created);
    }
    if (!nullToAbsent || cystineMg != null) {
      map['cystine_mg'] = Variable<double>(cystineMg);
    }
    if (!nullToAbsent || dihydrophylloquinoneMcg != null) {
      map['dihydrophylloquinone_mcg'] =
          Variable<double>(dihydrophylloquinoneMcg);
    }
    if (!nullToAbsent || fatG != null) {
      map['fat_g'] = Variable<double>(fatG);
    }
    if (!nullToAbsent || fattyAcidsTotalMonounsaturatedMg != null) {
      map['fatty_acids_total_monounsaturated_mg'] =
          Variable<double>(fattyAcidsTotalMonounsaturatedMg);
    }
    if (!nullToAbsent || fattyAcidsTotalPolyunsaturatedMg != null) {
      map['fatty_acids_total_polyunsaturated_mg'] =
          Variable<double>(fattyAcidsTotalPolyunsaturatedMg);
    }
    if (!nullToAbsent || favorite != null) {
      map['favorite'] = Variable<bool>(favorite);
    }
    if (!nullToAbsent || fiberG != null) {
      map['fiber_g'] = Variable<double>(fiberG);
    }
    if (!nullToAbsent || fluorideFMcg != null) {
      map['fluoride_f_mcg'] = Variable<double>(fluorideFMcg);
    }
    if (!nullToAbsent || folateB9Mcg != null) {
      map['folate_b9_mcg'] = Variable<double>(folateB9Mcg);
    }
    if (!nullToAbsent || folateDfeMcg != null) {
      map['folate_dfe_mcg'] = Variable<double>(folateDfeMcg);
    }
    if (!nullToAbsent || folicAcidMcg != null) {
      map['folic_acid_mcg'] = Variable<double>(folicAcidMcg);
    }
    if (!nullToAbsent || foodFolateMcg != null) {
      map['food_folate_mcg'] = Variable<double>(foodFolateMcg);
    }
    if (!nullToAbsent || foodGroup != null) {
      map['food_group'] = Variable<String>(foodGroup);
    }
    if (!nullToAbsent || fructoseG != null) {
      map['fructose_g'] = Variable<double>(fructoseG);
    }
    if (!nullToAbsent || galactoseG != null) {
      map['galactose_g'] = Variable<double>(galactoseG);
    }
    if (!nullToAbsent || glucoseDextroseG != null) {
      map['glucose_dextrose_g'] = Variable<double>(glucoseDextroseG);
    }
    if (!nullToAbsent || glutamicAcidMg != null) {
      map['glutamic_acid_mg'] = Variable<double>(glutamicAcidMg);
    }
    if (!nullToAbsent || glycineMg != null) {
      map['glycine_mg'] = Variable<double>(glycineMg);
    }
    if (!nullToAbsent || histidineMg != null) {
      map['histidine_mg'] = Variable<double>(histidineMg);
    }
    if (!nullToAbsent || hydroxyprolineMg != null) {
      map['hydroxyproline_mg'] = Variable<double>(hydroxyprolineMg);
    }
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || imageFile != null) {
      map['image_file'] = Variable<String>(imageFile);
    }
    if (!nullToAbsent || insolubleFiberG != null) {
      map['insoluble_fiber_g'] = Variable<double>(insolubleFiberG);
    }
    if (!nullToAbsent || ironFeMg != null) {
      map['iron_fe_mg'] = Variable<double>(ironFeMg);
    }
    if (!nullToAbsent || isoleucineMg != null) {
      map['isoleucine_mg'] = Variable<double>(isoleucineMg);
    }
    if (!nullToAbsent || lactoseG != null) {
      map['lactose_g'] = Variable<double>(lactoseG);
    }
    if (!nullToAbsent || leucineMg != null) {
      map['leucine_mg'] = Variable<double>(leucineMg);
    }
    if (!nullToAbsent || luteinZeaxanthinMcg != null) {
      map['lutein_zeaxanthin_mcg'] = Variable<double>(luteinZeaxanthinMcg);
    }
    if (!nullToAbsent || lycopeneMcg != null) {
      map['lycopene_mcg'] = Variable<double>(lycopeneMcg);
    }
    if (!nullToAbsent || lysineMg != null) {
      map['lysine_mg'] = Variable<double>(lysineMg);
    }
    if (!nullToAbsent || magnesiumMg != null) {
      map['magnesium_mg'] = Variable<double>(magnesiumMg);
    }
    if (!nullToAbsent || maltoseG != null) {
      map['maltose_g'] = Variable<double>(maltoseG);
    }
    if (!nullToAbsent || manganeseMg != null) {
      map['manganese_mg'] = Variable<double>(manganeseMg);
    }
    if (!nullToAbsent || menaquinone4Mcg != null) {
      map['menaquinone_4_mcg'] = Variable<double>(menaquinone4Mcg);
    }
    if (!nullToAbsent || methionineMg != null) {
      map['methionine_mg'] = Variable<double>(methionineMg);
    }
    if (!nullToAbsent || molybdenumMcg != null) {
      map['molybdenum_mcg'] = Variable<double>(molybdenumMcg);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || netCarbsG != null) {
      map['net_carbs_g'] = Variable<double>(netCarbsG);
    }
    if (!nullToAbsent || niacinB3Mg != null) {
      map['niacin_b3_mg'] = Variable<double>(niacinB3Mg);
    }
    if (!nullToAbsent || omega3sMg != null) {
      map['omega_3s_mg'] = Variable<double>(omega3sMg);
    }
    if (!nullToAbsent || omega6sMg != null) {
      map['omega_6s_mg'] = Variable<double>(omega6sMg);
    }
    if (!nullToAbsent || pantothenicAcidB5Mg != null) {
      map['pantothenic_acid_b5_mg'] = Variable<double>(pantothenicAcidB5Mg);
    }
    if (!nullToAbsent || phenylalanineMg != null) {
      map['phenylalanine_mg'] = Variable<double>(phenylalanineMg);
    }
    if (!nullToAbsent || phosphorusPMg != null) {
      map['phosphorus_p_mg'] = Variable<double>(phosphorusPMg);
    }
    if (!nullToAbsent || potassiumKMg != null) {
      map['potassium_k_mg'] = Variable<double>(potassiumKMg);
    }
    if (!nullToAbsent || pralScore != null) {
      map['pral_score'] = Variable<double>(pralScore);
    }
    if (!nullToAbsent || prolineMg != null) {
      map['proline_mg'] = Variable<double>(prolineMg);
    }
    if (!nullToAbsent || proteinG != null) {
      map['protein_g'] = Variable<double>(proteinG);
    }
    if (!nullToAbsent || retinolMcg != null) {
      map['retinol_mcg'] = Variable<double>(retinolMcg);
    }
    if (!nullToAbsent || riboflavinB2Mg != null) {
      map['riboflavin_b2_mg'] = Variable<double>(riboflavinB2Mg);
    }
    if (!nullToAbsent || saturatedFatsG != null) {
      map['saturated_fats_g'] = Variable<double>(saturatedFatsG);
    }
    if (!nullToAbsent || seleniumSeMcg != null) {
      map['selenium_se_mcg'] = Variable<double>(seleniumSeMcg);
    }
    if (!nullToAbsent || serineMg != null) {
      map['serine_mg'] = Variable<double>(serineMg);
    }
    if (!nullToAbsent || servingDescription1G != null) {
      map['serving_description_1_g'] = Variable<String>(servingDescription1G);
    }
    if (!nullToAbsent || servingDescription2G != null) {
      map['serving_description_2_g'] = Variable<String>(servingDescription2G);
    }
    if (!nullToAbsent || servingDescription3G != null) {
      map['serving_description_3_g'] = Variable<String>(servingDescription3G);
    }
    if (!nullToAbsent || servingDescription4G != null) {
      map['serving_description_4_g'] = Variable<String>(servingDescription4G);
    }
    if (!nullToAbsent || servingDescription5G != null) {
      map['serving_description_5_g'] = Variable<String>(servingDescription5G);
    }
    if (!nullToAbsent || servingDescription6G != null) {
      map['serving_description_6_g'] = Variable<String>(servingDescription6G);
    }
    if (!nullToAbsent || servingDescription7G != null) {
      map['serving_description_7_g'] = Variable<String>(servingDescription7G);
    }
    if (!nullToAbsent || servingDescription8G != null) {
      map['serving_description_8_g'] = Variable<String>(servingDescription8G);
    }
    if (!nullToAbsent || servingDescription9G != null) {
      map['serving_description_9_g'] = Variable<String>(servingDescription9G);
    }
    if (!nullToAbsent || servingSize != null) {
      map['serving_size'] = Variable<double>(servingSize);
    }
    if (!nullToAbsent || servingUnit != null) {
      map['serving_unit'] = Variable<String>(servingUnit);
    }
    if (!nullToAbsent || servingWeight1G != null) {
      map['serving_weight_1_g'] = Variable<double>(servingWeight1G);
    }
    if (!nullToAbsent || servingWeight2G != null) {
      map['serving_weight_2_g'] = Variable<double>(servingWeight2G);
    }
    if (!nullToAbsent || servingWeight3G != null) {
      map['serving_weight_3_g'] = Variable<double>(servingWeight3G);
    }
    if (!nullToAbsent || servingWeight4G != null) {
      map['serving_weight_4_g'] = Variable<double>(servingWeight4G);
    }
    if (!nullToAbsent || servingWeight5G != null) {
      map['serving_weight_5_g'] = Variable<double>(servingWeight5G);
    }
    if (!nullToAbsent || servingWeight6G != null) {
      map['serving_weight_6_g'] = Variable<double>(servingWeight6G);
    }
    if (!nullToAbsent || servingWeight7G != null) {
      map['serving_weight_7_g'] = Variable<double>(servingWeight7G);
    }
    if (!nullToAbsent || servingWeight8G != null) {
      map['serving_weight_8_g'] = Variable<double>(servingWeight8G);
    }
    if (!nullToAbsent || servingWeight9G != null) {
      map['serving_weight_9_g'] = Variable<double>(servingWeight9G);
    }
    if (!nullToAbsent || smallImage != null) {
      map['small_image'] = Variable<String>(smallImage);
    }
    if (!nullToAbsent || sodiumMg != null) {
      map['sodium_mg'] = Variable<double>(sodiumMg);
    }
    if (!nullToAbsent || solubleFiberG != null) {
      map['soluble_fiber_g'] = Variable<double>(solubleFiberG);
    }
    if (!nullToAbsent || starchG != null) {
      map['starch_g'] = Variable<double>(starchG);
    }
    if (!nullToAbsent || sucroseG != null) {
      map['sucrose_g'] = Variable<double>(sucroseG);
    }
    if (!nullToAbsent || sugarsG != null) {
      map['sugars_g'] = Variable<double>(sugarsG);
    }
    if (!nullToAbsent || theobromineMg != null) {
      map['theobromine_mg'] = Variable<double>(theobromineMg);
    }
    if (!nullToAbsent || thiaminB1Mg != null) {
      map['thiamin_b1_mg'] = Variable<double>(thiaminB1Mg);
    }
    if (!nullToAbsent || threonineMg != null) {
      map['threonine_mg'] = Variable<double>(threonineMg);
    }
    if (!nullToAbsent || totalSugarAlcoholsG != null) {
      map['total_sugar_alcohols_g'] = Variable<double>(totalSugarAlcoholsG);
    }
    if (!nullToAbsent || transFattyAcidsG != null) {
      map['trans_fatty_acids_g'] = Variable<double>(transFattyAcidsG);
    }
    if (!nullToAbsent || tryptophanMg != null) {
      map['tryptophan_mg'] = Variable<double>(tryptophanMg);
    }
    if (!nullToAbsent || tyrosineMg != null) {
      map['tyrosine_mg'] = Variable<double>(tyrosineMg);
    }
    if (!nullToAbsent || u183N3CCCAlaMg != null) {
      map['_18_3_n_3_c_c_c_ala_mg'] = Variable<double>(u183N3CCCAlaMg);
    }
    if (!nullToAbsent || u200calorieWeightG != null) {
      map['_200_calorie_weight_g'] = Variable<double>(u200calorieWeightG);
    }
    if (!nullToAbsent || u205N3EpaMg != null) {
      map['_20_5_n_3_epa_mg'] = Variable<double>(u205N3EpaMg);
    }
    if (!nullToAbsent || u225N3DpaMg != null) {
      map['_22_5_n_3_dpa_mg'] = Variable<double>(u225N3DpaMg);
    }
    if (!nullToAbsent || u226N3DhaMg != null) {
      map['_22_6_n_3_dha_mg'] = Variable<double>(u226N3DhaMg);
    }
    if (!nullToAbsent || valineMg != null) {
      map['valine_mg'] = Variable<double>(valineMg);
    }
    if (!nullToAbsent || vitaminAIuIu != null) {
      map['vitamin_a_iu_iu'] = Variable<double>(vitaminAIuIu);
    }
    if (!nullToAbsent || vitaminARaeMcg != null) {
      map['vitamin_a_rae_mcg'] = Variable<double>(vitaminARaeMcg);
    }
    if (!nullToAbsent || vitaminB12Mcg != null) {
      map['vitamin_b_12_mcg'] = Variable<double>(vitaminB12Mcg);
    }
    if (!nullToAbsent || vitaminB6Mg != null) {
      map['vitamin_b6_mg'] = Variable<double>(vitaminB6Mg);
    }
    if (!nullToAbsent || vitaminCMg != null) {
      map['vitamin_c_mg'] = Variable<double>(vitaminCMg);
    }
    if (!nullToAbsent || vitaminD2ErgocalciferolMcg != null) {
      map['vitamin_d2_ergocalciferol_mcg'] =
          Variable<double>(vitaminD2ErgocalciferolMcg);
    }
    if (!nullToAbsent || vitaminD3CholecalciferolMcg != null) {
      map['vitamin_d3_cholecalciferol_mcg'] =
          Variable<double>(vitaminD3CholecalciferolMcg);
    }
    if (!nullToAbsent || vitaminDIuIu != null) {
      map['vitamin_d_iu_iu'] = Variable<double>(vitaminDIuIu);
    }
    if (!nullToAbsent || vitaminDMcg != null) {
      map['vitamin_d_mcg'] = Variable<double>(vitaminDMcg);
    }
    if (!nullToAbsent || vitaminEAlphaTocopherolMg != null) {
      map['vitamin_e_alpha_tocopherol_mg'] =
          Variable<double>(vitaminEAlphaTocopherolMg);
    }
    if (!nullToAbsent || vitaminKMcg != null) {
      map['vitamin_k_mcg'] = Variable<double>(vitaminKMcg);
    }
    if (!nullToAbsent || waterG != null) {
      map['water_g'] = Variable<double>(waterG);
    }
    if (!nullToAbsent || zincZnMg != null) {
      map['zinc_zn_mg'] = Variable<double>(zincZnMg);
    }
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      addedSugarG: addedSugarG == null && nullToAbsent
          ? const Value.absent()
          : Value(addedSugarG),
      alanineMg: alanineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(alanineMg),
      alcoholG: alcoholG == null && nullToAbsent
          ? const Value.absent()
          : Value(alcoholG),
      arginineMg: arginineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(arginineMg),
      asparticAcidMg: asparticAcidMg == null && nullToAbsent
          ? const Value.absent()
          : Value(asparticAcidMg),
      betaineMg: betaineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(betaineMg),
      bigImage: bigImage == null && nullToAbsent
          ? const Value.absent()
          : Value(bigImage),
      biotinB7Mcg: biotinB7Mcg == null && nullToAbsent
          ? const Value.absent()
          : Value(biotinB7Mcg),
      caffeineMg: caffeineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(caffeineMg),
      calciumMg: calciumMg == null && nullToAbsent
          ? const Value.absent()
          : Value(calciumMg),
      calories: calories == null && nullToAbsent
          ? const Value.absent()
          : Value(calories),
      carbohydrateG: carbohydrateG == null && nullToAbsent
          ? const Value.absent()
          : Value(carbohydrateG),
      caroteneAlphaMcg: caroteneAlphaMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(caroteneAlphaMcg),
      caroteneBetaMcg: caroteneBetaMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(caroteneBetaMcg),
      chlorineMg: chlorineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(chlorineMg),
      cholesterolMg: cholesterolMg == null && nullToAbsent
          ? const Value.absent()
          : Value(cholesterolMg),
      cholineMg: cholineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(cholineMg),
      copperCuMg: copperCuMg == null && nullToAbsent
          ? const Value.absent()
          : Value(copperCuMg),
      created: created == null && nullToAbsent
          ? const Value.absent()
          : Value(created),
      cystineMg: cystineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(cystineMg),
      dihydrophylloquinoneMcg: dihydrophylloquinoneMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(dihydrophylloquinoneMcg),
      fatG: fatG == null && nullToAbsent ? const Value.absent() : Value(fatG),
      fattyAcidsTotalMonounsaturatedMg:
          fattyAcidsTotalMonounsaturatedMg == null && nullToAbsent
              ? const Value.absent()
              : Value(fattyAcidsTotalMonounsaturatedMg),
      fattyAcidsTotalPolyunsaturatedMg:
          fattyAcidsTotalPolyunsaturatedMg == null && nullToAbsent
              ? const Value.absent()
              : Value(fattyAcidsTotalPolyunsaturatedMg),
      favorite: favorite == null && nullToAbsent
          ? const Value.absent()
          : Value(favorite),
      fiberG:
          fiberG == null && nullToAbsent ? const Value.absent() : Value(fiberG),
      fluorideFMcg: fluorideFMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(fluorideFMcg),
      folateB9Mcg: folateB9Mcg == null && nullToAbsent
          ? const Value.absent()
          : Value(folateB9Mcg),
      folateDfeMcg: folateDfeMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(folateDfeMcg),
      folicAcidMcg: folicAcidMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(folicAcidMcg),
      foodFolateMcg: foodFolateMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(foodFolateMcg),
      foodGroup: foodGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(foodGroup),
      fructoseG: fructoseG == null && nullToAbsent
          ? const Value.absent()
          : Value(fructoseG),
      galactoseG: galactoseG == null && nullToAbsent
          ? const Value.absent()
          : Value(galactoseG),
      glucoseDextroseG: glucoseDextroseG == null && nullToAbsent
          ? const Value.absent()
          : Value(glucoseDextroseG),
      glutamicAcidMg: glutamicAcidMg == null && nullToAbsent
          ? const Value.absent()
          : Value(glutamicAcidMg),
      glycineMg: glycineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(glycineMg),
      histidineMg: histidineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(histidineMg),
      hydroxyprolineMg: hydroxyprolineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(hydroxyprolineMg),
      id: Value(id),
      imageFile: imageFile == null && nullToAbsent
          ? const Value.absent()
          : Value(imageFile),
      insolubleFiberG: insolubleFiberG == null && nullToAbsent
          ? const Value.absent()
          : Value(insolubleFiberG),
      ironFeMg: ironFeMg == null && nullToAbsent
          ? const Value.absent()
          : Value(ironFeMg),
      isoleucineMg: isoleucineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(isoleucineMg),
      lactoseG: lactoseG == null && nullToAbsent
          ? const Value.absent()
          : Value(lactoseG),
      leucineMg: leucineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(leucineMg),
      luteinZeaxanthinMcg: luteinZeaxanthinMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(luteinZeaxanthinMcg),
      lycopeneMcg: lycopeneMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(lycopeneMcg),
      lysineMg: lysineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(lysineMg),
      magnesiumMg: magnesiumMg == null && nullToAbsent
          ? const Value.absent()
          : Value(magnesiumMg),
      maltoseG: maltoseG == null && nullToAbsent
          ? const Value.absent()
          : Value(maltoseG),
      manganeseMg: manganeseMg == null && nullToAbsent
          ? const Value.absent()
          : Value(manganeseMg),
      menaquinone4Mcg: menaquinone4Mcg == null && nullToAbsent
          ? const Value.absent()
          : Value(menaquinone4Mcg),
      methionineMg: methionineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(methionineMg),
      molybdenumMcg: molybdenumMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(molybdenumMcg),
      name: Value(name),
      netCarbsG: netCarbsG == null && nullToAbsent
          ? const Value.absent()
          : Value(netCarbsG),
      niacinB3Mg: niacinB3Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(niacinB3Mg),
      omega3sMg: omega3sMg == null && nullToAbsent
          ? const Value.absent()
          : Value(omega3sMg),
      omega6sMg: omega6sMg == null && nullToAbsent
          ? const Value.absent()
          : Value(omega6sMg),
      pantothenicAcidB5Mg: pantothenicAcidB5Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(pantothenicAcidB5Mg),
      phenylalanineMg: phenylalanineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(phenylalanineMg),
      phosphorusPMg: phosphorusPMg == null && nullToAbsent
          ? const Value.absent()
          : Value(phosphorusPMg),
      potassiumKMg: potassiumKMg == null && nullToAbsent
          ? const Value.absent()
          : Value(potassiumKMg),
      pralScore: pralScore == null && nullToAbsent
          ? const Value.absent()
          : Value(pralScore),
      prolineMg: prolineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(prolineMg),
      proteinG: proteinG == null && nullToAbsent
          ? const Value.absent()
          : Value(proteinG),
      retinolMcg: retinolMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(retinolMcg),
      riboflavinB2Mg: riboflavinB2Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(riboflavinB2Mg),
      saturatedFatsG: saturatedFatsG == null && nullToAbsent
          ? const Value.absent()
          : Value(saturatedFatsG),
      seleniumSeMcg: seleniumSeMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(seleniumSeMcg),
      serineMg: serineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(serineMg),
      servingDescription1G: servingDescription1G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription1G),
      servingDescription2G: servingDescription2G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription2G),
      servingDescription3G: servingDescription3G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription3G),
      servingDescription4G: servingDescription4G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription4G),
      servingDescription5G: servingDescription5G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription5G),
      servingDescription6G: servingDescription6G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription6G),
      servingDescription7G: servingDescription7G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription7G),
      servingDescription8G: servingDescription8G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription8G),
      servingDescription9G: servingDescription9G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription9G),
      servingSize: servingSize == null && nullToAbsent
          ? const Value.absent()
          : Value(servingSize),
      servingUnit: servingUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(servingUnit),
      servingWeight1G: servingWeight1G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight1G),
      servingWeight2G: servingWeight2G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight2G),
      servingWeight3G: servingWeight3G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight3G),
      servingWeight4G: servingWeight4G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight4G),
      servingWeight5G: servingWeight5G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight5G),
      servingWeight6G: servingWeight6G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight6G),
      servingWeight7G: servingWeight7G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight7G),
      servingWeight8G: servingWeight8G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight8G),
      servingWeight9G: servingWeight9G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight9G),
      smallImage: smallImage == null && nullToAbsent
          ? const Value.absent()
          : Value(smallImage),
      sodiumMg: sodiumMg == null && nullToAbsent
          ? const Value.absent()
          : Value(sodiumMg),
      solubleFiberG: solubleFiberG == null && nullToAbsent
          ? const Value.absent()
          : Value(solubleFiberG),
      starchG: starchG == null && nullToAbsent
          ? const Value.absent()
          : Value(starchG),
      sucroseG: sucroseG == null && nullToAbsent
          ? const Value.absent()
          : Value(sucroseG),
      sugarsG: sugarsG == null && nullToAbsent
          ? const Value.absent()
          : Value(sugarsG),
      theobromineMg: theobromineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(theobromineMg),
      thiaminB1Mg: thiaminB1Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(thiaminB1Mg),
      threonineMg: threonineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(threonineMg),
      totalSugarAlcoholsG: totalSugarAlcoholsG == null && nullToAbsent
          ? const Value.absent()
          : Value(totalSugarAlcoholsG),
      transFattyAcidsG: transFattyAcidsG == null && nullToAbsent
          ? const Value.absent()
          : Value(transFattyAcidsG),
      tryptophanMg: tryptophanMg == null && nullToAbsent
          ? const Value.absent()
          : Value(tryptophanMg),
      tyrosineMg: tyrosineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(tyrosineMg),
      u183N3CCCAlaMg: u183N3CCCAlaMg == null && nullToAbsent
          ? const Value.absent()
          : Value(u183N3CCCAlaMg),
      u200calorieWeightG: u200calorieWeightG == null && nullToAbsent
          ? const Value.absent()
          : Value(u200calorieWeightG),
      u205N3EpaMg: u205N3EpaMg == null && nullToAbsent
          ? const Value.absent()
          : Value(u205N3EpaMg),
      u225N3DpaMg: u225N3DpaMg == null && nullToAbsent
          ? const Value.absent()
          : Value(u225N3DpaMg),
      u226N3DhaMg: u226N3DhaMg == null && nullToAbsent
          ? const Value.absent()
          : Value(u226N3DhaMg),
      valineMg: valineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(valineMg),
      vitaminAIuIu: vitaminAIuIu == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminAIuIu),
      vitaminARaeMcg: vitaminARaeMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminARaeMcg),
      vitaminB12Mcg: vitaminB12Mcg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB12Mcg),
      vitaminB6Mg: vitaminB6Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB6Mg),
      vitaminCMg: vitaminCMg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminCMg),
      vitaminD2ErgocalciferolMcg:
          vitaminD2ErgocalciferolMcg == null && nullToAbsent
              ? const Value.absent()
              : Value(vitaminD2ErgocalciferolMcg),
      vitaminD3CholecalciferolMcg:
          vitaminD3CholecalciferolMcg == null && nullToAbsent
              ? const Value.absent()
              : Value(vitaminD3CholecalciferolMcg),
      vitaminDIuIu: vitaminDIuIu == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminDIuIu),
      vitaminDMcg: vitaminDMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminDMcg),
      vitaminEAlphaTocopherolMg:
          vitaminEAlphaTocopherolMg == null && nullToAbsent
              ? const Value.absent()
              : Value(vitaminEAlphaTocopherolMg),
      vitaminKMcg: vitaminKMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminKMcg),
      waterG:
          waterG == null && nullToAbsent ? const Value.absent() : Value(waterG),
      zincZnMg: zincZnMg == null && nullToAbsent
          ? const Value.absent()
          : Value(zincZnMg),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Food(
      barcode: serializer.fromJson<String?>(json['barcode']),
      addedSugarG: serializer.fromJson<double?>(json['addedSugarG']),
      alanineMg: serializer.fromJson<double?>(json['alanineMg']),
      alcoholG: serializer.fromJson<double?>(json['alcoholG']),
      arginineMg: serializer.fromJson<double?>(json['arginineMg']),
      asparticAcidMg: serializer.fromJson<double?>(json['asparticAcidMg']),
      betaineMg: serializer.fromJson<double?>(json['betaineMg']),
      bigImage: serializer.fromJson<String?>(json['bigImage']),
      biotinB7Mcg: serializer.fromJson<double?>(json['biotinB7Mcg']),
      caffeineMg: serializer.fromJson<double?>(json['caffeineMg']),
      calciumMg: serializer.fromJson<double?>(json['calciumMg']),
      calories: serializer.fromJson<double?>(json['calories']),
      carbohydrateG: serializer.fromJson<double?>(json['carbohydrateG']),
      caroteneAlphaMcg: serializer.fromJson<double?>(json['caroteneAlphaMcg']),
      caroteneBetaMcg: serializer.fromJson<double?>(json['caroteneBetaMcg']),
      chlorineMg: serializer.fromJson<double?>(json['chlorineMg']),
      cholesterolMg: serializer.fromJson<double?>(json['cholesterolMg']),
      cholineMg: serializer.fromJson<double?>(json['cholineMg']),
      copperCuMg: serializer.fromJson<double?>(json['copperCuMg']),
      created: serializer.fromJson<DateTime?>(json['created']),
      cystineMg: serializer.fromJson<double?>(json['cystineMg']),
      dihydrophylloquinoneMcg:
          serializer.fromJson<double?>(json['dihydrophylloquinoneMcg']),
      fatG: serializer.fromJson<double?>(json['fatG']),
      fattyAcidsTotalMonounsaturatedMg: serializer
          .fromJson<double?>(json['fattyAcidsTotalMonounsaturatedMg']),
      fattyAcidsTotalPolyunsaturatedMg: serializer
          .fromJson<double?>(json['fattyAcidsTotalPolyunsaturatedMg']),
      favorite: serializer.fromJson<bool?>(json['favorite']),
      fiberG: serializer.fromJson<double?>(json['fiberG']),
      fluorideFMcg: serializer.fromJson<double?>(json['fluorideFMcg']),
      folateB9Mcg: serializer.fromJson<double?>(json['folateB9Mcg']),
      folateDfeMcg: serializer.fromJson<double?>(json['folateDfeMcg']),
      folicAcidMcg: serializer.fromJson<double?>(json['folicAcidMcg']),
      foodFolateMcg: serializer.fromJson<double?>(json['foodFolateMcg']),
      foodGroup: serializer.fromJson<String?>(json['foodGroup']),
      fructoseG: serializer.fromJson<double?>(json['fructoseG']),
      galactoseG: serializer.fromJson<double?>(json['galactoseG']),
      glucoseDextroseG: serializer.fromJson<double?>(json['glucoseDextroseG']),
      glutamicAcidMg: serializer.fromJson<double?>(json['glutamicAcidMg']),
      glycineMg: serializer.fromJson<double?>(json['glycineMg']),
      histidineMg: serializer.fromJson<double?>(json['histidineMg']),
      hydroxyprolineMg: serializer.fromJson<double?>(json['hydroxyprolineMg']),
      id: serializer.fromJson<int>(json['id']),
      imageFile: serializer.fromJson<String?>(json['imageFile']),
      insolubleFiberG: serializer.fromJson<double?>(json['insolubleFiberG']),
      ironFeMg: serializer.fromJson<double?>(json['ironFeMg']),
      isoleucineMg: serializer.fromJson<double?>(json['isoleucineMg']),
      lactoseG: serializer.fromJson<double?>(json['lactoseG']),
      leucineMg: serializer.fromJson<double?>(json['leucineMg']),
      luteinZeaxanthinMcg:
          serializer.fromJson<double?>(json['luteinZeaxanthinMcg']),
      lycopeneMcg: serializer.fromJson<double?>(json['lycopeneMcg']),
      lysineMg: serializer.fromJson<double?>(json['lysineMg']),
      magnesiumMg: serializer.fromJson<double?>(json['magnesiumMg']),
      maltoseG: serializer.fromJson<double?>(json['maltoseG']),
      manganeseMg: serializer.fromJson<double?>(json['manganeseMg']),
      menaquinone4Mcg: serializer.fromJson<double?>(json['menaquinone4Mcg']),
      methionineMg: serializer.fromJson<double?>(json['methionineMg']),
      molybdenumMcg: serializer.fromJson<double?>(json['molybdenumMcg']),
      name: serializer.fromJson<String>(json['name']),
      netCarbsG: serializer.fromJson<double?>(json['netCarbsG']),
      niacinB3Mg: serializer.fromJson<double?>(json['niacinB3Mg']),
      omega3sMg: serializer.fromJson<double?>(json['omega3sMg']),
      omega6sMg: serializer.fromJson<double?>(json['omega6sMg']),
      pantothenicAcidB5Mg:
          serializer.fromJson<double?>(json['pantothenicAcidB5Mg']),
      phenylalanineMg: serializer.fromJson<double?>(json['phenylalanineMg']),
      phosphorusPMg: serializer.fromJson<double?>(json['phosphorusPMg']),
      potassiumKMg: serializer.fromJson<double?>(json['potassiumKMg']),
      pralScore: serializer.fromJson<double?>(json['pralScore']),
      prolineMg: serializer.fromJson<double?>(json['prolineMg']),
      proteinG: serializer.fromJson<double?>(json['proteinG']),
      retinolMcg: serializer.fromJson<double?>(json['retinolMcg']),
      riboflavinB2Mg: serializer.fromJson<double?>(json['riboflavinB2Mg']),
      saturatedFatsG: serializer.fromJson<double?>(json['saturatedFatsG']),
      seleniumSeMcg: serializer.fromJson<double?>(json['seleniumSeMcg']),
      serineMg: serializer.fromJson<double?>(json['serineMg']),
      servingDescription1G:
          serializer.fromJson<String?>(json['servingDescription1G']),
      servingDescription2G:
          serializer.fromJson<String?>(json['servingDescription2G']),
      servingDescription3G:
          serializer.fromJson<String?>(json['servingDescription3G']),
      servingDescription4G:
          serializer.fromJson<String?>(json['servingDescription4G']),
      servingDescription5G:
          serializer.fromJson<String?>(json['servingDescription5G']),
      servingDescription6G:
          serializer.fromJson<String?>(json['servingDescription6G']),
      servingDescription7G:
          serializer.fromJson<String?>(json['servingDescription7G']),
      servingDescription8G:
          serializer.fromJson<String?>(json['servingDescription8G']),
      servingDescription9G:
          serializer.fromJson<String?>(json['servingDescription9G']),
      servingSize: serializer.fromJson<double?>(json['servingSize']),
      servingUnit: serializer.fromJson<String?>(json['servingUnit']),
      servingWeight1G: serializer.fromJson<double?>(json['servingWeight1G']),
      servingWeight2G: serializer.fromJson<double?>(json['servingWeight2G']),
      servingWeight3G: serializer.fromJson<double?>(json['servingWeight3G']),
      servingWeight4G: serializer.fromJson<double?>(json['servingWeight4G']),
      servingWeight5G: serializer.fromJson<double?>(json['servingWeight5G']),
      servingWeight6G: serializer.fromJson<double?>(json['servingWeight6G']),
      servingWeight7G: serializer.fromJson<double?>(json['servingWeight7G']),
      servingWeight8G: serializer.fromJson<double?>(json['servingWeight8G']),
      servingWeight9G: serializer.fromJson<double?>(json['servingWeight9G']),
      smallImage: serializer.fromJson<String?>(json['smallImage']),
      sodiumMg: serializer.fromJson<double?>(json['sodiumMg']),
      solubleFiberG: serializer.fromJson<double?>(json['solubleFiberG']),
      starchG: serializer.fromJson<double?>(json['starchG']),
      sucroseG: serializer.fromJson<double?>(json['sucroseG']),
      sugarsG: serializer.fromJson<double?>(json['sugarsG']),
      theobromineMg: serializer.fromJson<double?>(json['theobromineMg']),
      thiaminB1Mg: serializer.fromJson<double?>(json['thiaminB1Mg']),
      threonineMg: serializer.fromJson<double?>(json['threonineMg']),
      totalSugarAlcoholsG:
          serializer.fromJson<double?>(json['totalSugarAlcoholsG']),
      transFattyAcidsG: serializer.fromJson<double?>(json['transFattyAcidsG']),
      tryptophanMg: serializer.fromJson<double?>(json['tryptophanMg']),
      tyrosineMg: serializer.fromJson<double?>(json['tyrosineMg']),
      u183N3CCCAlaMg: serializer.fromJson<double?>(json['u183N3CCCAlaMg']),
      u200calorieWeightG:
          serializer.fromJson<double?>(json['u200calorieWeightG']),
      u205N3EpaMg: serializer.fromJson<double?>(json['u205N3EpaMg']),
      u225N3DpaMg: serializer.fromJson<double?>(json['u225N3DpaMg']),
      u226N3DhaMg: serializer.fromJson<double?>(json['u226N3DhaMg']),
      valineMg: serializer.fromJson<double?>(json['valineMg']),
      vitaminAIuIu: serializer.fromJson<double?>(json['vitaminAIuIu']),
      vitaminARaeMcg: serializer.fromJson<double?>(json['vitaminARaeMcg']),
      vitaminB12Mcg: serializer.fromJson<double?>(json['vitaminB12Mcg']),
      vitaminB6Mg: serializer.fromJson<double?>(json['vitaminB6Mg']),
      vitaminCMg: serializer.fromJson<double?>(json['vitaminCMg']),
      vitaminD2ErgocalciferolMcg:
          serializer.fromJson<double?>(json['vitaminD2ErgocalciferolMcg']),
      vitaminD3CholecalciferolMcg:
          serializer.fromJson<double?>(json['vitaminD3CholecalciferolMcg']),
      vitaminDIuIu: serializer.fromJson<double?>(json['vitaminDIuIu']),
      vitaminDMcg: serializer.fromJson<double?>(json['vitaminDMcg']),
      vitaminEAlphaTocopherolMg:
          serializer.fromJson<double?>(json['vitaminEAlphaTocopherolMg']),
      vitaminKMcg: serializer.fromJson<double?>(json['vitaminKMcg']),
      waterG: serializer.fromJson<double?>(json['waterG']),
      zincZnMg: serializer.fromJson<double?>(json['zincZnMg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'barcode': serializer.toJson<String?>(barcode),
      'addedSugarG': serializer.toJson<double?>(addedSugarG),
      'alanineMg': serializer.toJson<double?>(alanineMg),
      'alcoholG': serializer.toJson<double?>(alcoholG),
      'arginineMg': serializer.toJson<double?>(arginineMg),
      'asparticAcidMg': serializer.toJson<double?>(asparticAcidMg),
      'betaineMg': serializer.toJson<double?>(betaineMg),
      'bigImage': serializer.toJson<String?>(bigImage),
      'biotinB7Mcg': serializer.toJson<double?>(biotinB7Mcg),
      'caffeineMg': serializer.toJson<double?>(caffeineMg),
      'calciumMg': serializer.toJson<double?>(calciumMg),
      'calories': serializer.toJson<double?>(calories),
      'carbohydrateG': serializer.toJson<double?>(carbohydrateG),
      'caroteneAlphaMcg': serializer.toJson<double?>(caroteneAlphaMcg),
      'caroteneBetaMcg': serializer.toJson<double?>(caroteneBetaMcg),
      'chlorineMg': serializer.toJson<double?>(chlorineMg),
      'cholesterolMg': serializer.toJson<double?>(cholesterolMg),
      'cholineMg': serializer.toJson<double?>(cholineMg),
      'copperCuMg': serializer.toJson<double?>(copperCuMg),
      'created': serializer.toJson<DateTime?>(created),
      'cystineMg': serializer.toJson<double?>(cystineMg),
      'dihydrophylloquinoneMcg':
          serializer.toJson<double?>(dihydrophylloquinoneMcg),
      'fatG': serializer.toJson<double?>(fatG),
      'fattyAcidsTotalMonounsaturatedMg':
          serializer.toJson<double?>(fattyAcidsTotalMonounsaturatedMg),
      'fattyAcidsTotalPolyunsaturatedMg':
          serializer.toJson<double?>(fattyAcidsTotalPolyunsaturatedMg),
      'favorite': serializer.toJson<bool?>(favorite),
      'fiberG': serializer.toJson<double?>(fiberG),
      'fluorideFMcg': serializer.toJson<double?>(fluorideFMcg),
      'folateB9Mcg': serializer.toJson<double?>(folateB9Mcg),
      'folateDfeMcg': serializer.toJson<double?>(folateDfeMcg),
      'folicAcidMcg': serializer.toJson<double?>(folicAcidMcg),
      'foodFolateMcg': serializer.toJson<double?>(foodFolateMcg),
      'foodGroup': serializer.toJson<String?>(foodGroup),
      'fructoseG': serializer.toJson<double?>(fructoseG),
      'galactoseG': serializer.toJson<double?>(galactoseG),
      'glucoseDextroseG': serializer.toJson<double?>(glucoseDextroseG),
      'glutamicAcidMg': serializer.toJson<double?>(glutamicAcidMg),
      'glycineMg': serializer.toJson<double?>(glycineMg),
      'histidineMg': serializer.toJson<double?>(histidineMg),
      'hydroxyprolineMg': serializer.toJson<double?>(hydroxyprolineMg),
      'id': serializer.toJson<int>(id),
      'imageFile': serializer.toJson<String?>(imageFile),
      'insolubleFiberG': serializer.toJson<double?>(insolubleFiberG),
      'ironFeMg': serializer.toJson<double?>(ironFeMg),
      'isoleucineMg': serializer.toJson<double?>(isoleucineMg),
      'lactoseG': serializer.toJson<double?>(lactoseG),
      'leucineMg': serializer.toJson<double?>(leucineMg),
      'luteinZeaxanthinMcg': serializer.toJson<double?>(luteinZeaxanthinMcg),
      'lycopeneMcg': serializer.toJson<double?>(lycopeneMcg),
      'lysineMg': serializer.toJson<double?>(lysineMg),
      'magnesiumMg': serializer.toJson<double?>(magnesiumMg),
      'maltoseG': serializer.toJson<double?>(maltoseG),
      'manganeseMg': serializer.toJson<double?>(manganeseMg),
      'menaquinone4Mcg': serializer.toJson<double?>(menaquinone4Mcg),
      'methionineMg': serializer.toJson<double?>(methionineMg),
      'molybdenumMcg': serializer.toJson<double?>(molybdenumMcg),
      'name': serializer.toJson<String>(name),
      'netCarbsG': serializer.toJson<double?>(netCarbsG),
      'niacinB3Mg': serializer.toJson<double?>(niacinB3Mg),
      'omega3sMg': serializer.toJson<double?>(omega3sMg),
      'omega6sMg': serializer.toJson<double?>(omega6sMg),
      'pantothenicAcidB5Mg': serializer.toJson<double?>(pantothenicAcidB5Mg),
      'phenylalanineMg': serializer.toJson<double?>(phenylalanineMg),
      'phosphorusPMg': serializer.toJson<double?>(phosphorusPMg),
      'potassiumKMg': serializer.toJson<double?>(potassiumKMg),
      'pralScore': serializer.toJson<double?>(pralScore),
      'prolineMg': serializer.toJson<double?>(prolineMg),
      'proteinG': serializer.toJson<double?>(proteinG),
      'retinolMcg': serializer.toJson<double?>(retinolMcg),
      'riboflavinB2Mg': serializer.toJson<double?>(riboflavinB2Mg),
      'saturatedFatsG': serializer.toJson<double?>(saturatedFatsG),
      'seleniumSeMcg': serializer.toJson<double?>(seleniumSeMcg),
      'serineMg': serializer.toJson<double?>(serineMg),
      'servingDescription1G': serializer.toJson<String?>(servingDescription1G),
      'servingDescription2G': serializer.toJson<String?>(servingDescription2G),
      'servingDescription3G': serializer.toJson<String?>(servingDescription3G),
      'servingDescription4G': serializer.toJson<String?>(servingDescription4G),
      'servingDescription5G': serializer.toJson<String?>(servingDescription5G),
      'servingDescription6G': serializer.toJson<String?>(servingDescription6G),
      'servingDescription7G': serializer.toJson<String?>(servingDescription7G),
      'servingDescription8G': serializer.toJson<String?>(servingDescription8G),
      'servingDescription9G': serializer.toJson<String?>(servingDescription9G),
      'servingSize': serializer.toJson<double?>(servingSize),
      'servingUnit': serializer.toJson<String?>(servingUnit),
      'servingWeight1G': serializer.toJson<double?>(servingWeight1G),
      'servingWeight2G': serializer.toJson<double?>(servingWeight2G),
      'servingWeight3G': serializer.toJson<double?>(servingWeight3G),
      'servingWeight4G': serializer.toJson<double?>(servingWeight4G),
      'servingWeight5G': serializer.toJson<double?>(servingWeight5G),
      'servingWeight6G': serializer.toJson<double?>(servingWeight6G),
      'servingWeight7G': serializer.toJson<double?>(servingWeight7G),
      'servingWeight8G': serializer.toJson<double?>(servingWeight8G),
      'servingWeight9G': serializer.toJson<double?>(servingWeight9G),
      'smallImage': serializer.toJson<String?>(smallImage),
      'sodiumMg': serializer.toJson<double?>(sodiumMg),
      'solubleFiberG': serializer.toJson<double?>(solubleFiberG),
      'starchG': serializer.toJson<double?>(starchG),
      'sucroseG': serializer.toJson<double?>(sucroseG),
      'sugarsG': serializer.toJson<double?>(sugarsG),
      'theobromineMg': serializer.toJson<double?>(theobromineMg),
      'thiaminB1Mg': serializer.toJson<double?>(thiaminB1Mg),
      'threonineMg': serializer.toJson<double?>(threonineMg),
      'totalSugarAlcoholsG': serializer.toJson<double?>(totalSugarAlcoholsG),
      'transFattyAcidsG': serializer.toJson<double?>(transFattyAcidsG),
      'tryptophanMg': serializer.toJson<double?>(tryptophanMg),
      'tyrosineMg': serializer.toJson<double?>(tyrosineMg),
      'u183N3CCCAlaMg': serializer.toJson<double?>(u183N3CCCAlaMg),
      'u200calorieWeightG': serializer.toJson<double?>(u200calorieWeightG),
      'u205N3EpaMg': serializer.toJson<double?>(u205N3EpaMg),
      'u225N3DpaMg': serializer.toJson<double?>(u225N3DpaMg),
      'u226N3DhaMg': serializer.toJson<double?>(u226N3DhaMg),
      'valineMg': serializer.toJson<double?>(valineMg),
      'vitaminAIuIu': serializer.toJson<double?>(vitaminAIuIu),
      'vitaminARaeMcg': serializer.toJson<double?>(vitaminARaeMcg),
      'vitaminB12Mcg': serializer.toJson<double?>(vitaminB12Mcg),
      'vitaminB6Mg': serializer.toJson<double?>(vitaminB6Mg),
      'vitaminCMg': serializer.toJson<double?>(vitaminCMg),
      'vitaminD2ErgocalciferolMcg':
          serializer.toJson<double?>(vitaminD2ErgocalciferolMcg),
      'vitaminD3CholecalciferolMcg':
          serializer.toJson<double?>(vitaminD3CholecalciferolMcg),
      'vitaminDIuIu': serializer.toJson<double?>(vitaminDIuIu),
      'vitaminDMcg': serializer.toJson<double?>(vitaminDMcg),
      'vitaminEAlphaTocopherolMg':
          serializer.toJson<double?>(vitaminEAlphaTocopherolMg),
      'vitaminKMcg': serializer.toJson<double?>(vitaminKMcg),
      'waterG': serializer.toJson<double?>(waterG),
      'zincZnMg': serializer.toJson<double?>(zincZnMg),
    };
  }

  Food copyWith(
          {Value<String?> barcode = const Value.absent(),
          Value<double?> addedSugarG = const Value.absent(),
          Value<double?> alanineMg = const Value.absent(),
          Value<double?> alcoholG = const Value.absent(),
          Value<double?> arginineMg = const Value.absent(),
          Value<double?> asparticAcidMg = const Value.absent(),
          Value<double?> betaineMg = const Value.absent(),
          Value<String?> bigImage = const Value.absent(),
          Value<double?> biotinB7Mcg = const Value.absent(),
          Value<double?> caffeineMg = const Value.absent(),
          Value<double?> calciumMg = const Value.absent(),
          Value<double?> calories = const Value.absent(),
          Value<double?> carbohydrateG = const Value.absent(),
          Value<double?> caroteneAlphaMcg = const Value.absent(),
          Value<double?> caroteneBetaMcg = const Value.absent(),
          Value<double?> chlorineMg = const Value.absent(),
          Value<double?> cholesterolMg = const Value.absent(),
          Value<double?> cholineMg = const Value.absent(),
          Value<double?> copperCuMg = const Value.absent(),
          Value<DateTime?> created = const Value.absent(),
          Value<double?> cystineMg = const Value.absent(),
          Value<double?> dihydrophylloquinoneMcg = const Value.absent(),
          Value<double?> fatG = const Value.absent(),
          Value<double?> fattyAcidsTotalMonounsaturatedMg =
              const Value.absent(),
          Value<double?> fattyAcidsTotalPolyunsaturatedMg =
              const Value.absent(),
          Value<bool?> favorite = const Value.absent(),
          Value<double?> fiberG = const Value.absent(),
          Value<double?> fluorideFMcg = const Value.absent(),
          Value<double?> folateB9Mcg = const Value.absent(),
          Value<double?> folateDfeMcg = const Value.absent(),
          Value<double?> folicAcidMcg = const Value.absent(),
          Value<double?> foodFolateMcg = const Value.absent(),
          Value<String?> foodGroup = const Value.absent(),
          Value<double?> fructoseG = const Value.absent(),
          Value<double?> galactoseG = const Value.absent(),
          Value<double?> glucoseDextroseG = const Value.absent(),
          Value<double?> glutamicAcidMg = const Value.absent(),
          Value<double?> glycineMg = const Value.absent(),
          Value<double?> histidineMg = const Value.absent(),
          Value<double?> hydroxyprolineMg = const Value.absent(),
          int? id,
          Value<String?> imageFile = const Value.absent(),
          Value<double?> insolubleFiberG = const Value.absent(),
          Value<double?> ironFeMg = const Value.absent(),
          Value<double?> isoleucineMg = const Value.absent(),
          Value<double?> lactoseG = const Value.absent(),
          Value<double?> leucineMg = const Value.absent(),
          Value<double?> luteinZeaxanthinMcg = const Value.absent(),
          Value<double?> lycopeneMcg = const Value.absent(),
          Value<double?> lysineMg = const Value.absent(),
          Value<double?> magnesiumMg = const Value.absent(),
          Value<double?> maltoseG = const Value.absent(),
          Value<double?> manganeseMg = const Value.absent(),
          Value<double?> menaquinone4Mcg = const Value.absent(),
          Value<double?> methionineMg = const Value.absent(),
          Value<double?> molybdenumMcg = const Value.absent(),
          String? name,
          Value<double?> netCarbsG = const Value.absent(),
          Value<double?> niacinB3Mg = const Value.absent(),
          Value<double?> omega3sMg = const Value.absent(),
          Value<double?> omega6sMg = const Value.absent(),
          Value<double?> pantothenicAcidB5Mg = const Value.absent(),
          Value<double?> phenylalanineMg = const Value.absent(),
          Value<double?> phosphorusPMg = const Value.absent(),
          Value<double?> potassiumKMg = const Value.absent(),
          Value<double?> pralScore = const Value.absent(),
          Value<double?> prolineMg = const Value.absent(),
          Value<double?> proteinG = const Value.absent(),
          Value<double?> retinolMcg = const Value.absent(),
          Value<double?> riboflavinB2Mg = const Value.absent(),
          Value<double?> saturatedFatsG = const Value.absent(),
          Value<double?> seleniumSeMcg = const Value.absent(),
          Value<double?> serineMg = const Value.absent(),
          Value<String?> servingDescription1G = const Value.absent(),
          Value<String?> servingDescription2G = const Value.absent(),
          Value<String?> servingDescription3G = const Value.absent(),
          Value<String?> servingDescription4G = const Value.absent(),
          Value<String?> servingDescription5G = const Value.absent(),
          Value<String?> servingDescription6G = const Value.absent(),
          Value<String?> servingDescription7G = const Value.absent(),
          Value<String?> servingDescription8G = const Value.absent(),
          Value<String?> servingDescription9G = const Value.absent(),
          Value<double?> servingSize = const Value.absent(),
          Value<String?> servingUnit = const Value.absent(),
          Value<double?> servingWeight1G = const Value.absent(),
          Value<double?> servingWeight2G = const Value.absent(),
          Value<double?> servingWeight3G = const Value.absent(),
          Value<double?> servingWeight4G = const Value.absent(),
          Value<double?> servingWeight5G = const Value.absent(),
          Value<double?> servingWeight6G = const Value.absent(),
          Value<double?> servingWeight7G = const Value.absent(),
          Value<double?> servingWeight8G = const Value.absent(),
          Value<double?> servingWeight9G = const Value.absent(),
          Value<String?> smallImage = const Value.absent(),
          Value<double?> sodiumMg = const Value.absent(),
          Value<double?> solubleFiberG = const Value.absent(),
          Value<double?> starchG = const Value.absent(),
          Value<double?> sucroseG = const Value.absent(),
          Value<double?> sugarsG = const Value.absent(),
          Value<double?> theobromineMg = const Value.absent(),
          Value<double?> thiaminB1Mg = const Value.absent(),
          Value<double?> threonineMg = const Value.absent(),
          Value<double?> totalSugarAlcoholsG = const Value.absent(),
          Value<double?> transFattyAcidsG = const Value.absent(),
          Value<double?> tryptophanMg = const Value.absent(),
          Value<double?> tyrosineMg = const Value.absent(),
          Value<double?> u183N3CCCAlaMg = const Value.absent(),
          Value<double?> u200calorieWeightG = const Value.absent(),
          Value<double?> u205N3EpaMg = const Value.absent(),
          Value<double?> u225N3DpaMg = const Value.absent(),
          Value<double?> u226N3DhaMg = const Value.absent(),
          Value<double?> valineMg = const Value.absent(),
          Value<double?> vitaminAIuIu = const Value.absent(),
          Value<double?> vitaminARaeMcg = const Value.absent(),
          Value<double?> vitaminB12Mcg = const Value.absent(),
          Value<double?> vitaminB6Mg = const Value.absent(),
          Value<double?> vitaminCMg = const Value.absent(),
          Value<double?> vitaminD2ErgocalciferolMcg = const Value.absent(),
          Value<double?> vitaminD3CholecalciferolMcg = const Value.absent(),
          Value<double?> vitaminDIuIu = const Value.absent(),
          Value<double?> vitaminDMcg = const Value.absent(),
          Value<double?> vitaminEAlphaTocopherolMg = const Value.absent(),
          Value<double?> vitaminKMcg = const Value.absent(),
          Value<double?> waterG = const Value.absent(),
          Value<double?> zincZnMg = const Value.absent()}) =>
      Food(
        barcode: barcode.present ? barcode.value : this.barcode,
        addedSugarG: addedSugarG.present ? addedSugarG.value : this.addedSugarG,
        alanineMg: alanineMg.present ? alanineMg.value : this.alanineMg,
        alcoholG: alcoholG.present ? alcoholG.value : this.alcoholG,
        arginineMg: arginineMg.present ? arginineMg.value : this.arginineMg,
        asparticAcidMg:
            asparticAcidMg.present ? asparticAcidMg.value : this.asparticAcidMg,
        betaineMg: betaineMg.present ? betaineMg.value : this.betaineMg,
        bigImage: bigImage.present ? bigImage.value : this.bigImage,
        biotinB7Mcg: biotinB7Mcg.present ? biotinB7Mcg.value : this.biotinB7Mcg,
        caffeineMg: caffeineMg.present ? caffeineMg.value : this.caffeineMg,
        calciumMg: calciumMg.present ? calciumMg.value : this.calciumMg,
        calories: calories.present ? calories.value : this.calories,
        carbohydrateG:
            carbohydrateG.present ? carbohydrateG.value : this.carbohydrateG,
        caroteneAlphaMcg: caroteneAlphaMcg.present
            ? caroteneAlphaMcg.value
            : this.caroteneAlphaMcg,
        caroteneBetaMcg: caroteneBetaMcg.present
            ? caroteneBetaMcg.value
            : this.caroteneBetaMcg,
        chlorineMg: chlorineMg.present ? chlorineMg.value : this.chlorineMg,
        cholesterolMg:
            cholesterolMg.present ? cholesterolMg.value : this.cholesterolMg,
        cholineMg: cholineMg.present ? cholineMg.value : this.cholineMg,
        copperCuMg: copperCuMg.present ? copperCuMg.value : this.copperCuMg,
        created: created.present ? created.value : this.created,
        cystineMg: cystineMg.present ? cystineMg.value : this.cystineMg,
        dihydrophylloquinoneMcg: dihydrophylloquinoneMcg.present
            ? dihydrophylloquinoneMcg.value
            : this.dihydrophylloquinoneMcg,
        fatG: fatG.present ? fatG.value : this.fatG,
        fattyAcidsTotalMonounsaturatedMg:
            fattyAcidsTotalMonounsaturatedMg.present
                ? fattyAcidsTotalMonounsaturatedMg.value
                : this.fattyAcidsTotalMonounsaturatedMg,
        fattyAcidsTotalPolyunsaturatedMg:
            fattyAcidsTotalPolyunsaturatedMg.present
                ? fattyAcidsTotalPolyunsaturatedMg.value
                : this.fattyAcidsTotalPolyunsaturatedMg,
        favorite: favorite.present ? favorite.value : this.favorite,
        fiberG: fiberG.present ? fiberG.value : this.fiberG,
        fluorideFMcg:
            fluorideFMcg.present ? fluorideFMcg.value : this.fluorideFMcg,
        folateB9Mcg: folateB9Mcg.present ? folateB9Mcg.value : this.folateB9Mcg,
        folateDfeMcg:
            folateDfeMcg.present ? folateDfeMcg.value : this.folateDfeMcg,
        folicAcidMcg:
            folicAcidMcg.present ? folicAcidMcg.value : this.folicAcidMcg,
        foodFolateMcg:
            foodFolateMcg.present ? foodFolateMcg.value : this.foodFolateMcg,
        foodGroup: foodGroup.present ? foodGroup.value : this.foodGroup,
        fructoseG: fructoseG.present ? fructoseG.value : this.fructoseG,
        galactoseG: galactoseG.present ? galactoseG.value : this.galactoseG,
        glucoseDextroseG: glucoseDextroseG.present
            ? glucoseDextroseG.value
            : this.glucoseDextroseG,
        glutamicAcidMg:
            glutamicAcidMg.present ? glutamicAcidMg.value : this.glutamicAcidMg,
        glycineMg: glycineMg.present ? glycineMg.value : this.glycineMg,
        histidineMg: histidineMg.present ? histidineMg.value : this.histidineMg,
        hydroxyprolineMg: hydroxyprolineMg.present
            ? hydroxyprolineMg.value
            : this.hydroxyprolineMg,
        id: id ?? this.id,
        imageFile: imageFile.present ? imageFile.value : this.imageFile,
        insolubleFiberG: insolubleFiberG.present
            ? insolubleFiberG.value
            : this.insolubleFiberG,
        ironFeMg: ironFeMg.present ? ironFeMg.value : this.ironFeMg,
        isoleucineMg:
            isoleucineMg.present ? isoleucineMg.value : this.isoleucineMg,
        lactoseG: lactoseG.present ? lactoseG.value : this.lactoseG,
        leucineMg: leucineMg.present ? leucineMg.value : this.leucineMg,
        luteinZeaxanthinMcg: luteinZeaxanthinMcg.present
            ? luteinZeaxanthinMcg.value
            : this.luteinZeaxanthinMcg,
        lycopeneMcg: lycopeneMcg.present ? lycopeneMcg.value : this.lycopeneMcg,
        lysineMg: lysineMg.present ? lysineMg.value : this.lysineMg,
        magnesiumMg: magnesiumMg.present ? magnesiumMg.value : this.magnesiumMg,
        maltoseG: maltoseG.present ? maltoseG.value : this.maltoseG,
        manganeseMg: manganeseMg.present ? manganeseMg.value : this.manganeseMg,
        menaquinone4Mcg: menaquinone4Mcg.present
            ? menaquinone4Mcg.value
            : this.menaquinone4Mcg,
        methionineMg:
            methionineMg.present ? methionineMg.value : this.methionineMg,
        molybdenumMcg:
            molybdenumMcg.present ? molybdenumMcg.value : this.molybdenumMcg,
        name: name ?? this.name,
        netCarbsG: netCarbsG.present ? netCarbsG.value : this.netCarbsG,
        niacinB3Mg: niacinB3Mg.present ? niacinB3Mg.value : this.niacinB3Mg,
        omega3sMg: omega3sMg.present ? omega3sMg.value : this.omega3sMg,
        omega6sMg: omega6sMg.present ? omega6sMg.value : this.omega6sMg,
        pantothenicAcidB5Mg: pantothenicAcidB5Mg.present
            ? pantothenicAcidB5Mg.value
            : this.pantothenicAcidB5Mg,
        phenylalanineMg: phenylalanineMg.present
            ? phenylalanineMg.value
            : this.phenylalanineMg,
        phosphorusPMg:
            phosphorusPMg.present ? phosphorusPMg.value : this.phosphorusPMg,
        potassiumKMg:
            potassiumKMg.present ? potassiumKMg.value : this.potassiumKMg,
        pralScore: pralScore.present ? pralScore.value : this.pralScore,
        prolineMg: prolineMg.present ? prolineMg.value : this.prolineMg,
        proteinG: proteinG.present ? proteinG.value : this.proteinG,
        retinolMcg: retinolMcg.present ? retinolMcg.value : this.retinolMcg,
        riboflavinB2Mg:
            riboflavinB2Mg.present ? riboflavinB2Mg.value : this.riboflavinB2Mg,
        saturatedFatsG:
            saturatedFatsG.present ? saturatedFatsG.value : this.saturatedFatsG,
        seleniumSeMcg:
            seleniumSeMcg.present ? seleniumSeMcg.value : this.seleniumSeMcg,
        serineMg: serineMg.present ? serineMg.value : this.serineMg,
        servingDescription1G: servingDescription1G.present
            ? servingDescription1G.value
            : this.servingDescription1G,
        servingDescription2G: servingDescription2G.present
            ? servingDescription2G.value
            : this.servingDescription2G,
        servingDescription3G: servingDescription3G.present
            ? servingDescription3G.value
            : this.servingDescription3G,
        servingDescription4G: servingDescription4G.present
            ? servingDescription4G.value
            : this.servingDescription4G,
        servingDescription5G: servingDescription5G.present
            ? servingDescription5G.value
            : this.servingDescription5G,
        servingDescription6G: servingDescription6G.present
            ? servingDescription6G.value
            : this.servingDescription6G,
        servingDescription7G: servingDescription7G.present
            ? servingDescription7G.value
            : this.servingDescription7G,
        servingDescription8G: servingDescription8G.present
            ? servingDescription8G.value
            : this.servingDescription8G,
        servingDescription9G: servingDescription9G.present
            ? servingDescription9G.value
            : this.servingDescription9G,
        servingSize: servingSize.present ? servingSize.value : this.servingSize,
        servingUnit: servingUnit.present ? servingUnit.value : this.servingUnit,
        servingWeight1G: servingWeight1G.present
            ? servingWeight1G.value
            : this.servingWeight1G,
        servingWeight2G: servingWeight2G.present
            ? servingWeight2G.value
            : this.servingWeight2G,
        servingWeight3G: servingWeight3G.present
            ? servingWeight3G.value
            : this.servingWeight3G,
        servingWeight4G: servingWeight4G.present
            ? servingWeight4G.value
            : this.servingWeight4G,
        servingWeight5G: servingWeight5G.present
            ? servingWeight5G.value
            : this.servingWeight5G,
        servingWeight6G: servingWeight6G.present
            ? servingWeight6G.value
            : this.servingWeight6G,
        servingWeight7G: servingWeight7G.present
            ? servingWeight7G.value
            : this.servingWeight7G,
        servingWeight8G: servingWeight8G.present
            ? servingWeight8G.value
            : this.servingWeight8G,
        servingWeight9G: servingWeight9G.present
            ? servingWeight9G.value
            : this.servingWeight9G,
        smallImage: smallImage.present ? smallImage.value : this.smallImage,
        sodiumMg: sodiumMg.present ? sodiumMg.value : this.sodiumMg,
        solubleFiberG:
            solubleFiberG.present ? solubleFiberG.value : this.solubleFiberG,
        starchG: starchG.present ? starchG.value : this.starchG,
        sucroseG: sucroseG.present ? sucroseG.value : this.sucroseG,
        sugarsG: sugarsG.present ? sugarsG.value : this.sugarsG,
        theobromineMg:
            theobromineMg.present ? theobromineMg.value : this.theobromineMg,
        thiaminB1Mg: thiaminB1Mg.present ? thiaminB1Mg.value : this.thiaminB1Mg,
        threonineMg: threonineMg.present ? threonineMg.value : this.threonineMg,
        totalSugarAlcoholsG: totalSugarAlcoholsG.present
            ? totalSugarAlcoholsG.value
            : this.totalSugarAlcoholsG,
        transFattyAcidsG: transFattyAcidsG.present
            ? transFattyAcidsG.value
            : this.transFattyAcidsG,
        tryptophanMg:
            tryptophanMg.present ? tryptophanMg.value : this.tryptophanMg,
        tyrosineMg: tyrosineMg.present ? tyrosineMg.value : this.tyrosineMg,
        u183N3CCCAlaMg:
            u183N3CCCAlaMg.present ? u183N3CCCAlaMg.value : this.u183N3CCCAlaMg,
        u200calorieWeightG: u200calorieWeightG.present
            ? u200calorieWeightG.value
            : this.u200calorieWeightG,
        u205N3EpaMg: u205N3EpaMg.present ? u205N3EpaMg.value : this.u205N3EpaMg,
        u225N3DpaMg: u225N3DpaMg.present ? u225N3DpaMg.value : this.u225N3DpaMg,
        u226N3DhaMg: u226N3DhaMg.present ? u226N3DhaMg.value : this.u226N3DhaMg,
        valineMg: valineMg.present ? valineMg.value : this.valineMg,
        vitaminAIuIu:
            vitaminAIuIu.present ? vitaminAIuIu.value : this.vitaminAIuIu,
        vitaminARaeMcg:
            vitaminARaeMcg.present ? vitaminARaeMcg.value : this.vitaminARaeMcg,
        vitaminB12Mcg:
            vitaminB12Mcg.present ? vitaminB12Mcg.value : this.vitaminB12Mcg,
        vitaminB6Mg: vitaminB6Mg.present ? vitaminB6Mg.value : this.vitaminB6Mg,
        vitaminCMg: vitaminCMg.present ? vitaminCMg.value : this.vitaminCMg,
        vitaminD2ErgocalciferolMcg: vitaminD2ErgocalciferolMcg.present
            ? vitaminD2ErgocalciferolMcg.value
            : this.vitaminD2ErgocalciferolMcg,
        vitaminD3CholecalciferolMcg: vitaminD3CholecalciferolMcg.present
            ? vitaminD3CholecalciferolMcg.value
            : this.vitaminD3CholecalciferolMcg,
        vitaminDIuIu:
            vitaminDIuIu.present ? vitaminDIuIu.value : this.vitaminDIuIu,
        vitaminDMcg: vitaminDMcg.present ? vitaminDMcg.value : this.vitaminDMcg,
        vitaminEAlphaTocopherolMg: vitaminEAlphaTocopherolMg.present
            ? vitaminEAlphaTocopherolMg.value
            : this.vitaminEAlphaTocopherolMg,
        vitaminKMcg: vitaminKMcg.present ? vitaminKMcg.value : this.vitaminKMcg,
        waterG: waterG.present ? waterG.value : this.waterG,
        zincZnMg: zincZnMg.present ? zincZnMg.value : this.zincZnMg,
      );
  Food copyWithCompanion(FoodsCompanion data) {
    return Food(
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      addedSugarG:
          data.addedSugarG.present ? data.addedSugarG.value : this.addedSugarG,
      alanineMg: data.alanineMg.present ? data.alanineMg.value : this.alanineMg,
      alcoholG: data.alcoholG.present ? data.alcoholG.value : this.alcoholG,
      arginineMg:
          data.arginineMg.present ? data.arginineMg.value : this.arginineMg,
      asparticAcidMg: data.asparticAcidMg.present
          ? data.asparticAcidMg.value
          : this.asparticAcidMg,
      betaineMg: data.betaineMg.present ? data.betaineMg.value : this.betaineMg,
      bigImage: data.bigImage.present ? data.bigImage.value : this.bigImage,
      biotinB7Mcg:
          data.biotinB7Mcg.present ? data.biotinB7Mcg.value : this.biotinB7Mcg,
      caffeineMg:
          data.caffeineMg.present ? data.caffeineMg.value : this.caffeineMg,
      calciumMg: data.calciumMg.present ? data.calciumMg.value : this.calciumMg,
      calories: data.calories.present ? data.calories.value : this.calories,
      carbohydrateG: data.carbohydrateG.present
          ? data.carbohydrateG.value
          : this.carbohydrateG,
      caroteneAlphaMcg: data.caroteneAlphaMcg.present
          ? data.caroteneAlphaMcg.value
          : this.caroteneAlphaMcg,
      caroteneBetaMcg: data.caroteneBetaMcg.present
          ? data.caroteneBetaMcg.value
          : this.caroteneBetaMcg,
      chlorineMg:
          data.chlorineMg.present ? data.chlorineMg.value : this.chlorineMg,
      cholesterolMg: data.cholesterolMg.present
          ? data.cholesterolMg.value
          : this.cholesterolMg,
      cholineMg: data.cholineMg.present ? data.cholineMg.value : this.cholineMg,
      copperCuMg:
          data.copperCuMg.present ? data.copperCuMg.value : this.copperCuMg,
      created: data.created.present ? data.created.value : this.created,
      cystineMg: data.cystineMg.present ? data.cystineMg.value : this.cystineMg,
      dihydrophylloquinoneMcg: data.dihydrophylloquinoneMcg.present
          ? data.dihydrophylloquinoneMcg.value
          : this.dihydrophylloquinoneMcg,
      fatG: data.fatG.present ? data.fatG.value : this.fatG,
      fattyAcidsTotalMonounsaturatedMg:
          data.fattyAcidsTotalMonounsaturatedMg.present
              ? data.fattyAcidsTotalMonounsaturatedMg.value
              : this.fattyAcidsTotalMonounsaturatedMg,
      fattyAcidsTotalPolyunsaturatedMg:
          data.fattyAcidsTotalPolyunsaturatedMg.present
              ? data.fattyAcidsTotalPolyunsaturatedMg.value
              : this.fattyAcidsTotalPolyunsaturatedMg,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      fiberG: data.fiberG.present ? data.fiberG.value : this.fiberG,
      fluorideFMcg: data.fluorideFMcg.present
          ? data.fluorideFMcg.value
          : this.fluorideFMcg,
      folateB9Mcg:
          data.folateB9Mcg.present ? data.folateB9Mcg.value : this.folateB9Mcg,
      folateDfeMcg: data.folateDfeMcg.present
          ? data.folateDfeMcg.value
          : this.folateDfeMcg,
      folicAcidMcg: data.folicAcidMcg.present
          ? data.folicAcidMcg.value
          : this.folicAcidMcg,
      foodFolateMcg: data.foodFolateMcg.present
          ? data.foodFolateMcg.value
          : this.foodFolateMcg,
      foodGroup: data.foodGroup.present ? data.foodGroup.value : this.foodGroup,
      fructoseG: data.fructoseG.present ? data.fructoseG.value : this.fructoseG,
      galactoseG:
          data.galactoseG.present ? data.galactoseG.value : this.galactoseG,
      glucoseDextroseG: data.glucoseDextroseG.present
          ? data.glucoseDextroseG.value
          : this.glucoseDextroseG,
      glutamicAcidMg: data.glutamicAcidMg.present
          ? data.glutamicAcidMg.value
          : this.glutamicAcidMg,
      glycineMg: data.glycineMg.present ? data.glycineMg.value : this.glycineMg,
      histidineMg:
          data.histidineMg.present ? data.histidineMg.value : this.histidineMg,
      hydroxyprolineMg: data.hydroxyprolineMg.present
          ? data.hydroxyprolineMg.value
          : this.hydroxyprolineMg,
      id: data.id.present ? data.id.value : this.id,
      imageFile: data.imageFile.present ? data.imageFile.value : this.imageFile,
      insolubleFiberG: data.insolubleFiberG.present
          ? data.insolubleFiberG.value
          : this.insolubleFiberG,
      ironFeMg: data.ironFeMg.present ? data.ironFeMg.value : this.ironFeMg,
      isoleucineMg: data.isoleucineMg.present
          ? data.isoleucineMg.value
          : this.isoleucineMg,
      lactoseG: data.lactoseG.present ? data.lactoseG.value : this.lactoseG,
      leucineMg: data.leucineMg.present ? data.leucineMg.value : this.leucineMg,
      luteinZeaxanthinMcg: data.luteinZeaxanthinMcg.present
          ? data.luteinZeaxanthinMcg.value
          : this.luteinZeaxanthinMcg,
      lycopeneMcg:
          data.lycopeneMcg.present ? data.lycopeneMcg.value : this.lycopeneMcg,
      lysineMg: data.lysineMg.present ? data.lysineMg.value : this.lysineMg,
      magnesiumMg:
          data.magnesiumMg.present ? data.magnesiumMg.value : this.magnesiumMg,
      maltoseG: data.maltoseG.present ? data.maltoseG.value : this.maltoseG,
      manganeseMg:
          data.manganeseMg.present ? data.manganeseMg.value : this.manganeseMg,
      menaquinone4Mcg: data.menaquinone4Mcg.present
          ? data.menaquinone4Mcg.value
          : this.menaquinone4Mcg,
      methionineMg: data.methionineMg.present
          ? data.methionineMg.value
          : this.methionineMg,
      molybdenumMcg: data.molybdenumMcg.present
          ? data.molybdenumMcg.value
          : this.molybdenumMcg,
      name: data.name.present ? data.name.value : this.name,
      netCarbsG: data.netCarbsG.present ? data.netCarbsG.value : this.netCarbsG,
      niacinB3Mg:
          data.niacinB3Mg.present ? data.niacinB3Mg.value : this.niacinB3Mg,
      omega3sMg: data.omega3sMg.present ? data.omega3sMg.value : this.omega3sMg,
      omega6sMg: data.omega6sMg.present ? data.omega6sMg.value : this.omega6sMg,
      pantothenicAcidB5Mg: data.pantothenicAcidB5Mg.present
          ? data.pantothenicAcidB5Mg.value
          : this.pantothenicAcidB5Mg,
      phenylalanineMg: data.phenylalanineMg.present
          ? data.phenylalanineMg.value
          : this.phenylalanineMg,
      phosphorusPMg: data.phosphorusPMg.present
          ? data.phosphorusPMg.value
          : this.phosphorusPMg,
      potassiumKMg: data.potassiumKMg.present
          ? data.potassiumKMg.value
          : this.potassiumKMg,
      pralScore: data.pralScore.present ? data.pralScore.value : this.pralScore,
      prolineMg: data.prolineMg.present ? data.prolineMg.value : this.prolineMg,
      proteinG: data.proteinG.present ? data.proteinG.value : this.proteinG,
      retinolMcg:
          data.retinolMcg.present ? data.retinolMcg.value : this.retinolMcg,
      riboflavinB2Mg: data.riboflavinB2Mg.present
          ? data.riboflavinB2Mg.value
          : this.riboflavinB2Mg,
      saturatedFatsG: data.saturatedFatsG.present
          ? data.saturatedFatsG.value
          : this.saturatedFatsG,
      seleniumSeMcg: data.seleniumSeMcg.present
          ? data.seleniumSeMcg.value
          : this.seleniumSeMcg,
      serineMg: data.serineMg.present ? data.serineMg.value : this.serineMg,
      servingDescription1G: data.servingDescription1G.present
          ? data.servingDescription1G.value
          : this.servingDescription1G,
      servingDescription2G: data.servingDescription2G.present
          ? data.servingDescription2G.value
          : this.servingDescription2G,
      servingDescription3G: data.servingDescription3G.present
          ? data.servingDescription3G.value
          : this.servingDescription3G,
      servingDescription4G: data.servingDescription4G.present
          ? data.servingDescription4G.value
          : this.servingDescription4G,
      servingDescription5G: data.servingDescription5G.present
          ? data.servingDescription5G.value
          : this.servingDescription5G,
      servingDescription6G: data.servingDescription6G.present
          ? data.servingDescription6G.value
          : this.servingDescription6G,
      servingDescription7G: data.servingDescription7G.present
          ? data.servingDescription7G.value
          : this.servingDescription7G,
      servingDescription8G: data.servingDescription8G.present
          ? data.servingDescription8G.value
          : this.servingDescription8G,
      servingDescription9G: data.servingDescription9G.present
          ? data.servingDescription9G.value
          : this.servingDescription9G,
      servingSize:
          data.servingSize.present ? data.servingSize.value : this.servingSize,
      servingUnit:
          data.servingUnit.present ? data.servingUnit.value : this.servingUnit,
      servingWeight1G: data.servingWeight1G.present
          ? data.servingWeight1G.value
          : this.servingWeight1G,
      servingWeight2G: data.servingWeight2G.present
          ? data.servingWeight2G.value
          : this.servingWeight2G,
      servingWeight3G: data.servingWeight3G.present
          ? data.servingWeight3G.value
          : this.servingWeight3G,
      servingWeight4G: data.servingWeight4G.present
          ? data.servingWeight4G.value
          : this.servingWeight4G,
      servingWeight5G: data.servingWeight5G.present
          ? data.servingWeight5G.value
          : this.servingWeight5G,
      servingWeight6G: data.servingWeight6G.present
          ? data.servingWeight6G.value
          : this.servingWeight6G,
      servingWeight7G: data.servingWeight7G.present
          ? data.servingWeight7G.value
          : this.servingWeight7G,
      servingWeight8G: data.servingWeight8G.present
          ? data.servingWeight8G.value
          : this.servingWeight8G,
      servingWeight9G: data.servingWeight9G.present
          ? data.servingWeight9G.value
          : this.servingWeight9G,
      smallImage:
          data.smallImage.present ? data.smallImage.value : this.smallImage,
      sodiumMg: data.sodiumMg.present ? data.sodiumMg.value : this.sodiumMg,
      solubleFiberG: data.solubleFiberG.present
          ? data.solubleFiberG.value
          : this.solubleFiberG,
      starchG: data.starchG.present ? data.starchG.value : this.starchG,
      sucroseG: data.sucroseG.present ? data.sucroseG.value : this.sucroseG,
      sugarsG: data.sugarsG.present ? data.sugarsG.value : this.sugarsG,
      theobromineMg: data.theobromineMg.present
          ? data.theobromineMg.value
          : this.theobromineMg,
      thiaminB1Mg:
          data.thiaminB1Mg.present ? data.thiaminB1Mg.value : this.thiaminB1Mg,
      threonineMg:
          data.threonineMg.present ? data.threonineMg.value : this.threonineMg,
      totalSugarAlcoholsG: data.totalSugarAlcoholsG.present
          ? data.totalSugarAlcoholsG.value
          : this.totalSugarAlcoholsG,
      transFattyAcidsG: data.transFattyAcidsG.present
          ? data.transFattyAcidsG.value
          : this.transFattyAcidsG,
      tryptophanMg: data.tryptophanMg.present
          ? data.tryptophanMg.value
          : this.tryptophanMg,
      tyrosineMg:
          data.tyrosineMg.present ? data.tyrosineMg.value : this.tyrosineMg,
      u183N3CCCAlaMg: data.u183N3CCCAlaMg.present
          ? data.u183N3CCCAlaMg.value
          : this.u183N3CCCAlaMg,
      u200calorieWeightG: data.u200calorieWeightG.present
          ? data.u200calorieWeightG.value
          : this.u200calorieWeightG,
      u205N3EpaMg:
          data.u205N3EpaMg.present ? data.u205N3EpaMg.value : this.u205N3EpaMg,
      u225N3DpaMg:
          data.u225N3DpaMg.present ? data.u225N3DpaMg.value : this.u225N3DpaMg,
      u226N3DhaMg:
          data.u226N3DhaMg.present ? data.u226N3DhaMg.value : this.u226N3DhaMg,
      valineMg: data.valineMg.present ? data.valineMg.value : this.valineMg,
      vitaminAIuIu: data.vitaminAIuIu.present
          ? data.vitaminAIuIu.value
          : this.vitaminAIuIu,
      vitaminARaeMcg: data.vitaminARaeMcg.present
          ? data.vitaminARaeMcg.value
          : this.vitaminARaeMcg,
      vitaminB12Mcg: data.vitaminB12Mcg.present
          ? data.vitaminB12Mcg.value
          : this.vitaminB12Mcg,
      vitaminB6Mg:
          data.vitaminB6Mg.present ? data.vitaminB6Mg.value : this.vitaminB6Mg,
      vitaminCMg:
          data.vitaminCMg.present ? data.vitaminCMg.value : this.vitaminCMg,
      vitaminD2ErgocalciferolMcg: data.vitaminD2ErgocalciferolMcg.present
          ? data.vitaminD2ErgocalciferolMcg.value
          : this.vitaminD2ErgocalciferolMcg,
      vitaminD3CholecalciferolMcg: data.vitaminD3CholecalciferolMcg.present
          ? data.vitaminD3CholecalciferolMcg.value
          : this.vitaminD3CholecalciferolMcg,
      vitaminDIuIu: data.vitaminDIuIu.present
          ? data.vitaminDIuIu.value
          : this.vitaminDIuIu,
      vitaminDMcg:
          data.vitaminDMcg.present ? data.vitaminDMcg.value : this.vitaminDMcg,
      vitaminEAlphaTocopherolMg: data.vitaminEAlphaTocopherolMg.present
          ? data.vitaminEAlphaTocopherolMg.value
          : this.vitaminEAlphaTocopherolMg,
      vitaminKMcg:
          data.vitaminKMcg.present ? data.vitaminKMcg.value : this.vitaminKMcg,
      waterG: data.waterG.present ? data.waterG.value : this.waterG,
      zincZnMg: data.zincZnMg.present ? data.zincZnMg.value : this.zincZnMg,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('barcode: $barcode, ')
          ..write('addedSugarG: $addedSugarG, ')
          ..write('alanineMg: $alanineMg, ')
          ..write('alcoholG: $alcoholG, ')
          ..write('arginineMg: $arginineMg, ')
          ..write('asparticAcidMg: $asparticAcidMg, ')
          ..write('betaineMg: $betaineMg, ')
          ..write('bigImage: $bigImage, ')
          ..write('biotinB7Mcg: $biotinB7Mcg, ')
          ..write('caffeineMg: $caffeineMg, ')
          ..write('calciumMg: $calciumMg, ')
          ..write('calories: $calories, ')
          ..write('carbohydrateG: $carbohydrateG, ')
          ..write('caroteneAlphaMcg: $caroteneAlphaMcg, ')
          ..write('caroteneBetaMcg: $caroteneBetaMcg, ')
          ..write('chlorineMg: $chlorineMg, ')
          ..write('cholesterolMg: $cholesterolMg, ')
          ..write('cholineMg: $cholineMg, ')
          ..write('copperCuMg: $copperCuMg, ')
          ..write('created: $created, ')
          ..write('cystineMg: $cystineMg, ')
          ..write('dihydrophylloquinoneMcg: $dihydrophylloquinoneMcg, ')
          ..write('fatG: $fatG, ')
          ..write(
              'fattyAcidsTotalMonounsaturatedMg: $fattyAcidsTotalMonounsaturatedMg, ')
          ..write(
              'fattyAcidsTotalPolyunsaturatedMg: $fattyAcidsTotalPolyunsaturatedMg, ')
          ..write('favorite: $favorite, ')
          ..write('fiberG: $fiberG, ')
          ..write('fluorideFMcg: $fluorideFMcg, ')
          ..write('folateB9Mcg: $folateB9Mcg, ')
          ..write('folateDfeMcg: $folateDfeMcg, ')
          ..write('folicAcidMcg: $folicAcidMcg, ')
          ..write('foodFolateMcg: $foodFolateMcg, ')
          ..write('foodGroup: $foodGroup, ')
          ..write('fructoseG: $fructoseG, ')
          ..write('galactoseG: $galactoseG, ')
          ..write('glucoseDextroseG: $glucoseDextroseG, ')
          ..write('glutamicAcidMg: $glutamicAcidMg, ')
          ..write('glycineMg: $glycineMg, ')
          ..write('histidineMg: $histidineMg, ')
          ..write('hydroxyprolineMg: $hydroxyprolineMg, ')
          ..write('id: $id, ')
          ..write('imageFile: $imageFile, ')
          ..write('insolubleFiberG: $insolubleFiberG, ')
          ..write('ironFeMg: $ironFeMg, ')
          ..write('isoleucineMg: $isoleucineMg, ')
          ..write('lactoseG: $lactoseG, ')
          ..write('leucineMg: $leucineMg, ')
          ..write('luteinZeaxanthinMcg: $luteinZeaxanthinMcg, ')
          ..write('lycopeneMcg: $lycopeneMcg, ')
          ..write('lysineMg: $lysineMg, ')
          ..write('magnesiumMg: $magnesiumMg, ')
          ..write('maltoseG: $maltoseG, ')
          ..write('manganeseMg: $manganeseMg, ')
          ..write('menaquinone4Mcg: $menaquinone4Mcg, ')
          ..write('methionineMg: $methionineMg, ')
          ..write('molybdenumMcg: $molybdenumMcg, ')
          ..write('name: $name, ')
          ..write('netCarbsG: $netCarbsG, ')
          ..write('niacinB3Mg: $niacinB3Mg, ')
          ..write('omega3sMg: $omega3sMg, ')
          ..write('omega6sMg: $omega6sMg, ')
          ..write('pantothenicAcidB5Mg: $pantothenicAcidB5Mg, ')
          ..write('phenylalanineMg: $phenylalanineMg, ')
          ..write('phosphorusPMg: $phosphorusPMg, ')
          ..write('potassiumKMg: $potassiumKMg, ')
          ..write('pralScore: $pralScore, ')
          ..write('prolineMg: $prolineMg, ')
          ..write('proteinG: $proteinG, ')
          ..write('retinolMcg: $retinolMcg, ')
          ..write('riboflavinB2Mg: $riboflavinB2Mg, ')
          ..write('saturatedFatsG: $saturatedFatsG, ')
          ..write('seleniumSeMcg: $seleniumSeMcg, ')
          ..write('serineMg: $serineMg, ')
          ..write('servingDescription1G: $servingDescription1G, ')
          ..write('servingDescription2G: $servingDescription2G, ')
          ..write('servingDescription3G: $servingDescription3G, ')
          ..write('servingDescription4G: $servingDescription4G, ')
          ..write('servingDescription5G: $servingDescription5G, ')
          ..write('servingDescription6G: $servingDescription6G, ')
          ..write('servingDescription7G: $servingDescription7G, ')
          ..write('servingDescription8G: $servingDescription8G, ')
          ..write('servingDescription9G: $servingDescription9G, ')
          ..write('servingSize: $servingSize, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('servingWeight1G: $servingWeight1G, ')
          ..write('servingWeight2G: $servingWeight2G, ')
          ..write('servingWeight3G: $servingWeight3G, ')
          ..write('servingWeight4G: $servingWeight4G, ')
          ..write('servingWeight5G: $servingWeight5G, ')
          ..write('servingWeight6G: $servingWeight6G, ')
          ..write('servingWeight7G: $servingWeight7G, ')
          ..write('servingWeight8G: $servingWeight8G, ')
          ..write('servingWeight9G: $servingWeight9G, ')
          ..write('smallImage: $smallImage, ')
          ..write('sodiumMg: $sodiumMg, ')
          ..write('solubleFiberG: $solubleFiberG, ')
          ..write('starchG: $starchG, ')
          ..write('sucroseG: $sucroseG, ')
          ..write('sugarsG: $sugarsG, ')
          ..write('theobromineMg: $theobromineMg, ')
          ..write('thiaminB1Mg: $thiaminB1Mg, ')
          ..write('threonineMg: $threonineMg, ')
          ..write('totalSugarAlcoholsG: $totalSugarAlcoholsG, ')
          ..write('transFattyAcidsG: $transFattyAcidsG, ')
          ..write('tryptophanMg: $tryptophanMg, ')
          ..write('tyrosineMg: $tyrosineMg, ')
          ..write('u183N3CCCAlaMg: $u183N3CCCAlaMg, ')
          ..write('u200calorieWeightG: $u200calorieWeightG, ')
          ..write('u205N3EpaMg: $u205N3EpaMg, ')
          ..write('u225N3DpaMg: $u225N3DpaMg, ')
          ..write('u226N3DhaMg: $u226N3DhaMg, ')
          ..write('valineMg: $valineMg, ')
          ..write('vitaminAIuIu: $vitaminAIuIu, ')
          ..write('vitaminARaeMcg: $vitaminARaeMcg, ')
          ..write('vitaminB12Mcg: $vitaminB12Mcg, ')
          ..write('vitaminB6Mg: $vitaminB6Mg, ')
          ..write('vitaminCMg: $vitaminCMg, ')
          ..write('vitaminD2ErgocalciferolMcg: $vitaminD2ErgocalciferolMcg, ')
          ..write('vitaminD3CholecalciferolMcg: $vitaminD3CholecalciferolMcg, ')
          ..write('vitaminDIuIu: $vitaminDIuIu, ')
          ..write('vitaminDMcg: $vitaminDMcg, ')
          ..write('vitaminEAlphaTocopherolMg: $vitaminEAlphaTocopherolMg, ')
          ..write('vitaminKMcg: $vitaminKMcg, ')
          ..write('waterG: $waterG, ')
          ..write('zincZnMg: $zincZnMg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        barcode,
        addedSugarG,
        alanineMg,
        alcoholG,
        arginineMg,
        asparticAcidMg,
        betaineMg,
        bigImage,
        biotinB7Mcg,
        caffeineMg,
        calciumMg,
        calories,
        carbohydrateG,
        caroteneAlphaMcg,
        caroteneBetaMcg,
        chlorineMg,
        cholesterolMg,
        cholineMg,
        copperCuMg,
        created,
        cystineMg,
        dihydrophylloquinoneMcg,
        fatG,
        fattyAcidsTotalMonounsaturatedMg,
        fattyAcidsTotalPolyunsaturatedMg,
        favorite,
        fiberG,
        fluorideFMcg,
        folateB9Mcg,
        folateDfeMcg,
        folicAcidMcg,
        foodFolateMcg,
        foodGroup,
        fructoseG,
        galactoseG,
        glucoseDextroseG,
        glutamicAcidMg,
        glycineMg,
        histidineMg,
        hydroxyprolineMg,
        id,
        imageFile,
        insolubleFiberG,
        ironFeMg,
        isoleucineMg,
        lactoseG,
        leucineMg,
        luteinZeaxanthinMcg,
        lycopeneMcg,
        lysineMg,
        magnesiumMg,
        maltoseG,
        manganeseMg,
        menaquinone4Mcg,
        methionineMg,
        molybdenumMcg,
        name,
        netCarbsG,
        niacinB3Mg,
        omega3sMg,
        omega6sMg,
        pantothenicAcidB5Mg,
        phenylalanineMg,
        phosphorusPMg,
        potassiumKMg,
        pralScore,
        prolineMg,
        proteinG,
        retinolMcg,
        riboflavinB2Mg,
        saturatedFatsG,
        seleniumSeMcg,
        serineMg,
        servingDescription1G,
        servingDescription2G,
        servingDescription3G,
        servingDescription4G,
        servingDescription5G,
        servingDescription6G,
        servingDescription7G,
        servingDescription8G,
        servingDescription9G,
        servingSize,
        servingUnit,
        servingWeight1G,
        servingWeight2G,
        servingWeight3G,
        servingWeight4G,
        servingWeight5G,
        servingWeight6G,
        servingWeight7G,
        servingWeight8G,
        servingWeight9G,
        smallImage,
        sodiumMg,
        solubleFiberG,
        starchG,
        sucroseG,
        sugarsG,
        theobromineMg,
        thiaminB1Mg,
        threonineMg,
        totalSugarAlcoholsG,
        transFattyAcidsG,
        tryptophanMg,
        tyrosineMg,
        u183N3CCCAlaMg,
        u200calorieWeightG,
        u205N3EpaMg,
        u225N3DpaMg,
        u226N3DhaMg,
        valineMg,
        vitaminAIuIu,
        vitaminARaeMcg,
        vitaminB12Mcg,
        vitaminB6Mg,
        vitaminCMg,
        vitaminD2ErgocalciferolMcg,
        vitaminD3CholecalciferolMcg,
        vitaminDIuIu,
        vitaminDMcg,
        vitaminEAlphaTocopherolMg,
        vitaminKMcg,
        waterG,
        zincZnMg
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Food &&
          other.barcode == this.barcode &&
          other.addedSugarG == this.addedSugarG &&
          other.alanineMg == this.alanineMg &&
          other.alcoholG == this.alcoholG &&
          other.arginineMg == this.arginineMg &&
          other.asparticAcidMg == this.asparticAcidMg &&
          other.betaineMg == this.betaineMg &&
          other.bigImage == this.bigImage &&
          other.biotinB7Mcg == this.biotinB7Mcg &&
          other.caffeineMg == this.caffeineMg &&
          other.calciumMg == this.calciumMg &&
          other.calories == this.calories &&
          other.carbohydrateG == this.carbohydrateG &&
          other.caroteneAlphaMcg == this.caroteneAlphaMcg &&
          other.caroteneBetaMcg == this.caroteneBetaMcg &&
          other.chlorineMg == this.chlorineMg &&
          other.cholesterolMg == this.cholesterolMg &&
          other.cholineMg == this.cholineMg &&
          other.copperCuMg == this.copperCuMg &&
          other.created == this.created &&
          other.cystineMg == this.cystineMg &&
          other.dihydrophylloquinoneMcg == this.dihydrophylloquinoneMcg &&
          other.fatG == this.fatG &&
          other.fattyAcidsTotalMonounsaturatedMg ==
              this.fattyAcidsTotalMonounsaturatedMg &&
          other.fattyAcidsTotalPolyunsaturatedMg ==
              this.fattyAcidsTotalPolyunsaturatedMg &&
          other.favorite == this.favorite &&
          other.fiberG == this.fiberG &&
          other.fluorideFMcg == this.fluorideFMcg &&
          other.folateB9Mcg == this.folateB9Mcg &&
          other.folateDfeMcg == this.folateDfeMcg &&
          other.folicAcidMcg == this.folicAcidMcg &&
          other.foodFolateMcg == this.foodFolateMcg &&
          other.foodGroup == this.foodGroup &&
          other.fructoseG == this.fructoseG &&
          other.galactoseG == this.galactoseG &&
          other.glucoseDextroseG == this.glucoseDextroseG &&
          other.glutamicAcidMg == this.glutamicAcidMg &&
          other.glycineMg == this.glycineMg &&
          other.histidineMg == this.histidineMg &&
          other.hydroxyprolineMg == this.hydroxyprolineMg &&
          other.id == this.id &&
          other.imageFile == this.imageFile &&
          other.insolubleFiberG == this.insolubleFiberG &&
          other.ironFeMg == this.ironFeMg &&
          other.isoleucineMg == this.isoleucineMg &&
          other.lactoseG == this.lactoseG &&
          other.leucineMg == this.leucineMg &&
          other.luteinZeaxanthinMcg == this.luteinZeaxanthinMcg &&
          other.lycopeneMcg == this.lycopeneMcg &&
          other.lysineMg == this.lysineMg &&
          other.magnesiumMg == this.magnesiumMg &&
          other.maltoseG == this.maltoseG &&
          other.manganeseMg == this.manganeseMg &&
          other.menaquinone4Mcg == this.menaquinone4Mcg &&
          other.methionineMg == this.methionineMg &&
          other.molybdenumMcg == this.molybdenumMcg &&
          other.name == this.name &&
          other.netCarbsG == this.netCarbsG &&
          other.niacinB3Mg == this.niacinB3Mg &&
          other.omega3sMg == this.omega3sMg &&
          other.omega6sMg == this.omega6sMg &&
          other.pantothenicAcidB5Mg == this.pantothenicAcidB5Mg &&
          other.phenylalanineMg == this.phenylalanineMg &&
          other.phosphorusPMg == this.phosphorusPMg &&
          other.potassiumKMg == this.potassiumKMg &&
          other.pralScore == this.pralScore &&
          other.prolineMg == this.prolineMg &&
          other.proteinG == this.proteinG &&
          other.retinolMcg == this.retinolMcg &&
          other.riboflavinB2Mg == this.riboflavinB2Mg &&
          other.saturatedFatsG == this.saturatedFatsG &&
          other.seleniumSeMcg == this.seleniumSeMcg &&
          other.serineMg == this.serineMg &&
          other.servingDescription1G == this.servingDescription1G &&
          other.servingDescription2G == this.servingDescription2G &&
          other.servingDescription3G == this.servingDescription3G &&
          other.servingDescription4G == this.servingDescription4G &&
          other.servingDescription5G == this.servingDescription5G &&
          other.servingDescription6G == this.servingDescription6G &&
          other.servingDescription7G == this.servingDescription7G &&
          other.servingDescription8G == this.servingDescription8G &&
          other.servingDescription9G == this.servingDescription9G &&
          other.servingSize == this.servingSize &&
          other.servingUnit == this.servingUnit &&
          other.servingWeight1G == this.servingWeight1G &&
          other.servingWeight2G == this.servingWeight2G &&
          other.servingWeight3G == this.servingWeight3G &&
          other.servingWeight4G == this.servingWeight4G &&
          other.servingWeight5G == this.servingWeight5G &&
          other.servingWeight6G == this.servingWeight6G &&
          other.servingWeight7G == this.servingWeight7G &&
          other.servingWeight8G == this.servingWeight8G &&
          other.servingWeight9G == this.servingWeight9G &&
          other.smallImage == this.smallImage &&
          other.sodiumMg == this.sodiumMg &&
          other.solubleFiberG == this.solubleFiberG &&
          other.starchG == this.starchG &&
          other.sucroseG == this.sucroseG &&
          other.sugarsG == this.sugarsG &&
          other.theobromineMg == this.theobromineMg &&
          other.thiaminB1Mg == this.thiaminB1Mg &&
          other.threonineMg == this.threonineMg &&
          other.totalSugarAlcoholsG == this.totalSugarAlcoholsG &&
          other.transFattyAcidsG == this.transFattyAcidsG &&
          other.tryptophanMg == this.tryptophanMg &&
          other.tyrosineMg == this.tyrosineMg &&
          other.u183N3CCCAlaMg == this.u183N3CCCAlaMg &&
          other.u200calorieWeightG == this.u200calorieWeightG &&
          other.u205N3EpaMg == this.u205N3EpaMg &&
          other.u225N3DpaMg == this.u225N3DpaMg &&
          other.u226N3DhaMg == this.u226N3DhaMg &&
          other.valineMg == this.valineMg &&
          other.vitaminAIuIu == this.vitaminAIuIu &&
          other.vitaminARaeMcg == this.vitaminARaeMcg &&
          other.vitaminB12Mcg == this.vitaminB12Mcg &&
          other.vitaminB6Mg == this.vitaminB6Mg &&
          other.vitaminCMg == this.vitaminCMg &&
          other.vitaminD2ErgocalciferolMcg == this.vitaminD2ErgocalciferolMcg &&
          other.vitaminD3CholecalciferolMcg ==
              this.vitaminD3CholecalciferolMcg &&
          other.vitaminDIuIu == this.vitaminDIuIu &&
          other.vitaminDMcg == this.vitaminDMcg &&
          other.vitaminEAlphaTocopherolMg == this.vitaminEAlphaTocopherolMg &&
          other.vitaminKMcg == this.vitaminKMcg &&
          other.waterG == this.waterG &&
          other.zincZnMg == this.zincZnMg);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<String?> barcode;
  final Value<double?> addedSugarG;
  final Value<double?> alanineMg;
  final Value<double?> alcoholG;
  final Value<double?> arginineMg;
  final Value<double?> asparticAcidMg;
  final Value<double?> betaineMg;
  final Value<String?> bigImage;
  final Value<double?> biotinB7Mcg;
  final Value<double?> caffeineMg;
  final Value<double?> calciumMg;
  final Value<double?> calories;
  final Value<double?> carbohydrateG;
  final Value<double?> caroteneAlphaMcg;
  final Value<double?> caroteneBetaMcg;
  final Value<double?> chlorineMg;
  final Value<double?> cholesterolMg;
  final Value<double?> cholineMg;
  final Value<double?> copperCuMg;
  final Value<DateTime?> created;
  final Value<double?> cystineMg;
  final Value<double?> dihydrophylloquinoneMcg;
  final Value<double?> fatG;
  final Value<double?> fattyAcidsTotalMonounsaturatedMg;
  final Value<double?> fattyAcidsTotalPolyunsaturatedMg;
  final Value<bool?> favorite;
  final Value<double?> fiberG;
  final Value<double?> fluorideFMcg;
  final Value<double?> folateB9Mcg;
  final Value<double?> folateDfeMcg;
  final Value<double?> folicAcidMcg;
  final Value<double?> foodFolateMcg;
  final Value<String?> foodGroup;
  final Value<double?> fructoseG;
  final Value<double?> galactoseG;
  final Value<double?> glucoseDextroseG;
  final Value<double?> glutamicAcidMg;
  final Value<double?> glycineMg;
  final Value<double?> histidineMg;
  final Value<double?> hydroxyprolineMg;
  final Value<int> id;
  final Value<String?> imageFile;
  final Value<double?> insolubleFiberG;
  final Value<double?> ironFeMg;
  final Value<double?> isoleucineMg;
  final Value<double?> lactoseG;
  final Value<double?> leucineMg;
  final Value<double?> luteinZeaxanthinMcg;
  final Value<double?> lycopeneMcg;
  final Value<double?> lysineMg;
  final Value<double?> magnesiumMg;
  final Value<double?> maltoseG;
  final Value<double?> manganeseMg;
  final Value<double?> menaquinone4Mcg;
  final Value<double?> methionineMg;
  final Value<double?> molybdenumMcg;
  final Value<String> name;
  final Value<double?> netCarbsG;
  final Value<double?> niacinB3Mg;
  final Value<double?> omega3sMg;
  final Value<double?> omega6sMg;
  final Value<double?> pantothenicAcidB5Mg;
  final Value<double?> phenylalanineMg;
  final Value<double?> phosphorusPMg;
  final Value<double?> potassiumKMg;
  final Value<double?> pralScore;
  final Value<double?> prolineMg;
  final Value<double?> proteinG;
  final Value<double?> retinolMcg;
  final Value<double?> riboflavinB2Mg;
  final Value<double?> saturatedFatsG;
  final Value<double?> seleniumSeMcg;
  final Value<double?> serineMg;
  final Value<String?> servingDescription1G;
  final Value<String?> servingDescription2G;
  final Value<String?> servingDescription3G;
  final Value<String?> servingDescription4G;
  final Value<String?> servingDescription5G;
  final Value<String?> servingDescription6G;
  final Value<String?> servingDescription7G;
  final Value<String?> servingDescription8G;
  final Value<String?> servingDescription9G;
  final Value<double?> servingSize;
  final Value<String?> servingUnit;
  final Value<double?> servingWeight1G;
  final Value<double?> servingWeight2G;
  final Value<double?> servingWeight3G;
  final Value<double?> servingWeight4G;
  final Value<double?> servingWeight5G;
  final Value<double?> servingWeight6G;
  final Value<double?> servingWeight7G;
  final Value<double?> servingWeight8G;
  final Value<double?> servingWeight9G;
  final Value<String?> smallImage;
  final Value<double?> sodiumMg;
  final Value<double?> solubleFiberG;
  final Value<double?> starchG;
  final Value<double?> sucroseG;
  final Value<double?> sugarsG;
  final Value<double?> theobromineMg;
  final Value<double?> thiaminB1Mg;
  final Value<double?> threonineMg;
  final Value<double?> totalSugarAlcoholsG;
  final Value<double?> transFattyAcidsG;
  final Value<double?> tryptophanMg;
  final Value<double?> tyrosineMg;
  final Value<double?> u183N3CCCAlaMg;
  final Value<double?> u200calorieWeightG;
  final Value<double?> u205N3EpaMg;
  final Value<double?> u225N3DpaMg;
  final Value<double?> u226N3DhaMg;
  final Value<double?> valineMg;
  final Value<double?> vitaminAIuIu;
  final Value<double?> vitaminARaeMcg;
  final Value<double?> vitaminB12Mcg;
  final Value<double?> vitaminB6Mg;
  final Value<double?> vitaminCMg;
  final Value<double?> vitaminD2ErgocalciferolMcg;
  final Value<double?> vitaminD3CholecalciferolMcg;
  final Value<double?> vitaminDIuIu;
  final Value<double?> vitaminDMcg;
  final Value<double?> vitaminEAlphaTocopherolMg;
  final Value<double?> vitaminKMcg;
  final Value<double?> waterG;
  final Value<double?> zincZnMg;
  const FoodsCompanion({
    this.barcode = const Value.absent(),
    this.addedSugarG = const Value.absent(),
    this.alanineMg = const Value.absent(),
    this.alcoholG = const Value.absent(),
    this.arginineMg = const Value.absent(),
    this.asparticAcidMg = const Value.absent(),
    this.betaineMg = const Value.absent(),
    this.bigImage = const Value.absent(),
    this.biotinB7Mcg = const Value.absent(),
    this.caffeineMg = const Value.absent(),
    this.calciumMg = const Value.absent(),
    this.calories = const Value.absent(),
    this.carbohydrateG = const Value.absent(),
    this.caroteneAlphaMcg = const Value.absent(),
    this.caroteneBetaMcg = const Value.absent(),
    this.chlorineMg = const Value.absent(),
    this.cholesterolMg = const Value.absent(),
    this.cholineMg = const Value.absent(),
    this.copperCuMg = const Value.absent(),
    this.created = const Value.absent(),
    this.cystineMg = const Value.absent(),
    this.dihydrophylloquinoneMcg = const Value.absent(),
    this.fatG = const Value.absent(),
    this.fattyAcidsTotalMonounsaturatedMg = const Value.absent(),
    this.fattyAcidsTotalPolyunsaturatedMg = const Value.absent(),
    this.favorite = const Value.absent(),
    this.fiberG = const Value.absent(),
    this.fluorideFMcg = const Value.absent(),
    this.folateB9Mcg = const Value.absent(),
    this.folateDfeMcg = const Value.absent(),
    this.folicAcidMcg = const Value.absent(),
    this.foodFolateMcg = const Value.absent(),
    this.foodGroup = const Value.absent(),
    this.fructoseG = const Value.absent(),
    this.galactoseG = const Value.absent(),
    this.glucoseDextroseG = const Value.absent(),
    this.glutamicAcidMg = const Value.absent(),
    this.glycineMg = const Value.absent(),
    this.histidineMg = const Value.absent(),
    this.hydroxyprolineMg = const Value.absent(),
    this.id = const Value.absent(),
    this.imageFile = const Value.absent(),
    this.insolubleFiberG = const Value.absent(),
    this.ironFeMg = const Value.absent(),
    this.isoleucineMg = const Value.absent(),
    this.lactoseG = const Value.absent(),
    this.leucineMg = const Value.absent(),
    this.luteinZeaxanthinMcg = const Value.absent(),
    this.lycopeneMcg = const Value.absent(),
    this.lysineMg = const Value.absent(),
    this.magnesiumMg = const Value.absent(),
    this.maltoseG = const Value.absent(),
    this.manganeseMg = const Value.absent(),
    this.menaquinone4Mcg = const Value.absent(),
    this.methionineMg = const Value.absent(),
    this.molybdenumMcg = const Value.absent(),
    this.name = const Value.absent(),
    this.netCarbsG = const Value.absent(),
    this.niacinB3Mg = const Value.absent(),
    this.omega3sMg = const Value.absent(),
    this.omega6sMg = const Value.absent(),
    this.pantothenicAcidB5Mg = const Value.absent(),
    this.phenylalanineMg = const Value.absent(),
    this.phosphorusPMg = const Value.absent(),
    this.potassiumKMg = const Value.absent(),
    this.pralScore = const Value.absent(),
    this.prolineMg = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.retinolMcg = const Value.absent(),
    this.riboflavinB2Mg = const Value.absent(),
    this.saturatedFatsG = const Value.absent(),
    this.seleniumSeMcg = const Value.absent(),
    this.serineMg = const Value.absent(),
    this.servingDescription1G = const Value.absent(),
    this.servingDescription2G = const Value.absent(),
    this.servingDescription3G = const Value.absent(),
    this.servingDescription4G = const Value.absent(),
    this.servingDescription5G = const Value.absent(),
    this.servingDescription6G = const Value.absent(),
    this.servingDescription7G = const Value.absent(),
    this.servingDescription8G = const Value.absent(),
    this.servingDescription9G = const Value.absent(),
    this.servingSize = const Value.absent(),
    this.servingUnit = const Value.absent(),
    this.servingWeight1G = const Value.absent(),
    this.servingWeight2G = const Value.absent(),
    this.servingWeight3G = const Value.absent(),
    this.servingWeight4G = const Value.absent(),
    this.servingWeight5G = const Value.absent(),
    this.servingWeight6G = const Value.absent(),
    this.servingWeight7G = const Value.absent(),
    this.servingWeight8G = const Value.absent(),
    this.servingWeight9G = const Value.absent(),
    this.smallImage = const Value.absent(),
    this.sodiumMg = const Value.absent(),
    this.solubleFiberG = const Value.absent(),
    this.starchG = const Value.absent(),
    this.sucroseG = const Value.absent(),
    this.sugarsG = const Value.absent(),
    this.theobromineMg = const Value.absent(),
    this.thiaminB1Mg = const Value.absent(),
    this.threonineMg = const Value.absent(),
    this.totalSugarAlcoholsG = const Value.absent(),
    this.transFattyAcidsG = const Value.absent(),
    this.tryptophanMg = const Value.absent(),
    this.tyrosineMg = const Value.absent(),
    this.u183N3CCCAlaMg = const Value.absent(),
    this.u200calorieWeightG = const Value.absent(),
    this.u205N3EpaMg = const Value.absent(),
    this.u225N3DpaMg = const Value.absent(),
    this.u226N3DhaMg = const Value.absent(),
    this.valineMg = const Value.absent(),
    this.vitaminAIuIu = const Value.absent(),
    this.vitaminARaeMcg = const Value.absent(),
    this.vitaminB12Mcg = const Value.absent(),
    this.vitaminB6Mg = const Value.absent(),
    this.vitaminCMg = const Value.absent(),
    this.vitaminD2ErgocalciferolMcg = const Value.absent(),
    this.vitaminD3CholecalciferolMcg = const Value.absent(),
    this.vitaminDIuIu = const Value.absent(),
    this.vitaminDMcg = const Value.absent(),
    this.vitaminEAlphaTocopherolMg = const Value.absent(),
    this.vitaminKMcg = const Value.absent(),
    this.waterG = const Value.absent(),
    this.zincZnMg = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.barcode = const Value.absent(),
    this.addedSugarG = const Value.absent(),
    this.alanineMg = const Value.absent(),
    this.alcoholG = const Value.absent(),
    this.arginineMg = const Value.absent(),
    this.asparticAcidMg = const Value.absent(),
    this.betaineMg = const Value.absent(),
    this.bigImage = const Value.absent(),
    this.biotinB7Mcg = const Value.absent(),
    this.caffeineMg = const Value.absent(),
    this.calciumMg = const Value.absent(),
    this.calories = const Value.absent(),
    this.carbohydrateG = const Value.absent(),
    this.caroteneAlphaMcg = const Value.absent(),
    this.caroteneBetaMcg = const Value.absent(),
    this.chlorineMg = const Value.absent(),
    this.cholesterolMg = const Value.absent(),
    this.cholineMg = const Value.absent(),
    this.copperCuMg = const Value.absent(),
    this.created = const Value.absent(),
    this.cystineMg = const Value.absent(),
    this.dihydrophylloquinoneMcg = const Value.absent(),
    this.fatG = const Value.absent(),
    this.fattyAcidsTotalMonounsaturatedMg = const Value.absent(),
    this.fattyAcidsTotalPolyunsaturatedMg = const Value.absent(),
    this.favorite = const Value.absent(),
    this.fiberG = const Value.absent(),
    this.fluorideFMcg = const Value.absent(),
    this.folateB9Mcg = const Value.absent(),
    this.folateDfeMcg = const Value.absent(),
    this.folicAcidMcg = const Value.absent(),
    this.foodFolateMcg = const Value.absent(),
    this.foodGroup = const Value.absent(),
    this.fructoseG = const Value.absent(),
    this.galactoseG = const Value.absent(),
    this.glucoseDextroseG = const Value.absent(),
    this.glutamicAcidMg = const Value.absent(),
    this.glycineMg = const Value.absent(),
    this.histidineMg = const Value.absent(),
    this.hydroxyprolineMg = const Value.absent(),
    this.id = const Value.absent(),
    this.imageFile = const Value.absent(),
    this.insolubleFiberG = const Value.absent(),
    this.ironFeMg = const Value.absent(),
    this.isoleucineMg = const Value.absent(),
    this.lactoseG = const Value.absent(),
    this.leucineMg = const Value.absent(),
    this.luteinZeaxanthinMcg = const Value.absent(),
    this.lycopeneMcg = const Value.absent(),
    this.lysineMg = const Value.absent(),
    this.magnesiumMg = const Value.absent(),
    this.maltoseG = const Value.absent(),
    this.manganeseMg = const Value.absent(),
    this.menaquinone4Mcg = const Value.absent(),
    this.methionineMg = const Value.absent(),
    this.molybdenumMcg = const Value.absent(),
    required String name,
    this.netCarbsG = const Value.absent(),
    this.niacinB3Mg = const Value.absent(),
    this.omega3sMg = const Value.absent(),
    this.omega6sMg = const Value.absent(),
    this.pantothenicAcidB5Mg = const Value.absent(),
    this.phenylalanineMg = const Value.absent(),
    this.phosphorusPMg = const Value.absent(),
    this.potassiumKMg = const Value.absent(),
    this.pralScore = const Value.absent(),
    this.prolineMg = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.retinolMcg = const Value.absent(),
    this.riboflavinB2Mg = const Value.absent(),
    this.saturatedFatsG = const Value.absent(),
    this.seleniumSeMcg = const Value.absent(),
    this.serineMg = const Value.absent(),
    this.servingDescription1G = const Value.absent(),
    this.servingDescription2G = const Value.absent(),
    this.servingDescription3G = const Value.absent(),
    this.servingDescription4G = const Value.absent(),
    this.servingDescription5G = const Value.absent(),
    this.servingDescription6G = const Value.absent(),
    this.servingDescription7G = const Value.absent(),
    this.servingDescription8G = const Value.absent(),
    this.servingDescription9G = const Value.absent(),
    this.servingSize = const Value.absent(),
    this.servingUnit = const Value.absent(),
    this.servingWeight1G = const Value.absent(),
    this.servingWeight2G = const Value.absent(),
    this.servingWeight3G = const Value.absent(),
    this.servingWeight4G = const Value.absent(),
    this.servingWeight5G = const Value.absent(),
    this.servingWeight6G = const Value.absent(),
    this.servingWeight7G = const Value.absent(),
    this.servingWeight8G = const Value.absent(),
    this.servingWeight9G = const Value.absent(),
    this.smallImage = const Value.absent(),
    this.sodiumMg = const Value.absent(),
    this.solubleFiberG = const Value.absent(),
    this.starchG = const Value.absent(),
    this.sucroseG = const Value.absent(),
    this.sugarsG = const Value.absent(),
    this.theobromineMg = const Value.absent(),
    this.thiaminB1Mg = const Value.absent(),
    this.threonineMg = const Value.absent(),
    this.totalSugarAlcoholsG = const Value.absent(),
    this.transFattyAcidsG = const Value.absent(),
    this.tryptophanMg = const Value.absent(),
    this.tyrosineMg = const Value.absent(),
    this.u183N3CCCAlaMg = const Value.absent(),
    this.u200calorieWeightG = const Value.absent(),
    this.u205N3EpaMg = const Value.absent(),
    this.u225N3DpaMg = const Value.absent(),
    this.u226N3DhaMg = const Value.absent(),
    this.valineMg = const Value.absent(),
    this.vitaminAIuIu = const Value.absent(),
    this.vitaminARaeMcg = const Value.absent(),
    this.vitaminB12Mcg = const Value.absent(),
    this.vitaminB6Mg = const Value.absent(),
    this.vitaminCMg = const Value.absent(),
    this.vitaminD2ErgocalciferolMcg = const Value.absent(),
    this.vitaminD3CholecalciferolMcg = const Value.absent(),
    this.vitaminDIuIu = const Value.absent(),
    this.vitaminDMcg = const Value.absent(),
    this.vitaminEAlphaTocopherolMg = const Value.absent(),
    this.vitaminKMcg = const Value.absent(),
    this.waterG = const Value.absent(),
    this.zincZnMg = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Food> custom({
    Expression<String>? barcode,
    Expression<double>? addedSugarG,
    Expression<double>? alanineMg,
    Expression<double>? alcoholG,
    Expression<double>? arginineMg,
    Expression<double>? asparticAcidMg,
    Expression<double>? betaineMg,
    Expression<String>? bigImage,
    Expression<double>? biotinB7Mcg,
    Expression<double>? caffeineMg,
    Expression<double>? calciumMg,
    Expression<double>? calories,
    Expression<double>? carbohydrateG,
    Expression<double>? caroteneAlphaMcg,
    Expression<double>? caroteneBetaMcg,
    Expression<double>? chlorineMg,
    Expression<double>? cholesterolMg,
    Expression<double>? cholineMg,
    Expression<double>? copperCuMg,
    Expression<DateTime>? created,
    Expression<double>? cystineMg,
    Expression<double>? dihydrophylloquinoneMcg,
    Expression<double>? fatG,
    Expression<double>? fattyAcidsTotalMonounsaturatedMg,
    Expression<double>? fattyAcidsTotalPolyunsaturatedMg,
    Expression<bool>? favorite,
    Expression<double>? fiberG,
    Expression<double>? fluorideFMcg,
    Expression<double>? folateB9Mcg,
    Expression<double>? folateDfeMcg,
    Expression<double>? folicAcidMcg,
    Expression<double>? foodFolateMcg,
    Expression<String>? foodGroup,
    Expression<double>? fructoseG,
    Expression<double>? galactoseG,
    Expression<double>? glucoseDextroseG,
    Expression<double>? glutamicAcidMg,
    Expression<double>? glycineMg,
    Expression<double>? histidineMg,
    Expression<double>? hydroxyprolineMg,
    Expression<int>? id,
    Expression<String>? imageFile,
    Expression<double>? insolubleFiberG,
    Expression<double>? ironFeMg,
    Expression<double>? isoleucineMg,
    Expression<double>? lactoseG,
    Expression<double>? leucineMg,
    Expression<double>? luteinZeaxanthinMcg,
    Expression<double>? lycopeneMcg,
    Expression<double>? lysineMg,
    Expression<double>? magnesiumMg,
    Expression<double>? maltoseG,
    Expression<double>? manganeseMg,
    Expression<double>? menaquinone4Mcg,
    Expression<double>? methionineMg,
    Expression<double>? molybdenumMcg,
    Expression<String>? name,
    Expression<double>? netCarbsG,
    Expression<double>? niacinB3Mg,
    Expression<double>? omega3sMg,
    Expression<double>? omega6sMg,
    Expression<double>? pantothenicAcidB5Mg,
    Expression<double>? phenylalanineMg,
    Expression<double>? phosphorusPMg,
    Expression<double>? potassiumKMg,
    Expression<double>? pralScore,
    Expression<double>? prolineMg,
    Expression<double>? proteinG,
    Expression<double>? retinolMcg,
    Expression<double>? riboflavinB2Mg,
    Expression<double>? saturatedFatsG,
    Expression<double>? seleniumSeMcg,
    Expression<double>? serineMg,
    Expression<String>? servingDescription1G,
    Expression<String>? servingDescription2G,
    Expression<String>? servingDescription3G,
    Expression<String>? servingDescription4G,
    Expression<String>? servingDescription5G,
    Expression<String>? servingDescription6G,
    Expression<String>? servingDescription7G,
    Expression<String>? servingDescription8G,
    Expression<String>? servingDescription9G,
    Expression<double>? servingSize,
    Expression<String>? servingUnit,
    Expression<double>? servingWeight1G,
    Expression<double>? servingWeight2G,
    Expression<double>? servingWeight3G,
    Expression<double>? servingWeight4G,
    Expression<double>? servingWeight5G,
    Expression<double>? servingWeight6G,
    Expression<double>? servingWeight7G,
    Expression<double>? servingWeight8G,
    Expression<double>? servingWeight9G,
    Expression<String>? smallImage,
    Expression<double>? sodiumMg,
    Expression<double>? solubleFiberG,
    Expression<double>? starchG,
    Expression<double>? sucroseG,
    Expression<double>? sugarsG,
    Expression<double>? theobromineMg,
    Expression<double>? thiaminB1Mg,
    Expression<double>? threonineMg,
    Expression<double>? totalSugarAlcoholsG,
    Expression<double>? transFattyAcidsG,
    Expression<double>? tryptophanMg,
    Expression<double>? tyrosineMg,
    Expression<double>? u183N3CCCAlaMg,
    Expression<double>? u200calorieWeightG,
    Expression<double>? u205N3EpaMg,
    Expression<double>? u225N3DpaMg,
    Expression<double>? u226N3DhaMg,
    Expression<double>? valineMg,
    Expression<double>? vitaminAIuIu,
    Expression<double>? vitaminARaeMcg,
    Expression<double>? vitaminB12Mcg,
    Expression<double>? vitaminB6Mg,
    Expression<double>? vitaminCMg,
    Expression<double>? vitaminD2ErgocalciferolMcg,
    Expression<double>? vitaminD3CholecalciferolMcg,
    Expression<double>? vitaminDIuIu,
    Expression<double>? vitaminDMcg,
    Expression<double>? vitaminEAlphaTocopherolMg,
    Expression<double>? vitaminKMcg,
    Expression<double>? waterG,
    Expression<double>? zincZnMg,
  }) {
    return RawValuesInsertable({
      if (barcode != null) 'barcode': barcode,
      if (addedSugarG != null) 'added_sugar_g': addedSugarG,
      if (alanineMg != null) 'alanine_mg': alanineMg,
      if (alcoholG != null) 'alcohol_g': alcoholG,
      if (arginineMg != null) 'arginine_mg': arginineMg,
      if (asparticAcidMg != null) 'aspartic_acid_mg': asparticAcidMg,
      if (betaineMg != null) 'betaine_mg': betaineMg,
      if (bigImage != null) 'big_image': bigImage,
      if (biotinB7Mcg != null) 'biotin_b7_mcg': biotinB7Mcg,
      if (caffeineMg != null) 'caffeine_mg': caffeineMg,
      if (calciumMg != null) 'calcium_mg': calciumMg,
      if (calories != null) 'calories': calories,
      if (carbohydrateG != null) 'carbohydrate_g': carbohydrateG,
      if (caroteneAlphaMcg != null) 'carotene_alpha_mcg': caroteneAlphaMcg,
      if (caroteneBetaMcg != null) 'carotene_beta_mcg': caroteneBetaMcg,
      if (chlorineMg != null) 'chlorine_mg': chlorineMg,
      if (cholesterolMg != null) 'cholesterol_mg': cholesterolMg,
      if (cholineMg != null) 'choline_mg': cholineMg,
      if (copperCuMg != null) 'copper_cu_mg': copperCuMg,
      if (created != null) 'created': created,
      if (cystineMg != null) 'cystine_mg': cystineMg,
      if (dihydrophylloquinoneMcg != null)
        'dihydrophylloquinone_mcg': dihydrophylloquinoneMcg,
      if (fatG != null) 'fat_g': fatG,
      if (fattyAcidsTotalMonounsaturatedMg != null)
        'fatty_acids_total_monounsaturated_mg':
            fattyAcidsTotalMonounsaturatedMg,
      if (fattyAcidsTotalPolyunsaturatedMg != null)
        'fatty_acids_total_polyunsaturated_mg':
            fattyAcidsTotalPolyunsaturatedMg,
      if (favorite != null) 'favorite': favorite,
      if (fiberG != null) 'fiber_g': fiberG,
      if (fluorideFMcg != null) 'fluoride_f_mcg': fluorideFMcg,
      if (folateB9Mcg != null) 'folate_b9_mcg': folateB9Mcg,
      if (folateDfeMcg != null) 'folate_dfe_mcg': folateDfeMcg,
      if (folicAcidMcg != null) 'folic_acid_mcg': folicAcidMcg,
      if (foodFolateMcg != null) 'food_folate_mcg': foodFolateMcg,
      if (foodGroup != null) 'food_group': foodGroup,
      if (fructoseG != null) 'fructose_g': fructoseG,
      if (galactoseG != null) 'galactose_g': galactoseG,
      if (glucoseDextroseG != null) 'glucose_dextrose_g': glucoseDextroseG,
      if (glutamicAcidMg != null) 'glutamic_acid_mg': glutamicAcidMg,
      if (glycineMg != null) 'glycine_mg': glycineMg,
      if (histidineMg != null) 'histidine_mg': histidineMg,
      if (hydroxyprolineMg != null) 'hydroxyproline_mg': hydroxyprolineMg,
      if (id != null) 'id': id,
      if (imageFile != null) 'image_file': imageFile,
      if (insolubleFiberG != null) 'insoluble_fiber_g': insolubleFiberG,
      if (ironFeMg != null) 'iron_fe_mg': ironFeMg,
      if (isoleucineMg != null) 'isoleucine_mg': isoleucineMg,
      if (lactoseG != null) 'lactose_g': lactoseG,
      if (leucineMg != null) 'leucine_mg': leucineMg,
      if (luteinZeaxanthinMcg != null)
        'lutein_zeaxanthin_mcg': luteinZeaxanthinMcg,
      if (lycopeneMcg != null) 'lycopene_mcg': lycopeneMcg,
      if (lysineMg != null) 'lysine_mg': lysineMg,
      if (magnesiumMg != null) 'magnesium_mg': magnesiumMg,
      if (maltoseG != null) 'maltose_g': maltoseG,
      if (manganeseMg != null) 'manganese_mg': manganeseMg,
      if (menaquinone4Mcg != null) 'menaquinone_4_mcg': menaquinone4Mcg,
      if (methionineMg != null) 'methionine_mg': methionineMg,
      if (molybdenumMcg != null) 'molybdenum_mcg': molybdenumMcg,
      if (name != null) 'name': name,
      if (netCarbsG != null) 'net_carbs_g': netCarbsG,
      if (niacinB3Mg != null) 'niacin_b3_mg': niacinB3Mg,
      if (omega3sMg != null) 'omega_3s_mg': omega3sMg,
      if (omega6sMg != null) 'omega_6s_mg': omega6sMg,
      if (pantothenicAcidB5Mg != null)
        'pantothenic_acid_b5_mg': pantothenicAcidB5Mg,
      if (phenylalanineMg != null) 'phenylalanine_mg': phenylalanineMg,
      if (phosphorusPMg != null) 'phosphorus_p_mg': phosphorusPMg,
      if (potassiumKMg != null) 'potassium_k_mg': potassiumKMg,
      if (pralScore != null) 'pral_score': pralScore,
      if (prolineMg != null) 'proline_mg': prolineMg,
      if (proteinG != null) 'protein_g': proteinG,
      if (retinolMcg != null) 'retinol_mcg': retinolMcg,
      if (riboflavinB2Mg != null) 'riboflavin_b2_mg': riboflavinB2Mg,
      if (saturatedFatsG != null) 'saturated_fats_g': saturatedFatsG,
      if (seleniumSeMcg != null) 'selenium_se_mcg': seleniumSeMcg,
      if (serineMg != null) 'serine_mg': serineMg,
      if (servingDescription1G != null)
        'serving_description_1_g': servingDescription1G,
      if (servingDescription2G != null)
        'serving_description_2_g': servingDescription2G,
      if (servingDescription3G != null)
        'serving_description_3_g': servingDescription3G,
      if (servingDescription4G != null)
        'serving_description_4_g': servingDescription4G,
      if (servingDescription5G != null)
        'serving_description_5_g': servingDescription5G,
      if (servingDescription6G != null)
        'serving_description_6_g': servingDescription6G,
      if (servingDescription7G != null)
        'serving_description_7_g': servingDescription7G,
      if (servingDescription8G != null)
        'serving_description_8_g': servingDescription8G,
      if (servingDescription9G != null)
        'serving_description_9_g': servingDescription9G,
      if (servingSize != null) 'serving_size': servingSize,
      if (servingUnit != null) 'serving_unit': servingUnit,
      if (servingWeight1G != null) 'serving_weight_1_g': servingWeight1G,
      if (servingWeight2G != null) 'serving_weight_2_g': servingWeight2G,
      if (servingWeight3G != null) 'serving_weight_3_g': servingWeight3G,
      if (servingWeight4G != null) 'serving_weight_4_g': servingWeight4G,
      if (servingWeight5G != null) 'serving_weight_5_g': servingWeight5G,
      if (servingWeight6G != null) 'serving_weight_6_g': servingWeight6G,
      if (servingWeight7G != null) 'serving_weight_7_g': servingWeight7G,
      if (servingWeight8G != null) 'serving_weight_8_g': servingWeight8G,
      if (servingWeight9G != null) 'serving_weight_9_g': servingWeight9G,
      if (smallImage != null) 'small_image': smallImage,
      if (sodiumMg != null) 'sodium_mg': sodiumMg,
      if (solubleFiberG != null) 'soluble_fiber_g': solubleFiberG,
      if (starchG != null) 'starch_g': starchG,
      if (sucroseG != null) 'sucrose_g': sucroseG,
      if (sugarsG != null) 'sugars_g': sugarsG,
      if (theobromineMg != null) 'theobromine_mg': theobromineMg,
      if (thiaminB1Mg != null) 'thiamin_b1_mg': thiaminB1Mg,
      if (threonineMg != null) 'threonine_mg': threonineMg,
      if (totalSugarAlcoholsG != null)
        'total_sugar_alcohols_g': totalSugarAlcoholsG,
      if (transFattyAcidsG != null) 'trans_fatty_acids_g': transFattyAcidsG,
      if (tryptophanMg != null) 'tryptophan_mg': tryptophanMg,
      if (tyrosineMg != null) 'tyrosine_mg': tyrosineMg,
      if (u183N3CCCAlaMg != null) '_18_3_n_3_c_c_c_ala_mg': u183N3CCCAlaMg,
      if (u200calorieWeightG != null)
        '_200_calorie_weight_g': u200calorieWeightG,
      if (u205N3EpaMg != null) '_20_5_n_3_epa_mg': u205N3EpaMg,
      if (u225N3DpaMg != null) '_22_5_n_3_dpa_mg': u225N3DpaMg,
      if (u226N3DhaMg != null) '_22_6_n_3_dha_mg': u226N3DhaMg,
      if (valineMg != null) 'valine_mg': valineMg,
      if (vitaminAIuIu != null) 'vitamin_a_iu_iu': vitaminAIuIu,
      if (vitaminARaeMcg != null) 'vitamin_a_rae_mcg': vitaminARaeMcg,
      if (vitaminB12Mcg != null) 'vitamin_b_12_mcg': vitaminB12Mcg,
      if (vitaminB6Mg != null) 'vitamin_b6_mg': vitaminB6Mg,
      if (vitaminCMg != null) 'vitamin_c_mg': vitaminCMg,
      if (vitaminD2ErgocalciferolMcg != null)
        'vitamin_d2_ergocalciferol_mcg': vitaminD2ErgocalciferolMcg,
      if (vitaminD3CholecalciferolMcg != null)
        'vitamin_d3_cholecalciferol_mcg': vitaminD3CholecalciferolMcg,
      if (vitaminDIuIu != null) 'vitamin_d_iu_iu': vitaminDIuIu,
      if (vitaminDMcg != null) 'vitamin_d_mcg': vitaminDMcg,
      if (vitaminEAlphaTocopherolMg != null)
        'vitamin_e_alpha_tocopherol_mg': vitaminEAlphaTocopherolMg,
      if (vitaminKMcg != null) 'vitamin_k_mcg': vitaminKMcg,
      if (waterG != null) 'water_g': waterG,
      if (zincZnMg != null) 'zinc_zn_mg': zincZnMg,
    });
  }

  FoodsCompanion copyWith(
      {Value<String?>? barcode,
      Value<double?>? addedSugarG,
      Value<double?>? alanineMg,
      Value<double?>? alcoholG,
      Value<double?>? arginineMg,
      Value<double?>? asparticAcidMg,
      Value<double?>? betaineMg,
      Value<String?>? bigImage,
      Value<double?>? biotinB7Mcg,
      Value<double?>? caffeineMg,
      Value<double?>? calciumMg,
      Value<double?>? calories,
      Value<double?>? carbohydrateG,
      Value<double?>? caroteneAlphaMcg,
      Value<double?>? caroteneBetaMcg,
      Value<double?>? chlorineMg,
      Value<double?>? cholesterolMg,
      Value<double?>? cholineMg,
      Value<double?>? copperCuMg,
      Value<DateTime?>? created,
      Value<double?>? cystineMg,
      Value<double?>? dihydrophylloquinoneMcg,
      Value<double?>? fatG,
      Value<double?>? fattyAcidsTotalMonounsaturatedMg,
      Value<double?>? fattyAcidsTotalPolyunsaturatedMg,
      Value<bool?>? favorite,
      Value<double?>? fiberG,
      Value<double?>? fluorideFMcg,
      Value<double?>? folateB9Mcg,
      Value<double?>? folateDfeMcg,
      Value<double?>? folicAcidMcg,
      Value<double?>? foodFolateMcg,
      Value<String?>? foodGroup,
      Value<double?>? fructoseG,
      Value<double?>? galactoseG,
      Value<double?>? glucoseDextroseG,
      Value<double?>? glutamicAcidMg,
      Value<double?>? glycineMg,
      Value<double?>? histidineMg,
      Value<double?>? hydroxyprolineMg,
      Value<int>? id,
      Value<String?>? imageFile,
      Value<double?>? insolubleFiberG,
      Value<double?>? ironFeMg,
      Value<double?>? isoleucineMg,
      Value<double?>? lactoseG,
      Value<double?>? leucineMg,
      Value<double?>? luteinZeaxanthinMcg,
      Value<double?>? lycopeneMcg,
      Value<double?>? lysineMg,
      Value<double?>? magnesiumMg,
      Value<double?>? maltoseG,
      Value<double?>? manganeseMg,
      Value<double?>? menaquinone4Mcg,
      Value<double?>? methionineMg,
      Value<double?>? molybdenumMcg,
      Value<String>? name,
      Value<double?>? netCarbsG,
      Value<double?>? niacinB3Mg,
      Value<double?>? omega3sMg,
      Value<double?>? omega6sMg,
      Value<double?>? pantothenicAcidB5Mg,
      Value<double?>? phenylalanineMg,
      Value<double?>? phosphorusPMg,
      Value<double?>? potassiumKMg,
      Value<double?>? pralScore,
      Value<double?>? prolineMg,
      Value<double?>? proteinG,
      Value<double?>? retinolMcg,
      Value<double?>? riboflavinB2Mg,
      Value<double?>? saturatedFatsG,
      Value<double?>? seleniumSeMcg,
      Value<double?>? serineMg,
      Value<String?>? servingDescription1G,
      Value<String?>? servingDescription2G,
      Value<String?>? servingDescription3G,
      Value<String?>? servingDescription4G,
      Value<String?>? servingDescription5G,
      Value<String?>? servingDescription6G,
      Value<String?>? servingDescription7G,
      Value<String?>? servingDescription8G,
      Value<String?>? servingDescription9G,
      Value<double?>? servingSize,
      Value<String?>? servingUnit,
      Value<double?>? servingWeight1G,
      Value<double?>? servingWeight2G,
      Value<double?>? servingWeight3G,
      Value<double?>? servingWeight4G,
      Value<double?>? servingWeight5G,
      Value<double?>? servingWeight6G,
      Value<double?>? servingWeight7G,
      Value<double?>? servingWeight8G,
      Value<double?>? servingWeight9G,
      Value<String?>? smallImage,
      Value<double?>? sodiumMg,
      Value<double?>? solubleFiberG,
      Value<double?>? starchG,
      Value<double?>? sucroseG,
      Value<double?>? sugarsG,
      Value<double?>? theobromineMg,
      Value<double?>? thiaminB1Mg,
      Value<double?>? threonineMg,
      Value<double?>? totalSugarAlcoholsG,
      Value<double?>? transFattyAcidsG,
      Value<double?>? tryptophanMg,
      Value<double?>? tyrosineMg,
      Value<double?>? u183N3CCCAlaMg,
      Value<double?>? u200calorieWeightG,
      Value<double?>? u205N3EpaMg,
      Value<double?>? u225N3DpaMg,
      Value<double?>? u226N3DhaMg,
      Value<double?>? valineMg,
      Value<double?>? vitaminAIuIu,
      Value<double?>? vitaminARaeMcg,
      Value<double?>? vitaminB12Mcg,
      Value<double?>? vitaminB6Mg,
      Value<double?>? vitaminCMg,
      Value<double?>? vitaminD2ErgocalciferolMcg,
      Value<double?>? vitaminD3CholecalciferolMcg,
      Value<double?>? vitaminDIuIu,
      Value<double?>? vitaminDMcg,
      Value<double?>? vitaminEAlphaTocopherolMg,
      Value<double?>? vitaminKMcg,
      Value<double?>? waterG,
      Value<double?>? zincZnMg}) {
    return FoodsCompanion(
      barcode: barcode ?? this.barcode,
      addedSugarG: addedSugarG ?? this.addedSugarG,
      alanineMg: alanineMg ?? this.alanineMg,
      alcoholG: alcoholG ?? this.alcoholG,
      arginineMg: arginineMg ?? this.arginineMg,
      asparticAcidMg: asparticAcidMg ?? this.asparticAcidMg,
      betaineMg: betaineMg ?? this.betaineMg,
      bigImage: bigImage ?? this.bigImage,
      biotinB7Mcg: biotinB7Mcg ?? this.biotinB7Mcg,
      caffeineMg: caffeineMg ?? this.caffeineMg,
      calciumMg: calciumMg ?? this.calciumMg,
      calories: calories ?? this.calories,
      carbohydrateG: carbohydrateG ?? this.carbohydrateG,
      caroteneAlphaMcg: caroteneAlphaMcg ?? this.caroteneAlphaMcg,
      caroteneBetaMcg: caroteneBetaMcg ?? this.caroteneBetaMcg,
      chlorineMg: chlorineMg ?? this.chlorineMg,
      cholesterolMg: cholesterolMg ?? this.cholesterolMg,
      cholineMg: cholineMg ?? this.cholineMg,
      copperCuMg: copperCuMg ?? this.copperCuMg,
      created: created ?? this.created,
      cystineMg: cystineMg ?? this.cystineMg,
      dihydrophylloquinoneMcg:
          dihydrophylloquinoneMcg ?? this.dihydrophylloquinoneMcg,
      fatG: fatG ?? this.fatG,
      fattyAcidsTotalMonounsaturatedMg: fattyAcidsTotalMonounsaturatedMg ??
          this.fattyAcidsTotalMonounsaturatedMg,
      fattyAcidsTotalPolyunsaturatedMg: fattyAcidsTotalPolyunsaturatedMg ??
          this.fattyAcidsTotalPolyunsaturatedMg,
      favorite: favorite ?? this.favorite,
      fiberG: fiberG ?? this.fiberG,
      fluorideFMcg: fluorideFMcg ?? this.fluorideFMcg,
      folateB9Mcg: folateB9Mcg ?? this.folateB9Mcg,
      folateDfeMcg: folateDfeMcg ?? this.folateDfeMcg,
      folicAcidMcg: folicAcidMcg ?? this.folicAcidMcg,
      foodFolateMcg: foodFolateMcg ?? this.foodFolateMcg,
      foodGroup: foodGroup ?? this.foodGroup,
      fructoseG: fructoseG ?? this.fructoseG,
      galactoseG: galactoseG ?? this.galactoseG,
      glucoseDextroseG: glucoseDextroseG ?? this.glucoseDextroseG,
      glutamicAcidMg: glutamicAcidMg ?? this.glutamicAcidMg,
      glycineMg: glycineMg ?? this.glycineMg,
      histidineMg: histidineMg ?? this.histidineMg,
      hydroxyprolineMg: hydroxyprolineMg ?? this.hydroxyprolineMg,
      id: id ?? this.id,
      imageFile: imageFile ?? this.imageFile,
      insolubleFiberG: insolubleFiberG ?? this.insolubleFiberG,
      ironFeMg: ironFeMg ?? this.ironFeMg,
      isoleucineMg: isoleucineMg ?? this.isoleucineMg,
      lactoseG: lactoseG ?? this.lactoseG,
      leucineMg: leucineMg ?? this.leucineMg,
      luteinZeaxanthinMcg: luteinZeaxanthinMcg ?? this.luteinZeaxanthinMcg,
      lycopeneMcg: lycopeneMcg ?? this.lycopeneMcg,
      lysineMg: lysineMg ?? this.lysineMg,
      magnesiumMg: magnesiumMg ?? this.magnesiumMg,
      maltoseG: maltoseG ?? this.maltoseG,
      manganeseMg: manganeseMg ?? this.manganeseMg,
      menaquinone4Mcg: menaquinone4Mcg ?? this.menaquinone4Mcg,
      methionineMg: methionineMg ?? this.methionineMg,
      molybdenumMcg: molybdenumMcg ?? this.molybdenumMcg,
      name: name ?? this.name,
      netCarbsG: netCarbsG ?? this.netCarbsG,
      niacinB3Mg: niacinB3Mg ?? this.niacinB3Mg,
      omega3sMg: omega3sMg ?? this.omega3sMg,
      omega6sMg: omega6sMg ?? this.omega6sMg,
      pantothenicAcidB5Mg: pantothenicAcidB5Mg ?? this.pantothenicAcidB5Mg,
      phenylalanineMg: phenylalanineMg ?? this.phenylalanineMg,
      phosphorusPMg: phosphorusPMg ?? this.phosphorusPMg,
      potassiumKMg: potassiumKMg ?? this.potassiumKMg,
      pralScore: pralScore ?? this.pralScore,
      prolineMg: prolineMg ?? this.prolineMg,
      proteinG: proteinG ?? this.proteinG,
      retinolMcg: retinolMcg ?? this.retinolMcg,
      riboflavinB2Mg: riboflavinB2Mg ?? this.riboflavinB2Mg,
      saturatedFatsG: saturatedFatsG ?? this.saturatedFatsG,
      seleniumSeMcg: seleniumSeMcg ?? this.seleniumSeMcg,
      serineMg: serineMg ?? this.serineMg,
      servingDescription1G: servingDescription1G ?? this.servingDescription1G,
      servingDescription2G: servingDescription2G ?? this.servingDescription2G,
      servingDescription3G: servingDescription3G ?? this.servingDescription3G,
      servingDescription4G: servingDescription4G ?? this.servingDescription4G,
      servingDescription5G: servingDescription5G ?? this.servingDescription5G,
      servingDescription6G: servingDescription6G ?? this.servingDescription6G,
      servingDescription7G: servingDescription7G ?? this.servingDescription7G,
      servingDescription8G: servingDescription8G ?? this.servingDescription8G,
      servingDescription9G: servingDescription9G ?? this.servingDescription9G,
      servingSize: servingSize ?? this.servingSize,
      servingUnit: servingUnit ?? this.servingUnit,
      servingWeight1G: servingWeight1G ?? this.servingWeight1G,
      servingWeight2G: servingWeight2G ?? this.servingWeight2G,
      servingWeight3G: servingWeight3G ?? this.servingWeight3G,
      servingWeight4G: servingWeight4G ?? this.servingWeight4G,
      servingWeight5G: servingWeight5G ?? this.servingWeight5G,
      servingWeight6G: servingWeight6G ?? this.servingWeight6G,
      servingWeight7G: servingWeight7G ?? this.servingWeight7G,
      servingWeight8G: servingWeight8G ?? this.servingWeight8G,
      servingWeight9G: servingWeight9G ?? this.servingWeight9G,
      smallImage: smallImage ?? this.smallImage,
      sodiumMg: sodiumMg ?? this.sodiumMg,
      solubleFiberG: solubleFiberG ?? this.solubleFiberG,
      starchG: starchG ?? this.starchG,
      sucroseG: sucroseG ?? this.sucroseG,
      sugarsG: sugarsG ?? this.sugarsG,
      theobromineMg: theobromineMg ?? this.theobromineMg,
      thiaminB1Mg: thiaminB1Mg ?? this.thiaminB1Mg,
      threonineMg: threonineMg ?? this.threonineMg,
      totalSugarAlcoholsG: totalSugarAlcoholsG ?? this.totalSugarAlcoholsG,
      transFattyAcidsG: transFattyAcidsG ?? this.transFattyAcidsG,
      tryptophanMg: tryptophanMg ?? this.tryptophanMg,
      tyrosineMg: tyrosineMg ?? this.tyrosineMg,
      u183N3CCCAlaMg: u183N3CCCAlaMg ?? this.u183N3CCCAlaMg,
      u200calorieWeightG: u200calorieWeightG ?? this.u200calorieWeightG,
      u205N3EpaMg: u205N3EpaMg ?? this.u205N3EpaMg,
      u225N3DpaMg: u225N3DpaMg ?? this.u225N3DpaMg,
      u226N3DhaMg: u226N3DhaMg ?? this.u226N3DhaMg,
      valineMg: valineMg ?? this.valineMg,
      vitaminAIuIu: vitaminAIuIu ?? this.vitaminAIuIu,
      vitaminARaeMcg: vitaminARaeMcg ?? this.vitaminARaeMcg,
      vitaminB12Mcg: vitaminB12Mcg ?? this.vitaminB12Mcg,
      vitaminB6Mg: vitaminB6Mg ?? this.vitaminB6Mg,
      vitaminCMg: vitaminCMg ?? this.vitaminCMg,
      vitaminD2ErgocalciferolMcg:
          vitaminD2ErgocalciferolMcg ?? this.vitaminD2ErgocalciferolMcg,
      vitaminD3CholecalciferolMcg:
          vitaminD3CholecalciferolMcg ?? this.vitaminD3CholecalciferolMcg,
      vitaminDIuIu: vitaminDIuIu ?? this.vitaminDIuIu,
      vitaminDMcg: vitaminDMcg ?? this.vitaminDMcg,
      vitaminEAlphaTocopherolMg:
          vitaminEAlphaTocopherolMg ?? this.vitaminEAlphaTocopherolMg,
      vitaminKMcg: vitaminKMcg ?? this.vitaminKMcg,
      waterG: waterG ?? this.waterG,
      zincZnMg: zincZnMg ?? this.zincZnMg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (addedSugarG.present) {
      map['added_sugar_g'] = Variable<double>(addedSugarG.value);
    }
    if (alanineMg.present) {
      map['alanine_mg'] = Variable<double>(alanineMg.value);
    }
    if (alcoholG.present) {
      map['alcohol_g'] = Variable<double>(alcoholG.value);
    }
    if (arginineMg.present) {
      map['arginine_mg'] = Variable<double>(arginineMg.value);
    }
    if (asparticAcidMg.present) {
      map['aspartic_acid_mg'] = Variable<double>(asparticAcidMg.value);
    }
    if (betaineMg.present) {
      map['betaine_mg'] = Variable<double>(betaineMg.value);
    }
    if (bigImage.present) {
      map['big_image'] = Variable<String>(bigImage.value);
    }
    if (biotinB7Mcg.present) {
      map['biotin_b7_mcg'] = Variable<double>(biotinB7Mcg.value);
    }
    if (caffeineMg.present) {
      map['caffeine_mg'] = Variable<double>(caffeineMg.value);
    }
    if (calciumMg.present) {
      map['calcium_mg'] = Variable<double>(calciumMg.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (carbohydrateG.present) {
      map['carbohydrate_g'] = Variable<double>(carbohydrateG.value);
    }
    if (caroteneAlphaMcg.present) {
      map['carotene_alpha_mcg'] = Variable<double>(caroteneAlphaMcg.value);
    }
    if (caroteneBetaMcg.present) {
      map['carotene_beta_mcg'] = Variable<double>(caroteneBetaMcg.value);
    }
    if (chlorineMg.present) {
      map['chlorine_mg'] = Variable<double>(chlorineMg.value);
    }
    if (cholesterolMg.present) {
      map['cholesterol_mg'] = Variable<double>(cholesterolMg.value);
    }
    if (cholineMg.present) {
      map['choline_mg'] = Variable<double>(cholineMg.value);
    }
    if (copperCuMg.present) {
      map['copper_cu_mg'] = Variable<double>(copperCuMg.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (cystineMg.present) {
      map['cystine_mg'] = Variable<double>(cystineMg.value);
    }
    if (dihydrophylloquinoneMcg.present) {
      map['dihydrophylloquinone_mcg'] =
          Variable<double>(dihydrophylloquinoneMcg.value);
    }
    if (fatG.present) {
      map['fat_g'] = Variable<double>(fatG.value);
    }
    if (fattyAcidsTotalMonounsaturatedMg.present) {
      map['fatty_acids_total_monounsaturated_mg'] =
          Variable<double>(fattyAcidsTotalMonounsaturatedMg.value);
    }
    if (fattyAcidsTotalPolyunsaturatedMg.present) {
      map['fatty_acids_total_polyunsaturated_mg'] =
          Variable<double>(fattyAcidsTotalPolyunsaturatedMg.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (fiberG.present) {
      map['fiber_g'] = Variable<double>(fiberG.value);
    }
    if (fluorideFMcg.present) {
      map['fluoride_f_mcg'] = Variable<double>(fluorideFMcg.value);
    }
    if (folateB9Mcg.present) {
      map['folate_b9_mcg'] = Variable<double>(folateB9Mcg.value);
    }
    if (folateDfeMcg.present) {
      map['folate_dfe_mcg'] = Variable<double>(folateDfeMcg.value);
    }
    if (folicAcidMcg.present) {
      map['folic_acid_mcg'] = Variable<double>(folicAcidMcg.value);
    }
    if (foodFolateMcg.present) {
      map['food_folate_mcg'] = Variable<double>(foodFolateMcg.value);
    }
    if (foodGroup.present) {
      map['food_group'] = Variable<String>(foodGroup.value);
    }
    if (fructoseG.present) {
      map['fructose_g'] = Variable<double>(fructoseG.value);
    }
    if (galactoseG.present) {
      map['galactose_g'] = Variable<double>(galactoseG.value);
    }
    if (glucoseDextroseG.present) {
      map['glucose_dextrose_g'] = Variable<double>(glucoseDextroseG.value);
    }
    if (glutamicAcidMg.present) {
      map['glutamic_acid_mg'] = Variable<double>(glutamicAcidMg.value);
    }
    if (glycineMg.present) {
      map['glycine_mg'] = Variable<double>(glycineMg.value);
    }
    if (histidineMg.present) {
      map['histidine_mg'] = Variable<double>(histidineMg.value);
    }
    if (hydroxyprolineMg.present) {
      map['hydroxyproline_mg'] = Variable<double>(hydroxyprolineMg.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (imageFile.present) {
      map['image_file'] = Variable<String>(imageFile.value);
    }
    if (insolubleFiberG.present) {
      map['insoluble_fiber_g'] = Variable<double>(insolubleFiberG.value);
    }
    if (ironFeMg.present) {
      map['iron_fe_mg'] = Variable<double>(ironFeMg.value);
    }
    if (isoleucineMg.present) {
      map['isoleucine_mg'] = Variable<double>(isoleucineMg.value);
    }
    if (lactoseG.present) {
      map['lactose_g'] = Variable<double>(lactoseG.value);
    }
    if (leucineMg.present) {
      map['leucine_mg'] = Variable<double>(leucineMg.value);
    }
    if (luteinZeaxanthinMcg.present) {
      map['lutein_zeaxanthin_mcg'] =
          Variable<double>(luteinZeaxanthinMcg.value);
    }
    if (lycopeneMcg.present) {
      map['lycopene_mcg'] = Variable<double>(lycopeneMcg.value);
    }
    if (lysineMg.present) {
      map['lysine_mg'] = Variable<double>(lysineMg.value);
    }
    if (magnesiumMg.present) {
      map['magnesium_mg'] = Variable<double>(magnesiumMg.value);
    }
    if (maltoseG.present) {
      map['maltose_g'] = Variable<double>(maltoseG.value);
    }
    if (manganeseMg.present) {
      map['manganese_mg'] = Variable<double>(manganeseMg.value);
    }
    if (menaquinone4Mcg.present) {
      map['menaquinone_4_mcg'] = Variable<double>(menaquinone4Mcg.value);
    }
    if (methionineMg.present) {
      map['methionine_mg'] = Variable<double>(methionineMg.value);
    }
    if (molybdenumMcg.present) {
      map['molybdenum_mcg'] = Variable<double>(molybdenumMcg.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (netCarbsG.present) {
      map['net_carbs_g'] = Variable<double>(netCarbsG.value);
    }
    if (niacinB3Mg.present) {
      map['niacin_b3_mg'] = Variable<double>(niacinB3Mg.value);
    }
    if (omega3sMg.present) {
      map['omega_3s_mg'] = Variable<double>(omega3sMg.value);
    }
    if (omega6sMg.present) {
      map['omega_6s_mg'] = Variable<double>(omega6sMg.value);
    }
    if (pantothenicAcidB5Mg.present) {
      map['pantothenic_acid_b5_mg'] =
          Variable<double>(pantothenicAcidB5Mg.value);
    }
    if (phenylalanineMg.present) {
      map['phenylalanine_mg'] = Variable<double>(phenylalanineMg.value);
    }
    if (phosphorusPMg.present) {
      map['phosphorus_p_mg'] = Variable<double>(phosphorusPMg.value);
    }
    if (potassiumKMg.present) {
      map['potassium_k_mg'] = Variable<double>(potassiumKMg.value);
    }
    if (pralScore.present) {
      map['pral_score'] = Variable<double>(pralScore.value);
    }
    if (prolineMg.present) {
      map['proline_mg'] = Variable<double>(prolineMg.value);
    }
    if (proteinG.present) {
      map['protein_g'] = Variable<double>(proteinG.value);
    }
    if (retinolMcg.present) {
      map['retinol_mcg'] = Variable<double>(retinolMcg.value);
    }
    if (riboflavinB2Mg.present) {
      map['riboflavin_b2_mg'] = Variable<double>(riboflavinB2Mg.value);
    }
    if (saturatedFatsG.present) {
      map['saturated_fats_g'] = Variable<double>(saturatedFatsG.value);
    }
    if (seleniumSeMcg.present) {
      map['selenium_se_mcg'] = Variable<double>(seleniumSeMcg.value);
    }
    if (serineMg.present) {
      map['serine_mg'] = Variable<double>(serineMg.value);
    }
    if (servingDescription1G.present) {
      map['serving_description_1_g'] =
          Variable<String>(servingDescription1G.value);
    }
    if (servingDescription2G.present) {
      map['serving_description_2_g'] =
          Variable<String>(servingDescription2G.value);
    }
    if (servingDescription3G.present) {
      map['serving_description_3_g'] =
          Variable<String>(servingDescription3G.value);
    }
    if (servingDescription4G.present) {
      map['serving_description_4_g'] =
          Variable<String>(servingDescription4G.value);
    }
    if (servingDescription5G.present) {
      map['serving_description_5_g'] =
          Variable<String>(servingDescription5G.value);
    }
    if (servingDescription6G.present) {
      map['serving_description_6_g'] =
          Variable<String>(servingDescription6G.value);
    }
    if (servingDescription7G.present) {
      map['serving_description_7_g'] =
          Variable<String>(servingDescription7G.value);
    }
    if (servingDescription8G.present) {
      map['serving_description_8_g'] =
          Variable<String>(servingDescription8G.value);
    }
    if (servingDescription9G.present) {
      map['serving_description_9_g'] =
          Variable<String>(servingDescription9G.value);
    }
    if (servingSize.present) {
      map['serving_size'] = Variable<double>(servingSize.value);
    }
    if (servingUnit.present) {
      map['serving_unit'] = Variable<String>(servingUnit.value);
    }
    if (servingWeight1G.present) {
      map['serving_weight_1_g'] = Variable<double>(servingWeight1G.value);
    }
    if (servingWeight2G.present) {
      map['serving_weight_2_g'] = Variable<double>(servingWeight2G.value);
    }
    if (servingWeight3G.present) {
      map['serving_weight_3_g'] = Variable<double>(servingWeight3G.value);
    }
    if (servingWeight4G.present) {
      map['serving_weight_4_g'] = Variable<double>(servingWeight4G.value);
    }
    if (servingWeight5G.present) {
      map['serving_weight_5_g'] = Variable<double>(servingWeight5G.value);
    }
    if (servingWeight6G.present) {
      map['serving_weight_6_g'] = Variable<double>(servingWeight6G.value);
    }
    if (servingWeight7G.present) {
      map['serving_weight_7_g'] = Variable<double>(servingWeight7G.value);
    }
    if (servingWeight8G.present) {
      map['serving_weight_8_g'] = Variable<double>(servingWeight8G.value);
    }
    if (servingWeight9G.present) {
      map['serving_weight_9_g'] = Variable<double>(servingWeight9G.value);
    }
    if (smallImage.present) {
      map['small_image'] = Variable<String>(smallImage.value);
    }
    if (sodiumMg.present) {
      map['sodium_mg'] = Variable<double>(sodiumMg.value);
    }
    if (solubleFiberG.present) {
      map['soluble_fiber_g'] = Variable<double>(solubleFiberG.value);
    }
    if (starchG.present) {
      map['starch_g'] = Variable<double>(starchG.value);
    }
    if (sucroseG.present) {
      map['sucrose_g'] = Variable<double>(sucroseG.value);
    }
    if (sugarsG.present) {
      map['sugars_g'] = Variable<double>(sugarsG.value);
    }
    if (theobromineMg.present) {
      map['theobromine_mg'] = Variable<double>(theobromineMg.value);
    }
    if (thiaminB1Mg.present) {
      map['thiamin_b1_mg'] = Variable<double>(thiaminB1Mg.value);
    }
    if (threonineMg.present) {
      map['threonine_mg'] = Variable<double>(threonineMg.value);
    }
    if (totalSugarAlcoholsG.present) {
      map['total_sugar_alcohols_g'] =
          Variable<double>(totalSugarAlcoholsG.value);
    }
    if (transFattyAcidsG.present) {
      map['trans_fatty_acids_g'] = Variable<double>(transFattyAcidsG.value);
    }
    if (tryptophanMg.present) {
      map['tryptophan_mg'] = Variable<double>(tryptophanMg.value);
    }
    if (tyrosineMg.present) {
      map['tyrosine_mg'] = Variable<double>(tyrosineMg.value);
    }
    if (u183N3CCCAlaMg.present) {
      map['_18_3_n_3_c_c_c_ala_mg'] = Variable<double>(u183N3CCCAlaMg.value);
    }
    if (u200calorieWeightG.present) {
      map['_200_calorie_weight_g'] = Variable<double>(u200calorieWeightG.value);
    }
    if (u205N3EpaMg.present) {
      map['_20_5_n_3_epa_mg'] = Variable<double>(u205N3EpaMg.value);
    }
    if (u225N3DpaMg.present) {
      map['_22_5_n_3_dpa_mg'] = Variable<double>(u225N3DpaMg.value);
    }
    if (u226N3DhaMg.present) {
      map['_22_6_n_3_dha_mg'] = Variable<double>(u226N3DhaMg.value);
    }
    if (valineMg.present) {
      map['valine_mg'] = Variable<double>(valineMg.value);
    }
    if (vitaminAIuIu.present) {
      map['vitamin_a_iu_iu'] = Variable<double>(vitaminAIuIu.value);
    }
    if (vitaminARaeMcg.present) {
      map['vitamin_a_rae_mcg'] = Variable<double>(vitaminARaeMcg.value);
    }
    if (vitaminB12Mcg.present) {
      map['vitamin_b_12_mcg'] = Variable<double>(vitaminB12Mcg.value);
    }
    if (vitaminB6Mg.present) {
      map['vitamin_b6_mg'] = Variable<double>(vitaminB6Mg.value);
    }
    if (vitaminCMg.present) {
      map['vitamin_c_mg'] = Variable<double>(vitaminCMg.value);
    }
    if (vitaminD2ErgocalciferolMcg.present) {
      map['vitamin_d2_ergocalciferol_mcg'] =
          Variable<double>(vitaminD2ErgocalciferolMcg.value);
    }
    if (vitaminD3CholecalciferolMcg.present) {
      map['vitamin_d3_cholecalciferol_mcg'] =
          Variable<double>(vitaminD3CholecalciferolMcg.value);
    }
    if (vitaminDIuIu.present) {
      map['vitamin_d_iu_iu'] = Variable<double>(vitaminDIuIu.value);
    }
    if (vitaminDMcg.present) {
      map['vitamin_d_mcg'] = Variable<double>(vitaminDMcg.value);
    }
    if (vitaminEAlphaTocopherolMg.present) {
      map['vitamin_e_alpha_tocopherol_mg'] =
          Variable<double>(vitaminEAlphaTocopherolMg.value);
    }
    if (vitaminKMcg.present) {
      map['vitamin_k_mcg'] = Variable<double>(vitaminKMcg.value);
    }
    if (waterG.present) {
      map['water_g'] = Variable<double>(waterG.value);
    }
    if (zincZnMg.present) {
      map['zinc_zn_mg'] = Variable<double>(zincZnMg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('barcode: $barcode, ')
          ..write('addedSugarG: $addedSugarG, ')
          ..write('alanineMg: $alanineMg, ')
          ..write('alcoholG: $alcoholG, ')
          ..write('arginineMg: $arginineMg, ')
          ..write('asparticAcidMg: $asparticAcidMg, ')
          ..write('betaineMg: $betaineMg, ')
          ..write('bigImage: $bigImage, ')
          ..write('biotinB7Mcg: $biotinB7Mcg, ')
          ..write('caffeineMg: $caffeineMg, ')
          ..write('calciumMg: $calciumMg, ')
          ..write('calories: $calories, ')
          ..write('carbohydrateG: $carbohydrateG, ')
          ..write('caroteneAlphaMcg: $caroteneAlphaMcg, ')
          ..write('caroteneBetaMcg: $caroteneBetaMcg, ')
          ..write('chlorineMg: $chlorineMg, ')
          ..write('cholesterolMg: $cholesterolMg, ')
          ..write('cholineMg: $cholineMg, ')
          ..write('copperCuMg: $copperCuMg, ')
          ..write('created: $created, ')
          ..write('cystineMg: $cystineMg, ')
          ..write('dihydrophylloquinoneMcg: $dihydrophylloquinoneMcg, ')
          ..write('fatG: $fatG, ')
          ..write(
              'fattyAcidsTotalMonounsaturatedMg: $fattyAcidsTotalMonounsaturatedMg, ')
          ..write(
              'fattyAcidsTotalPolyunsaturatedMg: $fattyAcidsTotalPolyunsaturatedMg, ')
          ..write('favorite: $favorite, ')
          ..write('fiberG: $fiberG, ')
          ..write('fluorideFMcg: $fluorideFMcg, ')
          ..write('folateB9Mcg: $folateB9Mcg, ')
          ..write('folateDfeMcg: $folateDfeMcg, ')
          ..write('folicAcidMcg: $folicAcidMcg, ')
          ..write('foodFolateMcg: $foodFolateMcg, ')
          ..write('foodGroup: $foodGroup, ')
          ..write('fructoseG: $fructoseG, ')
          ..write('galactoseG: $galactoseG, ')
          ..write('glucoseDextroseG: $glucoseDextroseG, ')
          ..write('glutamicAcidMg: $glutamicAcidMg, ')
          ..write('glycineMg: $glycineMg, ')
          ..write('histidineMg: $histidineMg, ')
          ..write('hydroxyprolineMg: $hydroxyprolineMg, ')
          ..write('id: $id, ')
          ..write('imageFile: $imageFile, ')
          ..write('insolubleFiberG: $insolubleFiberG, ')
          ..write('ironFeMg: $ironFeMg, ')
          ..write('isoleucineMg: $isoleucineMg, ')
          ..write('lactoseG: $lactoseG, ')
          ..write('leucineMg: $leucineMg, ')
          ..write('luteinZeaxanthinMcg: $luteinZeaxanthinMcg, ')
          ..write('lycopeneMcg: $lycopeneMcg, ')
          ..write('lysineMg: $lysineMg, ')
          ..write('magnesiumMg: $magnesiumMg, ')
          ..write('maltoseG: $maltoseG, ')
          ..write('manganeseMg: $manganeseMg, ')
          ..write('menaquinone4Mcg: $menaquinone4Mcg, ')
          ..write('methionineMg: $methionineMg, ')
          ..write('molybdenumMcg: $molybdenumMcg, ')
          ..write('name: $name, ')
          ..write('netCarbsG: $netCarbsG, ')
          ..write('niacinB3Mg: $niacinB3Mg, ')
          ..write('omega3sMg: $omega3sMg, ')
          ..write('omega6sMg: $omega6sMg, ')
          ..write('pantothenicAcidB5Mg: $pantothenicAcidB5Mg, ')
          ..write('phenylalanineMg: $phenylalanineMg, ')
          ..write('phosphorusPMg: $phosphorusPMg, ')
          ..write('potassiumKMg: $potassiumKMg, ')
          ..write('pralScore: $pralScore, ')
          ..write('prolineMg: $prolineMg, ')
          ..write('proteinG: $proteinG, ')
          ..write('retinolMcg: $retinolMcg, ')
          ..write('riboflavinB2Mg: $riboflavinB2Mg, ')
          ..write('saturatedFatsG: $saturatedFatsG, ')
          ..write('seleniumSeMcg: $seleniumSeMcg, ')
          ..write('serineMg: $serineMg, ')
          ..write('servingDescription1G: $servingDescription1G, ')
          ..write('servingDescription2G: $servingDescription2G, ')
          ..write('servingDescription3G: $servingDescription3G, ')
          ..write('servingDescription4G: $servingDescription4G, ')
          ..write('servingDescription5G: $servingDescription5G, ')
          ..write('servingDescription6G: $servingDescription6G, ')
          ..write('servingDescription7G: $servingDescription7G, ')
          ..write('servingDescription8G: $servingDescription8G, ')
          ..write('servingDescription9G: $servingDescription9G, ')
          ..write('servingSize: $servingSize, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('servingWeight1G: $servingWeight1G, ')
          ..write('servingWeight2G: $servingWeight2G, ')
          ..write('servingWeight3G: $servingWeight3G, ')
          ..write('servingWeight4G: $servingWeight4G, ')
          ..write('servingWeight5G: $servingWeight5G, ')
          ..write('servingWeight6G: $servingWeight6G, ')
          ..write('servingWeight7G: $servingWeight7G, ')
          ..write('servingWeight8G: $servingWeight8G, ')
          ..write('servingWeight9G: $servingWeight9G, ')
          ..write('smallImage: $smallImage, ')
          ..write('sodiumMg: $sodiumMg, ')
          ..write('solubleFiberG: $solubleFiberG, ')
          ..write('starchG: $starchG, ')
          ..write('sucroseG: $sucroseG, ')
          ..write('sugarsG: $sugarsG, ')
          ..write('theobromineMg: $theobromineMg, ')
          ..write('thiaminB1Mg: $thiaminB1Mg, ')
          ..write('threonineMg: $threonineMg, ')
          ..write('totalSugarAlcoholsG: $totalSugarAlcoholsG, ')
          ..write('transFattyAcidsG: $transFattyAcidsG, ')
          ..write('tryptophanMg: $tryptophanMg, ')
          ..write('tyrosineMg: $tyrosineMg, ')
          ..write('u183N3CCCAlaMg: $u183N3CCCAlaMg, ')
          ..write('u200calorieWeightG: $u200calorieWeightG, ')
          ..write('u205N3EpaMg: $u205N3EpaMg, ')
          ..write('u225N3DpaMg: $u225N3DpaMg, ')
          ..write('u226N3DhaMg: $u226N3DhaMg, ')
          ..write('valineMg: $valineMg, ')
          ..write('vitaminAIuIu: $vitaminAIuIu, ')
          ..write('vitaminARaeMcg: $vitaminARaeMcg, ')
          ..write('vitaminB12Mcg: $vitaminB12Mcg, ')
          ..write('vitaminB6Mg: $vitaminB6Mg, ')
          ..write('vitaminCMg: $vitaminCMg, ')
          ..write('vitaminD2ErgocalciferolMcg: $vitaminD2ErgocalciferolMcg, ')
          ..write('vitaminD3CholecalciferolMcg: $vitaminD3CholecalciferolMcg, ')
          ..write('vitaminDIuIu: $vitaminDIuIu, ')
          ..write('vitaminDMcg: $vitaminDMcg, ')
          ..write('vitaminEAlphaTocopherolMg: $vitaminEAlphaTocopherolMg, ')
          ..write('vitaminKMcg: $vitaminKMcg, ')
          ..write('waterG: $waterG, ')
          ..write('zincZnMg: $zincZnMg')
          ..write(')'))
        .toString();
  }
}

class $EntriesTable extends Entries with TableInfo<$EntriesTable, Entry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _foodMeta = const VerificationMeta('food');
  @override
  late final GeneratedColumn<int> food = GeneratedColumn<int>(
      'food', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES foods (id)'));
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kCaloriesMeta =
      const VerificationMeta('kCalories');
  @override
  late final GeneratedColumn<double> kCalories = GeneratedColumn<double>(
      'k_calories', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _proteinGMeta =
      const VerificationMeta('proteinG');
  @override
  late final GeneratedColumn<double> proteinG = GeneratedColumn<double>(
      'protein_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fatGMeta = const VerificationMeta('fatG');
  @override
  late final GeneratedColumn<double> fatG = GeneratedColumn<double>(
      'fat_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _carbGMeta = const VerificationMeta('carbG');
  @override
  late final GeneratedColumn<double> carbG = GeneratedColumn<double>(
      'carb_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, food, created, quantity, unit, kCalories, proteinG, fatG, carbG];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entries';
  @override
  VerificationContext validateIntegrity(Insertable<Entry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('food')) {
      context.handle(
          _foodMeta, food.isAcceptableOrUnknown(data['food']!, _foodMeta));
    } else if (isInserting) {
      context.missing(_foodMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('k_calories')) {
      context.handle(_kCaloriesMeta,
          kCalories.isAcceptableOrUnknown(data['k_calories']!, _kCaloriesMeta));
    }
    if (data.containsKey('protein_g')) {
      context.handle(_proteinGMeta,
          proteinG.isAcceptableOrUnknown(data['protein_g']!, _proteinGMeta));
    }
    if (data.containsKey('fat_g')) {
      context.handle(
          _fatGMeta, fatG.isAcceptableOrUnknown(data['fat_g']!, _fatGMeta));
    }
    if (data.containsKey('carb_g')) {
      context.handle(
          _carbGMeta, carbG.isAcceptableOrUnknown(data['carb_g']!, _carbGMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Entry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Entry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      food: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}food'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      kCalories: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}k_calories']),
      proteinG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein_g']),
      fatG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat_g']),
      carbG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carb_g']),
    );
  }

  @override
  $EntriesTable createAlias(String alias) {
    return $EntriesTable(attachedDatabase, alias);
  }
}

class Entry extends DataClass implements Insertable<Entry> {
  final int id;
  final int food;
  final DateTime created;
  final double quantity;
  final String unit;
  final double? kCalories;
  final double? proteinG;
  final double? fatG;
  final double? carbG;
  const Entry(
      {required this.id,
      required this.food,
      required this.created,
      required this.quantity,
      required this.unit,
      this.kCalories,
      this.proteinG,
      this.fatG,
      this.carbG});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['food'] = Variable<int>(food);
    map['created'] = Variable<DateTime>(created);
    map['quantity'] = Variable<double>(quantity);
    map['unit'] = Variable<String>(unit);
    if (!nullToAbsent || kCalories != null) {
      map['k_calories'] = Variable<double>(kCalories);
    }
    if (!nullToAbsent || proteinG != null) {
      map['protein_g'] = Variable<double>(proteinG);
    }
    if (!nullToAbsent || fatG != null) {
      map['fat_g'] = Variable<double>(fatG);
    }
    if (!nullToAbsent || carbG != null) {
      map['carb_g'] = Variable<double>(carbG);
    }
    return map;
  }

  EntriesCompanion toCompanion(bool nullToAbsent) {
    return EntriesCompanion(
      id: Value(id),
      food: Value(food),
      created: Value(created),
      quantity: Value(quantity),
      unit: Value(unit),
      kCalories: kCalories == null && nullToAbsent
          ? const Value.absent()
          : Value(kCalories),
      proteinG: proteinG == null && nullToAbsent
          ? const Value.absent()
          : Value(proteinG),
      fatG: fatG == null && nullToAbsent ? const Value.absent() : Value(fatG),
      carbG:
          carbG == null && nullToAbsent ? const Value.absent() : Value(carbG),
    );
  }

  factory Entry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Entry(
      id: serializer.fromJson<int>(json['id']),
      food: serializer.fromJson<int>(json['food']),
      created: serializer.fromJson<DateTime>(json['created']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unit: serializer.fromJson<String>(json['unit']),
      kCalories: serializer.fromJson<double?>(json['kCalories']),
      proteinG: serializer.fromJson<double?>(json['proteinG']),
      fatG: serializer.fromJson<double?>(json['fatG']),
      carbG: serializer.fromJson<double?>(json['carbG']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'food': serializer.toJson<int>(food),
      'created': serializer.toJson<DateTime>(created),
      'quantity': serializer.toJson<double>(quantity),
      'unit': serializer.toJson<String>(unit),
      'kCalories': serializer.toJson<double?>(kCalories),
      'proteinG': serializer.toJson<double?>(proteinG),
      'fatG': serializer.toJson<double?>(fatG),
      'carbG': serializer.toJson<double?>(carbG),
    };
  }

  Entry copyWith(
          {int? id,
          int? food,
          DateTime? created,
          double? quantity,
          String? unit,
          Value<double?> kCalories = const Value.absent(),
          Value<double?> proteinG = const Value.absent(),
          Value<double?> fatG = const Value.absent(),
          Value<double?> carbG = const Value.absent()}) =>
      Entry(
        id: id ?? this.id,
        food: food ?? this.food,
        created: created ?? this.created,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
        kCalories: kCalories.present ? kCalories.value : this.kCalories,
        proteinG: proteinG.present ? proteinG.value : this.proteinG,
        fatG: fatG.present ? fatG.value : this.fatG,
        carbG: carbG.present ? carbG.value : this.carbG,
      );
  Entry copyWithCompanion(EntriesCompanion data) {
    return Entry(
      id: data.id.present ? data.id.value : this.id,
      food: data.food.present ? data.food.value : this.food,
      created: data.created.present ? data.created.value : this.created,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unit: data.unit.present ? data.unit.value : this.unit,
      kCalories: data.kCalories.present ? data.kCalories.value : this.kCalories,
      proteinG: data.proteinG.present ? data.proteinG.value : this.proteinG,
      fatG: data.fatG.present ? data.fatG.value : this.fatG,
      carbG: data.carbG.present ? data.carbG.value : this.carbG,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Entry(')
          ..write('id: $id, ')
          ..write('food: $food, ')
          ..write('created: $created, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('kCalories: $kCalories, ')
          ..write('proteinG: $proteinG, ')
          ..write('fatG: $fatG, ')
          ..write('carbG: $carbG')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, food, created, quantity, unit, kCalories, proteinG, fatG, carbG);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Entry &&
          other.id == this.id &&
          other.food == this.food &&
          other.created == this.created &&
          other.quantity == this.quantity &&
          other.unit == this.unit &&
          other.kCalories == this.kCalories &&
          other.proteinG == this.proteinG &&
          other.fatG == this.fatG &&
          other.carbG == this.carbG);
}

class EntriesCompanion extends UpdateCompanion<Entry> {
  final Value<int> id;
  final Value<int> food;
  final Value<DateTime> created;
  final Value<double> quantity;
  final Value<String> unit;
  final Value<double?> kCalories;
  final Value<double?> proteinG;
  final Value<double?> fatG;
  final Value<double?> carbG;
  const EntriesCompanion({
    this.id = const Value.absent(),
    this.food = const Value.absent(),
    this.created = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.kCalories = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.fatG = const Value.absent(),
    this.carbG = const Value.absent(),
  });
  EntriesCompanion.insert({
    this.id = const Value.absent(),
    required int food,
    required DateTime created,
    required double quantity,
    required String unit,
    this.kCalories = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.fatG = const Value.absent(),
    this.carbG = const Value.absent(),
  })  : food = Value(food),
        created = Value(created),
        quantity = Value(quantity),
        unit = Value(unit);
  static Insertable<Entry> custom({
    Expression<int>? id,
    Expression<int>? food,
    Expression<DateTime>? created,
    Expression<double>? quantity,
    Expression<String>? unit,
    Expression<double>? kCalories,
    Expression<double>? proteinG,
    Expression<double>? fatG,
    Expression<double>? carbG,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (food != null) 'food': food,
      if (created != null) 'created': created,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
      if (kCalories != null) 'k_calories': kCalories,
      if (proteinG != null) 'protein_g': proteinG,
      if (fatG != null) 'fat_g': fatG,
      if (carbG != null) 'carb_g': carbG,
    });
  }

  EntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? food,
      Value<DateTime>? created,
      Value<double>? quantity,
      Value<String>? unit,
      Value<double?>? kCalories,
      Value<double?>? proteinG,
      Value<double?>? fatG,
      Value<double?>? carbG}) {
    return EntriesCompanion(
      id: id ?? this.id,
      food: food ?? this.food,
      created: created ?? this.created,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      kCalories: kCalories ?? this.kCalories,
      proteinG: proteinG ?? this.proteinG,
      fatG: fatG ?? this.fatG,
      carbG: carbG ?? this.carbG,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (food.present) {
      map['food'] = Variable<int>(food.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (kCalories.present) {
      map['k_calories'] = Variable<double>(kCalories.value);
    }
    if (proteinG.present) {
      map['protein_g'] = Variable<double>(proteinG.value);
    }
    if (fatG.present) {
      map['fat_g'] = Variable<double>(fatG.value);
    }
    if (carbG.present) {
      map['carb_g'] = Variable<double>(carbG.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntriesCompanion(')
          ..write('id: $id, ')
          ..write('food: $food, ')
          ..write('created: $created, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('kCalories: $kCalories, ')
          ..write('proteinG: $proteinG, ')
          ..write('fatG: $fatG, ')
          ..write('carbG: $carbG')
          ..write(')'))
        .toString();
  }
}

class $WeightsTable extends Weights with TableInfo<$WeightsTable, Weight> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, created, unit, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weights';
  @override
  VerificationContext validateIntegrity(Insertable<Weight> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Weight map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Weight(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $WeightsTable createAlias(String alias) {
    return $WeightsTable(attachedDatabase, alias);
  }
}

class Weight extends DataClass implements Insertable<Weight> {
  final int id;
  final DateTime created;
  final String unit;
  final double amount;
  const Weight(
      {required this.id,
      required this.created,
      required this.unit,
      required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created'] = Variable<DateTime>(created);
    map['unit'] = Variable<String>(unit);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  WeightsCompanion toCompanion(bool nullToAbsent) {
    return WeightsCompanion(
      id: Value(id),
      created: Value(created),
      unit: Value(unit),
      amount: Value(amount),
    );
  }

  factory Weight.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Weight(
      id: serializer.fromJson<int>(json['id']),
      created: serializer.fromJson<DateTime>(json['created']),
      unit: serializer.fromJson<String>(json['unit']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'created': serializer.toJson<DateTime>(created),
      'unit': serializer.toJson<String>(unit),
      'amount': serializer.toJson<double>(amount),
    };
  }

  Weight copyWith({int? id, DateTime? created, String? unit, double? amount}) =>
      Weight(
        id: id ?? this.id,
        created: created ?? this.created,
        unit: unit ?? this.unit,
        amount: amount ?? this.amount,
      );
  Weight copyWithCompanion(WeightsCompanion data) {
    return Weight(
      id: data.id.present ? data.id.value : this.id,
      created: data.created.present ? data.created.value : this.created,
      unit: data.unit.present ? data.unit.value : this.unit,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Weight(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('unit: $unit, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, created, unit, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Weight &&
          other.id == this.id &&
          other.created == this.created &&
          other.unit == this.unit &&
          other.amount == this.amount);
}

class WeightsCompanion extends UpdateCompanion<Weight> {
  final Value<int> id;
  final Value<DateTime> created;
  final Value<String> unit;
  final Value<double> amount;
  const WeightsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.unit = const Value.absent(),
    this.amount = const Value.absent(),
  });
  WeightsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime created,
    required String unit,
    required double amount,
  })  : created = Value(created),
        unit = Value(unit),
        amount = Value(amount);
  static Insertable<Weight> custom({
    Expression<int>? id,
    Expression<DateTime>? created,
    Expression<String>? unit,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (unit != null) 'unit': unit,
      if (amount != null) 'amount': amount,
    });
  }

  WeightsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? created,
      Value<String>? unit,
      Value<double>? amount}) {
    return WeightsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      unit: unit ?? this.unit,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightsCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('unit: $unit, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _curveLinesMeta =
      const VerificationMeta('curveLines');
  @override
  late final GeneratedColumn<bool> curveLines = GeneratedColumn<bool>(
      'curve_lines', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("curve_lines" IN (0, 1))'));
  static const VerificationMeta _dailyCaloriesMeta =
      const VerificationMeta('dailyCalories');
  @override
  late final GeneratedColumn<int> dailyCalories = GeneratedColumn<int>(
      'daily_calories', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dailyCarbMeta =
      const VerificationMeta('dailyCarb');
  @override
  late final GeneratedColumn<int> dailyCarb = GeneratedColumn<int>(
      'daily_carb', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dailyFatMeta =
      const VerificationMeta('dailyFat');
  @override
  late final GeneratedColumn<int> dailyFat = GeneratedColumn<int>(
      'daily_fat', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dailyProteinMeta =
      const VerificationMeta('dailyProtein');
  @override
  late final GeneratedColumn<int> dailyProtein = GeneratedColumn<int>(
      'daily_protein', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _diarySummaryMeta =
      const VerificationMeta('diarySummary');
  @override
  late final GeneratedColumn<String> diarySummary = GeneratedColumn<String>(
      'diary_summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entryUnitMeta =
      const VerificationMeta('entryUnit');
  @override
  late final GeneratedColumn<String> entryUnit = GeneratedColumn<String>(
      'entry_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _favoriteNewMeta =
      const VerificationMeta('favoriteNew');
  @override
  late final GeneratedColumn<bool> favoriteNew = GeneratedColumn<bool>(
      'favorite_new', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("favorite_new" IN (0, 1))'));
  static const VerificationMeta _foodUnitMeta =
      const VerificationMeta('foodUnit');
  @override
  late final GeneratedColumn<String> foodUnit = GeneratedColumn<String>(
      'food_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _longDateFormatMeta =
      const VerificationMeta('longDateFormat');
  @override
  late final GeneratedColumn<String> longDateFormat = GeneratedColumn<String>(
      'long_date_format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _offLoginMeta =
      const VerificationMeta('offLogin');
  @override
  late final GeneratedColumn<String> offLogin = GeneratedColumn<String>(
      'off_login', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _offPasswordMeta =
      const VerificationMeta('offPassword');
  @override
  late final GeneratedColumn<String> offPassword = GeneratedColumn<String>(
      'off_password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _positiveReinforcementMeta =
      const VerificationMeta('positiveReinforcement');
  @override
  late final GeneratedColumn<bool> positiveReinforcement =
      GeneratedColumn<bool>('positive_reinforcement', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("positive_reinforcement" IN (0, 1))'),
          defaultValue: const Constant(true));
  static const VerificationMeta _remindersMeta =
      const VerificationMeta('reminders');
  @override
  late final GeneratedColumn<bool> reminders = GeneratedColumn<bool>(
      'reminders', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("reminders" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _selectEntryOnSubmitMeta =
      const VerificationMeta('selectEntryOnSubmit');
  @override
  late final GeneratedColumn<bool> selectEntryOnSubmit = GeneratedColumn<bool>(
      'select_entry_on_submit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("select_entry_on_submit" IN (0, 1))'));
  static const VerificationMeta _shortDateFormatMeta =
      const VerificationMeta('shortDateFormat');
  @override
  late final GeneratedColumn<String> shortDateFormat = GeneratedColumn<String>(
      'short_date_format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _showImagesMeta =
      const VerificationMeta('showImages');
  @override
  late final GeneratedColumn<bool> showImages = GeneratedColumn<bool>(
      'show_images', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("show_images" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _showOthersMeta =
      const VerificationMeta('showOthers');
  @override
  late final GeneratedColumn<bool> showOthers = GeneratedColumn<bool>(
      'show_others', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("show_others" IN (0, 1))'));
  static const VerificationMeta _systemColorsMeta =
      const VerificationMeta('systemColors');
  @override
  late final GeneratedColumn<bool> systemColors = GeneratedColumn<bool>(
      'system_colors', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("system_colors" IN (0, 1))'));
  static const VerificationMeta _targetWeightMeta =
      const VerificationMeta('targetWeight');
  @override
  late final GeneratedColumn<double> targetWeight = GeneratedColumn<double>(
      'target_weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _themeModeMeta =
      const VerificationMeta('themeMode');
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
      'theme_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tabsMeta = const VerificationMeta('tabs');
  @override
  late final GeneratedColumn<String> tabs = GeneratedColumn<String>(
      'tabs', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("DiaryPage,GraphPage,FoodPage,WeightPage"));
  @override
  List<GeneratedColumn> get $columns => [
        curveLines,
        dailyCalories,
        dailyCarb,
        dailyFat,
        dailyProtein,
        diarySummary,
        entryUnit,
        favoriteNew,
        foodUnit,
        id,
        longDateFormat,
        offLogin,
        offPassword,
        positiveReinforcement,
        reminders,
        selectEntryOnSubmit,
        shortDateFormat,
        showImages,
        showOthers,
        systemColors,
        targetWeight,
        themeMode,
        tabs
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('curve_lines')) {
      context.handle(
          _curveLinesMeta,
          curveLines.isAcceptableOrUnknown(
              data['curve_lines']!, _curveLinesMeta));
    } else if (isInserting) {
      context.missing(_curveLinesMeta);
    }
    if (data.containsKey('daily_calories')) {
      context.handle(
          _dailyCaloriesMeta,
          dailyCalories.isAcceptableOrUnknown(
              data['daily_calories']!, _dailyCaloriesMeta));
    }
    if (data.containsKey('daily_carb')) {
      context.handle(_dailyCarbMeta,
          dailyCarb.isAcceptableOrUnknown(data['daily_carb']!, _dailyCarbMeta));
    }
    if (data.containsKey('daily_fat')) {
      context.handle(_dailyFatMeta,
          dailyFat.isAcceptableOrUnknown(data['daily_fat']!, _dailyFatMeta));
    }
    if (data.containsKey('daily_protein')) {
      context.handle(
          _dailyProteinMeta,
          dailyProtein.isAcceptableOrUnknown(
              data['daily_protein']!, _dailyProteinMeta));
    }
    if (data.containsKey('diary_summary')) {
      context.handle(
          _diarySummaryMeta,
          diarySummary.isAcceptableOrUnknown(
              data['diary_summary']!, _diarySummaryMeta));
    } else if (isInserting) {
      context.missing(_diarySummaryMeta);
    }
    if (data.containsKey('entry_unit')) {
      context.handle(_entryUnitMeta,
          entryUnit.isAcceptableOrUnknown(data['entry_unit']!, _entryUnitMeta));
    } else if (isInserting) {
      context.missing(_entryUnitMeta);
    }
    if (data.containsKey('favorite_new')) {
      context.handle(
          _favoriteNewMeta,
          favoriteNew.isAcceptableOrUnknown(
              data['favorite_new']!, _favoriteNewMeta));
    } else if (isInserting) {
      context.missing(_favoriteNewMeta);
    }
    if (data.containsKey('food_unit')) {
      context.handle(_foodUnitMeta,
          foodUnit.isAcceptableOrUnknown(data['food_unit']!, _foodUnitMeta));
    } else if (isInserting) {
      context.missing(_foodUnitMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('long_date_format')) {
      context.handle(
          _longDateFormatMeta,
          longDateFormat.isAcceptableOrUnknown(
              data['long_date_format']!, _longDateFormatMeta));
    } else if (isInserting) {
      context.missing(_longDateFormatMeta);
    }
    if (data.containsKey('off_login')) {
      context.handle(_offLoginMeta,
          offLogin.isAcceptableOrUnknown(data['off_login']!, _offLoginMeta));
    }
    if (data.containsKey('off_password')) {
      context.handle(
          _offPasswordMeta,
          offPassword.isAcceptableOrUnknown(
              data['off_password']!, _offPasswordMeta));
    }
    if (data.containsKey('positive_reinforcement')) {
      context.handle(
          _positiveReinforcementMeta,
          positiveReinforcement.isAcceptableOrUnknown(
              data['positive_reinforcement']!, _positiveReinforcementMeta));
    }
    if (data.containsKey('reminders')) {
      context.handle(_remindersMeta,
          reminders.isAcceptableOrUnknown(data['reminders']!, _remindersMeta));
    }
    if (data.containsKey('select_entry_on_submit')) {
      context.handle(
          _selectEntryOnSubmitMeta,
          selectEntryOnSubmit.isAcceptableOrUnknown(
              data['select_entry_on_submit']!, _selectEntryOnSubmitMeta));
    } else if (isInserting) {
      context.missing(_selectEntryOnSubmitMeta);
    }
    if (data.containsKey('short_date_format')) {
      context.handle(
          _shortDateFormatMeta,
          shortDateFormat.isAcceptableOrUnknown(
              data['short_date_format']!, _shortDateFormatMeta));
    } else if (isInserting) {
      context.missing(_shortDateFormatMeta);
    }
    if (data.containsKey('show_images')) {
      context.handle(
          _showImagesMeta,
          showImages.isAcceptableOrUnknown(
              data['show_images']!, _showImagesMeta));
    }
    if (data.containsKey('show_others')) {
      context.handle(
          _showOthersMeta,
          showOthers.isAcceptableOrUnknown(
              data['show_others']!, _showOthersMeta));
    } else if (isInserting) {
      context.missing(_showOthersMeta);
    }
    if (data.containsKey('system_colors')) {
      context.handle(
          _systemColorsMeta,
          systemColors.isAcceptableOrUnknown(
              data['system_colors']!, _systemColorsMeta));
    } else if (isInserting) {
      context.missing(_systemColorsMeta);
    }
    if (data.containsKey('target_weight')) {
      context.handle(
          _targetWeightMeta,
          targetWeight.isAcceptableOrUnknown(
              data['target_weight']!, _targetWeightMeta));
    }
    if (data.containsKey('theme_mode')) {
      context.handle(_themeModeMeta,
          themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta));
    } else if (isInserting) {
      context.missing(_themeModeMeta);
    }
    if (data.containsKey('tabs')) {
      context.handle(
          _tabsMeta, tabs.isAcceptableOrUnknown(data['tabs']!, _tabsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      curveLines: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}curve_lines'])!,
      dailyCalories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}daily_calories']),
      dailyCarb: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}daily_carb']),
      dailyFat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}daily_fat']),
      dailyProtein: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}daily_protein']),
      diarySummary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}diary_summary'])!,
      entryUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entry_unit'])!,
      favoriteNew: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}favorite_new'])!,
      foodUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_unit'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      longDateFormat: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}long_date_format'])!,
      offLogin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}off_login']),
      offPassword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}off_password']),
      positiveReinforcement: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}positive_reinforcement'])!,
      reminders: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}reminders'])!,
      selectEntryOnSubmit: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}select_entry_on_submit'])!,
      shortDateFormat: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_date_format'])!,
      showImages: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}show_images'])!,
      showOthers: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}show_others'])!,
      systemColors: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}system_colors'])!,
      targetWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}target_weight']),
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_mode'])!,
      tabs: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tabs'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final bool curveLines;
  final int? dailyCalories;
  final int? dailyCarb;
  final int? dailyFat;
  final int? dailyProtein;
  final String diarySummary;
  final String entryUnit;
  final bool favoriteNew;
  final String foodUnit;
  final int id;
  final String longDateFormat;
  final String? offLogin;
  final String? offPassword;
  final bool positiveReinforcement;
  final bool reminders;
  final bool selectEntryOnSubmit;
  final String shortDateFormat;
  final bool showImages;
  final bool showOthers;
  final bool systemColors;
  final double? targetWeight;
  final String themeMode;
  final String tabs;
  const Setting(
      {required this.curveLines,
      this.dailyCalories,
      this.dailyCarb,
      this.dailyFat,
      this.dailyProtein,
      required this.diarySummary,
      required this.entryUnit,
      required this.favoriteNew,
      required this.foodUnit,
      required this.id,
      required this.longDateFormat,
      this.offLogin,
      this.offPassword,
      required this.positiveReinforcement,
      required this.reminders,
      required this.selectEntryOnSubmit,
      required this.shortDateFormat,
      required this.showImages,
      required this.showOthers,
      required this.systemColors,
      this.targetWeight,
      required this.themeMode,
      required this.tabs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['curve_lines'] = Variable<bool>(curveLines);
    if (!nullToAbsent || dailyCalories != null) {
      map['daily_calories'] = Variable<int>(dailyCalories);
    }
    if (!nullToAbsent || dailyCarb != null) {
      map['daily_carb'] = Variable<int>(dailyCarb);
    }
    if (!nullToAbsent || dailyFat != null) {
      map['daily_fat'] = Variable<int>(dailyFat);
    }
    if (!nullToAbsent || dailyProtein != null) {
      map['daily_protein'] = Variable<int>(dailyProtein);
    }
    map['diary_summary'] = Variable<String>(diarySummary);
    map['entry_unit'] = Variable<String>(entryUnit);
    map['favorite_new'] = Variable<bool>(favoriteNew);
    map['food_unit'] = Variable<String>(foodUnit);
    map['id'] = Variable<int>(id);
    map['long_date_format'] = Variable<String>(longDateFormat);
    if (!nullToAbsent || offLogin != null) {
      map['off_login'] = Variable<String>(offLogin);
    }
    if (!nullToAbsent || offPassword != null) {
      map['off_password'] = Variable<String>(offPassword);
    }
    map['positive_reinforcement'] = Variable<bool>(positiveReinforcement);
    map['reminders'] = Variable<bool>(reminders);
    map['select_entry_on_submit'] = Variable<bool>(selectEntryOnSubmit);
    map['short_date_format'] = Variable<String>(shortDateFormat);
    map['show_images'] = Variable<bool>(showImages);
    map['show_others'] = Variable<bool>(showOthers);
    map['system_colors'] = Variable<bool>(systemColors);
    if (!nullToAbsent || targetWeight != null) {
      map['target_weight'] = Variable<double>(targetWeight);
    }
    map['theme_mode'] = Variable<String>(themeMode);
    map['tabs'] = Variable<String>(tabs);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      curveLines: Value(curveLines),
      dailyCalories: dailyCalories == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyCalories),
      dailyCarb: dailyCarb == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyCarb),
      dailyFat: dailyFat == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyFat),
      dailyProtein: dailyProtein == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyProtein),
      diarySummary: Value(diarySummary),
      entryUnit: Value(entryUnit),
      favoriteNew: Value(favoriteNew),
      foodUnit: Value(foodUnit),
      id: Value(id),
      longDateFormat: Value(longDateFormat),
      offLogin: offLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(offLogin),
      offPassword: offPassword == null && nullToAbsent
          ? const Value.absent()
          : Value(offPassword),
      positiveReinforcement: Value(positiveReinforcement),
      reminders: Value(reminders),
      selectEntryOnSubmit: Value(selectEntryOnSubmit),
      shortDateFormat: Value(shortDateFormat),
      showImages: Value(showImages),
      showOthers: Value(showOthers),
      systemColors: Value(systemColors),
      targetWeight: targetWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(targetWeight),
      themeMode: Value(themeMode),
      tabs: Value(tabs),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      curveLines: serializer.fromJson<bool>(json['curveLines']),
      dailyCalories: serializer.fromJson<int?>(json['dailyCalories']),
      dailyCarb: serializer.fromJson<int?>(json['dailyCarb']),
      dailyFat: serializer.fromJson<int?>(json['dailyFat']),
      dailyProtein: serializer.fromJson<int?>(json['dailyProtein']),
      diarySummary: serializer.fromJson<String>(json['diarySummary']),
      entryUnit: serializer.fromJson<String>(json['entryUnit']),
      favoriteNew: serializer.fromJson<bool>(json['favoriteNew']),
      foodUnit: serializer.fromJson<String>(json['foodUnit']),
      id: serializer.fromJson<int>(json['id']),
      longDateFormat: serializer.fromJson<String>(json['longDateFormat']),
      offLogin: serializer.fromJson<String?>(json['offLogin']),
      offPassword: serializer.fromJson<String?>(json['offPassword']),
      positiveReinforcement:
          serializer.fromJson<bool>(json['positiveReinforcement']),
      reminders: serializer.fromJson<bool>(json['reminders']),
      selectEntryOnSubmit:
          serializer.fromJson<bool>(json['selectEntryOnSubmit']),
      shortDateFormat: serializer.fromJson<String>(json['shortDateFormat']),
      showImages: serializer.fromJson<bool>(json['showImages']),
      showOthers: serializer.fromJson<bool>(json['showOthers']),
      systemColors: serializer.fromJson<bool>(json['systemColors']),
      targetWeight: serializer.fromJson<double?>(json['targetWeight']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      tabs: serializer.fromJson<String>(json['tabs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'curveLines': serializer.toJson<bool>(curveLines),
      'dailyCalories': serializer.toJson<int?>(dailyCalories),
      'dailyCarb': serializer.toJson<int?>(dailyCarb),
      'dailyFat': serializer.toJson<int?>(dailyFat),
      'dailyProtein': serializer.toJson<int?>(dailyProtein),
      'diarySummary': serializer.toJson<String>(diarySummary),
      'entryUnit': serializer.toJson<String>(entryUnit),
      'favoriteNew': serializer.toJson<bool>(favoriteNew),
      'foodUnit': serializer.toJson<String>(foodUnit),
      'id': serializer.toJson<int>(id),
      'longDateFormat': serializer.toJson<String>(longDateFormat),
      'offLogin': serializer.toJson<String?>(offLogin),
      'offPassword': serializer.toJson<String?>(offPassword),
      'positiveReinforcement': serializer.toJson<bool>(positiveReinforcement),
      'reminders': serializer.toJson<bool>(reminders),
      'selectEntryOnSubmit': serializer.toJson<bool>(selectEntryOnSubmit),
      'shortDateFormat': serializer.toJson<String>(shortDateFormat),
      'showImages': serializer.toJson<bool>(showImages),
      'showOthers': serializer.toJson<bool>(showOthers),
      'systemColors': serializer.toJson<bool>(systemColors),
      'targetWeight': serializer.toJson<double?>(targetWeight),
      'themeMode': serializer.toJson<String>(themeMode),
      'tabs': serializer.toJson<String>(tabs),
    };
  }

  Setting copyWith(
          {bool? curveLines,
          Value<int?> dailyCalories = const Value.absent(),
          Value<int?> dailyCarb = const Value.absent(),
          Value<int?> dailyFat = const Value.absent(),
          Value<int?> dailyProtein = const Value.absent(),
          String? diarySummary,
          String? entryUnit,
          bool? favoriteNew,
          String? foodUnit,
          int? id,
          String? longDateFormat,
          Value<String?> offLogin = const Value.absent(),
          Value<String?> offPassword = const Value.absent(),
          bool? positiveReinforcement,
          bool? reminders,
          bool? selectEntryOnSubmit,
          String? shortDateFormat,
          bool? showImages,
          bool? showOthers,
          bool? systemColors,
          Value<double?> targetWeight = const Value.absent(),
          String? themeMode,
          String? tabs}) =>
      Setting(
        curveLines: curveLines ?? this.curveLines,
        dailyCalories:
            dailyCalories.present ? dailyCalories.value : this.dailyCalories,
        dailyCarb: dailyCarb.present ? dailyCarb.value : this.dailyCarb,
        dailyFat: dailyFat.present ? dailyFat.value : this.dailyFat,
        dailyProtein:
            dailyProtein.present ? dailyProtein.value : this.dailyProtein,
        diarySummary: diarySummary ?? this.diarySummary,
        entryUnit: entryUnit ?? this.entryUnit,
        favoriteNew: favoriteNew ?? this.favoriteNew,
        foodUnit: foodUnit ?? this.foodUnit,
        id: id ?? this.id,
        longDateFormat: longDateFormat ?? this.longDateFormat,
        offLogin: offLogin.present ? offLogin.value : this.offLogin,
        offPassword: offPassword.present ? offPassword.value : this.offPassword,
        positiveReinforcement:
            positiveReinforcement ?? this.positiveReinforcement,
        reminders: reminders ?? this.reminders,
        selectEntryOnSubmit: selectEntryOnSubmit ?? this.selectEntryOnSubmit,
        shortDateFormat: shortDateFormat ?? this.shortDateFormat,
        showImages: showImages ?? this.showImages,
        showOthers: showOthers ?? this.showOthers,
        systemColors: systemColors ?? this.systemColors,
        targetWeight:
            targetWeight.present ? targetWeight.value : this.targetWeight,
        themeMode: themeMode ?? this.themeMode,
        tabs: tabs ?? this.tabs,
      );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      curveLines:
          data.curveLines.present ? data.curveLines.value : this.curveLines,
      dailyCalories: data.dailyCalories.present
          ? data.dailyCalories.value
          : this.dailyCalories,
      dailyCarb: data.dailyCarb.present ? data.dailyCarb.value : this.dailyCarb,
      dailyFat: data.dailyFat.present ? data.dailyFat.value : this.dailyFat,
      dailyProtein: data.dailyProtein.present
          ? data.dailyProtein.value
          : this.dailyProtein,
      diarySummary: data.diarySummary.present
          ? data.diarySummary.value
          : this.diarySummary,
      entryUnit: data.entryUnit.present ? data.entryUnit.value : this.entryUnit,
      favoriteNew:
          data.favoriteNew.present ? data.favoriteNew.value : this.favoriteNew,
      foodUnit: data.foodUnit.present ? data.foodUnit.value : this.foodUnit,
      id: data.id.present ? data.id.value : this.id,
      longDateFormat: data.longDateFormat.present
          ? data.longDateFormat.value
          : this.longDateFormat,
      offLogin: data.offLogin.present ? data.offLogin.value : this.offLogin,
      offPassword:
          data.offPassword.present ? data.offPassword.value : this.offPassword,
      positiveReinforcement: data.positiveReinforcement.present
          ? data.positiveReinforcement.value
          : this.positiveReinforcement,
      reminders: data.reminders.present ? data.reminders.value : this.reminders,
      selectEntryOnSubmit: data.selectEntryOnSubmit.present
          ? data.selectEntryOnSubmit.value
          : this.selectEntryOnSubmit,
      shortDateFormat: data.shortDateFormat.present
          ? data.shortDateFormat.value
          : this.shortDateFormat,
      showImages:
          data.showImages.present ? data.showImages.value : this.showImages,
      showOthers:
          data.showOthers.present ? data.showOthers.value : this.showOthers,
      systemColors: data.systemColors.present
          ? data.systemColors.value
          : this.systemColors,
      targetWeight: data.targetWeight.present
          ? data.targetWeight.value
          : this.targetWeight,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      tabs: data.tabs.present ? data.tabs.value : this.tabs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('curveLines: $curveLines, ')
          ..write('dailyCalories: $dailyCalories, ')
          ..write('dailyCarb: $dailyCarb, ')
          ..write('dailyFat: $dailyFat, ')
          ..write('dailyProtein: $dailyProtein, ')
          ..write('diarySummary: $diarySummary, ')
          ..write('entryUnit: $entryUnit, ')
          ..write('favoriteNew: $favoriteNew, ')
          ..write('foodUnit: $foodUnit, ')
          ..write('id: $id, ')
          ..write('longDateFormat: $longDateFormat, ')
          ..write('offLogin: $offLogin, ')
          ..write('offPassword: $offPassword, ')
          ..write('positiveReinforcement: $positiveReinforcement, ')
          ..write('reminders: $reminders, ')
          ..write('selectEntryOnSubmit: $selectEntryOnSubmit, ')
          ..write('shortDateFormat: $shortDateFormat, ')
          ..write('showImages: $showImages, ')
          ..write('showOthers: $showOthers, ')
          ..write('systemColors: $systemColors, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('themeMode: $themeMode, ')
          ..write('tabs: $tabs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        curveLines,
        dailyCalories,
        dailyCarb,
        dailyFat,
        dailyProtein,
        diarySummary,
        entryUnit,
        favoriteNew,
        foodUnit,
        id,
        longDateFormat,
        offLogin,
        offPassword,
        positiveReinforcement,
        reminders,
        selectEntryOnSubmit,
        shortDateFormat,
        showImages,
        showOthers,
        systemColors,
        targetWeight,
        themeMode,
        tabs
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.curveLines == this.curveLines &&
          other.dailyCalories == this.dailyCalories &&
          other.dailyCarb == this.dailyCarb &&
          other.dailyFat == this.dailyFat &&
          other.dailyProtein == this.dailyProtein &&
          other.diarySummary == this.diarySummary &&
          other.entryUnit == this.entryUnit &&
          other.favoriteNew == this.favoriteNew &&
          other.foodUnit == this.foodUnit &&
          other.id == this.id &&
          other.longDateFormat == this.longDateFormat &&
          other.offLogin == this.offLogin &&
          other.offPassword == this.offPassword &&
          other.positiveReinforcement == this.positiveReinforcement &&
          other.reminders == this.reminders &&
          other.selectEntryOnSubmit == this.selectEntryOnSubmit &&
          other.shortDateFormat == this.shortDateFormat &&
          other.showImages == this.showImages &&
          other.showOthers == this.showOthers &&
          other.systemColors == this.systemColors &&
          other.targetWeight == this.targetWeight &&
          other.themeMode == this.themeMode &&
          other.tabs == this.tabs);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<bool> curveLines;
  final Value<int?> dailyCalories;
  final Value<int?> dailyCarb;
  final Value<int?> dailyFat;
  final Value<int?> dailyProtein;
  final Value<String> diarySummary;
  final Value<String> entryUnit;
  final Value<bool> favoriteNew;
  final Value<String> foodUnit;
  final Value<int> id;
  final Value<String> longDateFormat;
  final Value<String?> offLogin;
  final Value<String?> offPassword;
  final Value<bool> positiveReinforcement;
  final Value<bool> reminders;
  final Value<bool> selectEntryOnSubmit;
  final Value<String> shortDateFormat;
  final Value<bool> showImages;
  final Value<bool> showOthers;
  final Value<bool> systemColors;
  final Value<double?> targetWeight;
  final Value<String> themeMode;
  final Value<String> tabs;
  const SettingsCompanion({
    this.curveLines = const Value.absent(),
    this.dailyCalories = const Value.absent(),
    this.dailyCarb = const Value.absent(),
    this.dailyFat = const Value.absent(),
    this.dailyProtein = const Value.absent(),
    this.diarySummary = const Value.absent(),
    this.entryUnit = const Value.absent(),
    this.favoriteNew = const Value.absent(),
    this.foodUnit = const Value.absent(),
    this.id = const Value.absent(),
    this.longDateFormat = const Value.absent(),
    this.offLogin = const Value.absent(),
    this.offPassword = const Value.absent(),
    this.positiveReinforcement = const Value.absent(),
    this.reminders = const Value.absent(),
    this.selectEntryOnSubmit = const Value.absent(),
    this.shortDateFormat = const Value.absent(),
    this.showImages = const Value.absent(),
    this.showOthers = const Value.absent(),
    this.systemColors = const Value.absent(),
    this.targetWeight = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.tabs = const Value.absent(),
  });
  SettingsCompanion.insert({
    required bool curveLines,
    this.dailyCalories = const Value.absent(),
    this.dailyCarb = const Value.absent(),
    this.dailyFat = const Value.absent(),
    this.dailyProtein = const Value.absent(),
    required String diarySummary,
    required String entryUnit,
    required bool favoriteNew,
    required String foodUnit,
    this.id = const Value.absent(),
    required String longDateFormat,
    this.offLogin = const Value.absent(),
    this.offPassword = const Value.absent(),
    this.positiveReinforcement = const Value.absent(),
    this.reminders = const Value.absent(),
    required bool selectEntryOnSubmit,
    required String shortDateFormat,
    this.showImages = const Value.absent(),
    required bool showOthers,
    required bool systemColors,
    this.targetWeight = const Value.absent(),
    required String themeMode,
    this.tabs = const Value.absent(),
  })  : curveLines = Value(curveLines),
        diarySummary = Value(diarySummary),
        entryUnit = Value(entryUnit),
        favoriteNew = Value(favoriteNew),
        foodUnit = Value(foodUnit),
        longDateFormat = Value(longDateFormat),
        selectEntryOnSubmit = Value(selectEntryOnSubmit),
        shortDateFormat = Value(shortDateFormat),
        showOthers = Value(showOthers),
        systemColors = Value(systemColors),
        themeMode = Value(themeMode);
  static Insertable<Setting> custom({
    Expression<bool>? curveLines,
    Expression<int>? dailyCalories,
    Expression<int>? dailyCarb,
    Expression<int>? dailyFat,
    Expression<int>? dailyProtein,
    Expression<String>? diarySummary,
    Expression<String>? entryUnit,
    Expression<bool>? favoriteNew,
    Expression<String>? foodUnit,
    Expression<int>? id,
    Expression<String>? longDateFormat,
    Expression<String>? offLogin,
    Expression<String>? offPassword,
    Expression<bool>? positiveReinforcement,
    Expression<bool>? reminders,
    Expression<bool>? selectEntryOnSubmit,
    Expression<String>? shortDateFormat,
    Expression<bool>? showImages,
    Expression<bool>? showOthers,
    Expression<bool>? systemColors,
    Expression<double>? targetWeight,
    Expression<String>? themeMode,
    Expression<String>? tabs,
  }) {
    return RawValuesInsertable({
      if (curveLines != null) 'curve_lines': curveLines,
      if (dailyCalories != null) 'daily_calories': dailyCalories,
      if (dailyCarb != null) 'daily_carb': dailyCarb,
      if (dailyFat != null) 'daily_fat': dailyFat,
      if (dailyProtein != null) 'daily_protein': dailyProtein,
      if (diarySummary != null) 'diary_summary': diarySummary,
      if (entryUnit != null) 'entry_unit': entryUnit,
      if (favoriteNew != null) 'favorite_new': favoriteNew,
      if (foodUnit != null) 'food_unit': foodUnit,
      if (id != null) 'id': id,
      if (longDateFormat != null) 'long_date_format': longDateFormat,
      if (offLogin != null) 'off_login': offLogin,
      if (offPassword != null) 'off_password': offPassword,
      if (positiveReinforcement != null)
        'positive_reinforcement': positiveReinforcement,
      if (reminders != null) 'reminders': reminders,
      if (selectEntryOnSubmit != null)
        'select_entry_on_submit': selectEntryOnSubmit,
      if (shortDateFormat != null) 'short_date_format': shortDateFormat,
      if (showImages != null) 'show_images': showImages,
      if (showOthers != null) 'show_others': showOthers,
      if (systemColors != null) 'system_colors': systemColors,
      if (targetWeight != null) 'target_weight': targetWeight,
      if (themeMode != null) 'theme_mode': themeMode,
      if (tabs != null) 'tabs': tabs,
    });
  }

  SettingsCompanion copyWith(
      {Value<bool>? curveLines,
      Value<int?>? dailyCalories,
      Value<int?>? dailyCarb,
      Value<int?>? dailyFat,
      Value<int?>? dailyProtein,
      Value<String>? diarySummary,
      Value<String>? entryUnit,
      Value<bool>? favoriteNew,
      Value<String>? foodUnit,
      Value<int>? id,
      Value<String>? longDateFormat,
      Value<String?>? offLogin,
      Value<String?>? offPassword,
      Value<bool>? positiveReinforcement,
      Value<bool>? reminders,
      Value<bool>? selectEntryOnSubmit,
      Value<String>? shortDateFormat,
      Value<bool>? showImages,
      Value<bool>? showOthers,
      Value<bool>? systemColors,
      Value<double?>? targetWeight,
      Value<String>? themeMode,
      Value<String>? tabs}) {
    return SettingsCompanion(
      curveLines: curveLines ?? this.curveLines,
      dailyCalories: dailyCalories ?? this.dailyCalories,
      dailyCarb: dailyCarb ?? this.dailyCarb,
      dailyFat: dailyFat ?? this.dailyFat,
      dailyProtein: dailyProtein ?? this.dailyProtein,
      diarySummary: diarySummary ?? this.diarySummary,
      entryUnit: entryUnit ?? this.entryUnit,
      favoriteNew: favoriteNew ?? this.favoriteNew,
      foodUnit: foodUnit ?? this.foodUnit,
      id: id ?? this.id,
      longDateFormat: longDateFormat ?? this.longDateFormat,
      offLogin: offLogin ?? this.offLogin,
      offPassword: offPassword ?? this.offPassword,
      positiveReinforcement:
          positiveReinforcement ?? this.positiveReinforcement,
      reminders: reminders ?? this.reminders,
      selectEntryOnSubmit: selectEntryOnSubmit ?? this.selectEntryOnSubmit,
      shortDateFormat: shortDateFormat ?? this.shortDateFormat,
      showImages: showImages ?? this.showImages,
      showOthers: showOthers ?? this.showOthers,
      systemColors: systemColors ?? this.systemColors,
      targetWeight: targetWeight ?? this.targetWeight,
      themeMode: themeMode ?? this.themeMode,
      tabs: tabs ?? this.tabs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (curveLines.present) {
      map['curve_lines'] = Variable<bool>(curveLines.value);
    }
    if (dailyCalories.present) {
      map['daily_calories'] = Variable<int>(dailyCalories.value);
    }
    if (dailyCarb.present) {
      map['daily_carb'] = Variable<int>(dailyCarb.value);
    }
    if (dailyFat.present) {
      map['daily_fat'] = Variable<int>(dailyFat.value);
    }
    if (dailyProtein.present) {
      map['daily_protein'] = Variable<int>(dailyProtein.value);
    }
    if (diarySummary.present) {
      map['diary_summary'] = Variable<String>(diarySummary.value);
    }
    if (entryUnit.present) {
      map['entry_unit'] = Variable<String>(entryUnit.value);
    }
    if (favoriteNew.present) {
      map['favorite_new'] = Variable<bool>(favoriteNew.value);
    }
    if (foodUnit.present) {
      map['food_unit'] = Variable<String>(foodUnit.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (longDateFormat.present) {
      map['long_date_format'] = Variable<String>(longDateFormat.value);
    }
    if (offLogin.present) {
      map['off_login'] = Variable<String>(offLogin.value);
    }
    if (offPassword.present) {
      map['off_password'] = Variable<String>(offPassword.value);
    }
    if (positiveReinforcement.present) {
      map['positive_reinforcement'] =
          Variable<bool>(positiveReinforcement.value);
    }
    if (reminders.present) {
      map['reminders'] = Variable<bool>(reminders.value);
    }
    if (selectEntryOnSubmit.present) {
      map['select_entry_on_submit'] = Variable<bool>(selectEntryOnSubmit.value);
    }
    if (shortDateFormat.present) {
      map['short_date_format'] = Variable<String>(shortDateFormat.value);
    }
    if (showImages.present) {
      map['show_images'] = Variable<bool>(showImages.value);
    }
    if (showOthers.present) {
      map['show_others'] = Variable<bool>(showOthers.value);
    }
    if (systemColors.present) {
      map['system_colors'] = Variable<bool>(systemColors.value);
    }
    if (targetWeight.present) {
      map['target_weight'] = Variable<double>(targetWeight.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (tabs.present) {
      map['tabs'] = Variable<String>(tabs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('curveLines: $curveLines, ')
          ..write('dailyCalories: $dailyCalories, ')
          ..write('dailyCarb: $dailyCarb, ')
          ..write('dailyFat: $dailyFat, ')
          ..write('dailyProtein: $dailyProtein, ')
          ..write('diarySummary: $diarySummary, ')
          ..write('entryUnit: $entryUnit, ')
          ..write('favoriteNew: $favoriteNew, ')
          ..write('foodUnit: $foodUnit, ')
          ..write('id: $id, ')
          ..write('longDateFormat: $longDateFormat, ')
          ..write('offLogin: $offLogin, ')
          ..write('offPassword: $offPassword, ')
          ..write('positiveReinforcement: $positiveReinforcement, ')
          ..write('reminders: $reminders, ')
          ..write('selectEntryOnSubmit: $selectEntryOnSubmit, ')
          ..write('shortDateFormat: $shortDateFormat, ')
          ..write('showImages: $showImages, ')
          ..write('showOthers: $showOthers, ')
          ..write('systemColors: $systemColors, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('themeMode: $themeMode, ')
          ..write('tabs: $tabs')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FoodsTable foods = $FoodsTable(this);
  late final $EntriesTable entries = $EntriesTable(this);
  late final $WeightsTable weights = $WeightsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [foods, entries, weights, settings];
}

typedef $$FoodsTableCreateCompanionBuilder = FoodsCompanion Function({
  Value<String?> barcode,
  Value<double?> addedSugarG,
  Value<double?> alanineMg,
  Value<double?> alcoholG,
  Value<double?> arginineMg,
  Value<double?> asparticAcidMg,
  Value<double?> betaineMg,
  Value<String?> bigImage,
  Value<double?> biotinB7Mcg,
  Value<double?> caffeineMg,
  Value<double?> calciumMg,
  Value<double?> calories,
  Value<double?> carbohydrateG,
  Value<double?> caroteneAlphaMcg,
  Value<double?> caroteneBetaMcg,
  Value<double?> chlorineMg,
  Value<double?> cholesterolMg,
  Value<double?> cholineMg,
  Value<double?> copperCuMg,
  Value<DateTime?> created,
  Value<double?> cystineMg,
  Value<double?> dihydrophylloquinoneMcg,
  Value<double?> fatG,
  Value<double?> fattyAcidsTotalMonounsaturatedMg,
  Value<double?> fattyAcidsTotalPolyunsaturatedMg,
  Value<bool?> favorite,
  Value<double?> fiberG,
  Value<double?> fluorideFMcg,
  Value<double?> folateB9Mcg,
  Value<double?> folateDfeMcg,
  Value<double?> folicAcidMcg,
  Value<double?> foodFolateMcg,
  Value<String?> foodGroup,
  Value<double?> fructoseG,
  Value<double?> galactoseG,
  Value<double?> glucoseDextroseG,
  Value<double?> glutamicAcidMg,
  Value<double?> glycineMg,
  Value<double?> histidineMg,
  Value<double?> hydroxyprolineMg,
  Value<int> id,
  Value<String?> imageFile,
  Value<double?> insolubleFiberG,
  Value<double?> ironFeMg,
  Value<double?> isoleucineMg,
  Value<double?> lactoseG,
  Value<double?> leucineMg,
  Value<double?> luteinZeaxanthinMcg,
  Value<double?> lycopeneMcg,
  Value<double?> lysineMg,
  Value<double?> magnesiumMg,
  Value<double?> maltoseG,
  Value<double?> manganeseMg,
  Value<double?> menaquinone4Mcg,
  Value<double?> methionineMg,
  Value<double?> molybdenumMcg,
  required String name,
  Value<double?> netCarbsG,
  Value<double?> niacinB3Mg,
  Value<double?> omega3sMg,
  Value<double?> omega6sMg,
  Value<double?> pantothenicAcidB5Mg,
  Value<double?> phenylalanineMg,
  Value<double?> phosphorusPMg,
  Value<double?> potassiumKMg,
  Value<double?> pralScore,
  Value<double?> prolineMg,
  Value<double?> proteinG,
  Value<double?> retinolMcg,
  Value<double?> riboflavinB2Mg,
  Value<double?> saturatedFatsG,
  Value<double?> seleniumSeMcg,
  Value<double?> serineMg,
  Value<String?> servingDescription1G,
  Value<String?> servingDescription2G,
  Value<String?> servingDescription3G,
  Value<String?> servingDescription4G,
  Value<String?> servingDescription5G,
  Value<String?> servingDescription6G,
  Value<String?> servingDescription7G,
  Value<String?> servingDescription8G,
  Value<String?> servingDescription9G,
  Value<double?> servingSize,
  Value<String?> servingUnit,
  Value<double?> servingWeight1G,
  Value<double?> servingWeight2G,
  Value<double?> servingWeight3G,
  Value<double?> servingWeight4G,
  Value<double?> servingWeight5G,
  Value<double?> servingWeight6G,
  Value<double?> servingWeight7G,
  Value<double?> servingWeight8G,
  Value<double?> servingWeight9G,
  Value<String?> smallImage,
  Value<double?> sodiumMg,
  Value<double?> solubleFiberG,
  Value<double?> starchG,
  Value<double?> sucroseG,
  Value<double?> sugarsG,
  Value<double?> theobromineMg,
  Value<double?> thiaminB1Mg,
  Value<double?> threonineMg,
  Value<double?> totalSugarAlcoholsG,
  Value<double?> transFattyAcidsG,
  Value<double?> tryptophanMg,
  Value<double?> tyrosineMg,
  Value<double?> u183N3CCCAlaMg,
  Value<double?> u200calorieWeightG,
  Value<double?> u205N3EpaMg,
  Value<double?> u225N3DpaMg,
  Value<double?> u226N3DhaMg,
  Value<double?> valineMg,
  Value<double?> vitaminAIuIu,
  Value<double?> vitaminARaeMcg,
  Value<double?> vitaminB12Mcg,
  Value<double?> vitaminB6Mg,
  Value<double?> vitaminCMg,
  Value<double?> vitaminD2ErgocalciferolMcg,
  Value<double?> vitaminD3CholecalciferolMcg,
  Value<double?> vitaminDIuIu,
  Value<double?> vitaminDMcg,
  Value<double?> vitaminEAlphaTocopherolMg,
  Value<double?> vitaminKMcg,
  Value<double?> waterG,
  Value<double?> zincZnMg,
});
typedef $$FoodsTableUpdateCompanionBuilder = FoodsCompanion Function({
  Value<String?> barcode,
  Value<double?> addedSugarG,
  Value<double?> alanineMg,
  Value<double?> alcoholG,
  Value<double?> arginineMg,
  Value<double?> asparticAcidMg,
  Value<double?> betaineMg,
  Value<String?> bigImage,
  Value<double?> biotinB7Mcg,
  Value<double?> caffeineMg,
  Value<double?> calciumMg,
  Value<double?> calories,
  Value<double?> carbohydrateG,
  Value<double?> caroteneAlphaMcg,
  Value<double?> caroteneBetaMcg,
  Value<double?> chlorineMg,
  Value<double?> cholesterolMg,
  Value<double?> cholineMg,
  Value<double?> copperCuMg,
  Value<DateTime?> created,
  Value<double?> cystineMg,
  Value<double?> dihydrophylloquinoneMcg,
  Value<double?> fatG,
  Value<double?> fattyAcidsTotalMonounsaturatedMg,
  Value<double?> fattyAcidsTotalPolyunsaturatedMg,
  Value<bool?> favorite,
  Value<double?> fiberG,
  Value<double?> fluorideFMcg,
  Value<double?> folateB9Mcg,
  Value<double?> folateDfeMcg,
  Value<double?> folicAcidMcg,
  Value<double?> foodFolateMcg,
  Value<String?> foodGroup,
  Value<double?> fructoseG,
  Value<double?> galactoseG,
  Value<double?> glucoseDextroseG,
  Value<double?> glutamicAcidMg,
  Value<double?> glycineMg,
  Value<double?> histidineMg,
  Value<double?> hydroxyprolineMg,
  Value<int> id,
  Value<String?> imageFile,
  Value<double?> insolubleFiberG,
  Value<double?> ironFeMg,
  Value<double?> isoleucineMg,
  Value<double?> lactoseG,
  Value<double?> leucineMg,
  Value<double?> luteinZeaxanthinMcg,
  Value<double?> lycopeneMcg,
  Value<double?> lysineMg,
  Value<double?> magnesiumMg,
  Value<double?> maltoseG,
  Value<double?> manganeseMg,
  Value<double?> menaquinone4Mcg,
  Value<double?> methionineMg,
  Value<double?> molybdenumMcg,
  Value<String> name,
  Value<double?> netCarbsG,
  Value<double?> niacinB3Mg,
  Value<double?> omega3sMg,
  Value<double?> omega6sMg,
  Value<double?> pantothenicAcidB5Mg,
  Value<double?> phenylalanineMg,
  Value<double?> phosphorusPMg,
  Value<double?> potassiumKMg,
  Value<double?> pralScore,
  Value<double?> prolineMg,
  Value<double?> proteinG,
  Value<double?> retinolMcg,
  Value<double?> riboflavinB2Mg,
  Value<double?> saturatedFatsG,
  Value<double?> seleniumSeMcg,
  Value<double?> serineMg,
  Value<String?> servingDescription1G,
  Value<String?> servingDescription2G,
  Value<String?> servingDescription3G,
  Value<String?> servingDescription4G,
  Value<String?> servingDescription5G,
  Value<String?> servingDescription6G,
  Value<String?> servingDescription7G,
  Value<String?> servingDescription8G,
  Value<String?> servingDescription9G,
  Value<double?> servingSize,
  Value<String?> servingUnit,
  Value<double?> servingWeight1G,
  Value<double?> servingWeight2G,
  Value<double?> servingWeight3G,
  Value<double?> servingWeight4G,
  Value<double?> servingWeight5G,
  Value<double?> servingWeight6G,
  Value<double?> servingWeight7G,
  Value<double?> servingWeight8G,
  Value<double?> servingWeight9G,
  Value<String?> smallImage,
  Value<double?> sodiumMg,
  Value<double?> solubleFiberG,
  Value<double?> starchG,
  Value<double?> sucroseG,
  Value<double?> sugarsG,
  Value<double?> theobromineMg,
  Value<double?> thiaminB1Mg,
  Value<double?> threonineMg,
  Value<double?> totalSugarAlcoholsG,
  Value<double?> transFattyAcidsG,
  Value<double?> tryptophanMg,
  Value<double?> tyrosineMg,
  Value<double?> u183N3CCCAlaMg,
  Value<double?> u200calorieWeightG,
  Value<double?> u205N3EpaMg,
  Value<double?> u225N3DpaMg,
  Value<double?> u226N3DhaMg,
  Value<double?> valineMg,
  Value<double?> vitaminAIuIu,
  Value<double?> vitaminARaeMcg,
  Value<double?> vitaminB12Mcg,
  Value<double?> vitaminB6Mg,
  Value<double?> vitaminCMg,
  Value<double?> vitaminD2ErgocalciferolMcg,
  Value<double?> vitaminD3CholecalciferolMcg,
  Value<double?> vitaminDIuIu,
  Value<double?> vitaminDMcg,
  Value<double?> vitaminEAlphaTocopherolMg,
  Value<double?> vitaminKMcg,
  Value<double?> waterG,
  Value<double?> zincZnMg,
});

class $$FoodsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FoodsTable,
    Food,
    $$FoodsTableFilterComposer,
    $$FoodsTableOrderingComposer,
    $$FoodsTableCreateCompanionBuilder,
    $$FoodsTableUpdateCompanionBuilder> {
  $$FoodsTableTableManager(_$AppDatabase db, $FoodsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FoodsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FoodsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String?> barcode = const Value.absent(),
            Value<double?> addedSugarG = const Value.absent(),
            Value<double?> alanineMg = const Value.absent(),
            Value<double?> alcoholG = const Value.absent(),
            Value<double?> arginineMg = const Value.absent(),
            Value<double?> asparticAcidMg = const Value.absent(),
            Value<double?> betaineMg = const Value.absent(),
            Value<String?> bigImage = const Value.absent(),
            Value<double?> biotinB7Mcg = const Value.absent(),
            Value<double?> caffeineMg = const Value.absent(),
            Value<double?> calciumMg = const Value.absent(),
            Value<double?> calories = const Value.absent(),
            Value<double?> carbohydrateG = const Value.absent(),
            Value<double?> caroteneAlphaMcg = const Value.absent(),
            Value<double?> caroteneBetaMcg = const Value.absent(),
            Value<double?> chlorineMg = const Value.absent(),
            Value<double?> cholesterolMg = const Value.absent(),
            Value<double?> cholineMg = const Value.absent(),
            Value<double?> copperCuMg = const Value.absent(),
            Value<DateTime?> created = const Value.absent(),
            Value<double?> cystineMg = const Value.absent(),
            Value<double?> dihydrophylloquinoneMcg = const Value.absent(),
            Value<double?> fatG = const Value.absent(),
            Value<double?> fattyAcidsTotalMonounsaturatedMg =
                const Value.absent(),
            Value<double?> fattyAcidsTotalPolyunsaturatedMg =
                const Value.absent(),
            Value<bool?> favorite = const Value.absent(),
            Value<double?> fiberG = const Value.absent(),
            Value<double?> fluorideFMcg = const Value.absent(),
            Value<double?> folateB9Mcg = const Value.absent(),
            Value<double?> folateDfeMcg = const Value.absent(),
            Value<double?> folicAcidMcg = const Value.absent(),
            Value<double?> foodFolateMcg = const Value.absent(),
            Value<String?> foodGroup = const Value.absent(),
            Value<double?> fructoseG = const Value.absent(),
            Value<double?> galactoseG = const Value.absent(),
            Value<double?> glucoseDextroseG = const Value.absent(),
            Value<double?> glutamicAcidMg = const Value.absent(),
            Value<double?> glycineMg = const Value.absent(),
            Value<double?> histidineMg = const Value.absent(),
            Value<double?> hydroxyprolineMg = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String?> imageFile = const Value.absent(),
            Value<double?> insolubleFiberG = const Value.absent(),
            Value<double?> ironFeMg = const Value.absent(),
            Value<double?> isoleucineMg = const Value.absent(),
            Value<double?> lactoseG = const Value.absent(),
            Value<double?> leucineMg = const Value.absent(),
            Value<double?> luteinZeaxanthinMcg = const Value.absent(),
            Value<double?> lycopeneMcg = const Value.absent(),
            Value<double?> lysineMg = const Value.absent(),
            Value<double?> magnesiumMg = const Value.absent(),
            Value<double?> maltoseG = const Value.absent(),
            Value<double?> manganeseMg = const Value.absent(),
            Value<double?> menaquinone4Mcg = const Value.absent(),
            Value<double?> methionineMg = const Value.absent(),
            Value<double?> molybdenumMcg = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double?> netCarbsG = const Value.absent(),
            Value<double?> niacinB3Mg = const Value.absent(),
            Value<double?> omega3sMg = const Value.absent(),
            Value<double?> omega6sMg = const Value.absent(),
            Value<double?> pantothenicAcidB5Mg = const Value.absent(),
            Value<double?> phenylalanineMg = const Value.absent(),
            Value<double?> phosphorusPMg = const Value.absent(),
            Value<double?> potassiumKMg = const Value.absent(),
            Value<double?> pralScore = const Value.absent(),
            Value<double?> prolineMg = const Value.absent(),
            Value<double?> proteinG = const Value.absent(),
            Value<double?> retinolMcg = const Value.absent(),
            Value<double?> riboflavinB2Mg = const Value.absent(),
            Value<double?> saturatedFatsG = const Value.absent(),
            Value<double?> seleniumSeMcg = const Value.absent(),
            Value<double?> serineMg = const Value.absent(),
            Value<String?> servingDescription1G = const Value.absent(),
            Value<String?> servingDescription2G = const Value.absent(),
            Value<String?> servingDescription3G = const Value.absent(),
            Value<String?> servingDescription4G = const Value.absent(),
            Value<String?> servingDescription5G = const Value.absent(),
            Value<String?> servingDescription6G = const Value.absent(),
            Value<String?> servingDescription7G = const Value.absent(),
            Value<String?> servingDescription8G = const Value.absent(),
            Value<String?> servingDescription9G = const Value.absent(),
            Value<double?> servingSize = const Value.absent(),
            Value<String?> servingUnit = const Value.absent(),
            Value<double?> servingWeight1G = const Value.absent(),
            Value<double?> servingWeight2G = const Value.absent(),
            Value<double?> servingWeight3G = const Value.absent(),
            Value<double?> servingWeight4G = const Value.absent(),
            Value<double?> servingWeight5G = const Value.absent(),
            Value<double?> servingWeight6G = const Value.absent(),
            Value<double?> servingWeight7G = const Value.absent(),
            Value<double?> servingWeight8G = const Value.absent(),
            Value<double?> servingWeight9G = const Value.absent(),
            Value<String?> smallImage = const Value.absent(),
            Value<double?> sodiumMg = const Value.absent(),
            Value<double?> solubleFiberG = const Value.absent(),
            Value<double?> starchG = const Value.absent(),
            Value<double?> sucroseG = const Value.absent(),
            Value<double?> sugarsG = const Value.absent(),
            Value<double?> theobromineMg = const Value.absent(),
            Value<double?> thiaminB1Mg = const Value.absent(),
            Value<double?> threonineMg = const Value.absent(),
            Value<double?> totalSugarAlcoholsG = const Value.absent(),
            Value<double?> transFattyAcidsG = const Value.absent(),
            Value<double?> tryptophanMg = const Value.absent(),
            Value<double?> tyrosineMg = const Value.absent(),
            Value<double?> u183N3CCCAlaMg = const Value.absent(),
            Value<double?> u200calorieWeightG = const Value.absent(),
            Value<double?> u205N3EpaMg = const Value.absent(),
            Value<double?> u225N3DpaMg = const Value.absent(),
            Value<double?> u226N3DhaMg = const Value.absent(),
            Value<double?> valineMg = const Value.absent(),
            Value<double?> vitaminAIuIu = const Value.absent(),
            Value<double?> vitaminARaeMcg = const Value.absent(),
            Value<double?> vitaminB12Mcg = const Value.absent(),
            Value<double?> vitaminB6Mg = const Value.absent(),
            Value<double?> vitaminCMg = const Value.absent(),
            Value<double?> vitaminD2ErgocalciferolMcg = const Value.absent(),
            Value<double?> vitaminD3CholecalciferolMcg = const Value.absent(),
            Value<double?> vitaminDIuIu = const Value.absent(),
            Value<double?> vitaminDMcg = const Value.absent(),
            Value<double?> vitaminEAlphaTocopherolMg = const Value.absent(),
            Value<double?> vitaminKMcg = const Value.absent(),
            Value<double?> waterG = const Value.absent(),
            Value<double?> zincZnMg = const Value.absent(),
          }) =>
              FoodsCompanion(
            barcode: barcode,
            addedSugarG: addedSugarG,
            alanineMg: alanineMg,
            alcoholG: alcoholG,
            arginineMg: arginineMg,
            asparticAcidMg: asparticAcidMg,
            betaineMg: betaineMg,
            bigImage: bigImage,
            biotinB7Mcg: biotinB7Mcg,
            caffeineMg: caffeineMg,
            calciumMg: calciumMg,
            calories: calories,
            carbohydrateG: carbohydrateG,
            caroteneAlphaMcg: caroteneAlphaMcg,
            caroteneBetaMcg: caroteneBetaMcg,
            chlorineMg: chlorineMg,
            cholesterolMg: cholesterolMg,
            cholineMg: cholineMg,
            copperCuMg: copperCuMg,
            created: created,
            cystineMg: cystineMg,
            dihydrophylloquinoneMcg: dihydrophylloquinoneMcg,
            fatG: fatG,
            fattyAcidsTotalMonounsaturatedMg: fattyAcidsTotalMonounsaturatedMg,
            fattyAcidsTotalPolyunsaturatedMg: fattyAcidsTotalPolyunsaturatedMg,
            favorite: favorite,
            fiberG: fiberG,
            fluorideFMcg: fluorideFMcg,
            folateB9Mcg: folateB9Mcg,
            folateDfeMcg: folateDfeMcg,
            folicAcidMcg: folicAcidMcg,
            foodFolateMcg: foodFolateMcg,
            foodGroup: foodGroup,
            fructoseG: fructoseG,
            galactoseG: galactoseG,
            glucoseDextroseG: glucoseDextroseG,
            glutamicAcidMg: glutamicAcidMg,
            glycineMg: glycineMg,
            histidineMg: histidineMg,
            hydroxyprolineMg: hydroxyprolineMg,
            id: id,
            imageFile: imageFile,
            insolubleFiberG: insolubleFiberG,
            ironFeMg: ironFeMg,
            isoleucineMg: isoleucineMg,
            lactoseG: lactoseG,
            leucineMg: leucineMg,
            luteinZeaxanthinMcg: luteinZeaxanthinMcg,
            lycopeneMcg: lycopeneMcg,
            lysineMg: lysineMg,
            magnesiumMg: magnesiumMg,
            maltoseG: maltoseG,
            manganeseMg: manganeseMg,
            menaquinone4Mcg: menaquinone4Mcg,
            methionineMg: methionineMg,
            molybdenumMcg: molybdenumMcg,
            name: name,
            netCarbsG: netCarbsG,
            niacinB3Mg: niacinB3Mg,
            omega3sMg: omega3sMg,
            omega6sMg: omega6sMg,
            pantothenicAcidB5Mg: pantothenicAcidB5Mg,
            phenylalanineMg: phenylalanineMg,
            phosphorusPMg: phosphorusPMg,
            potassiumKMg: potassiumKMg,
            pralScore: pralScore,
            prolineMg: prolineMg,
            proteinG: proteinG,
            retinolMcg: retinolMcg,
            riboflavinB2Mg: riboflavinB2Mg,
            saturatedFatsG: saturatedFatsG,
            seleniumSeMcg: seleniumSeMcg,
            serineMg: serineMg,
            servingDescription1G: servingDescription1G,
            servingDescription2G: servingDescription2G,
            servingDescription3G: servingDescription3G,
            servingDescription4G: servingDescription4G,
            servingDescription5G: servingDescription5G,
            servingDescription6G: servingDescription6G,
            servingDescription7G: servingDescription7G,
            servingDescription8G: servingDescription8G,
            servingDescription9G: servingDescription9G,
            servingSize: servingSize,
            servingUnit: servingUnit,
            servingWeight1G: servingWeight1G,
            servingWeight2G: servingWeight2G,
            servingWeight3G: servingWeight3G,
            servingWeight4G: servingWeight4G,
            servingWeight5G: servingWeight5G,
            servingWeight6G: servingWeight6G,
            servingWeight7G: servingWeight7G,
            servingWeight8G: servingWeight8G,
            servingWeight9G: servingWeight9G,
            smallImage: smallImage,
            sodiumMg: sodiumMg,
            solubleFiberG: solubleFiberG,
            starchG: starchG,
            sucroseG: sucroseG,
            sugarsG: sugarsG,
            theobromineMg: theobromineMg,
            thiaminB1Mg: thiaminB1Mg,
            threonineMg: threonineMg,
            totalSugarAlcoholsG: totalSugarAlcoholsG,
            transFattyAcidsG: transFattyAcidsG,
            tryptophanMg: tryptophanMg,
            tyrosineMg: tyrosineMg,
            u183N3CCCAlaMg: u183N3CCCAlaMg,
            u200calorieWeightG: u200calorieWeightG,
            u205N3EpaMg: u205N3EpaMg,
            u225N3DpaMg: u225N3DpaMg,
            u226N3DhaMg: u226N3DhaMg,
            valineMg: valineMg,
            vitaminAIuIu: vitaminAIuIu,
            vitaminARaeMcg: vitaminARaeMcg,
            vitaminB12Mcg: vitaminB12Mcg,
            vitaminB6Mg: vitaminB6Mg,
            vitaminCMg: vitaminCMg,
            vitaminD2ErgocalciferolMcg: vitaminD2ErgocalciferolMcg,
            vitaminD3CholecalciferolMcg: vitaminD3CholecalciferolMcg,
            vitaminDIuIu: vitaminDIuIu,
            vitaminDMcg: vitaminDMcg,
            vitaminEAlphaTocopherolMg: vitaminEAlphaTocopherolMg,
            vitaminKMcg: vitaminKMcg,
            waterG: waterG,
            zincZnMg: zincZnMg,
          ),
          createCompanionCallback: ({
            Value<String?> barcode = const Value.absent(),
            Value<double?> addedSugarG = const Value.absent(),
            Value<double?> alanineMg = const Value.absent(),
            Value<double?> alcoholG = const Value.absent(),
            Value<double?> arginineMg = const Value.absent(),
            Value<double?> asparticAcidMg = const Value.absent(),
            Value<double?> betaineMg = const Value.absent(),
            Value<String?> bigImage = const Value.absent(),
            Value<double?> biotinB7Mcg = const Value.absent(),
            Value<double?> caffeineMg = const Value.absent(),
            Value<double?> calciumMg = const Value.absent(),
            Value<double?> calories = const Value.absent(),
            Value<double?> carbohydrateG = const Value.absent(),
            Value<double?> caroteneAlphaMcg = const Value.absent(),
            Value<double?> caroteneBetaMcg = const Value.absent(),
            Value<double?> chlorineMg = const Value.absent(),
            Value<double?> cholesterolMg = const Value.absent(),
            Value<double?> cholineMg = const Value.absent(),
            Value<double?> copperCuMg = const Value.absent(),
            Value<DateTime?> created = const Value.absent(),
            Value<double?> cystineMg = const Value.absent(),
            Value<double?> dihydrophylloquinoneMcg = const Value.absent(),
            Value<double?> fatG = const Value.absent(),
            Value<double?> fattyAcidsTotalMonounsaturatedMg =
                const Value.absent(),
            Value<double?> fattyAcidsTotalPolyunsaturatedMg =
                const Value.absent(),
            Value<bool?> favorite = const Value.absent(),
            Value<double?> fiberG = const Value.absent(),
            Value<double?> fluorideFMcg = const Value.absent(),
            Value<double?> folateB9Mcg = const Value.absent(),
            Value<double?> folateDfeMcg = const Value.absent(),
            Value<double?> folicAcidMcg = const Value.absent(),
            Value<double?> foodFolateMcg = const Value.absent(),
            Value<String?> foodGroup = const Value.absent(),
            Value<double?> fructoseG = const Value.absent(),
            Value<double?> galactoseG = const Value.absent(),
            Value<double?> glucoseDextroseG = const Value.absent(),
            Value<double?> glutamicAcidMg = const Value.absent(),
            Value<double?> glycineMg = const Value.absent(),
            Value<double?> histidineMg = const Value.absent(),
            Value<double?> hydroxyprolineMg = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String?> imageFile = const Value.absent(),
            Value<double?> insolubleFiberG = const Value.absent(),
            Value<double?> ironFeMg = const Value.absent(),
            Value<double?> isoleucineMg = const Value.absent(),
            Value<double?> lactoseG = const Value.absent(),
            Value<double?> leucineMg = const Value.absent(),
            Value<double?> luteinZeaxanthinMcg = const Value.absent(),
            Value<double?> lycopeneMcg = const Value.absent(),
            Value<double?> lysineMg = const Value.absent(),
            Value<double?> magnesiumMg = const Value.absent(),
            Value<double?> maltoseG = const Value.absent(),
            Value<double?> manganeseMg = const Value.absent(),
            Value<double?> menaquinone4Mcg = const Value.absent(),
            Value<double?> methionineMg = const Value.absent(),
            Value<double?> molybdenumMcg = const Value.absent(),
            required String name,
            Value<double?> netCarbsG = const Value.absent(),
            Value<double?> niacinB3Mg = const Value.absent(),
            Value<double?> omega3sMg = const Value.absent(),
            Value<double?> omega6sMg = const Value.absent(),
            Value<double?> pantothenicAcidB5Mg = const Value.absent(),
            Value<double?> phenylalanineMg = const Value.absent(),
            Value<double?> phosphorusPMg = const Value.absent(),
            Value<double?> potassiumKMg = const Value.absent(),
            Value<double?> pralScore = const Value.absent(),
            Value<double?> prolineMg = const Value.absent(),
            Value<double?> proteinG = const Value.absent(),
            Value<double?> retinolMcg = const Value.absent(),
            Value<double?> riboflavinB2Mg = const Value.absent(),
            Value<double?> saturatedFatsG = const Value.absent(),
            Value<double?> seleniumSeMcg = const Value.absent(),
            Value<double?> serineMg = const Value.absent(),
            Value<String?> servingDescription1G = const Value.absent(),
            Value<String?> servingDescription2G = const Value.absent(),
            Value<String?> servingDescription3G = const Value.absent(),
            Value<String?> servingDescription4G = const Value.absent(),
            Value<String?> servingDescription5G = const Value.absent(),
            Value<String?> servingDescription6G = const Value.absent(),
            Value<String?> servingDescription7G = const Value.absent(),
            Value<String?> servingDescription8G = const Value.absent(),
            Value<String?> servingDescription9G = const Value.absent(),
            Value<double?> servingSize = const Value.absent(),
            Value<String?> servingUnit = const Value.absent(),
            Value<double?> servingWeight1G = const Value.absent(),
            Value<double?> servingWeight2G = const Value.absent(),
            Value<double?> servingWeight3G = const Value.absent(),
            Value<double?> servingWeight4G = const Value.absent(),
            Value<double?> servingWeight5G = const Value.absent(),
            Value<double?> servingWeight6G = const Value.absent(),
            Value<double?> servingWeight7G = const Value.absent(),
            Value<double?> servingWeight8G = const Value.absent(),
            Value<double?> servingWeight9G = const Value.absent(),
            Value<String?> smallImage = const Value.absent(),
            Value<double?> sodiumMg = const Value.absent(),
            Value<double?> solubleFiberG = const Value.absent(),
            Value<double?> starchG = const Value.absent(),
            Value<double?> sucroseG = const Value.absent(),
            Value<double?> sugarsG = const Value.absent(),
            Value<double?> theobromineMg = const Value.absent(),
            Value<double?> thiaminB1Mg = const Value.absent(),
            Value<double?> threonineMg = const Value.absent(),
            Value<double?> totalSugarAlcoholsG = const Value.absent(),
            Value<double?> transFattyAcidsG = const Value.absent(),
            Value<double?> tryptophanMg = const Value.absent(),
            Value<double?> tyrosineMg = const Value.absent(),
            Value<double?> u183N3CCCAlaMg = const Value.absent(),
            Value<double?> u200calorieWeightG = const Value.absent(),
            Value<double?> u205N3EpaMg = const Value.absent(),
            Value<double?> u225N3DpaMg = const Value.absent(),
            Value<double?> u226N3DhaMg = const Value.absent(),
            Value<double?> valineMg = const Value.absent(),
            Value<double?> vitaminAIuIu = const Value.absent(),
            Value<double?> vitaminARaeMcg = const Value.absent(),
            Value<double?> vitaminB12Mcg = const Value.absent(),
            Value<double?> vitaminB6Mg = const Value.absent(),
            Value<double?> vitaminCMg = const Value.absent(),
            Value<double?> vitaminD2ErgocalciferolMcg = const Value.absent(),
            Value<double?> vitaminD3CholecalciferolMcg = const Value.absent(),
            Value<double?> vitaminDIuIu = const Value.absent(),
            Value<double?> vitaminDMcg = const Value.absent(),
            Value<double?> vitaminEAlphaTocopherolMg = const Value.absent(),
            Value<double?> vitaminKMcg = const Value.absent(),
            Value<double?> waterG = const Value.absent(),
            Value<double?> zincZnMg = const Value.absent(),
          }) =>
              FoodsCompanion.insert(
            barcode: barcode,
            addedSugarG: addedSugarG,
            alanineMg: alanineMg,
            alcoholG: alcoholG,
            arginineMg: arginineMg,
            asparticAcidMg: asparticAcidMg,
            betaineMg: betaineMg,
            bigImage: bigImage,
            biotinB7Mcg: biotinB7Mcg,
            caffeineMg: caffeineMg,
            calciumMg: calciumMg,
            calories: calories,
            carbohydrateG: carbohydrateG,
            caroteneAlphaMcg: caroteneAlphaMcg,
            caroteneBetaMcg: caroteneBetaMcg,
            chlorineMg: chlorineMg,
            cholesterolMg: cholesterolMg,
            cholineMg: cholineMg,
            copperCuMg: copperCuMg,
            created: created,
            cystineMg: cystineMg,
            dihydrophylloquinoneMcg: dihydrophylloquinoneMcg,
            fatG: fatG,
            fattyAcidsTotalMonounsaturatedMg: fattyAcidsTotalMonounsaturatedMg,
            fattyAcidsTotalPolyunsaturatedMg: fattyAcidsTotalPolyunsaturatedMg,
            favorite: favorite,
            fiberG: fiberG,
            fluorideFMcg: fluorideFMcg,
            folateB9Mcg: folateB9Mcg,
            folateDfeMcg: folateDfeMcg,
            folicAcidMcg: folicAcidMcg,
            foodFolateMcg: foodFolateMcg,
            foodGroup: foodGroup,
            fructoseG: fructoseG,
            galactoseG: galactoseG,
            glucoseDextroseG: glucoseDextroseG,
            glutamicAcidMg: glutamicAcidMg,
            glycineMg: glycineMg,
            histidineMg: histidineMg,
            hydroxyprolineMg: hydroxyprolineMg,
            id: id,
            imageFile: imageFile,
            insolubleFiberG: insolubleFiberG,
            ironFeMg: ironFeMg,
            isoleucineMg: isoleucineMg,
            lactoseG: lactoseG,
            leucineMg: leucineMg,
            luteinZeaxanthinMcg: luteinZeaxanthinMcg,
            lycopeneMcg: lycopeneMcg,
            lysineMg: lysineMg,
            magnesiumMg: magnesiumMg,
            maltoseG: maltoseG,
            manganeseMg: manganeseMg,
            menaquinone4Mcg: menaquinone4Mcg,
            methionineMg: methionineMg,
            molybdenumMcg: molybdenumMcg,
            name: name,
            netCarbsG: netCarbsG,
            niacinB3Mg: niacinB3Mg,
            omega3sMg: omega3sMg,
            omega6sMg: omega6sMg,
            pantothenicAcidB5Mg: pantothenicAcidB5Mg,
            phenylalanineMg: phenylalanineMg,
            phosphorusPMg: phosphorusPMg,
            potassiumKMg: potassiumKMg,
            pralScore: pralScore,
            prolineMg: prolineMg,
            proteinG: proteinG,
            retinolMcg: retinolMcg,
            riboflavinB2Mg: riboflavinB2Mg,
            saturatedFatsG: saturatedFatsG,
            seleniumSeMcg: seleniumSeMcg,
            serineMg: serineMg,
            servingDescription1G: servingDescription1G,
            servingDescription2G: servingDescription2G,
            servingDescription3G: servingDescription3G,
            servingDescription4G: servingDescription4G,
            servingDescription5G: servingDescription5G,
            servingDescription6G: servingDescription6G,
            servingDescription7G: servingDescription7G,
            servingDescription8G: servingDescription8G,
            servingDescription9G: servingDescription9G,
            servingSize: servingSize,
            servingUnit: servingUnit,
            servingWeight1G: servingWeight1G,
            servingWeight2G: servingWeight2G,
            servingWeight3G: servingWeight3G,
            servingWeight4G: servingWeight4G,
            servingWeight5G: servingWeight5G,
            servingWeight6G: servingWeight6G,
            servingWeight7G: servingWeight7G,
            servingWeight8G: servingWeight8G,
            servingWeight9G: servingWeight9G,
            smallImage: smallImage,
            sodiumMg: sodiumMg,
            solubleFiberG: solubleFiberG,
            starchG: starchG,
            sucroseG: sucroseG,
            sugarsG: sugarsG,
            theobromineMg: theobromineMg,
            thiaminB1Mg: thiaminB1Mg,
            threonineMg: threonineMg,
            totalSugarAlcoholsG: totalSugarAlcoholsG,
            transFattyAcidsG: transFattyAcidsG,
            tryptophanMg: tryptophanMg,
            tyrosineMg: tyrosineMg,
            u183N3CCCAlaMg: u183N3CCCAlaMg,
            u200calorieWeightG: u200calorieWeightG,
            u205N3EpaMg: u205N3EpaMg,
            u225N3DpaMg: u225N3DpaMg,
            u226N3DhaMg: u226N3DhaMg,
            valineMg: valineMg,
            vitaminAIuIu: vitaminAIuIu,
            vitaminARaeMcg: vitaminARaeMcg,
            vitaminB12Mcg: vitaminB12Mcg,
            vitaminB6Mg: vitaminB6Mg,
            vitaminCMg: vitaminCMg,
            vitaminD2ErgocalciferolMcg: vitaminD2ErgocalciferolMcg,
            vitaminD3CholecalciferolMcg: vitaminD3CholecalciferolMcg,
            vitaminDIuIu: vitaminDIuIu,
            vitaminDMcg: vitaminDMcg,
            vitaminEAlphaTocopherolMg: vitaminEAlphaTocopherolMg,
            vitaminKMcg: vitaminKMcg,
            waterG: waterG,
            zincZnMg: zincZnMg,
          ),
        ));
}

class $$FoodsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FoodsTable> {
  $$FoodsTableFilterComposer(super.$state);
  ColumnFilters<String> get barcode => $state.composableBuilder(
      column: $state.table.barcode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get addedSugarG => $state.composableBuilder(
      column: $state.table.addedSugarG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get alanineMg => $state.composableBuilder(
      column: $state.table.alanineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get alcoholG => $state.composableBuilder(
      column: $state.table.alcoholG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get arginineMg => $state.composableBuilder(
      column: $state.table.arginineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get asparticAcidMg => $state.composableBuilder(
      column: $state.table.asparticAcidMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get betaineMg => $state.composableBuilder(
      column: $state.table.betaineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bigImage => $state.composableBuilder(
      column: $state.table.bigImage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get biotinB7Mcg => $state.composableBuilder(
      column: $state.table.biotinB7Mcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get caffeineMg => $state.composableBuilder(
      column: $state.table.caffeineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get calciumMg => $state.composableBuilder(
      column: $state.table.calciumMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get calories => $state.composableBuilder(
      column: $state.table.calories,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get carbohydrateG => $state.composableBuilder(
      column: $state.table.carbohydrateG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get caroteneAlphaMcg => $state.composableBuilder(
      column: $state.table.caroteneAlphaMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get caroteneBetaMcg => $state.composableBuilder(
      column: $state.table.caroteneBetaMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get chlorineMg => $state.composableBuilder(
      column: $state.table.chlorineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get cholesterolMg => $state.composableBuilder(
      column: $state.table.cholesterolMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get cholineMg => $state.composableBuilder(
      column: $state.table.cholineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get copperCuMg => $state.composableBuilder(
      column: $state.table.copperCuMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get cystineMg => $state.composableBuilder(
      column: $state.table.cystineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get dihydrophylloquinoneMcg => $state.composableBuilder(
      column: $state.table.dihydrophylloquinoneMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fatG => $state.composableBuilder(
      column: $state.table.fatG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fattyAcidsTotalMonounsaturatedMg =>
      $state.composableBuilder(
          column: $state.table.fattyAcidsTotalMonounsaturatedMg,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fattyAcidsTotalPolyunsaturatedMg =>
      $state.composableBuilder(
          column: $state.table.fattyAcidsTotalPolyunsaturatedMg,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get favorite => $state.composableBuilder(
      column: $state.table.favorite,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fiberG => $state.composableBuilder(
      column: $state.table.fiberG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fluorideFMcg => $state.composableBuilder(
      column: $state.table.fluorideFMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get folateB9Mcg => $state.composableBuilder(
      column: $state.table.folateB9Mcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get folateDfeMcg => $state.composableBuilder(
      column: $state.table.folateDfeMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get folicAcidMcg => $state.composableBuilder(
      column: $state.table.folicAcidMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get foodFolateMcg => $state.composableBuilder(
      column: $state.table.foodFolateMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get foodGroup => $state.composableBuilder(
      column: $state.table.foodGroup,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fructoseG => $state.composableBuilder(
      column: $state.table.fructoseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get galactoseG => $state.composableBuilder(
      column: $state.table.galactoseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get glucoseDextroseG => $state.composableBuilder(
      column: $state.table.glucoseDextroseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get glutamicAcidMg => $state.composableBuilder(
      column: $state.table.glutamicAcidMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get glycineMg => $state.composableBuilder(
      column: $state.table.glycineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get histidineMg => $state.composableBuilder(
      column: $state.table.histidineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get hydroxyprolineMg => $state.composableBuilder(
      column: $state.table.hydroxyprolineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageFile => $state.composableBuilder(
      column: $state.table.imageFile,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get insolubleFiberG => $state.composableBuilder(
      column: $state.table.insolubleFiberG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ironFeMg => $state.composableBuilder(
      column: $state.table.ironFeMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get isoleucineMg => $state.composableBuilder(
      column: $state.table.isoleucineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lactoseG => $state.composableBuilder(
      column: $state.table.lactoseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get leucineMg => $state.composableBuilder(
      column: $state.table.leucineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get luteinZeaxanthinMcg => $state.composableBuilder(
      column: $state.table.luteinZeaxanthinMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lycopeneMcg => $state.composableBuilder(
      column: $state.table.lycopeneMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lysineMg => $state.composableBuilder(
      column: $state.table.lysineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get magnesiumMg => $state.composableBuilder(
      column: $state.table.magnesiumMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get maltoseG => $state.composableBuilder(
      column: $state.table.maltoseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get manganeseMg => $state.composableBuilder(
      column: $state.table.manganeseMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get menaquinone4Mcg => $state.composableBuilder(
      column: $state.table.menaquinone4Mcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get methionineMg => $state.composableBuilder(
      column: $state.table.methionineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get molybdenumMcg => $state.composableBuilder(
      column: $state.table.molybdenumMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get netCarbsG => $state.composableBuilder(
      column: $state.table.netCarbsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get niacinB3Mg => $state.composableBuilder(
      column: $state.table.niacinB3Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get omega3sMg => $state.composableBuilder(
      column: $state.table.omega3sMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get omega6sMg => $state.composableBuilder(
      column: $state.table.omega6sMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get pantothenicAcidB5Mg => $state.composableBuilder(
      column: $state.table.pantothenicAcidB5Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get phenylalanineMg => $state.composableBuilder(
      column: $state.table.phenylalanineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get phosphorusPMg => $state.composableBuilder(
      column: $state.table.phosphorusPMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get potassiumKMg => $state.composableBuilder(
      column: $state.table.potassiumKMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get pralScore => $state.composableBuilder(
      column: $state.table.pralScore,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get prolineMg => $state.composableBuilder(
      column: $state.table.prolineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get proteinG => $state.composableBuilder(
      column: $state.table.proteinG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get retinolMcg => $state.composableBuilder(
      column: $state.table.retinolMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get riboflavinB2Mg => $state.composableBuilder(
      column: $state.table.riboflavinB2Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get saturatedFatsG => $state.composableBuilder(
      column: $state.table.saturatedFatsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get seleniumSeMcg => $state.composableBuilder(
      column: $state.table.seleniumSeMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get serineMg => $state.composableBuilder(
      column: $state.table.serineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription1G => $state.composableBuilder(
      column: $state.table.servingDescription1G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription2G => $state.composableBuilder(
      column: $state.table.servingDescription2G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription3G => $state.composableBuilder(
      column: $state.table.servingDescription3G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription4G => $state.composableBuilder(
      column: $state.table.servingDescription4G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription5G => $state.composableBuilder(
      column: $state.table.servingDescription5G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription6G => $state.composableBuilder(
      column: $state.table.servingDescription6G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription7G => $state.composableBuilder(
      column: $state.table.servingDescription7G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription8G => $state.composableBuilder(
      column: $state.table.servingDescription8G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription9G => $state.composableBuilder(
      column: $state.table.servingDescription9G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingSize => $state.composableBuilder(
      column: $state.table.servingSize,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingUnit => $state.composableBuilder(
      column: $state.table.servingUnit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight1G => $state.composableBuilder(
      column: $state.table.servingWeight1G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight2G => $state.composableBuilder(
      column: $state.table.servingWeight2G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight3G => $state.composableBuilder(
      column: $state.table.servingWeight3G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight4G => $state.composableBuilder(
      column: $state.table.servingWeight4G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight5G => $state.composableBuilder(
      column: $state.table.servingWeight5G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight6G => $state.composableBuilder(
      column: $state.table.servingWeight6G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight7G => $state.composableBuilder(
      column: $state.table.servingWeight7G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight8G => $state.composableBuilder(
      column: $state.table.servingWeight8G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight9G => $state.composableBuilder(
      column: $state.table.servingWeight9G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get smallImage => $state.composableBuilder(
      column: $state.table.smallImage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sodiumMg => $state.composableBuilder(
      column: $state.table.sodiumMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get solubleFiberG => $state.composableBuilder(
      column: $state.table.solubleFiberG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get starchG => $state.composableBuilder(
      column: $state.table.starchG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sucroseG => $state.composableBuilder(
      column: $state.table.sucroseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sugarsG => $state.composableBuilder(
      column: $state.table.sugarsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get theobromineMg => $state.composableBuilder(
      column: $state.table.theobromineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get thiaminB1Mg => $state.composableBuilder(
      column: $state.table.thiaminB1Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get threonineMg => $state.composableBuilder(
      column: $state.table.threonineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalSugarAlcoholsG => $state.composableBuilder(
      column: $state.table.totalSugarAlcoholsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get transFattyAcidsG => $state.composableBuilder(
      column: $state.table.transFattyAcidsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get tryptophanMg => $state.composableBuilder(
      column: $state.table.tryptophanMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get tyrosineMg => $state.composableBuilder(
      column: $state.table.tyrosineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get u183N3CCCAlaMg => $state.composableBuilder(
      column: $state.table.u183N3CCCAlaMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get u200calorieWeightG => $state.composableBuilder(
      column: $state.table.u200calorieWeightG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get u205N3EpaMg => $state.composableBuilder(
      column: $state.table.u205N3EpaMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get u225N3DpaMg => $state.composableBuilder(
      column: $state.table.u225N3DpaMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get u226N3DhaMg => $state.composableBuilder(
      column: $state.table.u226N3DhaMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get valineMg => $state.composableBuilder(
      column: $state.table.valineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminAIuIu => $state.composableBuilder(
      column: $state.table.vitaminAIuIu,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminARaeMcg => $state.composableBuilder(
      column: $state.table.vitaminARaeMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminB12Mcg => $state.composableBuilder(
      column: $state.table.vitaminB12Mcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminB6Mg => $state.composableBuilder(
      column: $state.table.vitaminB6Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminCMg => $state.composableBuilder(
      column: $state.table.vitaminCMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminD2ErgocalciferolMcg =>
      $state.composableBuilder(
          column: $state.table.vitaminD2ErgocalciferolMcg,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminD3CholecalciferolMcg => $state
      .composableBuilder(
          column: $state.table.vitaminD3CholecalciferolMcg,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminDIuIu => $state.composableBuilder(
      column: $state.table.vitaminDIuIu,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminDMcg => $state.composableBuilder(
      column: $state.table.vitaminDMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminEAlphaTocopherolMg =>
      $state.composableBuilder(
          column: $state.table.vitaminEAlphaTocopherolMg,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminKMcg => $state.composableBuilder(
      column: $state.table.vitaminKMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get waterG => $state.composableBuilder(
      column: $state.table.waterG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get zincZnMg => $state.composableBuilder(
      column: $state.table.zincZnMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter entriesRefs(
      ComposableFilter Function($$EntriesTableFilterComposer f) f) {
    final $$EntriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.entries,
        getReferencedColumn: (t) => t.food,
        builder: (joinBuilder, parentComposers) => $$EntriesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.entries, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$FoodsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FoodsTable> {
  $$FoodsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get barcode => $state.composableBuilder(
      column: $state.table.barcode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get addedSugarG => $state.composableBuilder(
      column: $state.table.addedSugarG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get alanineMg => $state.composableBuilder(
      column: $state.table.alanineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get alcoholG => $state.composableBuilder(
      column: $state.table.alcoholG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get arginineMg => $state.composableBuilder(
      column: $state.table.arginineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get asparticAcidMg => $state.composableBuilder(
      column: $state.table.asparticAcidMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get betaineMg => $state.composableBuilder(
      column: $state.table.betaineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bigImage => $state.composableBuilder(
      column: $state.table.bigImage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get biotinB7Mcg => $state.composableBuilder(
      column: $state.table.biotinB7Mcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get caffeineMg => $state.composableBuilder(
      column: $state.table.caffeineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get calciumMg => $state.composableBuilder(
      column: $state.table.calciumMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get calories => $state.composableBuilder(
      column: $state.table.calories,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get carbohydrateG => $state.composableBuilder(
      column: $state.table.carbohydrateG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get caroteneAlphaMcg => $state.composableBuilder(
      column: $state.table.caroteneAlphaMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get caroteneBetaMcg => $state.composableBuilder(
      column: $state.table.caroteneBetaMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get chlorineMg => $state.composableBuilder(
      column: $state.table.chlorineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get cholesterolMg => $state.composableBuilder(
      column: $state.table.cholesterolMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get cholineMg => $state.composableBuilder(
      column: $state.table.cholineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get copperCuMg => $state.composableBuilder(
      column: $state.table.copperCuMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get cystineMg => $state.composableBuilder(
      column: $state.table.cystineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get dihydrophylloquinoneMcg =>
      $state.composableBuilder(
          column: $state.table.dihydrophylloquinoneMcg,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fatG => $state.composableBuilder(
      column: $state.table.fatG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fattyAcidsTotalMonounsaturatedMg =>
      $state.composableBuilder(
          column: $state.table.fattyAcidsTotalMonounsaturatedMg,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fattyAcidsTotalPolyunsaturatedMg =>
      $state.composableBuilder(
          column: $state.table.fattyAcidsTotalPolyunsaturatedMg,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get favorite => $state.composableBuilder(
      column: $state.table.favorite,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fiberG => $state.composableBuilder(
      column: $state.table.fiberG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fluorideFMcg => $state.composableBuilder(
      column: $state.table.fluorideFMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get folateB9Mcg => $state.composableBuilder(
      column: $state.table.folateB9Mcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get folateDfeMcg => $state.composableBuilder(
      column: $state.table.folateDfeMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get folicAcidMcg => $state.composableBuilder(
      column: $state.table.folicAcidMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get foodFolateMcg => $state.composableBuilder(
      column: $state.table.foodFolateMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get foodGroup => $state.composableBuilder(
      column: $state.table.foodGroup,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fructoseG => $state.composableBuilder(
      column: $state.table.fructoseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get galactoseG => $state.composableBuilder(
      column: $state.table.galactoseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get glucoseDextroseG => $state.composableBuilder(
      column: $state.table.glucoseDextroseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get glutamicAcidMg => $state.composableBuilder(
      column: $state.table.glutamicAcidMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get glycineMg => $state.composableBuilder(
      column: $state.table.glycineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get histidineMg => $state.composableBuilder(
      column: $state.table.histidineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get hydroxyprolineMg => $state.composableBuilder(
      column: $state.table.hydroxyprolineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageFile => $state.composableBuilder(
      column: $state.table.imageFile,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get insolubleFiberG => $state.composableBuilder(
      column: $state.table.insolubleFiberG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ironFeMg => $state.composableBuilder(
      column: $state.table.ironFeMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get isoleucineMg => $state.composableBuilder(
      column: $state.table.isoleucineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lactoseG => $state.composableBuilder(
      column: $state.table.lactoseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get leucineMg => $state.composableBuilder(
      column: $state.table.leucineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get luteinZeaxanthinMcg => $state.composableBuilder(
      column: $state.table.luteinZeaxanthinMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lycopeneMcg => $state.composableBuilder(
      column: $state.table.lycopeneMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lysineMg => $state.composableBuilder(
      column: $state.table.lysineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get magnesiumMg => $state.composableBuilder(
      column: $state.table.magnesiumMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get maltoseG => $state.composableBuilder(
      column: $state.table.maltoseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get manganeseMg => $state.composableBuilder(
      column: $state.table.manganeseMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get menaquinone4Mcg => $state.composableBuilder(
      column: $state.table.menaquinone4Mcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get methionineMg => $state.composableBuilder(
      column: $state.table.methionineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get molybdenumMcg => $state.composableBuilder(
      column: $state.table.molybdenumMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get netCarbsG => $state.composableBuilder(
      column: $state.table.netCarbsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get niacinB3Mg => $state.composableBuilder(
      column: $state.table.niacinB3Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get omega3sMg => $state.composableBuilder(
      column: $state.table.omega3sMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get omega6sMg => $state.composableBuilder(
      column: $state.table.omega6sMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get pantothenicAcidB5Mg => $state.composableBuilder(
      column: $state.table.pantothenicAcidB5Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get phenylalanineMg => $state.composableBuilder(
      column: $state.table.phenylalanineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get phosphorusPMg => $state.composableBuilder(
      column: $state.table.phosphorusPMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get potassiumKMg => $state.composableBuilder(
      column: $state.table.potassiumKMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get pralScore => $state.composableBuilder(
      column: $state.table.pralScore,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get prolineMg => $state.composableBuilder(
      column: $state.table.prolineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get proteinG => $state.composableBuilder(
      column: $state.table.proteinG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get retinolMcg => $state.composableBuilder(
      column: $state.table.retinolMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get riboflavinB2Mg => $state.composableBuilder(
      column: $state.table.riboflavinB2Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get saturatedFatsG => $state.composableBuilder(
      column: $state.table.saturatedFatsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get seleniumSeMcg => $state.composableBuilder(
      column: $state.table.seleniumSeMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get serineMg => $state.composableBuilder(
      column: $state.table.serineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription1G => $state.composableBuilder(
      column: $state.table.servingDescription1G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription2G => $state.composableBuilder(
      column: $state.table.servingDescription2G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription3G => $state.composableBuilder(
      column: $state.table.servingDescription3G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription4G => $state.composableBuilder(
      column: $state.table.servingDescription4G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription5G => $state.composableBuilder(
      column: $state.table.servingDescription5G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription6G => $state.composableBuilder(
      column: $state.table.servingDescription6G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription7G => $state.composableBuilder(
      column: $state.table.servingDescription7G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription8G => $state.composableBuilder(
      column: $state.table.servingDescription8G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription9G => $state.composableBuilder(
      column: $state.table.servingDescription9G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingSize => $state.composableBuilder(
      column: $state.table.servingSize,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingUnit => $state.composableBuilder(
      column: $state.table.servingUnit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight1G => $state.composableBuilder(
      column: $state.table.servingWeight1G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight2G => $state.composableBuilder(
      column: $state.table.servingWeight2G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight3G => $state.composableBuilder(
      column: $state.table.servingWeight3G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight4G => $state.composableBuilder(
      column: $state.table.servingWeight4G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight5G => $state.composableBuilder(
      column: $state.table.servingWeight5G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight6G => $state.composableBuilder(
      column: $state.table.servingWeight6G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight7G => $state.composableBuilder(
      column: $state.table.servingWeight7G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight8G => $state.composableBuilder(
      column: $state.table.servingWeight8G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight9G => $state.composableBuilder(
      column: $state.table.servingWeight9G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get smallImage => $state.composableBuilder(
      column: $state.table.smallImage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sodiumMg => $state.composableBuilder(
      column: $state.table.sodiumMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get solubleFiberG => $state.composableBuilder(
      column: $state.table.solubleFiberG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get starchG => $state.composableBuilder(
      column: $state.table.starchG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sucroseG => $state.composableBuilder(
      column: $state.table.sucroseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sugarsG => $state.composableBuilder(
      column: $state.table.sugarsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get theobromineMg => $state.composableBuilder(
      column: $state.table.theobromineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get thiaminB1Mg => $state.composableBuilder(
      column: $state.table.thiaminB1Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get threonineMg => $state.composableBuilder(
      column: $state.table.threonineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalSugarAlcoholsG => $state.composableBuilder(
      column: $state.table.totalSugarAlcoholsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get transFattyAcidsG => $state.composableBuilder(
      column: $state.table.transFattyAcidsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get tryptophanMg => $state.composableBuilder(
      column: $state.table.tryptophanMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get tyrosineMg => $state.composableBuilder(
      column: $state.table.tyrosineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get u183N3CCCAlaMg => $state.composableBuilder(
      column: $state.table.u183N3CCCAlaMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get u200calorieWeightG => $state.composableBuilder(
      column: $state.table.u200calorieWeightG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get u205N3EpaMg => $state.composableBuilder(
      column: $state.table.u205N3EpaMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get u225N3DpaMg => $state.composableBuilder(
      column: $state.table.u225N3DpaMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get u226N3DhaMg => $state.composableBuilder(
      column: $state.table.u226N3DhaMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get valineMg => $state.composableBuilder(
      column: $state.table.valineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminAIuIu => $state.composableBuilder(
      column: $state.table.vitaminAIuIu,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminARaeMcg => $state.composableBuilder(
      column: $state.table.vitaminARaeMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminB12Mcg => $state.composableBuilder(
      column: $state.table.vitaminB12Mcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminB6Mg => $state.composableBuilder(
      column: $state.table.vitaminB6Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminCMg => $state.composableBuilder(
      column: $state.table.vitaminCMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminD2ErgocalciferolMcg =>
      $state.composableBuilder(
          column: $state.table.vitaminD2ErgocalciferolMcg,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminD3CholecalciferolMcg =>
      $state.composableBuilder(
          column: $state.table.vitaminD3CholecalciferolMcg,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminDIuIu => $state.composableBuilder(
      column: $state.table.vitaminDIuIu,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminDMcg => $state.composableBuilder(
      column: $state.table.vitaminDMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminEAlphaTocopherolMg => $state
      .composableBuilder(
          column: $state.table.vitaminEAlphaTocopherolMg,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminKMcg => $state.composableBuilder(
      column: $state.table.vitaminKMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get waterG => $state.composableBuilder(
      column: $state.table.waterG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get zincZnMg => $state.composableBuilder(
      column: $state.table.zincZnMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$EntriesTableCreateCompanionBuilder = EntriesCompanion Function({
  Value<int> id,
  required int food,
  required DateTime created,
  required double quantity,
  required String unit,
  Value<double?> kCalories,
  Value<double?> proteinG,
  Value<double?> fatG,
  Value<double?> carbG,
});
typedef $$EntriesTableUpdateCompanionBuilder = EntriesCompanion Function({
  Value<int> id,
  Value<int> food,
  Value<DateTime> created,
  Value<double> quantity,
  Value<String> unit,
  Value<double?> kCalories,
  Value<double?> proteinG,
  Value<double?> fatG,
  Value<double?> carbG,
});

class $$EntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EntriesTable,
    Entry,
    $$EntriesTableFilterComposer,
    $$EntriesTableOrderingComposer,
    $$EntriesTableCreateCompanionBuilder,
    $$EntriesTableUpdateCompanionBuilder> {
  $$EntriesTableTableManager(_$AppDatabase db, $EntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EntriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EntriesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> food = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double?> kCalories = const Value.absent(),
            Value<double?> proteinG = const Value.absent(),
            Value<double?> fatG = const Value.absent(),
            Value<double?> carbG = const Value.absent(),
          }) =>
              EntriesCompanion(
            id: id,
            food: food,
            created: created,
            quantity: quantity,
            unit: unit,
            kCalories: kCalories,
            proteinG: proteinG,
            fatG: fatG,
            carbG: carbG,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int food,
            required DateTime created,
            required double quantity,
            required String unit,
            Value<double?> kCalories = const Value.absent(),
            Value<double?> proteinG = const Value.absent(),
            Value<double?> fatG = const Value.absent(),
            Value<double?> carbG = const Value.absent(),
          }) =>
              EntriesCompanion.insert(
            id: id,
            food: food,
            created: created,
            quantity: quantity,
            unit: unit,
            kCalories: kCalories,
            proteinG: proteinG,
            fatG: fatG,
            carbG: carbG,
          ),
        ));
}

class $$EntriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EntriesTable> {
  $$EntriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get unit => $state.composableBuilder(
      column: $state.table.unit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get kCalories => $state.composableBuilder(
      column: $state.table.kCalories,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get proteinG => $state.composableBuilder(
      column: $state.table.proteinG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fatG => $state.composableBuilder(
      column: $state.table.fatG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get carbG => $state.composableBuilder(
      column: $state.table.carbG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$FoodsTableFilterComposer get food {
    final $$FoodsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.food,
        referencedTable: $state.db.foods,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$FoodsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.foods, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$EntriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EntriesTable> {
  $$EntriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get unit => $state.composableBuilder(
      column: $state.table.unit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get kCalories => $state.composableBuilder(
      column: $state.table.kCalories,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get proteinG => $state.composableBuilder(
      column: $state.table.proteinG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fatG => $state.composableBuilder(
      column: $state.table.fatG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get carbG => $state.composableBuilder(
      column: $state.table.carbG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$FoodsTableOrderingComposer get food {
    final $$FoodsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.food,
        referencedTable: $state.db.foods,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$FoodsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.foods, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$WeightsTableCreateCompanionBuilder = WeightsCompanion Function({
  Value<int> id,
  required DateTime created,
  required String unit,
  required double amount,
});
typedef $$WeightsTableUpdateCompanionBuilder = WeightsCompanion Function({
  Value<int> id,
  Value<DateTime> created,
  Value<String> unit,
  Value<double> amount,
});

class $$WeightsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WeightsTable,
    Weight,
    $$WeightsTableFilterComposer,
    $$WeightsTableOrderingComposer,
    $$WeightsTableCreateCompanionBuilder,
    $$WeightsTableUpdateCompanionBuilder> {
  $$WeightsTableTableManager(_$AppDatabase db, $WeightsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WeightsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WeightsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> amount = const Value.absent(),
          }) =>
              WeightsCompanion(
            id: id,
            created: created,
            unit: unit,
            amount: amount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime created,
            required String unit,
            required double amount,
          }) =>
              WeightsCompanion.insert(
            id: id,
            created: created,
            unit: unit,
            amount: amount,
          ),
        ));
}

class $$WeightsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WeightsTable> {
  $$WeightsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get unit => $state.composableBuilder(
      column: $state.table.unit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$WeightsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WeightsTable> {
  $$WeightsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get unit => $state.composableBuilder(
      column: $state.table.unit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required bool curveLines,
  Value<int?> dailyCalories,
  Value<int?> dailyCarb,
  Value<int?> dailyFat,
  Value<int?> dailyProtein,
  required String diarySummary,
  required String entryUnit,
  required bool favoriteNew,
  required String foodUnit,
  Value<int> id,
  required String longDateFormat,
  Value<String?> offLogin,
  Value<String?> offPassword,
  Value<bool> positiveReinforcement,
  Value<bool> reminders,
  required bool selectEntryOnSubmit,
  required String shortDateFormat,
  Value<bool> showImages,
  required bool showOthers,
  required bool systemColors,
  Value<double?> targetWeight,
  required String themeMode,
  Value<String> tabs,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<bool> curveLines,
  Value<int?> dailyCalories,
  Value<int?> dailyCarb,
  Value<int?> dailyFat,
  Value<int?> dailyProtein,
  Value<String> diarySummary,
  Value<String> entryUnit,
  Value<bool> favoriteNew,
  Value<String> foodUnit,
  Value<int> id,
  Value<String> longDateFormat,
  Value<String?> offLogin,
  Value<String?> offPassword,
  Value<bool> positiveReinforcement,
  Value<bool> reminders,
  Value<bool> selectEntryOnSubmit,
  Value<String> shortDateFormat,
  Value<bool> showImages,
  Value<bool> showOthers,
  Value<bool> systemColors,
  Value<double?> targetWeight,
  Value<String> themeMode,
  Value<String> tabs,
});

class $$SettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder> {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SettingsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<bool> curveLines = const Value.absent(),
            Value<int?> dailyCalories = const Value.absent(),
            Value<int?> dailyCarb = const Value.absent(),
            Value<int?> dailyFat = const Value.absent(),
            Value<int?> dailyProtein = const Value.absent(),
            Value<String> diarySummary = const Value.absent(),
            Value<String> entryUnit = const Value.absent(),
            Value<bool> favoriteNew = const Value.absent(),
            Value<String> foodUnit = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> longDateFormat = const Value.absent(),
            Value<String?> offLogin = const Value.absent(),
            Value<String?> offPassword = const Value.absent(),
            Value<bool> positiveReinforcement = const Value.absent(),
            Value<bool> reminders = const Value.absent(),
            Value<bool> selectEntryOnSubmit = const Value.absent(),
            Value<String> shortDateFormat = const Value.absent(),
            Value<bool> showImages = const Value.absent(),
            Value<bool> showOthers = const Value.absent(),
            Value<bool> systemColors = const Value.absent(),
            Value<double?> targetWeight = const Value.absent(),
            Value<String> themeMode = const Value.absent(),
            Value<String> tabs = const Value.absent(),
          }) =>
              SettingsCompanion(
            curveLines: curveLines,
            dailyCalories: dailyCalories,
            dailyCarb: dailyCarb,
            dailyFat: dailyFat,
            dailyProtein: dailyProtein,
            diarySummary: diarySummary,
            entryUnit: entryUnit,
            favoriteNew: favoriteNew,
            foodUnit: foodUnit,
            id: id,
            longDateFormat: longDateFormat,
            offLogin: offLogin,
            offPassword: offPassword,
            positiveReinforcement: positiveReinforcement,
            reminders: reminders,
            selectEntryOnSubmit: selectEntryOnSubmit,
            shortDateFormat: shortDateFormat,
            showImages: showImages,
            showOthers: showOthers,
            systemColors: systemColors,
            targetWeight: targetWeight,
            themeMode: themeMode,
            tabs: tabs,
          ),
          createCompanionCallback: ({
            required bool curveLines,
            Value<int?> dailyCalories = const Value.absent(),
            Value<int?> dailyCarb = const Value.absent(),
            Value<int?> dailyFat = const Value.absent(),
            Value<int?> dailyProtein = const Value.absent(),
            required String diarySummary,
            required String entryUnit,
            required bool favoriteNew,
            required String foodUnit,
            Value<int> id = const Value.absent(),
            required String longDateFormat,
            Value<String?> offLogin = const Value.absent(),
            Value<String?> offPassword = const Value.absent(),
            Value<bool> positiveReinforcement = const Value.absent(),
            Value<bool> reminders = const Value.absent(),
            required bool selectEntryOnSubmit,
            required String shortDateFormat,
            Value<bool> showImages = const Value.absent(),
            required bool showOthers,
            required bool systemColors,
            Value<double?> targetWeight = const Value.absent(),
            required String themeMode,
            Value<String> tabs = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            curveLines: curveLines,
            dailyCalories: dailyCalories,
            dailyCarb: dailyCarb,
            dailyFat: dailyFat,
            dailyProtein: dailyProtein,
            diarySummary: diarySummary,
            entryUnit: entryUnit,
            favoriteNew: favoriteNew,
            foodUnit: foodUnit,
            id: id,
            longDateFormat: longDateFormat,
            offLogin: offLogin,
            offPassword: offPassword,
            positiveReinforcement: positiveReinforcement,
            reminders: reminders,
            selectEntryOnSubmit: selectEntryOnSubmit,
            shortDateFormat: shortDateFormat,
            showImages: showImages,
            showOthers: showOthers,
            systemColors: systemColors,
            targetWeight: targetWeight,
            themeMode: themeMode,
            tabs: tabs,
          ),
        ));
}

class $$SettingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer(super.$state);
  ColumnFilters<bool> get curveLines => $state.composableBuilder(
      column: $state.table.curveLines,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dailyCalories => $state.composableBuilder(
      column: $state.table.dailyCalories,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dailyCarb => $state.composableBuilder(
      column: $state.table.dailyCarb,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dailyFat => $state.composableBuilder(
      column: $state.table.dailyFat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dailyProtein => $state.composableBuilder(
      column: $state.table.dailyProtein,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get diarySummary => $state.composableBuilder(
      column: $state.table.diarySummary,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get entryUnit => $state.composableBuilder(
      column: $state.table.entryUnit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get favoriteNew => $state.composableBuilder(
      column: $state.table.favoriteNew,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get foodUnit => $state.composableBuilder(
      column: $state.table.foodUnit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get longDateFormat => $state.composableBuilder(
      column: $state.table.longDateFormat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get offLogin => $state.composableBuilder(
      column: $state.table.offLogin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get offPassword => $state.composableBuilder(
      column: $state.table.offPassword,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get positiveReinforcement => $state.composableBuilder(
      column: $state.table.positiveReinforcement,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get reminders => $state.composableBuilder(
      column: $state.table.reminders,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get selectEntryOnSubmit => $state.composableBuilder(
      column: $state.table.selectEntryOnSubmit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get shortDateFormat => $state.composableBuilder(
      column: $state.table.shortDateFormat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get showImages => $state.composableBuilder(
      column: $state.table.showImages,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get showOthers => $state.composableBuilder(
      column: $state.table.showOthers,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get systemColors => $state.composableBuilder(
      column: $state.table.systemColors,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get targetWeight => $state.composableBuilder(
      column: $state.table.targetWeight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tabs => $state.composableBuilder(
      column: $state.table.tabs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SettingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer(super.$state);
  ColumnOrderings<bool> get curveLines => $state.composableBuilder(
      column: $state.table.curveLines,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dailyCalories => $state.composableBuilder(
      column: $state.table.dailyCalories,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dailyCarb => $state.composableBuilder(
      column: $state.table.dailyCarb,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dailyFat => $state.composableBuilder(
      column: $state.table.dailyFat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dailyProtein => $state.composableBuilder(
      column: $state.table.dailyProtein,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get diarySummary => $state.composableBuilder(
      column: $state.table.diarySummary,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get entryUnit => $state.composableBuilder(
      column: $state.table.entryUnit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get favoriteNew => $state.composableBuilder(
      column: $state.table.favoriteNew,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get foodUnit => $state.composableBuilder(
      column: $state.table.foodUnit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get longDateFormat => $state.composableBuilder(
      column: $state.table.longDateFormat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get offLogin => $state.composableBuilder(
      column: $state.table.offLogin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get offPassword => $state.composableBuilder(
      column: $state.table.offPassword,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get positiveReinforcement => $state.composableBuilder(
      column: $state.table.positiveReinforcement,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get reminders => $state.composableBuilder(
      column: $state.table.reminders,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get selectEntryOnSubmit => $state.composableBuilder(
      column: $state.table.selectEntryOnSubmit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get shortDateFormat => $state.composableBuilder(
      column: $state.table.shortDateFormat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get showImages => $state.composableBuilder(
      column: $state.table.showImages,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get showOthers => $state.composableBuilder(
      column: $state.table.showOthers,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get systemColors => $state.composableBuilder(
      column: $state.table.systemColors,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get targetWeight => $state.composableBuilder(
      column: $state.table.targetWeight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tabs => $state.composableBuilder(
      column: $state.table.tabs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FoodsTableTableManager get foods =>
      $$FoodsTableTableManager(_db, _db.foods);
  $$EntriesTableTableManager get entries =>
      $$EntriesTableTableManager(_db, _db.entries);
  $$WeightsTableTableManager get weights =>
      $$WeightsTableTableManager(_db, _db.weights);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
