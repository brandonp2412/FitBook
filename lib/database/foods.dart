import 'package:drift/drift.dart';

// coverage:ignore-file

class Foods extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get foodGroup => text().nullable()();
  RealColumn get calories => real().nullable()();
  RealColumn get fatG => real().nullable()();
  RealColumn get proteinG => real().nullable()();
  RealColumn get carbohydrateG => real().nullable()();
  RealColumn get sugarsG => real().nullable()();
  RealColumn get fiberG => real().nullable()();
  RealColumn get cholesterolMg => real().nullable()();
  RealColumn get saturatedFatsG => real().nullable()();
  RealColumn get calciumMg => real().nullable()();
  RealColumn get ironFeMg => real().nullable()();
  RealColumn get potassiumKMg => real().nullable()();
  RealColumn get magnesiumMg => real().nullable()();
  RealColumn get vitaminAIuIu => real().nullable()();
  RealColumn get vitaminARaeMcg => real().nullable()();
  RealColumn get vitaminCMg => real().nullable()();
  RealColumn get vitaminB12Mcg => real().named('vitamin_b_12_mcg').nullable()();
  RealColumn get vitaminDMcg => real().nullable()();
  RealColumn get vitaminEAlphaTocopherolMg => real().nullable()();
  RealColumn get addedSugarG => real().nullable()();
  RealColumn get netCarbsG => real().nullable()();
  RealColumn get waterG => real().nullable()();
  RealColumn get omega3sMg => real().named('omega_3s_mg').nullable()();
  RealColumn get omega6sMg => real().named('omega_6s_mg').nullable()();
  RealColumn get pralScore => real().nullable()();
  RealColumn get transFattyAcidsG => real().nullable()();
  RealColumn get solubleFiberG => real().nullable()();
  RealColumn get insolubleFiberG => real().nullable()();
  RealColumn get sucroseG => real().nullable()();
  RealColumn get glucoseDextroseG => real().nullable()();
  RealColumn get fructoseG => real().nullable()();
  RealColumn get lactoseG => real().nullable()();
  RealColumn get maltoseG => real().nullable()();
  RealColumn get galactoseG => real().nullable()();
  RealColumn get starchG => real().nullable()();
  RealColumn get totalSugarAlcoholsG => real().nullable()();
  RealColumn get phosphorusPMg => real().nullable()();
  RealColumn get sodiumMg => real().nullable()();
  RealColumn get zincZnMg => real().nullable()();
  RealColumn get copperCuMg => real().nullable()();
  RealColumn get manganeseMg => real().nullable()();
  RealColumn get seleniumSeMcg => real().nullable()();
  RealColumn get fluorideFMcg => real().nullable()();
  RealColumn get molybdenumMcg => real().nullable()();
  RealColumn get chlorineMg => real().nullable()();
  RealColumn get thiaminB1Mg => real().nullable()();
  RealColumn get riboflavinB2Mg => real().nullable()();
  RealColumn get niacinB3Mg => real().nullable()();
  RealColumn get pantothenicAcidB5Mg =>
      real().named('pantothenic_acid_b5_mg').nullable()();
  RealColumn get vitaminB6Mg => real().nullable()();
  RealColumn get biotinB7Mcg => real().nullable()();
  RealColumn get folateB9Mcg => real().nullable()();
  RealColumn get folicAcidMcg => real().nullable()();
  RealColumn get foodFolateMcg => real().nullable()();
  RealColumn get folateDfeMcg => real().nullable()();
  RealColumn get cholineMg => real().nullable()();
  RealColumn get betaineMg => real().nullable()();
  RealColumn get retinolMcg => real().nullable()();
  RealColumn get caroteneBetaMcg => real().nullable()();
  RealColumn get caroteneAlphaMcg => real().nullable()();
  RealColumn get lycopeneMcg => real().nullable()();
  RealColumn get luteinZeaxanthinMcg => real().nullable()();
  RealColumn get vitaminD2ErgocalciferolMcg => real().nullable()();
  RealColumn get vitaminD3CholecalciferolMcg => real().nullable()();
  RealColumn get vitaminDIuIu => real().nullable()();
  RealColumn get vitaminKMcg => real().nullable()();
  RealColumn get dihydrophylloquinoneMcg => real().nullable()();
  RealColumn get menaquinone4Mcg =>
      real().named('menaquinone_4_mcg').nullable()();
  RealColumn get fattyAcidsTotalMonounsaturatedMg => real().nullable()();
  RealColumn get fattyAcidsTotalPolyunsaturatedMg => real().nullable()();
  RealColumn get u183N3CCCAlaMg =>
      real().named('_18_3_n_3_c_c_c_ala_mg').nullable()();
  RealColumn get u205N3EpaMg => real().named('_20_5_n_3_epa_mg').nullable()();
  RealColumn get u225N3DpaMg => real().named('_22_5_n_3_dpa_mg').nullable()();
  RealColumn get u226N3DhaMg => real().named('_22_6_n_3_dha_mg').nullable()();
  RealColumn get tryptophanMg => real().nullable()();
  RealColumn get threonineMg => real().nullable()();
  RealColumn get isoleucineMg => real().nullable()();
  RealColumn get leucineMg => real().nullable()();
  RealColumn get lysineMg => real().nullable()();
  RealColumn get methionineMg => real().nullable()();
  RealColumn get cystineMg => real().nullable()();
  RealColumn get phenylalanineMg => real().nullable()();
  RealColumn get tyrosineMg => real().nullable()();
  RealColumn get valineMg => real().nullable()();
  RealColumn get arginineMg => real().nullable()();
  RealColumn get histidineMg => real().nullable()();
  RealColumn get alanineMg => real().nullable()();
  RealColumn get asparticAcidMg => real().nullable()();
  RealColumn get glutamicAcidMg => real().nullable()();
  RealColumn get glycineMg => real().nullable()();
  RealColumn get prolineMg => real().nullable()();
  RealColumn get serineMg => real().nullable()();
  RealColumn get hydroxyprolineMg => real().nullable()();
  RealColumn get alcoholG => real().nullable()();
  RealColumn get caffeineMg => real().nullable()();
  RealColumn get theobromineMg => real().nullable()();
  RealColumn get servingWeight1G =>
      real().named('serving_weight_1_g').nullable()();
  TextColumn get servingDescription1G =>
      text().named('serving_description_1_g').nullable()();
  RealColumn get servingWeight2G =>
      real().named('serving_weight_2_g').nullable()();
  TextColumn get servingDescription2G =>
      text().named('serving_description_2_g').nullable()();
  RealColumn get servingWeight3G =>
      real().named('serving_weight_3_g').nullable()();
  TextColumn get servingDescription3G =>
      text().named('serving_description_3_g').nullable()();
  RealColumn get servingWeight4G =>
      real().named('serving_weight_4_g').nullable()();
  TextColumn get servingDescription4G =>
      text().named('serving_description_4_g').nullable()();
  RealColumn get servingWeight5G =>
      real().named('serving_weight_5_g').nullable()();
  TextColumn get servingDescription5G =>
      text().named('serving_description_5_g').nullable()();
  RealColumn get servingWeight6G =>
      real().named('serving_weight_6_g').nullable()();
  TextColumn get servingDescription6G =>
      text().named('serving_description_6_g').nullable()();
  RealColumn get servingWeight7G =>
      real().named('serving_weight_7_g').nullable()();
  TextColumn get servingDescription7G =>
      text().named('serving_description_7_g').nullable()();
  RealColumn get servingWeight8G =>
      real().named('serving_weight_8_g').nullable()();
  TextColumn get servingDescription8G =>
      text().named('serving_description_8_g').nullable()();
  RealColumn get servingWeight9G =>
      real().named('serving_weight_9_g').nullable()();
  TextColumn get servingDescription9G =>
      text().named('serving_description_9_g').nullable()();
  RealColumn get u200calorieWeightG =>
      real().named('_200_calorie_weight_g').nullable()();
  BoolColumn get favorite => boolean().nullable()();
  TextColumn get servingUnit => text().nullable()();
  RealColumn get servingSize => real().nullable()();
  TextColumn get smallImage => text().nullable()();
  TextColumn get bigImage => text().nullable()();
  TextColumn get imageFile => text().nullable()();
}
