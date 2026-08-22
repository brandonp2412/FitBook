import 'package:fit_book/settings/whats_new.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('changelogDateFromTimestamp', () {
    test('converts Unix seconds', () {
      expect(
        changelogDateFromTimestamp(1786954594).millisecondsSinceEpoch,
        1786954594000,
      );
    });

    test('converts historical Windows ticks', () {
      expect(
        changelogDateFromTimestamp(134188838719418420).millisecondsSinceEpoch,
        1774410271941,
      );
    });
  });
}
