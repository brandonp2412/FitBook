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
}
