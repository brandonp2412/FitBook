// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Diary';

  @override
  String get navGraph => 'Graph';

  @override
  String get navFood => 'Food';

  @override
  String get navWeight => 'Weight';

  @override
  String get navError => 'Error';

  @override
  String get settings => 'Settings';

  @override
  String get invalidTabSettings => 'Invalid tab settings.';

  @override
  String newVersion(String version) {
    return 'New version $version';
  }

  @override
  String get changes => 'Changes';

  @override
  String get searchSettings => 'Search settings...';

  @override
  String get appearance => 'Appearance';

  @override
  String get appearanceSubtitle => 'Theme, colors and graph display';

  @override
  String get diary => 'Diary';

  @override
  String get diarySubtitle => 'Daily targets, summaries and logging';

  @override
  String get food => 'Food';

  @override
  String get foodSubtitle => 'Food units, fields and defaults';

  @override
  String get weight => 'Weight';

  @override
  String get weightSubtitle => 'Weight units, goals and display';

  @override
  String get tabs => 'Tabs';

  @override
  String get tabsSubtitle => 'Navigation tabs and ordering';

  @override
  String get data => 'Data';

  @override
  String get dataSubtitle => 'Import, export and local data';

  @override
  String get todayProgress => 'Today\'s progress';

  @override
  String get latestDay => 'Latest day';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entries logged',
      one: '1 entry logged',
      zero: 'No entries logged',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Calories';

  @override
  String get protein => 'Protein';

  @override
  String get carbs => 'Carbs';

  @override
  String get fat => 'Fat';

  @override
  String get addDiaryEntry => 'Add diary entry';

  @override
  String get noEntriesToday => 'No entries today.';

  @override
  String addSearchToDiary(String search) {
    return 'Add \"$search\" to your diary';
  }

  @override
  String get tapStartLoggingFood => 'Tap to start logging food.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'No matching diary entries. Tap to create this food and log it.';

  @override
  String get add => 'Add';

  @override
  String get quickAdd => 'Quick-add';

  @override
  String get scanBarcode => 'Scan barcode';

  @override
  String get foodLibrary => 'Food library';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    return '$foodCount foods · $mealCount meals';
  }

  @override
  String get recentlyUsed => 'Recently used';

  @override
  String get quickActions => 'Quick actions';

  @override
  String get addFood => 'Add food';

  @override
  String get createMeal => 'Create meal';

  @override
  String get noFoodYet => 'No food yet';

  @override
  String get noMatchingFood => 'No matching food';

  @override
  String get addFirstFoodOrMeal =>
      'Add your first food or meal to start building your library.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Nothing matches “$search”. Clear the search to see everything again.';
  }

  @override
  String get clearSearch => 'Clear search';

  @override
  String get addMeal => 'Add meal';

  @override
  String get noWeightsYet => 'No weights yet';

  @override
  String get noMatchingWeights => 'No matching weights';

  @override
  String get logFirstWeight =>
      'Log your first weight to start tracking your trend.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Nothing matches “$search”. Clear the search to see all entries.';
  }

  @override
  String get logWeight => 'Log weight';

  @override
  String get weightTrend => 'Weight trend';

  @override
  String get weightTrendSubtitle => 'Recent measurements and overall direction';

  @override
  String get bodyWeight => 'Body weight';

  @override
  String get options => 'Options';

  @override
  String get day => 'Day';

  @override
  String get week => 'Week';

  @override
  String get month => 'Month';

  @override
  String get year => 'Year';

  @override
  String get dateRange => 'Date range';

  @override
  String get startDate => 'Start date';

  @override
  String get stopDate => 'Stop date';

  @override
  String get dataPoints => 'Data points';

  @override
  String get customizeFields => 'Customize fields';

  @override
  String get language => 'Language';

  @override
  String get languageSubtitle => 'Choose the language used by FitBook';

  @override
  String get languageSystem => 'System';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageFrench => 'French';

  @override
  String get languageGerman => 'German';

  @override
  String get languageItalian => 'Italian';

  @override
  String get languagePortugueseBrazil => 'Portuguese (Brazil)';

  @override
  String get languageDutch => 'Dutch';

  @override
  String get languagePolish => 'Polish';

  @override
  String get languageJapanese => 'Japanese';

  @override
  String get languageKorean => 'Korean';

  @override
  String get languageChineseSimplified => 'Chinese (Simplified)';

  @override
  String get appearanceSettings => 'Appearance settings';
}
