import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class EditFoodPage extends StatefulWidget {
  final Food? food;

  const EditFoodPage({super.key, this.food});

  @override
  createState() => _EditFoodPageState();
}

class _EditFoodPageState extends State<EditFoodPage> {
  final nameController = TextEditingController();
  final foodGroupController = TextEditingController();
  final caloriesController = TextEditingController();
  final fatGController = TextEditingController();
  final proteinGController = TextEditingController();
  final carbohydrateGController = TextEditingController();
  final sugarsGController = TextEditingController();
  final fiberGController = TextEditingController();
  final cholesterolMgController = TextEditingController();
  final saturatedFatsGController = TextEditingController();
  final calciumMgController = TextEditingController();
  final ironFeMgController = TextEditingController();
  final potassiumKMgController = TextEditingController();
  final magnesiumMgController = TextEditingController();
  final vitaminAIuIuController = TextEditingController();
  final vitaminARaeMcgController = TextEditingController();
  final vitaminCMgController = TextEditingController();
  final vitaminB12McgController = TextEditingController();
  final vitaminDMcgController = TextEditingController();
  final vitaminEAlphaTocopherolMgController = TextEditingController();
  final addedSugarGController = TextEditingController();
  final netCarbsGController = TextEditingController();
  final waterGController = TextEditingController();
  final omega3sMgController = TextEditingController();
  final omega6sMgController = TextEditingController();
  final pralScoreController = TextEditingController();
  final transFattyAcidsGController = TextEditingController();
  final solubleFiberGController = TextEditingController();
  final insolubleFiberGController = TextEditingController();
  final sucroseGController = TextEditingController();
  final glucoseDextroseGController = TextEditingController();
  final fructoseGController = TextEditingController();
  final lactoseGController = TextEditingController();
  final maltoseGController = TextEditingController();
  final galactoseGController = TextEditingController();
  final starchGController = TextEditingController();
  final totalSugarAlcoholsGController = TextEditingController();
  final phosphorusPMgController = TextEditingController();
  final sodiumMgController = TextEditingController();
  final zincZnMgController = TextEditingController();
  final copperCuMgController = TextEditingController();
  final manganeseMgController = TextEditingController();
  final seleniumSeMcgController = TextEditingController();
  final fluorideFMcgController = TextEditingController();
  final molybdenumMcgController = TextEditingController();
  final chlorineMgController = TextEditingController();
  final thiaminB1MgController = TextEditingController();
  final riboflavinB2MgController = TextEditingController();
  final niacinB3MgController = TextEditingController();
  final pantothenicAcidB5MgController = TextEditingController();
  final vitaminB6MgController = TextEditingController();
  final biotinB7McgController = TextEditingController();
  final folateB9McgController = TextEditingController();
  final folicAcidMcgController = TextEditingController();
  final foodFolateMcgController = TextEditingController();
  final folateDfeMcgController = TextEditingController();
  final cholineMgController = TextEditingController();
  final betaineMgController = TextEditingController();
  final retinolMcgController = TextEditingController();
  final caroteneBetaMcgController = TextEditingController();
  final caroteneAlphaMcgController = TextEditingController();
  final lycopeneMcgController = TextEditingController();
  final luteinZeaxanthinMcgController = TextEditingController();
  final vitaminD2ErgocalciferolMcgController = TextEditingController();
  final vitaminD3CholecalciferolMcgController = TextEditingController();
  final vitaminDIuIuController = TextEditingController();
  final vitaminKMcgController = TextEditingController();
  final dihydrophylloquinoneMcgController = TextEditingController();
  final menaquinone4McgController = TextEditingController();
  final fattyAcidsTotalMonounsaturatedMgController = TextEditingController();
  final fattyAcidsTotalPolyunsaturatedMgController = TextEditingController();
  final u183N3CCCAlaMgController = TextEditingController();
  final u205N3EpaMgController = TextEditingController();
  final u225N3DpaMgController = TextEditingController();
  final u226N3DhaMgController = TextEditingController();
  final tryptophanMgController = TextEditingController();
  final threonineMgController = TextEditingController();
  final isoleucineMgController = TextEditingController();
  final leucineMgController = TextEditingController();
  final lysineMgController = TextEditingController();
  final methionineMgController = TextEditingController();
  final cystineMgController = TextEditingController();
  final phenylalanineMgController = TextEditingController();
  final tyrosineMgController = TextEditingController();
  final valineMgController = TextEditingController();
  final arginineMgController = TextEditingController();
  final histidineMgController = TextEditingController();
  final alanineMgController = TextEditingController();
  final asparticAcidMgController = TextEditingController();
  final glutamicAcidMgController = TextEditingController();
  final glycineMgController = TextEditingController();
  final prolineMgController = TextEditingController();
  final serineMgController = TextEditingController();
  final hydroxyprolineMgController = TextEditingController();
  final alcoholGController = TextEditingController();
  final caffeineMgController = TextEditingController();
  final theobromineMgController = TextEditingController();
  final servingWeight1GController = TextEditingController();
  final servingDescription1GController = TextEditingController();
  final servingWeight2GController = TextEditingController();
  final servingDescription2GController = TextEditingController();
  final servingWeight3GController = TextEditingController();
  final servingDescription3GController = TextEditingController();
  final servingWeight4GController = TextEditingController();
  final servingDescription4GController = TextEditingController();
  final servingWeight5GController = TextEditingController();
  final servingDescription5GController = TextEditingController();
  final servingWeight6GController = TextEditingController();
  final servingDescription6GController = TextEditingController();
  final servingWeight7GController = TextEditingController();
  final servingDescription7GController = TextEditingController();
  final servingWeight8GController = TextEditingController();
  final servingDescription8GController = TextEditingController();
  final servingWeight9GController = TextEditingController();
  final servingDescription9GController = TextEditingController();
  final u200calorieWeightGController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.food == null) return;
    final food = widget.food!;
    nameController.text = food.name;
    foodGroupController.text = food.foodGroup ?? '';
    caloriesController.text = food.calories?.toString() ?? '';
    fatGController.text = food.fatG?.toString() ?? '';
    proteinGController.text = food.proteinG?.toString() ?? '';
    carbohydrateGController.text = food.carbohydrateG?.toString() ?? '';
    sugarsGController.text = food.sugarsG?.toString() ?? '';
    fiberGController.text = food.fiberG?.toString() ?? '';
    cholesterolMgController.text = food.cholesterolMg?.toString() ?? '';
    saturatedFatsGController.text = food.saturatedFatsG?.toString() ?? '';
    calciumMgController.text = food.calciumMg?.toString() ?? '';
    ironFeMgController.text = food.ironFeMg?.toString() ?? '';
    potassiumKMgController.text = food.potassiumKMg?.toString() ?? '';
    magnesiumMgController.text = food.magnesiumMg?.toString() ?? '';
    vitaminAIuIuController.text = food.vitaminAIuIu?.toString() ?? '';
    vitaminARaeMcgController.text = food.vitaminARaeMcg?.toString() ?? '';
    vitaminCMgController.text = food.vitaminCMg?.toString() ?? '';
    vitaminB12McgController.text = food.vitaminB12Mcg?.toString() ?? '';
    vitaminDMcgController.text = food.vitaminDMcg?.toString() ?? '';
    vitaminEAlphaTocopherolMgController.text =
        food.vitaminEAlphaTocopherolMg?.toString() ?? '';
    addedSugarGController.text = food.addedSugarG?.toString() ?? '';
    netCarbsGController.text = food.netCarbsG?.toString() ?? '';
    waterGController.text = food.waterG?.toString() ?? '';
    omega3sMgController.text = food.omega3sMg?.toString() ?? '';
    omega6sMgController.text = food.omega6sMg?.toString() ?? '';
    pralScoreController.text = food.pralScore?.toString() ?? '';
    transFattyAcidsGController.text = food.transFattyAcidsG?.toString() ?? '';
    solubleFiberGController.text = food.solubleFiberG?.toString() ?? '';
    insolubleFiberGController.text = food.insolubleFiberG?.toString() ?? '';
    sucroseGController.text = food.sucroseG?.toString() ?? '';
    glucoseDextroseGController.text = food.glucoseDextroseG?.toString() ?? '';
    fructoseGController.text = food.fructoseG?.toString() ?? '';
    lactoseGController.text = food.lactoseG?.toString() ?? '';
    maltoseGController.text = food.maltoseG?.toString() ?? '';
    galactoseGController.text = food.galactoseG?.toString() ?? '';
    starchGController.text = food.starchG?.toString() ?? '';
    totalSugarAlcoholsGController.text =
        food.totalSugarAlcoholsG?.toString() ?? '';
    phosphorusPMgController.text = food.phosphorusPMg?.toString() ?? '';
    sodiumMgController.text = food.sodiumMg?.toString() ?? '';
    zincZnMgController.text = food.zincZnMg?.toString() ?? '';
    copperCuMgController.text = food.copperCuMg?.toString() ?? '';
    manganeseMgController.text = food.manganeseMg?.toString() ?? '';
    seleniumSeMcgController.text = food.seleniumSeMcg?.toString() ?? '';
    fluorideFMcgController.text = food.fluorideFMcg?.toString() ?? '';
    molybdenumMcgController.text = food.molybdenumMcg?.toString() ?? '';
    chlorineMgController.text = food.chlorineMg?.toString() ?? '';
    thiaminB1MgController.text = food.thiaminB1Mg?.toString() ?? '';
    riboflavinB2MgController.text = food.riboflavinB2Mg?.toString() ?? '';
    niacinB3MgController.text = food.niacinB3Mg?.toString() ?? '';
    pantothenicAcidB5MgController.text =
        food.pantothenicAcidB5Mg?.toString() ?? '';
    vitaminB6MgController.text = food.vitaminB6Mg?.toString() ?? '';
    biotinB7McgController.text = food.biotinB7Mcg?.toString() ?? '';
    folateB9McgController.text = food.folateB9Mcg?.toString() ?? '';
    folicAcidMcgController.text = food.folicAcidMcg?.toString() ?? '';
    foodFolateMcgController.text = food.foodFolateMcg?.toString() ?? '';
    folateDfeMcgController.text = food.folateDfeMcg?.toString() ?? '';
    cholineMgController.text = food.cholineMg?.toString() ?? '';
    betaineMgController.text = food.betaineMg?.toString() ?? '';
    retinolMcgController.text = food.retinolMcg?.toString() ?? '';
    caroteneBetaMcgController.text = food.caroteneBetaMcg?.toString() ?? '';
    caroteneAlphaMcgController.text = food.caroteneAlphaMcg?.toString() ?? '';
    lycopeneMcgController.text = food.lycopeneMcg?.toString() ?? '';
    luteinZeaxanthinMcgController.text =
        food.luteinZeaxanthinMcg?.toString() ?? '';
    vitaminD2ErgocalciferolMcgController.text =
        food.vitaminD2ErgocalciferolMcg?.toString() ?? '';
    vitaminD3CholecalciferolMcgController.text =
        food.vitaminD3CholecalciferolMcg?.toString() ?? '';
    vitaminDIuIuController.text = food.vitaminDIuIu?.toString() ?? '';
    vitaminKMcgController.text = food.vitaminKMcg?.toString() ?? '';
    dihydrophylloquinoneMcgController.text =
        food.dihydrophylloquinoneMcg?.toString() ?? '';
    menaquinone4McgController.text = food.menaquinone4Mcg?.toString() ?? '';
    fattyAcidsTotalMonounsaturatedMgController.text =
        food.fattyAcidsTotalMonounsaturatedMg?.toString() ?? '';
    fattyAcidsTotalPolyunsaturatedMgController.text =
        food.fattyAcidsTotalPolyunsaturatedMg?.toString() ?? '';
    u183N3CCCAlaMgController.text = food.u183N3CCCAlaMg?.toString() ?? '';
    u205N3EpaMgController.text = food.u205N3EpaMg?.toString() ?? '';
    u225N3DpaMgController.text = food.u225N3DpaMg?.toString() ?? '';
    u226N3DhaMgController.text = food.u226N3DhaMg?.toString() ?? '';
    tryptophanMgController.text = food.tryptophanMg?.toString() ?? '';
    threonineMgController.text = food.threonineMg?.toString() ?? '';
    isoleucineMgController.text = food.isoleucineMg?.toString() ?? '';
    leucineMgController.text = food.leucineMg?.toString() ?? '';
    lysineMgController.text = food.lysineMg?.toString() ?? '';
    methionineMgController.text = food.methionineMg?.toString() ?? '';
    cystineMgController.text = food.cystineMg?.toString() ?? '';
    phenylalanineMgController.text = food.phenylalanineMg?.toString() ?? '';
    tyrosineMgController.text = food.tyrosineMg?.toString() ?? '';
    valineMgController.text = food.valineMg?.toString() ?? '';
    arginineMgController.text = food.arginineMg?.toString() ?? '';
    histidineMgController.text = food.histidineMg?.toString() ?? '';
    alanineMgController.text = food.alanineMg?.toString() ?? '';
    asparticAcidMgController.text = food.asparticAcidMg?.toString() ?? '';
    glutamicAcidMgController.text = food.glutamicAcidMg?.toString() ?? '';
    glycineMgController.text = food.glycineMg?.toString() ?? '';
    prolineMgController.text = food.prolineMg?.toString() ?? '';
    serineMgController.text = food.serineMg?.toString() ?? '';
    hydroxyprolineMgController.text = food.hydroxyprolineMg?.toString() ?? '';
    alcoholGController.text = food.alcoholG?.toString() ?? '';
    caffeineMgController.text = food.caffeineMg?.toString() ?? '';
    theobromineMgController.text = food.theobromineMg?.toString() ?? '';
    servingWeight1GController.text = food.servingWeight1G?.toString() ?? '';
    servingDescription1GController.text = food.servingDescription1G ?? '';
    servingWeight2GController.text = food.servingWeight2G?.toString() ?? '';
    servingDescription2GController.text = food.servingDescription2G ?? '';
    servingWeight3GController.text = food.servingWeight3G?.toString() ?? '';
    servingDescription3GController.text = food.servingDescription3G ?? '';
    servingWeight4GController.text = food.servingWeight4G?.toString() ?? '';
    servingDescription4GController.text = food.servingDescription4G ?? '';
    servingWeight5GController.text = food.servingWeight5G?.toString() ?? '';
    servingDescription5GController.text = food.servingDescription5G ?? '';
    servingWeight6GController.text = food.servingWeight6G?.toString() ?? '';
    servingDescription6GController.text = food.servingDescription6G ?? '';
    servingWeight7GController.text = food.servingWeight7G?.toString() ?? '';
    servingDescription7GController.text = food.servingDescription7G ?? '';
    servingWeight8GController.text = food.servingWeight8G?.toString() ?? '';
    servingDescription8GController.text = food.servingDescription8G ?? '';
    servingWeight9GController.text = food.servingWeight9G?.toString() ?? '';
    servingDescription9GController.text = food.servingDescription9G ?? '';
    u200calorieWeightGController.text =
        food.u200calorieWeightG?.toString() ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    netCarbsGController.dispose();
    waterGController.dispose();
    omega3sMgController.dispose();
    omega6sMgController.dispose();
    pralScoreController.dispose();
    transFattyAcidsGController.dispose();
    solubleFiberGController.dispose();
    insolubleFiberGController.dispose();
    sucroseGController.dispose();
    glucoseDextroseGController.dispose();
    fructoseGController.dispose();
    lactoseGController.dispose();
    maltoseGController.dispose();
    galactoseGController.dispose();
    starchGController.dispose();
    totalSugarAlcoholsGController.dispose();
    phosphorusPMgController.dispose();
    sodiumMgController.dispose();
    zincZnMgController.dispose();
    copperCuMgController.dispose();
    manganeseMgController.dispose();
    nameController.dispose();
    foodGroupController.dispose();
    caloriesController.dispose();
    fatGController.dispose();
    proteinGController.dispose();
    carbohydrateGController.dispose();
    sugarsGController.dispose();
    fiberGController.dispose();
    cholesterolMgController.dispose();
    saturatedFatsGController.dispose();
    calciumMgController.dispose();
    ironFeMgController.dispose();
    potassiumKMgController.dispose();
    magnesiumMgController.dispose();
    vitaminAIuIuController.dispose();
    vitaminARaeMcgController.dispose();
    vitaminCMgController.dispose();
    vitaminB12McgController.dispose();
    vitaminDMcgController.dispose();
    vitaminEAlphaTocopherolMgController.dispose();
    addedSugarGController.dispose();
    seleniumSeMcgController.dispose();
    fluorideFMcgController.dispose();
    molybdenumMcgController.dispose();
    chlorineMgController.dispose();
    thiaminB1MgController.dispose();
    riboflavinB2MgController.dispose();
    niacinB3MgController.dispose();
    pantothenicAcidB5MgController.dispose();
    vitaminB6MgController.dispose();
    biotinB7McgController.dispose();
    folateB9McgController.dispose();
    folicAcidMcgController.dispose();
    foodFolateMcgController.dispose();
    folateDfeMcgController.dispose();
    cholineMgController.dispose();
    betaineMgController.dispose();
    retinolMcgController.dispose();
    caroteneBetaMcgController.dispose();
    caroteneAlphaMcgController.dispose();
    lycopeneMcgController.dispose();
    luteinZeaxanthinMcgController.dispose();
    vitaminD2ErgocalciferolMcgController.dispose();
    vitaminD3CholecalciferolMcgController.dispose();
    vitaminDIuIuController.dispose();
    vitaminKMcgController.dispose();
    dihydrophylloquinoneMcgController.dispose();
    menaquinone4McgController.dispose();
    fattyAcidsTotalMonounsaturatedMgController.dispose();
    fattyAcidsTotalPolyunsaturatedMgController.dispose();
    u183N3CCCAlaMgController.dispose();
    u205N3EpaMgController.dispose();
    u225N3DpaMgController.dispose();
    u226N3DhaMgController.dispose();
    tryptophanMgController.dispose();
    threonineMgController.dispose();
    isoleucineMgController.dispose();
    leucineMgController.dispose();
    lysineMgController.dispose();
    methionineMgController.dispose();
    cystineMgController.dispose();
    phenylalanineMgController.dispose();
    tyrosineMgController.dispose();
    valineMgController.dispose();
    arginineMgController.dispose();
    histidineMgController.dispose();
    alanineMgController.dispose();
    asparticAcidMgController.dispose();
    glutamicAcidMgController.dispose();
    glycineMgController.dispose();
    prolineMgController.dispose();
    serineMgController.dispose();
    hydroxyprolineMgController.dispose();
    alcoholGController.dispose();
    caffeineMgController.dispose();
    theobromineMgController.dispose();
    servingWeight1GController.dispose();
    servingDescription1GController.dispose();
    servingWeight2GController.dispose();
    servingDescription2GController.dispose();
    servingWeight3GController.dispose();
    servingDescription3GController.dispose();
    servingWeight4GController.dispose();
    servingDescription4GController.dispose();
    servingWeight5GController.dispose();
    servingDescription5GController.dispose();
    servingWeight6GController.dispose();
    servingDescription6GController.dispose();
    servingWeight7GController.dispose();
    servingDescription7GController.dispose();
    servingWeight8GController.dispose();
    servingDescription8GController.dispose();
    servingWeight9GController.dispose();
    servingDescription9GController.dispose();
    u200calorieWeightGController.dispose();
  }

  Future<void> _save() async {
    Navigator.pop(context);
    var food = FoodsCompanion.insert(
      name: nameController.text,
      foodGroup: foodGroupController.text.isNotEmpty
          ? Value(foodGroupController.text)
          : const Value.absent(),
      calories: caloriesController.text.isNotEmpty
          ? Value(double.parse(caloriesController.text))
          : const Value.absent(),
      fatG: fatGController.text.isNotEmpty
          ? Value(double.parse(fatGController.text))
          : const Value.absent(),
      proteinG: proteinGController.text.isNotEmpty
          ? Value(double.parse(proteinGController.text))
          : const Value.absent(),
      carbohydrateG: carbohydrateGController.text.isNotEmpty
          ? Value(double.parse(carbohydrateGController.text))
          : const Value.absent(),
      sugarsG: sugarsGController.text.isNotEmpty
          ? Value(double.parse(sugarsGController.text))
          : const Value.absent(),
      fiberG: fiberGController.text.isNotEmpty
          ? Value(double.parse(fiberGController.text))
          : const Value.absent(),
      cholesterolMg: cholesterolMgController.text.isNotEmpty
          ? Value(double.parse(cholesterolMgController.text))
          : const Value.absent(),
      saturatedFatsG: saturatedFatsGController.text.isNotEmpty
          ? Value(double.parse(saturatedFatsGController.text))
          : const Value.absent(),
      calciumMg: calciumMgController.text.isNotEmpty
          ? Value(double.parse(calciumMgController.text))
          : const Value.absent(),
      ironFeMg: ironFeMgController.text.isNotEmpty
          ? Value(double.parse(ironFeMgController.text))
          : const Value.absent(),
      potassiumKMg: potassiumKMgController.text.isNotEmpty
          ? Value(double.parse(potassiumKMgController.text))
          : const Value.absent(),
      magnesiumMg: magnesiumMgController.text.isNotEmpty
          ? Value(double.parse(magnesiumMgController.text))
          : const Value.absent(),
      vitaminAIuIu: vitaminAIuIuController.text.isNotEmpty
          ? Value(double.parse(vitaminAIuIuController.text))
          : const Value.absent(),
      vitaminARaeMcg: vitaminARaeMcgController.text.isNotEmpty
          ? Value(double.parse(vitaminARaeMcgController.text))
          : const Value.absent(),
      vitaminCMg: vitaminCMgController.text.isNotEmpty
          ? Value(double.parse(vitaminCMgController.text))
          : const Value.absent(),
      vitaminB12Mcg: vitaminB12McgController.text.isNotEmpty
          ? Value(double.parse(vitaminB12McgController.text))
          : const Value.absent(),
      vitaminDMcg: vitaminDMcgController.text.isNotEmpty
          ? Value(double.parse(vitaminDMcgController.text))
          : const Value.absent(),
      vitaminEAlphaTocopherolMg:
          vitaminEAlphaTocopherolMgController.text.isNotEmpty
              ? Value(double.parse(vitaminEAlphaTocopherolMgController.text))
              : const Value.absent(),
      addedSugarG: addedSugarGController.text.isNotEmpty
          ? Value(double.parse(addedSugarGController.text))
          : const Value.absent(),
      netCarbsG: netCarbsGController.text.isNotEmpty
          ? Value(double.parse(netCarbsGController.text))
          : const Value.absent(),
      waterG: waterGController.text.isNotEmpty
          ? Value(double.parse(waterGController.text))
          : const Value.absent(),
      omega3sMg: omega3sMgController.text.isNotEmpty
          ? Value(double.parse(omega3sMgController.text))
          : const Value.absent(),
      omega6sMg: omega6sMgController.text.isNotEmpty
          ? Value(double.parse(omega6sMgController.text))
          : const Value.absent(),
      pralScore: pralScoreController.text.isNotEmpty
          ? Value(double.parse(pralScoreController.text))
          : const Value.absent(),
      transFattyAcidsG: transFattyAcidsGController.text.isNotEmpty
          ? Value(double.parse(transFattyAcidsGController.text))
          : const Value.absent(),
      solubleFiberG: solubleFiberGController.text.isNotEmpty
          ? Value(double.parse(solubleFiberGController.text))
          : const Value.absent(),
      insolubleFiberG: insolubleFiberGController.text.isNotEmpty
          ? Value(double.parse(insolubleFiberGController.text))
          : const Value.absent(),
      sucroseG: sucroseGController.text.isNotEmpty
          ? Value(double.parse(sucroseGController.text))
          : const Value.absent(),
      glucoseDextroseG: glucoseDextroseGController.text.isNotEmpty
          ? Value(double.parse(glucoseDextroseGController.text))
          : const Value.absent(),
      fructoseG: fructoseGController.text.isNotEmpty
          ? Value(double.parse(fructoseGController.text))
          : const Value.absent(),
      lactoseG: lactoseGController.text.isNotEmpty
          ? Value(double.parse(lactoseGController.text))
          : const Value.absent(),
      maltoseG: maltoseGController.text.isNotEmpty
          ? Value(double.parse(maltoseGController.text))
          : const Value.absent(),
      galactoseG: galactoseGController.text.isNotEmpty
          ? Value(double.parse(galactoseGController.text))
          : const Value.absent(),
      starchG: starchGController.text.isNotEmpty
          ? Value(double.parse(starchGController.text))
          : const Value.absent(),
      totalSugarAlcoholsG: totalSugarAlcoholsGController.text.isNotEmpty
          ? Value(double.parse(totalSugarAlcoholsGController.text))
          : const Value.absent(),
      phosphorusPMg: phosphorusPMgController.text.isNotEmpty
          ? Value(double.parse(phosphorusPMgController.text))
          : const Value.absent(),
      sodiumMg: sodiumMgController.text.isNotEmpty
          ? Value(double.parse(sodiumMgController.text))
          : const Value.absent(),
      zincZnMg: zincZnMgController.text.isNotEmpty
          ? Value(double.parse(zincZnMgController.text))
          : const Value.absent(),
      copperCuMg: copperCuMgController.text.isNotEmpty
          ? Value(double.parse(copperCuMgController.text))
          : const Value.absent(),
      manganeseMg: manganeseMgController.text.isNotEmpty
          ? Value(double.parse(manganeseMgController.text))
          : const Value.absent(),
      seleniumSeMcg: seleniumSeMcgController.text.isNotEmpty
          ? Value(double.parse(seleniumSeMcgController.text))
          : const Value.absent(),
      fluorideFMcg: fluorideFMcgController.text.isNotEmpty
          ? Value(double.parse(fluorideFMcgController.text))
          : const Value.absent(),
      molybdenumMcg: molybdenumMcgController.text.isNotEmpty
          ? Value(double.parse(molybdenumMcgController.text))
          : const Value.absent(),
      chlorineMg: chlorineMgController.text.isNotEmpty
          ? Value(double.parse(chlorineMgController.text))
          : const Value.absent(),
      thiaminB1Mg: thiaminB1MgController.text.isNotEmpty
          ? Value(double.parse(thiaminB1MgController.text))
          : const Value.absent(),
      riboflavinB2Mg: riboflavinB2MgController.text.isNotEmpty
          ? Value(double.parse(riboflavinB2MgController.text))
          : const Value.absent(),
      niacinB3Mg: niacinB3MgController.text.isNotEmpty
          ? Value(double.parse(niacinB3MgController.text))
          : const Value.absent(),
      pantothenicAcidB5Mg: pantothenicAcidB5MgController.text.isNotEmpty
          ? Value(double.parse(pantothenicAcidB5MgController.text))
          : const Value.absent(),
      vitaminB6Mg: vitaminB6MgController.text.isNotEmpty
          ? Value(double.parse(vitaminB6MgController.text))
          : const Value.absent(),
      biotinB7Mcg: biotinB7McgController.text.isNotEmpty
          ? Value(double.parse(biotinB7McgController.text))
          : const Value.absent(),
      folateB9Mcg: folateB9McgController.text.isNotEmpty
          ? Value(double.parse(folateB9McgController.text))
          : const Value.absent(),
      folicAcidMcg: folicAcidMcgController.text.isNotEmpty
          ? Value(double.parse(folicAcidMcgController.text))
          : const Value.absent(),
      foodFolateMcg: foodFolateMcgController.text.isNotEmpty
          ? Value(double.parse(foodFolateMcgController.text))
          : const Value.absent(),
      folateDfeMcg: folateDfeMcgController.text.isNotEmpty
          ? Value(double.parse(folateDfeMcgController.text))
          : const Value.absent(),
      cholineMg: cholineMgController.text.isNotEmpty
          ? Value(double.parse(cholineMgController.text))
          : const Value.absent(),
      betaineMg: betaineMgController.text.isNotEmpty
          ? Value(double.parse(betaineMgController.text))
          : const Value.absent(),
      retinolMcg: retinolMcgController.text.isNotEmpty
          ? Value(double.parse(retinolMcgController.text))
          : const Value.absent(),
      caroteneBetaMcg: caroteneBetaMcgController.text.isNotEmpty
          ? Value(double.parse(caroteneBetaMcgController.text))
          : const Value.absent(),
      caroteneAlphaMcg: caroteneAlphaMcgController.text.isNotEmpty
          ? Value(double.parse(caroteneAlphaMcgController.text))
          : const Value.absent(),
      lycopeneMcg: lycopeneMcgController.text.isNotEmpty
          ? Value(double.parse(lycopeneMcgController.text))
          : const Value.absent(),
      luteinZeaxanthinMcg: luteinZeaxanthinMcgController.text.isNotEmpty
          ? Value(double.parse(luteinZeaxanthinMcgController.text))
          : const Value.absent(),
      vitaminD2ErgocalciferolMcg:
          vitaminD2ErgocalciferolMcgController.text.isNotEmpty
              ? Value(double.parse(vitaminD2ErgocalciferolMcgController.text))
              : const Value.absent(),
      vitaminD3CholecalciferolMcg:
          vitaminD3CholecalciferolMcgController.text.isNotEmpty
              ? Value(double.parse(vitaminD3CholecalciferolMcgController.text))
              : const Value.absent(),
      vitaminDIuIu: vitaminDIuIuController.text.isNotEmpty
          ? Value(double.parse(vitaminDIuIuController.text))
          : const Value.absent(),
      vitaminKMcg: vitaminKMcgController.text.isNotEmpty
          ? Value(double.parse(vitaminKMcgController.text))
          : const Value.absent(),
      dihydrophylloquinoneMcg: dihydrophylloquinoneMcgController.text.isNotEmpty
          ? Value(double.parse(dihydrophylloquinoneMcgController.text))
          : const Value.absent(),
      menaquinone4Mcg: menaquinone4McgController.text.isNotEmpty
          ? Value(double.parse(menaquinone4McgController.text))
          : const Value.absent(),
      fattyAcidsTotalMonounsaturatedMg:
          fattyAcidsTotalMonounsaturatedMgController.text.isNotEmpty
              ? Value(
                  double.parse(fattyAcidsTotalMonounsaturatedMgController.text),
                )
              : const Value.absent(),
      fattyAcidsTotalPolyunsaturatedMg:
          fattyAcidsTotalPolyunsaturatedMgController.text.isNotEmpty
              ? Value(
                  double.parse(fattyAcidsTotalPolyunsaturatedMgController.text),
                )
              : const Value.absent(),
      u183N3CCCAlaMg: u183N3CCCAlaMgController.text.isNotEmpty
          ? Value(double.parse(u183N3CCCAlaMgController.text))
          : const Value.absent(),
      u205N3EpaMg: u205N3EpaMgController.text.isNotEmpty
          ? Value(double.parse(u205N3EpaMgController.text))
          : const Value.absent(),
      u225N3DpaMg: u225N3DpaMgController.text.isNotEmpty
          ? Value(double.parse(u225N3DpaMgController.text))
          : const Value.absent(),
      u226N3DhaMg: u226N3DhaMgController.text.isNotEmpty
          ? Value(double.parse(u226N3DhaMgController.text))
          : const Value.absent(),
      tryptophanMg: tryptophanMgController.text.isNotEmpty
          ? Value(double.parse(tryptophanMgController.text))
          : const Value.absent(),
      threonineMg: threonineMgController.text.isNotEmpty
          ? Value(double.parse(threonineMgController.text))
          : const Value.absent(),
      isoleucineMg: isoleucineMgController.text.isNotEmpty
          ? Value(double.parse(isoleucineMgController.text))
          : const Value.absent(),
      leucineMg: leucineMgController.text.isNotEmpty
          ? Value(double.parse(leucineMgController.text))
          : const Value.absent(),
      lysineMg: lysineMgController.text.isNotEmpty
          ? Value(double.parse(lysineMgController.text))
          : const Value.absent(),
      methionineMg: methionineMgController.text.isNotEmpty
          ? Value(double.parse(methionineMgController.text))
          : const Value.absent(),
      cystineMg: cystineMgController.text.isNotEmpty
          ? Value(double.parse(cystineMgController.text))
          : const Value.absent(),
      phenylalanineMg: phenylalanineMgController.text.isNotEmpty
          ? Value(double.parse(phenylalanineMgController.text))
          : const Value.absent(),
      tyrosineMg: tyrosineMgController.text.isNotEmpty
          ? Value(double.parse(tyrosineMgController.text))
          : const Value.absent(),
      valineMg: valineMgController.text.isNotEmpty
          ? Value(double.parse(valineMgController.text))
          : const Value.absent(),
      arginineMg: arginineMgController.text.isNotEmpty
          ? Value(double.parse(arginineMgController.text))
          : const Value.absent(),
      histidineMg: histidineMgController.text.isNotEmpty
          ? Value(double.parse(histidineMgController.text))
          : const Value.absent(),
      alanineMg: alanineMgController.text.isNotEmpty
          ? Value(double.parse(alanineMgController.text))
          : const Value.absent(),
      asparticAcidMg: asparticAcidMgController.text.isNotEmpty
          ? Value(double.parse(asparticAcidMgController.text))
          : const Value.absent(),
      glutamicAcidMg: glutamicAcidMgController.text.isNotEmpty
          ? Value(double.parse(glutamicAcidMgController.text))
          : const Value.absent(),
      glycineMg: glycineMgController.text.isNotEmpty
          ? Value(double.parse(glycineMgController.text))
          : const Value.absent(),
      prolineMg: prolineMgController.text.isNotEmpty
          ? Value(double.parse(prolineMgController.text))
          : const Value.absent(),
      serineMg: serineMgController.text.isNotEmpty
          ? Value(double.parse(serineMgController.text))
          : const Value.absent(),
      hydroxyprolineMg: hydroxyprolineMgController.text.isNotEmpty
          ? Value(double.parse(hydroxyprolineMgController.text))
          : const Value.absent(),
      alcoholG: alcoholGController.text.isNotEmpty
          ? Value(double.parse(alcoholGController.text))
          : const Value.absent(),
      caffeineMg: caffeineMgController.text.isNotEmpty
          ? Value(double.parse(caffeineMgController.text))
          : const Value.absent(),
      theobromineMg: theobromineMgController.text.isNotEmpty
          ? Value(double.parse(theobromineMgController.text))
          : const Value.absent(),
      servingWeight1G: servingWeight1GController.text.isNotEmpty
          ? Value(double.parse(servingWeight1GController.text))
          : const Value.absent(),
      servingDescription1G: servingDescription1GController.text.isNotEmpty
          ? Value(servingDescription1GController.text)
          : const Value.absent(),
      servingWeight2G: servingWeight2GController.text.isNotEmpty
          ? Value(double.parse(servingWeight2GController.text))
          : const Value.absent(),
      servingDescription2G: servingDescription2GController.text.isNotEmpty
          ? Value(servingDescription2GController.text)
          : const Value.absent(),
      servingWeight3G: servingWeight3GController.text.isNotEmpty
          ? Value(double.parse(servingWeight3GController.text))
          : const Value.absent(),
      servingDescription3G: servingDescription3GController.text.isNotEmpty
          ? Value(servingDescription3GController.text)
          : const Value.absent(),
      servingWeight4G: servingWeight4GController.text.isNotEmpty
          ? Value(double.parse(servingWeight4GController.text))
          : const Value.absent(),
      servingDescription4G: servingDescription4GController.text.isNotEmpty
          ? Value(servingDescription4GController.text)
          : const Value.absent(),
      servingWeight5G: servingWeight5GController.text.isNotEmpty
          ? Value(double.parse(servingWeight5GController.text))
          : const Value.absent(),
      servingDescription5G: servingDescription5GController.text.isNotEmpty
          ? Value(servingDescription5GController.text)
          : const Value.absent(),
      servingWeight6G: servingWeight6GController.text.isNotEmpty
          ? Value(double.parse(servingWeight6GController.text))
          : const Value.absent(),
      servingDescription6G: servingDescription6GController.text.isNotEmpty
          ? Value(servingDescription6GController.text)
          : const Value.absent(),
      servingWeight7G: servingWeight7GController.text.isNotEmpty
          ? Value(double.parse(servingWeight7GController.text))
          : const Value.absent(),
      servingDescription7G: servingDescription7GController.text.isNotEmpty
          ? Value(servingDescription7GController.text)
          : const Value.absent(),
      servingWeight8G: servingWeight8GController.text.isNotEmpty
          ? Value(double.parse(servingWeight8GController.text))
          : const Value.absent(),
      servingDescription8G: servingDescription8GController.text.isNotEmpty
          ? Value(servingDescription8GController.text)
          : const Value.absent(),
      servingWeight9G: servingWeight9GController.text.isNotEmpty
          ? Value(double.parse(servingWeight9GController.text))
          : const Value.absent(),
      servingDescription9G: servingDescription9GController.text.isNotEmpty
          ? Value(servingDescription9GController.text)
          : const Value.absent(),
      u200calorieWeightG: u200calorieWeightGController.text.isNotEmpty
          ? Value(double.parse(u200calorieWeightGController.text))
          : const Value.absent(),
    );

    if (widget.food != null)
      db.update(db.foods).replace(
            food.copyWith(
              id: Value(widget.food!.id),
            ),
          );
    else
      db.into(db.foods).insert(food);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.food != null ? 'Edit entry' : 'Add entry',
        ),
        actions: [
          if (widget.food != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: Text(
                        'Are you sure you want to delete ${widget.food!.name}?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(dialogContext);
                          },
                        ),
                        TextButton(
                          child: const Text('Delete'),
                          onPressed: () async {
                            Navigator.pop(dialogContext);
                            await db.delete(db.foods).delete(widget.food!);
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
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: foodGroupController,
              decoration: const InputDecoration(
                labelText: 'Food Group',
              ),
            ),
            TextField(
              controller: caloriesController,
              decoration: const InputDecoration(
                labelText: 'Calories',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: fatGController,
              decoration: const InputDecoration(
                labelText: 'Fat (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: proteinGController,
              decoration: const InputDecoration(
                labelText: 'Protein (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: carbohydrateGController,
              decoration: const InputDecoration(
                labelText: 'Carbohydrate (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: sugarsGController,
              decoration: const InputDecoration(
                labelText: 'Sugars (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: fiberGController,
              decoration: const InputDecoration(
                labelText: 'Fiber (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: cholesterolMgController,
              decoration: const InputDecoration(
                labelText: 'Cholesterol (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: saturatedFatsGController,
              decoration: const InputDecoration(
                labelText: 'Saturated Fats (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: calciumMgController,
              decoration: const InputDecoration(
                labelText: 'Calcium (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: ironFeMgController,
              decoration: const InputDecoration(
                labelText: 'Iron (Fe mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: potassiumKMgController,
              decoration: const InputDecoration(
                labelText: 'Potassium (K mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: magnesiumMgController,
              decoration: const InputDecoration(
                labelText: 'Magnesium (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminAIuIuController,
              decoration: const InputDecoration(
                labelText: 'Vitamin A (IU)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminARaeMcgController,
              decoration: const InputDecoration(
                labelText: 'Vitamin A (RAE mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminCMgController,
              decoration: const InputDecoration(
                labelText: 'Vitamin C (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminB12McgController,
              decoration: const InputDecoration(
                labelText: 'Vitamin B12 (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminDMcgController,
              decoration: const InputDecoration(
                labelText: 'Vitamin D (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminEAlphaTocopherolMgController,
              decoration: const InputDecoration(
                labelText: 'Vitamin E Alpha Tocopherol (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: addedSugarGController,
              decoration: const InputDecoration(
                labelText: 'Added Sugar (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: netCarbsGController,
              decoration: const InputDecoration(
                labelText: 'Net Carbs (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: waterGController,
              decoration: const InputDecoration(
                labelText: 'Water (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: omega3sMgController,
              decoration: const InputDecoration(
                labelText: 'Omega 3s (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: omega6sMgController,
              decoration: const InputDecoration(
                labelText: 'Omega 6s (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: pralScoreController,
              decoration: const InputDecoration(
                labelText: 'PRAL Score',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: transFattyAcidsGController,
              decoration: const InputDecoration(
                labelText: 'Trans Fatty Acids (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: solubleFiberGController,
              decoration: const InputDecoration(
                labelText: 'Soluble Fiber (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: insolubleFiberGController,
              decoration: const InputDecoration(
                labelText: 'Insoluble Fiber (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: sucroseGController,
              decoration: const InputDecoration(
                labelText: 'Sucrose (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: glucoseDextroseGController,
              decoration: const InputDecoration(
                labelText: 'Glucose Dextrose (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: fructoseGController,
              decoration: const InputDecoration(
                labelText: 'Fructose (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: lactoseGController,
              decoration: const InputDecoration(
                labelText: 'Lactose (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: maltoseGController,
              decoration: const InputDecoration(
                labelText: 'Maltose (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: galactoseGController,
              decoration: const InputDecoration(
                labelText: 'Galactose (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: starchGController,
              decoration: const InputDecoration(
                labelText: 'Starch (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: totalSugarAlcoholsGController,
              decoration: const InputDecoration(
                labelText: 'Total Sugar Alcohols (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: phosphorusPMgController,
              decoration: const InputDecoration(
                labelText: 'Phosphorus (P mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: sodiumMgController,
              decoration: const InputDecoration(
                labelText: 'Sodium (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: zincZnMgController,
              decoration: const InputDecoration(
                labelText: 'Zinc (Zn mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: copperCuMgController,
              decoration: const InputDecoration(
                labelText: 'Copper (Cu mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: manganeseMgController,
              decoration: const InputDecoration(
                labelText: 'Manganese (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: seleniumSeMcgController,
              decoration: const InputDecoration(
                labelText: 'Selenium (Se mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: fluorideFMcgController,
              decoration: const InputDecoration(
                labelText: 'Fluoride (F mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: molybdenumMcgController,
              decoration: const InputDecoration(
                labelText: 'Molybdenum (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: chlorineMgController,
              decoration: const InputDecoration(
                labelText: 'Chlorine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: thiaminB1MgController,
              decoration: const InputDecoration(
                labelText: 'Thiamin B1 (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: riboflavinB2MgController,
              decoration: const InputDecoration(
                labelText: 'Riboflavin B2 (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: niacinB3MgController,
              decoration: const InputDecoration(
                labelText: 'Niacin B3 (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: pantothenicAcidB5MgController,
              decoration: const InputDecoration(
                labelText: 'Pantothenic Acid B5 (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminB6MgController,
              decoration: const InputDecoration(
                labelText: 'Vitamin B6 (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: biotinB7McgController,
              decoration: const InputDecoration(
                labelText: 'Biotin B7 (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: folateB9McgController,
              decoration: const InputDecoration(
                labelText: 'Folate B9 (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: folicAcidMcgController,
              decoration: const InputDecoration(
                labelText: 'Folic Acid (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: foodFolateMcgController,
              decoration: const InputDecoration(
                labelText: 'Food Folate (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: folateDfeMcgController,
              decoration: const InputDecoration(
                labelText: 'Folate DFE (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: cholineMgController,
              decoration: const InputDecoration(
                labelText: 'Choline (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: betaineMgController,
              decoration: const InputDecoration(
                labelText: 'Betaine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: retinolMcgController,
              decoration: const InputDecoration(
                labelText: 'Retinol (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: caroteneBetaMcgController,
              decoration: const InputDecoration(
                labelText: 'Carotene Beta (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: caroteneAlphaMcgController,
              decoration: const InputDecoration(
                labelText: 'Carotene Alpha (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: lycopeneMcgController,
              decoration: const InputDecoration(
                labelText: 'Lycopene (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: luteinZeaxanthinMcgController,
              decoration: const InputDecoration(
                labelText: 'Lutein Zeaxanthin (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminD2ErgocalciferolMcgController,
              decoration: const InputDecoration(
                labelText: 'Vitamin D2 Ergocalciferol (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminD3CholecalciferolMcgController,
              decoration: const InputDecoration(
                labelText: 'Vitamin D3 Cholecalciferol (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminDIuIuController,
              decoration: const InputDecoration(
                labelText: 'Vitamin D (IU)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: vitaminKMcgController,
              decoration: const InputDecoration(
                labelText: 'Vitamin K (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: dihydrophylloquinoneMcgController,
              decoration: const InputDecoration(
                labelText: 'Dihydrophylloquinone (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: menaquinone4McgController,
              decoration: const InputDecoration(
                labelText: 'Menaquinone 4 (mcg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: fattyAcidsTotalMonounsaturatedMgController,
              decoration: const InputDecoration(
                labelText: 'Fatty Acids Total Monounsaturated (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: fattyAcidsTotalPolyunsaturatedMgController,
              decoration: const InputDecoration(
                labelText: 'Fatty Acids Total Polyunsaturated (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: u183N3CCCAlaMgController,
              decoration: const InputDecoration(
                labelText: '18:3 n-3 c,c,c ALA (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: u205N3EpaMgController,
              decoration: const InputDecoration(
                labelText: '20:5 n-3 EPA (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: u225N3DpaMgController,
              decoration: const InputDecoration(
                labelText: '22:5 n-3 DPA (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: u226N3DhaMgController,
              decoration: const InputDecoration(
                labelText: '22:6 n-3 DHA (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: tryptophanMgController,
              decoration: const InputDecoration(
                labelText: 'Tryptophan (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: threonineMgController,
              decoration: const InputDecoration(
                labelText: 'Threonine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: isoleucineMgController,
              decoration: const InputDecoration(
                labelText: 'Isoleucine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: leucineMgController,
              decoration: const InputDecoration(
                labelText: 'Leucine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: lysineMgController,
              decoration: const InputDecoration(
                labelText: 'Lysine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: methionineMgController,
              decoration: const InputDecoration(
                labelText: 'Methionine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: cystineMgController,
              decoration: const InputDecoration(
                labelText: 'Cystine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: phenylalanineMgController,
              decoration: const InputDecoration(
                labelText: 'Phenylalanine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: tyrosineMgController,
              decoration: const InputDecoration(
                labelText: 'Tyrosine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: valineMgController,
              decoration: const InputDecoration(
                labelText: 'Valine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: arginineMgController,
              decoration: const InputDecoration(
                labelText: 'Arginine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: histidineMgController,
              decoration: const InputDecoration(
                labelText: 'Histidine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: alanineMgController,
              decoration: const InputDecoration(
                labelText: 'Alanine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: asparticAcidMgController,
              decoration: const InputDecoration(
                labelText: 'Aspartic Acid (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: glutamicAcidMgController,
              decoration: const InputDecoration(
                labelText: 'Glutamic Acid (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: glycineMgController,
              decoration: const InputDecoration(
                labelText: 'Glycine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: prolineMgController,
              decoration: const InputDecoration(
                labelText: 'Proline (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: serineMgController,
              decoration: const InputDecoration(
                labelText: 'Serine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: hydroxyprolineMgController,
              decoration: const InputDecoration(
                labelText: 'Hydroxyproline (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: alcoholGController,
              decoration: const InputDecoration(
                labelText: 'Alcohol (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: caffeineMgController,
              decoration: const InputDecoration(
                labelText: 'Caffeine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: theobromineMgController,
              decoration: const InputDecoration(
                labelText: 'Theobromine (mg)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingWeight1GController,
              decoration: const InputDecoration(
                labelText: 'Serving Weight 1 (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingDescription1GController,
              decoration: const InputDecoration(
                labelText: 'Serving Description 1',
              ),
            ),
            TextField(
              controller: servingWeight2GController,
              decoration: const InputDecoration(
                labelText: 'Serving Weight 2 (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingDescription2GController,
              decoration: const InputDecoration(
                labelText: 'Serving Description 2',
              ),
            ),
            TextField(
              controller: servingWeight3GController,
              decoration: const InputDecoration(
                labelText: 'Serving Weight 3 (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingDescription3GController,
              decoration: const InputDecoration(
                labelText: 'Serving Description 3',
              ),
            ),
            TextField(
              controller: servingWeight4GController,
              decoration: const InputDecoration(
                labelText: 'Serving Weight 4 (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingDescription4GController,
              decoration: const InputDecoration(
                labelText: 'Serving Description 4',
              ),
            ),
            TextField(
              controller: servingWeight5GController,
              decoration: const InputDecoration(
                labelText: 'Serving Weight 5 (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingDescription5GController,
              decoration: const InputDecoration(
                labelText: 'Serving Description 5',
              ),
            ),
            TextField(
              controller: servingWeight6GController,
              decoration: const InputDecoration(
                labelText: 'Serving Weight 6 (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingDescription6GController,
              decoration: const InputDecoration(
                labelText: 'Serving Description 6',
              ),
            ),
            TextField(
              controller: servingWeight7GController,
              decoration: const InputDecoration(
                labelText: 'Serving Weight 7 (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingDescription7GController,
              decoration: const InputDecoration(
                labelText: 'Serving Description 7',
              ),
            ),
            TextField(
              controller: servingWeight8GController,
              decoration: const InputDecoration(
                labelText: 'Serving Weight 8 (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingDescription8GController,
              decoration: const InputDecoration(
                labelText: 'Serving Description 8',
              ),
            ),
            TextField(
              controller: servingWeight9GController,
              decoration: const InputDecoration(
                labelText: 'Serving Weight 9 (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: servingDescription9GController,
              decoration: const InputDecoration(
                labelText: 'Serving Description 9',
              ),
            ),
            TextField(
              controller: u200calorieWeightGController,
              decoration: const InputDecoration(
                labelText: '200 Calorie Weight (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _save,
        child: const Icon(Icons.save),
      ),
    );
  }
}
