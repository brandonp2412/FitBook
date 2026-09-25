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
          translated.trim(),
          isNotEmpty,
          reason: '${file.path}:${entry.key} must not be empty',
        );
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

  test('localized changelog bundles cover the same release entries', () {
    final directory = Directory('assets/changelog_l10n');
    final files = directory
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.json'))
        .toList()
      ..sort((a, b) => a.path.compareTo(b.path));
    final expectedLocales = {
      'de',
      'es',
      'fr',
      'hi',
      'it',
      'ja',
      'ko',
      'nl',
      'pl',
      'pt-BR',
      'ru',
      'zh-CN',
      'zh-TW',
    };

    expect(
      files.map((file) => file.uri.pathSegments.last.split('.').first).toSet(),
      expectedLocales,
    );
    final changelogIds = Directory('assets/changelogs')
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.txt'))
        .map((file) => file.uri.pathSegments.last.split('.').first)
        .toSet();
    expect(changelogIds, isNotEmpty);

    for (final file in files) {
      final translations = _readStringMap(file);
      expect(
        translations.keys.toSet(),
        changelogIds,
        reason: '${file.path} must cover every English changelog asset',
      );
      for (final entry in translations.entries) {
        expect(entry.value.trim(), isNotEmpty);
        final englishFile = File('assets/changelogs/${entry.key}.txt');
        expect(
          englishFile.existsSync(),
          isTrue,
          reason: '${entry.key} must reference an English changelog asset',
        );
        expect(
          entry.value.trim(),
          isNot(englishFile.readAsStringSync().trim()),
          reason: '${file.path}:${entry.key} must not copy English unchanged',
        );
      }
    }
  });

  test('Android platform strings cover every first-wave locale and key', () {
    final base = File('android/app/src/main/res/values/strings.xml');
    final englishStrings = _androidStrings(base);
    final expectedKeys = englishStrings.keys.toSet();
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
      'values-ru',
      'values-hi',
      'values-zh-rCN',
      'values-zh-rTW',
    ];

    for (final directory in localizedFiles) {
      final file = File('android/app/src/main/res/$directory/strings.xml');
      expect(file.existsSync(), isTrue, reason: '$directory must be localized');
      final localizedStrings = _androidStrings(file);
      expect(
        localizedStrings.keys.toSet(),
        expectedKeys,
        reason: '${file.path} must match the default Android string keys',
      );
      for (final entry in englishStrings.entries) {
        expect(
          localizedStrings[entry.key],
          isNotEmpty,
          reason: '${file.path}:${entry.key} must not be empty',
        );
        expect(
          localizedStrings[entry.key],
          isNot(entry.value),
          reason: '${file.path}:${entry.key} must not fall back to English',
        );
      }
    }
  });

  test('iOS permission strings cover every first-wave locale and key', () {
    final base = File('ios/Runner/en.lproj/InfoPlist.strings');
    final englishStrings = _appleStrings(base);
    final expectedKeys = englishStrings.keys.toSet();
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
      'ru.lproj',
      'hi.lproj',
      'zh-Hans.lproj',
      'zh-Hant.lproj',
    ];

    for (final directory in localizedDirectories) {
      final file = File('ios/Runner/$directory/InfoPlist.strings');
      expect(file.existsSync(), isTrue, reason: '$directory must be localized');
      final localizedStrings = _appleStrings(file);
      expect(
        localizedStrings.keys.toSet(),
        expectedKeys,
        reason: '${file.path} must match the English iOS permission keys',
      );
      for (final entry in englishStrings.entries) {
        expect(
          localizedStrings[entry.key],
          isNotEmpty,
          reason: '${file.path}:${entry.key} must not be empty',
        );
        expect(
          localizedStrings[entry.key],
          isNot(entry.value),
          reason: '${file.path}:${entry.key} must not fall back to English',
        );
      }
    }
  });

  test('Dart UI copy does not bypass localization', () {
    const allowedDirectText = {'Brandon Dick', 'MIT'};
    final directText = RegExp(
      r'''\bText\s*\(\s*["']([^"'$]+)["']''',
      multiLine: true,
    );
    final literalUiProperty = RegExp(
      r'''(?:tooltip|semanticLabel|labelText|hintText|helperText|errorText)\s*:\s*["']([^"']+)["']''',
      multiLine: true,
    );
    final rawErrorWidget = RegExp(
      r'''\bErrorWidget\s*\(\s*(?:snapshot\.error|error(?:\.toString\(\))?)''',
    );
    final rawSnapshotThrow = RegExp(
      r'''throw\s+(?:Exception|Error)\s*\(\s*snapshot\.error''',
    );
    final violations = <String>[];

    final dartFiles =
        Directory('lib').listSync(recursive: true).whereType<File>().where(
              (file) =>
                  file.path.endsWith('.dart') &&
                  !file.path.contains('/l10n/generated/'),
            );

    for (final file in dartFiles) {
      final source = file.readAsStringSync();
      for (final match in directText.allMatches(source)) {
        final value = match.group(1)!;
        if (allowedDirectText.contains(value)) continue;
        violations.add(
          '${file.path}:${_lineNumber(source, match.start)} Text: $value',
        );
      }
      for (final match in literalUiProperty.allMatches(source)) {
        violations.add(
          '${file.path}:${_lineNumber(source, match.start)} UI property: ${match.group(1)}',
        );
      }
      for (final match in rawErrorWidget.allMatches(source)) {
        violations.add(
          '${file.path}:${_lineNumber(source, match.start)} raw ErrorWidget exception',
        );
      }
      for (final match in rawSnapshotThrow.allMatches(source)) {
        violations.add(
          '${file.path}:${_lineNumber(source, match.start)} raw snapshot exception throw',
        );
      }
    }

    expect(
      violations,
      isEmpty,
      reason:
          'User-visible Dart copy must come from AppLocalizations:\n${violations.join('\n')}',
    );
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
        const Locale('ru'),
        const Locale('hi'),
        const Locale('ja'),
        const Locale('ko'),
        const Locale('zh', 'CN'),
        const Locale('zh', 'TW'),
      }),
    );
  });

  test('stored locale preferences preserve system and region choices', () {
    expect(localeFromPreference('system'), isNull);
    expect(localeFromPreference('de'), const Locale('de'));
    expect(localeFromPreference('ru'), const Locale('ru'));
    expect(localeFromPreference('hi'), const Locale('hi'));
    expect(localeFromPreference('pt-BR'), const Locale('pt', 'BR'));
    expect(
      localePreferenceFromLocale(const Locale('zh', 'CN')),
      'zh-CN',
    );
    expect(
      localePreferenceFromLocale(const Locale('zh', 'TW')),
      'zh-TW',
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
    final russian = await AppLocalizations.delegate.load(const Locale('ru'));
    final japanese = await AppLocalizations.delegate.load(const Locale('ja'));

    expect(english.foodLibraryCounts(1, 1), '1 food · 1 meal');
    expect(english.foodLibraryCounts(2, 3), '2 foods · 3 meals');
    expect(polish.foodLibraryCounts(1, 1), '1 produkt · 1 posiłek');
    expect(polish.foodLibraryCounts(2, 4), '2 produkty · 4 posiłki');
    expect(polish.foodLibraryCounts(5, 5), '5 produktów · 5 posiłków');
    expect(russian.foodLibraryCounts(1, 1), '1 продукт · 1 приём пищи');
    expect(russian.foodLibraryCounts(2, 3), '2 продукта · 3 приёма пищи');
    expect(russian.foodLibraryCounts(5, 5), '5 продуктов · 5 приёмов пищи');
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

Map<String, String> _readStringMap(File file) =>
    (jsonDecode(file.readAsStringSync()) as Map<String, dynamic>).map(
      (key, value) => MapEntry(key, value as String),
    );

Map<String, String> _messages(Map<String, dynamic> arb) => {
      for (final entry in arb.entries)
        if (!entry.key.startsWith('@')) entry.key: entry.value as String,
    };

int _lineNumber(String source, int offset) =>
    '\n'.allMatches(source.substring(0, offset)).length + 1;

Set<String> _placeholders(String message) => RegExp(
      r'\{([A-Za-z][A-Za-z0-9_]*)(?=[},])',
    ).allMatches(message).map((match) => match.group(1)!).toSet();

Map<String, String> _androidStrings(File file) => {
      for (final match in RegExp(
        r'<string\s+name="([^"]+)">([^<]*)</string>',
      ).allMatches(file.readAsStringSync()))
        match.group(1)!: match.group(2)!,
    };

Map<String, String> _appleStrings(File file) => {
      for (final match in RegExp(
        r'^"([^"]+)"\s*=\s*"([^"]*)";',
        multiLine: true,
      ).allMatches(file.readAsStringSync()))
        match.group(1)!: match.group(2)!,
    };
