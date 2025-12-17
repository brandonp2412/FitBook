import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void dumpTexts() {
  final texts =
      find.byType(Text).evaluate().map((e) => (e.widget as Text).data);
  debugPrint('Visible texts: $texts');
}
