import 'dart:convert';
import 'dart:io';

import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('all locale ARBs contain every canonical message and placeholder', () {
    final directory = Directory('lib/l10n');
    final template = _readArb(File('${directory.path}/app_en.arb'));
    final templateMessages = _messages(template);

    for (final file in directory
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.arb'))) {
      final arb = _readArb(file);
      final messages = _messages(arb);

      expect(
        messages.keys.toSet(),
        templateMessages.keys.toSet(),
        reason: '${file.path} must match the canonical English ARB keys',
      );

      for (final entry in templateMessages.entries) {
        final translated = messages[entry.key]!;
        expect(
          _placeholders(translated),
          _placeholders(entry.value),
          reason: '${file.path}:${entry.key} must preserve placeholders',
        );
        if (entry.value.contains(', plural,')) {
          expect(
            translated,
            contains(', plural,'),
            reason: '${file.path}:${entry.key} must preserve ICU plural syntax',
          );
        }
      }
    }
  });

  test('generated localizations expose the intended first-wave locales', () {
    expect(
      AppLocalizations.supportedLocales.toSet(),
      containsAll(<Locale>{
        const Locale('en'),
        const Locale('es'),
        const Locale('fr'),
        const Locale('de'),
        const Locale('it'),
        const Locale('pt', 'BR'),
        const Locale('nl'),
        const Locale('pl'),
        const Locale('ja'),
        const Locale('ko'),
        const Locale('zh', 'CN'),
      }),
    );
  });

  test('stored locale preferences preserve system and region choices', () {
    expect(localeFromPreference('system'), isNull);
    expect(localeFromPreference('de'), const Locale('de'));
    expect(localeFromPreference('pt-BR'), const Locale('pt', 'BR'));
    expect(
      localePreferenceFromLocale(const Locale('zh', 'CN')),
      'zh-CN',
    );
  });

  test('background localizations honor stored, system, and fallback locales',
      () {
    expect(
      localizationsFromPreference('es').breakfastReminderTitle,
      'No olvides registrar el desayuno',
    );
    expect(
      localizationsFromPreference(
        'system',
        systemLocale: const Locale('ja', 'JP'),
      ).breakfastReminderTitle,
      '朝食の記録をお忘れなく',
    );
    expect(
      localizationsFromPreference('xx').breakfastReminderTitle,
      "Don't forget to log breakfast",
    );
  });

  test('unit display labels localize without changing stored identifiers',
      () async {
    final spanish = await AppLocalizations.delegate.load(const Locale('es'));

    expect(localizedUnit(spanish, 'serving'), 'Ración');
    expect(localizedUnit(spanish, 'grams'), 'Gramos');
    expect(localizedUnit(spanish, 'milliliters'), 'Mililitros');
    expect(localizedUnit(spanish, 'custom-unit'), 'custom-unit');
  });

  test('diary summary phrases preserve localized placeholder ordering',
      () async {
    final spanish = await AppLocalizations.delegate.load(const Locale('es'));
    final japanese = await AppLocalizations.delegate.load(const Locale('ja'));

    expect(
      spanish.diarySummaryRemainingValue('250', 'kcal'),
      'Quedan 250 kcal',
    );
    expect(
      japanese.diarySummaryBothValue('20', '100', 'g'),
      '残り 20 g（目標 100 g）',
    );
  });

  test('common food field labels localize without changing field identifiers',
      () async {
    final spanish = await AppLocalizations.delegate.load(const Locale('es'));
    final japanese = await AppLocalizations.delegate.load(const Locale('ja'));

    expect(localizedFoodFieldLabel(spanish, 'protein_g'), 'Proteínas');
    expect(
      localizedFoodFieldLabel(spanish, 'serving_size'),
      'Tamaño de la ración',
    );
    expect(localizedFoodFieldLabel(japanese, 'carbohydrate_g'), '炭水化物');
    expect(localizedFoodFieldLabel(spanish, 'custom_field'), 'Custom field');
  });
}

Map<String, dynamic> _readArb(File file) =>
    jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;

Map<String, String> _messages(Map<String, dynamic> arb) => {
      for (final entry in arb.entries)
        if (!entry.key.startsWith('@')) entry.key: entry.value as String,
    };

Set<String> _placeholders(String message) => RegExp(
      r'\{([A-Za-z][A-Za-z0-9_]*)(?=[},])',
    ).allMatches(message).map((match) => match.group(1)!).toSet();
