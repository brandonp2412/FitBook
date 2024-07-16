import 'dart:io';

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/search_open_food_facts.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

class EditFoodPage extends StatefulWidget {
  final int? id;

  const EditFoodPage({super.key, this.id});

  @override
  createState() => _EditFoodPageState();
}

class _EditFoodPageState extends State<EditFoodPage> {
  late Setting settings;
  late String servingUnit;
  String? imageFile;

  final barcodeController = TextEditingController();
  final nameController = TextEditingController();
  final foodGroupController = TextEditingController();
  final smallImageController = TextEditingController();
  final bigImageController = TextEditingController();
  final caloriesController = TextEditingController(text: "0");
  final kilojoulesController = TextEditingController(text: "0");
  final fatGController = TextEditingController(text: "0");
  final proteinGController = TextEditingController(text: "0");
  final carbohydrateGController = TextEditingController(text: "0");
  final sugarsGController = TextEditingController(text: "0");
  final fiberGController = TextEditingController(text: "0");
  final cholesterolMgController = TextEditingController(text: "0");
  final saturatedFatsGController = TextEditingController(text: "0");
  final calciumMgController = TextEditingController(text: "0");
  final ironFeMgController = TextEditingController(text: "0");
  final potassiumKMgController = TextEditingController(text: "0");
  final magnesiumMgController = TextEditingController(text: "0");
  final vitaminAIuIuController = TextEditingController(text: "0");
  final vitaminARaeMcgController = TextEditingController(text: "0");
  final vitaminCMgController = TextEditingController(text: "0");
  final vitaminB12McgController = TextEditingController(text: "0");
  final vitaminDMcgController = TextEditingController(text: "0");
  final vitaminEAlphaTocopherolMgController = TextEditingController(text: "0");
  final addedSugarGController = TextEditingController(text: "0");
  final netCarbsGController = TextEditingController(text: "0");
  final waterGController = TextEditingController(text: "0");
  final omega3sMgController = TextEditingController(text: "0");
  final omega6sMgController = TextEditingController(text: "0");
  final pralScoreController = TextEditingController(text: "0");
  final transFattyAcidsGController = TextEditingController(text: "0");
  final solubleFiberGController = TextEditingController(text: "0");
  final insolubleFiberGController = TextEditingController(text: "0");
  final sucroseGController = TextEditingController(text: "0");
  final glucoseDextroseGController = TextEditingController(text: "0");
  final fructoseGController = TextEditingController(text: "0");
  final lactoseGController = TextEditingController(text: "0");
  final maltoseGController = TextEditingController(text: "0");
  final galactoseGController = TextEditingController(text: "0");
  final starchGController = TextEditingController(text: "0");
  final totalSugarAlcoholsGController = TextEditingController(text: "0");
  final phosphorusPMgController = TextEditingController(text: "0");
  final sodiumMgController = TextEditingController(text: "0");
  final zincZnMgController = TextEditingController(text: "0");
  final copperCuMgController = TextEditingController(text: "0");
  final manganeseMgController = TextEditingController(text: "0");
  final seleniumSeMcgController = TextEditingController(text: "0");
  final fluorideFMcgController = TextEditingController(text: "0");
  final molybdenumMcgController = TextEditingController(text: "0");
  final chlorineMgController = TextEditingController(text: "0");
  final thiaminB1MgController = TextEditingController(text: "0");
  final riboflavinB2MgController = TextEditingController(text: "0");
  final niacinB3MgController = TextEditingController(text: "0");
  final pantothenicAcidB5MgController = TextEditingController(text: "0");
  final vitaminB6MgController = TextEditingController(text: "0");
  final biotinB7McgController = TextEditingController(text: "0");
  final folateB9McgController = TextEditingController(text: "0");
  final folicAcidMcgController = TextEditingController(text: "0");
  final foodFolateMcgController = TextEditingController(text: "0");
  final folateDfeMcgController = TextEditingController(text: "0");
  final cholineMgController = TextEditingController(text: "0");
  final betaineMgController = TextEditingController(text: "0");
  final retinolMcgController = TextEditingController(text: "0");
  final caroteneBetaMcgController = TextEditingController(text: "0");
  final caroteneAlphaMcgController = TextEditingController(text: "0");
  final lycopeneMcgController = TextEditingController(text: "0");
  final luteinZeaxanthinMcgController = TextEditingController(text: "0");
  final vitaminD2ErgocalciferolMcgController = TextEditingController(text: "0");
  final vitaminD3CholecalciferolMcgController =
      TextEditingController(text: "0");
  final vitaminDIuIuController = TextEditingController(text: "0");
  final vitaminKMcgController = TextEditingController(text: "0");
  final dihydrophylloquinoneMcgController = TextEditingController(text: "0");
  final menaquinone4McgController = TextEditingController(text: "0");
  final fattyAcidsTotalMonounsaturatedMgController =
      TextEditingController(text: "0");
  final fattyAcidsTotalPolyunsaturatedMgController =
      TextEditingController(text: "0");
  final u183N3CCCAlaMgController = TextEditingController(text: "0");
  final u205N3EpaMgController = TextEditingController(text: "0");
  final u225N3DpaMgController = TextEditingController(text: "0");
  final u226N3DhaMgController = TextEditingController(text: "0");
  final tryptophanMgController = TextEditingController(text: "0");
  final threonineMgController = TextEditingController(text: "0");
  final isoleucineMgController = TextEditingController(text: "0");
  final leucineMgController = TextEditingController(text: "0");
  final lysineMgController = TextEditingController(text: "0");
  final methionineMgController = TextEditingController(text: "0");
  final cystineMgController = TextEditingController(text: "0");
  final phenylalanineMgController = TextEditingController(text: "0");
  final tyrosineMgController = TextEditingController(text: "0");
  final valineMgController = TextEditingController(text: "0");
  final arginineMgController = TextEditingController(text: "0");
  final histidineMgController = TextEditingController(text: "0");
  final alanineMgController = TextEditingController(text: "0");
  final asparticAcidMgController = TextEditingController(text: "0");
  final glutamicAcidMgController = TextEditingController(text: "0");
  final glycineMgController = TextEditingController(text: "0");
  final prolineMgController = TextEditingController(text: "0");
  final serineMgController = TextEditingController(text: "0");
  final hydroxyprolineMgController = TextEditingController(text: "0");
  final alcoholGController = TextEditingController(text: "0");
  final caffeineMgController = TextEditingController(text: "0");
  final theobromineMgController = TextEditingController(text: "0");
  final servingWeight1GController = TextEditingController(text: "0");
  final servingDescription1GController = TextEditingController(text: "0");
  final servingWeight2GController = TextEditingController(text: "0");
  final servingDescription2GController = TextEditingController(text: "0");
  final servingWeight3GController = TextEditingController(text: "0");
  final servingDescription3GController = TextEditingController(text: "0");
  final servingWeight4GController = TextEditingController(text: "0");
  final servingDescription4GController = TextEditingController(text: "0");
  final servingWeight5GController = TextEditingController(text: "0");
  final servingDescription5GController = TextEditingController(text: "0");
  final servingWeight6GController = TextEditingController(text: "0");
  final servingDescription6GController = TextEditingController(text: "0");
  final servingWeight7GController = TextEditingController(text: "0");
  final servingDescription7GController = TextEditingController(text: "0");
  final servingWeight8GController = TextEditingController(text: "0");
  final servingDescription8GController = TextEditingController(text: "0");
  final servingWeight9GController = TextEditingController(text: "0");
  final servingDescription9GController = TextEditingController(text: "0");
  final u200calorieWeightGController = TextEditingController(text: "0");
  final servingSizeController = TextEditingController(text: '100');

  @override
  void initState() {
    super.initState();
    settings = context.read<SettingsState>().value;
    servingUnit = settings.foodUnit;
    if (servingUnit == 'serving')
      servingSizeController.text = '1';
    else if (servingUnit == 'grams') servingSizeController.text = '100';

    if (widget.id == null) return;

    (db.foods.select()..where((u) => u.id.equals(widget.id!)))
        .getSingle()
        .then((food) {
      setState(() {
        barcodeController.text = food.barcode ?? '';
        servingUnit = food.servingUnit ?? servingUnit;
        nameController.text = food.name;
        smallImageController.text = food.smallImage ?? '';
        bigImageController.text = food.bigImage ?? '';
        imageFile = food.imageFile;
        foodGroupController.text = food.foodGroup ?? '';
        caloriesController.text = food.calories?.toString() ?? '';
        kilojoulesController.text = food.calories == null
            ? ''
            : (food.calories! * 4.184).toStringAsFixed(2);
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
        transFattyAcidsGController.text =
            food.transFattyAcidsG?.toString() ?? '';
        solubleFiberGController.text = food.solubleFiberG?.toString() ?? '';
        insolubleFiberGController.text = food.insolubleFiberG?.toString() ?? '';
        sucroseGController.text = food.sucroseG?.toString() ?? '';
        glucoseDextroseGController.text =
            food.glucoseDextroseG?.toString() ?? '';
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
        caroteneAlphaMcgController.text =
            food.caroteneAlphaMcg?.toString() ?? '';
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
        hydroxyprolineMgController.text =
            food.hydroxyprolineMg?.toString() ?? '';
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
        servingSizeController.text = food.servingSize?.toString() ?? '';
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    smallImageController.dispose();
    bigImageController.dispose();
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

  Future<void> save() async {
    Navigator.pop(context);
    var food = FoodsCompanion.insert(
      name: nameController.text,
      barcode: Value(barcodeController.text),
      smallImage: Value(smallImageController.text),
      bigImage: Value(bigImageController.text),
      imageFile: Value(imageFile),
      foodGroup: Value(foodGroupController.text),
      calories: Value(double.tryParse(caloriesController.text)),
      fatG: Value(double.tryParse(fatGController.text)),
      proteinG: Value(double.tryParse(proteinGController.text)),
      carbohydrateG: Value(double.tryParse(carbohydrateGController.text)),
      sugarsG: Value(double.tryParse(sugarsGController.text)),
      fiberG: Value(double.tryParse(fiberGController.text)),
      cholesterolMg: Value(double.tryParse(cholesterolMgController.text)),
      saturatedFatsG: Value(double.tryParse(saturatedFatsGController.text)),
      calciumMg: Value(double.tryParse(calciumMgController.text)),
      ironFeMg: Value(double.tryParse(ironFeMgController.text)),
      potassiumKMg: Value(double.tryParse(potassiumKMgController.text)),
      magnesiumMg: Value(double.tryParse(magnesiumMgController.text)),
      vitaminAIuIu: Value(double.tryParse(vitaminAIuIuController.text)),
      vitaminARaeMcg: Value(double.tryParse(vitaminARaeMcgController.text)),
      vitaminCMg: Value(double.tryParse(vitaminCMgController.text)),
      vitaminB12Mcg: Value(double.tryParse(vitaminB12McgController.text)),
      vitaminDMcg: Value(double.tryParse(vitaminDMcgController.text)),
      vitaminEAlphaTocopherolMg:
          Value(double.tryParse(vitaminEAlphaTocopherolMgController.text)),
      addedSugarG: Value(double.tryParse(addedSugarGController.text)),
      netCarbsG: Value(double.tryParse(netCarbsGController.text)),
      waterG: Value(double.tryParse(waterGController.text)),
      omega3sMg: Value(double.tryParse(omega3sMgController.text)),
      omega6sMg: Value(double.tryParse(omega6sMgController.text)),
      pralScore: Value(double.tryParse(pralScoreController.text)),
      transFattyAcidsG: Value(double.tryParse(transFattyAcidsGController.text)),
      solubleFiberG: Value(double.tryParse(solubleFiberGController.text)),
      insolubleFiberG: Value(double.tryParse(insolubleFiberGController.text)),
      sucroseG: Value(double.tryParse(sucroseGController.text)),
      glucoseDextroseG: Value(double.tryParse(glucoseDextroseGController.text)),
      fructoseG: Value(double.tryParse(fructoseGController.text)),
      lactoseG: Value(double.tryParse(lactoseGController.text)),
      maltoseG: Value(double.tryParse(maltoseGController.text)),
      galactoseG: Value(double.tryParse(galactoseGController.text)),
      starchG: Value(double.tryParse(starchGController.text)),
      totalSugarAlcoholsG:
          Value(double.tryParse(totalSugarAlcoholsGController.text)),
      phosphorusPMg: Value(double.tryParse(phosphorusPMgController.text)),
      sodiumMg: Value(double.tryParse(sodiumMgController.text)),
      zincZnMg: Value(double.tryParse(zincZnMgController.text)),
      copperCuMg: Value(double.tryParse(copperCuMgController.text)),
      manganeseMg: Value(double.tryParse(manganeseMgController.text)),
      seleniumSeMcg: Value(double.tryParse(seleniumSeMcgController.text)),
      fluorideFMcg: Value(double.tryParse(fluorideFMcgController.text)),
      molybdenumMcg: Value(double.tryParse(molybdenumMcgController.text)),
      chlorineMg: Value(double.tryParse(chlorineMgController.text)),
      thiaminB1Mg: Value(double.tryParse(thiaminB1MgController.text)),
      riboflavinB2Mg: Value(double.tryParse(riboflavinB2MgController.text)),
      niacinB3Mg: Value(double.tryParse(niacinB3MgController.text)),
      pantothenicAcidB5Mg:
          Value(double.tryParse(pantothenicAcidB5MgController.text)),
      vitaminB6Mg: Value(double.tryParse(vitaminB6MgController.text)),
      biotinB7Mcg: Value(double.tryParse(biotinB7McgController.text)),
      folateB9Mcg: Value(double.tryParse(folateB9McgController.text)),
      folicAcidMcg: Value(double.tryParse(folicAcidMcgController.text)),
      foodFolateMcg: Value(double.tryParse(foodFolateMcgController.text)),
      folateDfeMcg: Value(double.tryParse(folateDfeMcgController.text)),
      cholineMg: Value(double.tryParse(cholineMgController.text)),
      betaineMg: Value(double.tryParse(betaineMgController.text)),
      retinolMcg: Value(double.tryParse(retinolMcgController.text)),
      caroteneBetaMcg: Value(double.tryParse(caroteneBetaMcgController.text)),
      caroteneAlphaMcg: Value(double.tryParse(caroteneAlphaMcgController.text)),
      lycopeneMcg: Value(double.tryParse(lycopeneMcgController.text)),
      luteinZeaxanthinMcg:
          Value(double.tryParse(luteinZeaxanthinMcgController.text)),
      vitaminD2ErgocalciferolMcg:
          Value(double.tryParse(vitaminD2ErgocalciferolMcgController.text)),
      vitaminD3CholecalciferolMcg:
          Value(double.tryParse(vitaminD3CholecalciferolMcgController.text)),
      vitaminDIuIu: Value(double.tryParse(vitaminDIuIuController.text)),
      vitaminKMcg: Value(double.tryParse(vitaminKMcgController.text)),
      dihydrophylloquinoneMcg:
          Value(double.tryParse(dihydrophylloquinoneMcgController.text)),
      menaquinone4Mcg: Value(double.tryParse(menaquinone4McgController.text)),
      fattyAcidsTotalMonounsaturatedMg: Value(
        double.tryParse(fattyAcidsTotalMonounsaturatedMgController.text),
      ),
      fattyAcidsTotalPolyunsaturatedMg: Value(
        double.tryParse(fattyAcidsTotalPolyunsaturatedMgController.text),
      ),
      u183N3CCCAlaMg: Value(double.tryParse(u183N3CCCAlaMgController.text)),
      u205N3EpaMg: Value(double.tryParse(u205N3EpaMgController.text)),
      u225N3DpaMg: Value(double.tryParse(u225N3DpaMgController.text)),
      u226N3DhaMg: Value(double.tryParse(u226N3DhaMgController.text)),
      tryptophanMg: Value(double.tryParse(tryptophanMgController.text)),
      threonineMg: Value(double.tryParse(threonineMgController.text)),
      isoleucineMg: Value(double.tryParse(isoleucineMgController.text)),
      leucineMg: Value(double.tryParse(leucineMgController.text)),
      lysineMg: Value(double.tryParse(lysineMgController.text)),
      methionineMg: Value(double.tryParse(methionineMgController.text)),
      cystineMg: Value(double.tryParse(cystineMgController.text)),
      phenylalanineMg: Value(double.tryParse(phenylalanineMgController.text)),
      tyrosineMg: Value(double.tryParse(tyrosineMgController.text)),
      valineMg: Value(double.tryParse(valineMgController.text)),
      arginineMg: Value(double.tryParse(arginineMgController.text)),
      histidineMg: Value(double.tryParse(histidineMgController.text)),
      alanineMg: Value(double.tryParse(alanineMgController.text)),
      asparticAcidMg: Value(double.tryParse(asparticAcidMgController.text)),
      glutamicAcidMg: Value(double.tryParse(glutamicAcidMgController.text)),
      glycineMg: Value(double.tryParse(glycineMgController.text)),
      prolineMg: Value(double.tryParse(prolineMgController.text)),
      serineMg: Value(double.tryParse(serineMgController.text)),
      hydroxyprolineMg: Value(double.tryParse(hydroxyprolineMgController.text)),
      alcoholG: Value(double.tryParse(alcoholGController.text)),
      caffeineMg: Value(double.tryParse(caffeineMgController.text)),
      theobromineMg: Value(double.tryParse(theobromineMgController.text)),
      servingWeight1G: Value(double.tryParse(servingWeight1GController.text)),
      servingDescription1G: Value(servingDescription1GController.text),
      servingWeight2G: Value(double.tryParse(servingWeight2GController.text)),
      servingDescription2G: Value(servingDescription2GController.text),
      servingWeight3G: Value(double.tryParse(servingWeight3GController.text)),
      servingDescription3G: Value(servingDescription3GController.text),
      servingWeight4G: Value(double.tryParse(servingWeight4GController.text)),
      servingDescription4G: Value(servingDescription4GController.text),
      servingWeight5G: Value(double.tryParse(servingWeight5GController.text)),
      servingDescription5G: Value(servingDescription5GController.text),
      servingWeight6G: Value(double.tryParse(servingWeight6GController.text)),
      servingDescription6G: Value(servingDescription6GController.text),
      servingWeight7G: Value(double.tryParse(servingWeight7GController.text)),
      servingDescription7G: Value(servingDescription7GController.text),
      servingWeight8G: Value(double.tryParse(servingWeight8GController.text)),
      servingDescription8G: Value(servingDescription8GController.text),
      servingWeight9G: Value(double.tryParse(servingWeight9GController.text)),
      servingDescription9G: Value(servingDescription9GController.text),
      u200calorieWeightG:
          Value(double.tryParse(u200calorieWeightGController.text)),
      servingUnit: Value(servingUnit),
      servingSize: Value(double.tryParse(servingSizeController.text)),
      created: Value(DateTime.now()),
    );

    if (widget.id != null)
      db.update(db.foods).replace(
            food.copyWith(
              id: Value(widget.id!),
            ),
          );
    else
      db.into(db.foods).insert(
            food.copyWith(
              favorite: Value(settings.favoriteNew),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    settings = context.watch<SettingsState>().value;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id != null ? 'Edit food' : 'Add food',
        ),
        actions: [
          if (widget.id == null && (Platform.isAndroid || Platform.isIOS))
            ScanBarcode(
              onBarcode: (value) {
                setState(() {
                  barcodeController.text = value;
                });
                Fluttertoast.showToast(
                  msg: "Barcode not found. Save to insert.",
                );
              },
              onFood: (food) {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditFoodPage(id: food.id),
                  ),
                );
              },
            ),
          if (widget.id != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text('Confirm delete'),
                      content: Text(
                        'Are you sure you want to delete ${nameController.text}?',
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
                            await db.foods.deleteWhere(
                              (tbl) => tbl.id.equals(widget.id!),
                            );
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
              autofocus: widget.id == null,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    Food food = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SearchOpenFoodFacts(),
                      ),
                    );
                    if (!context.mounted) return;
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFoodPage(id: food.id),
                      ),
                    );
                  },
                ),
              ),
              onSubmitted: (_) => selectAll(caloriesController),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: caloriesController,
              decoration: const InputDecoration(
                labelText: 'Calories (kcal)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                kilojoulesController.text =
                    (double.parse(value) * 4.184).toStringAsFixed(2);
              },
              onTap: () => selectAll(caloriesController),
              onSubmitted: (_) => selectAll(kilojoulesController),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: kilojoulesController,
              decoration: const InputDecoration(
                labelText: 'Kilojoules (kj)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                caloriesController.text =
                    (double.parse(value) / 4.184).toStringAsFixed(2);
              },
              onSubmitted: (_) => selectAll(proteinGController),
              onTap: () => selectAll(kilojoulesController),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: proteinGController,
              decoration: const InputDecoration(
                labelText: 'Protein (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => selectAll(carbohydrateGController),
              onTap: () => selectAll(proteinGController),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: carbohydrateGController,
              decoration: const InputDecoration(
                labelText: 'Carbohydrate (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => selectAll(fatGController),
              onTap: () => selectAll(carbohydrateGController),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: fatGController,
              decoration: const InputDecoration(
                labelText: 'Fat (g)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => selectAll(servingWeight1GController),
              onTap: () => selectAll(fatGController),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: servingSizeController,
              decoration: const InputDecoration(
                labelText: 'Serving size',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onTap: () => selectAll(servingSizeController),
              textInputAction: TextInputAction.next,
            ),
            DropdownButtonFormField<String>(
              value: servingUnit,
              decoration: const InputDecoration(labelText: 'Serving unit'),
              items: units.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  servingUnit = newValue!;
                });
              },
            ),
            if (settings.showImages) ...[
              const SizedBox(height: 8),
              TextButton.icon(
                icon: const Icon(Icons.image),
                label: const Text('Set image'),
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);
                  final path = result?.files.single.path;
                  if (path == null) return;
                  setState(() {
                    imageFile = path;
                  });
                },
              ),
            ],
            if (imageFile?.isNotEmpty == true && settings.showImages)
              Image.file(
                File(imageFile!),
                errorBuilder: (context, error, stackTrace) => TextButton.icon(
                  onPressed: () {},
                  label: const Text('Image error'),
                  icon: const Icon(Icons.error),
                ),
              ),
            if (imageFile != null && settings.showImages)
              TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text("Remove image"),
                onPressed: () => setState(() {
                  imageFile = null;
                }),
              ),
            TextField(
              controller: barcodeController,
              decoration: const InputDecoration(
                labelText: 'Barcode',
              ),
            ),
            ListTile(
              title: const Text('Show other fields'),
              onTap: () => db.settings.update().write(
                    SettingsCompanion(showOthers: Value(!settings.showOthers)),
                  ),
              trailing: Switch(
                value: settings.showOthers,
                onChanged: (value) => db.settings.update().write(
                      SettingsCompanion(showOthers: Value(value)),
                    ),
              ),
            ),
            if (settings.showOthers) ...[
              if (settings.showImages) ...[
                TextField(
                  controller: bigImageController,
                  decoration: const InputDecoration(
                    labelText: 'Big image URL',
                  ),
                ),
                TextField(
                  controller: smallImageController,
                  decoration: const InputDecoration(
                    labelText: 'Small image URL',
                  ),
                ),
              ],
              TextField(
                controller: foodGroupController,
                decoration: const InputDecoration(
                  labelText: 'Food Group',
                ),
              ),
              TextField(
                controller: servingDescription1GController,
                decoration: const InputDecoration(
                  labelText: 'Serving Description 1',
                ),
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
                  labelText: 'Serving weight 1 (g)',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onTap: () => selectAll(servingWeight1GController),
                textInputAction: TextInputAction.next,
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        tooltip: 'Save',
        child: const Icon(Icons.save),
      ),
    );
  }
}
