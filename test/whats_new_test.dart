import 'package:fit_book/settings/whats_new.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  testWidgets('Whats New uses localized release-note assets', (tester) async {
    await tester.pumpWidget(
      localizedApp(
        home: const WhatsNew(),
        locale: const Locale('de'),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.textContaining('Lokalisierte Changelog-Abdeckung korrigieren'),
      findsOneWidget,
    );
  });

  group('changelogTranslationAssetCandidates', () {
    test('prefers the full region tag before the language fallback', () {
      expect(
        changelogTranslationAssetCandidates(const Locale('pt', 'BR')),
        [
          'assets/changelog_l10n/pt-BR.json',
          'assets/changelog_l10n/pt.json',
        ],
      );
    });

    test('uses one asset for language-only locales', () {
      expect(
        changelogTranslationAssetCandidates(const Locale('de')),
        ['assets/changelog_l10n/de.json'],
      );
    });
  });

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
