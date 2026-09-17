import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('zh'),
    Locale('zh', 'CN')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'FitBook'**
  String get appTitle;

  /// No description provided for @navDiary.
  ///
  /// In en, this message translates to:
  /// **'Diary'**
  String get navDiary;

  /// No description provided for @navGraph.
  ///
  /// In en, this message translates to:
  /// **'Graph'**
  String get navGraph;

  /// No description provided for @navFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get navFood;

  /// No description provided for @navWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get navWeight;

  /// No description provided for @navError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get navError;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @invalidTabSettings.
  ///
  /// In en, this message translates to:
  /// **'Invalid tab settings.'**
  String get invalidTabSettings;

  /// No description provided for @newVersion.
  ///
  /// In en, this message translates to:
  /// **'New version {version}'**
  String newVersion(String version);

  /// No description provided for @changes.
  ///
  /// In en, this message translates to:
  /// **'Changes'**
  String get changes;

  /// No description provided for @searchSettings.
  ///
  /// In en, this message translates to:
  /// **'Search settings...'**
  String get searchSettings;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @appearanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Theme, colors and graph display'**
  String get appearanceSubtitle;

  /// No description provided for @diary.
  ///
  /// In en, this message translates to:
  /// **'Diary'**
  String get diary;

  /// No description provided for @diarySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Daily targets, summaries and logging'**
  String get diarySubtitle;

  /// No description provided for @food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;

  /// No description provided for @foodSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Food units, fields and defaults'**
  String get foodSubtitle;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @weightSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Weight units, goals and display'**
  String get weightSubtitle;

  /// No description provided for @tabs.
  ///
  /// In en, this message translates to:
  /// **'Tabs'**
  String get tabs;

  /// No description provided for @tabsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Navigation tabs and ordering'**
  String get tabsSubtitle;

  /// No description provided for @data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get data;

  /// No description provided for @dataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Import, export and local data'**
  String get dataSubtitle;

  /// No description provided for @todayProgress.
  ///
  /// In en, this message translates to:
  /// **'Today\'s progress'**
  String get todayProgress;

  /// No description provided for @latestDay.
  ///
  /// In en, this message translates to:
  /// **'Latest day'**
  String get latestDay;

  /// No description provided for @loggedEntries.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No entries logged} =1{1 entry logged} other{{count} entries logged}}'**
  String loggedEntries(int count);

  /// No description provided for @editEntries.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Edit 1 entry} other{Edit {count} entries}}'**
  String editEntries(int count);

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @carbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get carbs;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @addDiaryEntry.
  ///
  /// In en, this message translates to:
  /// **'Add diary entry'**
  String get addDiaryEntry;

  /// No description provided for @noEntriesToday.
  ///
  /// In en, this message translates to:
  /// **'No entries today.'**
  String get noEntriesToday;

  /// No description provided for @addSearchToDiary.
  ///
  /// In en, this message translates to:
  /// **'Add \"{search}\" to your diary'**
  String addSearchToDiary(String search);

  /// No description provided for @tapStartLoggingFood.
  ///
  /// In en, this message translates to:
  /// **'Tap to start logging food.'**
  String get tapStartLoggingFood;

  /// No description provided for @noMatchingDiaryEntriesTapCreate.
  ///
  /// In en, this message translates to:
  /// **'No matching diary entries. Tap to create this food and log it.'**
  String get noMatchingDiaryEntriesTapCreate;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @quickAdd.
  ///
  /// In en, this message translates to:
  /// **'Quick-add'**
  String get quickAdd;

  /// No description provided for @scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode'**
  String get scanBarcode;

  /// No description provided for @foodLibrary.
  ///
  /// In en, this message translates to:
  /// **'Food library'**
  String get foodLibrary;

  /// No description provided for @foodLibraryCounts.
  ///
  /// In en, this message translates to:
  /// **'{foodCount, plural, =1{1 food} other{{foodCount} foods}} · {mealCount, plural, =1{1 meal} other{{mealCount} meals}}'**
  String foodLibraryCounts(int foodCount, int mealCount);

  /// No description provided for @recentlyUsed.
  ///
  /// In en, this message translates to:
  /// **'Recently used'**
  String get recentlyUsed;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get quickActions;

  /// No description provided for @addFood.
  ///
  /// In en, this message translates to:
  /// **'Add food'**
  String get addFood;

  /// No description provided for @createMeal.
  ///
  /// In en, this message translates to:
  /// **'Create meal'**
  String get createMeal;

  /// No description provided for @noFoodYet.
  ///
  /// In en, this message translates to:
  /// **'No food yet'**
  String get noFoodYet;

  /// No description provided for @noMatchingFood.
  ///
  /// In en, this message translates to:
  /// **'No matching food'**
  String get noMatchingFood;

  /// No description provided for @addFirstFoodOrMeal.
  ///
  /// In en, this message translates to:
  /// **'Add your first food or meal to start building your library.'**
  String get addFirstFoodOrMeal;

  /// No description provided for @noFoodSearchMatches.
  ///
  /// In en, this message translates to:
  /// **'Nothing matches “{search}”. Clear the search to see everything again.'**
  String noFoodSearchMatches(String search);

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// No description provided for @addMeal.
  ///
  /// In en, this message translates to:
  /// **'Add meal'**
  String get addMeal;

  /// No description provided for @noWeightsYet.
  ///
  /// In en, this message translates to:
  /// **'No weights yet'**
  String get noWeightsYet;

  /// No description provided for @noMatchingWeights.
  ///
  /// In en, this message translates to:
  /// **'No matching weights'**
  String get noMatchingWeights;

  /// No description provided for @logFirstWeight.
  ///
  /// In en, this message translates to:
  /// **'Log your first weight to start tracking your trend.'**
  String get logFirstWeight;

  /// No description provided for @noWeightSearchMatches.
  ///
  /// In en, this message translates to:
  /// **'Nothing matches “{search}”. Clear the search to see all entries.'**
  String noWeightSearchMatches(String search);

  /// No description provided for @logWeight.
  ///
  /// In en, this message translates to:
  /// **'Log weight'**
  String get logWeight;

  /// No description provided for @weightTrend.
  ///
  /// In en, this message translates to:
  /// **'Weight trend'**
  String get weightTrend;

  /// No description provided for @weightTrendSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Recent measurements and overall direction'**
  String get weightTrendSubtitle;

  /// No description provided for @bodyWeight.
  ///
  /// In en, this message translates to:
  /// **'Body weight'**
  String get bodyWeight;

  /// No description provided for @options.
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get options;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date range'**
  String get dateRange;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDate;

  /// No description provided for @stopDate.
  ///
  /// In en, this message translates to:
  /// **'Stop date'**
  String get stopDate;

  /// No description provided for @dataPoints.
  ///
  /// In en, this message translates to:
  /// **'Data points'**
  String get dataPoints;

  /// No description provided for @customizeFields.
  ///
  /// In en, this message translates to:
  /// **'Customize fields'**
  String get customizeFields;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the language used by FitBook'**
  String get languageSubtitle;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageSpanish;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFrench;

  /// No description provided for @languageGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get languageGerman;

  /// No description provided for @languageItalian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get languageItalian;

  /// No description provided for @languagePortugueseBrazil.
  ///
  /// In en, this message translates to:
  /// **'Portuguese (Brazil)'**
  String get languagePortugueseBrazil;

  /// No description provided for @languageDutch.
  ///
  /// In en, this message translates to:
  /// **'Dutch'**
  String get languageDutch;

  /// No description provided for @languagePolish.
  ///
  /// In en, this message translates to:
  /// **'Polish'**
  String get languagePolish;

  /// No description provided for @languageJapanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get languageJapanese;

  /// No description provided for @languageKorean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get languageKorean;

  /// No description provided for @languageChineseSimplified.
  ///
  /// In en, this message translates to:
  /// **'Chinese (Simplified)'**
  String get languageChineseSimplified;

  /// No description provided for @appearanceSettings.
  ///
  /// In en, this message translates to:
  /// **'Appearance settings'**
  String get appearanceSettings;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Confirm delete'**
  String get confirmDelete;

  /// No description provided for @confirmDeleteRecords.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Are you sure you want to delete 1 record? This action is not reversible.} other{Are you sure you want to delete {count} records? This action is not reversible.}}'**
  String confirmDeleteRecords(int count);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @showMenu.
  ///
  /// In en, this message translates to:
  /// **'Show menu'**
  String get showMenu;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get selectAll;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @atLeastOneTab.
  ///
  /// In en, this message translates to:
  /// **'You need at least one tab'**
  String get atLeastOneTab;

  /// No description provided for @scrollableTabs.
  ///
  /// In en, this message translates to:
  /// **'Scrollable tabs'**
  String get scrollableTabs;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @pureBlackAmoled.
  ///
  /// In en, this message translates to:
  /// **'Pure black (AMOLED)'**
  String get pureBlackAmoled;

  /// No description provided for @pureBlackAmoledTooltip.
  ///
  /// In en, this message translates to:
  /// **'Use pure black colors for AMOLED displays'**
  String get pureBlackAmoledTooltip;

  /// No description provided for @systemColorScheme.
  ///
  /// In en, this message translates to:
  /// **'System color scheme'**
  String get systemColorScheme;

  /// No description provided for @systemColorSchemeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Use your device\'s primary color for the app'**
  String get systemColorSchemeTooltip;

  /// No description provided for @showImages.
  ///
  /// In en, this message translates to:
  /// **'Show images'**
  String get showImages;

  /// No description provided for @showImagesTooltip.
  ///
  /// In en, this message translates to:
  /// **'Pick and display images on the diary and food pages'**
  String get showImagesTooltip;

  /// No description provided for @curveLineGraphs.
  ///
  /// In en, this message translates to:
  /// **'Curve line graphs'**
  String get curveLineGraphs;

  /// No description provided for @curveLineGraphsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Use smooth curves on the graphs page'**
  String get curveLineGraphsTooltip;

  /// No description provided for @weightStatCards.
  ///
  /// In en, this message translates to:
  /// **'Weight stat cards'**
  String get weightStatCards;

  /// No description provided for @weightStatCardsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Show weight entries as a grid of stat cards instead of the default list'**
  String get weightStatCardsTooltip;

  /// No description provided for @graphsStartAtZero.
  ///
  /// In en, this message translates to:
  /// **'Graphs start at zero'**
  String get graphsStartAtZero;

  /// No description provided for @graphsStartAtZeroTooltip.
  ///
  /// In en, this message translates to:
  /// **'Always start the graph y-axis at zero'**
  String get graphsStartAtZeroTooltip;

  /// No description provided for @navigationAnimation.
  ///
  /// In en, this message translates to:
  /// **'Navigation animation'**
  String get navigationAnimation;

  /// No description provided for @animationFade.
  ///
  /// In en, this message translates to:
  /// **'Fade'**
  String get animationFade;

  /// No description provided for @animationZoom.
  ///
  /// In en, this message translates to:
  /// **'Zoom'**
  String get animationZoom;

  /// No description provided for @animationSlide.
  ///
  /// In en, this message translates to:
  /// **'Slide'**
  String get animationSlide;

  /// No description provided for @animationRise.
  ///
  /// In en, this message translates to:
  /// **'Rise'**
  String get animationRise;

  /// No description provided for @animationNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get animationNone;

  /// No description provided for @longDateFormat.
  ///
  /// In en, this message translates to:
  /// **'Long date format ({example})'**
  String longDateFormat(String example);

  /// No description provided for @shortDateFormat.
  ///
  /// In en, this message translates to:
  /// **'Short date format ({example})'**
  String shortDateFormat(String example);

  /// No description provided for @diarySettings.
  ///
  /// In en, this message translates to:
  /// **'Diary settings'**
  String get diarySettings;

  /// No description provided for @diaryUnit.
  ///
  /// In en, this message translates to:
  /// **'Diary unit'**
  String get diaryUnit;

  /// No description provided for @diarySummary.
  ///
  /// In en, this message translates to:
  /// **'Diary summary'**
  String get diarySummary;

  /// No description provided for @diarySummaryDivision.
  ///
  /// In en, this message translates to:
  /// **'Division - current / total'**
  String get diarySummaryDivision;

  /// No description provided for @diarySummaryRemaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get diarySummaryRemaining;

  /// No description provided for @diarySummaryBoth.
  ///
  /// In en, this message translates to:
  /// **'Both - remaining (total)'**
  String get diarySummaryBoth;

  /// No description provided for @diarySummaryNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get diarySummaryNone;

  /// No description provided for @dailyCaloriesKcal.
  ///
  /// In en, this message translates to:
  /// **'Daily calories (kcal)'**
  String get dailyCaloriesKcal;

  /// No description provided for @dailyProteinG.
  ///
  /// In en, this message translates to:
  /// **'Daily protein (g)'**
  String get dailyProteinG;

  /// No description provided for @dailyFatG.
  ///
  /// In en, this message translates to:
  /// **'Daily fat (g)'**
  String get dailyFatG;

  /// No description provided for @dailyCarbsG.
  ///
  /// In en, this message translates to:
  /// **'Daily carbs (g)'**
  String get dailyCarbsG;

  /// No description provided for @dailyFiberG.
  ///
  /// In en, this message translates to:
  /// **'Daily fiber (g)'**
  String get dailyFiberG;

  /// No description provided for @automaticDailies.
  ///
  /// In en, this message translates to:
  /// **'Automatic daily targets'**
  String get automaticDailies;

  /// No description provided for @automaticDailiesTooltip.
  ///
  /// In en, this message translates to:
  /// **'Automatically calculate recommended daily calories, protein, fat and carbs from your body weight'**
  String get automaticDailiesTooltip;

  /// No description provided for @selectNameOnSubmit.
  ///
  /// In en, this message translates to:
  /// **'Select name on submit'**
  String get selectNameOnSubmit;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @foodSettings.
  ///
  /// In en, this message translates to:
  /// **'Food settings'**
  String get foodSettings;

  /// No description provided for @foodUnit.
  ///
  /// In en, this message translates to:
  /// **'Food unit'**
  String get foodUnit;

  /// No description provided for @fields.
  ///
  /// In en, this message translates to:
  /// **'Fields'**
  String get fields;

  /// No description provided for @favoriteNewFoods.
  ///
  /// In en, this message translates to:
  /// **'Favorite new foods'**
  String get favoriteNewFoods;

  /// No description provided for @pickFields.
  ///
  /// In en, this message translates to:
  /// **'Pick fields'**
  String get pickFields;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @onlySelected.
  ///
  /// In en, this message translates to:
  /// **'Only selected'**
  String get onlySelected;

  /// No description provided for @weightSettings.
  ///
  /// In en, this message translates to:
  /// **'Weight settings'**
  String get weightSettings;

  /// No description provided for @targetWeight.
  ///
  /// In en, this message translates to:
  /// **'Target weight'**
  String get targetWeight;

  /// No description provided for @positiveReinforcement.
  ///
  /// In en, this message translates to:
  /// **'Positive reinforcement'**
  String get positiveReinforcement;

  /// No description provided for @positiveReinforcementPreview.
  ///
  /// In en, this message translates to:
  /// **'Encouraging messages will be shown like this!'**
  String get positiveReinforcementPreview;

  /// No description provided for @dataSettings.
  ///
  /// In en, this message translates to:
  /// **'Data settings'**
  String get dataSettings;

  /// No description provided for @automaticBackup.
  ///
  /// In en, this message translates to:
  /// **'Automatic backup'**
  String get automaticBackup;

  /// No description provided for @shareDatabase.
  ///
  /// In en, this message translates to:
  /// **'Share database'**
  String get shareDatabase;

  /// No description provided for @openNotification.
  ///
  /// In en, this message translates to:
  /// **'Open notification'**
  String get openNotification;

  /// No description provided for @automaticBackupsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Automatic backups enabled'**
  String get automaticBackupsEnabled;

  /// No description provided for @automaticBackupBody.
  ///
  /// In en, this message translates to:
  /// **'FitBook will automatically back up your data and images to the selected folder each day.'**
  String get automaticBackupBody;

  /// No description provided for @backupSettings.
  ///
  /// In en, this message translates to:
  /// **'Backup settings'**
  String get backupSettings;

  /// No description provided for @backupSettingsChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifications about automatic backups'**
  String get backupSettingsChannelDescription;

  /// No description provided for @openFoodFacts.
  ///
  /// In en, this message translates to:
  /// **'Open Food Facts'**
  String get openFoodFacts;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @loggedIn.
  ///
  /// In en, this message translates to:
  /// **'Logged in'**
  String get loggedIn;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @whatsNew.
  ///
  /// In en, this message translates to:
  /// **'What\'s new?'**
  String get whatsNew;

  /// No description provided for @author.
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// No description provided for @donate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donate;

  /// No description provided for @supportProject.
  ///
  /// In en, this message translates to:
  /// **'Help support this project'**
  String get supportProject;

  /// No description provided for @leaveReview.
  ///
  /// In en, this message translates to:
  /// **'Leave a review'**
  String get leaveReview;

  /// No description provided for @rateOnPlayStore.
  ///
  /// In en, this message translates to:
  /// **'Rate FitBook on the Play Store'**
  String get rateOnPlayStore;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get sourceCode;

  /// No description provided for @foods.
  ///
  /// In en, this message translates to:
  /// **'Foods'**
  String get foods;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export data'**
  String get exportData;

  /// No description provided for @importData.
  ///
  /// In en, this message translates to:
  /// **'Import data'**
  String get importData;

  /// No description provided for @failedImportData.
  ///
  /// In en, this message translates to:
  /// **'Failed to import data'**
  String get failedImportData;

  /// No description provided for @copyError.
  ///
  /// In en, this message translates to:
  /// **'Copy error'**
  String get copyError;

  /// No description provided for @deleteRecords.
  ///
  /// In en, this message translates to:
  /// **'Delete records'**
  String get deleteRecords;

  /// No description provided for @unusedFood.
  ///
  /// In en, this message translates to:
  /// **'Unused food'**
  String get unusedFood;

  /// No description provided for @database.
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get database;

  /// No description provided for @deleteAllWeightsConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all weights? This action is not reversible.'**
  String get deleteAllWeightsConfirm;

  /// No description provided for @deleteDatabaseConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your database? This action is not reversible and will destroy all your data.'**
  String get deleteDatabaseConfirm;

  /// No description provided for @deleteFoodsAndDiaryConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all food and diary entries? This action is not reversible.'**
  String get deleteFoodsAndDiaryConfirm;

  /// No description provided for @deleteUnusedFoodsConfirm.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Are you sure you want to delete 1 unused food? This action is irreversible.} other{Are you sure you want to delete {count} unused foods? This action is irreversible.}}'**
  String deleteUnusedFoodsConfirm(int count);

  /// No description provided for @deleteAllDiaryConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all diary entries? This action is not reversible.'**
  String get deleteAllDiaryConfirm;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @replaceImage.
  ///
  /// In en, this message translates to:
  /// **'Replace image'**
  String get replaceImage;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take photo'**
  String get takePhoto;

  /// No description provided for @deleteImage.
  ///
  /// In en, this message translates to:
  /// **'Delete image'**
  String get deleteImage;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @foodGroup.
  ///
  /// In en, this message translates to:
  /// **'Food group'**
  String get foodGroup;

  /// No description provided for @exampleFruit.
  ///
  /// In en, this message translates to:
  /// **'Fruit'**
  String get exampleFruit;

  /// No description provided for @clearFiltersCount.
  ///
  /// In en, this message translates to:
  /// **'Clear ({count})'**
  String clearFiltersCount(int count);

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @showFilters.
  ///
  /// In en, this message translates to:
  /// **'Show filters'**
  String get showFilters;

  /// No description provided for @repeatEntry.
  ///
  /// In en, this message translates to:
  /// **'Repeat entry'**
  String get repeatEntry;

  /// No description provided for @timeOfDay.
  ///
  /// In en, this message translates to:
  /// **'Time of day'**
  String get timeOfDay;

  /// No description provided for @everyDay.
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get everyDay;

  /// No description provided for @repeatEveryDayForYear.
  ///
  /// In en, this message translates to:
  /// **'Create this entry each day for the next year'**
  String get repeatEveryDayForYear;

  /// No description provided for @repeatOn.
  ///
  /// In en, this message translates to:
  /// **'Repeat on'**
  String get repeatOn;

  /// No description provided for @weekdayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get weekdayMon;

  /// No description provided for @weekdayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get weekdayTue;

  /// No description provided for @weekdayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get weekdayWed;

  /// No description provided for @weekdayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get weekdayThu;

  /// No description provided for @weekdayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get weekdayFri;

  /// No description provided for @weekdaySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get weekdaySat;

  /// No description provided for @weekdaySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get weekdaySun;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @enterValidNutritionValues.
  ///
  /// In en, this message translates to:
  /// **'Enter valid nutrition values'**
  String get enterValidNutritionValues;

  /// No description provided for @quickAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick add'**
  String get quickAddTitle;

  /// No description provided for @kilojoules.
  ///
  /// In en, this message translates to:
  /// **'Kilojoules'**
  String get kilojoules;

  /// No description provided for @createdDate.
  ///
  /// In en, this message translates to:
  /// **'Created date'**
  String get createdDate;

  /// No description provided for @failedMigrations.
  ///
  /// In en, this message translates to:
  /// **'Failed migrations'**
  String get failedMigrations;

  /// No description provided for @failedMigrationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong when creating or upgrading your database. Usually this can be fixed by deleting and re-creating your records.'**
  String get failedMigrationsDescription;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Error message:'**
  String get errorMessage;

  /// No description provided for @createIssue.
  ///
  /// In en, this message translates to:
  /// **'Create issue'**
  String get createIssue;

  /// No description provided for @cameraPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to scan.'**
  String get cameraPermissionRequired;

  /// No description provided for @scanFoodBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan a food barcode'**
  String get scanFoodBarcode;

  /// No description provided for @holdBarcodeInFrame.
  ///
  /// In en, this message translates to:
  /// **'Hold the barcode inside the frame'**
  String get holdBarcodeInFrame;

  /// No description provided for @pinchToZoom.
  ///
  /// In en, this message translates to:
  /// **'Pinch to zoom'**
  String get pinchToZoom;

  /// No description provided for @cameraStartFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not start the camera'**
  String get cameraStartFailed;

  /// No description provided for @editDiaryEntry.
  ///
  /// In en, this message translates to:
  /// **'Edit diary entry'**
  String get editDiaryEntry;

  /// No description provided for @addFoodToDiary.
  ///
  /// In en, this message translates to:
  /// **'Add food to diary'**
  String get addFoodToDiary;

  /// No description provided for @confirmDeleteDiaryEntry.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}?'**
  String confirmDeleteDiaryEntry(String name);

  /// No description provided for @imageError.
  ///
  /// In en, this message translates to:
  /// **'Image error'**
  String get imageError;

  /// No description provided for @setImage.
  ///
  /// In en, this message translates to:
  /// **'Set image'**
  String get setImage;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @searchFoodsAndMeals.
  ///
  /// In en, this message translates to:
  /// **'Search foods and meals...'**
  String get searchFoodsAndMeals;

  /// No description provided for @clearSelection.
  ///
  /// In en, this message translates to:
  /// **'Clear selection'**
  String get clearSelection;

  /// No description provided for @barcodeNotFoundSaveToInsert.
  ///
  /// In en, this message translates to:
  /// **'Barcode not found. Save to insert.'**
  String get barcodeNotFoundSaveToInsert;

  /// No description provided for @searchOpenFoodFactsFor.
  ///
  /// In en, this message translates to:
  /// **'Search OpenFoodFacts for \"{name}\"'**
  String searchOpenFoodFactsFor(String name);

  /// No description provided for @meal.
  ///
  /// In en, this message translates to:
  /// **'Meal'**
  String get meal;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @servingWithAmountUnit.
  ///
  /// In en, this message translates to:
  /// **'Serving ({amount} {unit})'**
  String servingWithAmountUnit(String amount, String unit);

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// No description provided for @nutritionPerAmountUnit.
  ///
  /// In en, this message translates to:
  /// **'{nutrient} (per {amount} {unit})'**
  String nutritionPerAmountUnit(String nutrient, String amount, String unit);

  /// No description provided for @nutritionPerQuantityUnit.
  ///
  /// In en, this message translates to:
  /// **'{nutrient} per {quantity} {unit}'**
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit);

  /// No description provided for @fiber.
  ///
  /// In en, this message translates to:
  /// **'Fiber'**
  String get fiber;

  /// No description provided for @unitServing.
  ///
  /// In en, this message translates to:
  /// **'Serving'**
  String get unitServing;

  /// No description provided for @unitGrams.
  ///
  /// In en, this message translates to:
  /// **'Grams'**
  String get unitGrams;

  /// No description provided for @unitMilliliters.
  ///
  /// In en, this message translates to:
  /// **'Milliliters'**
  String get unitMilliliters;

  /// No description provided for @unitKilojoules.
  ///
  /// In en, this message translates to:
  /// **'Kilojoules'**
  String get unitKilojoules;

  /// No description provided for @unitCups.
  ///
  /// In en, this message translates to:
  /// **'Cups'**
  String get unitCups;

  /// No description provided for @unitTablespoons.
  ///
  /// In en, this message translates to:
  /// **'Tablespoons'**
  String get unitTablespoons;

  /// No description provided for @unitMilligrams.
  ///
  /// In en, this message translates to:
  /// **'Milligrams'**
  String get unitMilligrams;

  /// No description provided for @unitTeaspoons.
  ///
  /// In en, this message translates to:
  /// **'Teaspoons'**
  String get unitTeaspoons;

  /// No description provided for @unitOunces.
  ///
  /// In en, this message translates to:
  /// **'Ounces'**
  String get unitOunces;

  /// No description provided for @unitPounds.
  ///
  /// In en, this message translates to:
  /// **'Pounds'**
  String get unitPounds;

  /// No description provided for @unitKilograms.
  ///
  /// In en, this message translates to:
  /// **'Kilograms'**
  String get unitKilograms;

  /// No description provided for @unitLiters.
  ///
  /// In en, this message translates to:
  /// **'Liters'**
  String get unitLiters;

  /// No description provided for @nameConflict.
  ///
  /// In en, this message translates to:
  /// **'Name conflict'**
  String get nameConflict;

  /// No description provided for @replaceExistingFood.
  ///
  /// In en, this message translates to:
  /// **'A food already exists with this name. Do you want to replace the old one?'**
  String get replaceExistingFood;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @editFood.
  ///
  /// In en, this message translates to:
  /// **'Edit food'**
  String get editFood;

  /// No description provided for @confirmDeleteFood.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}?'**
  String confirmDeleteFood(String name);

  /// No description provided for @caloriesKcal.
  ///
  /// In en, this message translates to:
  /// **'Calories (kcal)'**
  String get caloriesKcal;

  /// No description provided for @kilojoulesKj.
  ///
  /// In en, this message translates to:
  /// **'Kilojoules (kJ)'**
  String get kilojoulesKj;

  /// No description provided for @servingSize.
  ///
  /// In en, this message translates to:
  /// **'Serving size'**
  String get servingSize;

  /// No description provided for @servingUnit.
  ///
  /// In en, this message translates to:
  /// **'Serving unit'**
  String get servingUnit;

  /// No description provided for @saveAsNewCopy.
  ///
  /// In en, this message translates to:
  /// **'Save as new copy'**
  String get saveAsNewCopy;

  /// No description provided for @filterFoods.
  ///
  /// In en, this message translates to:
  /// **'Filter foods'**
  String get filterFoods;

  /// No description provided for @narrowFoodsFilters.
  ///
  /// In en, this message translates to:
  /// **'Narrow the list using any combination of filters.'**
  String get narrowFoodsFilters;

  /// No description provided for @foodDetails.
  ///
  /// In en, this message translates to:
  /// **'Food details'**
  String get foodDetails;

  /// No description provided for @exampleFruitHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Fruit'**
  String get exampleFruitHint;

  /// No description provided for @servingSizeRangeHint.
  ///
  /// In en, this message translates to:
  /// **'Set a minimum, maximum, or both.'**
  String get servingSizeRangeHint;

  /// No description provided for @minimum.
  ///
  /// In en, this message translates to:
  /// **'Minimum'**
  String get minimum;

  /// No description provided for @maximum.
  ///
  /// In en, this message translates to:
  /// **'Maximum'**
  String get maximum;

  /// No description provided for @noMinimum.
  ///
  /// In en, this message translates to:
  /// **'No minimum'**
  String get noMinimum;

  /// No description provided for @noMaximum.
  ///
  /// In en, this message translates to:
  /// **'No maximum'**
  String get noMaximum;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// No description provided for @searchOpenFoodFacts.
  ///
  /// In en, this message translates to:
  /// **'Search Open Food Facts'**
  String get searchOpenFoodFacts;

  /// No description provided for @noMatchingProducts.
  ///
  /// In en, this message translates to:
  /// **'No matching products'**
  String get noMatchingProducts;

  /// No description provided for @tryAnotherNameOrScanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Try another name or scan a barcode.'**
  String get tryAnotherNameOrScanBarcode;

  /// No description provided for @enterFoodNameToSearch.
  ///
  /// In en, this message translates to:
  /// **'Enter a food name above, then submit to search.'**
  String get enterFoodNameToSearch;

  /// No description provided for @submitToSearch.
  ///
  /// In en, this message translates to:
  /// **'Submit to search...'**
  String get submitToSearch;

  /// No description provided for @kcalValue.
  ///
  /// In en, this message translates to:
  /// **'{value} kcal'**
  String kcalValue(String value);

  /// No description provided for @proteinGramsValue.
  ///
  /// In en, this message translates to:
  /// **'{value} g protein'**
  String proteinGramsValue(String value);

  /// No description provided for @editFoodsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Edit 1 food} other{Edit {count} foods}}'**
  String editFoodsCount(int count);

  /// No description provided for @editMeal.
  ///
  /// In en, this message translates to:
  /// **'Edit meal'**
  String get editMeal;

  /// No description provided for @addImage.
  ///
  /// In en, this message translates to:
  /// **'Add image'**
  String get addImage;

  /// No description provided for @noFoodsInMeal.
  ///
  /// In en, this message translates to:
  /// **'No foods in this meal yet'**
  String get noFoodsInMeal;

  /// No description provided for @addFoodToMealHint.
  ///
  /// In en, this message translates to:
  /// **'Add a food to start building this meal.'**
  String get addFoodToMealHint;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @searchFoods.
  ///
  /// In en, this message translates to:
  /// **'Search foods...'**
  String get searchFoods;

  /// No description provided for @noFoodsFound.
  ///
  /// In en, this message translates to:
  /// **'No foods found'**
  String get noFoodsFound;

  /// No description provided for @nothingMatchesSearch.
  ///
  /// In en, this message translates to:
  /// **'Nothing matches “{search}”.'**
  String nothingMatchesSearch(String search);

  /// No description provided for @addFoodsToLibraryFirst.
  ///
  /// In en, this message translates to:
  /// **'Add some foods to your library before adding them to a meal.'**
  String get addFoodsToLibraryFirst;

  /// No description provided for @caloriesPer100gValue.
  ///
  /// In en, this message translates to:
  /// **'{value} kcal / 100 g'**
  String caloriesPer100gValue(String value);

  /// No description provided for @noDataYet.
  ///
  /// In en, this message translates to:
  /// **'No data yet'**
  String get noDataYet;

  /// No description provided for @completePlansToViewGraphs.
  ///
  /// In en, this message translates to:
  /// **'Complete some plans to view graphs here.'**
  String get completePlansToViewGraphs;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @notSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get notSet;

  /// No description provided for @trend.
  ///
  /// In en, this message translates to:
  /// **'Trend'**
  String get trend;

  /// No description provided for @smooth.
  ///
  /// In en, this message translates to:
  /// **'Smooth'**
  String get smooth;

  /// No description provided for @pointAverage.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1-point average} other{{count}-point average}}'**
  String pointAverage(int count);

  /// No description provided for @editWeight.
  ///
  /// In en, this message translates to:
  /// **'Edit weight'**
  String get editWeight;

  /// No description provided for @addWeight.
  ///
  /// In en, this message translates to:
  /// **'Add weight'**
  String get addWeight;

  /// No description provided for @shareWeight.
  ///
  /// In en, this message translates to:
  /// **'I just weighed {value} {unit}!'**
  String shareWeight(String value, String unit);

  /// No description provided for @weightWithUnit.
  ///
  /// In en, this message translates to:
  /// **'Weight ({unit})'**
  String weightWithUnit(String unit);

  /// No description provided for @pleaseEnterWeight.
  ///
  /// In en, this message translates to:
  /// **'Please enter weight'**
  String get pleaseEnterWeight;

  /// No description provided for @pleaseEnterValidWeight.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid weight'**
  String get pleaseEnterValidWeight;

  /// No description provided for @lastWeight.
  ///
  /// In en, this message translates to:
  /// **'Last weight'**
  String get lastWeight;

  /// No description provided for @unitWithValue.
  ///
  /// In en, this message translates to:
  /// **'Unit ({unit})'**
  String unitWithValue(String unit);

  /// No description provided for @keepUnitAs.
  ///
  /// In en, this message translates to:
  /// **'Keep unit as {unit}'**
  String keepUnitAs(String unit);

  /// No description provided for @convertToUnit.
  ///
  /// In en, this message translates to:
  /// **'Convert to {unit}'**
  String convertToUnit(String unit);

  /// No description provided for @removeImage.
  ///
  /// In en, this message translates to:
  /// **'Remove image'**
  String get removeImage;

  /// No description provided for @mealRemindersEnabled.
  ///
  /// In en, this message translates to:
  /// **'Meal reminders enabled'**
  String get mealRemindersEnabled;

  /// No description provided for @mealRemindersEnabledBody.
  ///
  /// In en, this message translates to:
  /// **'We\'ll remind you to log breakfast, lunch, or dinner if you haven\'t logged it yet.'**
  String get mealRemindersEnabledBody;

  /// No description provided for @reminderSettingsChannel.
  ///
  /// In en, this message translates to:
  /// **'Reminder settings'**
  String get reminderSettingsChannel;

  /// No description provided for @reminderSettingsChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifications explaining FitBook reminders'**
  String get reminderSettingsChannelDescription;

  /// No description provided for @breakfastReminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to log breakfast'**
  String get breakfastReminderTitle;

  /// No description provided for @breakfastRemindersChannel.
  ///
  /// In en, this message translates to:
  /// **'Breakfast reminders'**
  String get breakfastRemindersChannel;

  /// No description provided for @breakfastRemindersChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Reminders to log breakfast'**
  String get breakfastRemindersChannelDescription;

  /// No description provided for @lunchReminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to log lunch'**
  String get lunchReminderTitle;

  /// No description provided for @lunchRemindersChannel.
  ///
  /// In en, this message translates to:
  /// **'Lunch reminders'**
  String get lunchRemindersChannel;

  /// No description provided for @lunchRemindersChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Reminders to log lunch'**
  String get lunchRemindersChannelDescription;

  /// No description provided for @dinnerReminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to log dinner'**
  String get dinnerReminderTitle;

  /// No description provided for @dinnerRemindersChannel.
  ///
  /// In en, this message translates to:
  /// **'Dinner reminders'**
  String get dinnerRemindersChannel;

  /// No description provided for @dinnerRemindersChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Reminders to log dinner'**
  String get dinnerRemindersChannelDescription;

  /// No description provided for @reinforcementGreatJob.
  ///
  /// In en, this message translates to:
  /// **'Great job! Your hard work is paying off.'**
  String get reinforcementGreatJob;

  /// No description provided for @reinforcementKeepItUp.
  ///
  /// In en, this message translates to:
  /// **'Keep it up! You are making excellent progress.'**
  String get reinforcementKeepItUp;

  /// No description provided for @reinforcementFantastic.
  ///
  /// In en, this message translates to:
  /// **'Fantastic! Your dedication is showing results.'**
  String get reinforcementFantastic;

  /// No description provided for @reinforcementWellDone.
  ///
  /// In en, this message translates to:
  /// **'Well done! You are one step closer to your goal.'**
  String get reinforcementWellDone;

  /// No description provided for @reinforcementImpressive.
  ///
  /// In en, this message translates to:
  /// **'Impressive! Your efforts are bearing fruit.'**
  String get reinforcementImpressive;

  /// No description provided for @reinforcementAmazing.
  ///
  /// In en, this message translates to:
  /// **'Amazing! You are on the right track.'**
  String get reinforcementAmazing;

  /// No description provided for @reinforcementBravo.
  ///
  /// In en, this message translates to:
  /// **'Bravo! Your commitment is commendable.'**
  String get reinforcementBravo;

  /// No description provided for @reinforcementExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent! Your perseverance is inspiring.'**
  String get reinforcementExcellent;

  /// No description provided for @reinforcementSuperb.
  ///
  /// In en, this message translates to:
  /// **'Superb! You are doing an outstanding job.'**
  String get reinforcementSuperb;

  /// No description provided for @reinforcementIncredible.
  ///
  /// In en, this message translates to:
  /// **'Incredible! Your progress is noticeable.'**
  String get reinforcementIncredible;

  /// No description provided for @reinforcementWayToGoKing.
  ///
  /// In en, this message translates to:
  /// **'Way to go King'**
  String get reinforcementWayToGoKing;

  /// No description provided for @reinforcementYeahBuddy.
  ///
  /// In en, this message translates to:
  /// **'Yeah buddy!'**
  String get reinforcementYeahBuddy;

  /// No description provided for @reinforcementThatsHowItsDone.
  ///
  /// In en, this message translates to:
  /// **'That\'s how it\'s done.'**
  String get reinforcementThatsHowItsDone;

  /// No description provided for @reinforcementEasyAsPie.
  ///
  /// In en, this message translates to:
  /// **'Easy as pie.'**
  String get reinforcementEasyAsPie;

  /// No description provided for @reinforcementDoingGreat.
  ///
  /// In en, this message translates to:
  /// **'You are doing great.'**
  String get reinforcementDoingGreat;

  /// No description provided for @reinforcementProgressNice.
  ///
  /// In en, this message translates to:
  /// **'Is that progress I see? Nice.'**
  String get reinforcementProgressNice;

  /// No description provided for @diarySummaryRemainingValue.
  ///
  /// In en, this message translates to:
  /// **'{remaining} {unit} remaining'**
  String diarySummaryRemainingValue(String remaining, String unit);

  /// No description provided for @diarySummaryBothValue.
  ///
  /// In en, this message translates to:
  /// **'{remaining} {unit} remaining ({target} {unit})'**
  String diarySummaryBothValue(String remaining, String target, String unit);

  /// No description provided for @diarySummaryDivisionValue.
  ///
  /// In en, this message translates to:
  /// **'{current} / {target} {unit}'**
  String diarySummaryDivisionValue(String current, String target, String unit);

  /// No description provided for @nutrientSugars.
  ///
  /// In en, this message translates to:
  /// **'Sugars'**
  String get nutrientSugars;

  /// No description provided for @nutrientCholesterol.
  ///
  /// In en, this message translates to:
  /// **'Cholesterol'**
  String get nutrientCholesterol;

  /// No description provided for @nutrientSaturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Saturated fat'**
  String get nutrientSaturatedFat;

  /// No description provided for @nutrientCalcium.
  ///
  /// In en, this message translates to:
  /// **'Calcium'**
  String get nutrientCalcium;

  /// No description provided for @nutrientIron.
  ///
  /// In en, this message translates to:
  /// **'Iron'**
  String get nutrientIron;

  /// No description provided for @nutrientPotassium.
  ///
  /// In en, this message translates to:
  /// **'Potassium'**
  String get nutrientPotassium;

  /// No description provided for @nutrientMagnesium.
  ///
  /// In en, this message translates to:
  /// **'Magnesium'**
  String get nutrientMagnesium;

  /// No description provided for @nutrientVitaminA.
  ///
  /// In en, this message translates to:
  /// **'Vitamin A'**
  String get nutrientVitaminA;

  /// No description provided for @nutrientVitaminC.
  ///
  /// In en, this message translates to:
  /// **'Vitamin C'**
  String get nutrientVitaminC;

  /// No description provided for @nutrientVitaminB12.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B12'**
  String get nutrientVitaminB12;

  /// No description provided for @nutrientVitaminD.
  ///
  /// In en, this message translates to:
  /// **'Vitamin D'**
  String get nutrientVitaminD;

  /// No description provided for @nutrientVitaminE.
  ///
  /// In en, this message translates to:
  /// **'Vitamin E'**
  String get nutrientVitaminE;

  /// No description provided for @nutrientAddedSugar.
  ///
  /// In en, this message translates to:
  /// **'Added sugar'**
  String get nutrientAddedSugar;

  /// No description provided for @nutrientNetCarbs.
  ///
  /// In en, this message translates to:
  /// **'Net carbs'**
  String get nutrientNetCarbs;

  /// No description provided for @nutrientWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get nutrientWater;

  /// No description provided for @nutrientOmega3.
  ///
  /// In en, this message translates to:
  /// **'Omega-3 fatty acids'**
  String get nutrientOmega3;

  /// No description provided for @nutrientOmega6.
  ///
  /// In en, this message translates to:
  /// **'Omega-6 fatty acids'**
  String get nutrientOmega6;

  /// No description provided for @nutrientPralScore.
  ///
  /// In en, this message translates to:
  /// **'PRAL score'**
  String get nutrientPralScore;

  /// No description provided for @nutrientTransFat.
  ///
  /// In en, this message translates to:
  /// **'Trans fat'**
  String get nutrientTransFat;

  /// No description provided for @nutrientSolubleFiber.
  ///
  /// In en, this message translates to:
  /// **'Soluble fiber'**
  String get nutrientSolubleFiber;

  /// No description provided for @nutrientInsolubleFiber.
  ///
  /// In en, this message translates to:
  /// **'Insoluble fiber'**
  String get nutrientInsolubleFiber;

  /// No description provided for @nutrientPhosphorus.
  ///
  /// In en, this message translates to:
  /// **'Phosphorus'**
  String get nutrientPhosphorus;

  /// No description provided for @nutrientSodium.
  ///
  /// In en, this message translates to:
  /// **'Sodium'**
  String get nutrientSodium;

  /// No description provided for @nutrientZinc.
  ///
  /// In en, this message translates to:
  /// **'Zinc'**
  String get nutrientZinc;

  /// No description provided for @nutrientCopper.
  ///
  /// In en, this message translates to:
  /// **'Copper'**
  String get nutrientCopper;

  /// No description provided for @nutrientManganese.
  ///
  /// In en, this message translates to:
  /// **'Manganese'**
  String get nutrientManganese;

  /// No description provided for @nutrientSelenium.
  ///
  /// In en, this message translates to:
  /// **'Selenium'**
  String get nutrientSelenium;

  /// No description provided for @nutrientFluoride.
  ///
  /// In en, this message translates to:
  /// **'Fluoride'**
  String get nutrientFluoride;

  /// No description provided for @nutrientMolybdenum.
  ///
  /// In en, this message translates to:
  /// **'Molybdenum'**
  String get nutrientMolybdenum;

  /// No description provided for @nutrientChloride.
  ///
  /// In en, this message translates to:
  /// **'Chloride'**
  String get nutrientChloride;

  /// No description provided for @nutrientSucrose.
  ///
  /// In en, this message translates to:
  /// **'Sucrose'**
  String get nutrientSucrose;

  /// No description provided for @nutrientGlucose.
  ///
  /// In en, this message translates to:
  /// **'Glucose'**
  String get nutrientGlucose;

  /// No description provided for @nutrientFructose.
  ///
  /// In en, this message translates to:
  /// **'Fructose'**
  String get nutrientFructose;

  /// No description provided for @nutrientLactose.
  ///
  /// In en, this message translates to:
  /// **'Lactose'**
  String get nutrientLactose;

  /// No description provided for @nutrientMaltose.
  ///
  /// In en, this message translates to:
  /// **'Maltose'**
  String get nutrientMaltose;

  /// No description provided for @nutrientGalactose.
  ///
  /// In en, this message translates to:
  /// **'Galactose'**
  String get nutrientGalactose;

  /// No description provided for @nutrientStarch.
  ///
  /// In en, this message translates to:
  /// **'Starch'**
  String get nutrientStarch;

  /// No description provided for @nutrientSugarAlcohols.
  ///
  /// In en, this message translates to:
  /// **'Sugar alcohols'**
  String get nutrientSugarAlcohols;

  /// No description provided for @nutrientThiaminB1.
  ///
  /// In en, this message translates to:
  /// **'Thiamin (B1)'**
  String get nutrientThiaminB1;

  /// No description provided for @nutrientRiboflavinB2.
  ///
  /// In en, this message translates to:
  /// **'Riboflavin (B2)'**
  String get nutrientRiboflavinB2;

  /// No description provided for @nutrientNiacinB3.
  ///
  /// In en, this message translates to:
  /// **'Niacin (B3)'**
  String get nutrientNiacinB3;

  /// No description provided for @nutrientPantothenicAcidB5.
  ///
  /// In en, this message translates to:
  /// **'Pantothenic acid (B5)'**
  String get nutrientPantothenicAcidB5;

  /// No description provided for @nutrientVitaminB6.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B6'**
  String get nutrientVitaminB6;

  /// No description provided for @nutrientBiotinB7.
  ///
  /// In en, this message translates to:
  /// **'Biotin (B7)'**
  String get nutrientBiotinB7;

  /// No description provided for @nutrientFolateB9.
  ///
  /// In en, this message translates to:
  /// **'Folate (B9)'**
  String get nutrientFolateB9;

  /// No description provided for @nutrientFolicAcid.
  ///
  /// In en, this message translates to:
  /// **'Folic acid'**
  String get nutrientFolicAcid;

  /// No description provided for @nutrientFoodFolate.
  ///
  /// In en, this message translates to:
  /// **'Food folate'**
  String get nutrientFoodFolate;

  /// No description provided for @nutrientFolateDfe.
  ///
  /// In en, this message translates to:
  /// **'Dietary folate equivalents (DFE)'**
  String get nutrientFolateDfe;

  /// No description provided for @nutrientCholine.
  ///
  /// In en, this message translates to:
  /// **'Choline'**
  String get nutrientCholine;

  /// No description provided for @nutrientBetaine.
  ///
  /// In en, this message translates to:
  /// **'Betaine'**
  String get nutrientBetaine;

  /// No description provided for @nutrientRetinol.
  ///
  /// In en, this message translates to:
  /// **'Retinol'**
  String get nutrientRetinol;

  /// No description provided for @nutrientBetaCarotene.
  ///
  /// In en, this message translates to:
  /// **'Beta-carotene'**
  String get nutrientBetaCarotene;

  /// No description provided for @nutrientAlphaCarotene.
  ///
  /// In en, this message translates to:
  /// **'Alpha-carotene'**
  String get nutrientAlphaCarotene;

  /// No description provided for @nutrientLycopene.
  ///
  /// In en, this message translates to:
  /// **'Lycopene'**
  String get nutrientLycopene;

  /// No description provided for @nutrientLuteinZeaxanthin.
  ///
  /// In en, this message translates to:
  /// **'Lutein + zeaxanthin'**
  String get nutrientLuteinZeaxanthin;

  /// No description provided for @nutrientVitaminD2.
  ///
  /// In en, this message translates to:
  /// **'Vitamin D2 (ergocalciferol)'**
  String get nutrientVitaminD2;

  /// No description provided for @nutrientVitaminD3.
  ///
  /// In en, this message translates to:
  /// **'Vitamin D3 (cholecalciferol)'**
  String get nutrientVitaminD3;

  /// No description provided for @nutrientVitaminK.
  ///
  /// In en, this message translates to:
  /// **'Vitamin K'**
  String get nutrientVitaminK;

  /// No description provided for @nutrientDihydrophylloquinone.
  ///
  /// In en, this message translates to:
  /// **'Dihydrophylloquinone'**
  String get nutrientDihydrophylloquinone;

  /// No description provided for @nutrientMenaquinone4.
  ///
  /// In en, this message translates to:
  /// **'Menaquinone-4'**
  String get nutrientMenaquinone4;

  /// No description provided for @nutrientMonounsaturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Monounsaturated fat'**
  String get nutrientMonounsaturatedFat;

  /// No description provided for @nutrientPolyunsaturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Polyunsaturated fat'**
  String get nutrientPolyunsaturatedFat;

  /// No description provided for @nutrientAla.
  ///
  /// In en, this message translates to:
  /// **'Alpha-linolenic acid (ALA)'**
  String get nutrientAla;

  /// No description provided for @nutrientEpa.
  ///
  /// In en, this message translates to:
  /// **'Eicosapentaenoic acid (EPA)'**
  String get nutrientEpa;

  /// No description provided for @nutrientDpa.
  ///
  /// In en, this message translates to:
  /// **'Docosapentaenoic acid (DPA)'**
  String get nutrientDpa;

  /// No description provided for @nutrientDha.
  ///
  /// In en, this message translates to:
  /// **'Docosahexaenoic acid (DHA)'**
  String get nutrientDha;

  /// No description provided for @nutrientAlanine.
  ///
  /// In en, this message translates to:
  /// **'Alanine'**
  String get nutrientAlanine;

  /// No description provided for @nutrientAlcohol.
  ///
  /// In en, this message translates to:
  /// **'Alcohol'**
  String get nutrientAlcohol;

  /// No description provided for @nutrientArginine.
  ///
  /// In en, this message translates to:
  /// **'Arginine'**
  String get nutrientArginine;

  /// No description provided for @nutrientAsparticAcid.
  ///
  /// In en, this message translates to:
  /// **'Aspartic acid'**
  String get nutrientAsparticAcid;

  /// No description provided for @nutrientCystine.
  ///
  /// In en, this message translates to:
  /// **'Cystine'**
  String get nutrientCystine;

  /// No description provided for @nutrientGlutamicAcid.
  ///
  /// In en, this message translates to:
  /// **'Glutamic acid'**
  String get nutrientGlutamicAcid;

  /// No description provided for @nutrientGlycine.
  ///
  /// In en, this message translates to:
  /// **'Glycine'**
  String get nutrientGlycine;

  /// No description provided for @nutrientHistidine.
  ///
  /// In en, this message translates to:
  /// **'Histidine'**
  String get nutrientHistidine;

  /// No description provided for @nutrientHydroxyproline.
  ///
  /// In en, this message translates to:
  /// **'Hydroxyproline'**
  String get nutrientHydroxyproline;

  /// No description provided for @nutrientIsoleucine.
  ///
  /// In en, this message translates to:
  /// **'Isoleucine'**
  String get nutrientIsoleucine;

  /// No description provided for @nutrientLeucine.
  ///
  /// In en, this message translates to:
  /// **'Leucine'**
  String get nutrientLeucine;

  /// No description provided for @nutrientLysine.
  ///
  /// In en, this message translates to:
  /// **'Lysine'**
  String get nutrientLysine;

  /// No description provided for @nutrientMethionine.
  ///
  /// In en, this message translates to:
  /// **'Methionine'**
  String get nutrientMethionine;

  /// No description provided for @nutrientPhenylalanine.
  ///
  /// In en, this message translates to:
  /// **'Phenylalanine'**
  String get nutrientPhenylalanine;

  /// No description provided for @nutrientProline.
  ///
  /// In en, this message translates to:
  /// **'Proline'**
  String get nutrientProline;

  /// No description provided for @nutrientSerine.
  ///
  /// In en, this message translates to:
  /// **'Serine'**
  String get nutrientSerine;

  /// No description provided for @nutrientThreonine.
  ///
  /// In en, this message translates to:
  /// **'Threonine'**
  String get nutrientThreonine;

  /// No description provided for @nutrientTryptophan.
  ///
  /// In en, this message translates to:
  /// **'Tryptophan'**
  String get nutrientTryptophan;

  /// No description provided for @nutrientTyrosine.
  ///
  /// In en, this message translates to:
  /// **'Tyrosine'**
  String get nutrientTyrosine;

  /// No description provided for @nutrientValine.
  ///
  /// In en, this message translates to:
  /// **'Valine'**
  String get nutrientValine;

  /// No description provided for @nutrientCaffeine.
  ///
  /// In en, this message translates to:
  /// **'Caffeine'**
  String get nutrientCaffeine;

  /// No description provided for @nutrientTheobromine.
  ///
  /// In en, this message translates to:
  /// **'Theobromine'**
  String get nutrientTheobromine;

  /// No description provided for @servingWeightNumber.
  ///
  /// In en, this message translates to:
  /// **'Serving weight {number}'**
  String servingWeightNumber(int number);

  /// No description provided for @servingDescriptionNumber.
  ///
  /// In en, this message translates to:
  /// **'Serving description {number}'**
  String servingDescriptionNumber(int number);

  /// No description provided for @calorieEquivalentWeight200.
  ///
  /// In en, this message translates to:
  /// **'Weight equivalent to 200 kcal'**
  String get calorieEquivalentWeight200;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'it',
        'ja',
        'ko',
        'nl',
        'pl',
        'pt',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return AppLocalizationsZhCn();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
