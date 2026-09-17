import 'package:fit_book/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget localizedApp({
  required Widget home,
  Locale locale = const Locale('en'),
}) =>
    MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: home,
    );

void dumpTexts() {
  final texts =
      find.byType(Text).evaluate().map((e) => (e.widget as Text).data);
  debugPrint('Visible texts: $texts');
}
