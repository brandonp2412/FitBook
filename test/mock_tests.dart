import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

mockTests() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  db = AppDatabase(
    executor: NativeDatabase.memory(),
  );
  await (db.settings.insertOnConflictUpdate(
    SettingsCompanion.insert(
      id: const Value(1),
      longDateFormat: "dd/MM/yy",
      shortDateFormat: 'd/M/yy',
      entryUnit: 'serving',
      foodUnit: 'grams',
      themeMode: ThemeMode.system.toString(),
      curveLines: false,
      diarySummary: DiarySummary.division.toString(),
      favoriteNew: false,
      notifications: false,
      selectEntryOnSubmit: false,
      showOthers: false,
      systemColors: false,
      showImages: const Value(false),
    ),
  ));
}

findTextWidget(FinderBase<Element> of) => find
    .ancestor(
      matching: find.byType(TextField),
      of: of,
    )
    .evaluate()
    .first
    .widget as TextField;
