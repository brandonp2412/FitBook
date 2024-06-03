import 'package:drift/native.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

mockTests() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({
    "themeMode": "ThemeMode.dark",
    "systemColors": false,
  });
  db = AppDatabase(
    executor: NativeDatabase.memory(),
    testing: true,
  );
}

findTextWidget(FinderBase<Element> of) => find
    .ancestor(
      matching: find.byType(TextField),
      of: of,
    )
    .evaluate()
    .first
    .widget as TextField;
