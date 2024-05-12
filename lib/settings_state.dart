import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState extends ChangeNotifier {
  SharedPreferences? prefs;

  ThemeMode themeMode = ThemeMode.system;
  String longDateFormat = 'dd/MM/yy';
  String shortDateFormat = 'd/M/yy';

  bool systemColors = true;

  int dailyCalories = 2200;
  int dailyProtein = 100;

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
    systemColors = prefs?.getBool("systemColors") ?? true;
    dailyCalories = prefs?.getInt('dailyCalories') ?? 2200;
    dailyProtein = prefs?.getInt('dailyProtein') ?? 100;
  }

  void setDailyProtein(int protein) {
    dailyProtein = protein;
    prefs?.setInt('dailyProtein', protein);
    notifyListeners();
  }

  void setDailyCalories(int calories) {
    dailyCalories = calories;
    prefs?.setInt('dailyCalories', calories);
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
