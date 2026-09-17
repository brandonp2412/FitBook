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

  @override
  String get delete => 'Löschen';

  @override
  String get confirmDelete => 'Löschen bestätigen';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Möchtest du wirklich $count Einträge löschen? Diese Aktion kann nicht rückgängig gemacht werden.',
      one:
          'Möchtest du wirklich 1 Eintrag löschen? Diese Aktion kann nicht rückgängig gemacht werden.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get search => 'Suchen...';

  @override
  String get clear => 'Leeren';

  @override
  String get showMenu => 'Menü anzeigen';

  @override
  String get selectAll => 'Alle auswählen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get favorite => 'Favorit';

  @override
  String get atLeastOneTab => 'Du brauchst mindestens einen Tab';

  @override
  String get scrollableTabs => 'Scrollbare Tabs';

  @override
  String get save => 'Speichern';

  @override
  String get themeSystem => 'System';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeLight => 'Hell';

  @override
  String get pureBlackAmoled => 'Reines Schwarz (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'Verwende reines Schwarz auf AMOLED-Displays';

  @override
  String get systemColorScheme => 'Systemfarbschema';

  @override
  String get systemColorSchemeTooltip =>
      'Verwende die Primärfarbe deines Geräts für die App';

  @override
  String get showImages => 'Bilder anzeigen';

  @override
  String get showImagesTooltip =>
      'Bilder im Tagebuch und auf den Lebensmittelseiten auswählen und anzeigen';

  @override
  String get curveLineGraphs => 'Gekrümmte Liniendiagramme';

  @override
  String get curveLineGraphsTooltip =>
      'Verwende weiche Kurven auf der Diagrammseite';

  @override
  String get weightStatCards => 'Gewichts-Statistikkarten';

  @override
  String get weightStatCardsTooltip =>
      'Zeige Gewichtseinträge als Raster mit Statistikkarten statt als Standardliste';

  @override
  String get graphsStartAtZero => 'Diagramme beginnen bei null';

  @override
  String get graphsStartAtZeroTooltip =>
      'Beginne die Y-Achse des Diagramms immer bei null';

  @override
  String get navigationAnimation => 'Navigationsanimation';

  @override
  String get animationFade => 'Überblenden';

  @override
  String get animationZoom => 'Zoom';

  @override
  String get animationSlide => 'Gleiten';

  @override
  String get animationRise => 'Anheben';

  @override
  String get animationNone => 'Keine';

  @override
  String longDateFormat(String example) {
    return 'Langes Datumsformat ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Kurzes Datumsformat ($example)';
  }

  @override
  String get diarySettings => 'Tagebucheinstellungen';

  @override
  String get diaryUnit => 'Tagebucheinheit';

  @override
  String get diarySummary => 'Tagebuchübersicht';

  @override
  String get diarySummaryDivision => 'Verhältnis – aktuell / gesamt';

  @override
  String get diarySummaryRemaining => 'Verbleibend';

  @override
  String get diarySummaryBoth => 'Beides – verbleibend (gesamt)';

  @override
  String get diarySummaryNone => 'Keine';

  @override
  String get dailyCaloriesKcal => 'Tägliche Kalorien (kcal)';

  @override
  String get dailyProteinG => 'Tägliches Protein (g)';

  @override
  String get dailyFatG => 'Tägliches Fett (g)';

  @override
  String get dailyCarbsG => 'Tägliche Kohlenhydrate (g)';

  @override
  String get dailyFiberG => 'Tägliche Ballaststoffe (g)';

  @override
  String get automaticDailies => 'Automatische Tagesziele';

  @override
  String get automaticDailiesTooltip =>
      'Berechne empfohlene tägliche Kalorien, Protein, Fett und Kohlenhydrate automatisch anhand deines Körpergewichts';

  @override
  String get selectNameOnSubmit => 'Namen beim Speichern auswählen';

  @override
  String get reminders => 'Erinnerungen';

  @override
  String get foodSettings => 'Lebensmitteleinstellungen';

  @override
  String get foodUnit => 'Lebensmitteleinheit';

  @override
  String get fields => 'Felder';

  @override
  String get favoriteNewFoods => 'Neue Lebensmittel als Favoriten markieren';

  @override
  String get pickFields => 'Felder auswählen';

  @override
  String get all => 'Alle';

  @override
  String get onlySelected => 'Nur ausgewählte';

  @override
  String get weightSettings => 'Gewichtseinstellungen';

  @override
  String get targetWeight => 'Zielgewicht';

  @override
  String get positiveReinforcement => 'Positive Verstärkung';

  @override
  String get positiveReinforcementPreview =>
      'Ermutigende Nachrichten werden so angezeigt!';

  @override
  String get dataSettings => 'Dateneinstellungen';

  @override
  String get automaticBackup => 'Automatische Sicherung';

  @override
  String get shareDatabase => 'Datenbank teilen';

  @override
  String get openNotification => 'Benachrichtigung öffnen';

  @override
  String get automaticBackupsEnabled => 'Automatische Sicherungen aktiviert';

  @override
  String get automaticBackupBody =>
      'FitBook sichert deine Daten und Bilder täglich automatisch im ausgewählten Ordner.';

  @override
  String get backupSettings => 'Sicherungseinstellungen';

  @override
  String get backupSettingsChannelDescription =>
      'Benachrichtigungen über automatische Sicherungen';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Benutzername';

  @override
  String get password => 'Passwort';

  @override
  String get close => 'Schließen';

  @override
  String get loggedIn => 'Angemeldet';

  @override
  String get about => 'Über';

  @override
  String get version => 'Version';

  @override
  String get whatsNew => 'Neuigkeiten';

  @override
  String get author => 'Autor';

  @override
  String get license => 'Lizenz';

  @override
  String get donate => 'Spenden';

  @override
  String get supportProject => 'Hilf mit, dieses Projekt zu unterstützen';

  @override
  String get leaveReview => 'Bewertung abgeben';

  @override
  String get rateOnPlayStore => 'FitBook im Play Store bewerten';

  @override
  String get sourceCode => 'Quellcode';

  @override
  String get foods => 'Lebensmittel';

  @override
  String get backup => 'Sicherung';

  @override
  String get exportData => 'Daten exportieren';

  @override
  String get importData => 'Daten importieren';

  @override
  String get failedImportData => 'Daten konnten nicht importiert werden';

  @override
  String get copyError => 'Fehler kopieren';

  @override
  String get deleteRecords => 'Einträge löschen';

  @override
  String get unusedFood => 'Nicht verwendete Lebensmittel';

  @override
  String get database => 'Datenbank';

  @override
  String get deleteAllWeightsConfirm =>
      'Möchtest du wirklich alle Gewichtseinträge löschen? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get deleteDatabaseConfirm =>
      'Möchtest du wirklich deine Datenbank löschen? Diese Aktion kann nicht rückgängig gemacht werden und löscht alle deine Daten.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Möchtest du wirklich alle Lebensmittel- und Tagebucheinträge löschen? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Möchtest du wirklich $count nicht verwendete Lebensmittel löschen? Diese Aktion kann nicht rückgängig gemacht werden.',
      one:
          'Möchtest du wirklich 1 nicht verwendetes Lebensmittel löschen? Diese Aktion kann nicht rückgängig gemacht werden.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Möchtest du wirklich alle Tagebucheinträge löschen? Diese Aktion kann nicht rückgängig gemacht werden.';
}
