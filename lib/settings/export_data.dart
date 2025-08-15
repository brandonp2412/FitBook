import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ExportData extends StatefulWidget {
  const ExportData({
    super.key,
  });

  @override
  State<ExportData> createState() => _ExportDataState();
}

class _ExportDataState extends State<ExportData> {
  bool exporting = false;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.date_range),
                  title: const Text('Diary'),
                  onTap: () async {
                    setState(() {
                      exporting = true;
                    });
                    Navigator.pop(context);
                    try {
                      final diaries = await db.diaries.select().get();

                      final List<List<dynamic>> csvData = [
                        [
                          'id',
                          'food',
                          'created',
                          'quantity',
                          'unit',
                          'kCalories',
                          'proteinG',
                          'fatG',
                          'carbG',
                        ]
                      ];
                      for (var entry in diaries) {
                        csvData.add([
                          entry.id,
                          entry.food,
                          entry.created,
                          entry.quantity,
                          entry.unit,
                        ]);
                      }
                      final csv =
                          const ListToCsvConverter(eol: '\n').convert(csvData);
                      final bytes = Uint8List.fromList(csv.codeUnits);
                      await FilePicker.platform.saveFile(
                        fileName: 'diary.csv',
                        bytes: bytes,
                      );
                    } finally {
                      if (mounted)
                        setState(() {
                          exporting = false;
                        });
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.restaurant),
                  title: const Text('Foods'),
                  onTap: () async {
                    setState(() {
                      exporting = true;
                    });
                    Navigator.pop(context);

                    try {
                      final foods = await db.foods.select().get();

                      final List<List<dynamic>> csvData = [
                        foodFields,
                      ];

                      for (var food in foods) {
                        csvData.add([
                          food.id,
                          food.name,
                          food.foodGroup,
                          food.calories,
                          food.fatG,
                          food.proteinG,
                          food.carbohydrateG,
                          food.sugarsG,
                          food.fiberG,
                          food.cholesterolMg,
                          food.saturatedFatsG,
                          food.calciumMg,
                          food.ironFeMg,
                          food.potassiumKMg,
                          food.magnesiumMg,
                          food.vitaminAIuIu,
                          food.vitaminARaeMcg,
                          food.vitaminCMg,
                          food.vitaminB12Mcg,
                          food.vitaminDMcg,
                          food.vitaminEAlphaTocopherolMg,
                          food.addedSugarG,
                          food.netCarbsG,
                          food.waterG,
                          food.omega3sMg,
                          food.omega6sMg,
                          food.pralScore,
                          food.transFattyAcidsG,
                          food.solubleFiberG,
                          food.insolubleFiberG,
                          food.sucroseG,
                          food.glucoseDextroseG,
                          food.fructoseG,
                          food.lactoseG,
                          food.maltoseG,
                          food.galactoseG,
                          food.starchG,
                          food.totalSugarAlcoholsG,
                          food.phosphorusPMg,
                          food.sodiumMg,
                          food.zincZnMg,
                          food.copperCuMg,
                          food.manganeseMg,
                          food.seleniumSeMcg,
                          food.fluorideFMcg,
                          food.molybdenumMcg,
                          food.chlorineMg,
                          food.thiaminB1Mg,
                          food.riboflavinB2Mg,
                          food.niacinB3Mg,
                          food.pantothenicAcidB5Mg,
                          food.vitaminB6Mg,
                          food.biotinB7Mcg,
                          food.folateB9Mcg,
                          food.folicAcidMcg,
                          food.foodFolateMcg,
                          food.folateDfeMcg,
                          food.cholineMg,
                          food.betaineMg,
                          food.retinolMcg,
                          food.caroteneBetaMcg,
                          food.caroteneAlphaMcg,
                          food.lycopeneMcg,
                          food.luteinZeaxanthinMcg,
                          food.vitaminD2ErgocalciferolMcg,
                          food.vitaminD3CholecalciferolMcg,
                          food.vitaminDIuIu,
                          food.vitaminKMcg,
                          food.dihydrophylloquinoneMcg,
                          food.menaquinone4Mcg,
                          food.fattyAcidsTotalMonounsaturatedMg,
                          food.fattyAcidsTotalPolyunsaturatedMg,
                          food.u183N3CCCAlaMg,
                          food.u205N3EpaMg,
                          food.u225N3DpaMg,
                          food.u226N3DhaMg,
                          food.tryptophanMg,
                          food.threonineMg,
                          food.isoleucineMg,
                          food.leucineMg,
                          food.lysineMg,
                          food.methionineMg,
                          food.cystineMg,
                          food.phenylalanineMg,
                          food.tyrosineMg,
                          food.valineMg,
                          food.arginineMg,
                          food.histidineMg,
                          food.alanineMg,
                          food.asparticAcidMg,
                          food.glutamicAcidMg,
                          food.glycineMg,
                          food.prolineMg,
                          food.serineMg,
                          food.hydroxyprolineMg,
                          food.alcoholG,
                          food.caffeineMg,
                          food.theobromineMg,
                          food.servingWeight1G,
                          food.servingDescription1G,
                          food.servingWeight2G,
                          food.servingDescription2G,
                          food.servingWeight3G,
                          food.servingDescription3G,
                          food.servingWeight4G,
                          food.servingDescription4G,
                          food.servingWeight5G,
                          food.servingDescription5G,
                          food.servingWeight6G,
                          food.servingDescription6G,
                          food.servingWeight7G,
                          food.servingDescription7G,
                          food.servingWeight8G,
                          food.servingDescription8G,
                          food.servingWeight9G,
                          food.servingDescription9G,
                          food.u200calorieWeightG,
                          food.favorite,
                          food.servingUnit,
                          food.servingSize,
                          food.created?.toIso8601String() ?? "",
                        ]);
                      }
                      final csv = const ListToCsvConverter(eol: '\n')
                          .convert(csvData, convertNullTo: "");
                      final bytes = Uint8List.fromList(csv.codeUnits);
                      await FilePicker.platform.saveFile(
                        fileName: 'foods.csv',
                        bytes: bytes,
                      );
                    } finally {
                      if (mounted)
                        setState(() {
                          exporting = false;
                        });
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('Database'),
                  onTap: () async {
                    Navigator.pop(context);
                    final dbFolder = await getApplicationDocumentsDirectory();
                    final file = File(p.join(dbFolder.path, 'fitbook.sqlite'));
                    final bytes = await file.readAsBytes();
                    await FilePicker.platform.saveFile(
                      fileName: 'fitbook.sqlite',
                      bytes: bytes,
                    );
                  },
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.download),
      label: exporting
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            )
          : const Text('Export data'),
    );
  }
}
