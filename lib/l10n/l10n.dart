import 'dart:ui' show PlatformDispatcher;

import 'package:fit_book/l10n/generated/app_localizations.dart';
import 'package:flutter/widgets.dart';

export 'package:fit_book/l10n/generated/app_localizations.dart';

extension AppLocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

Locale? localeFromPreference(String value) {
  if (value == 'system') return null;
  final parts = value.split('-');
  return parts.length == 1
      ? Locale(parts.first)
      : Locale(parts.first, parts[1]);
}

String localePreferenceFromLocale(Locale locale) {
  final countryCode = locale.countryCode;
  return countryCode == null || countryCode.isEmpty
      ? locale.languageCode
      : '${locale.languageCode}-$countryCode';
}

/// Resolves generated localizations without requiring a widget [BuildContext].
///
/// This is used by background tasks such as reminders. A stored `system`
/// preference follows [systemLocale] when supplied, otherwise the current
/// platform locale. Unsupported locales fall back to English.
AppLocalizations localizationsFromPreference(
  String value, {
  Locale? systemLocale,
}) {
  final requested = localeFromPreference(value) ??
      systemLocale ??
      PlatformDispatcher.instance.locale;
  Locale? languageFallback;

  for (final supported in AppLocalizations.supportedLocales) {
    if (supported.languageCode != requested.languageCode) continue;
    if (supported.countryCode == requested.countryCode) {
      return lookupAppLocalizations(supported);
    }
    if (supported.countryCode == null) languageFallback = supported;
  }

  return lookupAppLocalizations(languageFallback ?? const Locale('en'));
}

/// Returns a localized display label without changing the persisted unit ID.
String localizedUnit(AppLocalizations l10n, String unit) => switch (unit) {
      'serving' => l10n.unitServing,
      'grams' => l10n.unitGrams,
      'milliliters' => l10n.unitMilliliters,
      'kilojoules' => l10n.unitKilojoules,
      'cups' => l10n.unitCups,
      'tablespoons' => l10n.unitTablespoons,
      'milligrams' => l10n.unitMilligrams,
      'teaspoons' => l10n.unitTeaspoons,
      'ounces' => l10n.unitOunces,
      'pounds' => l10n.unitPounds,
      'kilograms' => l10n.unitKilograms,
      'liters' => l10n.unitLiters,
      _ => unit,
    };
