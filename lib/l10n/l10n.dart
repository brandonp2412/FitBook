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
