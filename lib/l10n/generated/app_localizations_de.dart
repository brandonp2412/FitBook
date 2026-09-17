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
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge bearbeiten',
      one: '1 Eintrag bearbeiten',
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
  String get today => 'Heute';

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

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Bild ersetzen';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get deleteImage => 'Bild löschen';

  @override
  String get filters => 'Filter';

  @override
  String get foodGroup => 'Lebensmittelgruppe';

  @override
  String get exampleFruit => 'Obst';

  @override
  String clearFiltersCount(int count) {
    return 'Zurücksetzen ($count)';
  }

  @override
  String get done => 'Fertig';

  @override
  String get showFilters => 'Filter anzeigen';

  @override
  String get repeatEntry => 'Eintrag wiederholen';

  @override
  String get timeOfDay => 'Uhrzeit';

  @override
  String get everyDay => 'Jeden Tag';

  @override
  String get repeatEveryDayForYear =>
      'Diesen Eintrag im nächsten Jahr jeden Tag erstellen';

  @override
  String get repeatOn => 'Wiederholen am';

  @override
  String get weekdayMon => 'Mo';

  @override
  String get weekdayTue => 'Di';

  @override
  String get weekdayWed => 'Mi';

  @override
  String get weekdayThu => 'Do';

  @override
  String get weekdayFri => 'Fr';

  @override
  String get weekdaySat => 'Sa';

  @override
  String get weekdaySun => 'So';

  @override
  String get schedule => 'Planen';

  @override
  String get enterValidNutritionValues => 'Gültige Nährwerte eingeben';

  @override
  String get quickAddTitle => 'Schnelleingabe';

  @override
  String get kilojoules => 'Kilojoule';

  @override
  String get createdDate => 'Erstellungsdatum';

  @override
  String get failedMigrations => 'Fehlgeschlagene Migrationen';

  @override
  String get failedMigrationsDescription =>
      'Beim Erstellen oder Aktualisieren deiner Datenbank ist ein Fehler aufgetreten. Normalerweise lässt sich das beheben, indem du deine Einträge löschst und neu erstellst.';

  @override
  String get errorMessage => 'Fehlermeldung:';

  @override
  String get createIssue => 'Problem melden';

  @override
  String get cameraPermissionRequired =>
      'Zum Scannen ist die Kameraberechtigung erforderlich.';

  @override
  String get scanFoodBarcode => 'Lebensmittel-Barcode scannen';

  @override
  String get holdBarcodeInFrame => 'Barcode innerhalb des Rahmens halten';

  @override
  String get pinchToZoom => 'Zum Zoomen zusammenziehen';

  @override
  String get cameraStartFailed => 'Kamera konnte nicht gestartet werden';

  @override
  String get editDiaryEntry => 'Tagebucheintrag bearbeiten';

  @override
  String get addFoodToDiary => 'Lebensmittel zum Tagebuch hinzufügen';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Möchtest du $name wirklich löschen?';
  }

  @override
  String get imageError => 'Bildfehler';

  @override
  String get setImage => 'Bild festlegen';

  @override
  String get name => 'Name';

  @override
  String get searchFoodsAndMeals => 'Lebensmittel und Mahlzeiten suchen...';

  @override
  String get clearSelection => 'Auswahl löschen';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Barcode nicht gefunden. Speichern, um ihn hinzuzufügen.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'OpenFoodFacts nach „$name“ durchsuchen';
  }

  @override
  String get meal => 'Mahlzeit';

  @override
  String get quantity => 'Menge';

  @override
  String get unit => 'Einheit';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Portion ($amount $unit)';
  }

  @override
  String get barcode => 'Barcode';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (pro $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '$nutrient pro $quantity $unit';
  }

  @override
  String get fiber => 'Ballaststoffe';

  @override
  String get unitServing => 'Portion';

  @override
  String get unitGrams => 'Gramm';

  @override
  String get unitMilliliters => 'Milliliter';

  @override
  String get unitKilojoules => 'Kilojoule';

  @override
  String get unitCups => 'Tassen';

  @override
  String get unitTablespoons => 'Esslöffel';

  @override
  String get unitMilligrams => 'Milligramm';

  @override
  String get unitTeaspoons => 'Teelöffel';

  @override
  String get unitOunces => 'Unzen';

  @override
  String get unitPounds => 'Pfund';

  @override
  String get unitKilograms => 'Kilogramm';

  @override
  String get unitLiters => 'Liter';

  @override
  String get nameConflict => 'Namenskonflikt';

  @override
  String get replaceExistingFood =>
      'Ein Lebensmittel mit diesem Namen ist bereits vorhanden. Möchtest du das alte ersetzen?';

  @override
  String get no => 'Nein';

  @override
  String get yes => 'Ja';

  @override
  String get editFood => 'Lebensmittel bearbeiten';

  @override
  String confirmDeleteFood(String name) {
    return 'Möchtest du $name wirklich löschen?';
  }

  @override
  String get caloriesKcal => 'Kalorien (kcal)';

  @override
  String get kilojoulesKj => 'Kilojoule (kJ)';

  @override
  String get servingSize => 'Portionsgröße';

  @override
  String get servingUnit => 'Portionseinheit';

  @override
  String get saveAsNewCopy => 'Als neue Kopie speichern';

  @override
  String get filterFoods => 'Lebensmittel filtern';

  @override
  String get narrowFoodsFilters =>
      'Grenze die Liste mit einer beliebigen Kombination von Filtern ein.';

  @override
  String get foodDetails => 'Lebensmitteldetails';

  @override
  String get exampleFruitHint => 'z. B. Obst';

  @override
  String get servingSizeRangeHint =>
      'Lege ein Minimum, ein Maximum oder beides fest.';

  @override
  String get minimum => 'Minimum';

  @override
  String get maximum => 'Maximum';

  @override
  String get noMinimum => 'Kein Minimum';

  @override
  String get noMaximum => 'Kein Maximum';

  @override
  String get clearAll => 'Alles löschen';

  @override
  String get searchOpenFoodFacts => 'Open Food Facts durchsuchen';

  @override
  String get noMatchingProducts => 'Keine passenden Produkte';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Probiere einen anderen Namen oder scanne einen Barcode.';

  @override
  String get enterFoodNameToSearch =>
      'Gib oben einen Lebensmittelnamen ein und starte die Suche.';

  @override
  String get submitToSearch => 'Suche starten...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g Eiweiß';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Lebensmittel bearbeiten',
      one: '1 Lebensmittel bearbeiten',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'Mahlzeit bearbeiten';

  @override
  String get addImage => 'Bild hinzufügen';

  @override
  String get noFoodsInMeal => 'Noch keine Lebensmittel in dieser Mahlzeit';

  @override
  String get addFoodToMealHint =>
      'Füge ein Lebensmittel hinzu, um diese Mahlzeit zusammenzustellen.';

  @override
  String get remove => 'Entfernen';

  @override
  String get searchFoods => 'Lebensmittel suchen...';

  @override
  String get noFoodsFound => 'Keine Lebensmittel gefunden';

  @override
  String nothingMatchesSearch(String search) {
    return 'Keine Treffer für „$search“.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Füge zuerst Lebensmittel zu deiner Bibliothek hinzu, bevor du sie einer Mahlzeit hinzufügst.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'Noch keine Daten';

  @override
  String get completePlansToViewGraphs =>
      'Schließe einige Pläne ab, um hier Diagramme anzuzeigen.';

  @override
  String get value => 'Wert';

  @override
  String get goal => 'Ziel';

  @override
  String get notSet => 'Nicht festgelegt';

  @override
  String get trend => 'Trend';

  @override
  String get smooth => 'Glättung';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Durchschnitt aus $count Punkten',
      one: 'Durchschnitt aus 1 Punkt',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Gewicht bearbeiten';

  @override
  String get addWeight => 'Gewicht hinzufügen';

  @override
  String shareWeight(String value, String unit) {
    return 'Ich habe mich gerade gewogen: $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Gewicht ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Bitte Gewicht eingeben';

  @override
  String get pleaseEnterValidWeight => 'Bitte ein gültiges Gewicht eingeben';

  @override
  String get lastWeight => 'Letztes Gewicht';

  @override
  String unitWithValue(String unit) {
    return 'Einheit ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Einheit bei $unit belassen';
  }

  @override
  String convertToUnit(String unit) {
    return 'In $unit umrechnen';
  }

  @override
  String get removeImage => 'Bild entfernen';

  @override
  String get mealRemindersEnabled => 'Mahlzeitenerinnerungen aktiviert';

  @override
  String get mealRemindersEnabledBody =>
      'Wir erinnern dich daran, Frühstück, Mittag- oder Abendessen einzutragen, falls du es noch nicht protokolliert hast.';

  @override
  String get reminderSettingsChannel => 'Erinnerungseinstellungen';

  @override
  String get reminderSettingsChannelDescription =>
      'Benachrichtigungen zu FitBook-Erinnerungen';

  @override
  String get breakfastReminderTitle =>
      'Vergiss nicht, dein Frühstück einzutragen';

  @override
  String get breakfastRemindersChannel => 'Frühstückserinnerungen';

  @override
  String get breakfastRemindersChannelDescription =>
      'Erinnerungen zum Eintragen des Frühstücks';

  @override
  String get lunchReminderTitle =>
      'Vergiss nicht, dein Mittagessen einzutragen';

  @override
  String get lunchRemindersChannel => 'Mittagserinnerungen';

  @override
  String get lunchRemindersChannelDescription =>
      'Erinnerungen zum Eintragen des Mittagessens';

  @override
  String get dinnerReminderTitle =>
      'Vergiss nicht, dein Abendessen einzutragen';

  @override
  String get dinnerRemindersChannel => 'Abendessenserinnerungen';

  @override
  String get dinnerRemindersChannelDescription =>
      'Erinnerungen zum Eintragen des Abendessens';

  @override
  String get reinforcementGreatJob =>
      'Klasse! Deine harte Arbeit zahlt sich aus.';

  @override
  String get reinforcementKeepItUp =>
      'Weiter so! Du machst großartige Fortschritte.';

  @override
  String get reinforcementFantastic =>
      'Fantastisch! Dein Einsatz zeigt Wirkung.';

  @override
  String get reinforcementWellDone =>
      'Gut gemacht! Du bist deinem Ziel einen Schritt näher.';

  @override
  String get reinforcementImpressive =>
      'Beeindruckend! Deine Mühe trägt Früchte.';

  @override
  String get reinforcementAmazing => 'Super! Du bist auf dem richtigen Weg.';

  @override
  String get reinforcementBravo => 'Bravo! Dein Einsatz ist bewundernswert.';

  @override
  String get reinforcementExcellent =>
      'Ausgezeichnet! Deine Ausdauer ist inspirierend.';

  @override
  String get reinforcementSuperb => 'Spitze! Du machst das hervorragend.';

  @override
  String get reinforcementIncredible =>
      'Unglaublich! Deine Fortschritte sind sichtbar.';

  @override
  String get reinforcementWayToGoKing => 'Weiter so, King!';

  @override
  String get reinforcementYeahBuddy => 'Yeah, Buddy!';

  @override
  String get reinforcementThatsHowItsDone => 'Genau so macht man das.';

  @override
  String get reinforcementEasyAsPie => 'Kinderleicht.';

  @override
  String get reinforcementDoingGreat => 'Du machst das großartig.';

  @override
  String get reinforcementProgressNice => 'Sehe ich da Fortschritt? Stark.';
}
