import 'package:fit_book/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphState extends ChangeNotifier {
  AppMetric metric = AppMetric.calories;
  Period groupBy = Period.day;
  DateTime? startDate;
  DateTime? endDate;
  late SharedPreferences prefs;

  GraphState(SharedPreferences sharedPreferences) {
    prefs = sharedPreferences;

    final metricString = prefs.getString('metric');
    for (var value in AppMetric.values)
      if (metricString == value.toString()) metric = value;

    final groupString = prefs.getString('groupBy');
    for (var value in Period.values)
      if (groupString == value.toString()) groupBy = value;

    final startString = prefs.getString('startDate');
    if (startString != null) startDate = DateTime.parse(startString);
    final endString = prefs.getString('endDate');
    if (endString != null) endDate = DateTime.parse(endString);
  }

  void setMetric(AppMetric value) {
    metric = value;
    prefs.setString('metric', value.toString());
    notifyListeners();
  }

  void setGroupBy(Period value) {
    groupBy = value;
    prefs.setString('groupBy', value.toString());
    notifyListeners();
  }

  void setEndDate(DateTime? value) {
    endDate = value;
    if (value == null)
      prefs.remove('endDate');
    else
      prefs.setString('endDate', value.toIso8601String());
    notifyListeners();
  }

  void setStartDate(DateTime? value) {
    startDate = value;
    if (value == null)
      prefs.remove('startDate');
    else
      prefs.setString('startDate', value.toIso8601String());
    notifyListeners();
  }
}
