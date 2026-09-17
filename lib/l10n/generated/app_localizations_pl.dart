// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Dziennik';

  @override
  String get navGraph => 'Wykres';

  @override
  String get navFood => 'Żywność';

  @override
  String get navWeight => 'Waga';

  @override
  String get navError => 'Błąd';

  @override
  String get settings => 'Ustawienia';

  @override
  String get invalidTabSettings => 'Nieprawidłowe ustawienia kart.';

  @override
  String newVersion(String version) {
    return 'Nowa wersja $version';
  }

  @override
  String get changes => 'Zmiany';

  @override
  String get searchSettings => 'Szukaj w ustawieniach...';

  @override
  String get appearance => 'Wygląd';

  @override
  String get appearanceSubtitle => 'Motyw, kolory i wygląd wykresów';

  @override
  String get diary => 'Dziennik';

  @override
  String get diarySubtitle => 'Cele dzienne, podsumowania i rejestrowanie';

  @override
  String get food => 'Żywność';

  @override
  String get foodSubtitle => 'Jednostki, pola i wartości domyślne';

  @override
  String get weight => 'Waga';

  @override
  String get weightSubtitle => 'Jednostki, cele i wyświetlanie wagi';

  @override
  String get tabs => 'Karty';

  @override
  String get tabsSubtitle => 'Karty nawigacji i ich kolejność';

  @override
  String get data => 'Dane';

  @override
  String get dataSubtitle => 'Import, eksport i dane lokalne';

  @override
  String get todayProgress => 'Dzisiejszy postęp';

  @override
  String get latestDay => 'Ostatni dzień';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wpisu',
      many: '$count wpisów',
      few: '$count wpisy',
      one: '1 wpis',
      zero: 'Brak wpisów',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Edytuj $count wpisu',
      many: 'Edytuj $count wpisów',
      few: 'Edytuj $count wpisy',
      one: 'Edytuj 1 wpis',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Kalorie';

  @override
  String get protein => 'Białko';

  @override
  String get carbs => 'Węglowodany';

  @override
  String get fat => 'Tłuszcz';

  @override
  String get addDiaryEntry => 'Dodaj wpis do dziennika';

  @override
  String get noEntriesToday => 'Brak wpisów na dziś.';

  @override
  String addSearchToDiary(String search) {
    return 'Dodaj \"$search\" do dziennika';
  }

  @override
  String get tapStartLoggingFood => 'Dotknij, aby zacząć rejestrować jedzenie.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Brak pasujących wpisów. Dotknij, aby utworzyć ten produkt i go zarejestrować.';

  @override
  String get add => 'Dodaj';

  @override
  String get quickAdd => 'Szybkie dodawanie';

  @override
  String get scanBarcode => 'Skanuj kod kreskowy';

  @override
  String get foodLibrary => 'Biblioteka żywności';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    return '$foodCount produktów · $mealCount posiłków';
  }

  @override
  String get recentlyUsed => 'Ostatnio używane';

  @override
  String get quickActions => 'Szybkie działania';

  @override
  String get addFood => 'Dodaj produkt';

  @override
  String get createMeal => 'Utwórz posiłek';

  @override
  String get noFoodYet => 'Brak produktów';

  @override
  String get noMatchingFood => 'Brak pasujących produktów';

  @override
  String get addFirstFoodOrMeal =>
      'Dodaj pierwszy produkt lub posiłek, aby zacząć budować bibliotekę.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Brak wyników dla „$search”. Wyczyść wyszukiwanie, aby ponownie zobaczyć wszystko.';
  }

  @override
  String get clearSearch => 'Wyczyść wyszukiwanie';

  @override
  String get addMeal => 'Dodaj posiłek';

  @override
  String get noWeightsYet => 'Brak pomiarów wagi';

  @override
  String get noMatchingWeights => 'Brak pasujących pomiarów';

  @override
  String get logFirstWeight =>
      'Zapisz pierwszy pomiar wagi, aby zacząć śledzić trend.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Brak wyników dla „$search”. Wyczyść wyszukiwanie, aby zobaczyć wszystkie wpisy.';
  }

  @override
  String get logWeight => 'Zapisz wagę';

  @override
  String get weightTrend => 'Trend wagi';

  @override
  String get weightTrendSubtitle => 'Ostatnie pomiary i ogólny kierunek';

  @override
  String get bodyWeight => 'Masa ciała';

  @override
  String get options => 'Opcje';

  @override
  String get day => 'Dzień';

  @override
  String get week => 'Tydzień';

  @override
  String get month => 'Miesiąc';

  @override
  String get year => 'Rok';

  @override
  String get dateRange => 'Zakres dat';

  @override
  String get startDate => 'Data początkowa';

  @override
  String get stopDate => 'Data końcowa';

  @override
  String get dataPoints => 'Punkty danych';

  @override
  String get customizeFields => 'Dostosuj pola';

  @override
  String get language => 'Język';

  @override
  String get languageSubtitle => 'Wybierz język używany przez FitBook';

  @override
  String get languageSystem => 'Systemowy';

  @override
  String get languageEnglish => 'Angielski';

  @override
  String get languageSpanish => 'Hiszpański';

  @override
  String get languageFrench => 'Francuski';

  @override
  String get languageGerman => 'Niemiecki';

  @override
  String get languageItalian => 'Włoski';

  @override
  String get languagePortugueseBrazil => 'Portugalski (Brazylia)';

  @override
  String get languageDutch => 'Niderlandzki';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languageJapanese => 'Japoński';

  @override
  String get languageKorean => 'Koreański';

  @override
  String get languageChineseSimplified => 'Chiński (uproszczony)';

  @override
  String get appearanceSettings => 'Ustawienia wyglądu';

  @override
  String get delete => 'Usuń';

  @override
  String get confirmDelete => 'Potwierdź usunięcie';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Czy na pewno chcesz usunąć $count wpisu? Tej operacji nie można cofnąć.',
      many:
          'Czy na pewno chcesz usunąć $count wpisów? Tej operacji nie można cofnąć.',
      few:
          'Czy na pewno chcesz usunąć $count wpisy? Tej operacji nie można cofnąć.',
      one: 'Czy na pewno chcesz usunąć 1 wpis? Tej operacji nie można cofnąć.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Anuluj';

  @override
  String get search => 'Szukaj...';

  @override
  String get clear => 'Wyczyść';

  @override
  String get showMenu => 'Pokaż menu';

  @override
  String get selectAll => 'Zaznacz wszystko';

  @override
  String get edit => 'Edytuj';

  @override
  String get favorite => 'Ulubione';

  @override
  String get atLeastOneTab => 'Musisz mieć co najmniej jedną kartę';

  @override
  String get scrollableTabs => 'Przewijane karty';

  @override
  String get save => 'Zapisz';

  @override
  String get themeSystem => 'Systemowy';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get themeLight => 'Jasny';

  @override
  String get pureBlackAmoled => 'Czysta czerń (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'Używaj czystej czerni na ekranach AMOLED';

  @override
  String get systemColorScheme => 'Kolory systemowe';

  @override
  String get systemColorSchemeTooltip =>
      'Używaj głównego koloru urządzenia w aplikacji';

  @override
  String get showImages => 'Pokazuj obrazy';

  @override
  String get showImagesTooltip =>
      'Wybieraj i wyświetlaj obrazy na stronach dziennika i produktów';

  @override
  String get curveLineGraphs => 'Wygładzone wykresy liniowe';

  @override
  String get curveLineGraphsTooltip =>
      'Używaj płynnych krzywych na stronie wykresów';

  @override
  String get weightStatCards => 'Karty statystyk wagi';

  @override
  String get weightStatCardsTooltip =>
      'Pokazuj wpisy wagi jako siatkę kart statystyk zamiast domyślnej listy';

  @override
  String get graphsStartAtZero => 'Wykresy zaczynają się od zera';

  @override
  String get graphsStartAtZeroTooltip => 'Zawsze zaczynaj oś Y wykresu od zera';

  @override
  String get navigationAnimation => 'Animacja nawigacji';

  @override
  String get animationFade => 'Przenikanie';

  @override
  String get animationZoom => 'Powiększenie';

  @override
  String get animationSlide => 'Przesunięcie';

  @override
  String get animationRise => 'Uniesienie';

  @override
  String get animationNone => 'Brak';

  @override
  String longDateFormat(String example) {
    return 'Długi format daty ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Krótki format daty ($example)';
  }

  @override
  String get diarySettings => 'Ustawienia dziennika';

  @override
  String get diaryUnit => 'Jednostka dziennika';

  @override
  String get diarySummary => 'Podsumowanie dziennika';

  @override
  String get diarySummaryDivision => 'Podział - bieżące / razem';

  @override
  String get diarySummaryRemaining => 'Pozostało';

  @override
  String get diarySummaryBoth => 'Oba - pozostało (razem)';

  @override
  String get diarySummaryNone => 'Brak';

  @override
  String get dailyCaloriesKcal => 'Dzienne kalorie (kcal)';

  @override
  String get dailyProteinG => 'Dzienne białko (g)';

  @override
  String get dailyFatG => 'Dzienny tłuszcz (g)';

  @override
  String get dailyCarbsG => 'Dzienne węglowodany (g)';

  @override
  String get dailyFiberG => 'Dzienny błonnik (g)';

  @override
  String get automaticDailies => 'Automatyczne cele dzienne';

  @override
  String get automaticDailiesTooltip =>
      'Automatycznie obliczaj zalecane dzienne kalorie, białko, tłuszcz i węglowodany na podstawie masy ciała';

  @override
  String get selectNameOnSubmit => 'Zaznacz nazwę przy zapisie';

  @override
  String get reminders => 'Przypomnienia';

  @override
  String get foodSettings => 'Ustawienia produktów';

  @override
  String get foodUnit => 'Jednostka produktu';

  @override
  String get fields => 'Pola';

  @override
  String get favoriteNewFoods => 'Dodawaj nowe produkty do ulubionych';

  @override
  String get pickFields => 'Wybierz pola';

  @override
  String get all => 'Wszystkie';

  @override
  String get onlySelected => 'Tylko wybrane';

  @override
  String get weightSettings => 'Ustawienia wagi';

  @override
  String get targetWeight => 'Waga docelowa';

  @override
  String get positiveReinforcement => 'Pozytywne wzmocnienie';

  @override
  String get positiveReinforcementPreview =>
      'Wiadomości motywacyjne będą wyświetlane w ten sposób!';

  @override
  String get dataSettings => 'Ustawienia danych';

  @override
  String get automaticBackup => 'Automatyczna kopia zapasowa';

  @override
  String get shareDatabase => 'Udostępnij bazę danych';

  @override
  String get openNotification => 'Otwórz powiadomienie';

  @override
  String get automaticBackupsEnabled => 'Automatyczne kopie zapasowe włączone';

  @override
  String get automaticBackupBody =>
      'FitBook będzie codziennie automatycznie tworzyć kopię danych i obrazów w wybranym folderze.';

  @override
  String get backupSettings => 'Ustawienia kopii zapasowych';

  @override
  String get backupSettingsChannelDescription =>
      'Powiadomienia o automatycznych kopiach zapasowych';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Nazwa użytkownika';

  @override
  String get password => 'Hasło';

  @override
  String get close => 'Zamknij';

  @override
  String get loggedIn => 'Zalogowano';

  @override
  String get about => 'O aplikacji';

  @override
  String get version => 'Wersja';

  @override
  String get whatsNew => 'Co nowego?';

  @override
  String get author => 'Autor';

  @override
  String get license => 'Licencja';

  @override
  String get donate => 'Wesprzyj';

  @override
  String get supportProject => 'Pomóż wspierać ten projekt';

  @override
  String get leaveReview => 'Dodaj opinię';

  @override
  String get rateOnPlayStore => 'Oceń FitBook w Sklepie Play';

  @override
  String get sourceCode => 'Kod źródłowy';

  @override
  String get foods => 'Produkty';

  @override
  String get backup => 'Kopia zapasowa';

  @override
  String get exportData => 'Eksportuj dane';

  @override
  String get importData => 'Importuj dane';

  @override
  String get failedImportData => 'Nie udało się zaimportować danych';

  @override
  String get copyError => 'Kopiuj błąd';

  @override
  String get deleteRecords => 'Usuń dane';

  @override
  String get unusedFood => 'Nieużywane produkty';

  @override
  String get database => 'Baza danych';

  @override
  String get deleteAllWeightsConfirm =>
      'Czy na pewno chcesz usunąć wszystkie wpisy wagi? Tej operacji nie można cofnąć.';

  @override
  String get deleteDatabaseConfirm =>
      'Czy na pewno chcesz usunąć bazę danych? Tej operacji nie można cofnąć i spowoduje ona usunięcie wszystkich danych.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Czy na pewno chcesz usunąć wszystkie produkty i wpisy dziennika? Tej operacji nie można cofnąć.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Czy na pewno chcesz usunąć $count nieużywanego produktu? Tej operacji nie można cofnąć.',
      many:
          'Czy na pewno chcesz usunąć $count nieużywanych produktów? Tej operacji nie można cofnąć.',
      few:
          'Czy na pewno chcesz usunąć $count nieużywane produkty? Tej operacji nie można cofnąć.',
      one:
          'Czy na pewno chcesz usunąć 1 nieużywany produkt? Tej operacji nie można cofnąć.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Czy na pewno chcesz usunąć wszystkie wpisy dziennika? Tej operacji nie można cofnąć.';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Zastąp obraz';

  @override
  String get takePhoto => 'Zrób zdjęcie';

  @override
  String get deleteImage => 'Usuń obraz';

  @override
  String get filters => 'Filtry';

  @override
  String get foodGroup => 'Grupa żywności';

  @override
  String get exampleFruit => 'Owoce';

  @override
  String clearFiltersCount(int count) {
    return 'Wyczyść ($count)';
  }

  @override
  String get done => 'Gotowe';

  @override
  String get showFilters => 'Pokaż filtry';

  @override
  String get repeatEntry => 'Powtórz wpis';

  @override
  String get timeOfDay => 'Pora dnia';

  @override
  String get everyDay => 'Codziennie';

  @override
  String get repeatEveryDayForYear =>
      'Twórz ten wpis codziennie przez następny rok';

  @override
  String get repeatOn => 'Powtarzaj w';

  @override
  String get weekdayMon => 'Pn';

  @override
  String get weekdayTue => 'Wt';

  @override
  String get weekdayWed => 'Śr';

  @override
  String get weekdayThu => 'Czw';

  @override
  String get weekdayFri => 'Pt';

  @override
  String get weekdaySat => 'Sob';

  @override
  String get weekdaySun => 'Nd';

  @override
  String get schedule => 'Zaplanuj';

  @override
  String get enterValidNutritionValues =>
      'Wprowadź prawidłowe wartości odżywcze';

  @override
  String get quickAddTitle => 'Szybkie dodawanie';

  @override
  String get kilojoules => 'Kilodżule';

  @override
  String get createdDate => 'Data utworzenia';

  @override
  String get failedMigrations => 'Nieudane migracje';

  @override
  String get failedMigrationsDescription =>
      'Podczas tworzenia lub aktualizowania bazy danych wystąpił problem. Zwykle można go naprawić, usuwając i ponownie tworząc wpisy.';

  @override
  String get errorMessage => 'Komunikat o błędzie:';

  @override
  String get createIssue => 'Zgłoś problem';

  @override
  String get cameraPermissionRequired =>
      'Do skanowania wymagane jest uprawnienie do aparatu.';

  @override
  String get scanFoodBarcode => 'Zeskanuj kod kreskowy produktu';

  @override
  String get holdBarcodeInFrame => 'Umieść kod kreskowy wewnątrz ramki';

  @override
  String get pinchToZoom => 'Uszczypnij, aby powiększyć';

  @override
  String get cameraStartFailed => 'Nie udało się uruchomić aparatu';

  @override
  String get editDiaryEntry => 'Edytuj wpis w dzienniku';

  @override
  String get addFoodToDiary => 'Dodaj produkt do dziennika';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Czy na pewno chcesz usunąć $name?';
  }

  @override
  String get imageError => 'Błąd obrazu';

  @override
  String get setImage => 'Ustaw obraz';

  @override
  String get name => 'Nazwa';

  @override
  String get searchFoodsAndMeals => 'Szukaj produktów i posiłków...';

  @override
  String get clearSelection => 'Wyczyść wybór';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Nie znaleziono kodu kreskowego. Zapisz, aby dodać.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Wyszukaj „$name” w OpenFoodFacts';
  }

  @override
  String get meal => 'Posiłek';

  @override
  String get quantity => 'Ilość';

  @override
  String get unit => 'Jednostka';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Porcja ($amount $unit)';
  }

  @override
  String get barcode => 'Kod kreskowy';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (na $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '$nutrient na $quantity $unit';
  }

  @override
  String get fiber => 'Błonnik';

  @override
  String get unitServing => 'Porcja';

  @override
  String get unitGrams => 'Gramy';

  @override
  String get unitMilliliters => 'Mililitry';

  @override
  String get unitKilojoules => 'Kilodżule';

  @override
  String get unitCups => 'Filiżanki';

  @override
  String get unitTablespoons => 'Łyżki stołowe';

  @override
  String get unitMilligrams => 'Miligramy';

  @override
  String get unitTeaspoons => 'Łyżeczki';

  @override
  String get unitOunces => 'Uncje';

  @override
  String get unitPounds => 'Funty';

  @override
  String get unitKilograms => 'Kilogramy';

  @override
  String get unitLiters => 'Litry';

  @override
  String get nameConflict => 'Konflikt nazw';

  @override
  String get replaceExistingFood =>
      'Produkt o tej nazwie już istnieje. Czy chcesz zastąpić poprzedni?';

  @override
  String get no => 'Nie';

  @override
  String get yes => 'Tak';

  @override
  String get editFood => 'Edytuj produkt';

  @override
  String confirmDeleteFood(String name) {
    return 'Czy na pewno chcesz usunąć $name?';
  }

  @override
  String get caloriesKcal => 'Kalorie (kcal)';

  @override
  String get kilojoulesKj => 'Kilodżule (kJ)';

  @override
  String get servingSize => 'Wielkość porcji';

  @override
  String get servingUnit => 'Jednostka porcji';

  @override
  String get saveAsNewCopy => 'Zapisz jako nową kopię';

  @override
  String get filterFoods => 'Filtruj produkty';

  @override
  String get narrowFoodsFilters =>
      'Zawęź listę za pomocą dowolnej kombinacji filtrów.';

  @override
  String get foodDetails => 'Szczegóły produktu';

  @override
  String get exampleFruitHint => 'np. Owoce';

  @override
  String get servingSizeRangeHint => 'Ustaw minimum, maksimum lub oba zakresy.';

  @override
  String get minimum => 'Minimum';

  @override
  String get maximum => 'Maksimum';

  @override
  String get noMinimum => 'Bez minimum';

  @override
  String get noMaximum => 'Bez maksimum';

  @override
  String get clearAll => 'Wyczyść wszystko';

  @override
  String get searchOpenFoodFacts => 'Przeszukaj Open Food Facts';

  @override
  String get noMatchingProducts => 'Brak pasujących produktów';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Spróbuj innej nazwy lub zeskanuj kod kreskowy.';

  @override
  String get enterFoodNameToSearch =>
      'Wpisz powyżej nazwę produktu i rozpocznij wyszukiwanie.';

  @override
  String get submitToSearch => 'Szukaj...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g białka';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Edytuj $count produktu',
      many: 'Edytuj $count produktów',
      few: 'Edytuj $count produkty',
      one: 'Edytuj 1 produkt',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'Edytuj posiłek';

  @override
  String get addImage => 'Dodaj obraz';

  @override
  String get noFoodsInMeal => 'W tym posiłku nie ma jeszcze produktów';

  @override
  String get addFoodToMealHint =>
      'Dodaj produkt, aby zacząć tworzyć ten posiłek.';

  @override
  String get remove => 'Usuń';

  @override
  String get searchFoods => 'Szukaj produktów...';

  @override
  String get noFoodsFound => 'Nie znaleziono produktów';

  @override
  String nothingMatchesSearch(String search) {
    return 'Brak wyników dla „$search”.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Najpierw dodaj produkty do biblioteki, zanim dodasz je do posiłku.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'Brak danych';

  @override
  String get completePlansToViewGraphs =>
      'Ukończ kilka planów, aby wyświetlić tutaj wykresy.';

  @override
  String get value => 'Wartość';

  @override
  String get goal => 'Cel';

  @override
  String get notSet => 'Nie ustawiono';

  @override
  String get trend => 'Trend';

  @override
  String get smooth => 'Wygładzenie';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Średnia z $count punktu',
      many: 'Średnia z $count punktów',
      few: 'Średnia z $count punktów',
      one: 'Średnia z 1 punktu',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Edytuj wagę';

  @override
  String get addWeight => 'Dodaj wagę';

  @override
  String shareWeight(String value, String unit) {
    return 'Mój najnowszy pomiar: $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Waga ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Wprowadź wagę';

  @override
  String get pleaseEnterValidWeight => 'Wprowadź prawidłową wagę';

  @override
  String get lastWeight => 'Ostatnia waga';

  @override
  String unitWithValue(String unit) {
    return 'Jednostka ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Pozostaw jednostkę $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Przelicz na $unit';
  }

  @override
  String get removeImage => 'Usuń obraz';

  @override
  String get mealRemindersEnabled => 'Przypomnienia o posiłkach włączone';

  @override
  String get mealRemindersEnabledBody =>
      'Przypomnimy Ci o zapisaniu śniadania, obiadu lub kolacji, jeśli nie zostały jeszcze zapisane.';

  @override
  String get reminderSettingsChannel => 'Ustawienia przypomnień';

  @override
  String get reminderSettingsChannelDescription =>
      'Powiadomienia dotyczące przypomnień FitBook';

  @override
  String get breakfastReminderTitle => 'Nie zapomnij zapisać śniadania';

  @override
  String get breakfastRemindersChannel => 'Przypomnienia o śniadaniu';

  @override
  String get breakfastRemindersChannelDescription =>
      'Przypomnienia o zapisaniu śniadania';

  @override
  String get lunchReminderTitle => 'Nie zapomnij zapisać obiadu';

  @override
  String get lunchRemindersChannel => 'Przypomnienia o obiedzie';

  @override
  String get lunchRemindersChannelDescription =>
      'Przypomnienia o zapisaniu obiadu';

  @override
  String get dinnerReminderTitle => 'Nie zapomnij zapisać kolacji';

  @override
  String get dinnerRemindersChannel => 'Przypomnienia o kolacji';

  @override
  String get dinnerRemindersChannelDescription =>
      'Przypomnienia o zapisaniu kolacji';
}
