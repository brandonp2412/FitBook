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
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Modifica $count voci',
      one: 'Modifica 1 voce',
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
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount alimenti',
      one: '1 alimento',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount pasti',
      one: '1 pasto',
    );
    return '$_temp0 · $_temp1';
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
  String get today => 'Oggi';

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

  @override
  String get delete => 'Elimina';

  @override
  String get confirmDelete => 'Conferma eliminazione';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Vuoi davvero eliminare $count elementi? Questa azione non può essere annullata.',
      one:
          'Vuoi davvero eliminare 1 elemento? Questa azione non può essere annullata.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Annulla';

  @override
  String get search => 'Cerca...';

  @override
  String get clear => 'Cancella';

  @override
  String get showMenu => 'Mostra menu';

  @override
  String get selectAll => 'Seleziona tutto';

  @override
  String get edit => 'Modifica';

  @override
  String get favorite => 'Preferito';

  @override
  String get atLeastOneTab => 'Devi mantenere almeno una scheda';

  @override
  String get scrollableTabs => 'Schede scorrevoli';

  @override
  String get save => 'Salva';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeDark => 'Scuro';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get pureBlackAmoled => 'Nero puro (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => 'Usa il nero puro sui display AMOLED';

  @override
  String get systemColorScheme => 'Schema colori di sistema';

  @override
  String get systemColorSchemeTooltip =>
      'Usa il colore principale del dispositivo nell’app';

  @override
  String get showImages => 'Mostra immagini';

  @override
  String get showImagesTooltip =>
      'Scegli e mostra immagini nelle pagine diario e alimenti';

  @override
  String get curveLineGraphs => 'Grafici a linee curve';

  @override
  String get curveLineGraphsTooltip =>
      'Usa curve morbide nella pagina dei grafici';

  @override
  String get weightStatCards => 'Schede statistiche del peso';

  @override
  String get weightStatCardsTooltip =>
      'Mostra le registrazioni del peso come griglia di schede statistiche invece dell’elenco predefinito';

  @override
  String get graphsStartAtZero => 'Grafici a partire da zero';

  @override
  String get graphsStartAtZeroTooltip =>
      'Fai sempre partire da zero l’asse Y del grafico';

  @override
  String get navigationAnimation => 'Animazione di navigazione';

  @override
  String get animationFade => 'Dissolvenza';

  @override
  String get animationZoom => 'Zoom';

  @override
  String get animationSlide => 'Scorrimento';

  @override
  String get animationRise => 'Salita';

  @override
  String get animationNone => 'Nessuna';

  @override
  String longDateFormat(String example) {
    return 'Formato data lungo ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Formato data breve ($example)';
  }

  @override
  String get diarySettings => 'Impostazioni diario';

  @override
  String get diaryUnit => 'Unità del diario';

  @override
  String get diarySummary => 'Riepilogo diario';

  @override
  String get diarySummaryDivision => 'Rapporto - attuale / totale';

  @override
  String get diarySummaryRemaining => 'Rimanente';

  @override
  String get diarySummaryBoth => 'Entrambi - rimanente (totale)';

  @override
  String get diarySummaryNone => 'Nessuno';

  @override
  String get dailyCaloriesKcal => 'Calorie giornaliere (kcal)';

  @override
  String get dailyProteinG => 'Proteine giornaliere (g)';

  @override
  String get dailyFatG => 'Grassi giornalieri (g)';

  @override
  String get dailyCarbsG => 'Carboidrati giornalieri (g)';

  @override
  String get dailyFiberG => 'Fibre giornaliere (g)';

  @override
  String get automaticDailies => 'Obiettivi giornalieri automatici';

  @override
  String get automaticDailiesTooltip =>
      'Calcola automaticamente calorie, proteine, grassi e carboidrati giornalieri consigliati in base al peso corporeo';

  @override
  String get selectNameOnSubmit => 'Seleziona il nome al salvataggio';

  @override
  String get reminders => 'Promemoria';

  @override
  String get foodSettings => 'Impostazioni alimenti';

  @override
  String get foodUnit => 'Unità alimento';

  @override
  String get fields => 'Campi';

  @override
  String get favoriteNewFoods => 'Aggiungi i nuovi alimenti ai preferiti';

  @override
  String get pickFields => 'Scegli campi';

  @override
  String get all => 'Tutti';

  @override
  String get onlySelected => 'Solo selezionati';

  @override
  String get weightSettings => 'Impostazioni peso';

  @override
  String get targetWeight => 'Peso obiettivo';

  @override
  String get positiveReinforcement => 'Rinforzo positivo';

  @override
  String get positiveReinforcementPreview =>
      'I messaggi di incoraggiamento verranno mostrati così!';

  @override
  String get dataSettings => 'Impostazioni dati';

  @override
  String get automaticBackup => 'Backup automatico';

  @override
  String get shareDatabase => 'Condividi database';

  @override
  String get openNotification => 'Apri notifica';

  @override
  String get automaticBackupsEnabled => 'Backup automatici attivati';

  @override
  String get automaticBackupBody =>
      'FitBook eseguirà automaticamente ogni giorno il backup dei dati e delle immagini nella cartella selezionata.';

  @override
  String get backupSettings => 'Impostazioni backup';

  @override
  String get backupSettingsChannelDescription =>
      'Notifiche sui backup automatici';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Nome utente';

  @override
  String get password => 'Password';

  @override
  String get close => 'Chiudi';

  @override
  String get loggedIn => 'Accesso effettuato';

  @override
  String get about => 'Informazioni';

  @override
  String get version => 'Versione';

  @override
  String get whatsNew => 'Novità';

  @override
  String get author => 'Autore';

  @override
  String get license => 'Licenza';

  @override
  String get donate => 'Dona';

  @override
  String get supportProject => 'Aiuta a sostenere questo progetto';

  @override
  String get leaveReview => 'Lascia una recensione';

  @override
  String get rateOnPlayStore => 'Valuta FitBook sul Play Store';

  @override
  String get sourceCode => 'Codice sorgente';

  @override
  String get foods => 'Alimenti';

  @override
  String get backup => 'Backup';

  @override
  String get exportData => 'Esporta dati';

  @override
  String get importData => 'Importa dati';

  @override
  String get failedImportData => 'Impossibile importare i dati';

  @override
  String get copyError => 'Copia errore';

  @override
  String get deleteRecords => 'Elimina record';

  @override
  String get unusedFood => 'Alimenti inutilizzati';

  @override
  String get database => 'Database';

  @override
  String get deleteAllWeightsConfirm =>
      'Vuoi davvero eliminare tutte le registrazioni del peso? Questa azione non può essere annullata.';

  @override
  String get deleteDatabaseConfirm =>
      'Vuoi davvero eliminare il database? Questa azione non può essere annullata e cancellerà tutti i tuoi dati.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Vuoi davvero eliminare tutti gli alimenti e le voci del diario? Questa azione non può essere annullata.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Vuoi davvero eliminare $count alimenti inutilizzati? Questa azione è irreversibile.',
      one:
          'Vuoi davvero eliminare 1 alimento inutilizzato? Questa azione è irreversibile.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Vuoi davvero eliminare tutte le voci del diario? Questa azione non può essere annullata.';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Sostituisci immagine';

  @override
  String get takePhoto => 'Scatta foto';

  @override
  String get deleteImage => 'Elimina immagine';

  @override
  String get filters => 'Filtri';

  @override
  String get foodGroup => 'Gruppo alimentare';

  @override
  String get exampleFruit => 'Frutta';

  @override
  String clearFiltersCount(int count) {
    return 'Cancella ($count)';
  }

  @override
  String get done => 'Fatto';

  @override
  String get showFilters => 'Mostra filtri';

  @override
  String get repeatEntry => 'Ripeti voce';

  @override
  String get timeOfDay => 'Ora del giorno';

  @override
  String get everyDay => 'Ogni giorno';

  @override
  String get repeatEveryDayForYear =>
      'Crea questa voce ogni giorno per il prossimo anno';

  @override
  String get repeatOn => 'Ripeti il';

  @override
  String get weekdayMon => 'Lun';

  @override
  String get weekdayTue => 'Mar';

  @override
  String get weekdayWed => 'Mer';

  @override
  String get weekdayThu => 'Gio';

  @override
  String get weekdayFri => 'Ven';

  @override
  String get weekdaySat => 'Sab';

  @override
  String get weekdaySun => 'Dom';

  @override
  String get schedule => 'Pianifica';

  @override
  String get enterValidNutritionValues =>
      'Inserisci valori nutrizionali validi';

  @override
  String get quickAddTitle => 'Aggiunta rapida';

  @override
  String get kilojoules => 'Chilojoule';

  @override
  String get createdDate => 'Data di creazione';

  @override
  String get failedMigrations => 'Migrazioni non riuscite';

  @override
  String get failedMigrationsDescription =>
      'Si è verificato un problema durante la creazione o l’aggiornamento del database. Di solito puoi risolverlo eliminando e ricreando i record.';

  @override
  String get errorMessage => 'Messaggio di errore:';

  @override
  String get createIssue => 'Crea segnalazione';

  @override
  String get cameraPermissionRequired =>
      'Per eseguire la scansione è necessaria l’autorizzazione alla fotocamera.';

  @override
  String get scanFoodBarcode => 'Scansiona il codice a barre di un alimento';

  @override
  String get holdBarcodeInFrame =>
      'Mantieni il codice a barre all’interno del riquadro';

  @override
  String get pinchToZoom => 'Pizzica per zoomare';

  @override
  String get cameraStartFailed => 'Impossibile avviare la fotocamera';

  @override
  String get editDiaryEntry => 'Modifica voce del diario';

  @override
  String get addFoodToDiary => 'Aggiungi alimento al diario';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Vuoi davvero eliminare $name?';
  }

  @override
  String get imageError => 'Errore immagine';

  @override
  String get setImage => 'Imposta immagine';

  @override
  String get name => 'Nome';

  @override
  String get searchFoodsAndMeals => 'Cerca alimenti e pasti...';

  @override
  String get clearSelection => 'Cancella selezione';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Codice a barre non trovato. Salva per aggiungerlo.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Cerca \"$name\" su OpenFoodFacts';
  }

  @override
  String get meal => 'Pasto';

  @override
  String get quantity => 'Quantità';

  @override
  String get unit => 'Unità';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Porzione ($amount $unit)';
  }

  @override
  String get barcode => 'Codice a barre';

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
  String get fiber => 'Fibre';

  @override
  String get unitServing => 'Porzione';

  @override
  String get unitGrams => 'Grammi';

  @override
  String get unitMilliliters => 'Millilitri';

  @override
  String get unitKilojoules => 'Kilojoule';

  @override
  String get unitCups => 'Tazze';

  @override
  String get unitTablespoons => 'Cucchiai';

  @override
  String get unitMilligrams => 'Milligrammi';

  @override
  String get unitTeaspoons => 'Cucchiaini';

  @override
  String get unitOunces => 'Once';

  @override
  String get unitPounds => 'Libbre';

  @override
  String get unitKilograms => 'Chilogrammi';

  @override
  String get unitLiters => 'Litri';

  @override
  String get nameConflict => 'Conflitto di nome';

  @override
  String get replaceExistingFood =>
      'Esiste già un alimento con questo nome. Vuoi sostituire quello precedente?';

  @override
  String get no => 'No';

  @override
  String get yes => 'Sì';

  @override
  String get editFood => 'Modifica alimento';

  @override
  String confirmDeleteFood(String name) {
    return 'Vuoi davvero eliminare $name?';
  }

  @override
  String get caloriesKcal => 'Calorie (kcal)';

  @override
  String get kilojoulesKj => 'Kilojoule (kJ)';

  @override
  String get servingSize => 'Dimensione della porzione';

  @override
  String get servingUnit => 'Unità della porzione';

  @override
  String get saveAsNewCopy => 'Salva come nuova copia';

  @override
  String get filterFoods => 'Filtra alimenti';

  @override
  String get narrowFoodsFilters =>
      'Restringi l’elenco usando qualsiasi combinazione di filtri.';

  @override
  String get foodDetails => 'Dettagli dell’alimento';

  @override
  String get exampleFruitHint => 'es. Frutta';

  @override
  String get servingSizeRangeHint =>
      'Imposta un minimo, un massimo o entrambi.';

  @override
  String get minimum => 'Minimo';

  @override
  String get maximum => 'Massimo';

  @override
  String get noMinimum => 'Nessun minimo';

  @override
  String get noMaximum => 'Nessun massimo';

  @override
  String get clearAll => 'Cancella tutto';

  @override
  String get searchOpenFoodFacts => 'Cerca in Open Food Facts';

  @override
  String get noMatchingProducts => 'Nessun prodotto corrispondente';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Prova un altro nome o scansiona un codice a barre.';

  @override
  String get enterFoodNameToSearch =>
      'Inserisci sopra il nome di un alimento, quindi avvia la ricerca.';

  @override
  String get submitToSearch => 'Avvia la ricerca...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g di proteine';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Modifica $count alimenti',
      one: 'Modifica 1 alimento',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'Modifica pasto';

  @override
  String get addImage => 'Aggiungi immagine';

  @override
  String get noFoodsInMeal => 'Non ci sono ancora alimenti in questo pasto';

  @override
  String get addFoodToMealHint =>
      'Aggiungi un alimento per iniziare a comporre questo pasto.';

  @override
  String get remove => 'Rimuovi';

  @override
  String get searchFoods => 'Cerca alimenti...';

  @override
  String get noFoodsFound => 'Nessun alimento trovato';

  @override
  String nothingMatchesSearch(String search) {
    return 'Nessun risultato per “$search”.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Aggiungi prima degli alimenti alla tua libreria prima di aggiungerli a un pasto.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'Ancora nessun dato';

  @override
  String get completePlansToViewGraphs =>
      'Completa alcuni piani per visualizzare qui i grafici.';

  @override
  String get value => 'Valore';

  @override
  String get goal => 'Obiettivo';

  @override
  String get notSet => 'Non impostato';

  @override
  String get trend => 'Tendenza';

  @override
  String get smooth => 'Smussamento';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Media su $count punti',
      one: 'Media su 1 punto',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Modifica peso';

  @override
  String get addWeight => 'Aggiungi peso';

  @override
  String shareWeight(String value, String unit) {
    return 'Peso appena registrato: $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Peso ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Inserisci il peso';

  @override
  String get pleaseEnterValidWeight => 'Inserisci un peso valido';

  @override
  String get lastWeight => 'Ultimo peso';

  @override
  String unitWithValue(String unit) {
    return 'Unità ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Mantieni l’unità in $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Converti in $unit';
  }

  @override
  String get removeImage => 'Rimuovi immagine';

  @override
  String get mealRemindersEnabled => 'Promemoria dei pasti attivati';

  @override
  String get mealRemindersEnabledBody =>
      'Ti ricorderemo di registrare colazione, pranzo o cena se non l’hai ancora fatto.';

  @override
  String get reminderSettingsChannel => 'Impostazioni dei promemoria';

  @override
  String get reminderSettingsChannelDescription =>
      'Notifiche relative ai promemoria di FitBook';

  @override
  String get breakfastReminderTitle =>
      'Non dimenticare di registrare la colazione';

  @override
  String get breakfastRemindersChannel => 'Promemoria per la colazione';

  @override
  String get breakfastRemindersChannelDescription =>
      'Promemoria per registrare la colazione';

  @override
  String get lunchReminderTitle => 'Non dimenticare di registrare il pranzo';

  @override
  String get lunchRemindersChannel => 'Promemoria per il pranzo';

  @override
  String get lunchRemindersChannelDescription =>
      'Promemoria per registrare il pranzo';

  @override
  String get dinnerReminderTitle => 'Non dimenticare di registrare la cena';

  @override
  String get dinnerRemindersChannel => 'Promemoria per la cena';

  @override
  String get dinnerRemindersChannelDescription =>
      'Promemoria per registrare la cena';

  @override
  String get reinforcementGreatJob =>
      'Ottimo lavoro! Il tuo impegno sta dando i suoi frutti.';

  @override
  String get reinforcementKeepItUp =>
      'Continua così! Stai facendo ottimi progressi.';

  @override
  String get reinforcementFantastic =>
      'Fantastico! La tua costanza sta dando risultati.';

  @override
  String get reinforcementWellDone =>
      'Ben fatto! Sei un passo più vicino al tuo obiettivo.';

  @override
  String get reinforcementImpressive =>
      'Impressionante! I tuoi sforzi stanno dando frutti.';

  @override
  String get reinforcementAmazing => 'Fantastico! Sei sulla strada giusta.';

  @override
  String get reinforcementBravo => 'Bravo! Il tuo impegno è ammirevole.';

  @override
  String get reinforcementExcellent =>
      'Eccellente! La tua perseveranza è fonte d’ispirazione.';

  @override
  String get reinforcementSuperb =>
      'Superbo! Stai facendo un lavoro eccezionale.';

  @override
  String get reinforcementIncredible =>
      'Incredibile! I tuoi progressi si vedono.';

  @override
  String get reinforcementWayToGoKing => 'Grande, re!';

  @override
  String get reinforcementYeahBuddy => 'Yeah, amico!';

  @override
  String get reinforcementThatsHowItsDone => 'È così che si fa.';

  @override
  String get reinforcementEasyAsPie => 'Facile come bere un bicchier d’acqua.';

  @override
  String get reinforcementDoingGreat => 'Stai andando alla grande.';

  @override
  String get reinforcementProgressNice => 'Quello che vedo è progresso? Bello.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'Restano $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return 'Restano $remaining $unit ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'Zuccheri';

  @override
  String get nutrientCholesterol => 'Colesterolo';

  @override
  String get nutrientSaturatedFat => 'Grassi saturi';

  @override
  String get nutrientCalcium => 'Calcio';

  @override
  String get nutrientIron => 'Ferro';

  @override
  String get nutrientPotassium => 'Potassio';

  @override
  String get nutrientMagnesium => 'Magnesio';

  @override
  String get nutrientVitaminA => 'Vitamina A';

  @override
  String get nutrientVitaminC => 'Vitamina C';

  @override
  String get nutrientVitaminB12 => 'Vitamina B12';

  @override
  String get nutrientVitaminD => 'Vitamina D';

  @override
  String get nutrientVitaminE => 'Vitamina E';

  @override
  String get nutrientAddedSugar => 'Zuccheri aggiunti';

  @override
  String get nutrientNetCarbs => 'Carboidrati netti';

  @override
  String get nutrientWater => 'Acqua';

  @override
  String get nutrientOmega3 => 'Acidi grassi omega-3';

  @override
  String get nutrientOmega6 => 'Acidi grassi omega-6';

  @override
  String get nutrientPralScore => 'Punteggio PRAL';

  @override
  String get nutrientTransFat => 'Grassi trans';

  @override
  String get nutrientSolubleFiber => 'Fibre solubili';

  @override
  String get nutrientInsolubleFiber => 'Fibre insolubili';

  @override
  String get nutrientPhosphorus => 'Fosforo';

  @override
  String get nutrientSodium => 'Sodio';

  @override
  String get nutrientZinc => 'Zinco';

  @override
  String get nutrientCopper => 'Rame';

  @override
  String get nutrientManganese => 'Manganese';

  @override
  String get nutrientSelenium => 'Selenio';

  @override
  String get nutrientFluoride => 'Fluoruro';

  @override
  String get nutrientMolybdenum => 'Molibdeno';

  @override
  String get nutrientChloride => 'Cloruro';

  @override
  String get nutrientSucrose => 'Saccarosio';

  @override
  String get nutrientGlucose => 'Glucosio';

  @override
  String get nutrientFructose => 'Fruttosio';

  @override
  String get nutrientLactose => 'Lattosio';

  @override
  String get nutrientMaltose => 'Maltosio';

  @override
  String get nutrientGalactose => 'Galattosio';

  @override
  String get nutrientStarch => 'Amido';

  @override
  String get nutrientSugarAlcohols => 'Polialcoli';

  @override
  String get nutrientThiaminB1 => 'Tiamina (B1)';

  @override
  String get nutrientRiboflavinB2 => 'Riboflavina (B2)';

  @override
  String get nutrientNiacinB3 => 'Niacina (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'Acido pantotenico (B5)';

  @override
  String get nutrientVitaminB6 => 'Vitamina B6';

  @override
  String get nutrientBiotinB7 => 'Biotina (B7)';

  @override
  String get nutrientFolateB9 => 'Folati (B9)';

  @override
  String get nutrientFolicAcid => 'Acido folico';

  @override
  String get nutrientFoodFolate => 'Folati alimentari';

  @override
  String get nutrientFolateDfe => 'Equivalenti alimentari di folato (DFE)';

  @override
  String get nutrientCholine => 'Colina';

  @override
  String get nutrientBetaine => 'Betaina';

  @override
  String get nutrientRetinol => 'Retinolo';

  @override
  String get nutrientBetaCarotene => 'Beta-carotene';

  @override
  String get nutrientAlphaCarotene => 'Alfa-carotene';

  @override
  String get nutrientLycopene => 'Licopene';

  @override
  String get nutrientLuteinZeaxanthin => 'Luteina + zeaxantina';

  @override
  String get nutrientVitaminD2 => 'Vitamina D2 (ergocalciferolo)';

  @override
  String get nutrientVitaminD3 => 'Vitamina D3 (colecalciferolo)';

  @override
  String get nutrientVitaminK => 'Vitamina K';

  @override
  String get nutrientDihydrophylloquinone => 'Diidrofillochinone';

  @override
  String get nutrientMenaquinone4 => 'Menachinone-4';

  @override
  String get nutrientMonounsaturatedFat => 'Grassi monoinsaturi';

  @override
  String get nutrientPolyunsaturatedFat => 'Grassi polinsaturi';

  @override
  String get nutrientAla => 'Acido alfa-linolenico (ALA)';

  @override
  String get nutrientEpa => 'Acido eicosapentaenoico (EPA)';

  @override
  String get nutrientDpa => 'Acido docosapentaenoico (DPA)';

  @override
  String get nutrientDha => 'Acido docosaesaenoico (DHA)';

  @override
  String get nutrientAlanine => 'Alanina';

  @override
  String get nutrientAlcohol => 'Alcol';

  @override
  String get nutrientArginine => 'Arginina';

  @override
  String get nutrientAsparticAcid => 'Acido aspartico';

  @override
  String get nutrientCystine => 'Cistina';

  @override
  String get nutrientGlutamicAcid => 'Acido glutammico';

  @override
  String get nutrientGlycine => 'Glicina';

  @override
  String get nutrientHistidine => 'Istidina';

  @override
  String get nutrientHydroxyproline => 'Idrossiprolina';

  @override
  String get nutrientIsoleucine => 'Isoleucina';

  @override
  String get nutrientLeucine => 'Leucina';

  @override
  String get nutrientLysine => 'Lisina';

  @override
  String get nutrientMethionine => 'Metionina';

  @override
  String get nutrientPhenylalanine => 'Fenilalanina';

  @override
  String get nutrientProline => 'Prolina';

  @override
  String get nutrientSerine => 'Serina';

  @override
  String get nutrientThreonine => 'Treonina';

  @override
  String get nutrientTryptophan => 'Triptofano';

  @override
  String get nutrientTyrosine => 'Tirosina';

  @override
  String get nutrientValine => 'Valina';

  @override
  String get nutrientCaffeine => 'Caffeina';

  @override
  String get nutrientTheobromine => 'Teobromina';

  @override
  String servingWeightNumber(int number) {
    return 'Peso della porzione $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'Descrizione della porzione $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'Peso equivalente a 200 kcal';
}
