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
}
