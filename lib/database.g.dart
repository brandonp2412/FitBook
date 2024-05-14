// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _foodGroupMeta =
      const VerificationMeta('foodGroup');
  @override
  late final GeneratedColumn<String> foodGroup = GeneratedColumn<String>(
      'food_group', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
      'calories', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fatGMeta = const VerificationMeta('fatG');
  @override
  late final GeneratedColumn<double> fatG = GeneratedColumn<double>(
      'fat_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _proteinGMeta =
      const VerificationMeta('proteinG');
  @override
  late final GeneratedColumn<double> proteinG = GeneratedColumn<double>(
      'protein_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _carbohydrateGMeta =
      const VerificationMeta('carbohydrateG');
  @override
  late final GeneratedColumn<double> carbohydrateG = GeneratedColumn<double>(
      'carbohydrate_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sugarsGMeta =
      const VerificationMeta('sugarsG');
  @override
  late final GeneratedColumn<double> sugarsG = GeneratedColumn<double>(
      'sugars_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fiberGMeta = const VerificationMeta('fiberG');
  @override
  late final GeneratedColumn<double> fiberG = GeneratedColumn<double>(
      'fiber_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cholesterolMgMeta =
      const VerificationMeta('cholesterolMg');
  @override
  late final GeneratedColumn<double> cholesterolMg = GeneratedColumn<double>(
      'cholesterol_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _saturatedFatsGMeta =
      const VerificationMeta('saturatedFatsG');
  @override
  late final GeneratedColumn<double> saturatedFatsG = GeneratedColumn<double>(
      'saturated_fats_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _calciumMgMeta =
      const VerificationMeta('calciumMg');
  @override
  late final GeneratedColumn<double> calciumMg = GeneratedColumn<double>(
      'calcium_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _ironFeMgMeta =
      const VerificationMeta('ironFeMg');
  @override
  late final GeneratedColumn<double> ironFeMg = GeneratedColumn<double>(
      'iron_fe_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _potassiumKMgMeta =
      const VerificationMeta('potassiumKMg');
  @override
  late final GeneratedColumn<double> potassiumKMg = GeneratedColumn<double>(
      'potassium_k_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _magnesiumMgMeta =
      const VerificationMeta('magnesiumMg');
  @override
  late final GeneratedColumn<double> magnesiumMg = GeneratedColumn<double>(
      'magnesium_mg', aliasedName, true,
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
  static const VerificationMeta _vitaminCMgMeta =
      const VerificationMeta('vitaminCMg');
  @override
  late final GeneratedColumn<double> vitaminCMg = GeneratedColumn<double>(
      'vitamin_c_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminB12McgMeta =
      const VerificationMeta('vitaminB12Mcg');
  @override
  late final GeneratedColumn<double> vitaminB12Mcg = GeneratedColumn<double>(
      'vitamin_b_12_mcg', aliasedName, true,
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
  static const VerificationMeta _addedSugarGMeta =
      const VerificationMeta('addedSugarG');
  @override
  late final GeneratedColumn<double> addedSugarG = GeneratedColumn<double>(
      'added_sugar_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _netCarbsGMeta =
      const VerificationMeta('netCarbsG');
  @override
  late final GeneratedColumn<double> netCarbsG = GeneratedColumn<double>(
      'net_carbs_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _waterGMeta = const VerificationMeta('waterG');
  @override
  late final GeneratedColumn<double> waterG = GeneratedColumn<double>(
      'water_g', aliasedName, true,
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
  static const VerificationMeta _pralScoreMeta =
      const VerificationMeta('pralScore');
  @override
  late final GeneratedColumn<double> pralScore = GeneratedColumn<double>(
      'pral_score', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _transFattyAcidsGMeta =
      const VerificationMeta('transFattyAcidsG');
  @override
  late final GeneratedColumn<double> transFattyAcidsG = GeneratedColumn<double>(
      'trans_fatty_acids_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _solubleFiberGMeta =
      const VerificationMeta('solubleFiberG');
  @override
  late final GeneratedColumn<double> solubleFiberG = GeneratedColumn<double>(
      'soluble_fiber_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _insolubleFiberGMeta =
      const VerificationMeta('insolubleFiberG');
  @override
  late final GeneratedColumn<double> insolubleFiberG = GeneratedColumn<double>(
      'insoluble_fiber_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sucroseGMeta =
      const VerificationMeta('sucroseG');
  @override
  late final GeneratedColumn<double> sucroseG = GeneratedColumn<double>(
      'sucrose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _glucoseDextroseGMeta =
      const VerificationMeta('glucoseDextroseG');
  @override
  late final GeneratedColumn<double> glucoseDextroseG = GeneratedColumn<double>(
      'glucose_dextrose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fructoseGMeta =
      const VerificationMeta('fructoseG');
  @override
  late final GeneratedColumn<double> fructoseG = GeneratedColumn<double>(
      'fructose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lactoseGMeta =
      const VerificationMeta('lactoseG');
  @override
  late final GeneratedColumn<double> lactoseG = GeneratedColumn<double>(
      'lactose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maltoseGMeta =
      const VerificationMeta('maltoseG');
  @override
  late final GeneratedColumn<double> maltoseG = GeneratedColumn<double>(
      'maltose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _galactoseGMeta =
      const VerificationMeta('galactoseG');
  @override
  late final GeneratedColumn<double> galactoseG = GeneratedColumn<double>(
      'galactose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _starchGMeta =
      const VerificationMeta('starchG');
  @override
  late final GeneratedColumn<double> starchG = GeneratedColumn<double>(
      'starch_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _totalSugarAlcoholsGMeta =
      const VerificationMeta('totalSugarAlcoholsG');
  @override
  late final GeneratedColumn<double> totalSugarAlcoholsG =
      GeneratedColumn<double>('total_sugar_alcohols_g', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _phosphorusPMgMeta =
      const VerificationMeta('phosphorusPMg');
  @override
  late final GeneratedColumn<double> phosphorusPMg = GeneratedColumn<double>(
      'phosphorus_p_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sodiumMgMeta =
      const VerificationMeta('sodiumMg');
  @override
  late final GeneratedColumn<double> sodiumMg = GeneratedColumn<double>(
      'sodium_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _zincZnMgMeta =
      const VerificationMeta('zincZnMg');
  @override
  late final GeneratedColumn<double> zincZnMg = GeneratedColumn<double>(
      'zinc_zn_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _copperCuMgMeta =
      const VerificationMeta('copperCuMg');
  @override
  late final GeneratedColumn<double> copperCuMg = GeneratedColumn<double>(
      'copper_cu_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _manganeseMgMeta =
      const VerificationMeta('manganeseMg');
  @override
  late final GeneratedColumn<double> manganeseMg = GeneratedColumn<double>(
      'manganese_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _seleniumSeMcgMeta =
      const VerificationMeta('seleniumSeMcg');
  @override
  late final GeneratedColumn<double> seleniumSeMcg = GeneratedColumn<double>(
      'selenium_se_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fluorideFMcgMeta =
      const VerificationMeta('fluorideFMcg');
  @override
  late final GeneratedColumn<double> fluorideFMcg = GeneratedColumn<double>(
      'fluoride_f_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _molybdenumMcgMeta =
      const VerificationMeta('molybdenumMcg');
  @override
  late final GeneratedColumn<double> molybdenumMcg = GeneratedColumn<double>(
      'molybdenum_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _chlorineMgMeta =
      const VerificationMeta('chlorineMg');
  @override
  late final GeneratedColumn<double> chlorineMg = GeneratedColumn<double>(
      'chlorine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _thiaminB1MgMeta =
      const VerificationMeta('thiaminB1Mg');
  @override
  late final GeneratedColumn<double> thiaminB1Mg = GeneratedColumn<double>(
      'thiamin_b1_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _riboflavinB2MgMeta =
      const VerificationMeta('riboflavinB2Mg');
  @override
  late final GeneratedColumn<double> riboflavinB2Mg = GeneratedColumn<double>(
      'riboflavin_b2_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _niacinB3MgMeta =
      const VerificationMeta('niacinB3Mg');
  @override
  late final GeneratedColumn<double> niacinB3Mg = GeneratedColumn<double>(
      'niacin_b3_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pantothenicAcidB5MgMeta =
      const VerificationMeta('pantothenicAcidB5Mg');
  @override
  late final GeneratedColumn<double> pantothenicAcidB5Mg =
      GeneratedColumn<double>('pantothenic_acid_b5_mg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminB6MgMeta =
      const VerificationMeta('vitaminB6Mg');
  @override
  late final GeneratedColumn<double> vitaminB6Mg = GeneratedColumn<double>(
      'vitamin_b6_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _biotinB7McgMeta =
      const VerificationMeta('biotinB7Mcg');
  @override
  late final GeneratedColumn<double> biotinB7Mcg = GeneratedColumn<double>(
      'biotin_b7_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _folateB9McgMeta =
      const VerificationMeta('folateB9Mcg');
  @override
  late final GeneratedColumn<double> folateB9Mcg = GeneratedColumn<double>(
      'folate_b9_mcg', aliasedName, true,
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
  static const VerificationMeta _folateDfeMcgMeta =
      const VerificationMeta('folateDfeMcg');
  @override
  late final GeneratedColumn<double> folateDfeMcg = GeneratedColumn<double>(
      'folate_dfe_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cholineMgMeta =
      const VerificationMeta('cholineMg');
  @override
  late final GeneratedColumn<double> cholineMg = GeneratedColumn<double>(
      'choline_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _betaineMgMeta =
      const VerificationMeta('betaineMg');
  @override
  late final GeneratedColumn<double> betaineMg = GeneratedColumn<double>(
      'betaine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _retinolMcgMeta =
      const VerificationMeta('retinolMcg');
  @override
  late final GeneratedColumn<double> retinolMcg = GeneratedColumn<double>(
      'retinol_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _caroteneBetaMcgMeta =
      const VerificationMeta('caroteneBetaMcg');
  @override
  late final GeneratedColumn<double> caroteneBetaMcg = GeneratedColumn<double>(
      'carotene_beta_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _caroteneAlphaMcgMeta =
      const VerificationMeta('caroteneAlphaMcg');
  @override
  late final GeneratedColumn<double> caroteneAlphaMcg = GeneratedColumn<double>(
      'carotene_alpha_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lycopeneMcgMeta =
      const VerificationMeta('lycopeneMcg');
  @override
  late final GeneratedColumn<double> lycopeneMcg = GeneratedColumn<double>(
      'lycopene_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _luteinZeaxanthinMcgMeta =
      const VerificationMeta('luteinZeaxanthinMcg');
  @override
  late final GeneratedColumn<double> luteinZeaxanthinMcg =
      GeneratedColumn<double>('lutein_zeaxanthin_mcg', aliasedName, true,
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
  static const VerificationMeta _vitaminKMcgMeta =
      const VerificationMeta('vitaminKMcg');
  @override
  late final GeneratedColumn<double> vitaminKMcg = GeneratedColumn<double>(
      'vitamin_k_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _dihydrophylloquinoneMcgMeta =
      const VerificationMeta('dihydrophylloquinoneMcg');
  @override
  late final GeneratedColumn<double> dihydrophylloquinoneMcg =
      GeneratedColumn<double>('dihydrophylloquinone_mcg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _menaquinone4McgMeta =
      const VerificationMeta('menaquinone4Mcg');
  @override
  late final GeneratedColumn<double> menaquinone4Mcg = GeneratedColumn<double>(
      'menaquinone_4_mcg', aliasedName, true,
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
  static const VerificationMeta _u183N3CCCAlaMgMeta =
      const VerificationMeta('u183N3CCCAlaMg');
  @override
  late final GeneratedColumn<double> u183N3CCCAlaMg = GeneratedColumn<double>(
      '_18_3_n_3_c_c_c_ala_mg', aliasedName, true,
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
  static const VerificationMeta _tryptophanMgMeta =
      const VerificationMeta('tryptophanMg');
  @override
  late final GeneratedColumn<double> tryptophanMg = GeneratedColumn<double>(
      'tryptophan_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _threonineMgMeta =
      const VerificationMeta('threonineMg');
  @override
  late final GeneratedColumn<double> threonineMg = GeneratedColumn<double>(
      'threonine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isoleucineMgMeta =
      const VerificationMeta('isoleucineMg');
  @override
  late final GeneratedColumn<double> isoleucineMg = GeneratedColumn<double>(
      'isoleucine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _leucineMgMeta =
      const VerificationMeta('leucineMg');
  @override
  late final GeneratedColumn<double> leucineMg = GeneratedColumn<double>(
      'leucine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lysineMgMeta =
      const VerificationMeta('lysineMg');
  @override
  late final GeneratedColumn<double> lysineMg = GeneratedColumn<double>(
      'lysine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _methionineMgMeta =
      const VerificationMeta('methionineMg');
  @override
  late final GeneratedColumn<double> methionineMg = GeneratedColumn<double>(
      'methionine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cystineMgMeta =
      const VerificationMeta('cystineMg');
  @override
  late final GeneratedColumn<double> cystineMg = GeneratedColumn<double>(
      'cystine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _phenylalanineMgMeta =
      const VerificationMeta('phenylalanineMg');
  @override
  late final GeneratedColumn<double> phenylalanineMg = GeneratedColumn<double>(
      'phenylalanine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tyrosineMgMeta =
      const VerificationMeta('tyrosineMg');
  @override
  late final GeneratedColumn<double> tyrosineMg = GeneratedColumn<double>(
      'tyrosine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _valineMgMeta =
      const VerificationMeta('valineMg');
  @override
  late final GeneratedColumn<double> valineMg = GeneratedColumn<double>(
      'valine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _arginineMgMeta =
      const VerificationMeta('arginineMg');
  @override
  late final GeneratedColumn<double> arginineMg = GeneratedColumn<double>(
      'arginine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _histidineMgMeta =
      const VerificationMeta('histidineMg');
  @override
  late final GeneratedColumn<double> histidineMg = GeneratedColumn<double>(
      'histidine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _alanineMgMeta =
      const VerificationMeta('alanineMg');
  @override
  late final GeneratedColumn<double> alanineMg = GeneratedColumn<double>(
      'alanine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _asparticAcidMgMeta =
      const VerificationMeta('asparticAcidMg');
  @override
  late final GeneratedColumn<double> asparticAcidMg = GeneratedColumn<double>(
      'aspartic_acid_mg', aliasedName, true,
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
  static const VerificationMeta _prolineMgMeta =
      const VerificationMeta('prolineMg');
  @override
  late final GeneratedColumn<double> prolineMg = GeneratedColumn<double>(
      'proline_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _serineMgMeta =
      const VerificationMeta('serineMg');
  @override
  late final GeneratedColumn<double> serineMg = GeneratedColumn<double>(
      'serine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _hydroxyprolineMgMeta =
      const VerificationMeta('hydroxyprolineMg');
  @override
  late final GeneratedColumn<double> hydroxyprolineMg = GeneratedColumn<double>(
      'hydroxyproline_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _alcoholGMeta =
      const VerificationMeta('alcoholG');
  @override
  late final GeneratedColumn<double> alcoholG = GeneratedColumn<double>(
      'alcohol_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _caffeineMgMeta =
      const VerificationMeta('caffeineMg');
  @override
  late final GeneratedColumn<double> caffeineMg = GeneratedColumn<double>(
      'caffeine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _theobromineMgMeta =
      const VerificationMeta('theobromineMg');
  @override
  late final GeneratedColumn<double> theobromineMg = GeneratedColumn<double>(
      'theobromine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight1GMeta =
      const VerificationMeta('servingWeight1G');
  @override
  late final GeneratedColumn<double> servingWeight1G = GeneratedColumn<double>(
      'serving_weight_1_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription1GMeta =
      const VerificationMeta('servingDescription1G');
  @override
  late final GeneratedColumn<String> servingDescription1G =
      GeneratedColumn<String>('serving_description_1_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight2GMeta =
      const VerificationMeta('servingWeight2G');
  @override
  late final GeneratedColumn<double> servingWeight2G = GeneratedColumn<double>(
      'serving_weight_2_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription2GMeta =
      const VerificationMeta('servingDescription2G');
  @override
  late final GeneratedColumn<String> servingDescription2G =
      GeneratedColumn<String>('serving_description_2_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight3GMeta =
      const VerificationMeta('servingWeight3G');
  @override
  late final GeneratedColumn<double> servingWeight3G = GeneratedColumn<double>(
      'serving_weight_3_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription3GMeta =
      const VerificationMeta('servingDescription3G');
  @override
  late final GeneratedColumn<String> servingDescription3G =
      GeneratedColumn<String>('serving_description_3_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight4GMeta =
      const VerificationMeta('servingWeight4G');
  @override
  late final GeneratedColumn<double> servingWeight4G = GeneratedColumn<double>(
      'serving_weight_4_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription4GMeta =
      const VerificationMeta('servingDescription4G');
  @override
  late final GeneratedColumn<String> servingDescription4G =
      GeneratedColumn<String>('serving_description_4_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight5GMeta =
      const VerificationMeta('servingWeight5G');
  @override
  late final GeneratedColumn<double> servingWeight5G = GeneratedColumn<double>(
      'serving_weight_5_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription5GMeta =
      const VerificationMeta('servingDescription5G');
  @override
  late final GeneratedColumn<String> servingDescription5G =
      GeneratedColumn<String>('serving_description_5_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight6GMeta =
      const VerificationMeta('servingWeight6G');
  @override
  late final GeneratedColumn<double> servingWeight6G = GeneratedColumn<double>(
      'serving_weight_6_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription6GMeta =
      const VerificationMeta('servingDescription6G');
  @override
  late final GeneratedColumn<String> servingDescription6G =
      GeneratedColumn<String>('serving_description_6_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight7GMeta =
      const VerificationMeta('servingWeight7G');
  @override
  late final GeneratedColumn<double> servingWeight7G = GeneratedColumn<double>(
      'serving_weight_7_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription7GMeta =
      const VerificationMeta('servingDescription7G');
  @override
  late final GeneratedColumn<String> servingDescription7G =
      GeneratedColumn<String>('serving_description_7_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight8GMeta =
      const VerificationMeta('servingWeight8G');
  @override
  late final GeneratedColumn<double> servingWeight8G = GeneratedColumn<double>(
      'serving_weight_8_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription8GMeta =
      const VerificationMeta('servingDescription8G');
  @override
  late final GeneratedColumn<String> servingDescription8G =
      GeneratedColumn<String>('serving_description_8_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingWeight9GMeta =
      const VerificationMeta('servingWeight9G');
  @override
  late final GeneratedColumn<double> servingWeight9G = GeneratedColumn<double>(
      'serving_weight_9_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingDescription9GMeta =
      const VerificationMeta('servingDescription9G');
  @override
  late final GeneratedColumn<String> servingDescription9G =
      GeneratedColumn<String>('serving_description_9_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _u200calorieWeightGMeta =
      const VerificationMeta('u200calorieWeightG');
  @override
  late final GeneratedColumn<double> u200calorieWeightG =
      GeneratedColumn<double>('_200_calorie_weight_g', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        foodGroup,
        calories,
        fatG,
        proteinG,
        carbohydrateG,
        sugarsG,
        fiberG,
        cholesterolMg,
        saturatedFatsG,
        calciumMg,
        ironFeMg,
        potassiumKMg,
        magnesiumMg,
        vitaminAIuIu,
        vitaminARaeMcg,
        vitaminCMg,
        vitaminB12Mcg,
        vitaminDMcg,
        vitaminEAlphaTocopherolMg,
        addedSugarG,
        netCarbsG,
        waterG,
        omega3sMg,
        omega6sMg,
        pralScore,
        transFattyAcidsG,
        solubleFiberG,
        insolubleFiberG,
        sucroseG,
        glucoseDextroseG,
        fructoseG,
        lactoseG,
        maltoseG,
        galactoseG,
        starchG,
        totalSugarAlcoholsG,
        phosphorusPMg,
        sodiumMg,
        zincZnMg,
        copperCuMg,
        manganeseMg,
        seleniumSeMcg,
        fluorideFMcg,
        molybdenumMcg,
        chlorineMg,
        thiaminB1Mg,
        riboflavinB2Mg,
        niacinB3Mg,
        pantothenicAcidB5Mg,
        vitaminB6Mg,
        biotinB7Mcg,
        folateB9Mcg,
        folicAcidMcg,
        foodFolateMcg,
        folateDfeMcg,
        cholineMg,
        betaineMg,
        retinolMcg,
        caroteneBetaMcg,
        caroteneAlphaMcg,
        lycopeneMcg,
        luteinZeaxanthinMcg,
        vitaminD2ErgocalciferolMcg,
        vitaminD3CholecalciferolMcg,
        vitaminDIuIu,
        vitaminKMcg,
        dihydrophylloquinoneMcg,
        menaquinone4Mcg,
        fattyAcidsTotalMonounsaturatedMg,
        fattyAcidsTotalPolyunsaturatedMg,
        u183N3CCCAlaMg,
        u205N3EpaMg,
        u225N3DpaMg,
        u226N3DhaMg,
        tryptophanMg,
        threonineMg,
        isoleucineMg,
        leucineMg,
        lysineMg,
        methionineMg,
        cystineMg,
        phenylalanineMg,
        tyrosineMg,
        valineMg,
        arginineMg,
        histidineMg,
        alanineMg,
        asparticAcidMg,
        glutamicAcidMg,
        glycineMg,
        prolineMg,
        serineMg,
        hydroxyprolineMg,
        alcoholG,
        caffeineMg,
        theobromineMg,
        servingWeight1G,
        servingDescription1G,
        servingWeight2G,
        servingDescription2G,
        servingWeight3G,
        servingDescription3G,
        servingWeight4G,
        servingDescription4G,
        servingWeight5G,
        servingDescription5G,
        servingWeight6G,
        servingDescription6G,
        servingWeight7G,
        servingDescription7G,
        servingWeight8G,
        servingDescription8G,
        servingWeight9G,
        servingDescription9G,
        u200calorieWeightG
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('food_group')) {
      context.handle(_foodGroupMeta,
          foodGroup.isAcceptableOrUnknown(data['food_group']!, _foodGroupMeta));
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    }
    if (data.containsKey('fat_g')) {
      context.handle(
          _fatGMeta, fatG.isAcceptableOrUnknown(data['fat_g']!, _fatGMeta));
    }
    if (data.containsKey('protein_g')) {
      context.handle(_proteinGMeta,
          proteinG.isAcceptableOrUnknown(data['protein_g']!, _proteinGMeta));
    }
    if (data.containsKey('carbohydrate_g')) {
      context.handle(
          _carbohydrateGMeta,
          carbohydrateG.isAcceptableOrUnknown(
              data['carbohydrate_g']!, _carbohydrateGMeta));
    }
    if (data.containsKey('sugars_g')) {
      context.handle(_sugarsGMeta,
          sugarsG.isAcceptableOrUnknown(data['sugars_g']!, _sugarsGMeta));
    }
    if (data.containsKey('fiber_g')) {
      context.handle(_fiberGMeta,
          fiberG.isAcceptableOrUnknown(data['fiber_g']!, _fiberGMeta));
    }
    if (data.containsKey('cholesterol_mg')) {
      context.handle(
          _cholesterolMgMeta,
          cholesterolMg.isAcceptableOrUnknown(
              data['cholesterol_mg']!, _cholesterolMgMeta));
    }
    if (data.containsKey('saturated_fats_g')) {
      context.handle(
          _saturatedFatsGMeta,
          saturatedFatsG.isAcceptableOrUnknown(
              data['saturated_fats_g']!, _saturatedFatsGMeta));
    }
    if (data.containsKey('calcium_mg')) {
      context.handle(_calciumMgMeta,
          calciumMg.isAcceptableOrUnknown(data['calcium_mg']!, _calciumMgMeta));
    }
    if (data.containsKey('iron_fe_mg')) {
      context.handle(_ironFeMgMeta,
          ironFeMg.isAcceptableOrUnknown(data['iron_fe_mg']!, _ironFeMgMeta));
    }
    if (data.containsKey('potassium_k_mg')) {
      context.handle(
          _potassiumKMgMeta,
          potassiumKMg.isAcceptableOrUnknown(
              data['potassium_k_mg']!, _potassiumKMgMeta));
    }
    if (data.containsKey('magnesium_mg')) {
      context.handle(
          _magnesiumMgMeta,
          magnesiumMg.isAcceptableOrUnknown(
              data['magnesium_mg']!, _magnesiumMgMeta));
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
    if (data.containsKey('vitamin_c_mg')) {
      context.handle(
          _vitaminCMgMeta,
          vitaminCMg.isAcceptableOrUnknown(
              data['vitamin_c_mg']!, _vitaminCMgMeta));
    }
    if (data.containsKey('vitamin_b_12_mcg')) {
      context.handle(
          _vitaminB12McgMeta,
          vitaminB12Mcg.isAcceptableOrUnknown(
              data['vitamin_b_12_mcg']!, _vitaminB12McgMeta));
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
    if (data.containsKey('added_sugar_g')) {
      context.handle(
          _addedSugarGMeta,
          addedSugarG.isAcceptableOrUnknown(
              data['added_sugar_g']!, _addedSugarGMeta));
    }
    if (data.containsKey('net_carbs_g')) {
      context.handle(
          _netCarbsGMeta,
          netCarbsG.isAcceptableOrUnknown(
              data['net_carbs_g']!, _netCarbsGMeta));
    }
    if (data.containsKey('water_g')) {
      context.handle(_waterGMeta,
          waterG.isAcceptableOrUnknown(data['water_g']!, _waterGMeta));
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
    if (data.containsKey('pral_score')) {
      context.handle(_pralScoreMeta,
          pralScore.isAcceptableOrUnknown(data['pral_score']!, _pralScoreMeta));
    }
    if (data.containsKey('trans_fatty_acids_g')) {
      context.handle(
          _transFattyAcidsGMeta,
          transFattyAcidsG.isAcceptableOrUnknown(
              data['trans_fatty_acids_g']!, _transFattyAcidsGMeta));
    }
    if (data.containsKey('soluble_fiber_g')) {
      context.handle(
          _solubleFiberGMeta,
          solubleFiberG.isAcceptableOrUnknown(
              data['soluble_fiber_g']!, _solubleFiberGMeta));
    }
    if (data.containsKey('insoluble_fiber_g')) {
      context.handle(
          _insolubleFiberGMeta,
          insolubleFiberG.isAcceptableOrUnknown(
              data['insoluble_fiber_g']!, _insolubleFiberGMeta));
    }
    if (data.containsKey('sucrose_g')) {
      context.handle(_sucroseGMeta,
          sucroseG.isAcceptableOrUnknown(data['sucrose_g']!, _sucroseGMeta));
    }
    if (data.containsKey('glucose_dextrose_g')) {
      context.handle(
          _glucoseDextroseGMeta,
          glucoseDextroseG.isAcceptableOrUnknown(
              data['glucose_dextrose_g']!, _glucoseDextroseGMeta));
    }
    if (data.containsKey('fructose_g')) {
      context.handle(_fructoseGMeta,
          fructoseG.isAcceptableOrUnknown(data['fructose_g']!, _fructoseGMeta));
    }
    if (data.containsKey('lactose_g')) {
      context.handle(_lactoseGMeta,
          lactoseG.isAcceptableOrUnknown(data['lactose_g']!, _lactoseGMeta));
    }
    if (data.containsKey('maltose_g')) {
      context.handle(_maltoseGMeta,
          maltoseG.isAcceptableOrUnknown(data['maltose_g']!, _maltoseGMeta));
    }
    if (data.containsKey('galactose_g')) {
      context.handle(
          _galactoseGMeta,
          galactoseG.isAcceptableOrUnknown(
              data['galactose_g']!, _galactoseGMeta));
    }
    if (data.containsKey('starch_g')) {
      context.handle(_starchGMeta,
          starchG.isAcceptableOrUnknown(data['starch_g']!, _starchGMeta));
    }
    if (data.containsKey('total_sugar_alcohols_g')) {
      context.handle(
          _totalSugarAlcoholsGMeta,
          totalSugarAlcoholsG.isAcceptableOrUnknown(
              data['total_sugar_alcohols_g']!, _totalSugarAlcoholsGMeta));
    }
    if (data.containsKey('phosphorus_p_mg')) {
      context.handle(
          _phosphorusPMgMeta,
          phosphorusPMg.isAcceptableOrUnknown(
              data['phosphorus_p_mg']!, _phosphorusPMgMeta));
    }
    if (data.containsKey('sodium_mg')) {
      context.handle(_sodiumMgMeta,
          sodiumMg.isAcceptableOrUnknown(data['sodium_mg']!, _sodiumMgMeta));
    }
    if (data.containsKey('zinc_zn_mg')) {
      context.handle(_zincZnMgMeta,
          zincZnMg.isAcceptableOrUnknown(data['zinc_zn_mg']!, _zincZnMgMeta));
    }
    if (data.containsKey('copper_cu_mg')) {
      context.handle(
          _copperCuMgMeta,
          copperCuMg.isAcceptableOrUnknown(
              data['copper_cu_mg']!, _copperCuMgMeta));
    }
    if (data.containsKey('manganese_mg')) {
      context.handle(
          _manganeseMgMeta,
          manganeseMg.isAcceptableOrUnknown(
              data['manganese_mg']!, _manganeseMgMeta));
    }
    if (data.containsKey('selenium_se_mcg')) {
      context.handle(
          _seleniumSeMcgMeta,
          seleniumSeMcg.isAcceptableOrUnknown(
              data['selenium_se_mcg']!, _seleniumSeMcgMeta));
    }
    if (data.containsKey('fluoride_f_mcg')) {
      context.handle(
          _fluorideFMcgMeta,
          fluorideFMcg.isAcceptableOrUnknown(
              data['fluoride_f_mcg']!, _fluorideFMcgMeta));
    }
    if (data.containsKey('molybdenum_mcg')) {
      context.handle(
          _molybdenumMcgMeta,
          molybdenumMcg.isAcceptableOrUnknown(
              data['molybdenum_mcg']!, _molybdenumMcgMeta));
    }
    if (data.containsKey('chlorine_mg')) {
      context.handle(
          _chlorineMgMeta,
          chlorineMg.isAcceptableOrUnknown(
              data['chlorine_mg']!, _chlorineMgMeta));
    }
    if (data.containsKey('thiamin_b1_mg')) {
      context.handle(
          _thiaminB1MgMeta,
          thiaminB1Mg.isAcceptableOrUnknown(
              data['thiamin_b1_mg']!, _thiaminB1MgMeta));
    }
    if (data.containsKey('riboflavin_b2_mg')) {
      context.handle(
          _riboflavinB2MgMeta,
          riboflavinB2Mg.isAcceptableOrUnknown(
              data['riboflavin_b2_mg']!, _riboflavinB2MgMeta));
    }
    if (data.containsKey('niacin_b3_mg')) {
      context.handle(
          _niacinB3MgMeta,
          niacinB3Mg.isAcceptableOrUnknown(
              data['niacin_b3_mg']!, _niacinB3MgMeta));
    }
    if (data.containsKey('pantothenic_acid_b5_mg')) {
      context.handle(
          _pantothenicAcidB5MgMeta,
          pantothenicAcidB5Mg.isAcceptableOrUnknown(
              data['pantothenic_acid_b5_mg']!, _pantothenicAcidB5MgMeta));
    }
    if (data.containsKey('vitamin_b6_mg')) {
      context.handle(
          _vitaminB6MgMeta,
          vitaminB6Mg.isAcceptableOrUnknown(
              data['vitamin_b6_mg']!, _vitaminB6MgMeta));
    }
    if (data.containsKey('biotin_b7_mcg')) {
      context.handle(
          _biotinB7McgMeta,
          biotinB7Mcg.isAcceptableOrUnknown(
              data['biotin_b7_mcg']!, _biotinB7McgMeta));
    }
    if (data.containsKey('folate_b9_mcg')) {
      context.handle(
          _folateB9McgMeta,
          folateB9Mcg.isAcceptableOrUnknown(
              data['folate_b9_mcg']!, _folateB9McgMeta));
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
    if (data.containsKey('folate_dfe_mcg')) {
      context.handle(
          _folateDfeMcgMeta,
          folateDfeMcg.isAcceptableOrUnknown(
              data['folate_dfe_mcg']!, _folateDfeMcgMeta));
    }
    if (data.containsKey('choline_mg')) {
      context.handle(_cholineMgMeta,
          cholineMg.isAcceptableOrUnknown(data['choline_mg']!, _cholineMgMeta));
    }
    if (data.containsKey('betaine_mg')) {
      context.handle(_betaineMgMeta,
          betaineMg.isAcceptableOrUnknown(data['betaine_mg']!, _betaineMgMeta));
    }
    if (data.containsKey('retinol_mcg')) {
      context.handle(
          _retinolMcgMeta,
          retinolMcg.isAcceptableOrUnknown(
              data['retinol_mcg']!, _retinolMcgMeta));
    }
    if (data.containsKey('carotene_beta_mcg')) {
      context.handle(
          _caroteneBetaMcgMeta,
          caroteneBetaMcg.isAcceptableOrUnknown(
              data['carotene_beta_mcg']!, _caroteneBetaMcgMeta));
    }
    if (data.containsKey('carotene_alpha_mcg')) {
      context.handle(
          _caroteneAlphaMcgMeta,
          caroteneAlphaMcg.isAcceptableOrUnknown(
              data['carotene_alpha_mcg']!, _caroteneAlphaMcgMeta));
    }
    if (data.containsKey('lycopene_mcg')) {
      context.handle(
          _lycopeneMcgMeta,
          lycopeneMcg.isAcceptableOrUnknown(
              data['lycopene_mcg']!, _lycopeneMcgMeta));
    }
    if (data.containsKey('lutein_zeaxanthin_mcg')) {
      context.handle(
          _luteinZeaxanthinMcgMeta,
          luteinZeaxanthinMcg.isAcceptableOrUnknown(
              data['lutein_zeaxanthin_mcg']!, _luteinZeaxanthinMcgMeta));
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
    if (data.containsKey('vitamin_k_mcg')) {
      context.handle(
          _vitaminKMcgMeta,
          vitaminKMcg.isAcceptableOrUnknown(
              data['vitamin_k_mcg']!, _vitaminKMcgMeta));
    }
    if (data.containsKey('dihydrophylloquinone_mcg')) {
      context.handle(
          _dihydrophylloquinoneMcgMeta,
          dihydrophylloquinoneMcg.isAcceptableOrUnknown(
              data['dihydrophylloquinone_mcg']!, _dihydrophylloquinoneMcgMeta));
    }
    if (data.containsKey('menaquinone_4_mcg')) {
      context.handle(
          _menaquinone4McgMeta,
          menaquinone4Mcg.isAcceptableOrUnknown(
              data['menaquinone_4_mcg']!, _menaquinone4McgMeta));
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
    if (data.containsKey('_18_3_n_3_c_c_c_ala_mg')) {
      context.handle(
          _u183N3CCCAlaMgMeta,
          u183N3CCCAlaMg.isAcceptableOrUnknown(
              data['_18_3_n_3_c_c_c_ala_mg']!, _u183N3CCCAlaMgMeta));
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
    if (data.containsKey('tryptophan_mg')) {
      context.handle(
          _tryptophanMgMeta,
          tryptophanMg.isAcceptableOrUnknown(
              data['tryptophan_mg']!, _tryptophanMgMeta));
    }
    if (data.containsKey('threonine_mg')) {
      context.handle(
          _threonineMgMeta,
          threonineMg.isAcceptableOrUnknown(
              data['threonine_mg']!, _threonineMgMeta));
    }
    if (data.containsKey('isoleucine_mg')) {
      context.handle(
          _isoleucineMgMeta,
          isoleucineMg.isAcceptableOrUnknown(
              data['isoleucine_mg']!, _isoleucineMgMeta));
    }
    if (data.containsKey('leucine_mg')) {
      context.handle(_leucineMgMeta,
          leucineMg.isAcceptableOrUnknown(data['leucine_mg']!, _leucineMgMeta));
    }
    if (data.containsKey('lysine_mg')) {
      context.handle(_lysineMgMeta,
          lysineMg.isAcceptableOrUnknown(data['lysine_mg']!, _lysineMgMeta));
    }
    if (data.containsKey('methionine_mg')) {
      context.handle(
          _methionineMgMeta,
          methionineMg.isAcceptableOrUnknown(
              data['methionine_mg']!, _methionineMgMeta));
    }
    if (data.containsKey('cystine_mg')) {
      context.handle(_cystineMgMeta,
          cystineMg.isAcceptableOrUnknown(data['cystine_mg']!, _cystineMgMeta));
    }
    if (data.containsKey('phenylalanine_mg')) {
      context.handle(
          _phenylalanineMgMeta,
          phenylalanineMg.isAcceptableOrUnknown(
              data['phenylalanine_mg']!, _phenylalanineMgMeta));
    }
    if (data.containsKey('tyrosine_mg')) {
      context.handle(
          _tyrosineMgMeta,
          tyrosineMg.isAcceptableOrUnknown(
              data['tyrosine_mg']!, _tyrosineMgMeta));
    }
    if (data.containsKey('valine_mg')) {
      context.handle(_valineMgMeta,
          valineMg.isAcceptableOrUnknown(data['valine_mg']!, _valineMgMeta));
    }
    if (data.containsKey('arginine_mg')) {
      context.handle(
          _arginineMgMeta,
          arginineMg.isAcceptableOrUnknown(
              data['arginine_mg']!, _arginineMgMeta));
    }
    if (data.containsKey('histidine_mg')) {
      context.handle(
          _histidineMgMeta,
          histidineMg.isAcceptableOrUnknown(
              data['histidine_mg']!, _histidineMgMeta));
    }
    if (data.containsKey('alanine_mg')) {
      context.handle(_alanineMgMeta,
          alanineMg.isAcceptableOrUnknown(data['alanine_mg']!, _alanineMgMeta));
    }
    if (data.containsKey('aspartic_acid_mg')) {
      context.handle(
          _asparticAcidMgMeta,
          asparticAcidMg.isAcceptableOrUnknown(
              data['aspartic_acid_mg']!, _asparticAcidMgMeta));
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
    if (data.containsKey('proline_mg')) {
      context.handle(_prolineMgMeta,
          prolineMg.isAcceptableOrUnknown(data['proline_mg']!, _prolineMgMeta));
    }
    if (data.containsKey('serine_mg')) {
      context.handle(_serineMgMeta,
          serineMg.isAcceptableOrUnknown(data['serine_mg']!, _serineMgMeta));
    }
    if (data.containsKey('hydroxyproline_mg')) {
      context.handle(
          _hydroxyprolineMgMeta,
          hydroxyprolineMg.isAcceptableOrUnknown(
              data['hydroxyproline_mg']!, _hydroxyprolineMgMeta));
    }
    if (data.containsKey('alcohol_g')) {
      context.handle(_alcoholGMeta,
          alcoholG.isAcceptableOrUnknown(data['alcohol_g']!, _alcoholGMeta));
    }
    if (data.containsKey('caffeine_mg')) {
      context.handle(
          _caffeineMgMeta,
          caffeineMg.isAcceptableOrUnknown(
              data['caffeine_mg']!, _caffeineMgMeta));
    }
    if (data.containsKey('theobromine_mg')) {
      context.handle(
          _theobromineMgMeta,
          theobromineMg.isAcceptableOrUnknown(
              data['theobromine_mg']!, _theobromineMgMeta));
    }
    if (data.containsKey('serving_weight_1_g')) {
      context.handle(
          _servingWeight1GMeta,
          servingWeight1G.isAcceptableOrUnknown(
              data['serving_weight_1_g']!, _servingWeight1GMeta));
    }
    if (data.containsKey('serving_description_1_g')) {
      context.handle(
          _servingDescription1GMeta,
          servingDescription1G.isAcceptableOrUnknown(
              data['serving_description_1_g']!, _servingDescription1GMeta));
    }
    if (data.containsKey('serving_weight_2_g')) {
      context.handle(
          _servingWeight2GMeta,
          servingWeight2G.isAcceptableOrUnknown(
              data['serving_weight_2_g']!, _servingWeight2GMeta));
    }
    if (data.containsKey('serving_description_2_g')) {
      context.handle(
          _servingDescription2GMeta,
          servingDescription2G.isAcceptableOrUnknown(
              data['serving_description_2_g']!, _servingDescription2GMeta));
    }
    if (data.containsKey('serving_weight_3_g')) {
      context.handle(
          _servingWeight3GMeta,
          servingWeight3G.isAcceptableOrUnknown(
              data['serving_weight_3_g']!, _servingWeight3GMeta));
    }
    if (data.containsKey('serving_description_3_g')) {
      context.handle(
          _servingDescription3GMeta,
          servingDescription3G.isAcceptableOrUnknown(
              data['serving_description_3_g']!, _servingDescription3GMeta));
    }
    if (data.containsKey('serving_weight_4_g')) {
      context.handle(
          _servingWeight4GMeta,
          servingWeight4G.isAcceptableOrUnknown(
              data['serving_weight_4_g']!, _servingWeight4GMeta));
    }
    if (data.containsKey('serving_description_4_g')) {
      context.handle(
          _servingDescription4GMeta,
          servingDescription4G.isAcceptableOrUnknown(
              data['serving_description_4_g']!, _servingDescription4GMeta));
    }
    if (data.containsKey('serving_weight_5_g')) {
      context.handle(
          _servingWeight5GMeta,
          servingWeight5G.isAcceptableOrUnknown(
              data['serving_weight_5_g']!, _servingWeight5GMeta));
    }
    if (data.containsKey('serving_description_5_g')) {
      context.handle(
          _servingDescription5GMeta,
          servingDescription5G.isAcceptableOrUnknown(
              data['serving_description_5_g']!, _servingDescription5GMeta));
    }
    if (data.containsKey('serving_weight_6_g')) {
      context.handle(
          _servingWeight6GMeta,
          servingWeight6G.isAcceptableOrUnknown(
              data['serving_weight_6_g']!, _servingWeight6GMeta));
    }
    if (data.containsKey('serving_description_6_g')) {
      context.handle(
          _servingDescription6GMeta,
          servingDescription6G.isAcceptableOrUnknown(
              data['serving_description_6_g']!, _servingDescription6GMeta));
    }
    if (data.containsKey('serving_weight_7_g')) {
      context.handle(
          _servingWeight7GMeta,
          servingWeight7G.isAcceptableOrUnknown(
              data['serving_weight_7_g']!, _servingWeight7GMeta));
    }
    if (data.containsKey('serving_description_7_g')) {
      context.handle(
          _servingDescription7GMeta,
          servingDescription7G.isAcceptableOrUnknown(
              data['serving_description_7_g']!, _servingDescription7GMeta));
    }
    if (data.containsKey('serving_weight_8_g')) {
      context.handle(
          _servingWeight8GMeta,
          servingWeight8G.isAcceptableOrUnknown(
              data['serving_weight_8_g']!, _servingWeight8GMeta));
    }
    if (data.containsKey('serving_description_8_g')) {
      context.handle(
          _servingDescription8GMeta,
          servingDescription8G.isAcceptableOrUnknown(
              data['serving_description_8_g']!, _servingDescription8GMeta));
    }
    if (data.containsKey('serving_weight_9_g')) {
      context.handle(
          _servingWeight9GMeta,
          servingWeight9G.isAcceptableOrUnknown(
              data['serving_weight_9_g']!, _servingWeight9GMeta));
    }
    if (data.containsKey('serving_description_9_g')) {
      context.handle(
          _servingDescription9GMeta,
          servingDescription9G.isAcceptableOrUnknown(
              data['serving_description_9_g']!, _servingDescription9GMeta));
    }
    if (data.containsKey('_200_calorie_weight_g')) {
      context.handle(
          _u200calorieWeightGMeta,
          u200calorieWeightG.isAcceptableOrUnknown(
              data['_200_calorie_weight_g']!, _u200calorieWeightGMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Food(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      foodGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_group']),
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calories']),
      fatG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat_g']),
      proteinG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein_g']),
      carbohydrateG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbohydrate_g']),
      sugarsG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sugars_g']),
      fiberG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fiber_g']),
      cholesterolMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cholesterol_mg']),
      saturatedFatsG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}saturated_fats_g']),
      calciumMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calcium_mg']),
      ironFeMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}iron_fe_mg']),
      potassiumKMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}potassium_k_mg']),
      magnesiumMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}magnesium_mg']),
      vitaminAIuIu: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_a_iu_iu']),
      vitaminARaeMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}vitamin_a_rae_mcg']),
      vitaminCMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_c_mg']),
      vitaminB12Mcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}vitamin_b_12_mcg']),
      vitaminDMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_d_mcg']),
      vitaminEAlphaTocopherolMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}vitamin_e_alpha_tocopherol_mg']),
      addedSugarG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}added_sugar_g']),
      netCarbsG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_carbs_g']),
      waterG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}water_g']),
      omega3sMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}omega_3s_mg']),
      omega6sMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}omega_6s_mg']),
      pralScore: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pral_score']),
      transFattyAcidsG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}trans_fatty_acids_g']),
      solubleFiberG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}soluble_fiber_g']),
      insolubleFiberG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}insoluble_fiber_g']),
      sucroseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sucrose_g']),
      glucoseDextroseG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}glucose_dextrose_g']),
      fructoseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fructose_g']),
      lactoseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lactose_g']),
      maltoseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}maltose_g']),
      galactoseG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}galactose_g']),
      starchG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}starch_g']),
      totalSugarAlcoholsG: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}total_sugar_alcohols_g']),
      phosphorusPMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}phosphorus_p_mg']),
      sodiumMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sodium_mg']),
      zincZnMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}zinc_zn_mg']),
      copperCuMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}copper_cu_mg']),
      manganeseMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}manganese_mg']),
      seleniumSeMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}selenium_se_mcg']),
      fluorideFMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fluoride_f_mcg']),
      molybdenumMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}molybdenum_mcg']),
      chlorineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}chlorine_mg']),
      thiaminB1Mg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}thiamin_b1_mg']),
      riboflavinB2Mg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}riboflavin_b2_mg']),
      niacinB3Mg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}niacin_b3_mg']),
      pantothenicAcidB5Mg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}pantothenic_acid_b5_mg']),
      vitaminB6Mg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_b6_mg']),
      biotinB7Mcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}biotin_b7_mcg']),
      folateB9Mcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}folate_b9_mcg']),
      folicAcidMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}folic_acid_mcg']),
      foodFolateMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}food_folate_mcg']),
      folateDfeMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}folate_dfe_mcg']),
      cholineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}choline_mg']),
      betaineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}betaine_mg']),
      retinolMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}retinol_mcg']),
      caroteneBetaMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}carotene_beta_mcg']),
      caroteneAlphaMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}carotene_alpha_mcg']),
      lycopeneMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lycopene_mcg']),
      luteinZeaxanthinMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}lutein_zeaxanthin_mcg']),
      vitaminD2ErgocalciferolMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}vitamin_d2_ergocalciferol_mcg']),
      vitaminD3CholecalciferolMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}vitamin_d3_cholecalciferol_mcg']),
      vitaminDIuIu: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_d_iu_iu']),
      vitaminKMcg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_k_mcg']),
      dihydrophylloquinoneMcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}dihydrophylloquinone_mcg']),
      menaquinone4Mcg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}menaquinone_4_mcg']),
      fattyAcidsTotalMonounsaturatedMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}fatty_acids_total_monounsaturated_mg']),
      fattyAcidsTotalPolyunsaturatedMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}fatty_acids_total_polyunsaturated_mg']),
      u183N3CCCAlaMg: attachedDatabase.typeMapping.read(DriftSqlType.double,
          data['${effectivePrefix}_18_3_n_3_c_c_c_ala_mg']),
      u205N3EpaMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}_20_5_n_3_epa_mg']),
      u225N3DpaMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}_22_5_n_3_dpa_mg']),
      u226N3DhaMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}_22_6_n_3_dha_mg']),
      tryptophanMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tryptophan_mg']),
      threonineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}threonine_mg']),
      isoleucineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}isoleucine_mg']),
      leucineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}leucine_mg']),
      lysineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lysine_mg']),
      methionineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}methionine_mg']),
      cystineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cystine_mg']),
      phenylalanineMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}phenylalanine_mg']),
      tyrosineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tyrosine_mg']),
      valineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}valine_mg']),
      arginineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}arginine_mg']),
      histidineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}histidine_mg']),
      alanineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}alanine_mg']),
      asparticAcidMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}aspartic_acid_mg']),
      glutamicAcidMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}glutamic_acid_mg']),
      glycineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}glycine_mg']),
      prolineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}proline_mg']),
      serineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}serine_mg']),
      hydroxyprolineMg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}hydroxyproline_mg']),
      alcoholG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}alcohol_g']),
      caffeineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}caffeine_mg']),
      theobromineMg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}theobromine_mg']),
      servingWeight1G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_1_g']),
      servingDescription1G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_1_g']),
      servingWeight2G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_2_g']),
      servingDescription2G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_2_g']),
      servingWeight3G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_3_g']),
      servingDescription3G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_3_g']),
      servingWeight4G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_4_g']),
      servingDescription4G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_4_g']),
      servingWeight5G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_5_g']),
      servingDescription5G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_5_g']),
      servingWeight6G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_6_g']),
      servingDescription6G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_6_g']),
      servingWeight7G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_7_g']),
      servingDescription7G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_7_g']),
      servingWeight8G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_8_g']),
      servingDescription8G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_8_g']),
      servingWeight9G: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_weight_9_g']),
      servingDescription9G: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}serving_description_9_g']),
      u200calorieWeightG: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}_200_calorie_weight_g']),
    );
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(attachedDatabase, alias);
  }
}

class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String name;
  final String? foodGroup;
  final double? calories;
  final double? fatG;
  final double? proteinG;
  final double? carbohydrateG;
  final double? sugarsG;
  final double? fiberG;
  final double? cholesterolMg;
  final double? saturatedFatsG;
  final double? calciumMg;
  final double? ironFeMg;
  final double? potassiumKMg;
  final double? magnesiumMg;
  final double? vitaminAIuIu;
  final double? vitaminARaeMcg;
  final double? vitaminCMg;
  final double? vitaminB12Mcg;
  final double? vitaminDMcg;
  final double? vitaminEAlphaTocopherolMg;
  final double? addedSugarG;
  final double? netCarbsG;
  final double? waterG;
  final double? omega3sMg;
  final double? omega6sMg;
  final double? pralScore;
  final double? transFattyAcidsG;
  final double? solubleFiberG;
  final double? insolubleFiberG;
  final double? sucroseG;
  final double? glucoseDextroseG;
  final double? fructoseG;
  final double? lactoseG;
  final double? maltoseG;
  final double? galactoseG;
  final double? starchG;
  final double? totalSugarAlcoholsG;
  final double? phosphorusPMg;
  final double? sodiumMg;
  final double? zincZnMg;
  final double? copperCuMg;
  final double? manganeseMg;
  final double? seleniumSeMcg;
  final double? fluorideFMcg;
  final double? molybdenumMcg;
  final double? chlorineMg;
  final double? thiaminB1Mg;
  final double? riboflavinB2Mg;
  final double? niacinB3Mg;
  final double? pantothenicAcidB5Mg;
  final double? vitaminB6Mg;
  final double? biotinB7Mcg;
  final double? folateB9Mcg;
  final double? folicAcidMcg;
  final double? foodFolateMcg;
  final double? folateDfeMcg;
  final double? cholineMg;
  final double? betaineMg;
  final double? retinolMcg;
  final double? caroteneBetaMcg;
  final double? caroteneAlphaMcg;
  final double? lycopeneMcg;
  final double? luteinZeaxanthinMcg;
  final double? vitaminD2ErgocalciferolMcg;
  final double? vitaminD3CholecalciferolMcg;
  final double? vitaminDIuIu;
  final double? vitaminKMcg;
  final double? dihydrophylloquinoneMcg;
  final double? menaquinone4Mcg;
  final double? fattyAcidsTotalMonounsaturatedMg;
  final double? fattyAcidsTotalPolyunsaturatedMg;
  final double? u183N3CCCAlaMg;
  final double? u205N3EpaMg;
  final double? u225N3DpaMg;
  final double? u226N3DhaMg;
  final double? tryptophanMg;
  final double? threonineMg;
  final double? isoleucineMg;
  final double? leucineMg;
  final double? lysineMg;
  final double? methionineMg;
  final double? cystineMg;
  final double? phenylalanineMg;
  final double? tyrosineMg;
  final double? valineMg;
  final double? arginineMg;
  final double? histidineMg;
  final double? alanineMg;
  final double? asparticAcidMg;
  final double? glutamicAcidMg;
  final double? glycineMg;
  final double? prolineMg;
  final double? serineMg;
  final double? hydroxyprolineMg;
  final double? alcoholG;
  final double? caffeineMg;
  final double? theobromineMg;
  final double? servingWeight1G;
  final String? servingDescription1G;
  final double? servingWeight2G;
  final String? servingDescription2G;
  final double? servingWeight3G;
  final String? servingDescription3G;
  final double? servingWeight4G;
  final String? servingDescription4G;
  final double? servingWeight5G;
  final String? servingDescription5G;
  final double? servingWeight6G;
  final String? servingDescription6G;
  final double? servingWeight7G;
  final String? servingDescription7G;
  final double? servingWeight8G;
  final String? servingDescription8G;
  final double? servingWeight9G;
  final String? servingDescription9G;
  final double? u200calorieWeightG;
  const Food(
      {required this.id,
      required this.name,
      this.foodGroup,
      this.calories,
      this.fatG,
      this.proteinG,
      this.carbohydrateG,
      this.sugarsG,
      this.fiberG,
      this.cholesterolMg,
      this.saturatedFatsG,
      this.calciumMg,
      this.ironFeMg,
      this.potassiumKMg,
      this.magnesiumMg,
      this.vitaminAIuIu,
      this.vitaminARaeMcg,
      this.vitaminCMg,
      this.vitaminB12Mcg,
      this.vitaminDMcg,
      this.vitaminEAlphaTocopherolMg,
      this.addedSugarG,
      this.netCarbsG,
      this.waterG,
      this.omega3sMg,
      this.omega6sMg,
      this.pralScore,
      this.transFattyAcidsG,
      this.solubleFiberG,
      this.insolubleFiberG,
      this.sucroseG,
      this.glucoseDextroseG,
      this.fructoseG,
      this.lactoseG,
      this.maltoseG,
      this.galactoseG,
      this.starchG,
      this.totalSugarAlcoholsG,
      this.phosphorusPMg,
      this.sodiumMg,
      this.zincZnMg,
      this.copperCuMg,
      this.manganeseMg,
      this.seleniumSeMcg,
      this.fluorideFMcg,
      this.molybdenumMcg,
      this.chlorineMg,
      this.thiaminB1Mg,
      this.riboflavinB2Mg,
      this.niacinB3Mg,
      this.pantothenicAcidB5Mg,
      this.vitaminB6Mg,
      this.biotinB7Mcg,
      this.folateB9Mcg,
      this.folicAcidMcg,
      this.foodFolateMcg,
      this.folateDfeMcg,
      this.cholineMg,
      this.betaineMg,
      this.retinolMcg,
      this.caroteneBetaMcg,
      this.caroteneAlphaMcg,
      this.lycopeneMcg,
      this.luteinZeaxanthinMcg,
      this.vitaminD2ErgocalciferolMcg,
      this.vitaminD3CholecalciferolMcg,
      this.vitaminDIuIu,
      this.vitaminKMcg,
      this.dihydrophylloquinoneMcg,
      this.menaquinone4Mcg,
      this.fattyAcidsTotalMonounsaturatedMg,
      this.fattyAcidsTotalPolyunsaturatedMg,
      this.u183N3CCCAlaMg,
      this.u205N3EpaMg,
      this.u225N3DpaMg,
      this.u226N3DhaMg,
      this.tryptophanMg,
      this.threonineMg,
      this.isoleucineMg,
      this.leucineMg,
      this.lysineMg,
      this.methionineMg,
      this.cystineMg,
      this.phenylalanineMg,
      this.tyrosineMg,
      this.valineMg,
      this.arginineMg,
      this.histidineMg,
      this.alanineMg,
      this.asparticAcidMg,
      this.glutamicAcidMg,
      this.glycineMg,
      this.prolineMg,
      this.serineMg,
      this.hydroxyprolineMg,
      this.alcoholG,
      this.caffeineMg,
      this.theobromineMg,
      this.servingWeight1G,
      this.servingDescription1G,
      this.servingWeight2G,
      this.servingDescription2G,
      this.servingWeight3G,
      this.servingDescription3G,
      this.servingWeight4G,
      this.servingDescription4G,
      this.servingWeight5G,
      this.servingDescription5G,
      this.servingWeight6G,
      this.servingDescription6G,
      this.servingWeight7G,
      this.servingDescription7G,
      this.servingWeight8G,
      this.servingDescription8G,
      this.servingWeight9G,
      this.servingDescription9G,
      this.u200calorieWeightG});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || foodGroup != null) {
      map['food_group'] = Variable<String>(foodGroup);
    }
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<double>(calories);
    }
    if (!nullToAbsent || fatG != null) {
      map['fat_g'] = Variable<double>(fatG);
    }
    if (!nullToAbsent || proteinG != null) {
      map['protein_g'] = Variable<double>(proteinG);
    }
    if (!nullToAbsent || carbohydrateG != null) {
      map['carbohydrate_g'] = Variable<double>(carbohydrateG);
    }
    if (!nullToAbsent || sugarsG != null) {
      map['sugars_g'] = Variable<double>(sugarsG);
    }
    if (!nullToAbsent || fiberG != null) {
      map['fiber_g'] = Variable<double>(fiberG);
    }
    if (!nullToAbsent || cholesterolMg != null) {
      map['cholesterol_mg'] = Variable<double>(cholesterolMg);
    }
    if (!nullToAbsent || saturatedFatsG != null) {
      map['saturated_fats_g'] = Variable<double>(saturatedFatsG);
    }
    if (!nullToAbsent || calciumMg != null) {
      map['calcium_mg'] = Variable<double>(calciumMg);
    }
    if (!nullToAbsent || ironFeMg != null) {
      map['iron_fe_mg'] = Variable<double>(ironFeMg);
    }
    if (!nullToAbsent || potassiumKMg != null) {
      map['potassium_k_mg'] = Variable<double>(potassiumKMg);
    }
    if (!nullToAbsent || magnesiumMg != null) {
      map['magnesium_mg'] = Variable<double>(magnesiumMg);
    }
    if (!nullToAbsent || vitaminAIuIu != null) {
      map['vitamin_a_iu_iu'] = Variable<double>(vitaminAIuIu);
    }
    if (!nullToAbsent || vitaminARaeMcg != null) {
      map['vitamin_a_rae_mcg'] = Variable<double>(vitaminARaeMcg);
    }
    if (!nullToAbsent || vitaminCMg != null) {
      map['vitamin_c_mg'] = Variable<double>(vitaminCMg);
    }
    if (!nullToAbsent || vitaminB12Mcg != null) {
      map['vitamin_b_12_mcg'] = Variable<double>(vitaminB12Mcg);
    }
    if (!nullToAbsent || vitaminDMcg != null) {
      map['vitamin_d_mcg'] = Variable<double>(vitaminDMcg);
    }
    if (!nullToAbsent || vitaminEAlphaTocopherolMg != null) {
      map['vitamin_e_alpha_tocopherol_mg'] =
          Variable<double>(vitaminEAlphaTocopherolMg);
    }
    if (!nullToAbsent || addedSugarG != null) {
      map['added_sugar_g'] = Variable<double>(addedSugarG);
    }
    if (!nullToAbsent || netCarbsG != null) {
      map['net_carbs_g'] = Variable<double>(netCarbsG);
    }
    if (!nullToAbsent || waterG != null) {
      map['water_g'] = Variable<double>(waterG);
    }
    if (!nullToAbsent || omega3sMg != null) {
      map['omega_3s_mg'] = Variable<double>(omega3sMg);
    }
    if (!nullToAbsent || omega6sMg != null) {
      map['omega_6s_mg'] = Variable<double>(omega6sMg);
    }
    if (!nullToAbsent || pralScore != null) {
      map['pral_score'] = Variable<double>(pralScore);
    }
    if (!nullToAbsent || transFattyAcidsG != null) {
      map['trans_fatty_acids_g'] = Variable<double>(transFattyAcidsG);
    }
    if (!nullToAbsent || solubleFiberG != null) {
      map['soluble_fiber_g'] = Variable<double>(solubleFiberG);
    }
    if (!nullToAbsent || insolubleFiberG != null) {
      map['insoluble_fiber_g'] = Variable<double>(insolubleFiberG);
    }
    if (!nullToAbsent || sucroseG != null) {
      map['sucrose_g'] = Variable<double>(sucroseG);
    }
    if (!nullToAbsent || glucoseDextroseG != null) {
      map['glucose_dextrose_g'] = Variable<double>(glucoseDextroseG);
    }
    if (!nullToAbsent || fructoseG != null) {
      map['fructose_g'] = Variable<double>(fructoseG);
    }
    if (!nullToAbsent || lactoseG != null) {
      map['lactose_g'] = Variable<double>(lactoseG);
    }
    if (!nullToAbsent || maltoseG != null) {
      map['maltose_g'] = Variable<double>(maltoseG);
    }
    if (!nullToAbsent || galactoseG != null) {
      map['galactose_g'] = Variable<double>(galactoseG);
    }
    if (!nullToAbsent || starchG != null) {
      map['starch_g'] = Variable<double>(starchG);
    }
    if (!nullToAbsent || totalSugarAlcoholsG != null) {
      map['total_sugar_alcohols_g'] = Variable<double>(totalSugarAlcoholsG);
    }
    if (!nullToAbsent || phosphorusPMg != null) {
      map['phosphorus_p_mg'] = Variable<double>(phosphorusPMg);
    }
    if (!nullToAbsent || sodiumMg != null) {
      map['sodium_mg'] = Variable<double>(sodiumMg);
    }
    if (!nullToAbsent || zincZnMg != null) {
      map['zinc_zn_mg'] = Variable<double>(zincZnMg);
    }
    if (!nullToAbsent || copperCuMg != null) {
      map['copper_cu_mg'] = Variable<double>(copperCuMg);
    }
    if (!nullToAbsent || manganeseMg != null) {
      map['manganese_mg'] = Variable<double>(manganeseMg);
    }
    if (!nullToAbsent || seleniumSeMcg != null) {
      map['selenium_se_mcg'] = Variable<double>(seleniumSeMcg);
    }
    if (!nullToAbsent || fluorideFMcg != null) {
      map['fluoride_f_mcg'] = Variable<double>(fluorideFMcg);
    }
    if (!nullToAbsent || molybdenumMcg != null) {
      map['molybdenum_mcg'] = Variable<double>(molybdenumMcg);
    }
    if (!nullToAbsent || chlorineMg != null) {
      map['chlorine_mg'] = Variable<double>(chlorineMg);
    }
    if (!nullToAbsent || thiaminB1Mg != null) {
      map['thiamin_b1_mg'] = Variable<double>(thiaminB1Mg);
    }
    if (!nullToAbsent || riboflavinB2Mg != null) {
      map['riboflavin_b2_mg'] = Variable<double>(riboflavinB2Mg);
    }
    if (!nullToAbsent || niacinB3Mg != null) {
      map['niacin_b3_mg'] = Variable<double>(niacinB3Mg);
    }
    if (!nullToAbsent || pantothenicAcidB5Mg != null) {
      map['pantothenic_acid_b5_mg'] = Variable<double>(pantothenicAcidB5Mg);
    }
    if (!nullToAbsent || vitaminB6Mg != null) {
      map['vitamin_b6_mg'] = Variable<double>(vitaminB6Mg);
    }
    if (!nullToAbsent || biotinB7Mcg != null) {
      map['biotin_b7_mcg'] = Variable<double>(biotinB7Mcg);
    }
    if (!nullToAbsent || folateB9Mcg != null) {
      map['folate_b9_mcg'] = Variable<double>(folateB9Mcg);
    }
    if (!nullToAbsent || folicAcidMcg != null) {
      map['folic_acid_mcg'] = Variable<double>(folicAcidMcg);
    }
    if (!nullToAbsent || foodFolateMcg != null) {
      map['food_folate_mcg'] = Variable<double>(foodFolateMcg);
    }
    if (!nullToAbsent || folateDfeMcg != null) {
      map['folate_dfe_mcg'] = Variable<double>(folateDfeMcg);
    }
    if (!nullToAbsent || cholineMg != null) {
      map['choline_mg'] = Variable<double>(cholineMg);
    }
    if (!nullToAbsent || betaineMg != null) {
      map['betaine_mg'] = Variable<double>(betaineMg);
    }
    if (!nullToAbsent || retinolMcg != null) {
      map['retinol_mcg'] = Variable<double>(retinolMcg);
    }
    if (!nullToAbsent || caroteneBetaMcg != null) {
      map['carotene_beta_mcg'] = Variable<double>(caroteneBetaMcg);
    }
    if (!nullToAbsent || caroteneAlphaMcg != null) {
      map['carotene_alpha_mcg'] = Variable<double>(caroteneAlphaMcg);
    }
    if (!nullToAbsent || lycopeneMcg != null) {
      map['lycopene_mcg'] = Variable<double>(lycopeneMcg);
    }
    if (!nullToAbsent || luteinZeaxanthinMcg != null) {
      map['lutein_zeaxanthin_mcg'] = Variable<double>(luteinZeaxanthinMcg);
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
    if (!nullToAbsent || vitaminKMcg != null) {
      map['vitamin_k_mcg'] = Variable<double>(vitaminKMcg);
    }
    if (!nullToAbsent || dihydrophylloquinoneMcg != null) {
      map['dihydrophylloquinone_mcg'] =
          Variable<double>(dihydrophylloquinoneMcg);
    }
    if (!nullToAbsent || menaquinone4Mcg != null) {
      map['menaquinone_4_mcg'] = Variable<double>(menaquinone4Mcg);
    }
    if (!nullToAbsent || fattyAcidsTotalMonounsaturatedMg != null) {
      map['fatty_acids_total_monounsaturated_mg'] =
          Variable<double>(fattyAcidsTotalMonounsaturatedMg);
    }
    if (!nullToAbsent || fattyAcidsTotalPolyunsaturatedMg != null) {
      map['fatty_acids_total_polyunsaturated_mg'] =
          Variable<double>(fattyAcidsTotalPolyunsaturatedMg);
    }
    if (!nullToAbsent || u183N3CCCAlaMg != null) {
      map['_18_3_n_3_c_c_c_ala_mg'] = Variable<double>(u183N3CCCAlaMg);
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
    if (!nullToAbsent || tryptophanMg != null) {
      map['tryptophan_mg'] = Variable<double>(tryptophanMg);
    }
    if (!nullToAbsent || threonineMg != null) {
      map['threonine_mg'] = Variable<double>(threonineMg);
    }
    if (!nullToAbsent || isoleucineMg != null) {
      map['isoleucine_mg'] = Variable<double>(isoleucineMg);
    }
    if (!nullToAbsent || leucineMg != null) {
      map['leucine_mg'] = Variable<double>(leucineMg);
    }
    if (!nullToAbsent || lysineMg != null) {
      map['lysine_mg'] = Variable<double>(lysineMg);
    }
    if (!nullToAbsent || methionineMg != null) {
      map['methionine_mg'] = Variable<double>(methionineMg);
    }
    if (!nullToAbsent || cystineMg != null) {
      map['cystine_mg'] = Variable<double>(cystineMg);
    }
    if (!nullToAbsent || phenylalanineMg != null) {
      map['phenylalanine_mg'] = Variable<double>(phenylalanineMg);
    }
    if (!nullToAbsent || tyrosineMg != null) {
      map['tyrosine_mg'] = Variable<double>(tyrosineMg);
    }
    if (!nullToAbsent || valineMg != null) {
      map['valine_mg'] = Variable<double>(valineMg);
    }
    if (!nullToAbsent || arginineMg != null) {
      map['arginine_mg'] = Variable<double>(arginineMg);
    }
    if (!nullToAbsent || histidineMg != null) {
      map['histidine_mg'] = Variable<double>(histidineMg);
    }
    if (!nullToAbsent || alanineMg != null) {
      map['alanine_mg'] = Variable<double>(alanineMg);
    }
    if (!nullToAbsent || asparticAcidMg != null) {
      map['aspartic_acid_mg'] = Variable<double>(asparticAcidMg);
    }
    if (!nullToAbsent || glutamicAcidMg != null) {
      map['glutamic_acid_mg'] = Variable<double>(glutamicAcidMg);
    }
    if (!nullToAbsent || glycineMg != null) {
      map['glycine_mg'] = Variable<double>(glycineMg);
    }
    if (!nullToAbsent || prolineMg != null) {
      map['proline_mg'] = Variable<double>(prolineMg);
    }
    if (!nullToAbsent || serineMg != null) {
      map['serine_mg'] = Variable<double>(serineMg);
    }
    if (!nullToAbsent || hydroxyprolineMg != null) {
      map['hydroxyproline_mg'] = Variable<double>(hydroxyprolineMg);
    }
    if (!nullToAbsent || alcoholG != null) {
      map['alcohol_g'] = Variable<double>(alcoholG);
    }
    if (!nullToAbsent || caffeineMg != null) {
      map['caffeine_mg'] = Variable<double>(caffeineMg);
    }
    if (!nullToAbsent || theobromineMg != null) {
      map['theobromine_mg'] = Variable<double>(theobromineMg);
    }
    if (!nullToAbsent || servingWeight1G != null) {
      map['serving_weight_1_g'] = Variable<double>(servingWeight1G);
    }
    if (!nullToAbsent || servingDescription1G != null) {
      map['serving_description_1_g'] = Variable<String>(servingDescription1G);
    }
    if (!nullToAbsent || servingWeight2G != null) {
      map['serving_weight_2_g'] = Variable<double>(servingWeight2G);
    }
    if (!nullToAbsent || servingDescription2G != null) {
      map['serving_description_2_g'] = Variable<String>(servingDescription2G);
    }
    if (!nullToAbsent || servingWeight3G != null) {
      map['serving_weight_3_g'] = Variable<double>(servingWeight3G);
    }
    if (!nullToAbsent || servingDescription3G != null) {
      map['serving_description_3_g'] = Variable<String>(servingDescription3G);
    }
    if (!nullToAbsent || servingWeight4G != null) {
      map['serving_weight_4_g'] = Variable<double>(servingWeight4G);
    }
    if (!nullToAbsent || servingDescription4G != null) {
      map['serving_description_4_g'] = Variable<String>(servingDescription4G);
    }
    if (!nullToAbsent || servingWeight5G != null) {
      map['serving_weight_5_g'] = Variable<double>(servingWeight5G);
    }
    if (!nullToAbsent || servingDescription5G != null) {
      map['serving_description_5_g'] = Variable<String>(servingDescription5G);
    }
    if (!nullToAbsent || servingWeight6G != null) {
      map['serving_weight_6_g'] = Variable<double>(servingWeight6G);
    }
    if (!nullToAbsent || servingDescription6G != null) {
      map['serving_description_6_g'] = Variable<String>(servingDescription6G);
    }
    if (!nullToAbsent || servingWeight7G != null) {
      map['serving_weight_7_g'] = Variable<double>(servingWeight7G);
    }
    if (!nullToAbsent || servingDescription7G != null) {
      map['serving_description_7_g'] = Variable<String>(servingDescription7G);
    }
    if (!nullToAbsent || servingWeight8G != null) {
      map['serving_weight_8_g'] = Variable<double>(servingWeight8G);
    }
    if (!nullToAbsent || servingDescription8G != null) {
      map['serving_description_8_g'] = Variable<String>(servingDescription8G);
    }
    if (!nullToAbsent || servingWeight9G != null) {
      map['serving_weight_9_g'] = Variable<double>(servingWeight9G);
    }
    if (!nullToAbsent || servingDescription9G != null) {
      map['serving_description_9_g'] = Variable<String>(servingDescription9G);
    }
    if (!nullToAbsent || u200calorieWeightG != null) {
      map['_200_calorie_weight_g'] = Variable<double>(u200calorieWeightG);
    }
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: Value(id),
      name: Value(name),
      foodGroup: foodGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(foodGroup),
      calories: calories == null && nullToAbsent
          ? const Value.absent()
          : Value(calories),
      fatG: fatG == null && nullToAbsent ? const Value.absent() : Value(fatG),
      proteinG: proteinG == null && nullToAbsent
          ? const Value.absent()
          : Value(proteinG),
      carbohydrateG: carbohydrateG == null && nullToAbsent
          ? const Value.absent()
          : Value(carbohydrateG),
      sugarsG: sugarsG == null && nullToAbsent
          ? const Value.absent()
          : Value(sugarsG),
      fiberG:
          fiberG == null && nullToAbsent ? const Value.absent() : Value(fiberG),
      cholesterolMg: cholesterolMg == null && nullToAbsent
          ? const Value.absent()
          : Value(cholesterolMg),
      saturatedFatsG: saturatedFatsG == null && nullToAbsent
          ? const Value.absent()
          : Value(saturatedFatsG),
      calciumMg: calciumMg == null && nullToAbsent
          ? const Value.absent()
          : Value(calciumMg),
      ironFeMg: ironFeMg == null && nullToAbsent
          ? const Value.absent()
          : Value(ironFeMg),
      potassiumKMg: potassiumKMg == null && nullToAbsent
          ? const Value.absent()
          : Value(potassiumKMg),
      magnesiumMg: magnesiumMg == null && nullToAbsent
          ? const Value.absent()
          : Value(magnesiumMg),
      vitaminAIuIu: vitaminAIuIu == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminAIuIu),
      vitaminARaeMcg: vitaminARaeMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminARaeMcg),
      vitaminCMg: vitaminCMg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminCMg),
      vitaminB12Mcg: vitaminB12Mcg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB12Mcg),
      vitaminDMcg: vitaminDMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminDMcg),
      vitaminEAlphaTocopherolMg:
          vitaminEAlphaTocopherolMg == null && nullToAbsent
              ? const Value.absent()
              : Value(vitaminEAlphaTocopherolMg),
      addedSugarG: addedSugarG == null && nullToAbsent
          ? const Value.absent()
          : Value(addedSugarG),
      netCarbsG: netCarbsG == null && nullToAbsent
          ? const Value.absent()
          : Value(netCarbsG),
      waterG:
          waterG == null && nullToAbsent ? const Value.absent() : Value(waterG),
      omega3sMg: omega3sMg == null && nullToAbsent
          ? const Value.absent()
          : Value(omega3sMg),
      omega6sMg: omega6sMg == null && nullToAbsent
          ? const Value.absent()
          : Value(omega6sMg),
      pralScore: pralScore == null && nullToAbsent
          ? const Value.absent()
          : Value(pralScore),
      transFattyAcidsG: transFattyAcidsG == null && nullToAbsent
          ? const Value.absent()
          : Value(transFattyAcidsG),
      solubleFiberG: solubleFiberG == null && nullToAbsent
          ? const Value.absent()
          : Value(solubleFiberG),
      insolubleFiberG: insolubleFiberG == null && nullToAbsent
          ? const Value.absent()
          : Value(insolubleFiberG),
      sucroseG: sucroseG == null && nullToAbsent
          ? const Value.absent()
          : Value(sucroseG),
      glucoseDextroseG: glucoseDextroseG == null && nullToAbsent
          ? const Value.absent()
          : Value(glucoseDextroseG),
      fructoseG: fructoseG == null && nullToAbsent
          ? const Value.absent()
          : Value(fructoseG),
      lactoseG: lactoseG == null && nullToAbsent
          ? const Value.absent()
          : Value(lactoseG),
      maltoseG: maltoseG == null && nullToAbsent
          ? const Value.absent()
          : Value(maltoseG),
      galactoseG: galactoseG == null && nullToAbsent
          ? const Value.absent()
          : Value(galactoseG),
      starchG: starchG == null && nullToAbsent
          ? const Value.absent()
          : Value(starchG),
      totalSugarAlcoholsG: totalSugarAlcoholsG == null && nullToAbsent
          ? const Value.absent()
          : Value(totalSugarAlcoholsG),
      phosphorusPMg: phosphorusPMg == null && nullToAbsent
          ? const Value.absent()
          : Value(phosphorusPMg),
      sodiumMg: sodiumMg == null && nullToAbsent
          ? const Value.absent()
          : Value(sodiumMg),
      zincZnMg: zincZnMg == null && nullToAbsent
          ? const Value.absent()
          : Value(zincZnMg),
      copperCuMg: copperCuMg == null && nullToAbsent
          ? const Value.absent()
          : Value(copperCuMg),
      manganeseMg: manganeseMg == null && nullToAbsent
          ? const Value.absent()
          : Value(manganeseMg),
      seleniumSeMcg: seleniumSeMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(seleniumSeMcg),
      fluorideFMcg: fluorideFMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(fluorideFMcg),
      molybdenumMcg: molybdenumMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(molybdenumMcg),
      chlorineMg: chlorineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(chlorineMg),
      thiaminB1Mg: thiaminB1Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(thiaminB1Mg),
      riboflavinB2Mg: riboflavinB2Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(riboflavinB2Mg),
      niacinB3Mg: niacinB3Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(niacinB3Mg),
      pantothenicAcidB5Mg: pantothenicAcidB5Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(pantothenicAcidB5Mg),
      vitaminB6Mg: vitaminB6Mg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminB6Mg),
      biotinB7Mcg: biotinB7Mcg == null && nullToAbsent
          ? const Value.absent()
          : Value(biotinB7Mcg),
      folateB9Mcg: folateB9Mcg == null && nullToAbsent
          ? const Value.absent()
          : Value(folateB9Mcg),
      folicAcidMcg: folicAcidMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(folicAcidMcg),
      foodFolateMcg: foodFolateMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(foodFolateMcg),
      folateDfeMcg: folateDfeMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(folateDfeMcg),
      cholineMg: cholineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(cholineMg),
      betaineMg: betaineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(betaineMg),
      retinolMcg: retinolMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(retinolMcg),
      caroteneBetaMcg: caroteneBetaMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(caroteneBetaMcg),
      caroteneAlphaMcg: caroteneAlphaMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(caroteneAlphaMcg),
      lycopeneMcg: lycopeneMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(lycopeneMcg),
      luteinZeaxanthinMcg: luteinZeaxanthinMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(luteinZeaxanthinMcg),
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
      vitaminKMcg: vitaminKMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminKMcg),
      dihydrophylloquinoneMcg: dihydrophylloquinoneMcg == null && nullToAbsent
          ? const Value.absent()
          : Value(dihydrophylloquinoneMcg),
      menaquinone4Mcg: menaquinone4Mcg == null && nullToAbsent
          ? const Value.absent()
          : Value(menaquinone4Mcg),
      fattyAcidsTotalMonounsaturatedMg:
          fattyAcidsTotalMonounsaturatedMg == null && nullToAbsent
              ? const Value.absent()
              : Value(fattyAcidsTotalMonounsaturatedMg),
      fattyAcidsTotalPolyunsaturatedMg:
          fattyAcidsTotalPolyunsaturatedMg == null && nullToAbsent
              ? const Value.absent()
              : Value(fattyAcidsTotalPolyunsaturatedMg),
      u183N3CCCAlaMg: u183N3CCCAlaMg == null && nullToAbsent
          ? const Value.absent()
          : Value(u183N3CCCAlaMg),
      u205N3EpaMg: u205N3EpaMg == null && nullToAbsent
          ? const Value.absent()
          : Value(u205N3EpaMg),
      u225N3DpaMg: u225N3DpaMg == null && nullToAbsent
          ? const Value.absent()
          : Value(u225N3DpaMg),
      u226N3DhaMg: u226N3DhaMg == null && nullToAbsent
          ? const Value.absent()
          : Value(u226N3DhaMg),
      tryptophanMg: tryptophanMg == null && nullToAbsent
          ? const Value.absent()
          : Value(tryptophanMg),
      threonineMg: threonineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(threonineMg),
      isoleucineMg: isoleucineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(isoleucineMg),
      leucineMg: leucineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(leucineMg),
      lysineMg: lysineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(lysineMg),
      methionineMg: methionineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(methionineMg),
      cystineMg: cystineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(cystineMg),
      phenylalanineMg: phenylalanineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(phenylalanineMg),
      tyrosineMg: tyrosineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(tyrosineMg),
      valineMg: valineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(valineMg),
      arginineMg: arginineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(arginineMg),
      histidineMg: histidineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(histidineMg),
      alanineMg: alanineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(alanineMg),
      asparticAcidMg: asparticAcidMg == null && nullToAbsent
          ? const Value.absent()
          : Value(asparticAcidMg),
      glutamicAcidMg: glutamicAcidMg == null && nullToAbsent
          ? const Value.absent()
          : Value(glutamicAcidMg),
      glycineMg: glycineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(glycineMg),
      prolineMg: prolineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(prolineMg),
      serineMg: serineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(serineMg),
      hydroxyprolineMg: hydroxyprolineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(hydroxyprolineMg),
      alcoholG: alcoholG == null && nullToAbsent
          ? const Value.absent()
          : Value(alcoholG),
      caffeineMg: caffeineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(caffeineMg),
      theobromineMg: theobromineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(theobromineMg),
      servingWeight1G: servingWeight1G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight1G),
      servingDescription1G: servingDescription1G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription1G),
      servingWeight2G: servingWeight2G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight2G),
      servingDescription2G: servingDescription2G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription2G),
      servingWeight3G: servingWeight3G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight3G),
      servingDescription3G: servingDescription3G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription3G),
      servingWeight4G: servingWeight4G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight4G),
      servingDescription4G: servingDescription4G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription4G),
      servingWeight5G: servingWeight5G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight5G),
      servingDescription5G: servingDescription5G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription5G),
      servingWeight6G: servingWeight6G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight6G),
      servingDescription6G: servingDescription6G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription6G),
      servingWeight7G: servingWeight7G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight7G),
      servingDescription7G: servingDescription7G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription7G),
      servingWeight8G: servingWeight8G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight8G),
      servingDescription8G: servingDescription8G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription8G),
      servingWeight9G: servingWeight9G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingWeight9G),
      servingDescription9G: servingDescription9G == null && nullToAbsent
          ? const Value.absent()
          : Value(servingDescription9G),
      u200calorieWeightG: u200calorieWeightG == null && nullToAbsent
          ? const Value.absent()
          : Value(u200calorieWeightG),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      foodGroup: serializer.fromJson<String?>(json['foodGroup']),
      calories: serializer.fromJson<double?>(json['calories']),
      fatG: serializer.fromJson<double?>(json['fatG']),
      proteinG: serializer.fromJson<double?>(json['proteinG']),
      carbohydrateG: serializer.fromJson<double?>(json['carbohydrateG']),
      sugarsG: serializer.fromJson<double?>(json['sugarsG']),
      fiberG: serializer.fromJson<double?>(json['fiberG']),
      cholesterolMg: serializer.fromJson<double?>(json['cholesterolMg']),
      saturatedFatsG: serializer.fromJson<double?>(json['saturatedFatsG']),
      calciumMg: serializer.fromJson<double?>(json['calciumMg']),
      ironFeMg: serializer.fromJson<double?>(json['ironFeMg']),
      potassiumKMg: serializer.fromJson<double?>(json['potassiumKMg']),
      magnesiumMg: serializer.fromJson<double?>(json['magnesiumMg']),
      vitaminAIuIu: serializer.fromJson<double?>(json['vitaminAIuIu']),
      vitaminARaeMcg: serializer.fromJson<double?>(json['vitaminARaeMcg']),
      vitaminCMg: serializer.fromJson<double?>(json['vitaminCMg']),
      vitaminB12Mcg: serializer.fromJson<double?>(json['vitaminB12Mcg']),
      vitaminDMcg: serializer.fromJson<double?>(json['vitaminDMcg']),
      vitaminEAlphaTocopherolMg:
          serializer.fromJson<double?>(json['vitaminEAlphaTocopherolMg']),
      addedSugarG: serializer.fromJson<double?>(json['addedSugarG']),
      netCarbsG: serializer.fromJson<double?>(json['netCarbsG']),
      waterG: serializer.fromJson<double?>(json['waterG']),
      omega3sMg: serializer.fromJson<double?>(json['omega3sMg']),
      omega6sMg: serializer.fromJson<double?>(json['omega6sMg']),
      pralScore: serializer.fromJson<double?>(json['pralScore']),
      transFattyAcidsG: serializer.fromJson<double?>(json['transFattyAcidsG']),
      solubleFiberG: serializer.fromJson<double?>(json['solubleFiberG']),
      insolubleFiberG: serializer.fromJson<double?>(json['insolubleFiberG']),
      sucroseG: serializer.fromJson<double?>(json['sucroseG']),
      glucoseDextroseG: serializer.fromJson<double?>(json['glucoseDextroseG']),
      fructoseG: serializer.fromJson<double?>(json['fructoseG']),
      lactoseG: serializer.fromJson<double?>(json['lactoseG']),
      maltoseG: serializer.fromJson<double?>(json['maltoseG']),
      galactoseG: serializer.fromJson<double?>(json['galactoseG']),
      starchG: serializer.fromJson<double?>(json['starchG']),
      totalSugarAlcoholsG:
          serializer.fromJson<double?>(json['totalSugarAlcoholsG']),
      phosphorusPMg: serializer.fromJson<double?>(json['phosphorusPMg']),
      sodiumMg: serializer.fromJson<double?>(json['sodiumMg']),
      zincZnMg: serializer.fromJson<double?>(json['zincZnMg']),
      copperCuMg: serializer.fromJson<double?>(json['copperCuMg']),
      manganeseMg: serializer.fromJson<double?>(json['manganeseMg']),
      seleniumSeMcg: serializer.fromJson<double?>(json['seleniumSeMcg']),
      fluorideFMcg: serializer.fromJson<double?>(json['fluorideFMcg']),
      molybdenumMcg: serializer.fromJson<double?>(json['molybdenumMcg']),
      chlorineMg: serializer.fromJson<double?>(json['chlorineMg']),
      thiaminB1Mg: serializer.fromJson<double?>(json['thiaminB1Mg']),
      riboflavinB2Mg: serializer.fromJson<double?>(json['riboflavinB2Mg']),
      niacinB3Mg: serializer.fromJson<double?>(json['niacinB3Mg']),
      pantothenicAcidB5Mg:
          serializer.fromJson<double?>(json['pantothenicAcidB5Mg']),
      vitaminB6Mg: serializer.fromJson<double?>(json['vitaminB6Mg']),
      biotinB7Mcg: serializer.fromJson<double?>(json['biotinB7Mcg']),
      folateB9Mcg: serializer.fromJson<double?>(json['folateB9Mcg']),
      folicAcidMcg: serializer.fromJson<double?>(json['folicAcidMcg']),
      foodFolateMcg: serializer.fromJson<double?>(json['foodFolateMcg']),
      folateDfeMcg: serializer.fromJson<double?>(json['folateDfeMcg']),
      cholineMg: serializer.fromJson<double?>(json['cholineMg']),
      betaineMg: serializer.fromJson<double?>(json['betaineMg']),
      retinolMcg: serializer.fromJson<double?>(json['retinolMcg']),
      caroteneBetaMcg: serializer.fromJson<double?>(json['caroteneBetaMcg']),
      caroteneAlphaMcg: serializer.fromJson<double?>(json['caroteneAlphaMcg']),
      lycopeneMcg: serializer.fromJson<double?>(json['lycopeneMcg']),
      luteinZeaxanthinMcg:
          serializer.fromJson<double?>(json['luteinZeaxanthinMcg']),
      vitaminD2ErgocalciferolMcg:
          serializer.fromJson<double?>(json['vitaminD2ErgocalciferolMcg']),
      vitaminD3CholecalciferolMcg:
          serializer.fromJson<double?>(json['vitaminD3CholecalciferolMcg']),
      vitaminDIuIu: serializer.fromJson<double?>(json['vitaminDIuIu']),
      vitaminKMcg: serializer.fromJson<double?>(json['vitaminKMcg']),
      dihydrophylloquinoneMcg:
          serializer.fromJson<double?>(json['dihydrophylloquinoneMcg']),
      menaquinone4Mcg: serializer.fromJson<double?>(json['menaquinone4Mcg']),
      fattyAcidsTotalMonounsaturatedMg: serializer
          .fromJson<double?>(json['fattyAcidsTotalMonounsaturatedMg']),
      fattyAcidsTotalPolyunsaturatedMg: serializer
          .fromJson<double?>(json['fattyAcidsTotalPolyunsaturatedMg']),
      u183N3CCCAlaMg: serializer.fromJson<double?>(json['u183N3CCCAlaMg']),
      u205N3EpaMg: serializer.fromJson<double?>(json['u205N3EpaMg']),
      u225N3DpaMg: serializer.fromJson<double?>(json['u225N3DpaMg']),
      u226N3DhaMg: serializer.fromJson<double?>(json['u226N3DhaMg']),
      tryptophanMg: serializer.fromJson<double?>(json['tryptophanMg']),
      threonineMg: serializer.fromJson<double?>(json['threonineMg']),
      isoleucineMg: serializer.fromJson<double?>(json['isoleucineMg']),
      leucineMg: serializer.fromJson<double?>(json['leucineMg']),
      lysineMg: serializer.fromJson<double?>(json['lysineMg']),
      methionineMg: serializer.fromJson<double?>(json['methionineMg']),
      cystineMg: serializer.fromJson<double?>(json['cystineMg']),
      phenylalanineMg: serializer.fromJson<double?>(json['phenylalanineMg']),
      tyrosineMg: serializer.fromJson<double?>(json['tyrosineMg']),
      valineMg: serializer.fromJson<double?>(json['valineMg']),
      arginineMg: serializer.fromJson<double?>(json['arginineMg']),
      histidineMg: serializer.fromJson<double?>(json['histidineMg']),
      alanineMg: serializer.fromJson<double?>(json['alanineMg']),
      asparticAcidMg: serializer.fromJson<double?>(json['asparticAcidMg']),
      glutamicAcidMg: serializer.fromJson<double?>(json['glutamicAcidMg']),
      glycineMg: serializer.fromJson<double?>(json['glycineMg']),
      prolineMg: serializer.fromJson<double?>(json['prolineMg']),
      serineMg: serializer.fromJson<double?>(json['serineMg']),
      hydroxyprolineMg: serializer.fromJson<double?>(json['hydroxyprolineMg']),
      alcoholG: serializer.fromJson<double?>(json['alcoholG']),
      caffeineMg: serializer.fromJson<double?>(json['caffeineMg']),
      theobromineMg: serializer.fromJson<double?>(json['theobromineMg']),
      servingWeight1G: serializer.fromJson<double?>(json['servingWeight1G']),
      servingDescription1G:
          serializer.fromJson<String?>(json['servingDescription1G']),
      servingWeight2G: serializer.fromJson<double?>(json['servingWeight2G']),
      servingDescription2G:
          serializer.fromJson<String?>(json['servingDescription2G']),
      servingWeight3G: serializer.fromJson<double?>(json['servingWeight3G']),
      servingDescription3G:
          serializer.fromJson<String?>(json['servingDescription3G']),
      servingWeight4G: serializer.fromJson<double?>(json['servingWeight4G']),
      servingDescription4G:
          serializer.fromJson<String?>(json['servingDescription4G']),
      servingWeight5G: serializer.fromJson<double?>(json['servingWeight5G']),
      servingDescription5G:
          serializer.fromJson<String?>(json['servingDescription5G']),
      servingWeight6G: serializer.fromJson<double?>(json['servingWeight6G']),
      servingDescription6G:
          serializer.fromJson<String?>(json['servingDescription6G']),
      servingWeight7G: serializer.fromJson<double?>(json['servingWeight7G']),
      servingDescription7G:
          serializer.fromJson<String?>(json['servingDescription7G']),
      servingWeight8G: serializer.fromJson<double?>(json['servingWeight8G']),
      servingDescription8G:
          serializer.fromJson<String?>(json['servingDescription8G']),
      servingWeight9G: serializer.fromJson<double?>(json['servingWeight9G']),
      servingDescription9G:
          serializer.fromJson<String?>(json['servingDescription9G']),
      u200calorieWeightG:
          serializer.fromJson<double?>(json['u200calorieWeightG']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'foodGroup': serializer.toJson<String?>(foodGroup),
      'calories': serializer.toJson<double?>(calories),
      'fatG': serializer.toJson<double?>(fatG),
      'proteinG': serializer.toJson<double?>(proteinG),
      'carbohydrateG': serializer.toJson<double?>(carbohydrateG),
      'sugarsG': serializer.toJson<double?>(sugarsG),
      'fiberG': serializer.toJson<double?>(fiberG),
      'cholesterolMg': serializer.toJson<double?>(cholesterolMg),
      'saturatedFatsG': serializer.toJson<double?>(saturatedFatsG),
      'calciumMg': serializer.toJson<double?>(calciumMg),
      'ironFeMg': serializer.toJson<double?>(ironFeMg),
      'potassiumKMg': serializer.toJson<double?>(potassiumKMg),
      'magnesiumMg': serializer.toJson<double?>(magnesiumMg),
      'vitaminAIuIu': serializer.toJson<double?>(vitaminAIuIu),
      'vitaminARaeMcg': serializer.toJson<double?>(vitaminARaeMcg),
      'vitaminCMg': serializer.toJson<double?>(vitaminCMg),
      'vitaminB12Mcg': serializer.toJson<double?>(vitaminB12Mcg),
      'vitaminDMcg': serializer.toJson<double?>(vitaminDMcg),
      'vitaminEAlphaTocopherolMg':
          serializer.toJson<double?>(vitaminEAlphaTocopherolMg),
      'addedSugarG': serializer.toJson<double?>(addedSugarG),
      'netCarbsG': serializer.toJson<double?>(netCarbsG),
      'waterG': serializer.toJson<double?>(waterG),
      'omega3sMg': serializer.toJson<double?>(omega3sMg),
      'omega6sMg': serializer.toJson<double?>(omega6sMg),
      'pralScore': serializer.toJson<double?>(pralScore),
      'transFattyAcidsG': serializer.toJson<double?>(transFattyAcidsG),
      'solubleFiberG': serializer.toJson<double?>(solubleFiberG),
      'insolubleFiberG': serializer.toJson<double?>(insolubleFiberG),
      'sucroseG': serializer.toJson<double?>(sucroseG),
      'glucoseDextroseG': serializer.toJson<double?>(glucoseDextroseG),
      'fructoseG': serializer.toJson<double?>(fructoseG),
      'lactoseG': serializer.toJson<double?>(lactoseG),
      'maltoseG': serializer.toJson<double?>(maltoseG),
      'galactoseG': serializer.toJson<double?>(galactoseG),
      'starchG': serializer.toJson<double?>(starchG),
      'totalSugarAlcoholsG': serializer.toJson<double?>(totalSugarAlcoholsG),
      'phosphorusPMg': serializer.toJson<double?>(phosphorusPMg),
      'sodiumMg': serializer.toJson<double?>(sodiumMg),
      'zincZnMg': serializer.toJson<double?>(zincZnMg),
      'copperCuMg': serializer.toJson<double?>(copperCuMg),
      'manganeseMg': serializer.toJson<double?>(manganeseMg),
      'seleniumSeMcg': serializer.toJson<double?>(seleniumSeMcg),
      'fluorideFMcg': serializer.toJson<double?>(fluorideFMcg),
      'molybdenumMcg': serializer.toJson<double?>(molybdenumMcg),
      'chlorineMg': serializer.toJson<double?>(chlorineMg),
      'thiaminB1Mg': serializer.toJson<double?>(thiaminB1Mg),
      'riboflavinB2Mg': serializer.toJson<double?>(riboflavinB2Mg),
      'niacinB3Mg': serializer.toJson<double?>(niacinB3Mg),
      'pantothenicAcidB5Mg': serializer.toJson<double?>(pantothenicAcidB5Mg),
      'vitaminB6Mg': serializer.toJson<double?>(vitaminB6Mg),
      'biotinB7Mcg': serializer.toJson<double?>(biotinB7Mcg),
      'folateB9Mcg': serializer.toJson<double?>(folateB9Mcg),
      'folicAcidMcg': serializer.toJson<double?>(folicAcidMcg),
      'foodFolateMcg': serializer.toJson<double?>(foodFolateMcg),
      'folateDfeMcg': serializer.toJson<double?>(folateDfeMcg),
      'cholineMg': serializer.toJson<double?>(cholineMg),
      'betaineMg': serializer.toJson<double?>(betaineMg),
      'retinolMcg': serializer.toJson<double?>(retinolMcg),
      'caroteneBetaMcg': serializer.toJson<double?>(caroteneBetaMcg),
      'caroteneAlphaMcg': serializer.toJson<double?>(caroteneAlphaMcg),
      'lycopeneMcg': serializer.toJson<double?>(lycopeneMcg),
      'luteinZeaxanthinMcg': serializer.toJson<double?>(luteinZeaxanthinMcg),
      'vitaminD2ErgocalciferolMcg':
          serializer.toJson<double?>(vitaminD2ErgocalciferolMcg),
      'vitaminD3CholecalciferolMcg':
          serializer.toJson<double?>(vitaminD3CholecalciferolMcg),
      'vitaminDIuIu': serializer.toJson<double?>(vitaminDIuIu),
      'vitaminKMcg': serializer.toJson<double?>(vitaminKMcg),
      'dihydrophylloquinoneMcg':
          serializer.toJson<double?>(dihydrophylloquinoneMcg),
      'menaquinone4Mcg': serializer.toJson<double?>(menaquinone4Mcg),
      'fattyAcidsTotalMonounsaturatedMg':
          serializer.toJson<double?>(fattyAcidsTotalMonounsaturatedMg),
      'fattyAcidsTotalPolyunsaturatedMg':
          serializer.toJson<double?>(fattyAcidsTotalPolyunsaturatedMg),
      'u183N3CCCAlaMg': serializer.toJson<double?>(u183N3CCCAlaMg),
      'u205N3EpaMg': serializer.toJson<double?>(u205N3EpaMg),
      'u225N3DpaMg': serializer.toJson<double?>(u225N3DpaMg),
      'u226N3DhaMg': serializer.toJson<double?>(u226N3DhaMg),
      'tryptophanMg': serializer.toJson<double?>(tryptophanMg),
      'threonineMg': serializer.toJson<double?>(threonineMg),
      'isoleucineMg': serializer.toJson<double?>(isoleucineMg),
      'leucineMg': serializer.toJson<double?>(leucineMg),
      'lysineMg': serializer.toJson<double?>(lysineMg),
      'methionineMg': serializer.toJson<double?>(methionineMg),
      'cystineMg': serializer.toJson<double?>(cystineMg),
      'phenylalanineMg': serializer.toJson<double?>(phenylalanineMg),
      'tyrosineMg': serializer.toJson<double?>(tyrosineMg),
      'valineMg': serializer.toJson<double?>(valineMg),
      'arginineMg': serializer.toJson<double?>(arginineMg),
      'histidineMg': serializer.toJson<double?>(histidineMg),
      'alanineMg': serializer.toJson<double?>(alanineMg),
      'asparticAcidMg': serializer.toJson<double?>(asparticAcidMg),
      'glutamicAcidMg': serializer.toJson<double?>(glutamicAcidMg),
      'glycineMg': serializer.toJson<double?>(glycineMg),
      'prolineMg': serializer.toJson<double?>(prolineMg),
      'serineMg': serializer.toJson<double?>(serineMg),
      'hydroxyprolineMg': serializer.toJson<double?>(hydroxyprolineMg),
      'alcoholG': serializer.toJson<double?>(alcoholG),
      'caffeineMg': serializer.toJson<double?>(caffeineMg),
      'theobromineMg': serializer.toJson<double?>(theobromineMg),
      'servingWeight1G': serializer.toJson<double?>(servingWeight1G),
      'servingDescription1G': serializer.toJson<String?>(servingDescription1G),
      'servingWeight2G': serializer.toJson<double?>(servingWeight2G),
      'servingDescription2G': serializer.toJson<String?>(servingDescription2G),
      'servingWeight3G': serializer.toJson<double?>(servingWeight3G),
      'servingDescription3G': serializer.toJson<String?>(servingDescription3G),
      'servingWeight4G': serializer.toJson<double?>(servingWeight4G),
      'servingDescription4G': serializer.toJson<String?>(servingDescription4G),
      'servingWeight5G': serializer.toJson<double?>(servingWeight5G),
      'servingDescription5G': serializer.toJson<String?>(servingDescription5G),
      'servingWeight6G': serializer.toJson<double?>(servingWeight6G),
      'servingDescription6G': serializer.toJson<String?>(servingDescription6G),
      'servingWeight7G': serializer.toJson<double?>(servingWeight7G),
      'servingDescription7G': serializer.toJson<String?>(servingDescription7G),
      'servingWeight8G': serializer.toJson<double?>(servingWeight8G),
      'servingDescription8G': serializer.toJson<String?>(servingDescription8G),
      'servingWeight9G': serializer.toJson<double?>(servingWeight9G),
      'servingDescription9G': serializer.toJson<String?>(servingDescription9G),
      'u200calorieWeightG': serializer.toJson<double?>(u200calorieWeightG),
    };
  }

  Food copyWith(
          {int? id,
          String? name,
          Value<String?> foodGroup = const Value.absent(),
          Value<double?> calories = const Value.absent(),
          Value<double?> fatG = const Value.absent(),
          Value<double?> proteinG = const Value.absent(),
          Value<double?> carbohydrateG = const Value.absent(),
          Value<double?> sugarsG = const Value.absent(),
          Value<double?> fiberG = const Value.absent(),
          Value<double?> cholesterolMg = const Value.absent(),
          Value<double?> saturatedFatsG = const Value.absent(),
          Value<double?> calciumMg = const Value.absent(),
          Value<double?> ironFeMg = const Value.absent(),
          Value<double?> potassiumKMg = const Value.absent(),
          Value<double?> magnesiumMg = const Value.absent(),
          Value<double?> vitaminAIuIu = const Value.absent(),
          Value<double?> vitaminARaeMcg = const Value.absent(),
          Value<double?> vitaminCMg = const Value.absent(),
          Value<double?> vitaminB12Mcg = const Value.absent(),
          Value<double?> vitaminDMcg = const Value.absent(),
          Value<double?> vitaminEAlphaTocopherolMg = const Value.absent(),
          Value<double?> addedSugarG = const Value.absent(),
          Value<double?> netCarbsG = const Value.absent(),
          Value<double?> waterG = const Value.absent(),
          Value<double?> omega3sMg = const Value.absent(),
          Value<double?> omega6sMg = const Value.absent(),
          Value<double?> pralScore = const Value.absent(),
          Value<double?> transFattyAcidsG = const Value.absent(),
          Value<double?> solubleFiberG = const Value.absent(),
          Value<double?> insolubleFiberG = const Value.absent(),
          Value<double?> sucroseG = const Value.absent(),
          Value<double?> glucoseDextroseG = const Value.absent(),
          Value<double?> fructoseG = const Value.absent(),
          Value<double?> lactoseG = const Value.absent(),
          Value<double?> maltoseG = const Value.absent(),
          Value<double?> galactoseG = const Value.absent(),
          Value<double?> starchG = const Value.absent(),
          Value<double?> totalSugarAlcoholsG = const Value.absent(),
          Value<double?> phosphorusPMg = const Value.absent(),
          Value<double?> sodiumMg = const Value.absent(),
          Value<double?> zincZnMg = const Value.absent(),
          Value<double?> copperCuMg = const Value.absent(),
          Value<double?> manganeseMg = const Value.absent(),
          Value<double?> seleniumSeMcg = const Value.absent(),
          Value<double?> fluorideFMcg = const Value.absent(),
          Value<double?> molybdenumMcg = const Value.absent(),
          Value<double?> chlorineMg = const Value.absent(),
          Value<double?> thiaminB1Mg = const Value.absent(),
          Value<double?> riboflavinB2Mg = const Value.absent(),
          Value<double?> niacinB3Mg = const Value.absent(),
          Value<double?> pantothenicAcidB5Mg = const Value.absent(),
          Value<double?> vitaminB6Mg = const Value.absent(),
          Value<double?> biotinB7Mcg = const Value.absent(),
          Value<double?> folateB9Mcg = const Value.absent(),
          Value<double?> folicAcidMcg = const Value.absent(),
          Value<double?> foodFolateMcg = const Value.absent(),
          Value<double?> folateDfeMcg = const Value.absent(),
          Value<double?> cholineMg = const Value.absent(),
          Value<double?> betaineMg = const Value.absent(),
          Value<double?> retinolMcg = const Value.absent(),
          Value<double?> caroteneBetaMcg = const Value.absent(),
          Value<double?> caroteneAlphaMcg = const Value.absent(),
          Value<double?> lycopeneMcg = const Value.absent(),
          Value<double?> luteinZeaxanthinMcg = const Value.absent(),
          Value<double?> vitaminD2ErgocalciferolMcg = const Value.absent(),
          Value<double?> vitaminD3CholecalciferolMcg = const Value.absent(),
          Value<double?> vitaminDIuIu = const Value.absent(),
          Value<double?> vitaminKMcg = const Value.absent(),
          Value<double?> dihydrophylloquinoneMcg = const Value.absent(),
          Value<double?> menaquinone4Mcg = const Value.absent(),
          Value<double?> fattyAcidsTotalMonounsaturatedMg =
              const Value.absent(),
          Value<double?> fattyAcidsTotalPolyunsaturatedMg =
              const Value.absent(),
          Value<double?> u183N3CCCAlaMg = const Value.absent(),
          Value<double?> u205N3EpaMg = const Value.absent(),
          Value<double?> u225N3DpaMg = const Value.absent(),
          Value<double?> u226N3DhaMg = const Value.absent(),
          Value<double?> tryptophanMg = const Value.absent(),
          Value<double?> threonineMg = const Value.absent(),
          Value<double?> isoleucineMg = const Value.absent(),
          Value<double?> leucineMg = const Value.absent(),
          Value<double?> lysineMg = const Value.absent(),
          Value<double?> methionineMg = const Value.absent(),
          Value<double?> cystineMg = const Value.absent(),
          Value<double?> phenylalanineMg = const Value.absent(),
          Value<double?> tyrosineMg = const Value.absent(),
          Value<double?> valineMg = const Value.absent(),
          Value<double?> arginineMg = const Value.absent(),
          Value<double?> histidineMg = const Value.absent(),
          Value<double?> alanineMg = const Value.absent(),
          Value<double?> asparticAcidMg = const Value.absent(),
          Value<double?> glutamicAcidMg = const Value.absent(),
          Value<double?> glycineMg = const Value.absent(),
          Value<double?> prolineMg = const Value.absent(),
          Value<double?> serineMg = const Value.absent(),
          Value<double?> hydroxyprolineMg = const Value.absent(),
          Value<double?> alcoholG = const Value.absent(),
          Value<double?> caffeineMg = const Value.absent(),
          Value<double?> theobromineMg = const Value.absent(),
          Value<double?> servingWeight1G = const Value.absent(),
          Value<String?> servingDescription1G = const Value.absent(),
          Value<double?> servingWeight2G = const Value.absent(),
          Value<String?> servingDescription2G = const Value.absent(),
          Value<double?> servingWeight3G = const Value.absent(),
          Value<String?> servingDescription3G = const Value.absent(),
          Value<double?> servingWeight4G = const Value.absent(),
          Value<String?> servingDescription4G = const Value.absent(),
          Value<double?> servingWeight5G = const Value.absent(),
          Value<String?> servingDescription5G = const Value.absent(),
          Value<double?> servingWeight6G = const Value.absent(),
          Value<String?> servingDescription6G = const Value.absent(),
          Value<double?> servingWeight7G = const Value.absent(),
          Value<String?> servingDescription7G = const Value.absent(),
          Value<double?> servingWeight8G = const Value.absent(),
          Value<String?> servingDescription8G = const Value.absent(),
          Value<double?> servingWeight9G = const Value.absent(),
          Value<String?> servingDescription9G = const Value.absent(),
          Value<double?> u200calorieWeightG = const Value.absent()}) =>
      Food(
        id: id ?? this.id,
        name: name ?? this.name,
        foodGroup: foodGroup.present ? foodGroup.value : this.foodGroup,
        calories: calories.present ? calories.value : this.calories,
        fatG: fatG.present ? fatG.value : this.fatG,
        proteinG: proteinG.present ? proteinG.value : this.proteinG,
        carbohydrateG:
            carbohydrateG.present ? carbohydrateG.value : this.carbohydrateG,
        sugarsG: sugarsG.present ? sugarsG.value : this.sugarsG,
        fiberG: fiberG.present ? fiberG.value : this.fiberG,
        cholesterolMg:
            cholesterolMg.present ? cholesterolMg.value : this.cholesterolMg,
        saturatedFatsG:
            saturatedFatsG.present ? saturatedFatsG.value : this.saturatedFatsG,
        calciumMg: calciumMg.present ? calciumMg.value : this.calciumMg,
        ironFeMg: ironFeMg.present ? ironFeMg.value : this.ironFeMg,
        potassiumKMg:
            potassiumKMg.present ? potassiumKMg.value : this.potassiumKMg,
        magnesiumMg: magnesiumMg.present ? magnesiumMg.value : this.magnesiumMg,
        vitaminAIuIu:
            vitaminAIuIu.present ? vitaminAIuIu.value : this.vitaminAIuIu,
        vitaminARaeMcg:
            vitaminARaeMcg.present ? vitaminARaeMcg.value : this.vitaminARaeMcg,
        vitaminCMg: vitaminCMg.present ? vitaminCMg.value : this.vitaminCMg,
        vitaminB12Mcg:
            vitaminB12Mcg.present ? vitaminB12Mcg.value : this.vitaminB12Mcg,
        vitaminDMcg: vitaminDMcg.present ? vitaminDMcg.value : this.vitaminDMcg,
        vitaminEAlphaTocopherolMg: vitaminEAlphaTocopherolMg.present
            ? vitaminEAlphaTocopherolMg.value
            : this.vitaminEAlphaTocopherolMg,
        addedSugarG: addedSugarG.present ? addedSugarG.value : this.addedSugarG,
        netCarbsG: netCarbsG.present ? netCarbsG.value : this.netCarbsG,
        waterG: waterG.present ? waterG.value : this.waterG,
        omega3sMg: omega3sMg.present ? omega3sMg.value : this.omega3sMg,
        omega6sMg: omega6sMg.present ? omega6sMg.value : this.omega6sMg,
        pralScore: pralScore.present ? pralScore.value : this.pralScore,
        transFattyAcidsG: transFattyAcidsG.present
            ? transFattyAcidsG.value
            : this.transFattyAcidsG,
        solubleFiberG:
            solubleFiberG.present ? solubleFiberG.value : this.solubleFiberG,
        insolubleFiberG: insolubleFiberG.present
            ? insolubleFiberG.value
            : this.insolubleFiberG,
        sucroseG: sucroseG.present ? sucroseG.value : this.sucroseG,
        glucoseDextroseG: glucoseDextroseG.present
            ? glucoseDextroseG.value
            : this.glucoseDextroseG,
        fructoseG: fructoseG.present ? fructoseG.value : this.fructoseG,
        lactoseG: lactoseG.present ? lactoseG.value : this.lactoseG,
        maltoseG: maltoseG.present ? maltoseG.value : this.maltoseG,
        galactoseG: galactoseG.present ? galactoseG.value : this.galactoseG,
        starchG: starchG.present ? starchG.value : this.starchG,
        totalSugarAlcoholsG: totalSugarAlcoholsG.present
            ? totalSugarAlcoholsG.value
            : this.totalSugarAlcoholsG,
        phosphorusPMg:
            phosphorusPMg.present ? phosphorusPMg.value : this.phosphorusPMg,
        sodiumMg: sodiumMg.present ? sodiumMg.value : this.sodiumMg,
        zincZnMg: zincZnMg.present ? zincZnMg.value : this.zincZnMg,
        copperCuMg: copperCuMg.present ? copperCuMg.value : this.copperCuMg,
        manganeseMg: manganeseMg.present ? manganeseMg.value : this.manganeseMg,
        seleniumSeMcg:
            seleniumSeMcg.present ? seleniumSeMcg.value : this.seleniumSeMcg,
        fluorideFMcg:
            fluorideFMcg.present ? fluorideFMcg.value : this.fluorideFMcg,
        molybdenumMcg:
            molybdenumMcg.present ? molybdenumMcg.value : this.molybdenumMcg,
        chlorineMg: chlorineMg.present ? chlorineMg.value : this.chlorineMg,
        thiaminB1Mg: thiaminB1Mg.present ? thiaminB1Mg.value : this.thiaminB1Mg,
        riboflavinB2Mg:
            riboflavinB2Mg.present ? riboflavinB2Mg.value : this.riboflavinB2Mg,
        niacinB3Mg: niacinB3Mg.present ? niacinB3Mg.value : this.niacinB3Mg,
        pantothenicAcidB5Mg: pantothenicAcidB5Mg.present
            ? pantothenicAcidB5Mg.value
            : this.pantothenicAcidB5Mg,
        vitaminB6Mg: vitaminB6Mg.present ? vitaminB6Mg.value : this.vitaminB6Mg,
        biotinB7Mcg: biotinB7Mcg.present ? biotinB7Mcg.value : this.biotinB7Mcg,
        folateB9Mcg: folateB9Mcg.present ? folateB9Mcg.value : this.folateB9Mcg,
        folicAcidMcg:
            folicAcidMcg.present ? folicAcidMcg.value : this.folicAcidMcg,
        foodFolateMcg:
            foodFolateMcg.present ? foodFolateMcg.value : this.foodFolateMcg,
        folateDfeMcg:
            folateDfeMcg.present ? folateDfeMcg.value : this.folateDfeMcg,
        cholineMg: cholineMg.present ? cholineMg.value : this.cholineMg,
        betaineMg: betaineMg.present ? betaineMg.value : this.betaineMg,
        retinolMcg: retinolMcg.present ? retinolMcg.value : this.retinolMcg,
        caroteneBetaMcg: caroteneBetaMcg.present
            ? caroteneBetaMcg.value
            : this.caroteneBetaMcg,
        caroteneAlphaMcg: caroteneAlphaMcg.present
            ? caroteneAlphaMcg.value
            : this.caroteneAlphaMcg,
        lycopeneMcg: lycopeneMcg.present ? lycopeneMcg.value : this.lycopeneMcg,
        luteinZeaxanthinMcg: luteinZeaxanthinMcg.present
            ? luteinZeaxanthinMcg.value
            : this.luteinZeaxanthinMcg,
        vitaminD2ErgocalciferolMcg: vitaminD2ErgocalciferolMcg.present
            ? vitaminD2ErgocalciferolMcg.value
            : this.vitaminD2ErgocalciferolMcg,
        vitaminD3CholecalciferolMcg: vitaminD3CholecalciferolMcg.present
            ? vitaminD3CholecalciferolMcg.value
            : this.vitaminD3CholecalciferolMcg,
        vitaminDIuIu:
            vitaminDIuIu.present ? vitaminDIuIu.value : this.vitaminDIuIu,
        vitaminKMcg: vitaminKMcg.present ? vitaminKMcg.value : this.vitaminKMcg,
        dihydrophylloquinoneMcg: dihydrophylloquinoneMcg.present
            ? dihydrophylloquinoneMcg.value
            : this.dihydrophylloquinoneMcg,
        menaquinone4Mcg: menaquinone4Mcg.present
            ? menaquinone4Mcg.value
            : this.menaquinone4Mcg,
        fattyAcidsTotalMonounsaturatedMg:
            fattyAcidsTotalMonounsaturatedMg.present
                ? fattyAcidsTotalMonounsaturatedMg.value
                : this.fattyAcidsTotalMonounsaturatedMg,
        fattyAcidsTotalPolyunsaturatedMg:
            fattyAcidsTotalPolyunsaturatedMg.present
                ? fattyAcidsTotalPolyunsaturatedMg.value
                : this.fattyAcidsTotalPolyunsaturatedMg,
        u183N3CCCAlaMg:
            u183N3CCCAlaMg.present ? u183N3CCCAlaMg.value : this.u183N3CCCAlaMg,
        u205N3EpaMg: u205N3EpaMg.present ? u205N3EpaMg.value : this.u205N3EpaMg,
        u225N3DpaMg: u225N3DpaMg.present ? u225N3DpaMg.value : this.u225N3DpaMg,
        u226N3DhaMg: u226N3DhaMg.present ? u226N3DhaMg.value : this.u226N3DhaMg,
        tryptophanMg:
            tryptophanMg.present ? tryptophanMg.value : this.tryptophanMg,
        threonineMg: threonineMg.present ? threonineMg.value : this.threonineMg,
        isoleucineMg:
            isoleucineMg.present ? isoleucineMg.value : this.isoleucineMg,
        leucineMg: leucineMg.present ? leucineMg.value : this.leucineMg,
        lysineMg: lysineMg.present ? lysineMg.value : this.lysineMg,
        methionineMg:
            methionineMg.present ? methionineMg.value : this.methionineMg,
        cystineMg: cystineMg.present ? cystineMg.value : this.cystineMg,
        phenylalanineMg: phenylalanineMg.present
            ? phenylalanineMg.value
            : this.phenylalanineMg,
        tyrosineMg: tyrosineMg.present ? tyrosineMg.value : this.tyrosineMg,
        valineMg: valineMg.present ? valineMg.value : this.valineMg,
        arginineMg: arginineMg.present ? arginineMg.value : this.arginineMg,
        histidineMg: histidineMg.present ? histidineMg.value : this.histidineMg,
        alanineMg: alanineMg.present ? alanineMg.value : this.alanineMg,
        asparticAcidMg:
            asparticAcidMg.present ? asparticAcidMg.value : this.asparticAcidMg,
        glutamicAcidMg:
            glutamicAcidMg.present ? glutamicAcidMg.value : this.glutamicAcidMg,
        glycineMg: glycineMg.present ? glycineMg.value : this.glycineMg,
        prolineMg: prolineMg.present ? prolineMg.value : this.prolineMg,
        serineMg: serineMg.present ? serineMg.value : this.serineMg,
        hydroxyprolineMg: hydroxyprolineMg.present
            ? hydroxyprolineMg.value
            : this.hydroxyprolineMg,
        alcoholG: alcoholG.present ? alcoholG.value : this.alcoholG,
        caffeineMg: caffeineMg.present ? caffeineMg.value : this.caffeineMg,
        theobromineMg:
            theobromineMg.present ? theobromineMg.value : this.theobromineMg,
        servingWeight1G: servingWeight1G.present
            ? servingWeight1G.value
            : this.servingWeight1G,
        servingDescription1G: servingDescription1G.present
            ? servingDescription1G.value
            : this.servingDescription1G,
        servingWeight2G: servingWeight2G.present
            ? servingWeight2G.value
            : this.servingWeight2G,
        servingDescription2G: servingDescription2G.present
            ? servingDescription2G.value
            : this.servingDescription2G,
        servingWeight3G: servingWeight3G.present
            ? servingWeight3G.value
            : this.servingWeight3G,
        servingDescription3G: servingDescription3G.present
            ? servingDescription3G.value
            : this.servingDescription3G,
        servingWeight4G: servingWeight4G.present
            ? servingWeight4G.value
            : this.servingWeight4G,
        servingDescription4G: servingDescription4G.present
            ? servingDescription4G.value
            : this.servingDescription4G,
        servingWeight5G: servingWeight5G.present
            ? servingWeight5G.value
            : this.servingWeight5G,
        servingDescription5G: servingDescription5G.present
            ? servingDescription5G.value
            : this.servingDescription5G,
        servingWeight6G: servingWeight6G.present
            ? servingWeight6G.value
            : this.servingWeight6G,
        servingDescription6G: servingDescription6G.present
            ? servingDescription6G.value
            : this.servingDescription6G,
        servingWeight7G: servingWeight7G.present
            ? servingWeight7G.value
            : this.servingWeight7G,
        servingDescription7G: servingDescription7G.present
            ? servingDescription7G.value
            : this.servingDescription7G,
        servingWeight8G: servingWeight8G.present
            ? servingWeight8G.value
            : this.servingWeight8G,
        servingDescription8G: servingDescription8G.present
            ? servingDescription8G.value
            : this.servingDescription8G,
        servingWeight9G: servingWeight9G.present
            ? servingWeight9G.value
            : this.servingWeight9G,
        servingDescription9G: servingDescription9G.present
            ? servingDescription9G.value
            : this.servingDescription9G,
        u200calorieWeightG: u200calorieWeightG.present
            ? u200calorieWeightG.value
            : this.u200calorieWeightG,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('foodGroup: $foodGroup, ')
          ..write('calories: $calories, ')
          ..write('fatG: $fatG, ')
          ..write('proteinG: $proteinG, ')
          ..write('carbohydrateG: $carbohydrateG, ')
          ..write('sugarsG: $sugarsG, ')
          ..write('fiberG: $fiberG, ')
          ..write('cholesterolMg: $cholesterolMg, ')
          ..write('saturatedFatsG: $saturatedFatsG, ')
          ..write('calciumMg: $calciumMg, ')
          ..write('ironFeMg: $ironFeMg, ')
          ..write('potassiumKMg: $potassiumKMg, ')
          ..write('magnesiumMg: $magnesiumMg, ')
          ..write('vitaminAIuIu: $vitaminAIuIu, ')
          ..write('vitaminARaeMcg: $vitaminARaeMcg, ')
          ..write('vitaminCMg: $vitaminCMg, ')
          ..write('vitaminB12Mcg: $vitaminB12Mcg, ')
          ..write('vitaminDMcg: $vitaminDMcg, ')
          ..write('vitaminEAlphaTocopherolMg: $vitaminEAlphaTocopherolMg, ')
          ..write('addedSugarG: $addedSugarG, ')
          ..write('netCarbsG: $netCarbsG, ')
          ..write('waterG: $waterG, ')
          ..write('omega3sMg: $omega3sMg, ')
          ..write('omega6sMg: $omega6sMg, ')
          ..write('pralScore: $pralScore, ')
          ..write('transFattyAcidsG: $transFattyAcidsG, ')
          ..write('solubleFiberG: $solubleFiberG, ')
          ..write('insolubleFiberG: $insolubleFiberG, ')
          ..write('sucroseG: $sucroseG, ')
          ..write('glucoseDextroseG: $glucoseDextroseG, ')
          ..write('fructoseG: $fructoseG, ')
          ..write('lactoseG: $lactoseG, ')
          ..write('maltoseG: $maltoseG, ')
          ..write('galactoseG: $galactoseG, ')
          ..write('starchG: $starchG, ')
          ..write('totalSugarAlcoholsG: $totalSugarAlcoholsG, ')
          ..write('phosphorusPMg: $phosphorusPMg, ')
          ..write('sodiumMg: $sodiumMg, ')
          ..write('zincZnMg: $zincZnMg, ')
          ..write('copperCuMg: $copperCuMg, ')
          ..write('manganeseMg: $manganeseMg, ')
          ..write('seleniumSeMcg: $seleniumSeMcg, ')
          ..write('fluorideFMcg: $fluorideFMcg, ')
          ..write('molybdenumMcg: $molybdenumMcg, ')
          ..write('chlorineMg: $chlorineMg, ')
          ..write('thiaminB1Mg: $thiaminB1Mg, ')
          ..write('riboflavinB2Mg: $riboflavinB2Mg, ')
          ..write('niacinB3Mg: $niacinB3Mg, ')
          ..write('pantothenicAcidB5Mg: $pantothenicAcidB5Mg, ')
          ..write('vitaminB6Mg: $vitaminB6Mg, ')
          ..write('biotinB7Mcg: $biotinB7Mcg, ')
          ..write('folateB9Mcg: $folateB9Mcg, ')
          ..write('folicAcidMcg: $folicAcidMcg, ')
          ..write('foodFolateMcg: $foodFolateMcg, ')
          ..write('folateDfeMcg: $folateDfeMcg, ')
          ..write('cholineMg: $cholineMg, ')
          ..write('betaineMg: $betaineMg, ')
          ..write('retinolMcg: $retinolMcg, ')
          ..write('caroteneBetaMcg: $caroteneBetaMcg, ')
          ..write('caroteneAlphaMcg: $caroteneAlphaMcg, ')
          ..write('lycopeneMcg: $lycopeneMcg, ')
          ..write('luteinZeaxanthinMcg: $luteinZeaxanthinMcg, ')
          ..write('vitaminD2ErgocalciferolMcg: $vitaminD2ErgocalciferolMcg, ')
          ..write('vitaminD3CholecalciferolMcg: $vitaminD3CholecalciferolMcg, ')
          ..write('vitaminDIuIu: $vitaminDIuIu, ')
          ..write('vitaminKMcg: $vitaminKMcg, ')
          ..write('dihydrophylloquinoneMcg: $dihydrophylloquinoneMcg, ')
          ..write('menaquinone4Mcg: $menaquinone4Mcg, ')
          ..write(
              'fattyAcidsTotalMonounsaturatedMg: $fattyAcidsTotalMonounsaturatedMg, ')
          ..write(
              'fattyAcidsTotalPolyunsaturatedMg: $fattyAcidsTotalPolyunsaturatedMg, ')
          ..write('u183N3CCCAlaMg: $u183N3CCCAlaMg, ')
          ..write('u205N3EpaMg: $u205N3EpaMg, ')
          ..write('u225N3DpaMg: $u225N3DpaMg, ')
          ..write('u226N3DhaMg: $u226N3DhaMg, ')
          ..write('tryptophanMg: $tryptophanMg, ')
          ..write('threonineMg: $threonineMg, ')
          ..write('isoleucineMg: $isoleucineMg, ')
          ..write('leucineMg: $leucineMg, ')
          ..write('lysineMg: $lysineMg, ')
          ..write('methionineMg: $methionineMg, ')
          ..write('cystineMg: $cystineMg, ')
          ..write('phenylalanineMg: $phenylalanineMg, ')
          ..write('tyrosineMg: $tyrosineMg, ')
          ..write('valineMg: $valineMg, ')
          ..write('arginineMg: $arginineMg, ')
          ..write('histidineMg: $histidineMg, ')
          ..write('alanineMg: $alanineMg, ')
          ..write('asparticAcidMg: $asparticAcidMg, ')
          ..write('glutamicAcidMg: $glutamicAcidMg, ')
          ..write('glycineMg: $glycineMg, ')
          ..write('prolineMg: $prolineMg, ')
          ..write('serineMg: $serineMg, ')
          ..write('hydroxyprolineMg: $hydroxyprolineMg, ')
          ..write('alcoholG: $alcoholG, ')
          ..write('caffeineMg: $caffeineMg, ')
          ..write('theobromineMg: $theobromineMg, ')
          ..write('servingWeight1G: $servingWeight1G, ')
          ..write('servingDescription1G: $servingDescription1G, ')
          ..write('servingWeight2G: $servingWeight2G, ')
          ..write('servingDescription2G: $servingDescription2G, ')
          ..write('servingWeight3G: $servingWeight3G, ')
          ..write('servingDescription3G: $servingDescription3G, ')
          ..write('servingWeight4G: $servingWeight4G, ')
          ..write('servingDescription4G: $servingDescription4G, ')
          ..write('servingWeight5G: $servingWeight5G, ')
          ..write('servingDescription5G: $servingDescription5G, ')
          ..write('servingWeight6G: $servingWeight6G, ')
          ..write('servingDescription6G: $servingDescription6G, ')
          ..write('servingWeight7G: $servingWeight7G, ')
          ..write('servingDescription7G: $servingDescription7G, ')
          ..write('servingWeight8G: $servingWeight8G, ')
          ..write('servingDescription8G: $servingDescription8G, ')
          ..write('servingWeight9G: $servingWeight9G, ')
          ..write('servingDescription9G: $servingDescription9G, ')
          ..write('u200calorieWeightG: $u200calorieWeightG')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        foodGroup,
        calories,
        fatG,
        proteinG,
        carbohydrateG,
        sugarsG,
        fiberG,
        cholesterolMg,
        saturatedFatsG,
        calciumMg,
        ironFeMg,
        potassiumKMg,
        magnesiumMg,
        vitaminAIuIu,
        vitaminARaeMcg,
        vitaminCMg,
        vitaminB12Mcg,
        vitaminDMcg,
        vitaminEAlphaTocopherolMg,
        addedSugarG,
        netCarbsG,
        waterG,
        omega3sMg,
        omega6sMg,
        pralScore,
        transFattyAcidsG,
        solubleFiberG,
        insolubleFiberG,
        sucroseG,
        glucoseDextroseG,
        fructoseG,
        lactoseG,
        maltoseG,
        galactoseG,
        starchG,
        totalSugarAlcoholsG,
        phosphorusPMg,
        sodiumMg,
        zincZnMg,
        copperCuMg,
        manganeseMg,
        seleniumSeMcg,
        fluorideFMcg,
        molybdenumMcg,
        chlorineMg,
        thiaminB1Mg,
        riboflavinB2Mg,
        niacinB3Mg,
        pantothenicAcidB5Mg,
        vitaminB6Mg,
        biotinB7Mcg,
        folateB9Mcg,
        folicAcidMcg,
        foodFolateMcg,
        folateDfeMcg,
        cholineMg,
        betaineMg,
        retinolMcg,
        caroteneBetaMcg,
        caroteneAlphaMcg,
        lycopeneMcg,
        luteinZeaxanthinMcg,
        vitaminD2ErgocalciferolMcg,
        vitaminD3CholecalciferolMcg,
        vitaminDIuIu,
        vitaminKMcg,
        dihydrophylloquinoneMcg,
        menaquinone4Mcg,
        fattyAcidsTotalMonounsaturatedMg,
        fattyAcidsTotalPolyunsaturatedMg,
        u183N3CCCAlaMg,
        u205N3EpaMg,
        u225N3DpaMg,
        u226N3DhaMg,
        tryptophanMg,
        threonineMg,
        isoleucineMg,
        leucineMg,
        lysineMg,
        methionineMg,
        cystineMg,
        phenylalanineMg,
        tyrosineMg,
        valineMg,
        arginineMg,
        histidineMg,
        alanineMg,
        asparticAcidMg,
        glutamicAcidMg,
        glycineMg,
        prolineMg,
        serineMg,
        hydroxyprolineMg,
        alcoholG,
        caffeineMg,
        theobromineMg,
        servingWeight1G,
        servingDescription1G,
        servingWeight2G,
        servingDescription2G,
        servingWeight3G,
        servingDescription3G,
        servingWeight4G,
        servingDescription4G,
        servingWeight5G,
        servingDescription5G,
        servingWeight6G,
        servingDescription6G,
        servingWeight7G,
        servingDescription7G,
        servingWeight8G,
        servingDescription8G,
        servingWeight9G,
        servingDescription9G,
        u200calorieWeightG
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.name == this.name &&
          other.foodGroup == this.foodGroup &&
          other.calories == this.calories &&
          other.fatG == this.fatG &&
          other.proteinG == this.proteinG &&
          other.carbohydrateG == this.carbohydrateG &&
          other.sugarsG == this.sugarsG &&
          other.fiberG == this.fiberG &&
          other.cholesterolMg == this.cholesterolMg &&
          other.saturatedFatsG == this.saturatedFatsG &&
          other.calciumMg == this.calciumMg &&
          other.ironFeMg == this.ironFeMg &&
          other.potassiumKMg == this.potassiumKMg &&
          other.magnesiumMg == this.magnesiumMg &&
          other.vitaminAIuIu == this.vitaminAIuIu &&
          other.vitaminARaeMcg == this.vitaminARaeMcg &&
          other.vitaminCMg == this.vitaminCMg &&
          other.vitaminB12Mcg == this.vitaminB12Mcg &&
          other.vitaminDMcg == this.vitaminDMcg &&
          other.vitaminEAlphaTocopherolMg == this.vitaminEAlphaTocopherolMg &&
          other.addedSugarG == this.addedSugarG &&
          other.netCarbsG == this.netCarbsG &&
          other.waterG == this.waterG &&
          other.omega3sMg == this.omega3sMg &&
          other.omega6sMg == this.omega6sMg &&
          other.pralScore == this.pralScore &&
          other.transFattyAcidsG == this.transFattyAcidsG &&
          other.solubleFiberG == this.solubleFiberG &&
          other.insolubleFiberG == this.insolubleFiberG &&
          other.sucroseG == this.sucroseG &&
          other.glucoseDextroseG == this.glucoseDextroseG &&
          other.fructoseG == this.fructoseG &&
          other.lactoseG == this.lactoseG &&
          other.maltoseG == this.maltoseG &&
          other.galactoseG == this.galactoseG &&
          other.starchG == this.starchG &&
          other.totalSugarAlcoholsG == this.totalSugarAlcoholsG &&
          other.phosphorusPMg == this.phosphorusPMg &&
          other.sodiumMg == this.sodiumMg &&
          other.zincZnMg == this.zincZnMg &&
          other.copperCuMg == this.copperCuMg &&
          other.manganeseMg == this.manganeseMg &&
          other.seleniumSeMcg == this.seleniumSeMcg &&
          other.fluorideFMcg == this.fluorideFMcg &&
          other.molybdenumMcg == this.molybdenumMcg &&
          other.chlorineMg == this.chlorineMg &&
          other.thiaminB1Mg == this.thiaminB1Mg &&
          other.riboflavinB2Mg == this.riboflavinB2Mg &&
          other.niacinB3Mg == this.niacinB3Mg &&
          other.pantothenicAcidB5Mg == this.pantothenicAcidB5Mg &&
          other.vitaminB6Mg == this.vitaminB6Mg &&
          other.biotinB7Mcg == this.biotinB7Mcg &&
          other.folateB9Mcg == this.folateB9Mcg &&
          other.folicAcidMcg == this.folicAcidMcg &&
          other.foodFolateMcg == this.foodFolateMcg &&
          other.folateDfeMcg == this.folateDfeMcg &&
          other.cholineMg == this.cholineMg &&
          other.betaineMg == this.betaineMg &&
          other.retinolMcg == this.retinolMcg &&
          other.caroteneBetaMcg == this.caroteneBetaMcg &&
          other.caroteneAlphaMcg == this.caroteneAlphaMcg &&
          other.lycopeneMcg == this.lycopeneMcg &&
          other.luteinZeaxanthinMcg == this.luteinZeaxanthinMcg &&
          other.vitaminD2ErgocalciferolMcg == this.vitaminD2ErgocalciferolMcg &&
          other.vitaminD3CholecalciferolMcg ==
              this.vitaminD3CholecalciferolMcg &&
          other.vitaminDIuIu == this.vitaminDIuIu &&
          other.vitaminKMcg == this.vitaminKMcg &&
          other.dihydrophylloquinoneMcg == this.dihydrophylloquinoneMcg &&
          other.menaquinone4Mcg == this.menaquinone4Mcg &&
          other.fattyAcidsTotalMonounsaturatedMg ==
              this.fattyAcidsTotalMonounsaturatedMg &&
          other.fattyAcidsTotalPolyunsaturatedMg ==
              this.fattyAcidsTotalPolyunsaturatedMg &&
          other.u183N3CCCAlaMg == this.u183N3CCCAlaMg &&
          other.u205N3EpaMg == this.u205N3EpaMg &&
          other.u225N3DpaMg == this.u225N3DpaMg &&
          other.u226N3DhaMg == this.u226N3DhaMg &&
          other.tryptophanMg == this.tryptophanMg &&
          other.threonineMg == this.threonineMg &&
          other.isoleucineMg == this.isoleucineMg &&
          other.leucineMg == this.leucineMg &&
          other.lysineMg == this.lysineMg &&
          other.methionineMg == this.methionineMg &&
          other.cystineMg == this.cystineMg &&
          other.phenylalanineMg == this.phenylalanineMg &&
          other.tyrosineMg == this.tyrosineMg &&
          other.valineMg == this.valineMg &&
          other.arginineMg == this.arginineMg &&
          other.histidineMg == this.histidineMg &&
          other.alanineMg == this.alanineMg &&
          other.asparticAcidMg == this.asparticAcidMg &&
          other.glutamicAcidMg == this.glutamicAcidMg &&
          other.glycineMg == this.glycineMg &&
          other.prolineMg == this.prolineMg &&
          other.serineMg == this.serineMg &&
          other.hydroxyprolineMg == this.hydroxyprolineMg &&
          other.alcoholG == this.alcoholG &&
          other.caffeineMg == this.caffeineMg &&
          other.theobromineMg == this.theobromineMg &&
          other.servingWeight1G == this.servingWeight1G &&
          other.servingDescription1G == this.servingDescription1G &&
          other.servingWeight2G == this.servingWeight2G &&
          other.servingDescription2G == this.servingDescription2G &&
          other.servingWeight3G == this.servingWeight3G &&
          other.servingDescription3G == this.servingDescription3G &&
          other.servingWeight4G == this.servingWeight4G &&
          other.servingDescription4G == this.servingDescription4G &&
          other.servingWeight5G == this.servingWeight5G &&
          other.servingDescription5G == this.servingDescription5G &&
          other.servingWeight6G == this.servingWeight6G &&
          other.servingDescription6G == this.servingDescription6G &&
          other.servingWeight7G == this.servingWeight7G &&
          other.servingDescription7G == this.servingDescription7G &&
          other.servingWeight8G == this.servingWeight8G &&
          other.servingDescription8G == this.servingDescription8G &&
          other.servingWeight9G == this.servingWeight9G &&
          other.servingDescription9G == this.servingDescription9G &&
          other.u200calorieWeightG == this.u200calorieWeightG);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> foodGroup;
  final Value<double?> calories;
  final Value<double?> fatG;
  final Value<double?> proteinG;
  final Value<double?> carbohydrateG;
  final Value<double?> sugarsG;
  final Value<double?> fiberG;
  final Value<double?> cholesterolMg;
  final Value<double?> saturatedFatsG;
  final Value<double?> calciumMg;
  final Value<double?> ironFeMg;
  final Value<double?> potassiumKMg;
  final Value<double?> magnesiumMg;
  final Value<double?> vitaminAIuIu;
  final Value<double?> vitaminARaeMcg;
  final Value<double?> vitaminCMg;
  final Value<double?> vitaminB12Mcg;
  final Value<double?> vitaminDMcg;
  final Value<double?> vitaminEAlphaTocopherolMg;
  final Value<double?> addedSugarG;
  final Value<double?> netCarbsG;
  final Value<double?> waterG;
  final Value<double?> omega3sMg;
  final Value<double?> omega6sMg;
  final Value<double?> pralScore;
  final Value<double?> transFattyAcidsG;
  final Value<double?> solubleFiberG;
  final Value<double?> insolubleFiberG;
  final Value<double?> sucroseG;
  final Value<double?> glucoseDextroseG;
  final Value<double?> fructoseG;
  final Value<double?> lactoseG;
  final Value<double?> maltoseG;
  final Value<double?> galactoseG;
  final Value<double?> starchG;
  final Value<double?> totalSugarAlcoholsG;
  final Value<double?> phosphorusPMg;
  final Value<double?> sodiumMg;
  final Value<double?> zincZnMg;
  final Value<double?> copperCuMg;
  final Value<double?> manganeseMg;
  final Value<double?> seleniumSeMcg;
  final Value<double?> fluorideFMcg;
  final Value<double?> molybdenumMcg;
  final Value<double?> chlorineMg;
  final Value<double?> thiaminB1Mg;
  final Value<double?> riboflavinB2Mg;
  final Value<double?> niacinB3Mg;
  final Value<double?> pantothenicAcidB5Mg;
  final Value<double?> vitaminB6Mg;
  final Value<double?> biotinB7Mcg;
  final Value<double?> folateB9Mcg;
  final Value<double?> folicAcidMcg;
  final Value<double?> foodFolateMcg;
  final Value<double?> folateDfeMcg;
  final Value<double?> cholineMg;
  final Value<double?> betaineMg;
  final Value<double?> retinolMcg;
  final Value<double?> caroteneBetaMcg;
  final Value<double?> caroteneAlphaMcg;
  final Value<double?> lycopeneMcg;
  final Value<double?> luteinZeaxanthinMcg;
  final Value<double?> vitaminD2ErgocalciferolMcg;
  final Value<double?> vitaminD3CholecalciferolMcg;
  final Value<double?> vitaminDIuIu;
  final Value<double?> vitaminKMcg;
  final Value<double?> dihydrophylloquinoneMcg;
  final Value<double?> menaquinone4Mcg;
  final Value<double?> fattyAcidsTotalMonounsaturatedMg;
  final Value<double?> fattyAcidsTotalPolyunsaturatedMg;
  final Value<double?> u183N3CCCAlaMg;
  final Value<double?> u205N3EpaMg;
  final Value<double?> u225N3DpaMg;
  final Value<double?> u226N3DhaMg;
  final Value<double?> tryptophanMg;
  final Value<double?> threonineMg;
  final Value<double?> isoleucineMg;
  final Value<double?> leucineMg;
  final Value<double?> lysineMg;
  final Value<double?> methionineMg;
  final Value<double?> cystineMg;
  final Value<double?> phenylalanineMg;
  final Value<double?> tyrosineMg;
  final Value<double?> valineMg;
  final Value<double?> arginineMg;
  final Value<double?> histidineMg;
  final Value<double?> alanineMg;
  final Value<double?> asparticAcidMg;
  final Value<double?> glutamicAcidMg;
  final Value<double?> glycineMg;
  final Value<double?> prolineMg;
  final Value<double?> serineMg;
  final Value<double?> hydroxyprolineMg;
  final Value<double?> alcoholG;
  final Value<double?> caffeineMg;
  final Value<double?> theobromineMg;
  final Value<double?> servingWeight1G;
  final Value<String?> servingDescription1G;
  final Value<double?> servingWeight2G;
  final Value<String?> servingDescription2G;
  final Value<double?> servingWeight3G;
  final Value<String?> servingDescription3G;
  final Value<double?> servingWeight4G;
  final Value<String?> servingDescription4G;
  final Value<double?> servingWeight5G;
  final Value<String?> servingDescription5G;
  final Value<double?> servingWeight6G;
  final Value<String?> servingDescription6G;
  final Value<double?> servingWeight7G;
  final Value<String?> servingDescription7G;
  final Value<double?> servingWeight8G;
  final Value<String?> servingDescription8G;
  final Value<double?> servingWeight9G;
  final Value<String?> servingDescription9G;
  final Value<double?> u200calorieWeightG;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.foodGroup = const Value.absent(),
    this.calories = const Value.absent(),
    this.fatG = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.carbohydrateG = const Value.absent(),
    this.sugarsG = const Value.absent(),
    this.fiberG = const Value.absent(),
    this.cholesterolMg = const Value.absent(),
    this.saturatedFatsG = const Value.absent(),
    this.calciumMg = const Value.absent(),
    this.ironFeMg = const Value.absent(),
    this.potassiumKMg = const Value.absent(),
    this.magnesiumMg = const Value.absent(),
    this.vitaminAIuIu = const Value.absent(),
    this.vitaminARaeMcg = const Value.absent(),
    this.vitaminCMg = const Value.absent(),
    this.vitaminB12Mcg = const Value.absent(),
    this.vitaminDMcg = const Value.absent(),
    this.vitaminEAlphaTocopherolMg = const Value.absent(),
    this.addedSugarG = const Value.absent(),
    this.netCarbsG = const Value.absent(),
    this.waterG = const Value.absent(),
    this.omega3sMg = const Value.absent(),
    this.omega6sMg = const Value.absent(),
    this.pralScore = const Value.absent(),
    this.transFattyAcidsG = const Value.absent(),
    this.solubleFiberG = const Value.absent(),
    this.insolubleFiberG = const Value.absent(),
    this.sucroseG = const Value.absent(),
    this.glucoseDextroseG = const Value.absent(),
    this.fructoseG = const Value.absent(),
    this.lactoseG = const Value.absent(),
    this.maltoseG = const Value.absent(),
    this.galactoseG = const Value.absent(),
    this.starchG = const Value.absent(),
    this.totalSugarAlcoholsG = const Value.absent(),
    this.phosphorusPMg = const Value.absent(),
    this.sodiumMg = const Value.absent(),
    this.zincZnMg = const Value.absent(),
    this.copperCuMg = const Value.absent(),
    this.manganeseMg = const Value.absent(),
    this.seleniumSeMcg = const Value.absent(),
    this.fluorideFMcg = const Value.absent(),
    this.molybdenumMcg = const Value.absent(),
    this.chlorineMg = const Value.absent(),
    this.thiaminB1Mg = const Value.absent(),
    this.riboflavinB2Mg = const Value.absent(),
    this.niacinB3Mg = const Value.absent(),
    this.pantothenicAcidB5Mg = const Value.absent(),
    this.vitaminB6Mg = const Value.absent(),
    this.biotinB7Mcg = const Value.absent(),
    this.folateB9Mcg = const Value.absent(),
    this.folicAcidMcg = const Value.absent(),
    this.foodFolateMcg = const Value.absent(),
    this.folateDfeMcg = const Value.absent(),
    this.cholineMg = const Value.absent(),
    this.betaineMg = const Value.absent(),
    this.retinolMcg = const Value.absent(),
    this.caroteneBetaMcg = const Value.absent(),
    this.caroteneAlphaMcg = const Value.absent(),
    this.lycopeneMcg = const Value.absent(),
    this.luteinZeaxanthinMcg = const Value.absent(),
    this.vitaminD2ErgocalciferolMcg = const Value.absent(),
    this.vitaminD3CholecalciferolMcg = const Value.absent(),
    this.vitaminDIuIu = const Value.absent(),
    this.vitaminKMcg = const Value.absent(),
    this.dihydrophylloquinoneMcg = const Value.absent(),
    this.menaquinone4Mcg = const Value.absent(),
    this.fattyAcidsTotalMonounsaturatedMg = const Value.absent(),
    this.fattyAcidsTotalPolyunsaturatedMg = const Value.absent(),
    this.u183N3CCCAlaMg = const Value.absent(),
    this.u205N3EpaMg = const Value.absent(),
    this.u225N3DpaMg = const Value.absent(),
    this.u226N3DhaMg = const Value.absent(),
    this.tryptophanMg = const Value.absent(),
    this.threonineMg = const Value.absent(),
    this.isoleucineMg = const Value.absent(),
    this.leucineMg = const Value.absent(),
    this.lysineMg = const Value.absent(),
    this.methionineMg = const Value.absent(),
    this.cystineMg = const Value.absent(),
    this.phenylalanineMg = const Value.absent(),
    this.tyrosineMg = const Value.absent(),
    this.valineMg = const Value.absent(),
    this.arginineMg = const Value.absent(),
    this.histidineMg = const Value.absent(),
    this.alanineMg = const Value.absent(),
    this.asparticAcidMg = const Value.absent(),
    this.glutamicAcidMg = const Value.absent(),
    this.glycineMg = const Value.absent(),
    this.prolineMg = const Value.absent(),
    this.serineMg = const Value.absent(),
    this.hydroxyprolineMg = const Value.absent(),
    this.alcoholG = const Value.absent(),
    this.caffeineMg = const Value.absent(),
    this.theobromineMg = const Value.absent(),
    this.servingWeight1G = const Value.absent(),
    this.servingDescription1G = const Value.absent(),
    this.servingWeight2G = const Value.absent(),
    this.servingDescription2G = const Value.absent(),
    this.servingWeight3G = const Value.absent(),
    this.servingDescription3G = const Value.absent(),
    this.servingWeight4G = const Value.absent(),
    this.servingDescription4G = const Value.absent(),
    this.servingWeight5G = const Value.absent(),
    this.servingDescription5G = const Value.absent(),
    this.servingWeight6G = const Value.absent(),
    this.servingDescription6G = const Value.absent(),
    this.servingWeight7G = const Value.absent(),
    this.servingDescription7G = const Value.absent(),
    this.servingWeight8G = const Value.absent(),
    this.servingDescription8G = const Value.absent(),
    this.servingWeight9G = const Value.absent(),
    this.servingDescription9G = const Value.absent(),
    this.u200calorieWeightG = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.foodGroup = const Value.absent(),
    this.calories = const Value.absent(),
    this.fatG = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.carbohydrateG = const Value.absent(),
    this.sugarsG = const Value.absent(),
    this.fiberG = const Value.absent(),
    this.cholesterolMg = const Value.absent(),
    this.saturatedFatsG = const Value.absent(),
    this.calciumMg = const Value.absent(),
    this.ironFeMg = const Value.absent(),
    this.potassiumKMg = const Value.absent(),
    this.magnesiumMg = const Value.absent(),
    this.vitaminAIuIu = const Value.absent(),
    this.vitaminARaeMcg = const Value.absent(),
    this.vitaminCMg = const Value.absent(),
    this.vitaminB12Mcg = const Value.absent(),
    this.vitaminDMcg = const Value.absent(),
    this.vitaminEAlphaTocopherolMg = const Value.absent(),
    this.addedSugarG = const Value.absent(),
    this.netCarbsG = const Value.absent(),
    this.waterG = const Value.absent(),
    this.omega3sMg = const Value.absent(),
    this.omega6sMg = const Value.absent(),
    this.pralScore = const Value.absent(),
    this.transFattyAcidsG = const Value.absent(),
    this.solubleFiberG = const Value.absent(),
    this.insolubleFiberG = const Value.absent(),
    this.sucroseG = const Value.absent(),
    this.glucoseDextroseG = const Value.absent(),
    this.fructoseG = const Value.absent(),
    this.lactoseG = const Value.absent(),
    this.maltoseG = const Value.absent(),
    this.galactoseG = const Value.absent(),
    this.starchG = const Value.absent(),
    this.totalSugarAlcoholsG = const Value.absent(),
    this.phosphorusPMg = const Value.absent(),
    this.sodiumMg = const Value.absent(),
    this.zincZnMg = const Value.absent(),
    this.copperCuMg = const Value.absent(),
    this.manganeseMg = const Value.absent(),
    this.seleniumSeMcg = const Value.absent(),
    this.fluorideFMcg = const Value.absent(),
    this.molybdenumMcg = const Value.absent(),
    this.chlorineMg = const Value.absent(),
    this.thiaminB1Mg = const Value.absent(),
    this.riboflavinB2Mg = const Value.absent(),
    this.niacinB3Mg = const Value.absent(),
    this.pantothenicAcidB5Mg = const Value.absent(),
    this.vitaminB6Mg = const Value.absent(),
    this.biotinB7Mcg = const Value.absent(),
    this.folateB9Mcg = const Value.absent(),
    this.folicAcidMcg = const Value.absent(),
    this.foodFolateMcg = const Value.absent(),
    this.folateDfeMcg = const Value.absent(),
    this.cholineMg = const Value.absent(),
    this.betaineMg = const Value.absent(),
    this.retinolMcg = const Value.absent(),
    this.caroteneBetaMcg = const Value.absent(),
    this.caroteneAlphaMcg = const Value.absent(),
    this.lycopeneMcg = const Value.absent(),
    this.luteinZeaxanthinMcg = const Value.absent(),
    this.vitaminD2ErgocalciferolMcg = const Value.absent(),
    this.vitaminD3CholecalciferolMcg = const Value.absent(),
    this.vitaminDIuIu = const Value.absent(),
    this.vitaminKMcg = const Value.absent(),
    this.dihydrophylloquinoneMcg = const Value.absent(),
    this.menaquinone4Mcg = const Value.absent(),
    this.fattyAcidsTotalMonounsaturatedMg = const Value.absent(),
    this.fattyAcidsTotalPolyunsaturatedMg = const Value.absent(),
    this.u183N3CCCAlaMg = const Value.absent(),
    this.u205N3EpaMg = const Value.absent(),
    this.u225N3DpaMg = const Value.absent(),
    this.u226N3DhaMg = const Value.absent(),
    this.tryptophanMg = const Value.absent(),
    this.threonineMg = const Value.absent(),
    this.isoleucineMg = const Value.absent(),
    this.leucineMg = const Value.absent(),
    this.lysineMg = const Value.absent(),
    this.methionineMg = const Value.absent(),
    this.cystineMg = const Value.absent(),
    this.phenylalanineMg = const Value.absent(),
    this.tyrosineMg = const Value.absent(),
    this.valineMg = const Value.absent(),
    this.arginineMg = const Value.absent(),
    this.histidineMg = const Value.absent(),
    this.alanineMg = const Value.absent(),
    this.asparticAcidMg = const Value.absent(),
    this.glutamicAcidMg = const Value.absent(),
    this.glycineMg = const Value.absent(),
    this.prolineMg = const Value.absent(),
    this.serineMg = const Value.absent(),
    this.hydroxyprolineMg = const Value.absent(),
    this.alcoholG = const Value.absent(),
    this.caffeineMg = const Value.absent(),
    this.theobromineMg = const Value.absent(),
    this.servingWeight1G = const Value.absent(),
    this.servingDescription1G = const Value.absent(),
    this.servingWeight2G = const Value.absent(),
    this.servingDescription2G = const Value.absent(),
    this.servingWeight3G = const Value.absent(),
    this.servingDescription3G = const Value.absent(),
    this.servingWeight4G = const Value.absent(),
    this.servingDescription4G = const Value.absent(),
    this.servingWeight5G = const Value.absent(),
    this.servingDescription5G = const Value.absent(),
    this.servingWeight6G = const Value.absent(),
    this.servingDescription6G = const Value.absent(),
    this.servingWeight7G = const Value.absent(),
    this.servingDescription7G = const Value.absent(),
    this.servingWeight8G = const Value.absent(),
    this.servingDescription8G = const Value.absent(),
    this.servingWeight9G = const Value.absent(),
    this.servingDescription9G = const Value.absent(),
    this.u200calorieWeightG = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Food> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? foodGroup,
    Expression<double>? calories,
    Expression<double>? fatG,
    Expression<double>? proteinG,
    Expression<double>? carbohydrateG,
    Expression<double>? sugarsG,
    Expression<double>? fiberG,
    Expression<double>? cholesterolMg,
    Expression<double>? saturatedFatsG,
    Expression<double>? calciumMg,
    Expression<double>? ironFeMg,
    Expression<double>? potassiumKMg,
    Expression<double>? magnesiumMg,
    Expression<double>? vitaminAIuIu,
    Expression<double>? vitaminARaeMcg,
    Expression<double>? vitaminCMg,
    Expression<double>? vitaminB12Mcg,
    Expression<double>? vitaminDMcg,
    Expression<double>? vitaminEAlphaTocopherolMg,
    Expression<double>? addedSugarG,
    Expression<double>? netCarbsG,
    Expression<double>? waterG,
    Expression<double>? omega3sMg,
    Expression<double>? omega6sMg,
    Expression<double>? pralScore,
    Expression<double>? transFattyAcidsG,
    Expression<double>? solubleFiberG,
    Expression<double>? insolubleFiberG,
    Expression<double>? sucroseG,
    Expression<double>? glucoseDextroseG,
    Expression<double>? fructoseG,
    Expression<double>? lactoseG,
    Expression<double>? maltoseG,
    Expression<double>? galactoseG,
    Expression<double>? starchG,
    Expression<double>? totalSugarAlcoholsG,
    Expression<double>? phosphorusPMg,
    Expression<double>? sodiumMg,
    Expression<double>? zincZnMg,
    Expression<double>? copperCuMg,
    Expression<double>? manganeseMg,
    Expression<double>? seleniumSeMcg,
    Expression<double>? fluorideFMcg,
    Expression<double>? molybdenumMcg,
    Expression<double>? chlorineMg,
    Expression<double>? thiaminB1Mg,
    Expression<double>? riboflavinB2Mg,
    Expression<double>? niacinB3Mg,
    Expression<double>? pantothenicAcidB5Mg,
    Expression<double>? vitaminB6Mg,
    Expression<double>? biotinB7Mcg,
    Expression<double>? folateB9Mcg,
    Expression<double>? folicAcidMcg,
    Expression<double>? foodFolateMcg,
    Expression<double>? folateDfeMcg,
    Expression<double>? cholineMg,
    Expression<double>? betaineMg,
    Expression<double>? retinolMcg,
    Expression<double>? caroteneBetaMcg,
    Expression<double>? caroteneAlphaMcg,
    Expression<double>? lycopeneMcg,
    Expression<double>? luteinZeaxanthinMcg,
    Expression<double>? vitaminD2ErgocalciferolMcg,
    Expression<double>? vitaminD3CholecalciferolMcg,
    Expression<double>? vitaminDIuIu,
    Expression<double>? vitaminKMcg,
    Expression<double>? dihydrophylloquinoneMcg,
    Expression<double>? menaquinone4Mcg,
    Expression<double>? fattyAcidsTotalMonounsaturatedMg,
    Expression<double>? fattyAcidsTotalPolyunsaturatedMg,
    Expression<double>? u183N3CCCAlaMg,
    Expression<double>? u205N3EpaMg,
    Expression<double>? u225N3DpaMg,
    Expression<double>? u226N3DhaMg,
    Expression<double>? tryptophanMg,
    Expression<double>? threonineMg,
    Expression<double>? isoleucineMg,
    Expression<double>? leucineMg,
    Expression<double>? lysineMg,
    Expression<double>? methionineMg,
    Expression<double>? cystineMg,
    Expression<double>? phenylalanineMg,
    Expression<double>? tyrosineMg,
    Expression<double>? valineMg,
    Expression<double>? arginineMg,
    Expression<double>? histidineMg,
    Expression<double>? alanineMg,
    Expression<double>? asparticAcidMg,
    Expression<double>? glutamicAcidMg,
    Expression<double>? glycineMg,
    Expression<double>? prolineMg,
    Expression<double>? serineMg,
    Expression<double>? hydroxyprolineMg,
    Expression<double>? alcoholG,
    Expression<double>? caffeineMg,
    Expression<double>? theobromineMg,
    Expression<double>? servingWeight1G,
    Expression<String>? servingDescription1G,
    Expression<double>? servingWeight2G,
    Expression<String>? servingDescription2G,
    Expression<double>? servingWeight3G,
    Expression<String>? servingDescription3G,
    Expression<double>? servingWeight4G,
    Expression<String>? servingDescription4G,
    Expression<double>? servingWeight5G,
    Expression<String>? servingDescription5G,
    Expression<double>? servingWeight6G,
    Expression<String>? servingDescription6G,
    Expression<double>? servingWeight7G,
    Expression<String>? servingDescription7G,
    Expression<double>? servingWeight8G,
    Expression<String>? servingDescription8G,
    Expression<double>? servingWeight9G,
    Expression<String>? servingDescription9G,
    Expression<double>? u200calorieWeightG,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (foodGroup != null) 'food_group': foodGroup,
      if (calories != null) 'calories': calories,
      if (fatG != null) 'fat_g': fatG,
      if (proteinG != null) 'protein_g': proteinG,
      if (carbohydrateG != null) 'carbohydrate_g': carbohydrateG,
      if (sugarsG != null) 'sugars_g': sugarsG,
      if (fiberG != null) 'fiber_g': fiberG,
      if (cholesterolMg != null) 'cholesterol_mg': cholesterolMg,
      if (saturatedFatsG != null) 'saturated_fats_g': saturatedFatsG,
      if (calciumMg != null) 'calcium_mg': calciumMg,
      if (ironFeMg != null) 'iron_fe_mg': ironFeMg,
      if (potassiumKMg != null) 'potassium_k_mg': potassiumKMg,
      if (magnesiumMg != null) 'magnesium_mg': magnesiumMg,
      if (vitaminAIuIu != null) 'vitamin_a_iu_iu': vitaminAIuIu,
      if (vitaminARaeMcg != null) 'vitamin_a_rae_mcg': vitaminARaeMcg,
      if (vitaminCMg != null) 'vitamin_c_mg': vitaminCMg,
      if (vitaminB12Mcg != null) 'vitamin_b_12_mcg': vitaminB12Mcg,
      if (vitaminDMcg != null) 'vitamin_d_mcg': vitaminDMcg,
      if (vitaminEAlphaTocopherolMg != null)
        'vitamin_e_alpha_tocopherol_mg': vitaminEAlphaTocopherolMg,
      if (addedSugarG != null) 'added_sugar_g': addedSugarG,
      if (netCarbsG != null) 'net_carbs_g': netCarbsG,
      if (waterG != null) 'water_g': waterG,
      if (omega3sMg != null) 'omega_3s_mg': omega3sMg,
      if (omega6sMg != null) 'omega_6s_mg': omega6sMg,
      if (pralScore != null) 'pral_score': pralScore,
      if (transFattyAcidsG != null) 'trans_fatty_acids_g': transFattyAcidsG,
      if (solubleFiberG != null) 'soluble_fiber_g': solubleFiberG,
      if (insolubleFiberG != null) 'insoluble_fiber_g': insolubleFiberG,
      if (sucroseG != null) 'sucrose_g': sucroseG,
      if (glucoseDextroseG != null) 'glucose_dextrose_g': glucoseDextroseG,
      if (fructoseG != null) 'fructose_g': fructoseG,
      if (lactoseG != null) 'lactose_g': lactoseG,
      if (maltoseG != null) 'maltose_g': maltoseG,
      if (galactoseG != null) 'galactose_g': galactoseG,
      if (starchG != null) 'starch_g': starchG,
      if (totalSugarAlcoholsG != null)
        'total_sugar_alcohols_g': totalSugarAlcoholsG,
      if (phosphorusPMg != null) 'phosphorus_p_mg': phosphorusPMg,
      if (sodiumMg != null) 'sodium_mg': sodiumMg,
      if (zincZnMg != null) 'zinc_zn_mg': zincZnMg,
      if (copperCuMg != null) 'copper_cu_mg': copperCuMg,
      if (manganeseMg != null) 'manganese_mg': manganeseMg,
      if (seleniumSeMcg != null) 'selenium_se_mcg': seleniumSeMcg,
      if (fluorideFMcg != null) 'fluoride_f_mcg': fluorideFMcg,
      if (molybdenumMcg != null) 'molybdenum_mcg': molybdenumMcg,
      if (chlorineMg != null) 'chlorine_mg': chlorineMg,
      if (thiaminB1Mg != null) 'thiamin_b1_mg': thiaminB1Mg,
      if (riboflavinB2Mg != null) 'riboflavin_b2_mg': riboflavinB2Mg,
      if (niacinB3Mg != null) 'niacin_b3_mg': niacinB3Mg,
      if (pantothenicAcidB5Mg != null)
        'pantothenic_acid_b5_mg': pantothenicAcidB5Mg,
      if (vitaminB6Mg != null) 'vitamin_b6_mg': vitaminB6Mg,
      if (biotinB7Mcg != null) 'biotin_b7_mcg': biotinB7Mcg,
      if (folateB9Mcg != null) 'folate_b9_mcg': folateB9Mcg,
      if (folicAcidMcg != null) 'folic_acid_mcg': folicAcidMcg,
      if (foodFolateMcg != null) 'food_folate_mcg': foodFolateMcg,
      if (folateDfeMcg != null) 'folate_dfe_mcg': folateDfeMcg,
      if (cholineMg != null) 'choline_mg': cholineMg,
      if (betaineMg != null) 'betaine_mg': betaineMg,
      if (retinolMcg != null) 'retinol_mcg': retinolMcg,
      if (caroteneBetaMcg != null) 'carotene_beta_mcg': caroteneBetaMcg,
      if (caroteneAlphaMcg != null) 'carotene_alpha_mcg': caroteneAlphaMcg,
      if (lycopeneMcg != null) 'lycopene_mcg': lycopeneMcg,
      if (luteinZeaxanthinMcg != null)
        'lutein_zeaxanthin_mcg': luteinZeaxanthinMcg,
      if (vitaminD2ErgocalciferolMcg != null)
        'vitamin_d2_ergocalciferol_mcg': vitaminD2ErgocalciferolMcg,
      if (vitaminD3CholecalciferolMcg != null)
        'vitamin_d3_cholecalciferol_mcg': vitaminD3CholecalciferolMcg,
      if (vitaminDIuIu != null) 'vitamin_d_iu_iu': vitaminDIuIu,
      if (vitaminKMcg != null) 'vitamin_k_mcg': vitaminKMcg,
      if (dihydrophylloquinoneMcg != null)
        'dihydrophylloquinone_mcg': dihydrophylloquinoneMcg,
      if (menaquinone4Mcg != null) 'menaquinone_4_mcg': menaquinone4Mcg,
      if (fattyAcidsTotalMonounsaturatedMg != null)
        'fatty_acids_total_monounsaturated_mg':
            fattyAcidsTotalMonounsaturatedMg,
      if (fattyAcidsTotalPolyunsaturatedMg != null)
        'fatty_acids_total_polyunsaturated_mg':
            fattyAcidsTotalPolyunsaturatedMg,
      if (u183N3CCCAlaMg != null) '_18_3_n_3_c_c_c_ala_mg': u183N3CCCAlaMg,
      if (u205N3EpaMg != null) '_20_5_n_3_epa_mg': u205N3EpaMg,
      if (u225N3DpaMg != null) '_22_5_n_3_dpa_mg': u225N3DpaMg,
      if (u226N3DhaMg != null) '_22_6_n_3_dha_mg': u226N3DhaMg,
      if (tryptophanMg != null) 'tryptophan_mg': tryptophanMg,
      if (threonineMg != null) 'threonine_mg': threonineMg,
      if (isoleucineMg != null) 'isoleucine_mg': isoleucineMg,
      if (leucineMg != null) 'leucine_mg': leucineMg,
      if (lysineMg != null) 'lysine_mg': lysineMg,
      if (methionineMg != null) 'methionine_mg': methionineMg,
      if (cystineMg != null) 'cystine_mg': cystineMg,
      if (phenylalanineMg != null) 'phenylalanine_mg': phenylalanineMg,
      if (tyrosineMg != null) 'tyrosine_mg': tyrosineMg,
      if (valineMg != null) 'valine_mg': valineMg,
      if (arginineMg != null) 'arginine_mg': arginineMg,
      if (histidineMg != null) 'histidine_mg': histidineMg,
      if (alanineMg != null) 'alanine_mg': alanineMg,
      if (asparticAcidMg != null) 'aspartic_acid_mg': asparticAcidMg,
      if (glutamicAcidMg != null) 'glutamic_acid_mg': glutamicAcidMg,
      if (glycineMg != null) 'glycine_mg': glycineMg,
      if (prolineMg != null) 'proline_mg': prolineMg,
      if (serineMg != null) 'serine_mg': serineMg,
      if (hydroxyprolineMg != null) 'hydroxyproline_mg': hydroxyprolineMg,
      if (alcoholG != null) 'alcohol_g': alcoholG,
      if (caffeineMg != null) 'caffeine_mg': caffeineMg,
      if (theobromineMg != null) 'theobromine_mg': theobromineMg,
      if (servingWeight1G != null) 'serving_weight_1_g': servingWeight1G,
      if (servingDescription1G != null)
        'serving_description_1_g': servingDescription1G,
      if (servingWeight2G != null) 'serving_weight_2_g': servingWeight2G,
      if (servingDescription2G != null)
        'serving_description_2_g': servingDescription2G,
      if (servingWeight3G != null) 'serving_weight_3_g': servingWeight3G,
      if (servingDescription3G != null)
        'serving_description_3_g': servingDescription3G,
      if (servingWeight4G != null) 'serving_weight_4_g': servingWeight4G,
      if (servingDescription4G != null)
        'serving_description_4_g': servingDescription4G,
      if (servingWeight5G != null) 'serving_weight_5_g': servingWeight5G,
      if (servingDescription5G != null)
        'serving_description_5_g': servingDescription5G,
      if (servingWeight6G != null) 'serving_weight_6_g': servingWeight6G,
      if (servingDescription6G != null)
        'serving_description_6_g': servingDescription6G,
      if (servingWeight7G != null) 'serving_weight_7_g': servingWeight7G,
      if (servingDescription7G != null)
        'serving_description_7_g': servingDescription7G,
      if (servingWeight8G != null) 'serving_weight_8_g': servingWeight8G,
      if (servingDescription8G != null)
        'serving_description_8_g': servingDescription8G,
      if (servingWeight9G != null) 'serving_weight_9_g': servingWeight9G,
      if (servingDescription9G != null)
        'serving_description_9_g': servingDescription9G,
      if (u200calorieWeightG != null)
        '_200_calorie_weight_g': u200calorieWeightG,
    });
  }

  FoodsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? foodGroup,
      Value<double?>? calories,
      Value<double?>? fatG,
      Value<double?>? proteinG,
      Value<double?>? carbohydrateG,
      Value<double?>? sugarsG,
      Value<double?>? fiberG,
      Value<double?>? cholesterolMg,
      Value<double?>? saturatedFatsG,
      Value<double?>? calciumMg,
      Value<double?>? ironFeMg,
      Value<double?>? potassiumKMg,
      Value<double?>? magnesiumMg,
      Value<double?>? vitaminAIuIu,
      Value<double?>? vitaminARaeMcg,
      Value<double?>? vitaminCMg,
      Value<double?>? vitaminB12Mcg,
      Value<double?>? vitaminDMcg,
      Value<double?>? vitaminEAlphaTocopherolMg,
      Value<double?>? addedSugarG,
      Value<double?>? netCarbsG,
      Value<double?>? waterG,
      Value<double?>? omega3sMg,
      Value<double?>? omega6sMg,
      Value<double?>? pralScore,
      Value<double?>? transFattyAcidsG,
      Value<double?>? solubleFiberG,
      Value<double?>? insolubleFiberG,
      Value<double?>? sucroseG,
      Value<double?>? glucoseDextroseG,
      Value<double?>? fructoseG,
      Value<double?>? lactoseG,
      Value<double?>? maltoseG,
      Value<double?>? galactoseG,
      Value<double?>? starchG,
      Value<double?>? totalSugarAlcoholsG,
      Value<double?>? phosphorusPMg,
      Value<double?>? sodiumMg,
      Value<double?>? zincZnMg,
      Value<double?>? copperCuMg,
      Value<double?>? manganeseMg,
      Value<double?>? seleniumSeMcg,
      Value<double?>? fluorideFMcg,
      Value<double?>? molybdenumMcg,
      Value<double?>? chlorineMg,
      Value<double?>? thiaminB1Mg,
      Value<double?>? riboflavinB2Mg,
      Value<double?>? niacinB3Mg,
      Value<double?>? pantothenicAcidB5Mg,
      Value<double?>? vitaminB6Mg,
      Value<double?>? biotinB7Mcg,
      Value<double?>? folateB9Mcg,
      Value<double?>? folicAcidMcg,
      Value<double?>? foodFolateMcg,
      Value<double?>? folateDfeMcg,
      Value<double?>? cholineMg,
      Value<double?>? betaineMg,
      Value<double?>? retinolMcg,
      Value<double?>? caroteneBetaMcg,
      Value<double?>? caroteneAlphaMcg,
      Value<double?>? lycopeneMcg,
      Value<double?>? luteinZeaxanthinMcg,
      Value<double?>? vitaminD2ErgocalciferolMcg,
      Value<double?>? vitaminD3CholecalciferolMcg,
      Value<double?>? vitaminDIuIu,
      Value<double?>? vitaminKMcg,
      Value<double?>? dihydrophylloquinoneMcg,
      Value<double?>? menaquinone4Mcg,
      Value<double?>? fattyAcidsTotalMonounsaturatedMg,
      Value<double?>? fattyAcidsTotalPolyunsaturatedMg,
      Value<double?>? u183N3CCCAlaMg,
      Value<double?>? u205N3EpaMg,
      Value<double?>? u225N3DpaMg,
      Value<double?>? u226N3DhaMg,
      Value<double?>? tryptophanMg,
      Value<double?>? threonineMg,
      Value<double?>? isoleucineMg,
      Value<double?>? leucineMg,
      Value<double?>? lysineMg,
      Value<double?>? methionineMg,
      Value<double?>? cystineMg,
      Value<double?>? phenylalanineMg,
      Value<double?>? tyrosineMg,
      Value<double?>? valineMg,
      Value<double?>? arginineMg,
      Value<double?>? histidineMg,
      Value<double?>? alanineMg,
      Value<double?>? asparticAcidMg,
      Value<double?>? glutamicAcidMg,
      Value<double?>? glycineMg,
      Value<double?>? prolineMg,
      Value<double?>? serineMg,
      Value<double?>? hydroxyprolineMg,
      Value<double?>? alcoholG,
      Value<double?>? caffeineMg,
      Value<double?>? theobromineMg,
      Value<double?>? servingWeight1G,
      Value<String?>? servingDescription1G,
      Value<double?>? servingWeight2G,
      Value<String?>? servingDescription2G,
      Value<double?>? servingWeight3G,
      Value<String?>? servingDescription3G,
      Value<double?>? servingWeight4G,
      Value<String?>? servingDescription4G,
      Value<double?>? servingWeight5G,
      Value<String?>? servingDescription5G,
      Value<double?>? servingWeight6G,
      Value<String?>? servingDescription6G,
      Value<double?>? servingWeight7G,
      Value<String?>? servingDescription7G,
      Value<double?>? servingWeight8G,
      Value<String?>? servingDescription8G,
      Value<double?>? servingWeight9G,
      Value<String?>? servingDescription9G,
      Value<double?>? u200calorieWeightG}) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      foodGroup: foodGroup ?? this.foodGroup,
      calories: calories ?? this.calories,
      fatG: fatG ?? this.fatG,
      proteinG: proteinG ?? this.proteinG,
      carbohydrateG: carbohydrateG ?? this.carbohydrateG,
      sugarsG: sugarsG ?? this.sugarsG,
      fiberG: fiberG ?? this.fiberG,
      cholesterolMg: cholesterolMg ?? this.cholesterolMg,
      saturatedFatsG: saturatedFatsG ?? this.saturatedFatsG,
      calciumMg: calciumMg ?? this.calciumMg,
      ironFeMg: ironFeMg ?? this.ironFeMg,
      potassiumKMg: potassiumKMg ?? this.potassiumKMg,
      magnesiumMg: magnesiumMg ?? this.magnesiumMg,
      vitaminAIuIu: vitaminAIuIu ?? this.vitaminAIuIu,
      vitaminARaeMcg: vitaminARaeMcg ?? this.vitaminARaeMcg,
      vitaminCMg: vitaminCMg ?? this.vitaminCMg,
      vitaminB12Mcg: vitaminB12Mcg ?? this.vitaminB12Mcg,
      vitaminDMcg: vitaminDMcg ?? this.vitaminDMcg,
      vitaminEAlphaTocopherolMg:
          vitaminEAlphaTocopherolMg ?? this.vitaminEAlphaTocopherolMg,
      addedSugarG: addedSugarG ?? this.addedSugarG,
      netCarbsG: netCarbsG ?? this.netCarbsG,
      waterG: waterG ?? this.waterG,
      omega3sMg: omega3sMg ?? this.omega3sMg,
      omega6sMg: omega6sMg ?? this.omega6sMg,
      pralScore: pralScore ?? this.pralScore,
      transFattyAcidsG: transFattyAcidsG ?? this.transFattyAcidsG,
      solubleFiberG: solubleFiberG ?? this.solubleFiberG,
      insolubleFiberG: insolubleFiberG ?? this.insolubleFiberG,
      sucroseG: sucroseG ?? this.sucroseG,
      glucoseDextroseG: glucoseDextroseG ?? this.glucoseDextroseG,
      fructoseG: fructoseG ?? this.fructoseG,
      lactoseG: lactoseG ?? this.lactoseG,
      maltoseG: maltoseG ?? this.maltoseG,
      galactoseG: galactoseG ?? this.galactoseG,
      starchG: starchG ?? this.starchG,
      totalSugarAlcoholsG: totalSugarAlcoholsG ?? this.totalSugarAlcoholsG,
      phosphorusPMg: phosphorusPMg ?? this.phosphorusPMg,
      sodiumMg: sodiumMg ?? this.sodiumMg,
      zincZnMg: zincZnMg ?? this.zincZnMg,
      copperCuMg: copperCuMg ?? this.copperCuMg,
      manganeseMg: manganeseMg ?? this.manganeseMg,
      seleniumSeMcg: seleniumSeMcg ?? this.seleniumSeMcg,
      fluorideFMcg: fluorideFMcg ?? this.fluorideFMcg,
      molybdenumMcg: molybdenumMcg ?? this.molybdenumMcg,
      chlorineMg: chlorineMg ?? this.chlorineMg,
      thiaminB1Mg: thiaminB1Mg ?? this.thiaminB1Mg,
      riboflavinB2Mg: riboflavinB2Mg ?? this.riboflavinB2Mg,
      niacinB3Mg: niacinB3Mg ?? this.niacinB3Mg,
      pantothenicAcidB5Mg: pantothenicAcidB5Mg ?? this.pantothenicAcidB5Mg,
      vitaminB6Mg: vitaminB6Mg ?? this.vitaminB6Mg,
      biotinB7Mcg: biotinB7Mcg ?? this.biotinB7Mcg,
      folateB9Mcg: folateB9Mcg ?? this.folateB9Mcg,
      folicAcidMcg: folicAcidMcg ?? this.folicAcidMcg,
      foodFolateMcg: foodFolateMcg ?? this.foodFolateMcg,
      folateDfeMcg: folateDfeMcg ?? this.folateDfeMcg,
      cholineMg: cholineMg ?? this.cholineMg,
      betaineMg: betaineMg ?? this.betaineMg,
      retinolMcg: retinolMcg ?? this.retinolMcg,
      caroteneBetaMcg: caroteneBetaMcg ?? this.caroteneBetaMcg,
      caroteneAlphaMcg: caroteneAlphaMcg ?? this.caroteneAlphaMcg,
      lycopeneMcg: lycopeneMcg ?? this.lycopeneMcg,
      luteinZeaxanthinMcg: luteinZeaxanthinMcg ?? this.luteinZeaxanthinMcg,
      vitaminD2ErgocalciferolMcg:
          vitaminD2ErgocalciferolMcg ?? this.vitaminD2ErgocalciferolMcg,
      vitaminD3CholecalciferolMcg:
          vitaminD3CholecalciferolMcg ?? this.vitaminD3CholecalciferolMcg,
      vitaminDIuIu: vitaminDIuIu ?? this.vitaminDIuIu,
      vitaminKMcg: vitaminKMcg ?? this.vitaminKMcg,
      dihydrophylloquinoneMcg:
          dihydrophylloquinoneMcg ?? this.dihydrophylloquinoneMcg,
      menaquinone4Mcg: menaquinone4Mcg ?? this.menaquinone4Mcg,
      fattyAcidsTotalMonounsaturatedMg: fattyAcidsTotalMonounsaturatedMg ??
          this.fattyAcidsTotalMonounsaturatedMg,
      fattyAcidsTotalPolyunsaturatedMg: fattyAcidsTotalPolyunsaturatedMg ??
          this.fattyAcidsTotalPolyunsaturatedMg,
      u183N3CCCAlaMg: u183N3CCCAlaMg ?? this.u183N3CCCAlaMg,
      u205N3EpaMg: u205N3EpaMg ?? this.u205N3EpaMg,
      u225N3DpaMg: u225N3DpaMg ?? this.u225N3DpaMg,
      u226N3DhaMg: u226N3DhaMg ?? this.u226N3DhaMg,
      tryptophanMg: tryptophanMg ?? this.tryptophanMg,
      threonineMg: threonineMg ?? this.threonineMg,
      isoleucineMg: isoleucineMg ?? this.isoleucineMg,
      leucineMg: leucineMg ?? this.leucineMg,
      lysineMg: lysineMg ?? this.lysineMg,
      methionineMg: methionineMg ?? this.methionineMg,
      cystineMg: cystineMg ?? this.cystineMg,
      phenylalanineMg: phenylalanineMg ?? this.phenylalanineMg,
      tyrosineMg: tyrosineMg ?? this.tyrosineMg,
      valineMg: valineMg ?? this.valineMg,
      arginineMg: arginineMg ?? this.arginineMg,
      histidineMg: histidineMg ?? this.histidineMg,
      alanineMg: alanineMg ?? this.alanineMg,
      asparticAcidMg: asparticAcidMg ?? this.asparticAcidMg,
      glutamicAcidMg: glutamicAcidMg ?? this.glutamicAcidMg,
      glycineMg: glycineMg ?? this.glycineMg,
      prolineMg: prolineMg ?? this.prolineMg,
      serineMg: serineMg ?? this.serineMg,
      hydroxyprolineMg: hydroxyprolineMg ?? this.hydroxyprolineMg,
      alcoholG: alcoholG ?? this.alcoholG,
      caffeineMg: caffeineMg ?? this.caffeineMg,
      theobromineMg: theobromineMg ?? this.theobromineMg,
      servingWeight1G: servingWeight1G ?? this.servingWeight1G,
      servingDescription1G: servingDescription1G ?? this.servingDescription1G,
      servingWeight2G: servingWeight2G ?? this.servingWeight2G,
      servingDescription2G: servingDescription2G ?? this.servingDescription2G,
      servingWeight3G: servingWeight3G ?? this.servingWeight3G,
      servingDescription3G: servingDescription3G ?? this.servingDescription3G,
      servingWeight4G: servingWeight4G ?? this.servingWeight4G,
      servingDescription4G: servingDescription4G ?? this.servingDescription4G,
      servingWeight5G: servingWeight5G ?? this.servingWeight5G,
      servingDescription5G: servingDescription5G ?? this.servingDescription5G,
      servingWeight6G: servingWeight6G ?? this.servingWeight6G,
      servingDescription6G: servingDescription6G ?? this.servingDescription6G,
      servingWeight7G: servingWeight7G ?? this.servingWeight7G,
      servingDescription7G: servingDescription7G ?? this.servingDescription7G,
      servingWeight8G: servingWeight8G ?? this.servingWeight8G,
      servingDescription8G: servingDescription8G ?? this.servingDescription8G,
      servingWeight9G: servingWeight9G ?? this.servingWeight9G,
      servingDescription9G: servingDescription9G ?? this.servingDescription9G,
      u200calorieWeightG: u200calorieWeightG ?? this.u200calorieWeightG,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (foodGroup.present) {
      map['food_group'] = Variable<String>(foodGroup.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (fatG.present) {
      map['fat_g'] = Variable<double>(fatG.value);
    }
    if (proteinG.present) {
      map['protein_g'] = Variable<double>(proteinG.value);
    }
    if (carbohydrateG.present) {
      map['carbohydrate_g'] = Variable<double>(carbohydrateG.value);
    }
    if (sugarsG.present) {
      map['sugars_g'] = Variable<double>(sugarsG.value);
    }
    if (fiberG.present) {
      map['fiber_g'] = Variable<double>(fiberG.value);
    }
    if (cholesterolMg.present) {
      map['cholesterol_mg'] = Variable<double>(cholesterolMg.value);
    }
    if (saturatedFatsG.present) {
      map['saturated_fats_g'] = Variable<double>(saturatedFatsG.value);
    }
    if (calciumMg.present) {
      map['calcium_mg'] = Variable<double>(calciumMg.value);
    }
    if (ironFeMg.present) {
      map['iron_fe_mg'] = Variable<double>(ironFeMg.value);
    }
    if (potassiumKMg.present) {
      map['potassium_k_mg'] = Variable<double>(potassiumKMg.value);
    }
    if (magnesiumMg.present) {
      map['magnesium_mg'] = Variable<double>(magnesiumMg.value);
    }
    if (vitaminAIuIu.present) {
      map['vitamin_a_iu_iu'] = Variable<double>(vitaminAIuIu.value);
    }
    if (vitaminARaeMcg.present) {
      map['vitamin_a_rae_mcg'] = Variable<double>(vitaminARaeMcg.value);
    }
    if (vitaminCMg.present) {
      map['vitamin_c_mg'] = Variable<double>(vitaminCMg.value);
    }
    if (vitaminB12Mcg.present) {
      map['vitamin_b_12_mcg'] = Variable<double>(vitaminB12Mcg.value);
    }
    if (vitaminDMcg.present) {
      map['vitamin_d_mcg'] = Variable<double>(vitaminDMcg.value);
    }
    if (vitaminEAlphaTocopherolMg.present) {
      map['vitamin_e_alpha_tocopherol_mg'] =
          Variable<double>(vitaminEAlphaTocopherolMg.value);
    }
    if (addedSugarG.present) {
      map['added_sugar_g'] = Variable<double>(addedSugarG.value);
    }
    if (netCarbsG.present) {
      map['net_carbs_g'] = Variable<double>(netCarbsG.value);
    }
    if (waterG.present) {
      map['water_g'] = Variable<double>(waterG.value);
    }
    if (omega3sMg.present) {
      map['omega_3s_mg'] = Variable<double>(omega3sMg.value);
    }
    if (omega6sMg.present) {
      map['omega_6s_mg'] = Variable<double>(omega6sMg.value);
    }
    if (pralScore.present) {
      map['pral_score'] = Variable<double>(pralScore.value);
    }
    if (transFattyAcidsG.present) {
      map['trans_fatty_acids_g'] = Variable<double>(transFattyAcidsG.value);
    }
    if (solubleFiberG.present) {
      map['soluble_fiber_g'] = Variable<double>(solubleFiberG.value);
    }
    if (insolubleFiberG.present) {
      map['insoluble_fiber_g'] = Variable<double>(insolubleFiberG.value);
    }
    if (sucroseG.present) {
      map['sucrose_g'] = Variable<double>(sucroseG.value);
    }
    if (glucoseDextroseG.present) {
      map['glucose_dextrose_g'] = Variable<double>(glucoseDextroseG.value);
    }
    if (fructoseG.present) {
      map['fructose_g'] = Variable<double>(fructoseG.value);
    }
    if (lactoseG.present) {
      map['lactose_g'] = Variable<double>(lactoseG.value);
    }
    if (maltoseG.present) {
      map['maltose_g'] = Variable<double>(maltoseG.value);
    }
    if (galactoseG.present) {
      map['galactose_g'] = Variable<double>(galactoseG.value);
    }
    if (starchG.present) {
      map['starch_g'] = Variable<double>(starchG.value);
    }
    if (totalSugarAlcoholsG.present) {
      map['total_sugar_alcohols_g'] =
          Variable<double>(totalSugarAlcoholsG.value);
    }
    if (phosphorusPMg.present) {
      map['phosphorus_p_mg'] = Variable<double>(phosphorusPMg.value);
    }
    if (sodiumMg.present) {
      map['sodium_mg'] = Variable<double>(sodiumMg.value);
    }
    if (zincZnMg.present) {
      map['zinc_zn_mg'] = Variable<double>(zincZnMg.value);
    }
    if (copperCuMg.present) {
      map['copper_cu_mg'] = Variable<double>(copperCuMg.value);
    }
    if (manganeseMg.present) {
      map['manganese_mg'] = Variable<double>(manganeseMg.value);
    }
    if (seleniumSeMcg.present) {
      map['selenium_se_mcg'] = Variable<double>(seleniumSeMcg.value);
    }
    if (fluorideFMcg.present) {
      map['fluoride_f_mcg'] = Variable<double>(fluorideFMcg.value);
    }
    if (molybdenumMcg.present) {
      map['molybdenum_mcg'] = Variable<double>(molybdenumMcg.value);
    }
    if (chlorineMg.present) {
      map['chlorine_mg'] = Variable<double>(chlorineMg.value);
    }
    if (thiaminB1Mg.present) {
      map['thiamin_b1_mg'] = Variable<double>(thiaminB1Mg.value);
    }
    if (riboflavinB2Mg.present) {
      map['riboflavin_b2_mg'] = Variable<double>(riboflavinB2Mg.value);
    }
    if (niacinB3Mg.present) {
      map['niacin_b3_mg'] = Variable<double>(niacinB3Mg.value);
    }
    if (pantothenicAcidB5Mg.present) {
      map['pantothenic_acid_b5_mg'] =
          Variable<double>(pantothenicAcidB5Mg.value);
    }
    if (vitaminB6Mg.present) {
      map['vitamin_b6_mg'] = Variable<double>(vitaminB6Mg.value);
    }
    if (biotinB7Mcg.present) {
      map['biotin_b7_mcg'] = Variable<double>(biotinB7Mcg.value);
    }
    if (folateB9Mcg.present) {
      map['folate_b9_mcg'] = Variable<double>(folateB9Mcg.value);
    }
    if (folicAcidMcg.present) {
      map['folic_acid_mcg'] = Variable<double>(folicAcidMcg.value);
    }
    if (foodFolateMcg.present) {
      map['food_folate_mcg'] = Variable<double>(foodFolateMcg.value);
    }
    if (folateDfeMcg.present) {
      map['folate_dfe_mcg'] = Variable<double>(folateDfeMcg.value);
    }
    if (cholineMg.present) {
      map['choline_mg'] = Variable<double>(cholineMg.value);
    }
    if (betaineMg.present) {
      map['betaine_mg'] = Variable<double>(betaineMg.value);
    }
    if (retinolMcg.present) {
      map['retinol_mcg'] = Variable<double>(retinolMcg.value);
    }
    if (caroteneBetaMcg.present) {
      map['carotene_beta_mcg'] = Variable<double>(caroteneBetaMcg.value);
    }
    if (caroteneAlphaMcg.present) {
      map['carotene_alpha_mcg'] = Variable<double>(caroteneAlphaMcg.value);
    }
    if (lycopeneMcg.present) {
      map['lycopene_mcg'] = Variable<double>(lycopeneMcg.value);
    }
    if (luteinZeaxanthinMcg.present) {
      map['lutein_zeaxanthin_mcg'] =
          Variable<double>(luteinZeaxanthinMcg.value);
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
    if (vitaminKMcg.present) {
      map['vitamin_k_mcg'] = Variable<double>(vitaminKMcg.value);
    }
    if (dihydrophylloquinoneMcg.present) {
      map['dihydrophylloquinone_mcg'] =
          Variable<double>(dihydrophylloquinoneMcg.value);
    }
    if (menaquinone4Mcg.present) {
      map['menaquinone_4_mcg'] = Variable<double>(menaquinone4Mcg.value);
    }
    if (fattyAcidsTotalMonounsaturatedMg.present) {
      map['fatty_acids_total_monounsaturated_mg'] =
          Variable<double>(fattyAcidsTotalMonounsaturatedMg.value);
    }
    if (fattyAcidsTotalPolyunsaturatedMg.present) {
      map['fatty_acids_total_polyunsaturated_mg'] =
          Variable<double>(fattyAcidsTotalPolyunsaturatedMg.value);
    }
    if (u183N3CCCAlaMg.present) {
      map['_18_3_n_3_c_c_c_ala_mg'] = Variable<double>(u183N3CCCAlaMg.value);
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
    if (tryptophanMg.present) {
      map['tryptophan_mg'] = Variable<double>(tryptophanMg.value);
    }
    if (threonineMg.present) {
      map['threonine_mg'] = Variable<double>(threonineMg.value);
    }
    if (isoleucineMg.present) {
      map['isoleucine_mg'] = Variable<double>(isoleucineMg.value);
    }
    if (leucineMg.present) {
      map['leucine_mg'] = Variable<double>(leucineMg.value);
    }
    if (lysineMg.present) {
      map['lysine_mg'] = Variable<double>(lysineMg.value);
    }
    if (methionineMg.present) {
      map['methionine_mg'] = Variable<double>(methionineMg.value);
    }
    if (cystineMg.present) {
      map['cystine_mg'] = Variable<double>(cystineMg.value);
    }
    if (phenylalanineMg.present) {
      map['phenylalanine_mg'] = Variable<double>(phenylalanineMg.value);
    }
    if (tyrosineMg.present) {
      map['tyrosine_mg'] = Variable<double>(tyrosineMg.value);
    }
    if (valineMg.present) {
      map['valine_mg'] = Variable<double>(valineMg.value);
    }
    if (arginineMg.present) {
      map['arginine_mg'] = Variable<double>(arginineMg.value);
    }
    if (histidineMg.present) {
      map['histidine_mg'] = Variable<double>(histidineMg.value);
    }
    if (alanineMg.present) {
      map['alanine_mg'] = Variable<double>(alanineMg.value);
    }
    if (asparticAcidMg.present) {
      map['aspartic_acid_mg'] = Variable<double>(asparticAcidMg.value);
    }
    if (glutamicAcidMg.present) {
      map['glutamic_acid_mg'] = Variable<double>(glutamicAcidMg.value);
    }
    if (glycineMg.present) {
      map['glycine_mg'] = Variable<double>(glycineMg.value);
    }
    if (prolineMg.present) {
      map['proline_mg'] = Variable<double>(prolineMg.value);
    }
    if (serineMg.present) {
      map['serine_mg'] = Variable<double>(serineMg.value);
    }
    if (hydroxyprolineMg.present) {
      map['hydroxyproline_mg'] = Variable<double>(hydroxyprolineMg.value);
    }
    if (alcoholG.present) {
      map['alcohol_g'] = Variable<double>(alcoholG.value);
    }
    if (caffeineMg.present) {
      map['caffeine_mg'] = Variable<double>(caffeineMg.value);
    }
    if (theobromineMg.present) {
      map['theobromine_mg'] = Variable<double>(theobromineMg.value);
    }
    if (servingWeight1G.present) {
      map['serving_weight_1_g'] = Variable<double>(servingWeight1G.value);
    }
    if (servingDescription1G.present) {
      map['serving_description_1_g'] =
          Variable<String>(servingDescription1G.value);
    }
    if (servingWeight2G.present) {
      map['serving_weight_2_g'] = Variable<double>(servingWeight2G.value);
    }
    if (servingDescription2G.present) {
      map['serving_description_2_g'] =
          Variable<String>(servingDescription2G.value);
    }
    if (servingWeight3G.present) {
      map['serving_weight_3_g'] = Variable<double>(servingWeight3G.value);
    }
    if (servingDescription3G.present) {
      map['serving_description_3_g'] =
          Variable<String>(servingDescription3G.value);
    }
    if (servingWeight4G.present) {
      map['serving_weight_4_g'] = Variable<double>(servingWeight4G.value);
    }
    if (servingDescription4G.present) {
      map['serving_description_4_g'] =
          Variable<String>(servingDescription4G.value);
    }
    if (servingWeight5G.present) {
      map['serving_weight_5_g'] = Variable<double>(servingWeight5G.value);
    }
    if (servingDescription5G.present) {
      map['serving_description_5_g'] =
          Variable<String>(servingDescription5G.value);
    }
    if (servingWeight6G.present) {
      map['serving_weight_6_g'] = Variable<double>(servingWeight6G.value);
    }
    if (servingDescription6G.present) {
      map['serving_description_6_g'] =
          Variable<String>(servingDescription6G.value);
    }
    if (servingWeight7G.present) {
      map['serving_weight_7_g'] = Variable<double>(servingWeight7G.value);
    }
    if (servingDescription7G.present) {
      map['serving_description_7_g'] =
          Variable<String>(servingDescription7G.value);
    }
    if (servingWeight8G.present) {
      map['serving_weight_8_g'] = Variable<double>(servingWeight8G.value);
    }
    if (servingDescription8G.present) {
      map['serving_description_8_g'] =
          Variable<String>(servingDescription8G.value);
    }
    if (servingWeight9G.present) {
      map['serving_weight_9_g'] = Variable<double>(servingWeight9G.value);
    }
    if (servingDescription9G.present) {
      map['serving_description_9_g'] =
          Variable<String>(servingDescription9G.value);
    }
    if (u200calorieWeightG.present) {
      map['_200_calorie_weight_g'] = Variable<double>(u200calorieWeightG.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('foodGroup: $foodGroup, ')
          ..write('calories: $calories, ')
          ..write('fatG: $fatG, ')
          ..write('proteinG: $proteinG, ')
          ..write('carbohydrateG: $carbohydrateG, ')
          ..write('sugarsG: $sugarsG, ')
          ..write('fiberG: $fiberG, ')
          ..write('cholesterolMg: $cholesterolMg, ')
          ..write('saturatedFatsG: $saturatedFatsG, ')
          ..write('calciumMg: $calciumMg, ')
          ..write('ironFeMg: $ironFeMg, ')
          ..write('potassiumKMg: $potassiumKMg, ')
          ..write('magnesiumMg: $magnesiumMg, ')
          ..write('vitaminAIuIu: $vitaminAIuIu, ')
          ..write('vitaminARaeMcg: $vitaminARaeMcg, ')
          ..write('vitaminCMg: $vitaminCMg, ')
          ..write('vitaminB12Mcg: $vitaminB12Mcg, ')
          ..write('vitaminDMcg: $vitaminDMcg, ')
          ..write('vitaminEAlphaTocopherolMg: $vitaminEAlphaTocopherolMg, ')
          ..write('addedSugarG: $addedSugarG, ')
          ..write('netCarbsG: $netCarbsG, ')
          ..write('waterG: $waterG, ')
          ..write('omega3sMg: $omega3sMg, ')
          ..write('omega6sMg: $omega6sMg, ')
          ..write('pralScore: $pralScore, ')
          ..write('transFattyAcidsG: $transFattyAcidsG, ')
          ..write('solubleFiberG: $solubleFiberG, ')
          ..write('insolubleFiberG: $insolubleFiberG, ')
          ..write('sucroseG: $sucroseG, ')
          ..write('glucoseDextroseG: $glucoseDextroseG, ')
          ..write('fructoseG: $fructoseG, ')
          ..write('lactoseG: $lactoseG, ')
          ..write('maltoseG: $maltoseG, ')
          ..write('galactoseG: $galactoseG, ')
          ..write('starchG: $starchG, ')
          ..write('totalSugarAlcoholsG: $totalSugarAlcoholsG, ')
          ..write('phosphorusPMg: $phosphorusPMg, ')
          ..write('sodiumMg: $sodiumMg, ')
          ..write('zincZnMg: $zincZnMg, ')
          ..write('copperCuMg: $copperCuMg, ')
          ..write('manganeseMg: $manganeseMg, ')
          ..write('seleniumSeMcg: $seleniumSeMcg, ')
          ..write('fluorideFMcg: $fluorideFMcg, ')
          ..write('molybdenumMcg: $molybdenumMcg, ')
          ..write('chlorineMg: $chlorineMg, ')
          ..write('thiaminB1Mg: $thiaminB1Mg, ')
          ..write('riboflavinB2Mg: $riboflavinB2Mg, ')
          ..write('niacinB3Mg: $niacinB3Mg, ')
          ..write('pantothenicAcidB5Mg: $pantothenicAcidB5Mg, ')
          ..write('vitaminB6Mg: $vitaminB6Mg, ')
          ..write('biotinB7Mcg: $biotinB7Mcg, ')
          ..write('folateB9Mcg: $folateB9Mcg, ')
          ..write('folicAcidMcg: $folicAcidMcg, ')
          ..write('foodFolateMcg: $foodFolateMcg, ')
          ..write('folateDfeMcg: $folateDfeMcg, ')
          ..write('cholineMg: $cholineMg, ')
          ..write('betaineMg: $betaineMg, ')
          ..write('retinolMcg: $retinolMcg, ')
          ..write('caroteneBetaMcg: $caroteneBetaMcg, ')
          ..write('caroteneAlphaMcg: $caroteneAlphaMcg, ')
          ..write('lycopeneMcg: $lycopeneMcg, ')
          ..write('luteinZeaxanthinMcg: $luteinZeaxanthinMcg, ')
          ..write('vitaminD2ErgocalciferolMcg: $vitaminD2ErgocalciferolMcg, ')
          ..write('vitaminD3CholecalciferolMcg: $vitaminD3CholecalciferolMcg, ')
          ..write('vitaminDIuIu: $vitaminDIuIu, ')
          ..write('vitaminKMcg: $vitaminKMcg, ')
          ..write('dihydrophylloquinoneMcg: $dihydrophylloquinoneMcg, ')
          ..write('menaquinone4Mcg: $menaquinone4Mcg, ')
          ..write(
              'fattyAcidsTotalMonounsaturatedMg: $fattyAcidsTotalMonounsaturatedMg, ')
          ..write(
              'fattyAcidsTotalPolyunsaturatedMg: $fattyAcidsTotalPolyunsaturatedMg, ')
          ..write('u183N3CCCAlaMg: $u183N3CCCAlaMg, ')
          ..write('u205N3EpaMg: $u205N3EpaMg, ')
          ..write('u225N3DpaMg: $u225N3DpaMg, ')
          ..write('u226N3DhaMg: $u226N3DhaMg, ')
          ..write('tryptophanMg: $tryptophanMg, ')
          ..write('threonineMg: $threonineMg, ')
          ..write('isoleucineMg: $isoleucineMg, ')
          ..write('leucineMg: $leucineMg, ')
          ..write('lysineMg: $lysineMg, ')
          ..write('methionineMg: $methionineMg, ')
          ..write('cystineMg: $cystineMg, ')
          ..write('phenylalanineMg: $phenylalanineMg, ')
          ..write('tyrosineMg: $tyrosineMg, ')
          ..write('valineMg: $valineMg, ')
          ..write('arginineMg: $arginineMg, ')
          ..write('histidineMg: $histidineMg, ')
          ..write('alanineMg: $alanineMg, ')
          ..write('asparticAcidMg: $asparticAcidMg, ')
          ..write('glutamicAcidMg: $glutamicAcidMg, ')
          ..write('glycineMg: $glycineMg, ')
          ..write('prolineMg: $prolineMg, ')
          ..write('serineMg: $serineMg, ')
          ..write('hydroxyprolineMg: $hydroxyprolineMg, ')
          ..write('alcoholG: $alcoholG, ')
          ..write('caffeineMg: $caffeineMg, ')
          ..write('theobromineMg: $theobromineMg, ')
          ..write('servingWeight1G: $servingWeight1G, ')
          ..write('servingDescription1G: $servingDescription1G, ')
          ..write('servingWeight2G: $servingWeight2G, ')
          ..write('servingDescription2G: $servingDescription2G, ')
          ..write('servingWeight3G: $servingWeight3G, ')
          ..write('servingDescription3G: $servingDescription3G, ')
          ..write('servingWeight4G: $servingWeight4G, ')
          ..write('servingDescription4G: $servingDescription4G, ')
          ..write('servingWeight5G: $servingWeight5G, ')
          ..write('servingDescription5G: $servingDescription5G, ')
          ..write('servingWeight6G: $servingWeight6G, ')
          ..write('servingDescription6G: $servingDescription6G, ')
          ..write('servingWeight7G: $servingWeight7G, ')
          ..write('servingDescription7G: $servingDescription7G, ')
          ..write('servingWeight8G: $servingWeight8G, ')
          ..write('servingDescription8G: $servingDescription8G, ')
          ..write('servingWeight9G: $servingWeight9G, ')
          ..write('servingDescription9G: $servingDescription9G, ')
          ..write('u200calorieWeightG: $u200calorieWeightG')
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $FoodsTable foods = $FoodsTable(this);
  late final $EntriesTable entries = $EntriesTable(this);
  late final $WeightsTable weights = $WeightsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foods, entries, weights];
}

typedef $$FoodsTableInsertCompanionBuilder = FoodsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> foodGroup,
  Value<double?> calories,
  Value<double?> fatG,
  Value<double?> proteinG,
  Value<double?> carbohydrateG,
  Value<double?> sugarsG,
  Value<double?> fiberG,
  Value<double?> cholesterolMg,
  Value<double?> saturatedFatsG,
  Value<double?> calciumMg,
  Value<double?> ironFeMg,
  Value<double?> potassiumKMg,
  Value<double?> magnesiumMg,
  Value<double?> vitaminAIuIu,
  Value<double?> vitaminARaeMcg,
  Value<double?> vitaminCMg,
  Value<double?> vitaminB12Mcg,
  Value<double?> vitaminDMcg,
  Value<double?> vitaminEAlphaTocopherolMg,
  Value<double?> addedSugarG,
  Value<double?> netCarbsG,
  Value<double?> waterG,
  Value<double?> omega3sMg,
  Value<double?> omega6sMg,
  Value<double?> pralScore,
  Value<double?> transFattyAcidsG,
  Value<double?> solubleFiberG,
  Value<double?> insolubleFiberG,
  Value<double?> sucroseG,
  Value<double?> glucoseDextroseG,
  Value<double?> fructoseG,
  Value<double?> lactoseG,
  Value<double?> maltoseG,
  Value<double?> galactoseG,
  Value<double?> starchG,
  Value<double?> totalSugarAlcoholsG,
  Value<double?> phosphorusPMg,
  Value<double?> sodiumMg,
  Value<double?> zincZnMg,
  Value<double?> copperCuMg,
  Value<double?> manganeseMg,
  Value<double?> seleniumSeMcg,
  Value<double?> fluorideFMcg,
  Value<double?> molybdenumMcg,
  Value<double?> chlorineMg,
  Value<double?> thiaminB1Mg,
  Value<double?> riboflavinB2Mg,
  Value<double?> niacinB3Mg,
  Value<double?> pantothenicAcidB5Mg,
  Value<double?> vitaminB6Mg,
  Value<double?> biotinB7Mcg,
  Value<double?> folateB9Mcg,
  Value<double?> folicAcidMcg,
  Value<double?> foodFolateMcg,
  Value<double?> folateDfeMcg,
  Value<double?> cholineMg,
  Value<double?> betaineMg,
  Value<double?> retinolMcg,
  Value<double?> caroteneBetaMcg,
  Value<double?> caroteneAlphaMcg,
  Value<double?> lycopeneMcg,
  Value<double?> luteinZeaxanthinMcg,
  Value<double?> vitaminD2ErgocalciferolMcg,
  Value<double?> vitaminD3CholecalciferolMcg,
  Value<double?> vitaminDIuIu,
  Value<double?> vitaminKMcg,
  Value<double?> dihydrophylloquinoneMcg,
  Value<double?> menaquinone4Mcg,
  Value<double?> fattyAcidsTotalMonounsaturatedMg,
  Value<double?> fattyAcidsTotalPolyunsaturatedMg,
  Value<double?> u183N3CCCAlaMg,
  Value<double?> u205N3EpaMg,
  Value<double?> u225N3DpaMg,
  Value<double?> u226N3DhaMg,
  Value<double?> tryptophanMg,
  Value<double?> threonineMg,
  Value<double?> isoleucineMg,
  Value<double?> leucineMg,
  Value<double?> lysineMg,
  Value<double?> methionineMg,
  Value<double?> cystineMg,
  Value<double?> phenylalanineMg,
  Value<double?> tyrosineMg,
  Value<double?> valineMg,
  Value<double?> arginineMg,
  Value<double?> histidineMg,
  Value<double?> alanineMg,
  Value<double?> asparticAcidMg,
  Value<double?> glutamicAcidMg,
  Value<double?> glycineMg,
  Value<double?> prolineMg,
  Value<double?> serineMg,
  Value<double?> hydroxyprolineMg,
  Value<double?> alcoholG,
  Value<double?> caffeineMg,
  Value<double?> theobromineMg,
  Value<double?> servingWeight1G,
  Value<String?> servingDescription1G,
  Value<double?> servingWeight2G,
  Value<String?> servingDescription2G,
  Value<double?> servingWeight3G,
  Value<String?> servingDescription3G,
  Value<double?> servingWeight4G,
  Value<String?> servingDescription4G,
  Value<double?> servingWeight5G,
  Value<String?> servingDescription5G,
  Value<double?> servingWeight6G,
  Value<String?> servingDescription6G,
  Value<double?> servingWeight7G,
  Value<String?> servingDescription7G,
  Value<double?> servingWeight8G,
  Value<String?> servingDescription8G,
  Value<double?> servingWeight9G,
  Value<String?> servingDescription9G,
  Value<double?> u200calorieWeightG,
});
typedef $$FoodsTableUpdateCompanionBuilder = FoodsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> foodGroup,
  Value<double?> calories,
  Value<double?> fatG,
  Value<double?> proteinG,
  Value<double?> carbohydrateG,
  Value<double?> sugarsG,
  Value<double?> fiberG,
  Value<double?> cholesterolMg,
  Value<double?> saturatedFatsG,
  Value<double?> calciumMg,
  Value<double?> ironFeMg,
  Value<double?> potassiumKMg,
  Value<double?> magnesiumMg,
  Value<double?> vitaminAIuIu,
  Value<double?> vitaminARaeMcg,
  Value<double?> vitaminCMg,
  Value<double?> vitaminB12Mcg,
  Value<double?> vitaminDMcg,
  Value<double?> vitaminEAlphaTocopherolMg,
  Value<double?> addedSugarG,
  Value<double?> netCarbsG,
  Value<double?> waterG,
  Value<double?> omega3sMg,
  Value<double?> omega6sMg,
  Value<double?> pralScore,
  Value<double?> transFattyAcidsG,
  Value<double?> solubleFiberG,
  Value<double?> insolubleFiberG,
  Value<double?> sucroseG,
  Value<double?> glucoseDextroseG,
  Value<double?> fructoseG,
  Value<double?> lactoseG,
  Value<double?> maltoseG,
  Value<double?> galactoseG,
  Value<double?> starchG,
  Value<double?> totalSugarAlcoholsG,
  Value<double?> phosphorusPMg,
  Value<double?> sodiumMg,
  Value<double?> zincZnMg,
  Value<double?> copperCuMg,
  Value<double?> manganeseMg,
  Value<double?> seleniumSeMcg,
  Value<double?> fluorideFMcg,
  Value<double?> molybdenumMcg,
  Value<double?> chlorineMg,
  Value<double?> thiaminB1Mg,
  Value<double?> riboflavinB2Mg,
  Value<double?> niacinB3Mg,
  Value<double?> pantothenicAcidB5Mg,
  Value<double?> vitaminB6Mg,
  Value<double?> biotinB7Mcg,
  Value<double?> folateB9Mcg,
  Value<double?> folicAcidMcg,
  Value<double?> foodFolateMcg,
  Value<double?> folateDfeMcg,
  Value<double?> cholineMg,
  Value<double?> betaineMg,
  Value<double?> retinolMcg,
  Value<double?> caroteneBetaMcg,
  Value<double?> caroteneAlphaMcg,
  Value<double?> lycopeneMcg,
  Value<double?> luteinZeaxanthinMcg,
  Value<double?> vitaminD2ErgocalciferolMcg,
  Value<double?> vitaminD3CholecalciferolMcg,
  Value<double?> vitaminDIuIu,
  Value<double?> vitaminKMcg,
  Value<double?> dihydrophylloquinoneMcg,
  Value<double?> menaquinone4Mcg,
  Value<double?> fattyAcidsTotalMonounsaturatedMg,
  Value<double?> fattyAcidsTotalPolyunsaturatedMg,
  Value<double?> u183N3CCCAlaMg,
  Value<double?> u205N3EpaMg,
  Value<double?> u225N3DpaMg,
  Value<double?> u226N3DhaMg,
  Value<double?> tryptophanMg,
  Value<double?> threonineMg,
  Value<double?> isoleucineMg,
  Value<double?> leucineMg,
  Value<double?> lysineMg,
  Value<double?> methionineMg,
  Value<double?> cystineMg,
  Value<double?> phenylalanineMg,
  Value<double?> tyrosineMg,
  Value<double?> valineMg,
  Value<double?> arginineMg,
  Value<double?> histidineMg,
  Value<double?> alanineMg,
  Value<double?> asparticAcidMg,
  Value<double?> glutamicAcidMg,
  Value<double?> glycineMg,
  Value<double?> prolineMg,
  Value<double?> serineMg,
  Value<double?> hydroxyprolineMg,
  Value<double?> alcoholG,
  Value<double?> caffeineMg,
  Value<double?> theobromineMg,
  Value<double?> servingWeight1G,
  Value<String?> servingDescription1G,
  Value<double?> servingWeight2G,
  Value<String?> servingDescription2G,
  Value<double?> servingWeight3G,
  Value<String?> servingDescription3G,
  Value<double?> servingWeight4G,
  Value<String?> servingDescription4G,
  Value<double?> servingWeight5G,
  Value<String?> servingDescription5G,
  Value<double?> servingWeight6G,
  Value<String?> servingDescription6G,
  Value<double?> servingWeight7G,
  Value<String?> servingDescription7G,
  Value<double?> servingWeight8G,
  Value<String?> servingDescription8G,
  Value<double?> servingWeight9G,
  Value<String?> servingDescription9G,
  Value<double?> u200calorieWeightG,
});

class $$FoodsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FoodsTable,
    Food,
    $$FoodsTableFilterComposer,
    $$FoodsTableOrderingComposer,
    $$FoodsTableProcessedTableManager,
    $$FoodsTableInsertCompanionBuilder,
    $$FoodsTableUpdateCompanionBuilder> {
  $$FoodsTableTableManager(_$AppDatabase db, $FoodsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FoodsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FoodsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$FoodsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> foodGroup = const Value.absent(),
            Value<double?> calories = const Value.absent(),
            Value<double?> fatG = const Value.absent(),
            Value<double?> proteinG = const Value.absent(),
            Value<double?> carbohydrateG = const Value.absent(),
            Value<double?> sugarsG = const Value.absent(),
            Value<double?> fiberG = const Value.absent(),
            Value<double?> cholesterolMg = const Value.absent(),
            Value<double?> saturatedFatsG = const Value.absent(),
            Value<double?> calciumMg = const Value.absent(),
            Value<double?> ironFeMg = const Value.absent(),
            Value<double?> potassiumKMg = const Value.absent(),
            Value<double?> magnesiumMg = const Value.absent(),
            Value<double?> vitaminAIuIu = const Value.absent(),
            Value<double?> vitaminARaeMcg = const Value.absent(),
            Value<double?> vitaminCMg = const Value.absent(),
            Value<double?> vitaminB12Mcg = const Value.absent(),
            Value<double?> vitaminDMcg = const Value.absent(),
            Value<double?> vitaminEAlphaTocopherolMg = const Value.absent(),
            Value<double?> addedSugarG = const Value.absent(),
            Value<double?> netCarbsG = const Value.absent(),
            Value<double?> waterG = const Value.absent(),
            Value<double?> omega3sMg = const Value.absent(),
            Value<double?> omega6sMg = const Value.absent(),
            Value<double?> pralScore = const Value.absent(),
            Value<double?> transFattyAcidsG = const Value.absent(),
            Value<double?> solubleFiberG = const Value.absent(),
            Value<double?> insolubleFiberG = const Value.absent(),
            Value<double?> sucroseG = const Value.absent(),
            Value<double?> glucoseDextroseG = const Value.absent(),
            Value<double?> fructoseG = const Value.absent(),
            Value<double?> lactoseG = const Value.absent(),
            Value<double?> maltoseG = const Value.absent(),
            Value<double?> galactoseG = const Value.absent(),
            Value<double?> starchG = const Value.absent(),
            Value<double?> totalSugarAlcoholsG = const Value.absent(),
            Value<double?> phosphorusPMg = const Value.absent(),
            Value<double?> sodiumMg = const Value.absent(),
            Value<double?> zincZnMg = const Value.absent(),
            Value<double?> copperCuMg = const Value.absent(),
            Value<double?> manganeseMg = const Value.absent(),
            Value<double?> seleniumSeMcg = const Value.absent(),
            Value<double?> fluorideFMcg = const Value.absent(),
            Value<double?> molybdenumMcg = const Value.absent(),
            Value<double?> chlorineMg = const Value.absent(),
            Value<double?> thiaminB1Mg = const Value.absent(),
            Value<double?> riboflavinB2Mg = const Value.absent(),
            Value<double?> niacinB3Mg = const Value.absent(),
            Value<double?> pantothenicAcidB5Mg = const Value.absent(),
            Value<double?> vitaminB6Mg = const Value.absent(),
            Value<double?> biotinB7Mcg = const Value.absent(),
            Value<double?> folateB9Mcg = const Value.absent(),
            Value<double?> folicAcidMcg = const Value.absent(),
            Value<double?> foodFolateMcg = const Value.absent(),
            Value<double?> folateDfeMcg = const Value.absent(),
            Value<double?> cholineMg = const Value.absent(),
            Value<double?> betaineMg = const Value.absent(),
            Value<double?> retinolMcg = const Value.absent(),
            Value<double?> caroteneBetaMcg = const Value.absent(),
            Value<double?> caroteneAlphaMcg = const Value.absent(),
            Value<double?> lycopeneMcg = const Value.absent(),
            Value<double?> luteinZeaxanthinMcg = const Value.absent(),
            Value<double?> vitaminD2ErgocalciferolMcg = const Value.absent(),
            Value<double?> vitaminD3CholecalciferolMcg = const Value.absent(),
            Value<double?> vitaminDIuIu = const Value.absent(),
            Value<double?> vitaminKMcg = const Value.absent(),
            Value<double?> dihydrophylloquinoneMcg = const Value.absent(),
            Value<double?> menaquinone4Mcg = const Value.absent(),
            Value<double?> fattyAcidsTotalMonounsaturatedMg =
                const Value.absent(),
            Value<double?> fattyAcidsTotalPolyunsaturatedMg =
                const Value.absent(),
            Value<double?> u183N3CCCAlaMg = const Value.absent(),
            Value<double?> u205N3EpaMg = const Value.absent(),
            Value<double?> u225N3DpaMg = const Value.absent(),
            Value<double?> u226N3DhaMg = const Value.absent(),
            Value<double?> tryptophanMg = const Value.absent(),
            Value<double?> threonineMg = const Value.absent(),
            Value<double?> isoleucineMg = const Value.absent(),
            Value<double?> leucineMg = const Value.absent(),
            Value<double?> lysineMg = const Value.absent(),
            Value<double?> methionineMg = const Value.absent(),
            Value<double?> cystineMg = const Value.absent(),
            Value<double?> phenylalanineMg = const Value.absent(),
            Value<double?> tyrosineMg = const Value.absent(),
            Value<double?> valineMg = const Value.absent(),
            Value<double?> arginineMg = const Value.absent(),
            Value<double?> histidineMg = const Value.absent(),
            Value<double?> alanineMg = const Value.absent(),
            Value<double?> asparticAcidMg = const Value.absent(),
            Value<double?> glutamicAcidMg = const Value.absent(),
            Value<double?> glycineMg = const Value.absent(),
            Value<double?> prolineMg = const Value.absent(),
            Value<double?> serineMg = const Value.absent(),
            Value<double?> hydroxyprolineMg = const Value.absent(),
            Value<double?> alcoholG = const Value.absent(),
            Value<double?> caffeineMg = const Value.absent(),
            Value<double?> theobromineMg = const Value.absent(),
            Value<double?> servingWeight1G = const Value.absent(),
            Value<String?> servingDescription1G = const Value.absent(),
            Value<double?> servingWeight2G = const Value.absent(),
            Value<String?> servingDescription2G = const Value.absent(),
            Value<double?> servingWeight3G = const Value.absent(),
            Value<String?> servingDescription3G = const Value.absent(),
            Value<double?> servingWeight4G = const Value.absent(),
            Value<String?> servingDescription4G = const Value.absent(),
            Value<double?> servingWeight5G = const Value.absent(),
            Value<String?> servingDescription5G = const Value.absent(),
            Value<double?> servingWeight6G = const Value.absent(),
            Value<String?> servingDescription6G = const Value.absent(),
            Value<double?> servingWeight7G = const Value.absent(),
            Value<String?> servingDescription7G = const Value.absent(),
            Value<double?> servingWeight8G = const Value.absent(),
            Value<String?> servingDescription8G = const Value.absent(),
            Value<double?> servingWeight9G = const Value.absent(),
            Value<String?> servingDescription9G = const Value.absent(),
            Value<double?> u200calorieWeightG = const Value.absent(),
          }) =>
              FoodsCompanion(
            id: id,
            name: name,
            foodGroup: foodGroup,
            calories: calories,
            fatG: fatG,
            proteinG: proteinG,
            carbohydrateG: carbohydrateG,
            sugarsG: sugarsG,
            fiberG: fiberG,
            cholesterolMg: cholesterolMg,
            saturatedFatsG: saturatedFatsG,
            calciumMg: calciumMg,
            ironFeMg: ironFeMg,
            potassiumKMg: potassiumKMg,
            magnesiumMg: magnesiumMg,
            vitaminAIuIu: vitaminAIuIu,
            vitaminARaeMcg: vitaminARaeMcg,
            vitaminCMg: vitaminCMg,
            vitaminB12Mcg: vitaminB12Mcg,
            vitaminDMcg: vitaminDMcg,
            vitaminEAlphaTocopherolMg: vitaminEAlphaTocopherolMg,
            addedSugarG: addedSugarG,
            netCarbsG: netCarbsG,
            waterG: waterG,
            omega3sMg: omega3sMg,
            omega6sMg: omega6sMg,
            pralScore: pralScore,
            transFattyAcidsG: transFattyAcidsG,
            solubleFiberG: solubleFiberG,
            insolubleFiberG: insolubleFiberG,
            sucroseG: sucroseG,
            glucoseDextroseG: glucoseDextroseG,
            fructoseG: fructoseG,
            lactoseG: lactoseG,
            maltoseG: maltoseG,
            galactoseG: galactoseG,
            starchG: starchG,
            totalSugarAlcoholsG: totalSugarAlcoholsG,
            phosphorusPMg: phosphorusPMg,
            sodiumMg: sodiumMg,
            zincZnMg: zincZnMg,
            copperCuMg: copperCuMg,
            manganeseMg: manganeseMg,
            seleniumSeMcg: seleniumSeMcg,
            fluorideFMcg: fluorideFMcg,
            molybdenumMcg: molybdenumMcg,
            chlorineMg: chlorineMg,
            thiaminB1Mg: thiaminB1Mg,
            riboflavinB2Mg: riboflavinB2Mg,
            niacinB3Mg: niacinB3Mg,
            pantothenicAcidB5Mg: pantothenicAcidB5Mg,
            vitaminB6Mg: vitaminB6Mg,
            biotinB7Mcg: biotinB7Mcg,
            folateB9Mcg: folateB9Mcg,
            folicAcidMcg: folicAcidMcg,
            foodFolateMcg: foodFolateMcg,
            folateDfeMcg: folateDfeMcg,
            cholineMg: cholineMg,
            betaineMg: betaineMg,
            retinolMcg: retinolMcg,
            caroteneBetaMcg: caroteneBetaMcg,
            caroteneAlphaMcg: caroteneAlphaMcg,
            lycopeneMcg: lycopeneMcg,
            luteinZeaxanthinMcg: luteinZeaxanthinMcg,
            vitaminD2ErgocalciferolMcg: vitaminD2ErgocalciferolMcg,
            vitaminD3CholecalciferolMcg: vitaminD3CholecalciferolMcg,
            vitaminDIuIu: vitaminDIuIu,
            vitaminKMcg: vitaminKMcg,
            dihydrophylloquinoneMcg: dihydrophylloquinoneMcg,
            menaquinone4Mcg: menaquinone4Mcg,
            fattyAcidsTotalMonounsaturatedMg: fattyAcidsTotalMonounsaturatedMg,
            fattyAcidsTotalPolyunsaturatedMg: fattyAcidsTotalPolyunsaturatedMg,
            u183N3CCCAlaMg: u183N3CCCAlaMg,
            u205N3EpaMg: u205N3EpaMg,
            u225N3DpaMg: u225N3DpaMg,
            u226N3DhaMg: u226N3DhaMg,
            tryptophanMg: tryptophanMg,
            threonineMg: threonineMg,
            isoleucineMg: isoleucineMg,
            leucineMg: leucineMg,
            lysineMg: lysineMg,
            methionineMg: methionineMg,
            cystineMg: cystineMg,
            phenylalanineMg: phenylalanineMg,
            tyrosineMg: tyrosineMg,
            valineMg: valineMg,
            arginineMg: arginineMg,
            histidineMg: histidineMg,
            alanineMg: alanineMg,
            asparticAcidMg: asparticAcidMg,
            glutamicAcidMg: glutamicAcidMg,
            glycineMg: glycineMg,
            prolineMg: prolineMg,
            serineMg: serineMg,
            hydroxyprolineMg: hydroxyprolineMg,
            alcoholG: alcoholG,
            caffeineMg: caffeineMg,
            theobromineMg: theobromineMg,
            servingWeight1G: servingWeight1G,
            servingDescription1G: servingDescription1G,
            servingWeight2G: servingWeight2G,
            servingDescription2G: servingDescription2G,
            servingWeight3G: servingWeight3G,
            servingDescription3G: servingDescription3G,
            servingWeight4G: servingWeight4G,
            servingDescription4G: servingDescription4G,
            servingWeight5G: servingWeight5G,
            servingDescription5G: servingDescription5G,
            servingWeight6G: servingWeight6G,
            servingDescription6G: servingDescription6G,
            servingWeight7G: servingWeight7G,
            servingDescription7G: servingDescription7G,
            servingWeight8G: servingWeight8G,
            servingDescription8G: servingDescription8G,
            servingWeight9G: servingWeight9G,
            servingDescription9G: servingDescription9G,
            u200calorieWeightG: u200calorieWeightG,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> foodGroup = const Value.absent(),
            Value<double?> calories = const Value.absent(),
            Value<double?> fatG = const Value.absent(),
            Value<double?> proteinG = const Value.absent(),
            Value<double?> carbohydrateG = const Value.absent(),
            Value<double?> sugarsG = const Value.absent(),
            Value<double?> fiberG = const Value.absent(),
            Value<double?> cholesterolMg = const Value.absent(),
            Value<double?> saturatedFatsG = const Value.absent(),
            Value<double?> calciumMg = const Value.absent(),
            Value<double?> ironFeMg = const Value.absent(),
            Value<double?> potassiumKMg = const Value.absent(),
            Value<double?> magnesiumMg = const Value.absent(),
            Value<double?> vitaminAIuIu = const Value.absent(),
            Value<double?> vitaminARaeMcg = const Value.absent(),
            Value<double?> vitaminCMg = const Value.absent(),
            Value<double?> vitaminB12Mcg = const Value.absent(),
            Value<double?> vitaminDMcg = const Value.absent(),
            Value<double?> vitaminEAlphaTocopherolMg = const Value.absent(),
            Value<double?> addedSugarG = const Value.absent(),
            Value<double?> netCarbsG = const Value.absent(),
            Value<double?> waterG = const Value.absent(),
            Value<double?> omega3sMg = const Value.absent(),
            Value<double?> omega6sMg = const Value.absent(),
            Value<double?> pralScore = const Value.absent(),
            Value<double?> transFattyAcidsG = const Value.absent(),
            Value<double?> solubleFiberG = const Value.absent(),
            Value<double?> insolubleFiberG = const Value.absent(),
            Value<double?> sucroseG = const Value.absent(),
            Value<double?> glucoseDextroseG = const Value.absent(),
            Value<double?> fructoseG = const Value.absent(),
            Value<double?> lactoseG = const Value.absent(),
            Value<double?> maltoseG = const Value.absent(),
            Value<double?> galactoseG = const Value.absent(),
            Value<double?> starchG = const Value.absent(),
            Value<double?> totalSugarAlcoholsG = const Value.absent(),
            Value<double?> phosphorusPMg = const Value.absent(),
            Value<double?> sodiumMg = const Value.absent(),
            Value<double?> zincZnMg = const Value.absent(),
            Value<double?> copperCuMg = const Value.absent(),
            Value<double?> manganeseMg = const Value.absent(),
            Value<double?> seleniumSeMcg = const Value.absent(),
            Value<double?> fluorideFMcg = const Value.absent(),
            Value<double?> molybdenumMcg = const Value.absent(),
            Value<double?> chlorineMg = const Value.absent(),
            Value<double?> thiaminB1Mg = const Value.absent(),
            Value<double?> riboflavinB2Mg = const Value.absent(),
            Value<double?> niacinB3Mg = const Value.absent(),
            Value<double?> pantothenicAcidB5Mg = const Value.absent(),
            Value<double?> vitaminB6Mg = const Value.absent(),
            Value<double?> biotinB7Mcg = const Value.absent(),
            Value<double?> folateB9Mcg = const Value.absent(),
            Value<double?> folicAcidMcg = const Value.absent(),
            Value<double?> foodFolateMcg = const Value.absent(),
            Value<double?> folateDfeMcg = const Value.absent(),
            Value<double?> cholineMg = const Value.absent(),
            Value<double?> betaineMg = const Value.absent(),
            Value<double?> retinolMcg = const Value.absent(),
            Value<double?> caroteneBetaMcg = const Value.absent(),
            Value<double?> caroteneAlphaMcg = const Value.absent(),
            Value<double?> lycopeneMcg = const Value.absent(),
            Value<double?> luteinZeaxanthinMcg = const Value.absent(),
            Value<double?> vitaminD2ErgocalciferolMcg = const Value.absent(),
            Value<double?> vitaminD3CholecalciferolMcg = const Value.absent(),
            Value<double?> vitaminDIuIu = const Value.absent(),
            Value<double?> vitaminKMcg = const Value.absent(),
            Value<double?> dihydrophylloquinoneMcg = const Value.absent(),
            Value<double?> menaquinone4Mcg = const Value.absent(),
            Value<double?> fattyAcidsTotalMonounsaturatedMg =
                const Value.absent(),
            Value<double?> fattyAcidsTotalPolyunsaturatedMg =
                const Value.absent(),
            Value<double?> u183N3CCCAlaMg = const Value.absent(),
            Value<double?> u205N3EpaMg = const Value.absent(),
            Value<double?> u225N3DpaMg = const Value.absent(),
            Value<double?> u226N3DhaMg = const Value.absent(),
            Value<double?> tryptophanMg = const Value.absent(),
            Value<double?> threonineMg = const Value.absent(),
            Value<double?> isoleucineMg = const Value.absent(),
            Value<double?> leucineMg = const Value.absent(),
            Value<double?> lysineMg = const Value.absent(),
            Value<double?> methionineMg = const Value.absent(),
            Value<double?> cystineMg = const Value.absent(),
            Value<double?> phenylalanineMg = const Value.absent(),
            Value<double?> tyrosineMg = const Value.absent(),
            Value<double?> valineMg = const Value.absent(),
            Value<double?> arginineMg = const Value.absent(),
            Value<double?> histidineMg = const Value.absent(),
            Value<double?> alanineMg = const Value.absent(),
            Value<double?> asparticAcidMg = const Value.absent(),
            Value<double?> glutamicAcidMg = const Value.absent(),
            Value<double?> glycineMg = const Value.absent(),
            Value<double?> prolineMg = const Value.absent(),
            Value<double?> serineMg = const Value.absent(),
            Value<double?> hydroxyprolineMg = const Value.absent(),
            Value<double?> alcoholG = const Value.absent(),
            Value<double?> caffeineMg = const Value.absent(),
            Value<double?> theobromineMg = const Value.absent(),
            Value<double?> servingWeight1G = const Value.absent(),
            Value<String?> servingDescription1G = const Value.absent(),
            Value<double?> servingWeight2G = const Value.absent(),
            Value<String?> servingDescription2G = const Value.absent(),
            Value<double?> servingWeight3G = const Value.absent(),
            Value<String?> servingDescription3G = const Value.absent(),
            Value<double?> servingWeight4G = const Value.absent(),
            Value<String?> servingDescription4G = const Value.absent(),
            Value<double?> servingWeight5G = const Value.absent(),
            Value<String?> servingDescription5G = const Value.absent(),
            Value<double?> servingWeight6G = const Value.absent(),
            Value<String?> servingDescription6G = const Value.absent(),
            Value<double?> servingWeight7G = const Value.absent(),
            Value<String?> servingDescription7G = const Value.absent(),
            Value<double?> servingWeight8G = const Value.absent(),
            Value<String?> servingDescription8G = const Value.absent(),
            Value<double?> servingWeight9G = const Value.absent(),
            Value<String?> servingDescription9G = const Value.absent(),
            Value<double?> u200calorieWeightG = const Value.absent(),
          }) =>
              FoodsCompanion.insert(
            id: id,
            name: name,
            foodGroup: foodGroup,
            calories: calories,
            fatG: fatG,
            proteinG: proteinG,
            carbohydrateG: carbohydrateG,
            sugarsG: sugarsG,
            fiberG: fiberG,
            cholesterolMg: cholesterolMg,
            saturatedFatsG: saturatedFatsG,
            calciumMg: calciumMg,
            ironFeMg: ironFeMg,
            potassiumKMg: potassiumKMg,
            magnesiumMg: magnesiumMg,
            vitaminAIuIu: vitaminAIuIu,
            vitaminARaeMcg: vitaminARaeMcg,
            vitaminCMg: vitaminCMg,
            vitaminB12Mcg: vitaminB12Mcg,
            vitaminDMcg: vitaminDMcg,
            vitaminEAlphaTocopherolMg: vitaminEAlphaTocopherolMg,
            addedSugarG: addedSugarG,
            netCarbsG: netCarbsG,
            waterG: waterG,
            omega3sMg: omega3sMg,
            omega6sMg: omega6sMg,
            pralScore: pralScore,
            transFattyAcidsG: transFattyAcidsG,
            solubleFiberG: solubleFiberG,
            insolubleFiberG: insolubleFiberG,
            sucroseG: sucroseG,
            glucoseDextroseG: glucoseDextroseG,
            fructoseG: fructoseG,
            lactoseG: lactoseG,
            maltoseG: maltoseG,
            galactoseG: galactoseG,
            starchG: starchG,
            totalSugarAlcoholsG: totalSugarAlcoholsG,
            phosphorusPMg: phosphorusPMg,
            sodiumMg: sodiumMg,
            zincZnMg: zincZnMg,
            copperCuMg: copperCuMg,
            manganeseMg: manganeseMg,
            seleniumSeMcg: seleniumSeMcg,
            fluorideFMcg: fluorideFMcg,
            molybdenumMcg: molybdenumMcg,
            chlorineMg: chlorineMg,
            thiaminB1Mg: thiaminB1Mg,
            riboflavinB2Mg: riboflavinB2Mg,
            niacinB3Mg: niacinB3Mg,
            pantothenicAcidB5Mg: pantothenicAcidB5Mg,
            vitaminB6Mg: vitaminB6Mg,
            biotinB7Mcg: biotinB7Mcg,
            folateB9Mcg: folateB9Mcg,
            folicAcidMcg: folicAcidMcg,
            foodFolateMcg: foodFolateMcg,
            folateDfeMcg: folateDfeMcg,
            cholineMg: cholineMg,
            betaineMg: betaineMg,
            retinolMcg: retinolMcg,
            caroteneBetaMcg: caroteneBetaMcg,
            caroteneAlphaMcg: caroteneAlphaMcg,
            lycopeneMcg: lycopeneMcg,
            luteinZeaxanthinMcg: luteinZeaxanthinMcg,
            vitaminD2ErgocalciferolMcg: vitaminD2ErgocalciferolMcg,
            vitaminD3CholecalciferolMcg: vitaminD3CholecalciferolMcg,
            vitaminDIuIu: vitaminDIuIu,
            vitaminKMcg: vitaminKMcg,
            dihydrophylloquinoneMcg: dihydrophylloquinoneMcg,
            menaquinone4Mcg: menaquinone4Mcg,
            fattyAcidsTotalMonounsaturatedMg: fattyAcidsTotalMonounsaturatedMg,
            fattyAcidsTotalPolyunsaturatedMg: fattyAcidsTotalPolyunsaturatedMg,
            u183N3CCCAlaMg: u183N3CCCAlaMg,
            u205N3EpaMg: u205N3EpaMg,
            u225N3DpaMg: u225N3DpaMg,
            u226N3DhaMg: u226N3DhaMg,
            tryptophanMg: tryptophanMg,
            threonineMg: threonineMg,
            isoleucineMg: isoleucineMg,
            leucineMg: leucineMg,
            lysineMg: lysineMg,
            methionineMg: methionineMg,
            cystineMg: cystineMg,
            phenylalanineMg: phenylalanineMg,
            tyrosineMg: tyrosineMg,
            valineMg: valineMg,
            arginineMg: arginineMg,
            histidineMg: histidineMg,
            alanineMg: alanineMg,
            asparticAcidMg: asparticAcidMg,
            glutamicAcidMg: glutamicAcidMg,
            glycineMg: glycineMg,
            prolineMg: prolineMg,
            serineMg: serineMg,
            hydroxyprolineMg: hydroxyprolineMg,
            alcoholG: alcoholG,
            caffeineMg: caffeineMg,
            theobromineMg: theobromineMg,
            servingWeight1G: servingWeight1G,
            servingDescription1G: servingDescription1G,
            servingWeight2G: servingWeight2G,
            servingDescription2G: servingDescription2G,
            servingWeight3G: servingWeight3G,
            servingDescription3G: servingDescription3G,
            servingWeight4G: servingWeight4G,
            servingDescription4G: servingDescription4G,
            servingWeight5G: servingWeight5G,
            servingDescription5G: servingDescription5G,
            servingWeight6G: servingWeight6G,
            servingDescription6G: servingDescription6G,
            servingWeight7G: servingWeight7G,
            servingDescription7G: servingDescription7G,
            servingWeight8G: servingWeight8G,
            servingDescription8G: servingDescription8G,
            servingWeight9G: servingWeight9G,
            servingDescription9G: servingDescription9G,
            u200calorieWeightG: u200calorieWeightG,
          ),
        ));
}

class $$FoodsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $FoodsTable,
    Food,
    $$FoodsTableFilterComposer,
    $$FoodsTableOrderingComposer,
    $$FoodsTableProcessedTableManager,
    $$FoodsTableInsertCompanionBuilder,
    $$FoodsTableUpdateCompanionBuilder> {
  $$FoodsTableProcessedTableManager(super.$state);
}

class $$FoodsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FoodsTable> {
  $$FoodsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get foodGroup => $state.composableBuilder(
      column: $state.table.foodGroup,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get calories => $state.composableBuilder(
      column: $state.table.calories,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fatG => $state.composableBuilder(
      column: $state.table.fatG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get proteinG => $state.composableBuilder(
      column: $state.table.proteinG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get carbohydrateG => $state.composableBuilder(
      column: $state.table.carbohydrateG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sugarsG => $state.composableBuilder(
      column: $state.table.sugarsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fiberG => $state.composableBuilder(
      column: $state.table.fiberG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get cholesterolMg => $state.composableBuilder(
      column: $state.table.cholesterolMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get saturatedFatsG => $state.composableBuilder(
      column: $state.table.saturatedFatsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get calciumMg => $state.composableBuilder(
      column: $state.table.calciumMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ironFeMg => $state.composableBuilder(
      column: $state.table.ironFeMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get potassiumKMg => $state.composableBuilder(
      column: $state.table.potassiumKMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get magnesiumMg => $state.composableBuilder(
      column: $state.table.magnesiumMg,
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

  ColumnFilters<double> get vitaminCMg => $state.composableBuilder(
      column: $state.table.vitaminCMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminB12Mcg => $state.composableBuilder(
      column: $state.table.vitaminB12Mcg,
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

  ColumnFilters<double> get addedSugarG => $state.composableBuilder(
      column: $state.table.addedSugarG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get netCarbsG => $state.composableBuilder(
      column: $state.table.netCarbsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get waterG => $state.composableBuilder(
      column: $state.table.waterG,
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

  ColumnFilters<double> get pralScore => $state.composableBuilder(
      column: $state.table.pralScore,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get transFattyAcidsG => $state.composableBuilder(
      column: $state.table.transFattyAcidsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get solubleFiberG => $state.composableBuilder(
      column: $state.table.solubleFiberG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get insolubleFiberG => $state.composableBuilder(
      column: $state.table.insolubleFiberG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sucroseG => $state.composableBuilder(
      column: $state.table.sucroseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get glucoseDextroseG => $state.composableBuilder(
      column: $state.table.glucoseDextroseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fructoseG => $state.composableBuilder(
      column: $state.table.fructoseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lactoseG => $state.composableBuilder(
      column: $state.table.lactoseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get maltoseG => $state.composableBuilder(
      column: $state.table.maltoseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get galactoseG => $state.composableBuilder(
      column: $state.table.galactoseG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get starchG => $state.composableBuilder(
      column: $state.table.starchG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalSugarAlcoholsG => $state.composableBuilder(
      column: $state.table.totalSugarAlcoholsG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get phosphorusPMg => $state.composableBuilder(
      column: $state.table.phosphorusPMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sodiumMg => $state.composableBuilder(
      column: $state.table.sodiumMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get zincZnMg => $state.composableBuilder(
      column: $state.table.zincZnMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get copperCuMg => $state.composableBuilder(
      column: $state.table.copperCuMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get manganeseMg => $state.composableBuilder(
      column: $state.table.manganeseMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get seleniumSeMcg => $state.composableBuilder(
      column: $state.table.seleniumSeMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fluorideFMcg => $state.composableBuilder(
      column: $state.table.fluorideFMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get molybdenumMcg => $state.composableBuilder(
      column: $state.table.molybdenumMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get chlorineMg => $state.composableBuilder(
      column: $state.table.chlorineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get thiaminB1Mg => $state.composableBuilder(
      column: $state.table.thiaminB1Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get riboflavinB2Mg => $state.composableBuilder(
      column: $state.table.riboflavinB2Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get niacinB3Mg => $state.composableBuilder(
      column: $state.table.niacinB3Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get pantothenicAcidB5Mg => $state.composableBuilder(
      column: $state.table.pantothenicAcidB5Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vitaminB6Mg => $state.composableBuilder(
      column: $state.table.vitaminB6Mg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get biotinB7Mcg => $state.composableBuilder(
      column: $state.table.biotinB7Mcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get folateB9Mcg => $state.composableBuilder(
      column: $state.table.folateB9Mcg,
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

  ColumnFilters<double> get folateDfeMcg => $state.composableBuilder(
      column: $state.table.folateDfeMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get cholineMg => $state.composableBuilder(
      column: $state.table.cholineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get betaineMg => $state.composableBuilder(
      column: $state.table.betaineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get retinolMcg => $state.composableBuilder(
      column: $state.table.retinolMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get caroteneBetaMcg => $state.composableBuilder(
      column: $state.table.caroteneBetaMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get caroteneAlphaMcg => $state.composableBuilder(
      column: $state.table.caroteneAlphaMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lycopeneMcg => $state.composableBuilder(
      column: $state.table.lycopeneMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get luteinZeaxanthinMcg => $state.composableBuilder(
      column: $state.table.luteinZeaxanthinMcg,
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

  ColumnFilters<double> get vitaminKMcg => $state.composableBuilder(
      column: $state.table.vitaminKMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get dihydrophylloquinoneMcg => $state.composableBuilder(
      column: $state.table.dihydrophylloquinoneMcg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get menaquinone4Mcg => $state.composableBuilder(
      column: $state.table.menaquinone4Mcg,
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

  ColumnFilters<double> get u183N3CCCAlaMg => $state.composableBuilder(
      column: $state.table.u183N3CCCAlaMg,
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

  ColumnFilters<double> get tryptophanMg => $state.composableBuilder(
      column: $state.table.tryptophanMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get threonineMg => $state.composableBuilder(
      column: $state.table.threonineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get isoleucineMg => $state.composableBuilder(
      column: $state.table.isoleucineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get leucineMg => $state.composableBuilder(
      column: $state.table.leucineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lysineMg => $state.composableBuilder(
      column: $state.table.lysineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get methionineMg => $state.composableBuilder(
      column: $state.table.methionineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get cystineMg => $state.composableBuilder(
      column: $state.table.cystineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get phenylalanineMg => $state.composableBuilder(
      column: $state.table.phenylalanineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get tyrosineMg => $state.composableBuilder(
      column: $state.table.tyrosineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get valineMg => $state.composableBuilder(
      column: $state.table.valineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get arginineMg => $state.composableBuilder(
      column: $state.table.arginineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get histidineMg => $state.composableBuilder(
      column: $state.table.histidineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get alanineMg => $state.composableBuilder(
      column: $state.table.alanineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get asparticAcidMg => $state.composableBuilder(
      column: $state.table.asparticAcidMg,
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

  ColumnFilters<double> get prolineMg => $state.composableBuilder(
      column: $state.table.prolineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get serineMg => $state.composableBuilder(
      column: $state.table.serineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get hydroxyprolineMg => $state.composableBuilder(
      column: $state.table.hydroxyprolineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get alcoholG => $state.composableBuilder(
      column: $state.table.alcoholG,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get caffeineMg => $state.composableBuilder(
      column: $state.table.caffeineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get theobromineMg => $state.composableBuilder(
      column: $state.table.theobromineMg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight1G => $state.composableBuilder(
      column: $state.table.servingWeight1G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription1G => $state.composableBuilder(
      column: $state.table.servingDescription1G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight2G => $state.composableBuilder(
      column: $state.table.servingWeight2G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription2G => $state.composableBuilder(
      column: $state.table.servingDescription2G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight3G => $state.composableBuilder(
      column: $state.table.servingWeight3G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription3G => $state.composableBuilder(
      column: $state.table.servingDescription3G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight4G => $state.composableBuilder(
      column: $state.table.servingWeight4G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription4G => $state.composableBuilder(
      column: $state.table.servingDescription4G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight5G => $state.composableBuilder(
      column: $state.table.servingWeight5G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription5G => $state.composableBuilder(
      column: $state.table.servingDescription5G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight6G => $state.composableBuilder(
      column: $state.table.servingWeight6G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription6G => $state.composableBuilder(
      column: $state.table.servingDescription6G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight7G => $state.composableBuilder(
      column: $state.table.servingWeight7G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription7G => $state.composableBuilder(
      column: $state.table.servingDescription7G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight8G => $state.composableBuilder(
      column: $state.table.servingWeight8G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription8G => $state.composableBuilder(
      column: $state.table.servingDescription8G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get servingWeight9G => $state.composableBuilder(
      column: $state.table.servingWeight9G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get servingDescription9G => $state.composableBuilder(
      column: $state.table.servingDescription9G,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get u200calorieWeightG => $state.composableBuilder(
      column: $state.table.u200calorieWeightG,
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
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get foodGroup => $state.composableBuilder(
      column: $state.table.foodGroup,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get calories => $state.composableBuilder(
      column: $state.table.calories,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fatG => $state.composableBuilder(
      column: $state.table.fatG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get proteinG => $state.composableBuilder(
      column: $state.table.proteinG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get carbohydrateG => $state.composableBuilder(
      column: $state.table.carbohydrateG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sugarsG => $state.composableBuilder(
      column: $state.table.sugarsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fiberG => $state.composableBuilder(
      column: $state.table.fiberG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get cholesterolMg => $state.composableBuilder(
      column: $state.table.cholesterolMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get saturatedFatsG => $state.composableBuilder(
      column: $state.table.saturatedFatsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get calciumMg => $state.composableBuilder(
      column: $state.table.calciumMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ironFeMg => $state.composableBuilder(
      column: $state.table.ironFeMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get potassiumKMg => $state.composableBuilder(
      column: $state.table.potassiumKMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get magnesiumMg => $state.composableBuilder(
      column: $state.table.magnesiumMg,
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

  ColumnOrderings<double> get vitaminCMg => $state.composableBuilder(
      column: $state.table.vitaminCMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminB12Mcg => $state.composableBuilder(
      column: $state.table.vitaminB12Mcg,
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

  ColumnOrderings<double> get addedSugarG => $state.composableBuilder(
      column: $state.table.addedSugarG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get netCarbsG => $state.composableBuilder(
      column: $state.table.netCarbsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get waterG => $state.composableBuilder(
      column: $state.table.waterG,
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

  ColumnOrderings<double> get pralScore => $state.composableBuilder(
      column: $state.table.pralScore,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get transFattyAcidsG => $state.composableBuilder(
      column: $state.table.transFattyAcidsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get solubleFiberG => $state.composableBuilder(
      column: $state.table.solubleFiberG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get insolubleFiberG => $state.composableBuilder(
      column: $state.table.insolubleFiberG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sucroseG => $state.composableBuilder(
      column: $state.table.sucroseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get glucoseDextroseG => $state.composableBuilder(
      column: $state.table.glucoseDextroseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fructoseG => $state.composableBuilder(
      column: $state.table.fructoseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lactoseG => $state.composableBuilder(
      column: $state.table.lactoseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get maltoseG => $state.composableBuilder(
      column: $state.table.maltoseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get galactoseG => $state.composableBuilder(
      column: $state.table.galactoseG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get starchG => $state.composableBuilder(
      column: $state.table.starchG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalSugarAlcoholsG => $state.composableBuilder(
      column: $state.table.totalSugarAlcoholsG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get phosphorusPMg => $state.composableBuilder(
      column: $state.table.phosphorusPMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sodiumMg => $state.composableBuilder(
      column: $state.table.sodiumMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get zincZnMg => $state.composableBuilder(
      column: $state.table.zincZnMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get copperCuMg => $state.composableBuilder(
      column: $state.table.copperCuMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get manganeseMg => $state.composableBuilder(
      column: $state.table.manganeseMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get seleniumSeMcg => $state.composableBuilder(
      column: $state.table.seleniumSeMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fluorideFMcg => $state.composableBuilder(
      column: $state.table.fluorideFMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get molybdenumMcg => $state.composableBuilder(
      column: $state.table.molybdenumMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get chlorineMg => $state.composableBuilder(
      column: $state.table.chlorineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get thiaminB1Mg => $state.composableBuilder(
      column: $state.table.thiaminB1Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get riboflavinB2Mg => $state.composableBuilder(
      column: $state.table.riboflavinB2Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get niacinB3Mg => $state.composableBuilder(
      column: $state.table.niacinB3Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get pantothenicAcidB5Mg => $state.composableBuilder(
      column: $state.table.pantothenicAcidB5Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vitaminB6Mg => $state.composableBuilder(
      column: $state.table.vitaminB6Mg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get biotinB7Mcg => $state.composableBuilder(
      column: $state.table.biotinB7Mcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get folateB9Mcg => $state.composableBuilder(
      column: $state.table.folateB9Mcg,
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

  ColumnOrderings<double> get folateDfeMcg => $state.composableBuilder(
      column: $state.table.folateDfeMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get cholineMg => $state.composableBuilder(
      column: $state.table.cholineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get betaineMg => $state.composableBuilder(
      column: $state.table.betaineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get retinolMcg => $state.composableBuilder(
      column: $state.table.retinolMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get caroteneBetaMcg => $state.composableBuilder(
      column: $state.table.caroteneBetaMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get caroteneAlphaMcg => $state.composableBuilder(
      column: $state.table.caroteneAlphaMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lycopeneMcg => $state.composableBuilder(
      column: $state.table.lycopeneMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get luteinZeaxanthinMcg => $state.composableBuilder(
      column: $state.table.luteinZeaxanthinMcg,
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

  ColumnOrderings<double> get vitaminKMcg => $state.composableBuilder(
      column: $state.table.vitaminKMcg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get dihydrophylloquinoneMcg =>
      $state.composableBuilder(
          column: $state.table.dihydrophylloquinoneMcg,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get menaquinone4Mcg => $state.composableBuilder(
      column: $state.table.menaquinone4Mcg,
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

  ColumnOrderings<double> get u183N3CCCAlaMg => $state.composableBuilder(
      column: $state.table.u183N3CCCAlaMg,
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

  ColumnOrderings<double> get tryptophanMg => $state.composableBuilder(
      column: $state.table.tryptophanMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get threonineMg => $state.composableBuilder(
      column: $state.table.threonineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get isoleucineMg => $state.composableBuilder(
      column: $state.table.isoleucineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get leucineMg => $state.composableBuilder(
      column: $state.table.leucineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lysineMg => $state.composableBuilder(
      column: $state.table.lysineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get methionineMg => $state.composableBuilder(
      column: $state.table.methionineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get cystineMg => $state.composableBuilder(
      column: $state.table.cystineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get phenylalanineMg => $state.composableBuilder(
      column: $state.table.phenylalanineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get tyrosineMg => $state.composableBuilder(
      column: $state.table.tyrosineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get valineMg => $state.composableBuilder(
      column: $state.table.valineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get arginineMg => $state.composableBuilder(
      column: $state.table.arginineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get histidineMg => $state.composableBuilder(
      column: $state.table.histidineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get alanineMg => $state.composableBuilder(
      column: $state.table.alanineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get asparticAcidMg => $state.composableBuilder(
      column: $state.table.asparticAcidMg,
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

  ColumnOrderings<double> get prolineMg => $state.composableBuilder(
      column: $state.table.prolineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get serineMg => $state.composableBuilder(
      column: $state.table.serineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get hydroxyprolineMg => $state.composableBuilder(
      column: $state.table.hydroxyprolineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get alcoholG => $state.composableBuilder(
      column: $state.table.alcoholG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get caffeineMg => $state.composableBuilder(
      column: $state.table.caffeineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get theobromineMg => $state.composableBuilder(
      column: $state.table.theobromineMg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight1G => $state.composableBuilder(
      column: $state.table.servingWeight1G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription1G => $state.composableBuilder(
      column: $state.table.servingDescription1G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight2G => $state.composableBuilder(
      column: $state.table.servingWeight2G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription2G => $state.composableBuilder(
      column: $state.table.servingDescription2G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight3G => $state.composableBuilder(
      column: $state.table.servingWeight3G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription3G => $state.composableBuilder(
      column: $state.table.servingDescription3G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight4G => $state.composableBuilder(
      column: $state.table.servingWeight4G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription4G => $state.composableBuilder(
      column: $state.table.servingDescription4G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight5G => $state.composableBuilder(
      column: $state.table.servingWeight5G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription5G => $state.composableBuilder(
      column: $state.table.servingDescription5G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight6G => $state.composableBuilder(
      column: $state.table.servingWeight6G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription6G => $state.composableBuilder(
      column: $state.table.servingDescription6G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight7G => $state.composableBuilder(
      column: $state.table.servingWeight7G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription7G => $state.composableBuilder(
      column: $state.table.servingDescription7G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight8G => $state.composableBuilder(
      column: $state.table.servingWeight8G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription8G => $state.composableBuilder(
      column: $state.table.servingDescription8G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get servingWeight9G => $state.composableBuilder(
      column: $state.table.servingWeight9G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get servingDescription9G => $state.composableBuilder(
      column: $state.table.servingDescription9G,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get u200calorieWeightG => $state.composableBuilder(
      column: $state.table.u200calorieWeightG,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$EntriesTableInsertCompanionBuilder = EntriesCompanion Function({
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
    $$EntriesTableProcessedTableManager,
    $$EntriesTableInsertCompanionBuilder,
    $$EntriesTableUpdateCompanionBuilder> {
  $$EntriesTableTableManager(_$AppDatabase db, $EntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EntriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EntriesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$EntriesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
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
          getInsertCompanionBuilder: ({
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

class $$EntriesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $EntriesTable,
    Entry,
    $$EntriesTableFilterComposer,
    $$EntriesTableOrderingComposer,
    $$EntriesTableProcessedTableManager,
    $$EntriesTableInsertCompanionBuilder,
    $$EntriesTableUpdateCompanionBuilder> {
  $$EntriesTableProcessedTableManager(super.$state);
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

typedef $$WeightsTableInsertCompanionBuilder = WeightsCompanion Function({
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
    $$WeightsTableProcessedTableManager,
    $$WeightsTableInsertCompanionBuilder,
    $$WeightsTableUpdateCompanionBuilder> {
  $$WeightsTableTableManager(_$AppDatabase db, $WeightsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WeightsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WeightsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$WeightsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
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
          getInsertCompanionBuilder: ({
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

class $$WeightsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $WeightsTable,
    Weight,
    $$WeightsTableFilterComposer,
    $$WeightsTableOrderingComposer,
    $$WeightsTableProcessedTableManager,
    $$WeightsTableInsertCompanionBuilder,
    $$WeightsTableUpdateCompanionBuilder> {
  $$WeightsTableProcessedTableManager(super.$state);
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

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$FoodsTableTableManager get foods =>
      $$FoodsTableTableManager(_db, _db.foods);
  $$EntriesTableTableManager get entries =>
      $$EntriesTableTableManager(_db, _db.entries);
  $$WeightsTableTableManager get weights =>
      $$WeightsTableTableManager(_db, _db.weights);
}
