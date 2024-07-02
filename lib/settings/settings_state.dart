import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';

class SettingsState extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  String longDateFormat = 'dd/MM/yy';
  String shortDateFormat = 'd/M/yy';
  String entryUnit = 'serving';
  String foodUnit = 'grams';
  DiarySummary diarySummary = DiarySummary.division;

  bool systemColors = false;
  bool curveLines = false;
  bool showOthers = false;
  bool favoriteNew = false;
  bool selectEntryOnSubmit = false;
  bool notifications = false;

  int? dailyCalories;
  int? dailyProtein;
  int? dailyFat;
  int? dailyCarbs;
  double? targetWeight;

  SettingsState(Setting settings) {
    longDateFormat = settings.longDateFormat;
    shortDateFormat = settings.shortDateFormat;
    entryUnit = settings.entryUnit;
    foodUnit = settings.foodUnit;

    final theme = settings.themeMode;
    if (theme == "ThemeMode.system")
      themeMode = ThemeMode.system;
    else if (theme == "ThemeMode.light")
      themeMode = ThemeMode.light;
    else if (theme == "ThemeMode.dark") themeMode = ThemeMode.dark;

    for (final summary in DiarySummary.values)
      if (settings.diarySummary == summary.toString()) diarySummary = summary;

    systemColors = settings.systemColors;
    favoriteNew = settings.favoriteNew;
    curveLines = settings.curveLines;
    showOthers = settings.showOthers;
    selectEntryOnSubmit = settings.selectEntryOnSubmit;
    notifications = settings.notifications;

    dailyCalories = settings.dailyCalories;
    dailyProtein = settings.dailyProtein;
    dailyFat = settings.dailyFat;
    dailyCarbs = settings.dailyCarb;
    targetWeight = settings.targetWeight;
  }

  void setFoodUnit(String value) {
    foodUnit = value;
    notifyListeners();
    (db.settings.update()).write(SettingsCompanion(foodUnit: Value(value)));
  }

  void setEntryUnit(String value) {
    entryUnit = value;
    notifyListeners();
    (db.settings.update()).write(SettingsCompanion(entryUnit: Value(value)));
  }

  void setDiarySummary(DiarySummary value) {
    diarySummary = value;
    notifyListeners();
    (db.settings.update())
        .write(SettingsCompanion(diarySummary: Value(value.toString())));
  }

  void setNotifications(bool value) async {
    notifications = value;
    (db.settings.update())
        .write(SettingsCompanion(notifications: Value(value)));
    notifyListeners();
  }

  void setSelectEntryOnSubmit(bool value) {
    selectEntryOnSubmit = value;
    (db.settings.update())
        .write(SettingsCompanion(selectEntryOnSubmit: Value(value)));
    notifyListeners();
  }

  void setFavoriteNew(bool value) {
    favoriteNew = value;
    (db.settings.update()).write(SettingsCompanion(favoriteNew: Value(value)));
    notifyListeners();
  }

  void setShowOthers(bool value) {
    showOthers = value;
    (db.settings.update()).write(SettingsCompanion(showOthers: Value(value)));
    notifyListeners();
  }

  void setTargetWeight(double? value) {
    targetWeight = value;
    (db.settings.update()).write(SettingsCompanion(targetWeight: Value(value)));
    notifyListeners();
  }

  void setDailyCarbs(int? value) {
    dailyCarbs = value;
    (db.settings.update()).write(SettingsCompanion(dailyCarb: Value(value)));
    notifyListeners();
  }

  void setDailyFat(int? value) {
    dailyFat = value;
    (db.settings.update()).write(SettingsCompanion(dailyFat: Value(value)));
    notifyListeners();
  }

  void setDailyProtein(int? value) {
    dailyProtein = value;
    (db.settings.update()).write(SettingsCompanion(dailyProtein: Value(value)));
    notifyListeners();
  }

  void setDailyCalories(int? value) {
    dailyCalories = value;
    (db.settings.update())
        .write(SettingsCompanion(dailyCalories: Value(value)));
    notifyListeners();
  }

  void setCurve(bool value) {
    curveLines = value;
    (db.settings.update()).write(SettingsCompanion(curveLines: Value(value)));
    notifyListeners();
  }

  void setSystem(bool value) {
    systemColors = value;
    (db.settings.update()).write(SettingsCompanion(systemColors: Value(value)));
    notifyListeners();
  }

  void setLong(String value) {
    longDateFormat = value;
    notifyListeners();
    (db.settings.update())
        .write(SettingsCompanion(longDateFormat: Value(value)));
  }

  void setShort(String value) {
    shortDateFormat = value;
    notifyListeners();
    (db.settings.update())
        .write(SettingsCompanion(shortDateFormat: Value(value)));
  }

  void setTheme(ThemeMode value) {
    themeMode = value;
    (db.settings.update())
        .write(SettingsCompanion(themeMode: Value(value.toString())));
    notifyListeners();
  }
}
