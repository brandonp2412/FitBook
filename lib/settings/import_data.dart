import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

double? _parseDouble(dynamic val) =>
    val is String ? double.tryParse(val) : val as double?;

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
  bool importing = false;

  Future<void> _importFoods(BuildContext context) async {
    Navigator.pop(context);

    try {
      FilePickerResult? result = await FilePicker.pickFiles();
      setState(() {
        importing = true;
      });

      File file = File(result!.files.single.path!);
      String csv;
      try {
        csv = await file.readAsString(encoding: utf8);
      } catch (error) {
        csv = await file.readAsString(encoding: latin1);
      }

      final codec = Csv(lineDelimiter: '\n');
      final rows = codec.decode(csv);

      List<FoodsCompanion> foods = [];
      for (final row in rows.skip(1)) {
        foods.add(
          FoodsCompanion(
            id: Value(row[0]),
            name: Value(row[1]),
            foodGroup: Value(row[2]),
            calories: Value(_parseDouble(row[3])),
            fatG: Value(_parseDouble(row[4])),
            proteinG: Value(_parseDouble(row[5])),
            carbohydrateG: Value(_parseDouble(row[6])),
            sugarsG: Value(_parseDouble(row[7])),
            fiberG: Value(_parseDouble(row[8])),
            cholesterolMg: Value(_parseDouble(row[9])),
            saturatedFatsG: Value(_parseDouble(row[10])),
            calciumMg: Value(_parseDouble(row[11])),
            ironFeMg: Value(_parseDouble(row[12])),
            potassiumKMg: Value(_parseDouble(row[13])),
            magnesiumMg: Value(_parseDouble(row[14])),
            vitaminAIuIu: Value(_parseDouble(row[15])),
            vitaminARaeMcg: Value(_parseDouble(row[16])),
            vitaminCMg: Value(_parseDouble(row[17])),
            vitaminB12Mcg: Value(_parseDouble(row[18])),
            vitaminDMcg: Value(_parseDouble(row[19])),
            vitaminEAlphaTocopherolMg: Value(_parseDouble(row[20])),
            addedSugarG: Value(_parseDouble(row[21])),
            netCarbsG: Value(_parseDouble(row[22])),
            waterG: Value(_parseDouble(row[23])),
            omega3sMg: Value(_parseDouble(row[24])),
            omega6sMg: Value(_parseDouble(row[25])),
            pralScore: Value(_parseDouble(row[26])),
            transFattyAcidsG: Value(_parseDouble(row[27])),
            solubleFiberG: Value(_parseDouble(row[28])),
            insolubleFiberG: Value(_parseDouble(row[29])),
            sucroseG: Value(_parseDouble(row[30])),
            glucoseDextroseG: Value(_parseDouble(row[31])),
            fructoseG: Value(_parseDouble(row[32])),
            lactoseG: Value(_parseDouble(row[33])),
            maltoseG: Value(_parseDouble(row[34])),
            galactoseG: Value(_parseDouble(row[35])),
            starchG: Value(_parseDouble(row[36])),
            totalSugarAlcoholsG: Value(_parseDouble(row[37])),
            phosphorusPMg: Value(_parseDouble(row[38])),
            sodiumMg: Value(_parseDouble(row[39])),
            zincZnMg: Value(_parseDouble(row[40])),
            copperCuMg: Value(_parseDouble(row[41])),
            manganeseMg: Value(_parseDouble(row[42])),
            seleniumSeMcg: Value(_parseDouble(row[43])),
            fluorideFMcg: Value(_parseDouble(row[44])),
            molybdenumMcg: Value(_parseDouble(row[45])),
            chlorineMg: Value(_parseDouble(row[46])),
            thiaminB1Mg: Value(_parseDouble(row[47])),
            riboflavinB2Mg: Value(_parseDouble(row[48])),
            niacinB3Mg: Value(_parseDouble(row[49])),
            pantothenicAcidB5Mg: Value(_parseDouble(row[50])),
            vitaminB6Mg: Value(_parseDouble(row[51])),
            biotinB7Mcg: Value(_parseDouble(row[52])),
            folateB9Mcg: Value(_parseDouble(row[53])),
            folicAcidMcg: Value(_parseDouble(row[54])),
            foodFolateMcg: Value(_parseDouble(row[55])),
            folateDfeMcg: Value(_parseDouble(row[56])),
            cholineMg: Value(_parseDouble(row[57])),
            betaineMg: Value(_parseDouble(row[58])),
            retinolMcg: Value(_parseDouble(row[59])),
            caroteneBetaMcg: Value(_parseDouble(row[60])),
            caroteneAlphaMcg: Value(_parseDouble(row[61])),
            lycopeneMcg: Value(_parseDouble(row[62])),
            luteinZeaxanthinMcg: Value(_parseDouble(row[63])),
            vitaminD2ErgocalciferolMcg: Value(_parseDouble(row[64])),
            vitaminD3CholecalciferolMcg: Value(_parseDouble(row[65])),
            vitaminDIuIu: Value(_parseDouble(row[66])),
            vitaminKMcg: Value(_parseDouble(row[67])),
            dihydrophylloquinoneMcg: Value(_parseDouble(row[68])),
            menaquinone4Mcg: Value(_parseDouble(row[69])),
            fattyAcidsTotalMonounsaturatedMg: Value(_parseDouble(row[70])),
            fattyAcidsTotalPolyunsaturatedMg: Value(_parseDouble(row[71])),
            u183N3CCCAlaMg: Value(_parseDouble(row[72])),
            u205N3EpaMg: Value(_parseDouble(row[73])),
            u225N3DpaMg: Value(_parseDouble(row[74])),
            u226N3DhaMg: Value(_parseDouble(row[75])),
            tryptophanMg: Value(_parseDouble(row[76])),
            threonineMg: Value(_parseDouble(row[77])),
            isoleucineMg: Value(_parseDouble(row[78])),
            leucineMg: Value(_parseDouble(row[79])),
            lysineMg: Value(_parseDouble(row[80])),
            methionineMg: Value(_parseDouble(row[81])),
            cystineMg: Value(_parseDouble(row[82])),
            phenylalanineMg: Value(_parseDouble(row[83])),
            tyrosineMg: Value(_parseDouble(row[84])),
            valineMg: Value(_parseDouble(row[85])),
            arginineMg: Value(_parseDouble(row[86])),
            histidineMg: Value(_parseDouble(row[87])),
            alanineMg: Value(_parseDouble(row[88])),
            asparticAcidMg: Value(_parseDouble(row[89])),
            glutamicAcidMg: Value(_parseDouble(row[90])),
            glycineMg: Value(_parseDouble(row[91])),
            prolineMg: Value(_parseDouble(row[92])),
            serineMg: Value(_parseDouble(row[93])),
            hydroxyprolineMg: Value(_parseDouble(row[94])),
            alcoholG: Value(_parseDouble(row[95])),
            caffeineMg: Value(_parseDouble(row[96])),
            theobromineMg: Value(_parseDouble(row[97])),
            servingWeight1G: Value(_parseDouble(row[98])),
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
            servingUnit: Value(row[118]),
            servingSize: Value(
              row[119] is String ? double.tryParse(row[119]) : row[119],
            ),
            created: Value(
              row[120] is String ? DateTime.tryParse(row[120]) : row[120],
            ),
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
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Failed to import data"),
          action: SnackBarAction(
            label: 'Copy error',
            onPressed: () {
              Clipboard.setData(ClipboardData(text: error.toString()));
            },
          ),
        ),
      );
    } finally {
      if (mounted)
        setState(() {
          importing = false;
        });
    }
  }

  Future<void> _importDatabase(BuildContext context) async {
    final entriesState = context.read<DiaryState>();
    final settingsState = context.read<SettingsState>();
    Navigator.pop(context);
    FilePickerResult? result = await FilePicker.pickFiles();
    if (result == null) return;

    File sourceFile = File(result.files.single.path!);
    final dbFolder = await getApplicationDocumentsDirectory();
    await db.close();
    await sourceFile.copy(p.join(dbFolder.path, 'fitbook.sqlite'));
    db = AppDatabase();
    if (!widget.pageContext.mounted) return;
    Navigator.pop(widget.pageContext);
    entriesState.limit = 100;
    settingsState.setSubscription();
  }

  Future<void> _importEntries(BuildContext context) async {
    FilePickerResult? result = await FilePicker.pickFiles();
    setState(() {
      importing = true;
    });

    File file = File(result!.files.single.path!);
    String csv;
    try {
      csv = await file.readAsString(encoding: utf8);
    } catch (error) {
      csv = await file.readAsString(encoding: latin1);
    }
    final codec = Csv(lineDelimiter: '\n');
    final rows = codec.decode(csv);

    List<DiariesCompanion> diaries = [];
    for (final row in rows.skip(1)) {
      diaries.add(
        DiariesCompanion(
          id: Value(row[0]),
          food: Value(row[1]),
          created: Value(DateTime.parse(row[2])),
          quantity: Value(_parseDouble(row[3]) ?? 1.0),
          unit: Value(row[4]),
        ),
      );
    }

    await db.diaries.deleteAll();
    await db.diaries.insertAll(diaries);
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
            return SafeArea(
              child: Wrap(
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
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.upload),
      label: importing
          ? const CircularProgressIndicator()
          : const Text('Import data'),
    );
  }
}
