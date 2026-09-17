// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Dagboek';

  @override
  String get navGraph => 'Grafiek';

  @override
  String get navFood => 'Voeding';

  @override
  String get navWeight => 'Gewicht';

  @override
  String get navError => 'Fout';

  @override
  String get settings => 'Instellingen';

  @override
  String get invalidTabSettings => 'Ongeldige tabbladinstellingen.';

  @override
  String newVersion(String version) {
    return 'Nieuwe versie $version';
  }

  @override
  String get changes => 'Wijzigingen';

  @override
  String get searchSettings => 'Instellingen doorzoeken...';

  @override
  String get appearance => 'Weergave';

  @override
  String get appearanceSubtitle => 'Thema, kleuren en grafiekweergave';

  @override
  String get diary => 'Dagboek';

  @override
  String get diarySubtitle => 'Dagdoelen, samenvattingen en registraties';

  @override
  String get food => 'Voeding';

  @override
  String get foodSubtitle => 'Eenheden, velden en standaardwaarden';

  @override
  String get weight => 'Gewicht';

  @override
  String get weightSubtitle => 'Gewichtseenheden, doelen en weergave';

  @override
  String get tabs => 'Tabbladen';

  @override
  String get tabsSubtitle => 'Navigatietabbladen en volgorde';

  @override
  String get data => 'Gegevens';

  @override
  String get dataSubtitle => 'Importeren, exporteren en lokale gegevens';

  @override
  String get todayProgress => 'Voortgang van vandaag';

  @override
  String get latestDay => 'Laatste dag';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registraties',
      one: '1 registratie',
      zero: 'Geen registraties',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Calorieën';

  @override
  String get protein => 'Eiwitten';

  @override
  String get carbs => 'Koolhydraten';

  @override
  String get fat => 'Vet';

  @override
  String get addDiaryEntry => 'Dagboekregistratie toevoegen';

  @override
  String get noEntriesToday => 'Vandaag geen registraties.';

  @override
  String addSearchToDiary(String search) {
    return '\"$search\" aan je dagboek toevoegen';
  }

  @override
  String get tapStartLoggingFood => 'Tik om voeding te gaan registreren.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Geen overeenkomende dagboekregistraties. Tik om dit voedingsmiddel aan te maken en te registreren.';

  @override
  String get add => 'Toevoegen';

  @override
  String get quickAdd => 'Snel toevoegen';

  @override
  String get scanBarcode => 'Barcode scannen';

  @override
  String get foodLibrary => 'Voedingsbibliotheek';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    return '$foodCount voedingsmiddelen · $mealCount maaltijden';
  }

  @override
  String get recentlyUsed => 'Onlangs gebruikt';

  @override
  String get quickActions => 'Snelle acties';

  @override
  String get addFood => 'Voedingsmiddel toevoegen';

  @override
  String get createMeal => 'Maaltijd maken';

  @override
  String get noFoodYet => 'Nog geen voeding';

  @override
  String get noMatchingFood => 'Geen overeenkomende voeding';

  @override
  String get addFirstFoodOrMeal =>
      'Voeg je eerste voedingsmiddel of maaltijd toe om je bibliotheek op te bouwen.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Niets komt overeen met “$search”. Wis de zoekopdracht om alles weer te zien.';
  }

  @override
  String get clearSearch => 'Zoekopdracht wissen';

  @override
  String get addMeal => 'Maaltijd toevoegen';

  @override
  String get noWeightsYet => 'Nog geen gewichten';

  @override
  String get noMatchingWeights => 'Geen overeenkomende gewichten';

  @override
  String get logFirstWeight =>
      'Registreer je eerste gewicht om de trend te gaan volgen.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Niets komt overeen met “$search”. Wis de zoekopdracht om alle registraties te zien.';
  }

  @override
  String get logWeight => 'Gewicht registreren';

  @override
  String get weightTrend => 'Gewichtstrend';

  @override
  String get weightTrendSubtitle => 'Recente metingen en algemene richting';

  @override
  String get bodyWeight => 'Lichaamsgewicht';

  @override
  String get options => 'Opties';

  @override
  String get day => 'Dag';

  @override
  String get week => 'Week';

  @override
  String get month => 'Maand';

  @override
  String get year => 'Jaar';

  @override
  String get dateRange => 'Datumbereik';

  @override
  String get startDate => 'Startdatum';

  @override
  String get stopDate => 'Einddatum';

  @override
  String get dataPoints => 'Gegevenspunten';

  @override
  String get customizeFields => 'Velden aanpassen';

  @override
  String get language => 'Taal';

  @override
  String get languageSubtitle => 'Kies de taal die FitBook gebruikt';

  @override
  String get languageSystem => 'Systeem';

  @override
  String get languageEnglish => 'Engels';

  @override
  String get languageSpanish => 'Spaans';

  @override
  String get languageFrench => 'Frans';

  @override
  String get languageGerman => 'Duits';

  @override
  String get languageItalian => 'Italiaans';

  @override
  String get languagePortugueseBrazil => 'Portugees (Brazilië)';

  @override
  String get languageDutch => 'Nederlands';

  @override
  String get languagePolish => 'Pools';

  @override
  String get languageJapanese => 'Japans';

  @override
  String get languageKorean => 'Koreaans';

  @override
  String get languageChineseSimplified => 'Chinees (vereenvoudigd)';

  @override
  String get appearanceSettings => 'Weergave-instellingen';

  @override
  String get delete => 'Verwijderen';

  @override
  String get confirmDelete => 'Verwijderen bevestigen';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Weet je zeker dat je $count records wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.',
      one:
          'Weet je zeker dat je 1 record wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Annuleren';

  @override
  String get search => 'Zoeken...';

  @override
  String get clear => 'Wissen';

  @override
  String get showMenu => 'Menu tonen';

  @override
  String get selectAll => 'Alles selecteren';

  @override
  String get edit => 'Bewerken';

  @override
  String get favorite => 'Favoriet';

  @override
  String get atLeastOneTab => 'Je hebt minstens één tabblad nodig';

  @override
  String get scrollableTabs => 'Scrollbare tabbladen';

  @override
  String get save => 'Opslaan';

  @override
  String get themeSystem => 'Systeem';

  @override
  String get themeDark => 'Donker';

  @override
  String get themeLight => 'Licht';

  @override
  String get pureBlackAmoled => 'Puur zwart (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => 'Gebruik puur zwart op AMOLED-schermen';

  @override
  String get systemColorScheme => 'Systeemkleurenschema';

  @override
  String get systemColorSchemeTooltip =>
      'Gebruik de primaire kleur van je apparaat in de app';

  @override
  String get showImages => 'Afbeeldingen tonen';

  @override
  String get showImagesTooltip =>
      'Kies en toon afbeeldingen op de dagboek- en voedingspagina\'s';

  @override
  String get curveLineGraphs => 'Gebogen lijngrafieken';

  @override
  String get curveLineGraphsTooltip =>
      'Gebruik vloeiende lijnen op de grafiekenpagina';

  @override
  String get weightStatCards => 'Statistiekkaarten voor gewicht';

  @override
  String get weightStatCardsTooltip =>
      'Toon gewichtsmetingen als een raster met statistiekkaarten in plaats van de standaardlijst';

  @override
  String get graphsStartAtZero => 'Grafieken beginnen bij nul';

  @override
  String get graphsStartAtZeroTooltip =>
      'Laat de Y-as van de grafiek altijd bij nul beginnen';

  @override
  String get navigationAnimation => 'Navigatie-animatie';

  @override
  String get animationFade => 'Vervagen';

  @override
  String get animationZoom => 'Zoomen';

  @override
  String get animationSlide => 'Schuiven';

  @override
  String get animationRise => 'Omhoogkomen';

  @override
  String get animationNone => 'Geen';

  @override
  String longDateFormat(String example) {
    return 'Lange datumnotatie ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Korte datumnotatie ($example)';
  }

  @override
  String get diarySettings => 'Dagboekinstellingen';

  @override
  String get diaryUnit => 'Dagboekeenheid';

  @override
  String get diarySummary => 'Dagboeksamenvatting';

  @override
  String get diarySummaryDivision => 'Verhouding - huidig / totaal';

  @override
  String get diarySummaryRemaining => 'Resterend';

  @override
  String get diarySummaryBoth => 'Beide - resterend (totaal)';

  @override
  String get diarySummaryNone => 'Geen';

  @override
  String get dailyCaloriesKcal => 'Dagelijkse calorieën (kcal)';

  @override
  String get dailyProteinG => 'Dagelijkse eiwitten (g)';

  @override
  String get dailyFatG => 'Dagelijks vet (g)';

  @override
  String get dailyCarbsG => 'Dagelijkse koolhydraten (g)';

  @override
  String get dailyFiberG => 'Dagelijkse vezels (g)';

  @override
  String get automaticDailies => 'Automatische dagdoelen';

  @override
  String get automaticDailiesTooltip =>
      'Bereken aanbevolen dagelijkse calorieën, eiwitten, vetten en koolhydraten automatisch op basis van je lichaamsgewicht';

  @override
  String get selectNameOnSubmit => 'Naam selecteren bij opslaan';

  @override
  String get reminders => 'Herinneringen';

  @override
  String get foodSettings => 'Voedingsinstellingen';

  @override
  String get foodUnit => 'Voedingseenheid';

  @override
  String get fields => 'Velden';

  @override
  String get favoriteNewFoods =>
      'Nieuwe voedingsmiddelen als favoriet markeren';

  @override
  String get pickFields => 'Velden kiezen';

  @override
  String get all => 'Alles';

  @override
  String get onlySelected => 'Alleen geselecteerde';

  @override
  String get weightSettings => 'Gewichtsinstellingen';

  @override
  String get targetWeight => 'Streefgewicht';

  @override
  String get positiveReinforcement => 'Positieve bekrachtiging';

  @override
  String get positiveReinforcementPreview =>
      'Bemoedigende berichten worden zo weergegeven!';

  @override
  String get dataSettings => 'Gegevensinstellingen';

  @override
  String get automaticBackup => 'Automatische back-up';

  @override
  String get shareDatabase => 'Database delen';

  @override
  String get openNotification => 'Melding openen';

  @override
  String get automaticBackupsEnabled => 'Automatische back-ups ingeschakeld';

  @override
  String get automaticBackupBody =>
      'FitBook maakt elke dag automatisch een back-up van je gegevens en afbeeldingen in de geselecteerde map.';

  @override
  String get backupSettings => 'Back-upinstellingen';

  @override
  String get backupSettingsChannelDescription =>
      'Meldingen over automatische back-ups';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Gebruikersnaam';

  @override
  String get password => 'Wachtwoord';

  @override
  String get close => 'Sluiten';

  @override
  String get loggedIn => 'Ingelogd';

  @override
  String get about => 'Over';

  @override
  String get version => 'Versie';

  @override
  String get whatsNew => 'Wat is er nieuw?';

  @override
  String get author => 'Auteur';

  @override
  String get license => 'Licentie';

  @override
  String get donate => 'Doneren';

  @override
  String get supportProject => 'Help dit project te ondersteunen';

  @override
  String get leaveReview => 'Beoordeling achterlaten';

  @override
  String get rateOnPlayStore => 'Beoordeel FitBook in de Play Store';

  @override
  String get sourceCode => 'Broncode';

  @override
  String get foods => 'Voedingsmiddelen';

  @override
  String get backup => 'Back-up';

  @override
  String get exportData => 'Gegevens exporteren';

  @override
  String get importData => 'Gegevens importeren';

  @override
  String get failedImportData => 'Importeren van gegevens mislukt';

  @override
  String get copyError => 'Fout kopiëren';

  @override
  String get deleteRecords => 'Gegevens verwijderen';

  @override
  String get unusedFood => 'Ongebruikte voedingsmiddelen';

  @override
  String get database => 'Database';

  @override
  String get deleteAllWeightsConfirm =>
      'Weet je zeker dat je alle gewichtsmetingen wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get deleteDatabaseConfirm =>
      'Weet je zeker dat je de database wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt en verwijdert al je gegevens.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Weet je zeker dat je alle voedingsmiddelen en dagboekitems wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Weet je zeker dat je $count ongebruikte voedingsmiddelen wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.',
      one:
          'Weet je zeker dat je 1 ongebruikt voedingsmiddel wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Weet je zeker dat je alle dagboekitems wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.';
}
