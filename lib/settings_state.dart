import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState extends ChangeNotifier {
  SharedPreferences? prefs;

  ThemeMode themeMode = ThemeMode.system;
  String longDateFormat = 'dd/MM/yy';
  String shortDateFormat = 'd/M/yy';

  bool systemColors = false;
  bool curveLines = false;
  bool showOthers = false;
  bool showRemaining = false;

  int? dailyCalories;
  int? dailyProtein;
  int? dailyFat;
  int? dailyCarbs;

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
    systemColors = prefs?.getBool("systemColors") ?? false;
    curveLines = prefs?.getBool("curveLines") ?? true;
    showOthers = prefs?.getBool("showOthers") ?? false;
    showRemaining = prefs?.getBool("showRemaining") ?? false;
    dailyCalories = prefs?.getInt('dailyCalories');
    dailyProtein = prefs?.getInt('dailyProtein');
    dailyFat = prefs?.getInt('dailyFat');
    dailyCarbs = prefs?.getInt('dailyCarbs');
  }

  void setShowRemaining(bool value) {
    showRemaining = value;
    prefs?.setBool('showRemaining', value);
    notifyListeners();
  }

  void setShowOthers(bool show) {
    showOthers = show;
    prefs?.setBool('showOthers', show);
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
