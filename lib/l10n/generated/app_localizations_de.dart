// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Tagebuch';

  @override
  String get navGraph => 'Diagramm';

  @override
  String get navFood => 'Lebensmittel';

  @override
  String get navWeight => 'Gewicht';

  @override
  String get navError => 'Fehler';

  @override
  String get settings => 'Einstellungen';

  @override
  String get invalidTabSettings => 'Ungültige Tab-Einstellungen.';

  @override
  String newVersion(String version) {
    return 'Neue Version $version';
  }

  @override
  String get changes => 'Änderungen';

  @override
  String get searchSettings => 'Einstellungen durchsuchen...';

  @override
  String get appearance => 'Darstellung';

  @override
  String get appearanceSubtitle => 'Design, Farben und Diagrammdarstellung';

  @override
  String get diary => 'Tagebuch';

  @override
  String get diarySubtitle =>
      'Tagesziele, Zusammenfassungen und Protokollierung';

  @override
  String get food => 'Lebensmittel';

  @override
  String get foodSubtitle => 'Einheiten, Felder und Standardwerte';

  @override
  String get weight => 'Gewicht';

  @override
  String get weightSubtitle => 'Gewichtseinheiten, Ziele und Anzeige';

  @override
  String get tabs => 'Tabs';

  @override
  String get tabsSubtitle => 'Navigationstabs und Reihenfolge';

  @override
  String get data => 'Daten';

  @override
  String get dataSubtitle => 'Import, Export und lokale Daten';

  @override
  String get todayProgress => 'Heutiger Fortschritt';

  @override
  String get latestDay => 'Letzter Tag';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge protokolliert',
      one: '1 Eintrag protokolliert',
      zero: 'Keine Einträge protokolliert',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Kalorien';

  @override
  String get protein => 'Eiweiß';

  @override
  String get carbs => 'Kohlenhydrate';

  @override
  String get fat => 'Fett';

  @override
  String get addDiaryEntry => 'Tagebucheintrag hinzufügen';

  @override
  String get noEntriesToday => 'Heute keine Einträge.';

  @override
  String addSearchToDiary(String search) {
    return '\"$search\" zum Tagebuch hinzufügen';
  }

  @override
  String get tapStartLoggingFood =>
      'Tippen, um Lebensmittel zu protokollieren.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Keine passenden Tagebucheinträge. Tippen, um dieses Lebensmittel anzulegen und zu protokollieren.';

  @override
  String get add => 'Hinzufügen';

  @override
  String get quickAdd => 'Schnell hinzufügen';

  @override
  String get scanBarcode => 'Barcode scannen';

  @override
  String get foodLibrary => 'Lebensmittelbibliothek';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    return '$foodCount Lebensmittel · $mealCount Mahlzeiten';
  }

  @override
  String get recentlyUsed => 'Kürzlich verwendet';

  @override
  String get quickActions => 'Schnellaktionen';

  @override
  String get addFood => 'Lebensmittel hinzufügen';

  @override
  String get createMeal => 'Mahlzeit erstellen';

  @override
  String get noFoodYet => 'Noch keine Lebensmittel';

  @override
  String get noMatchingFood => 'Keine passenden Lebensmittel';

  @override
  String get addFirstFoodOrMeal =>
      'Füge dein erstes Lebensmittel oder deine erste Mahlzeit hinzu, um deine Bibliothek aufzubauen.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Keine Treffer für „$search“. Suche löschen, um wieder alles anzuzeigen.';
  }

  @override
  String get clearSearch => 'Suche löschen';

  @override
  String get addMeal => 'Mahlzeit hinzufügen';

  @override
  String get noWeightsYet => 'Noch keine Gewichtseinträge';

  @override
  String get noMatchingWeights => 'Keine passenden Gewichtseinträge';

  @override
  String get logFirstWeight =>
      'Trage dein erstes Gewicht ein, um den Verlauf zu verfolgen.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Keine Treffer für „$search“. Suche löschen, um alle Einträge zu sehen.';
  }

  @override
  String get logWeight => 'Gewicht eintragen';

  @override
  String get weightTrend => 'Gewichtsverlauf';

  @override
  String get weightTrendSubtitle =>
      'Aktuelle Messungen und allgemeine Entwicklung';

  @override
  String get bodyWeight => 'Körpergewicht';

  @override
  String get options => 'Optionen';

  @override
  String get day => 'Tag';

  @override
  String get week => 'Woche';

  @override
  String get month => 'Monat';

  @override
  String get year => 'Jahr';

  @override
  String get dateRange => 'Datumsbereich';

  @override
  String get startDate => 'Startdatum';

  @override
  String get stopDate => 'Enddatum';

  @override
  String get dataPoints => 'Datenpunkte';

  @override
  String get customizeFields => 'Felder anpassen';

  @override
  String get language => 'Sprache';

  @override
  String get languageSubtitle => 'Wähle die Sprache für FitBook';

  @override
  String get languageSystem => 'System';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get languageSpanish => 'Spanisch';

  @override
  String get languageFrench => 'Französisch';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageItalian => 'Italienisch';

  @override
  String get languagePortugueseBrazil => 'Portugiesisch (Brasilien)';

  @override
  String get languageDutch => 'Niederländisch';

  @override
  String get languagePolish => 'Polnisch';

  @override
  String get languageJapanese => 'Japanisch';

  @override
  String get languageKorean => 'Koreanisch';

  @override
  String get languageChineseSimplified => 'Chinesisch (vereinfacht)';

  @override
  String get appearanceSettings => 'Darstellungseinstellungen';
}
