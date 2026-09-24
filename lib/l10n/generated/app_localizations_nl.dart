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
  String get loadDataFailed => 'Deze gegevens konden niet worden geladen.';

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
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registraties bewerken',
      one: '1 registratie bewerken',
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
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount voedingsmiddelen',
      one: '1 voedingsmiddel',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount maaltijden',
      one: '1 maaltijd',
    );
    return '$_temp0 · $_temp1';
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
  String get today => 'Vandaag';

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
  String get languageChineseTraditional => 'Chinees (traditioneel)';

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

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Afbeelding vervangen';

  @override
  String get takePhoto => 'Foto maken';

  @override
  String get deleteImage => 'Afbeelding verwijderen';

  @override
  String get filters => 'Filters';

  @override
  String get foodGroup => 'Voedingsgroep';

  @override
  String get exampleFruit => 'Fruit';

  @override
  String clearFiltersCount(int count) {
    return 'Wissen ($count)';
  }

  @override
  String get done => 'Klaar';

  @override
  String get showFilters => 'Filters tonen';

  @override
  String get repeatEntry => 'Invoer herhalen';

  @override
  String get timeOfDay => 'Tijdstip';

  @override
  String get everyDay => 'Elke dag';

  @override
  String get repeatEveryDayForYear =>
      'Maak deze invoer het komende jaar elke dag aan';

  @override
  String get repeatOn => 'Herhalen op';

  @override
  String get weekdayMon => 'Ma';

  @override
  String get weekdayTue => 'Di';

  @override
  String get weekdayWed => 'Wo';

  @override
  String get weekdayThu => 'Do';

  @override
  String get weekdayFri => 'Vr';

  @override
  String get weekdaySat => 'Za';

  @override
  String get weekdaySun => 'Zo';

  @override
  String get schedule => 'Plannen';

  @override
  String get enterValidNutritionValues => 'Voer geldige voedingswaarden in';

  @override
  String get quickAddTitle => 'Snel toevoegen';

  @override
  String get kilojoules => 'Kilojoules';

  @override
  String get createdDate => 'Aanmaakdatum';

  @override
  String get failedMigrations => 'Mislukte migraties';

  @override
  String get failedMigrationsDescription =>
      'Er ging iets mis bij het maken of bijwerken van de database. Meestal kun je dit oplossen door je records te verwijderen en opnieuw aan te maken.';

  @override
  String get errorMessage => 'Foutmelding:';

  @override
  String get createIssue => 'Probleem melden';

  @override
  String get cameraPermissionRequired =>
      'Cameratoestemming is vereist om te scannen.';

  @override
  String get scanFoodBarcode => 'Barcode van een voedingsmiddel scannen';

  @override
  String get holdBarcodeInFrame => 'Houd de barcode binnen het kader';

  @override
  String get pinchToZoom => 'Knijp om te zoomen';

  @override
  String get cameraStartFailed => 'De camera kon niet worden gestart';

  @override
  String get editDiaryEntry => 'Dagboekitem bewerken';

  @override
  String get addFoodToDiary => 'Voedingsmiddel aan dagboek toevoegen';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Weet je zeker dat je $name wilt verwijderen?';
  }

  @override
  String get imageError => 'Afbeeldingsfout';

  @override
  String get setImage => 'Afbeelding instellen';

  @override
  String get name => 'Naam';

  @override
  String get searchFoodsAndMeals => 'Voedingsmiddelen en maaltijden zoeken...';

  @override
  String get clearSelection => 'Selectie wissen';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Barcode niet gevonden. Sla op om toe te voegen.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'OpenFoodFacts doorzoeken naar “$name”';
  }

  @override
  String get meal => 'Maaltijd';

  @override
  String get quantity => 'Hoeveelheid';

  @override
  String get unit => 'Eenheid';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Portie ($amount $unit)';
  }

  @override
  String get barcode => 'Barcode';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (per $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '$nutrient per $quantity $unit';
  }

  @override
  String get fiber => 'Vezels';

  @override
  String get unitServing => 'Portie';

  @override
  String get unitGrams => 'Gram';

  @override
  String get unitMilliliters => 'Milliliter';

  @override
  String get unitKilojoules => 'Kilojoule';

  @override
  String get unitCups => 'Kopjes';

  @override
  String get unitTablespoons => 'Eetlepels';

  @override
  String get unitMilligrams => 'Milligram';

  @override
  String get unitTeaspoons => 'Theelepels';

  @override
  String get unitOunces => 'Ounces';

  @override
  String get unitPounds => 'Ponden';

  @override
  String get unitKilograms => 'Kilogram';

  @override
  String get unitLiters => 'Liter';

  @override
  String get nameConflict => 'Naamconflict';

  @override
  String get replaceExistingFood =>
      'Er bestaat al een voedingsmiddel met deze naam. Wil je het oude vervangen?';

  @override
  String get no => 'Nee';

  @override
  String get yes => 'Ja';

  @override
  String get editFood => 'Voedingsmiddel bewerken';

  @override
  String confirmDeleteFood(String name) {
    return 'Weet je zeker dat je $name wilt verwijderen?';
  }

  @override
  String get caloriesKcal => 'Calorieën (kcal)';

  @override
  String get kilojoulesKj => 'Kilojoule (kJ)';

  @override
  String get servingSize => 'Portiegrootte';

  @override
  String get servingUnit => 'Portie-eenheid';

  @override
  String get saveAsNewCopy => 'Opslaan als nieuwe kopie';

  @override
  String get filterFoods => 'Voedingsmiddelen filteren';

  @override
  String get narrowFoodsFilters =>
      'Verfijn de lijst met een combinatie van filters.';

  @override
  String get foodDetails => 'Voedingsdetails';

  @override
  String get exampleFruitHint => 'bijv. Fruit';

  @override
  String get servingSizeRangeHint => 'Stel een minimum, maximum of beide in.';

  @override
  String get minimum => 'Minimum';

  @override
  String get maximum => 'Maximum';

  @override
  String get noMinimum => 'Geen minimum';

  @override
  String get noMaximum => 'Geen maximum';

  @override
  String get clearAll => 'Alles wissen';

  @override
  String get searchOpenFoodFacts => 'Zoeken in Open Food Facts';

  @override
  String get noMatchingProducts => 'Geen overeenkomende producten';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Probeer een andere naam of scan een barcode.';

  @override
  String get enterFoodNameToSearch =>
      'Voer hierboven een voedingsmiddel in en start de zoekopdracht.';

  @override
  String get submitToSearch => 'Zoeken...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g eiwit';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count voedingsmiddelen bewerken',
      one: '1 voedingsmiddel bewerken',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'Maaltijd bewerken';

  @override
  String get addImage => 'Afbeelding toevoegen';

  @override
  String get noFoodsInMeal => 'Nog geen voedingsmiddelen in deze maaltijd';

  @override
  String get addFoodToMealHint =>
      'Voeg een voedingsmiddel toe om deze maaltijd samen te stellen.';

  @override
  String get remove => 'Verwijderen';

  @override
  String get searchFoods => 'Voedingsmiddelen zoeken...';

  @override
  String get noFoodsFound => 'Geen voedingsmiddelen gevonden';

  @override
  String nothingMatchesSearch(String search) {
    return 'Niets komt overeen met ‘$search’.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Voeg eerst voedingsmiddelen toe aan je bibliotheek voordat je ze aan een maaltijd toevoegt.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'Nog geen gegevens';

  @override
  String get completePlansToViewGraphs =>
      'Voltooi enkele plannen om hier grafieken te bekijken.';

  @override
  String get value => 'Waarde';

  @override
  String get goal => 'Doel';

  @override
  String get notSet => 'Niet ingesteld';

  @override
  String get trend => 'Trend';

  @override
  String get smooth => 'Afvlakking';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gemiddelde over $count punten',
      one: 'Gemiddelde over 1 punt',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Gewicht bewerken';

  @override
  String get addWeight => 'Gewicht toevoegen';

  @override
  String shareWeight(String value, String unit) {
    return 'Ik heb me net gewogen: $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Gewicht ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Voer het gewicht in';

  @override
  String get pleaseEnterValidWeight => 'Voer een geldig gewicht in';

  @override
  String get lastWeight => 'Vorig gewicht';

  @override
  String unitWithValue(String unit) {
    return 'Eenheid ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Eenheid behouden als $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Omzetten naar $unit';
  }

  @override
  String get removeImage => 'Afbeelding verwijderen';

  @override
  String get mealRemindersEnabled => 'Maaltijdherinneringen ingeschakeld';

  @override
  String get mealRemindersEnabledBody =>
      'We herinneren je eraan om ontbijt, lunch of avondeten te registreren als je dat nog niet hebt gedaan.';

  @override
  String get reminderSettingsChannel => 'Herinneringsinstellingen';

  @override
  String get reminderSettingsChannelDescription =>
      'Meldingen over FitBook-herinneringen';

  @override
  String get breakfastReminderTitle => 'Vergeet niet je ontbijt te registreren';

  @override
  String get breakfastRemindersChannel => 'Ontbijtherinneringen';

  @override
  String get breakfastRemindersChannelDescription =>
      'Herinneringen om je ontbijt te registreren';

  @override
  String get lunchReminderTitle => 'Vergeet niet je lunch te registreren';

  @override
  String get lunchRemindersChannel => 'Lunchherinneringen';

  @override
  String get lunchRemindersChannelDescription =>
      'Herinneringen om je lunch te registreren';

  @override
  String get dinnerReminderTitle => 'Vergeet niet je avondeten te registreren';

  @override
  String get dinnerRemindersChannel => 'Avondetenherinneringen';

  @override
  String get dinnerRemindersChannelDescription =>
      'Herinneringen om je avondeten te registreren';

  @override
  String get reinforcementGreatJob =>
      'Goed gedaan! Je harde werk werpt zijn vruchten af.';

  @override
  String get reinforcementKeepItUp =>
      'Ga zo door! Je boekt uitstekende vooruitgang.';

  @override
  String get reinforcementFantastic =>
      'Fantastisch! Je inzet levert resultaat op.';

  @override
  String get reinforcementWellDone =>
      'Goed bezig! Je bent weer een stap dichter bij je doel.';

  @override
  String get reinforcementImpressive =>
      'Indrukwekkend! Je inspanningen werpen hun vruchten af.';

  @override
  String get reinforcementAmazing => 'Geweldig! Je bent goed op weg.';

  @override
  String get reinforcementBravo => 'Bravo! Je inzet is bewonderenswaardig.';

  @override
  String get reinforcementExcellent =>
      'Uitstekend! Je doorzettingsvermogen is inspirerend.';

  @override
  String get reinforcementSuperb => 'Top! Je doet het fantastisch.';

  @override
  String get reinforcementIncredible =>
      'Ongelooflijk! Je vooruitgang is zichtbaar.';

  @override
  String get reinforcementWayToGoKing => 'Lekker bezig, koning!';

  @override
  String get reinforcementYeahBuddy => 'Ja maat!';

  @override
  String get reinforcementThatsHowItsDone => 'Zo doe je dat.';

  @override
  String get reinforcementEasyAsPie => 'Appeltje-eitje.';

  @override
  String get reinforcementDoingGreat => 'Je doet het geweldig.';

  @override
  String get reinforcementProgressNice => 'Zie ik daar vooruitgang? Lekker.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'Nog $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return 'Nog $remaining $unit ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'Suikers';

  @override
  String get nutrientCholesterol => 'Cholesterol';

  @override
  String get nutrientSaturatedFat => 'Verzadigde vetten';

  @override
  String get nutrientCalcium => 'Calcium';

  @override
  String get nutrientIron => 'IJzer';

  @override
  String get nutrientPotassium => 'Kalium';

  @override
  String get nutrientMagnesium => 'Magnesium';

  @override
  String get nutrientVitaminA => 'Vitamine A';

  @override
  String get nutrientVitaminC => 'Vitamine C';

  @override
  String get nutrientVitaminB12 => 'Vitamine B12';

  @override
  String get nutrientVitaminD => 'Vitamine D';

  @override
  String get nutrientVitaminE => 'Vitamine E';

  @override
  String get nutrientAddedSugar => 'Toegevoegde suikers';

  @override
  String get nutrientNetCarbs => 'Netto koolhydraten';

  @override
  String get nutrientWater => 'Water';

  @override
  String get nutrientOmega3 => 'Omega 3-vetzuren';

  @override
  String get nutrientOmega6 => 'Omega 6-vetzuren';

  @override
  String get nutrientPralScore => 'PRAL-score';

  @override
  String get nutrientTransFat => 'Transvetten';

  @override
  String get nutrientSolubleFiber => 'Oplosbare vezels';

  @override
  String get nutrientInsolubleFiber => 'Onoplosbare vezels';

  @override
  String get nutrientPhosphorus => 'Fosfor';

  @override
  String get nutrientSodium => 'Natrium';

  @override
  String get nutrientZinc => 'Zink';

  @override
  String get nutrientCopper => 'Koper';

  @override
  String get nutrientManganese => 'Mangaan';

  @override
  String get nutrientSelenium => 'Seleen';

  @override
  String get nutrientFluoride => 'Fluoride';

  @override
  String get nutrientMolybdenum => 'Molybdeen';

  @override
  String get nutrientChloride => 'Chloride';

  @override
  String get nutrientSucrose => 'Sacharose';

  @override
  String get nutrientGlucose => 'Glucose';

  @override
  String get nutrientFructose => 'Fructose';

  @override
  String get nutrientLactose => 'Lactose';

  @override
  String get nutrientMaltose => 'Maltose';

  @override
  String get nutrientGalactose => 'Galactose';

  @override
  String get nutrientStarch => 'Zetmeel';

  @override
  String get nutrientSugarAlcohols => 'Suikeralcoholen';

  @override
  String get nutrientThiaminB1 => 'Thiamine (B1)';

  @override
  String get nutrientRiboflavinB2 => 'Riboflavine (B2)';

  @override
  String get nutrientNiacinB3 => 'Niacine (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'Pantotheenzuur (B5)';

  @override
  String get nutrientVitaminB6 => 'Vitamine B6';

  @override
  String get nutrientBiotinB7 => 'Biotine (B7)';

  @override
  String get nutrientFolateB9 => 'Folaat (B9)';

  @override
  String get nutrientFolicAcid => 'Foliumzuur';

  @override
  String get nutrientFoodFolate => 'Folaat uit voeding';

  @override
  String get nutrientFolateDfe => 'Voedingsfolaat-equivalenten (DFE)';

  @override
  String get nutrientCholine => 'Choline';

  @override
  String get nutrientBetaine => 'Betaïne';

  @override
  String get nutrientRetinol => 'Retinol';

  @override
  String get nutrientBetaCarotene => 'Bètacaroteen';

  @override
  String get nutrientAlphaCarotene => 'Alfacaroteen';

  @override
  String get nutrientLycopene => 'Lycopeen';

  @override
  String get nutrientLuteinZeaxanthin => 'Luteïne + zeaxanthine';

  @override
  String get nutrientVitaminD2 => 'Vitamine D2 (ergocalciferol)';

  @override
  String get nutrientVitaminD3 => 'Vitamine D3 (cholecalciferol)';

  @override
  String get nutrientVitaminK => 'Vitamine K';

  @override
  String get nutrientDihydrophylloquinone => 'Dihydrofyllochinon';

  @override
  String get nutrientMenaquinone4 => 'Menachinon-4';

  @override
  String get nutrientMonounsaturatedFat => 'Enkelvoudig onverzadigde vetten';

  @override
  String get nutrientPolyunsaturatedFat => 'Meervoudig onverzadigde vetten';

  @override
  String get nutrientAla => 'Alfa-linoleenzuur (ALA)';

  @override
  String get nutrientEpa => 'Eicosapentaeenzuur (EPA)';

  @override
  String get nutrientDpa => 'Docosapentaeenzuur (DPA)';

  @override
  String get nutrientDha => 'Docosahexaeenzuur (DHA)';

  @override
  String get nutrientAlanine => 'Alanine';

  @override
  String get nutrientAlcohol => 'Alcohol';

  @override
  String get nutrientArginine => 'Arginine';

  @override
  String get nutrientAsparticAcid => 'Asparaginezuur';

  @override
  String get nutrientCystine => 'Cystine';

  @override
  String get nutrientGlutamicAcid => 'Glutaminezuur';

  @override
  String get nutrientGlycine => 'Glycine';

  @override
  String get nutrientHistidine => 'Histidine';

  @override
  String get nutrientHydroxyproline => 'Hydroxyproline';

  @override
  String get nutrientIsoleucine => 'Isoleucine';

  @override
  String get nutrientLeucine => 'Leucine';

  @override
  String get nutrientLysine => 'Lysine';

  @override
  String get nutrientMethionine => 'Methionine';

  @override
  String get nutrientPhenylalanine => 'Fenylalanine';

  @override
  String get nutrientProline => 'Proline';

  @override
  String get nutrientSerine => 'Serine';

  @override
  String get nutrientThreonine => 'Threonine';

  @override
  String get nutrientTryptophan => 'Tryptofaan';

  @override
  String get nutrientTyrosine => 'Tyrosine';

  @override
  String get nutrientValine => 'Valine';

  @override
  String get nutrientCaffeine => 'Cafeïne';

  @override
  String get nutrientTheobromine => 'Theobromine';

  @override
  String servingWeightNumber(int number) {
    return 'Portiegewicht $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'Portiebeschrijving $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'Gewicht voor 200 kcal';
}
