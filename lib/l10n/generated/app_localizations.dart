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
  /// **'{foodCount} foods · {mealCount} meals'**
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
