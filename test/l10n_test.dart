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

  test('Android platform strings cover every first-wave locale and key', () {
    final base = File('android/app/src/main/res/values/strings.xml');
    final expectedKeys = _androidStringKeys(base);
    final localizedFiles = <String>[
      'values-de',
      'values-es',
      'values-fr',
      'values-it',
      'values-ja',
      'values-ko',
      'values-nl',
      'values-pl',
      'values-pt-rBR',
      'values-zh-rCN',
    ];

    for (final directory in localizedFiles) {
      final file = File('android/app/src/main/res/$directory/strings.xml');
      expect(file.existsSync(), isTrue, reason: '$directory must be localized');
      expect(
        _androidStringKeys(file),
        expectedKeys,
        reason: '${file.path} must match the default Android string keys',
      );
    }
  });

  test('iOS permission strings cover every first-wave locale and key', () {
    final base = File('ios/Runner/en.lproj/InfoPlist.strings');
    final expectedKeys = _appleStringKeys(base);
    final localizedDirectories = <String>[
      'de.lproj',
      'es.lproj',
      'fr.lproj',
      'it.lproj',
      'ja.lproj',
      'ko.lproj',
      'nl.lproj',
      'pl.lproj',
      'pt-BR.lproj',
      'zh-Hans.lproj',
    ];

    for (final directory in localizedDirectories) {
      final file = File('ios/Runner/$directory/InfoPlist.strings');
      expect(file.existsSync(), isTrue, reason: '$directory must be localized');
      expect(
        _appleStringKeys(file),
        expectedKeys,
        reason: '${file.path} must match the English iOS permission keys',
      );
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

  test('food library counts use locale plural rules', () async {
    final english = await AppLocalizations.delegate.load(const Locale('en'));
    final polish = await AppLocalizations.delegate.load(const Locale('pl'));
    final japanese = await AppLocalizations.delegate.load(const Locale('ja'));

    expect(english.foodLibraryCounts(1, 1), '1 food · 1 meal');
    expect(english.foodLibraryCounts(2, 3), '2 foods · 3 meals');
    expect(polish.foodLibraryCounts(1, 1), '1 produkt · 1 posiłek');
    expect(polish.foodLibraryCounts(2, 4), '2 produkty · 4 posiłki');
    expect(polish.foodLibraryCounts(5, 5), '5 produktów · 5 posiłków');
    expect(japanese.foodLibraryCounts(1, 2), '食品 1 件 · 食事 2 件');
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
    expect(localizedFoodFieldLabel(spanish, 'sugars_g'), 'Azúcares');
    expect(localizedFoodFieldLabel(spanish, 'vitamin_a_iu_iu'), 'Vitamina A');
    expect(
      localizedFoodFieldLabel(spanish, 'omega_3s_mg'),
      'Ácidos grasos omega-3',
    );
    expect(localizedFoodFieldLabel(japanese, 'saturated_fats_g'), '飽和脂肪');
    expect(localizedFoodFieldLabel(japanese, 'selenium_se_mcg'), 'セレン');
    expect(localizedFoodFieldLabel(japanese, 'chlorine_mg'), '塩化物');
    expect(localizedFoodFieldLabel(spanish, 'glucose_dextrose_g'), 'Glucosa');
    expect(
      localizedFoodFieldLabel(spanish, 'folate_dfe_mcg'),
      'Equivalentes de folato dietético (DFE)',
    );
    expect(
      localizedFoodFieldLabel(japanese, '_22_6_n_3_dha_mg'),
      'ドコサヘキサエン酸（DHA）',
    );
    expect(localizedFoodFieldLabel(spanish, 'tryptophan_mg'), 'Triptófano');
    expect(localizedFoodFieldLabel(spanish, 'caffeine_mg'), 'Cafeína');
    expect(localizedFoodFieldLabel(japanese, 'leucine_mg'), 'ロイシン');
    expect(localizedFoodFieldLabel(japanese, 'theobromine_mg'), 'テオブロミン');
    expect(
      localizedFoodFieldLabel(spanish, 'serving_weight_3_g'),
      'Peso de ración 3',
    );
    expect(
      localizedFoodFieldLabel(japanese, 'serving_description_2_g'),
      '1食分の説明 2',
    );
    expect(
      localizedFoodFieldLabel(spanish, '_200_calorie_weight_g'),
      'Peso equivalente a 200 kcal',
    );
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

Set<String> _androidStringKeys(File file) => RegExp(
      r'<string\s+name="([^"]+)"',
    )
        .allMatches(file.readAsStringSync())
        .map((match) => match.group(1)!)
        .toSet();

Set<String> _appleStringKeys(File file) => RegExp(
      r'^"([^"]+)"\s*=',
      multiLine: true,
    )
        .allMatches(file.readAsStringSync())
        .map((match) => match.group(1)!)
        .toSet();
