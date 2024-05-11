import 'package:drift/drift.dart';

// These additional imports are necessary to open the sqlite3 database
import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

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
  RealColumn get vitaminAReaMcg => real().nullable()();
  RealColumn get vitaminCMg => real().nullable()();
  RealColumn get vitaminB12Mcg => real().nullable()();
  RealColumn get vitaminDMcg => real().nullable()();
  RealColumn get vitaminEAlphaTocopherolMg => real().nullable()();
  RealColumn get addedSugarG => real().nullable()();
  RealColumn get netCarbsG => real().nullable()();
  RealColumn get waterG => real().nullable()();
  RealColumn get omega3sMg => real().nullable()();
  RealColumn get omega6sMg => real().nullable()();
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
  RealColumn get panthothenicAcidB5Mg => real().nullable()();
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
  RealColumn get menaquinone4Mcg => real().nullable()();
  RealColumn get fattyAcidsTotalMonounsaturatedMg => real().nullable()();
  RealColumn get fattyAcidsTotalPolyunsaturatedMg => real().nullable()();
  RealColumn get u183N3CCCAlaMg => real().named('_183N3CCCAlaMg').nullable()();
  RealColumn get u205N3EpaMg => real().named('_205N3EpaMg').nullable()();
  RealColumn get u225N3DpaMg => real().named('_225N3DpaMg').nullable()();
  RealColumn get u226N3DhaMg => real().named('_226N3DhaMg').nullable()();
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
  RealColumn get theobromingMg => real().nullable()();
  RealColumn get servingWeight1G => real().nullable()();
  TextColumn get servingDescription1G =>
      text().withLength(min: 0, max: 191).nullable()();
  RealColumn get servingWeight2G => real().nullable()();
  TextColumn get servingDescription2G =>
      text().withLength(min: 0, max: 191).nullable()();
  RealColumn get servingWeight3G => real().nullable()();
  TextColumn get servingDescription3G =>
      text().withLength(min: 0, max: 191).nullable()();
  RealColumn get servingWeight4G => real().nullable()();
  TextColumn get servingDescription4G =>
      text().withLength(min: 0, max: 191).nullable()();
  RealColumn get servingWeight5G => real().nullable()();
  TextColumn get servingDescription5G =>
      text().withLength(min: 0, max: 191).nullable()();
  RealColumn get servingWeight6G => real().nullable()();
  TextColumn get servingDescription6G =>
      text().withLength(min: 0, max: 191).nullable()();
  RealColumn get servingWeight7G => real().nullable()();
  TextColumn get servingDescription7G =>
      text().withLength(min: 0, max: 191).nullable()();
  RealColumn get servingWeight8G => real().nullable()();
  TextColumn get servingDescription8G =>
      text().withLength(min: 0, max: 191).nullable()();
  RealColumn get servingWeight9G => real().nullable()();
  TextColumn get servingDescription9G =>
      text().withLength(min: 0, max: 191).nullable()();
  RealColumn get u200calorieWeightG =>
      real().named('_200calorieWeightG').nullable()();
}

@DriftDatabase(tables: [Foods])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fitbook.sqlite'));

    if (!await file.exists()) {
      final blob = await rootBundle.load('assets/fitbook.sqlite');
      await file.writeAsBytes(
          blob.buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file,
        logStatements: kDebugMode ? true : false);
  });
}
