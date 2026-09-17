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

  @override
  String get delete => 'Delete';

  @override
  String get confirmDelete => 'Confirm delete';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Are you sure you want to delete $count records? This action is not reversible.',
      one:
          'Are you sure you want to delete 1 record? This action is not reversible.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get search => 'Search...';

  @override
  String get clear => 'Clear';

  @override
  String get showMenu => 'Show menu';

  @override
  String get selectAll => 'Select all';

  @override
  String get edit => 'Edit';

  @override
  String get favorite => 'Favorite';

  @override
  String get atLeastOneTab => 'You need at least one tab';

  @override
  String get scrollableTabs => 'Scrollable tabs';

  @override
  String get save => 'Save';

  @override
  String get themeSystem => 'System';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';

  @override
  String get pureBlackAmoled => 'Pure black (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'Use pure black colors for AMOLED displays';

  @override
  String get systemColorScheme => 'System color scheme';

  @override
  String get systemColorSchemeTooltip =>
      'Use your device\'s primary color for the app';

  @override
  String get showImages => 'Show images';

  @override
  String get showImagesTooltip =>
      'Pick and display images on the diary and food pages';

  @override
  String get curveLineGraphs => 'Curve line graphs';

  @override
  String get curveLineGraphsTooltip => 'Use smooth curves on the graphs page';

  @override
  String get weightStatCards => 'Weight stat cards';

  @override
  String get weightStatCardsTooltip =>
      'Show weight entries as a grid of stat cards instead of the default list';

  @override
  String get graphsStartAtZero => 'Graphs start at zero';

  @override
  String get graphsStartAtZeroTooltip =>
      'Always start the graph y-axis at zero';

  @override
  String get navigationAnimation => 'Navigation animation';

  @override
  String get animationFade => 'Fade';

  @override
  String get animationZoom => 'Zoom';

  @override
  String get animationSlide => 'Slide';

  @override
  String get animationRise => 'Rise';

  @override
  String get animationNone => 'None';

  @override
  String longDateFormat(String example) {
    return 'Long date format ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Short date format ($example)';
  }

  @override
  String get diarySettings => 'Diary settings';

  @override
  String get diaryUnit => 'Diary unit';

  @override
  String get diarySummary => 'Diary summary';

  @override
  String get diarySummaryDivision => 'Division - current / total';

  @override
  String get diarySummaryRemaining => 'Remaining';

  @override
  String get diarySummaryBoth => 'Both - remaining (total)';

  @override
  String get diarySummaryNone => 'None';

  @override
  String get dailyCaloriesKcal => 'Daily calories (kcal)';

  @override
  String get dailyProteinG => 'Daily protein (g)';

  @override
  String get dailyFatG => 'Daily fat (g)';

  @override
  String get dailyCarbsG => 'Daily carbs (g)';

  @override
  String get dailyFiberG => 'Daily fiber (g)';

  @override
  String get automaticDailies => 'Automatic daily targets';

  @override
  String get automaticDailiesTooltip =>
      'Automatically calculate recommended daily calories, protein, fat and carbs from your body weight';

  @override
  String get selectNameOnSubmit => 'Select name on submit';

  @override
  String get reminders => 'Reminders';

  @override
  String get foodSettings => 'Food settings';

  @override
  String get foodUnit => 'Food unit';

  @override
  String get fields => 'Fields';

  @override
  String get favoriteNewFoods => 'Favorite new foods';

  @override
  String get pickFields => 'Pick fields';

  @override
  String get all => 'All';

  @override
  String get onlySelected => 'Only selected';

  @override
  String get weightSettings => 'Weight settings';

  @override
  String get targetWeight => 'Target weight';

  @override
  String get positiveReinforcement => 'Positive reinforcement';

  @override
  String get positiveReinforcementPreview =>
      'Encouraging messages will be shown like this!';

  @override
  String get dataSettings => 'Data settings';

  @override
  String get automaticBackup => 'Automatic backup';

  @override
  String get shareDatabase => 'Share database';

  @override
  String get openNotification => 'Open notification';

  @override
  String get automaticBackupsEnabled => 'Automatic backups enabled';

  @override
  String get automaticBackupBody =>
      'FitBook will automatically back up your data and images to the selected folder each day.';

  @override
  String get backupSettings => 'Backup settings';

  @override
  String get backupSettingsChannelDescription =>
      'Notifications about automatic backups';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get close => 'Close';

  @override
  String get loggedIn => 'Logged in';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get whatsNew => 'What\'s new?';

  @override
  String get author => 'Author';

  @override
  String get license => 'License';

  @override
  String get donate => 'Donate';

  @override
  String get supportProject => 'Help support this project';

  @override
  String get leaveReview => 'Leave a review';

  @override
  String get rateOnPlayStore => 'Rate FitBook on the Play Store';

  @override
  String get sourceCode => 'Source code';

  @override
  String get foods => 'Foods';

  @override
  String get backup => 'Backup';

  @override
  String get exportData => 'Export data';

  @override
  String get importData => 'Import data';

  @override
  String get failedImportData => 'Failed to import data';

  @override
  String get copyError => 'Copy error';

  @override
  String get deleteRecords => 'Delete records';

  @override
  String get unusedFood => 'Unused food';

  @override
  String get database => 'Database';

  @override
  String get deleteAllWeightsConfirm =>
      'Are you sure you want to delete all weights? This action is not reversible.';

  @override
  String get deleteDatabaseConfirm =>
      'Are you sure you want to delete your database? This action is not reversible and will destroy all your data.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Are you sure you want to delete all food and diary entries? This action is not reversible.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Are you sure you want to delete $count unused foods? This action is irreversible.',
      one:
          'Are you sure you want to delete 1 unused food? This action is irreversible.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Are you sure you want to delete all diary entries? This action is not reversible.';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Replace image';

  @override
  String get takePhoto => 'Take photo';

  @override
  String get deleteImage => 'Delete image';

  @override
  String get filters => 'Filters';

  @override
  String get foodGroup => 'Food group';

  @override
  String get exampleFruit => 'Fruit';

  @override
  String clearFiltersCount(int count) {
    return 'Clear ($count)';
  }

  @override
  String get done => 'Done';

  @override
  String get showFilters => 'Show filters';

  @override
  String get repeatEntry => 'Repeat entry';

  @override
  String get timeOfDay => 'Time of day';

  @override
  String get everyDay => 'Every day';

  @override
  String get repeatEveryDayForYear =>
      'Create this entry each day for the next year';

  @override
  String get repeatOn => 'Repeat on';

  @override
  String get weekdayMon => 'Mon';

  @override
  String get weekdayTue => 'Tue';

  @override
  String get weekdayWed => 'Wed';

  @override
  String get weekdayThu => 'Thu';

  @override
  String get weekdayFri => 'Fri';

  @override
  String get weekdaySat => 'Sat';

  @override
  String get weekdaySun => 'Sun';

  @override
  String get schedule => 'Schedule';

  @override
  String get enterValidNutritionValues => 'Enter valid nutrition values';

  @override
  String get quickAddTitle => 'Quick add';

  @override
  String get kilojoules => 'Kilojoules';

  @override
  String get createdDate => 'Created date';

  @override
  String get failedMigrations => 'Failed migrations';

  @override
  String get failedMigrationsDescription =>
      'Something went wrong when creating or upgrading your database. Usually this can be fixed by deleting and re-creating your records.';

  @override
  String get errorMessage => 'Error message:';

  @override
  String get createIssue => 'Create issue';

  @override
  String get cameraPermissionRequired =>
      'Camera permission is required to scan.';

  @override
  String get scanFoodBarcode => 'Scan a food barcode';

  @override
  String get holdBarcodeInFrame => 'Hold the barcode inside the frame';

  @override
  String get pinchToZoom => 'Pinch to zoom';

  @override
  String get cameraStartFailed => 'Could not start the camera';

  @override
  String get editDiaryEntry => 'Edit diary entry';

  @override
  String get addFoodToDiary => 'Add food to diary';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String get imageError => 'Image error';

  @override
  String get setImage => 'Set image';

  @override
  String get name => 'Name';

  @override
  String get searchFoodsAndMeals => 'Search foods and meals...';

  @override
  String get clearSelection => 'Clear selection';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Barcode not found. Save to insert.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Search OpenFoodFacts for \"$name\"';
  }

  @override
  String get meal => 'Meal';

  @override
  String get quantity => 'Quantity';

  @override
  String get unit => 'Unit';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Serving ($amount $unit)';
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
  String get fiber => 'Fiber';

  @override
  String get unitServing => 'Serving';

  @override
  String get unitGrams => 'Grams';

  @override
  String get unitMilliliters => 'Milliliters';

  @override
  String get unitKilojoules => 'Kilojoules';

  @override
  String get unitCups => 'Cups';

  @override
  String get unitTablespoons => 'Tablespoons';

  @override
  String get unitMilligrams => 'Milligrams';

  @override
  String get unitTeaspoons => 'Teaspoons';

  @override
  String get unitOunces => 'Ounces';

  @override
  String get unitPounds => 'Pounds';

  @override
  String get unitKilograms => 'Kilograms';

  @override
  String get unitLiters => 'Liters';

  @override
  String get nameConflict => 'Name conflict';

  @override
  String get replaceExistingFood =>
      'A food already exists with this name. Do you want to replace the old one?';

  @override
  String get no => 'No';

  @override
  String get yes => 'Yes';

  @override
  String get editFood => 'Edit food';

  @override
  String confirmDeleteFood(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String get caloriesKcal => 'Calories (kcal)';

  @override
  String get kilojoulesKj => 'Kilojoules (kJ)';

  @override
  String get servingSize => 'Serving size';

  @override
  String get servingUnit => 'Serving unit';

  @override
  String get saveAsNewCopy => 'Save as new copy';

  @override
  String get filterFoods => 'Filter foods';

  @override
  String get narrowFoodsFilters =>
      'Narrow the list using any combination of filters.';

  @override
  String get foodDetails => 'Food details';

  @override
  String get exampleFruitHint => 'e.g. Fruit';

  @override
  String get servingSizeRangeHint => 'Set a minimum, maximum, or both.';

  @override
  String get minimum => 'Minimum';

  @override
  String get maximum => 'Maximum';

  @override
  String get noMinimum => 'No minimum';

  @override
  String get noMaximum => 'No maximum';

  @override
  String get clearAll => 'Clear all';
}
