import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/entries_state.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ImportData extends StatefulWidget {
  final BuildContext pageContext;

  const ImportData({
    super.key,
    required this.pageContext,
  });

  @override
  State<ImportData> createState() => _ImportDataState();
}

class _ImportDataState extends State<ImportData> {
  bool _importing = false;

  _importFoods(BuildContext context) async {
    Navigator.pop(context);

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      setState(() {
        _importing = true;
      });

      File file = File(result!.files.single.path!);
      String csv;
      try {
        csv = await file.readAsString(encoding: utf8);
      } catch (error) {
        csv = await file.readAsString(encoding: latin1);
      }
      List<List<dynamic>> rows =
          const CsvToListConverter(eol: "\n").convert(csv);

      List<FoodsCompanion> foods = [];
      for (final row in rows.skip(1)) {
        foods.add(
          FoodsCompanion(
            id: Value(row[0]),
            name: Value(row[1]),
            foodGroup: Value(row[2]),
            calories:
                Value(row[3] is String ? double.tryParse(row[3]) : row[3]),
            fatG: Value(row[4] is String ? double.tryParse(row[4]) : row[4]),
            proteinG:
                Value(row[5] is String ? double.tryParse(row[5]) : row[5]),
            carbohydrateG:
                Value(row[6] is String ? double.tryParse(row[6]) : row[6]),
            sugarsG: Value(row[7] is String ? double.tryParse(row[7]) : row[7]),
            fiberG: Value(row[8] is String ? double.tryParse(row[8]) : row[8]),
            cholesterolMg:
                Value(row[9] is String ? double.tryParse(row[9]) : row[9]),
            saturatedFatsG:
                Value(row[10] is String ? double.tryParse(row[10]) : row[10]),
            calciumMg:
                Value(row[11] is String ? double.tryParse(row[11]) : row[11]),
            ironFeMg:
                Value(row[12] is String ? double.tryParse(row[12]) : row[12]),
            potassiumKMg:
                Value(row[13] is String ? double.tryParse(row[13]) : row[13]),
            magnesiumMg:
                Value(row[14] is String ? double.tryParse(row[14]) : row[14]),
            vitaminAIuIu:
                Value(row[15] is String ? double.tryParse(row[15]) : row[15]),
            vitaminARaeMcg:
                Value(row[16] is String ? double.tryParse(row[16]) : row[16]),
            vitaminCMg:
                Value(row[17] is String ? double.tryParse(row[17]) : row[17]),
            vitaminB12Mcg:
                Value(row[18] is String ? double.tryParse(row[18]) : row[18]),
            vitaminDMcg:
                Value(row[19] is String ? double.tryParse(row[19]) : row[19]),
            vitaminEAlphaTocopherolMg:
                Value(row[20] is String ? double.tryParse(row[20]) : row[20]),
            addedSugarG:
                Value(row[21] is String ? double.tryParse(row[21]) : row[21]),
            netCarbsG:
                Value(row[22] is String ? double.tryParse(row[22]) : row[22]),
            waterG:
                Value(row[23] is String ? double.tryParse(row[23]) : row[23]),
            omega3sMg:
                Value(row[24] is String ? double.tryParse(row[24]) : row[24]),
            omega6sMg:
                Value(row[25] is String ? double.tryParse(row[25]) : row[25]),
            pralScore:
                Value(row[26] is String ? double.tryParse(row[26]) : row[26]),
            transFattyAcidsG:
                Value(row[27] is String ? double.tryParse(row[27]) : row[27]),
            solubleFiberG:
                Value(row[28] is String ? double.tryParse(row[28]) : row[28]),
            insolubleFiberG:
                Value(row[29] is String ? double.tryParse(row[29]) : row[29]),
            sucroseG:
                Value(row[30] is String ? double.tryParse(row[30]) : row[30]),
            glucoseDextroseG:
                Value(row[31] is String ? double.tryParse(row[31]) : row[31]),
            fructoseG:
                Value(row[32] is String ? double.tryParse(row[32]) : row[32]),
            lactoseG:
                Value(row[33] is String ? double.tryParse(row[33]) : row[33]),
            maltoseG:
                Value(row[34] is String ? double.tryParse(row[34]) : row[34]),
            galactoseG:
                Value(row[35] is String ? double.tryParse(row[35]) : row[35]),
            starchG:
                Value(row[36] is String ? double.tryParse(row[36]) : row[36]),
            totalSugarAlcoholsG:
                Value(row[37] is String ? double.tryParse(row[37]) : row[37]),
            phosphorusPMg:
                Value(row[38] is String ? double.tryParse(row[38]) : row[38]),
            sodiumMg:
                Value(row[39] is String ? double.tryParse(row[39]) : row[39]),
            zincZnMg:
                Value(row[40] is String ? double.tryParse(row[40]) : row[40]),
            copperCuMg:
                Value(row[41] is String ? double.tryParse(row[41]) : row[41]),
            manganeseMg:
                Value(row[42] is String ? double.tryParse(row[42]) : row[42]),
            seleniumSeMcg:
                Value(row[43] is String ? double.tryParse(row[43]) : row[43]),
            fluorideFMcg:
                Value(row[44] is String ? double.tryParse(row[44]) : row[44]),
            molybdenumMcg:
                Value(row[45] is String ? double.tryParse(row[45]) : row[45]),
            chlorineMg:
                Value(row[46] is String ? double.tryParse(row[46]) : row[46]),
            thiaminB1Mg:
                Value(row[47] is String ? double.tryParse(row[47]) : row[47]),
            riboflavinB2Mg:
                Value(row[48] is String ? double.tryParse(row[48]) : row[48]),
            niacinB3Mg:
                Value(row[49] is String ? double.tryParse(row[49]) : row[49]),
            pantothenicAcidB5Mg:
                Value(row[50] is String ? double.tryParse(row[50]) : row[50]),
            vitaminB6Mg:
                Value(row[51] is String ? double.tryParse(row[51]) : row[51]),
            biotinB7Mcg:
                Value(row[52] is String ? double.tryParse(row[52]) : row[52]),
            folateB9Mcg:
                Value(row[53] is String ? double.tryParse(row[53]) : row[53]),
            folicAcidMcg:
                Value(row[54] is String ? double.tryParse(row[54]) : row[54]),
            foodFolateMcg:
                Value(row[55] is String ? double.tryParse(row[55]) : row[55]),
            folateDfeMcg:
                Value(row[56] is String ? double.tryParse(row[56]) : row[56]),
            cholineMg:
                Value(row[57] is String ? double.tryParse(row[57]) : row[57]),
            betaineMg:
                Value(row[58] is String ? double.tryParse(row[58]) : row[58]),
            retinolMcg:
                Value(row[59] is String ? double.tryParse(row[59]) : row[59]),
            caroteneBetaMcg:
                Value(row[60] is String ? double.tryParse(row[60]) : row[60]),
            caroteneAlphaMcg:
                Value(row[61] is String ? double.tryParse(row[61]) : row[61]),
            lycopeneMcg:
                Value(row[62] is String ? double.tryParse(row[62]) : row[62]),
            luteinZeaxanthinMcg:
                Value(row[63] is String ? double.tryParse(row[63]) : row[63]),
            vitaminD2ErgocalciferolMcg:
                Value(row[64] is String ? double.tryParse(row[64]) : row[64]),
            vitaminD3CholecalciferolMcg:
                Value(row[65] is String ? double.tryParse(row[65]) : row[65]),
            vitaminDIuIu:
                Value(row[66] is String ? double.tryParse(row[66]) : row[66]),
            vitaminKMcg:
                Value(row[67] is String ? double.tryParse(row[67]) : row[67]),
            dihydrophylloquinoneMcg:
                Value(row[68] is String ? double.tryParse(row[68]) : row[68]),
            menaquinone4Mcg:
                Value(row[69] is String ? double.tryParse(row[69]) : row[69]),
            fattyAcidsTotalMonounsaturatedMg:
                Value(row[70] is String ? double.tryParse(row[70]) : row[70]),
            fattyAcidsTotalPolyunsaturatedMg:
                Value(row[71] is String ? double.tryParse(row[71]) : row[71]),
            u183N3CCCAlaMg:
                Value(row[72] is String ? double.tryParse(row[72]) : row[72]),
            u205N3EpaMg:
                Value(row[73] is String ? double.tryParse(row[73]) : row[73]),
            u225N3DpaMg:
                Value(row[74] is String ? double.tryParse(row[74]) : row[74]),
            u226N3DhaMg:
                Value(row[75] is String ? double.tryParse(row[75]) : row[75]),
            tryptophanMg:
                Value(row[76] is String ? double.tryParse(row[76]) : row[76]),
            threonineMg:
                Value(row[77] is String ? double.tryParse(row[77]) : row[77]),
            isoleucineMg:
                Value(row[78] is String ? double.tryParse(row[78]) : row[78]),
            leucineMg:
                Value(row[79] is String ? double.tryParse(row[79]) : row[79]),
            lysineMg:
                Value(row[80] is String ? double.tryParse(row[80]) : row[80]),
            methionineMg:
                Value(row[81] is String ? double.tryParse(row[81]) : row[81]),
            cystineMg:
                Value(row[82] is String ? double.tryParse(row[82]) : row[82]),
            phenylalanineMg:
                Value(row[83] is String ? double.tryParse(row[83]) : row[83]),
            tyrosineMg:
                Value(row[84] is String ? double.tryParse(row[84]) : row[84]),
            valineMg:
                Value(row[85] is String ? double.tryParse(row[85]) : row[85]),
            arginineMg:
                Value(row[86] is String ? double.tryParse(row[86]) : row[86]),
            histidineMg:
                Value(row[87] is String ? double.tryParse(row[87]) : row[87]),
            alanineMg:
                Value(row[88] is String ? double.tryParse(row[88]) : row[88]),
            asparticAcidMg:
                Value(row[89] is String ? double.tryParse(row[89]) : row[89]),
            glutamicAcidMg:
                Value(row[90] is String ? double.tryParse(row[90]) : row[90]),
            glycineMg:
                Value(row[91] is String ? double.tryParse(row[91]) : row[91]),
            prolineMg:
                Value(row[92] is String ? double.tryParse(row[92]) : row[92]),
            serineMg:
                Value(row[93] is String ? double.tryParse(row[93]) : row[93]),
            hydroxyprolineMg:
                Value(row[94] is String ? double.tryParse(row[94]) : row[94]),
            alcoholG:
                Value(row[95] is String ? double.tryParse(row[95]) : row[95]),
            caffeineMg:
                Value(row[96] is String ? double.tryParse(row[96]) : row[96]),
            theobromineMg:
                Value(row[97] is String ? double.tryParse(row[97]) : row[97]),
            servingWeight1G:
                Value(row[98] is String ? double.tryParse(row[98]) : row[98]),
            servingDescription1G: Value(row[99]),
            servingWeight2G: Value(
              row[100] is String ? double.tryParse(row[100]) : row[100],
            ),
            servingDescription2G: Value(row[101]),
            servingWeight3G: Value(
              row[102] is String ? double.tryParse(row[102]) : row[102],
            ),
            servingDescription3G: Value(row[103]),
            servingWeight4G: Value(
              row[104] is String ? double.tryParse(row[104]) : row[104],
            ),
            servingDescription4G: Value(row[105]),
            servingWeight5G: Value(
              row[106] is String ? double.tryParse(row[106]) : row[106],
            ),
            servingDescription5G: Value(row[107]),
            servingWeight6G: Value(
              row[108] is String ? double.tryParse(row[108]) : row[108],
            ),
            servingDescription6G: Value(row[109]),
            servingWeight7G: Value(
              row[110] is String ? double.tryParse(row[110]) : row[110],
            ),
            servingDescription7G: Value(row[111]),
            servingWeight8G: Value(
              row[112] is String ? double.tryParse(row[112]) : row[112],
            ),
            servingDescription8G: Value(row[113]),
            servingWeight9G: Value(
              row[114] is String ? double.tryParse(row[114]) : row[114],
            ),
            servingDescription9G: Value(row[115]),
            u200calorieWeightG: Value(
              row[116] is String ? double.tryParse(row[116]) : row[116],
            ),
            favorite: Value(bool.tryParse(row[117])),
          ),
        );
      }

      await db.foods.deleteAll();
      await db.foods.insertAll(foods);
      if (widget.pageContext.mounted)
        Navigator.pushNamedAndRemoveUntil(
          widget.pageContext,
          '/',
          (_) => false,
        );
    } catch (error) {
      print(error);
    } finally {
      if (mounted)
        setState(() {
          _importing = false;
        });
    }
  }

  _importDatabase(BuildContext context) async {
    final entriesState = context.read<EntriesState>();
    Navigator.pop(context);
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    File sourceFile = File(result.files.single.path!);
    final dbFolder = await getApplicationDocumentsDirectory();
    await db.close();
    await sourceFile.copy(p.join(dbFolder.path, 'fitbook.sqlite'));
    db = AppDatabase();
    if (!widget.pageContext.mounted) return;
    Navigator.pop(widget.pageContext);
    entriesState.setStream('', 100);
  }

  _importEntries(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    setState(() {
      _importing = true;
    });

    File file = File(result!.files.single.path!);
    String csv;
    try {
      csv = await file.readAsString(encoding: utf8);
    } catch (error) {
      csv = await file.readAsString(encoding: latin1);
    }
    List<List<dynamic>> rows = const CsvToListConverter(eol: "\n").convert(csv);

    List<EntriesCompanion> entries = [];
    for (final row in rows.skip(1)) {
      entries.add(
        EntriesCompanion(
          id: Value(row[0]),
          food: Value(row[1]),
          created: Value(DateTime.parse(row[2])),
          quantity: Value(row[3] is String ? double.tryParse(row[3]) : row[3]),
          unit: Value(row[4]),
          kCalories: Value(row[5] is String ? double.tryParse(row[5]) : row[5]),
          proteinG: Value(row[6] is String ? double.tryParse(row[6]) : row[6]),
          fatG: Value(row[7] is String ? double.tryParse(row[7]) : row[7]),
          carbG: Value(row[8] is String ? double.tryParse(row[8]) : row[8]),
        ),
      );
    }

    await db.entries.deleteAll();
    await db.entries.insertAll(entries);
    if (widget.pageContext.mounted)
      Navigator.pushNamedAndRemoveUntil(
        widget.pageContext,
        '/',
        (_) => false,
      );
  }

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
                  onTap: () => _importEntries(context),
                ),
                ListTile(
                  leading: const Icon(Icons.restaurant),
                  title: const Text('Foods'),
                  onTap: () => _importFoods(context),
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('Database'),
                  onTap: () => _importDatabase(context),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.upload),
      label: _importing
          ? const CircularProgressIndicator()
          : const Text('Import data'),
    );
  }
}
