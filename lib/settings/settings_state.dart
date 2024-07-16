import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';

class SettingsState extends ChangeNotifier {
  late Setting value;
  late StreamSubscription subscription;

  SettingsState(Setting settings) {
    value = settings;
    subscription =
        (db.settings.select()..limit(1)).watchSingle().listen((event) {
      value = event;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
