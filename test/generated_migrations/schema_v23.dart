// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
//@dart=2.12
import 'package:drift/drift.dart';

class Foods extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Foods(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<double> addedSugarG = GeneratedColumn<double>(
      'added_sugar_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> alanineMg = GeneratedColumn<double>(
      'alanine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> alcoholG = GeneratedColumn<double>(
      'alcohol_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> arginineMg = GeneratedColumn<double>(
      'arginine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> asparticAcidMg = GeneratedColumn<double>(
      'aspartic_acid_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> betaineMg = GeneratedColumn<double>(
      'betaine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<String> bigImage = GeneratedColumn<String>(
      'big_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<double> biotinB7Mcg = GeneratedColumn<double>(
      'biotin_b7_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> caffeineMg = GeneratedColumn<double>(
      'caffeine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> calciumMg = GeneratedColumn<double>(
      'calcium_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
      'calories', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> carbohydrateG = GeneratedColumn<double>(
      'carbohydrate_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> caroteneAlphaMcg = GeneratedColumn<double>(
      'carotene_alpha_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> caroteneBetaMcg = GeneratedColumn<double>(
      'carotene_beta_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> chlorineMg = GeneratedColumn<double>(
      'chlorine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> cholesterolMg = GeneratedColumn<double>(
      'cholesterol_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> cholineMg = GeneratedColumn<double>(
      'choline_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> copperCuMg = GeneratedColumn<double>(
      'copper_cu_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<double> cystineMg = GeneratedColumn<double>(
      'cystine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> dihydrophylloquinoneMcg =
      GeneratedColumn<double>('dihydrophylloquinone_mcg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> fatG = GeneratedColumn<double>(
      'fat_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> fattyAcidsTotalMonounsaturatedMg =
      GeneratedColumn<double>(
          'fatty_acids_total_monounsaturated_mg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> fattyAcidsTotalPolyunsaturatedMg =
      GeneratedColumn<double>(
          'fatty_acids_total_polyunsaturated_mg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
      'favorite', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("favorite" IN (0, 1))'));
  late final GeneratedColumn<double> fiberG = GeneratedColumn<double>(
      'fiber_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> fluorideFMcg = GeneratedColumn<double>(
      'fluoride_f_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> folateB9Mcg = GeneratedColumn<double>(
      'folate_b9_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> folateDfeMcg = GeneratedColumn<double>(
      'folate_dfe_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> folicAcidMcg = GeneratedColumn<double>(
      'folic_acid_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> foodFolateMcg = GeneratedColumn<double>(
      'food_folate_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<String> foodGroup = GeneratedColumn<String>(
      'food_group', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<double> fructoseG = GeneratedColumn<double>(
      'fructose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> galactoseG = GeneratedColumn<double>(
      'galactose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> glucoseDextroseG = GeneratedColumn<double>(
      'glucose_dextrose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> glutamicAcidMg = GeneratedColumn<double>(
      'glutamic_acid_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> glycineMg = GeneratedColumn<double>(
      'glycine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> histidineMg = GeneratedColumn<double>(
      'histidine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> hydroxyprolineMg = GeneratedColumn<double>(
      'hydroxyproline_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> imageFile = GeneratedColumn<String>(
      'image_file', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<double> insolubleFiberG = GeneratedColumn<double>(
      'insoluble_fiber_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> ironFeMg = GeneratedColumn<double>(
      'iron_fe_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> isoleucineMg = GeneratedColumn<double>(
      'isoleucine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> lactoseG = GeneratedColumn<double>(
      'lactose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> leucineMg = GeneratedColumn<double>(
      'leucine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> luteinZeaxanthinMcg =
      GeneratedColumn<double>('lutein_zeaxanthin_mcg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> lycopeneMcg = GeneratedColumn<double>(
      'lycopene_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> lysineMg = GeneratedColumn<double>(
      'lysine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> magnesiumMg = GeneratedColumn<double>(
      'magnesium_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> maltoseG = GeneratedColumn<double>(
      'maltose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> manganeseMg = GeneratedColumn<double>(
      'manganese_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> menaquinone4Mcg = GeneratedColumn<double>(
      'menaquinone_4_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> methionineMg = GeneratedColumn<double>(
      'methionine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> molybdenumMcg = GeneratedColumn<double>(
      'molybdenum_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<double> netCarbsG = GeneratedColumn<double>(
      'net_carbs_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> niacinB3Mg = GeneratedColumn<double>(
      'niacin_b3_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> omega3sMg = GeneratedColumn<double>(
      'omega_3s_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> omega6sMg = GeneratedColumn<double>(
      'omega_6s_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> pantothenicAcidB5Mg =
      GeneratedColumn<double>('pantothenic_acid_b5_mg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> phenylalanineMg = GeneratedColumn<double>(
      'phenylalanine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> phosphorusPMg = GeneratedColumn<double>(
      'phosphorus_p_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> potassiumKMg = GeneratedColumn<double>(
      'potassium_k_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> pralScore = GeneratedColumn<double>(
      'pral_score', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> prolineMg = GeneratedColumn<double>(
      'proline_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> proteinG = GeneratedColumn<double>(
      'protein_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> retinolMcg = GeneratedColumn<double>(
      'retinol_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> riboflavinB2Mg = GeneratedColumn<double>(
      'riboflavin_b2_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> saturatedFatsG = GeneratedColumn<double>(
      'saturated_fats_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> seleniumSeMcg = GeneratedColumn<double>(
      'selenium_se_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> serineMg = GeneratedColumn<double>(
      'serine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingDescription1G =
      GeneratedColumn<String>('serving_description_1_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingDescription2G =
      GeneratedColumn<String>('serving_description_2_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingDescription3G =
      GeneratedColumn<String>('serving_description_3_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingDescription4G =
      GeneratedColumn<String>('serving_description_4_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingDescription5G =
      GeneratedColumn<String>('serving_description_5_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingDescription6G =
      GeneratedColumn<String>('serving_description_6_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingDescription7G =
      GeneratedColumn<String>('serving_description_7_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingDescription8G =
      GeneratedColumn<String>('serving_description_8_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingDescription9G =
      GeneratedColumn<String>('serving_description_9_g', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingSize = GeneratedColumn<double>(
      'serving_size', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<String> servingUnit = GeneratedColumn<String>(
      'serving_unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingWeight1G = GeneratedColumn<double>(
      'serving_weight_1_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingWeight2G = GeneratedColumn<double>(
      'serving_weight_2_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingWeight3G = GeneratedColumn<double>(
      'serving_weight_3_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingWeight4G = GeneratedColumn<double>(
      'serving_weight_4_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingWeight5G = GeneratedColumn<double>(
      'serving_weight_5_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingWeight6G = GeneratedColumn<double>(
      'serving_weight_6_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingWeight7G = GeneratedColumn<double>(
      'serving_weight_7_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingWeight8G = GeneratedColumn<double>(
      'serving_weight_8_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> servingWeight9G = GeneratedColumn<double>(
      'serving_weight_9_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<String> smallImage = GeneratedColumn<String>(
      'small_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<double> sodiumMg = GeneratedColumn<double>(
      'sodium_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> solubleFiberG = GeneratedColumn<double>(
      'soluble_fiber_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> starchG = GeneratedColumn<double>(
      'starch_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> sucroseG = GeneratedColumn<double>(
      'sucrose_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> sugarsG = GeneratedColumn<double>(
      'sugars_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> theobromineMg = GeneratedColumn<double>(
      'theobromine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> thiaminB1Mg = GeneratedColumn<double>(
      'thiamin_b1_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> threonineMg = GeneratedColumn<double>(
      'threonine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> totalSugarAlcoholsG =
      GeneratedColumn<double>('total_sugar_alcohols_g', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> transFattyAcidsG = GeneratedColumn<double>(
      'trans_fatty_acids_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> tryptophanMg = GeneratedColumn<double>(
      'tryptophan_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> tyrosineMg = GeneratedColumn<double>(
      'tyrosine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> u183N3CCCAlaMg = GeneratedColumn<double>(
      '_18_3_n_3_c_c_c_ala_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> u200calorieWeightG =
      GeneratedColumn<double>('_200_calorie_weight_g', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> u205N3EpaMg = GeneratedColumn<double>(
      '_20_5_n_3_epa_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> u225N3DpaMg = GeneratedColumn<double>(
      '_22_5_n_3_dpa_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> u226N3DhaMg = GeneratedColumn<double>(
      '_22_6_n_3_dha_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> valineMg = GeneratedColumn<double>(
      'valine_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminAIuIu = GeneratedColumn<double>(
      'vitamin_a_iu_iu', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminARaeMcg = GeneratedColumn<double>(
      'vitamin_a_rae_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminB12Mcg = GeneratedColumn<double>(
      'vitamin_b_12_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminB6Mg = GeneratedColumn<double>(
      'vitamin_b6_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminCMg = GeneratedColumn<double>(
      'vitamin_c_mg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminD2ErgocalciferolMcg =
      GeneratedColumn<double>(
          'vitamin_d2_ergocalciferol_mcg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminD3CholecalciferolMcg =
      GeneratedColumn<double>(
          'vitamin_d3_cholecalciferol_mcg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminDIuIu = GeneratedColumn<double>(
      'vitamin_d_iu_iu', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminDMcg = GeneratedColumn<double>(
      'vitamin_d_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminEAlphaTocopherolMg =
      GeneratedColumn<double>(
          'vitamin_e_alpha_tocopherol_mg', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> vitaminKMcg = GeneratedColumn<double>(
      'vitamin_k_mcg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> waterG = GeneratedColumn<double>(
      'water_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Foods createAlias(String alias) {
    return Foods(attachedDatabase, alias);
  }
}

class Entries extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Entries(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> food = GeneratedColumn<int>(
      'food', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES foods (id)'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<double> kCalories = GeneratedColumn<double>(
      'k_calories', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> proteinG = GeneratedColumn<double>(
      'protein_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<double> fatG = GeneratedColumn<double>(
      'fat_g', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Entries createAlias(String alias) {
    return Entries(attachedDatabase, alias);
  }
}

class Weights extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Weights(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Weights createAlias(String alias) {
    return Weights(attachedDatabase, alias);
  }
}

class Settings extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Settings(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<bool> curveLines = GeneratedColumn<bool>(
      'curve_lines', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("curve_lines" IN (0, 1))'));
  late final GeneratedColumn<int> dailyCalories = GeneratedColumn<int>(
      'daily_calories', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> dailyCarb = GeneratedColumn<int>(
      'daily_carb', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> dailyFat = GeneratedColumn<int>(
      'daily_fat', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> dailyProtein = GeneratedColumn<int>(
      'daily_protein', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> diarySummary = GeneratedColumn<String>(
      'diary_summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> entryUnit = GeneratedColumn<String>(
      'entry_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> favoriteNew = GeneratedColumn<bool>(
      'favorite_new', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("favorite_new" IN (0, 1))'));
  late final GeneratedColumn<String> foodUnit = GeneratedColumn<String>(
      'food_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> longDateFormat = GeneratedColumn<String>(
      'long_date_format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> positiveReinforcement =
      GeneratedColumn<bool>('positive_reinforcement', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("positive_reinforcement" IN (0, 1))'),
          defaultValue: const Constant(true));
  late final GeneratedColumn<bool> reminders = GeneratedColumn<bool>(
      'reminders', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("reminders" IN (0, 1))'),
      defaultValue: const Constant(false));
  late final GeneratedColumn<bool> selectEntryOnSubmit = GeneratedColumn<bool>(
      'select_entry_on_submit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("select_entry_on_submit" IN (0, 1))'));
  late final GeneratedColumn<String> shortDateFormat = GeneratedColumn<String>(
      'short_date_format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> showImages = GeneratedColumn<bool>(
      'show_images', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("show_images" IN (0, 1))'),
      defaultValue: const Constant(true));
  late final GeneratedColumn<bool> showOthers = GeneratedColumn<bool>(
      'show_others', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("show_others" IN (0, 1))'));
  late final GeneratedColumn<bool> systemColors = GeneratedColumn<bool>(
      'system_colors', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("system_colors" IN (0, 1))'));
  late final GeneratedColumn<double> targetWeight = GeneratedColumn<double>(
      'target_weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
      'theme_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> offLogin = GeneratedColumn<String>(
      'off_login', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> offPassword = GeneratedColumn<String>(
      'off_password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
        positiveReinforcement,
        reminders,
        selectEntryOnSubmit,
        shortDateFormat,
        showImages,
        showOthers,
        systemColors,
        targetWeight,
        themeMode,
        offLogin,
        offPassword
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Settings createAlias(String alias) {
    return Settings(attachedDatabase, alias);
  }
}

class DatabaseAtV23 extends GeneratedDatabase {
  DatabaseAtV23(QueryExecutor e) : super(e);
  late final Foods foods = Foods(this);
  late final Entries entries = Entries(this);
  late final Weights weights = Weights(this);
  late final Settings settings = Settings(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [foods, entries, weights, settings];
  @override
  int get schemaVersion => 23;
}
