import 'package:fit_book/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState extends ChangeNotifier {
  SharedPreferences? prefs;

  ThemeMode themeMode = ThemeMode.system;
  String longDateFormat = 'dd/MM/yy';
  String shortDateFormat = 'd/M/yy';
  DiarySummary diarySummary = DiarySummary.division;

  bool systemColors = false;
  bool curveLines = false;
  bool showOthers = false;
  bool favoriteNew = false;
  bool selectEntryOnSubmit = false;
  bool notifications = true;

  int? dailyCalories;
  int? dailyProtein;
  int? dailyFat;
  int? dailyCarbs;
  double? targetWeight;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();

    longDateFormat = prefs?.getString('longDateFormat') ?? "dd/MM/yy";
    shortDateFormat = prefs?.getString('shortDateFormat') ?? "d/M/yy";

    final theme = prefs?.getString('themeMode');
    if (theme == "ThemeMode.system")
      themeMode = ThemeMode.system;
    else if (theme == "ThemeMode.light")
      themeMode = ThemeMode.light;
    else if (theme == "ThemeMode.dark") themeMode = ThemeMode.dark;

    final summary = prefs?.getString('diarySummary');
    if (summary == DiarySummary.both.toString())
      diarySummary = DiarySummary.both;
    else if (summary == DiarySummary.division.toString())
      diarySummary = DiarySummary.division;
    else if (summary == DiarySummary.remaining.toString())
      diarySummary = DiarySummary.remaining;

    systemColors = prefs?.getBool("systemColors") ?? false;
    favoriteNew = prefs?.getBool("favoriteNew") ?? false;
    curveLines = prefs?.getBool("curveLines") ?? true;
    showOthers = prefs?.getBool("showOthers") ?? false;
    selectEntryOnSubmit = prefs?.getBool("selectEntryOnSubmit") ?? false;
    notifications = prefs?.getBool('notifications') ?? true;

    dailyCalories = prefs?.getInt('dailyCalories');
    dailyProtein = prefs?.getInt('dailyProtein');
    dailyFat = prefs?.getInt('dailyFat');
    dailyCarbs = prefs?.getInt('dailyCarbs');
    targetWeight = prefs?.getDouble('targetWeight');
  }

  void setDiarySummary(DiarySummary value) {
    diarySummary = value;
    notifyListeners();
    prefs?.setString('diarySummary', value.toString());
  }

  void setNotifications(bool value) {
    notifications = value;
    prefs?.setBool('notifications', value);
    notifyListeners();
  }

  void setSelectEntryOnSubmit(bool value) {
    selectEntryOnSubmit = value;
    prefs?.setBool('selectEntryOnSubmit', value);
    notifyListeners();
  }

  void setFavoriteNew(bool value) {
    favoriteNew = value;
    prefs?.setBool('favoriteNew', value);
    notifyListeners();
  }

  void setShowOthers(bool show) {
    showOthers = show;
    prefs?.setBool('showOthers', show);
    notifyListeners();
  }

  void setTargetWeight(double? value) {
    targetWeight = value;
    if (value == null)
      prefs?.remove('targetWeight');
    else
      prefs?.setDouble('targetWeight', value);
    notifyListeners();
  }

  void setDailyCarbs(int? value) {
    dailyCarbs = value;
    if (value == null)
      prefs?.remove('dailyCarbs');
    else
      prefs?.setInt('dailyCarbs', value);
    notifyListeners();
  }

  void setDailyFat(int? value) {
    dailyFat = value;
    if (value == null)
      prefs?.remove('dailyFat');
    else
      prefs?.setInt('dailyFat', value);
    notifyListeners();
  }

  void setDailyProtein(int? protein) {
    dailyProtein = protein;
    if (protein == null)
      prefs?.remove('dailyProtein');
    else
      prefs?.setInt('dailyProtein', protein);
    notifyListeners();
  }

  void setDailyCalories(int? calories) {
    dailyCalories = calories;
    if (calories == null)
      prefs?.remove('dailyCalories');
    else
      prefs?.setInt('dailyCalories', calories);
    notifyListeners();
  }

  void setCurve(bool curve) {
    curveLines = curve;
    prefs?.setBool('curveLines', curve);
    notifyListeners();
  }

  void setSystem(bool system) {
    systemColors = system;
    prefs?.setBool('systemColors', system);
    notifyListeners();
  }

  void setLong(String format) {
    longDateFormat = format;
    notifyListeners();
    prefs?.setString('longDateFormat', format);
  }

  void setShort(String format) {
    shortDateFormat = format;
    notifyListeners();
    prefs?.setString('shortDateFormat', format);
  }

  void setTheme(ThemeMode theme) {
    themeMode = theme;
    prefs?.setString('themeMode', theme.toString());
    notifyListeners();
  }
}
