// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Diario';

  @override
  String get navGraph => 'Grafico';

  @override
  String get navFood => 'Alimenti';

  @override
  String get navWeight => 'Peso';

  @override
  String get navError => 'Errore';

  @override
  String get settings => 'Impostazioni';

  @override
  String get invalidTabSettings => 'Impostazioni delle schede non valide.';

  @override
  String newVersion(String version) {
    return 'Nuova versione $version';
  }

  @override
  String get changes => 'Novità';

  @override
  String get searchSettings => 'Cerca nelle impostazioni...';

  @override
  String get appearance => 'Aspetto';

  @override
  String get appearanceSubtitle => 'Tema, colori e visualizzazione dei grafici';

  @override
  String get diary => 'Diario';

  @override
  String get diarySubtitle =>
      'Obiettivi giornalieri, riepiloghi e registrazione';

  @override
  String get food => 'Alimenti';

  @override
  String get foodSubtitle => 'Unità, campi e valori predefiniti';

  @override
  String get weight => 'Peso';

  @override
  String get weightSubtitle => 'Unità di peso, obiettivi e visualizzazione';

  @override
  String get tabs => 'Schede';

  @override
  String get tabsSubtitle => 'Schede di navigazione e ordine';

  @override
  String get data => 'Dati';

  @override
  String get dataSubtitle => 'Importazione, esportazione e dati locali';

  @override
  String get todayProgress => 'Progressi di oggi';

  @override
  String get latestDay => 'Ultimo giorno';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count voci registrate',
      one: '1 voce registrata',
      zero: 'Nessuna voce registrata',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Calorie';

  @override
  String get protein => 'Proteine';

  @override
  String get carbs => 'Carboidrati';

  @override
  String get fat => 'Grassi';

  @override
  String get addDiaryEntry => 'Aggiungi voce al diario';

  @override
  String get noEntriesToday => 'Nessuna voce oggi.';

  @override
  String addSearchToDiary(String search) {
    return 'Aggiungi \"$search\" al diario';
  }

  @override
  String get tapStartLoggingFood =>
      'Tocca per iniziare a registrare gli alimenti.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Nessuna voce corrispondente. Tocca per creare questo alimento e registrarlo.';

  @override
  String get add => 'Aggiungi';

  @override
  String get quickAdd => 'Aggiunta rapida';

  @override
  String get scanBarcode => 'Scansiona codice a barre';

  @override
  String get foodLibrary => 'Libreria alimenti';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    return '$foodCount alimenti · $mealCount pasti';
  }

  @override
  String get recentlyUsed => 'Usati di recente';

  @override
  String get quickActions => 'Azioni rapide';

  @override
  String get addFood => 'Aggiungi alimento';

  @override
  String get createMeal => 'Crea pasto';

  @override
  String get noFoodYet => 'Nessun alimento';

  @override
  String get noMatchingFood => 'Nessun alimento corrispondente';

  @override
  String get addFirstFoodOrMeal =>
      'Aggiungi il primo alimento o pasto per iniziare a creare la tua libreria.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Nessun risultato per “$search”. Cancella la ricerca per vedere di nuovo tutto.';
  }

  @override
  String get clearSearch => 'Cancella ricerca';

  @override
  String get addMeal => 'Aggiungi pasto';

  @override
  String get noWeightsYet => 'Nessun peso registrato';

  @override
  String get noMatchingWeights => 'Nessun peso corrispondente';

  @override
  String get logFirstWeight =>
      'Registra il primo peso per iniziare a seguirne l’andamento.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Nessun risultato per “$search”. Cancella la ricerca per vedere tutte le voci.';
  }

  @override
  String get logWeight => 'Registra peso';

  @override
  String get weightTrend => 'Andamento del peso';

  @override
  String get weightTrendSubtitle => 'Misurazioni recenti e andamento generale';

  @override
  String get bodyWeight => 'Peso corporeo';

  @override
  String get options => 'Opzioni';

  @override
  String get day => 'Giorno';

  @override
  String get week => 'Settimana';

  @override
  String get month => 'Mese';

  @override
  String get year => 'Anno';

  @override
  String get dateRange => 'Intervallo di date';

  @override
  String get startDate => 'Data iniziale';

  @override
  String get stopDate => 'Data finale';

  @override
  String get dataPoints => 'Punti dati';

  @override
  String get customizeFields => 'Personalizza campi';

  @override
  String get language => 'Lingua';

  @override
  String get languageSubtitle => 'Scegli la lingua usata da FitBook';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageEnglish => 'Inglese';

  @override
  String get languageSpanish => 'Spagnolo';

  @override
  String get languageFrench => 'Francese';

  @override
  String get languageGerman => 'Tedesco';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languagePortugueseBrazil => 'Portoghese (Brasile)';

  @override
  String get languageDutch => 'Olandese';

  @override
  String get languagePolish => 'Polacco';

  @override
  String get languageJapanese => 'Giapponese';

  @override
  String get languageKorean => 'Coreano';

  @override
  String get languageChineseSimplified => 'Cinese (semplificato)';

  @override
  String get appearanceSettings => 'Impostazioni aspetto';
}
