// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'ডায়েরি';

  @override
  String get navGraph => 'গ্রাফ';

  @override
  String get navFood => 'খাবার';

  @override
  String get navWeight => 'ওজন';

  @override
  String get navError => 'ত্রুটি';

  @override
  String get loadDataFailed => 'এই ডেটা লোড করা যায়নি।';

  @override
  String get settings => 'সেটিংস';

  @override
  String get invalidTabSettings => 'ট্যাব সেটিংস সঠিক নয়।';

  @override
  String newVersion(String version) {
    return 'নতুন সংস্করণ $version';
  }

  @override
  String get changes => 'পরিবর্তন';

  @override
  String get searchSettings => 'সেটিংস খুঁজুন...';

  @override
  String get appearance => 'চেহারা';

  @override
  String get appearanceSubtitle => 'থিম, রং এবং গ্রাফ প্রদর্শন';

  @override
  String get diary => 'ডায়েরি';

  @override
  String get diarySubtitle => 'দৈনিক লক্ষ্য, সারাংশ এবং লগিং';

  @override
  String get food => 'খাবার';

  @override
  String get foodSubtitle => 'খাবারের একক, ক্ষেত্র এবং ডিফল্ট';

  @override
  String get weight => 'ওজন';

  @override
  String get weightSubtitle => 'ওজনের একক, লক্ষ্য এবং প্রদর্শন';

  @override
  String get tabs => 'ট্যাব';

  @override
  String get tabsSubtitle => 'নেভিগেশন ট্যাব এবং ক্রম';

  @override
  String get data => 'ডেটা';

  @override
  String get dataSubtitle => 'ইমপোর্ট, এক্সপোর্ট এবং স্থানীয় ডেটা';

  @override
  String get todayProgress => 'আজকের অগ্রগতি';

  @override
  String get latestDay => 'সর্বশেষ দিন';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি এন্ট্রি লগ করা হয়েছে',
      one: '১টি এন্ট্রি লগ করা হয়েছে',
      zero: 'কোনো এন্ট্রি লগ করা হয়নি',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি এন্ট্রি সম্পাদনা করুন',
      one: '১টি এন্ট্রি সম্পাদনা করুন',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'ক্যালরি';

  @override
  String get protein => 'প্রোটিন';

  @override
  String get carbs => 'কার্বোহাইড্রেট';

  @override
  String get fat => 'চর্বি';

  @override
  String get addDiaryEntry => 'ডায়েরি এন্ট্রি যোগ করুন';

  @override
  String get noEntriesToday => 'আজ কোনো এন্ট্রি নেই।';

  @override
  String addSearchToDiary(String search) {
    return '“$search” আপনার ডায়েরিতে যোগ করুন';
  }

  @override
  String get tapStartLoggingFood => 'খাবার লগ করা শুরু করতে ট্যাপ করুন।';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'মিলেছে এমন কোনো ডায়েরি এন্ট্রি নেই। এই খাবার তৈরি করে লগ করতে ট্যাপ করুন।';

  @override
  String get add => 'যোগ করুন';

  @override
  String get quickAdd => 'দ্রুত যোগ';

  @override
  String get scanBarcode => 'বারকোড স্ক্যান করুন';

  @override
  String get foodLibrary => 'খাবারের লাইব্রেরি';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCountটি খাবার',
      one: '১টি খাবার',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCountটি মিল',
      one: '১টি মিল',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'সম্প্রতি ব্যবহৃত';

  @override
  String get quickActions => 'দ্রুত কাজ';

  @override
  String get addFood => 'খাবার যোগ করুন';

  @override
  String get createMeal => 'মিল তৈরি করুন';

  @override
  String get noFoodYet => 'এখনও কোনো খাবার নেই';

  @override
  String get noMatchingFood => 'মিলেছে এমন কোনো খাবার নেই';

  @override
  String get addFirstFoodOrMeal =>
      'আপনার লাইব্রেরি তৈরি শুরু করতে প্রথম খাবার বা মিল যোগ করুন।';

  @override
  String noFoodSearchMatches(String search) {
    return '“$search”-এর সঙ্গে কিছুই মেলেনি। সবকিছু আবার দেখতে অনুসন্ধান পরিষ্কার করুন।';
  }

  @override
  String get clearSearch => 'অনুসন্ধান পরিষ্কার করুন';

  @override
  String get addMeal => 'মিল যোগ করুন';

  @override
  String get noWeightsYet => 'এখনও কোনো ওজন নেই';

  @override
  String get noMatchingWeights => 'মিলেছে এমন কোনো ওজন নেই';

  @override
  String get logFirstWeight =>
      'আপনার প্রবণতা ট্র্যাক করা শুরু করতে প্রথম ওজন লগ করুন।';

  @override
  String noWeightSearchMatches(String search) {
    return '“$search”-এর সঙ্গে কিছুই মেলেনি। সব এন্ট্রি দেখতে অনুসন্ধান পরিষ্কার করুন।';
  }

  @override
  String get logWeight => 'ওজন লগ করুন';

  @override
  String get weightTrend => 'ওজনের প্রবণতা';

  @override
  String get weightTrendSubtitle => 'সাম্প্রতিক মাপ এবং সামগ্রিক দিক';

  @override
  String get bodyWeight => 'শরীরের ওজন';

  @override
  String get options => 'বিকল্প';

  @override
  String get day => 'দিন';

  @override
  String get today => 'আজ';

  @override
  String get week => 'সপ্তাহ';

  @override
  String get month => 'মাস';

  @override
  String get year => 'বছর';

  @override
  String get dateRange => 'তারিখের সীমা';

  @override
  String get startDate => 'শুরুর তারিখ';

  @override
  String get stopDate => 'শেষের তারিখ';

  @override
  String get dataPoints => 'ডেটা পয়েন্ট';

  @override
  String get customizeFields => 'ক্ষেত্র কাস্টমাইজ করুন';

  @override
  String get language => 'ভাষা';

  @override
  String get languageSubtitle => 'FitBook-এ ব্যবহৃত ভাষা বেছে নিন';

  @override
  String get languageSystem => 'সিস্টেম';

  @override
  String get languageEnglish => 'ইংরেজি';

  @override
  String get languageSpanish => 'স্প্যানিশ';

  @override
  String get languageFrench => 'ফরাসি';

  @override
  String get languageGerman => 'জার্মান';

  @override
  String get languageItalian => 'ইতালীয়';

  @override
  String get languagePortugueseBrazil => 'পর্তুগিজ (ব্রাজিল)';

  @override
  String get languageDutch => 'ডাচ';

  @override
  String get languagePolish => 'পোলিশ';

  @override
  String get languageJapanese => 'জাপানি';

  @override
  String get languageKorean => 'কোরিয়ান';

  @override
  String get languageChineseSimplified => 'চীনা (সরলীকৃত)';

  @override
  String get languageChineseTraditional => 'চীনা (প্রথাগত)';

  @override
  String get languageRussian => 'রাশিয়ান';

  @override
  String get languageHindi => 'হিন্দি';

  @override
  String get languageIndonesian => 'ইন্দোনেশীয়';

  @override
  String get languageVietnamese => 'ভিয়েতনামি';

  @override
  String get languageThai => 'থাই';

  @override
  String get languageBengali => 'বাংলা';

  @override
  String get appearanceSettings => 'চেহারা সেটিংস';

  @override
  String get delete => 'মুছুন';

  @override
  String get confirmDelete => 'মুছে ফেলা নিশ্চিত করুন';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'আপনি কি নিশ্চিত যে $countটি রেকর্ড মুছতে চান? এই কাজটি ফিরিয়ে নেওয়া যাবে না।',
      one:
          'আপনি কি নিশ্চিত যে ১টি রেকর্ড মুছতে চান? এই কাজটি ফিরিয়ে নেওয়া যাবে না।',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'বাতিল';

  @override
  String get search => 'খুঁজুন...';

  @override
  String get clear => 'পরিষ্কার করুন';

  @override
  String get showMenu => 'মেনু দেখান';

  @override
  String get selectAll => 'সব নির্বাচন করুন';

  @override
  String get edit => 'সম্পাদনা';

  @override
  String get favorite => 'পছন্দের';

  @override
  String get atLeastOneTab => 'অন্তত একটি ট্যাব প্রয়োজন';

  @override
  String get scrollableTabs => 'স্ক্রলযোগ্য ট্যাব';

  @override
  String get save => 'সংরক্ষণ করুন';

  @override
  String get themeSystem => 'সিস্টেম';

  @override
  String get themeDark => 'ডার্ক';

  @override
  String get themeLight => 'লাইট';

  @override
  String get pureBlackAmoled => 'সম্পূর্ণ কালো (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'AMOLED ডিসপ্লের জন্য সম্পূর্ণ কালো রং ব্যবহার করুন';

  @override
  String get systemColorScheme => 'সিস্টেমের রঙের স্কিম';

  @override
  String get systemColorSchemeTooltip =>
      'অ্যাপের জন্য আপনার ডিভাইসের প্রাথমিক রং ব্যবহার করুন';

  @override
  String get showImages => 'ছবি দেখান';

  @override
  String get showImagesTooltip =>
      'ডায়েরি ও খাবার পাতায় ছবি বেছে নিন এবং দেখান';

  @override
  String get curveLineGraphs => 'গ্রাফের রেখা বাঁকানো রাখুন';

  @override
  String get curveLineGraphsTooltip =>
      'গ্রাফ পাতায় মসৃণ বক্ররেখা ব্যবহার করুন';

  @override
  String get weightStatCards => 'ওজনের পরিসংখ্যান কার্ড';

  @override
  String get weightStatCardsTooltip =>
      'ডিফল্ট তালিকার বদলে ওজনের এন্ট্রিগুলো পরিসংখ্যান কার্ডের গ্রিড হিসেবে দেখান';

  @override
  String get graphsStartAtZero => 'গ্রাফ শূন্য থেকে শুরু হবে';

  @override
  String get graphsStartAtZeroTooltip =>
      'গ্রাফের y-অক্ষ সবসময় শূন্য থেকে শুরু করুন';

  @override
  String get navigationAnimation => 'নেভিগেশন অ্যানিমেশন';

  @override
  String get animationFade => 'ফেড';

  @override
  String get animationZoom => 'জুম';

  @override
  String get animationSlide => 'স্লাইড';

  @override
  String get animationRise => 'উপরে ওঠা';

  @override
  String get animationNone => 'কোনোটিই নয়';

  @override
  String longDateFormat(String example) {
    return 'দীর্ঘ তারিখের ফরম্যাট ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'সংক্ষিপ্ত তারিখের ফরম্যাট ($example)';
  }

  @override
  String get diarySettings => 'ডায়েরি সেটিংস';

  @override
  String get diaryUnit => 'ডায়েরির একক';

  @override
  String get diarySummary => 'ডায়েরির সারাংশ';

  @override
  String get diarySummaryDivision => 'ভাগ — বর্তমান / মোট';

  @override
  String get diarySummaryRemaining => 'অবশিষ্ট';

  @override
  String get diarySummaryBoth => 'উভয় — অবশিষ্ট (মোট)';

  @override
  String get diarySummaryNone => 'কোনোটিই নয়';

  @override
  String get dailyCaloriesKcal => 'দৈনিক ক্যালরি (kcal)';

  @override
  String get dailyProteinG => 'দৈনিক প্রোটিন (g)';

  @override
  String get dailyFatG => 'দৈনিক চর্বি (g)';

  @override
  String get dailyCarbsG => 'দৈনিক কার্বোহাইড্রেট (g)';

  @override
  String get dailyFiberG => 'দৈনিক ফাইবার (g)';

  @override
  String get automaticDailies => 'স্বয়ংক্রিয় দৈনিক লক্ষ্য';

  @override
  String get automaticDailiesTooltip =>
      'আপনার শরীরের ওজন থেকে প্রস্তাবিত দৈনিক ক্যালরি, প্রোটিন, চর্বি ও কার্বোহাইড্রেট স্বয়ংক্রিয়ভাবে হিসাব করুন';

  @override
  String get selectNameOnSubmit => 'সাবমিট করলে নাম নির্বাচন করুন';

  @override
  String get reminders => 'স্মরণীয় বিষয়সমূহ';

  @override
  String get foodSettings => 'খাবার সেটিংস';

  @override
  String get foodUnit => 'খাবারের একক';

  @override
  String get fields => 'ক্ষেত্রসমূহ';

  @override
  String get favoriteNewFoods => 'নতুন খাবার পছন্দের হিসেবে রাখুন';

  @override
  String get pickFields => 'ক্ষেত্র বেছে নিন';

  @override
  String get all => 'সব';

  @override
  String get onlySelected => 'শুধু নির্বাচিত';

  @override
  String get weightSettings => 'ওজন সেটিংস';

  @override
  String get targetWeight => 'লক্ষ্য ওজন';

  @override
  String get positiveReinforcement => 'ইতিবাচক উৎসাহ';

  @override
  String get positiveReinforcementPreview =>
      'উৎসাহব্যঞ্জক বার্তা এভাবে দেখানো হবে!';

  @override
  String get dataSettings => 'ডেটা সেটিংস';

  @override
  String get automaticBackup => 'স্বয়ংক্রিয় ব্যাকআপ';

  @override
  String get shareDatabase => 'ডেটাবেস শেয়ার করুন';

  @override
  String get openNotification => 'নোটিফিকেশন খুলুন';

  @override
  String get automaticBackupsEnabled => 'স্বয়ংক্রিয় ব্যাকআপ চালু';

  @override
  String get automaticBackupBody =>
      'FitBook প্রতিদিন নির্বাচিত ফোল্ডারে আপনার ডেটা ও ছবি স্বয়ংক্রিয়ভাবে ব্যাকআপ করবে।';

  @override
  String get backupSettings => 'ব্যাকআপ সেটিংস';

  @override
  String get backupSettingsChannelDescription =>
      'স্বয়ংক্রিয় ব্যাকআপ সম্পর্কিত নোটিফিকেশন';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'ব্যবহারকারীর নাম';

  @override
  String get password => 'পাসওয়ার্ড';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get loggedIn => 'লগ ইন করা হয়েছে';

  @override
  String get about => 'সম্পর্কে';

  @override
  String get version => 'সংস্করণ';

  @override
  String get whatsNew => 'নতুন কী?';

  @override
  String get author => 'লেখক';

  @override
  String get license => 'লাইসেন্স';

  @override
  String get donate => 'অনুদান';

  @override
  String get supportProject => 'এই প্রকল্পকে সহায়তা করুন';

  @override
  String get leaveReview => 'রিভিউ দিন';

  @override
  String get rateOnPlayStore => 'Play Store-এ FitBook-কে রেট দিন';

  @override
  String get sourceCode => 'সোর্স কোড';

  @override
  String get foods => 'খাবারসমূহ';

  @override
  String get backup => 'ব্যাকআপ';

  @override
  String get exportData => 'ডেটা রপ্তানি করুন';

  @override
  String get importData => 'ডেটা আমদানি করুন';

  @override
  String get failedImportData => 'ডেটা ইমপোর্ট করা যায়নি';

  @override
  String get copyError => 'ত্রুটি কপি করুন';

  @override
  String get deleteRecords => 'রেকর্ড মুছুন';

  @override
  String get unusedFood => 'অব্যবহৃত খাবার';

  @override
  String get database => 'ডেটাবেস';

  @override
  String get deleteAllWeightsConfirm =>
      'আপনি কি নিশ্চিত যে সব ওজন মুছতে চান? এই কাজটি ফিরিয়ে নেওয়া যাবে না।';

  @override
  String get deleteDatabaseConfirm =>
      'আপনি কি নিশ্চিত যে আপনার ডেটাবেস মুছতে চান? এই কাজটি ফিরিয়ে নেওয়া যাবে না এবং আপনার সব ডেটা নষ্ট হবে।';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'আপনি কি নিশ্চিত যে সব খাবার ও ডায়েরি এন্ট্রি মুছতে চান? এই কাজটি ফিরিয়ে নেওয়া যাবে না।';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'আপনি কি নিশ্চিত যে $countটি অব্যবহৃত খাবার মুছতে চান? এই কাজটি ফিরিয়ে নেওয়া যাবে না।',
      one:
          'আপনি কি নিশ্চিত যে ১টি অব্যবহৃত খাবার মুছতে চান? এই কাজটি ফিরিয়ে নেওয়া যাবে না।',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'আপনি কি নিশ্চিত যে সব ডায়েরি এন্ট্রি মুছতে চান? এই কাজটি ফিরিয়ে নেওয়া যাবে না।';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get replaceImage => 'ছবি প্রতিস্থাপন করুন';

  @override
  String get takePhoto => 'ছবি তুলুন';

  @override
  String get deleteImage => 'ছবি মুছুন';

  @override
  String get filters => 'ফিল্টারসমূহ';

  @override
  String get foodGroup => 'খাবারের গ্রুপ';

  @override
  String get exampleFruit => 'ফল';

  @override
  String clearFiltersCount(int count) {
    return 'পরিষ্কার করুন ($count)';
  }

  @override
  String get done => 'সম্পন্ন';

  @override
  String get showFilters => 'ফিল্টার দেখান';

  @override
  String get repeatEntry => 'এন্ট্রি পুনরাবৃত্তি করুন';

  @override
  String get timeOfDay => 'দিনের সময়';

  @override
  String get everyDay => 'প্রতিদিন';

  @override
  String get repeatEveryDayForYear =>
      'পরবর্তী এক বছর প্রতিদিন এই এন্ট্রি তৈরি করুন';

  @override
  String get repeatOn => 'যে দিনে পুনরাবৃত্তি হবে';

  @override
  String get weekdayMon => 'সোম';

  @override
  String get weekdayTue => 'মঙ্গল';

  @override
  String get weekdayWed => 'বুধ';

  @override
  String get weekdayThu => 'বৃহস্পতি';

  @override
  String get weekdayFri => 'শুক্র';

  @override
  String get weekdaySat => 'শনি';

  @override
  String get weekdaySun => 'রবি';

  @override
  String get schedule => 'সময়সূচি';

  @override
  String get enterValidNutritionValues => 'সঠিক পুষ্টিমান লিখুন';

  @override
  String get quickAddTitle => 'দ্রুত যোগ';

  @override
  String get kilojoules => 'কিলোজুল';

  @override
  String get createdDate => 'তৈরির তারিখ';

  @override
  String get failedMigrations => 'ব্যর্থ মাইগ্রেশন';

  @override
  String get failedMigrationsDescription =>
      'আপনার ডেটাবেস তৈরি বা আপগ্রেড করার সময় কিছু সমস্যা হয়েছে। সাধারণত রেকর্ডগুলো মুছে আবার তৈরি করলে এটি ঠিক করা যায়।';

  @override
  String get errorMessage => 'ত্রুটির বার্তা:';

  @override
  String get createIssue => 'ইস্যু তৈরি করুন';

  @override
  String get cameraPermissionRequired =>
      'স্ক্যান করতে ক্যামেরার অনুমতি প্রয়োজন।';

  @override
  String get scanFoodBarcode => 'খাবারের বারকোড স্ক্যান করুন';

  @override
  String get holdBarcodeInFrame => 'বারকোডটি ফ্রেমের ভেতরে ধরে রাখুন';

  @override
  String get pinchToZoom => 'জুম করতে পিঞ্চ করুন';

  @override
  String get cameraStartFailed => 'ক্যামেরা চালু করা যায়নি';

  @override
  String get editDiaryEntry => 'ডায়েরি এন্ট্রি সম্পাদনা করুন';

  @override
  String get addFoodToDiary => 'ডায়েরিতে খাবার যোগ করুন';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'আপনি কি নিশ্চিত যে $name মুছতে চান?';
  }

  @override
  String get imageError => 'ছবির ত্রুটি';

  @override
  String get setImage => 'ছবি সেট করুন';

  @override
  String get name => 'নাম';

  @override
  String get searchFoodsAndMeals => 'খাবার ও মিল খুঁজুন...';

  @override
  String get clearSelection => 'নির্বাচন পরিষ্কার করুন';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'বারকোড পাওয়া যায়নি। যোগ করতে সংরক্ষণ করুন।';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'OpenFoodFacts-এ “$name” খুঁজুন';
  }

  @override
  String get meal => 'মিল';

  @override
  String get quantity => 'পরিমাণ';

  @override
  String get unit => 'একক';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'পরিবেশন ($amount $unit)';
  }

  @override
  String get barcode => 'বারকোড';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (প্রতি $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
    String nutrient,
    String quantity,
    String unit,
  ) {
    return 'প্রতি $quantity $unit-এ $nutrient';
  }

  @override
  String get fiber => 'ফাইবার';

  @override
  String get unitServing => 'পরিবেশন';

  @override
  String get unitGrams => 'গ্রাম';

  @override
  String get unitMilliliters => 'মিলিলিটার';

  @override
  String get unitKilojoules => 'কিলোজুল';

  @override
  String get unitCups => 'কাপ';

  @override
  String get unitTablespoons => 'টেবিলচামচ';

  @override
  String get unitMilligrams => 'মিলিগ্রাম';

  @override
  String get unitTeaspoons => 'চা-চামচ';

  @override
  String get unitOunces => 'আউন্স';

  @override
  String get unitPounds => 'পাউন্ড';

  @override
  String get unitKilograms => 'কিলোগ্রাম';

  @override
  String get unitLiters => 'লিটার';

  @override
  String get nameConflict => 'নামের দ্বন্দ্ব';

  @override
  String get replaceExistingFood =>
      'এই নামে একটি খাবার ইতিমধ্যেই আছে। পুরোনোটিকে প্রতিস্থাপন করতে চান?';

  @override
  String get no => 'না';

  @override
  String get yes => 'হ্যাঁ';

  @override
  String get editFood => 'খাবার সম্পাদনা করুন';

  @override
  String confirmDeleteFood(String name) {
    return 'আপনি কি নিশ্চিত যে $name মুছতে চান?';
  }

  @override
  String get caloriesKcal => 'ক্যালরি (kcal)';

  @override
  String get kilojoulesKj => 'কিলোজুল (kJ)';

  @override
  String get servingSize => 'পরিবেশনের আকার';

  @override
  String get servingUnit => 'পরিবেশনের একক';

  @override
  String get saveAsNewCopy => 'নতুন কপি হিসেবে সংরক্ষণ করুন';

  @override
  String get filterFoods => 'খাবার ফিল্টার করুন';

  @override
  String get narrowFoodsFilters =>
      'যেকোনো ফিল্টারের সমন্বয় ব্যবহার করে তালিকাটি ছোট করুন।';

  @override
  String get foodDetails => 'খাবারের বিবরণ';

  @override
  String get exampleFruitHint => 'যেমন: ফল';

  @override
  String get servingSizeRangeHint =>
      'সর্বনিম্ন, সর্বোচ্চ বা উভয় মান সেট করুন।';

  @override
  String get minimum => 'সর্বনিম্ন';

  @override
  String get maximum => 'সর্বোচ্চ';

  @override
  String get noMinimum => 'সর্বনিম্ন সীমা নেই';

  @override
  String get noMaximum => 'সর্বোচ্চ সীমা নেই';

  @override
  String get clearAll => 'সব পরিষ্কার করুন';

  @override
  String get searchOpenFoodFacts => 'Open Food Facts-এ খুঁজুন';

  @override
  String get noMatchingProducts => 'মিলেছে এমন কোনো পণ্য নেই';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'অন্য নাম চেষ্টা করুন বা একটি বারকোড স্ক্যান করুন।';

  @override
  String get enterFoodNameToSearch =>
      'উপরে খাবারের নাম লিখে অনুসন্ধান করতে সাবমিট করুন।';

  @override
  String get submitToSearch => 'অনুসন্ধান করতে সাবমিট করুন...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g প্রোটিন';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি খাবার সম্পাদনা করুন',
      one: '১টি খাবার সম্পাদনা করুন',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'মিল সম্পাদনা করুন';

  @override
  String get addImage => 'ছবি যোগ করুন';

  @override
  String get noFoodsInMeal => 'এই মিলে এখনও কোনো খাবার নেই';

  @override
  String get addFoodToMealHint => 'এই মিল তৈরি শুরু করতে একটি খাবার যোগ করুন।';

  @override
  String get remove => 'সরান';

  @override
  String get searchFoods => 'খাবার খুঁজুন...';

  @override
  String get noFoodsFound => 'কোনো খাবার পাওয়া যায়নি';

  @override
  String nothingMatchesSearch(String search) {
    return '“$search”-এর সঙ্গে কিছুই মেলেনি।';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'মিলে যোগ করার আগে আপনার লাইব্রেরিতে কিছু খাবার যোগ করুন।';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'এখনো কোনো ডেটা নেই';

  @override
  String get completePlansToViewGraphs =>
      'এখানে গ্রাফ দেখতে কিছু প্ল্যান সম্পূর্ণ করুন।';

  @override
  String get value => 'মান';

  @override
  String get goal => 'লক্ষ্য';

  @override
  String get notSet => 'সেট করা নেই';

  @override
  String get trend => 'প্রবণতা';

  @override
  String get smooth => 'মসৃণ';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-পয়েন্ট গড়',
      one: '১-পয়েন্ট গড়',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'ওজন সম্পাদনা করুন';

  @override
  String get addWeight => 'ওজন যোগ করুন';

  @override
  String shareWeight(String value, String unit) {
    return 'আমি এখনই $value $unit ওজন মেপেছি!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'ওজন ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'ওজন লিখুন';

  @override
  String get pleaseEnterValidWeight => 'সঠিক ওজন লিখুন';

  @override
  String get lastWeight => 'সর্বশেষ ওজন';

  @override
  String unitWithValue(String unit) {
    return 'একক ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'একক $unit রাখুন';
  }

  @override
  String convertToUnit(String unit) {
    return '$unit-এ রূপান্তর করুন';
  }

  @override
  String get removeImage => 'ছবি সরান';

  @override
  String get mealRemindersEnabled => 'মিল স্মরণ করিয়ে দেওয়া চালু আছে';

  @override
  String get mealRemindersEnabledBody =>
      'আপনি যদি এখনও লগ না করে থাকেন, আমরা নাশতা, দুপুরের খাবার বা রাতের খাবার লগ করতে মনে করিয়ে দেব।';

  @override
  String get reminderSettingsChannel => 'রিমাইন্ডার সেটিংস';

  @override
  String get reminderSettingsChannelDescription =>
      'FitBook রিমাইন্ডার সম্পর্কে ব্যাখ্যামূলক নোটিফিকেশন';

  @override
  String get breakfastReminderTitle => 'নাশতা লগ করতে ভুলবেন না';

  @override
  String get breakfastRemindersChannel => 'নাশতার রিমাইন্ডার';

  @override
  String get breakfastRemindersChannelDescription => 'নাশতা লগ করার রিমাইন্ডার';

  @override
  String get lunchReminderTitle => 'দুপুরের খাবার লগ করতে ভুলবেন না';

  @override
  String get lunchRemindersChannel => 'দুপুরের খাবারের রিমাইন্ডার';

  @override
  String get lunchRemindersChannelDescription =>
      'দুপুরের খাবার লগ করার রিমাইন্ডার';

  @override
  String get dinnerReminderTitle => 'রাতের খাবার লগ করতে ভুলবেন না';

  @override
  String get dinnerRemindersChannel => 'রাতের খাবারের রিমাইন্ডার';

  @override
  String get dinnerRemindersChannelDescription =>
      'রাতের খাবার লগ করার রিমাইন্ডার';

  @override
  String get reinforcementGreatJob => 'দারুণ কাজ! আপনার পরিশ্রমের ফল মিলছে।';

  @override
  String get reinforcementKeepItUp =>
      'এভাবেই চালিয়ে যান! আপনি চমৎকার অগ্রগতি করছেন।';

  @override
  String get reinforcementFantastic => 'চমৎকার! আপনার নিষ্ঠার ফল দেখা যাচ্ছে।';

  @override
  String get reinforcementWellDone =>
      'খুব ভালো! আপনি আপনার লক্ষ্যের আরও এক ধাপ কাছে।';

  @override
  String get reinforcementImpressive => 'দারুণ! আপনার প্রচেষ্টা ফল দিচ্ছে।';

  @override
  String get reinforcementAmazing => 'অসাধারণ! আপনি সঠিক পথে আছেন।';

  @override
  String get reinforcementBravo => 'বাহ! আপনার অঙ্গীকার প্রশংসনীয়।';

  @override
  String get reinforcementExcellent =>
      'দারুণ! আপনার অধ্যবসায় অনুপ্রেরণাদায়ক।';

  @override
  String get reinforcementSuperb => 'অসাধারণ! আপনি চমৎকার কাজ করছেন।';

  @override
  String get reinforcementIncredible => 'অবিশ্বাস্য! আপনার অগ্রগতি স্পষ্ট।';

  @override
  String get reinforcementWayToGoKing => 'এভাবেই এগিয়ে চলো, কিং';

  @override
  String get reinforcementYeahBuddy => 'হ্যাঁ বন্ধু!';

  @override
  String get reinforcementThatsHowItsDone => 'এভাবেই করতে হয়।';

  @override
  String get reinforcementEasyAsPie => 'একদম সহজ।';

  @override
  String get reinforcementDoingGreat => 'আপনি দারুণ করছেন।';

  @override
  String get reinforcementProgressNice => 'এটা কি অগ্রগতি দেখছি? দারুণ।';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return '$remaining $unit অবশিষ্ট';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return '$remaining $unit অবশিষ্ট ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'চিনি';

  @override
  String get nutrientCholesterol => 'কোলেস্টেরল';

  @override
  String get nutrientSaturatedFat => 'স্যাচুরেটেড ফ্যাট';

  @override
  String get nutrientCalcium => 'ক্যালসিয়াম';

  @override
  String get nutrientIron => 'আয়রন';

  @override
  String get nutrientPotassium => 'পটাশিয়াম';

  @override
  String get nutrientMagnesium => 'ম্যাগনেসিয়াম';

  @override
  String get nutrientVitaminA => 'ভিটামিন A';

  @override
  String get nutrientVitaminC => 'ভিটামিন C';

  @override
  String get nutrientVitaminB12 => 'ভিটামিন B12';

  @override
  String get nutrientVitaminD => 'ভিটামিন D';

  @override
  String get nutrientVitaminE => 'ভিটামিন E';

  @override
  String get nutrientAddedSugar => 'যোগ করা চিনি';

  @override
  String get nutrientNetCarbs => 'নেট কার্বোহাইড্রেট';

  @override
  String get nutrientWater => 'পানি';

  @override
  String get nutrientOmega3 => 'ওমেগা-৩ ফ্যাটি অ্যাসিড';

  @override
  String get nutrientOmega6 => 'ওমেগা-৬ ফ্যাটি অ্যাসিড';

  @override
  String get nutrientPralScore => 'PRAL স্কোর';

  @override
  String get nutrientTransFat => 'ট্রান্স ফ্যাট';

  @override
  String get nutrientSolubleFiber => 'দ্রবণীয় ফাইবার';

  @override
  String get nutrientInsolubleFiber => 'অদ্রবণীয় ফাইবার';

  @override
  String get nutrientPhosphorus => 'ফসফরাস';

  @override
  String get nutrientSodium => 'সোডিয়াম';

  @override
  String get nutrientZinc => 'জিঙ্ক';

  @override
  String get nutrientCopper => 'কপার';

  @override
  String get nutrientManganese => 'ম্যাঙ্গানিজ';

  @override
  String get nutrientSelenium => 'সেলেনিয়াম';

  @override
  String get nutrientFluoride => 'ফ্লুরাইড';

  @override
  String get nutrientMolybdenum => 'মলিবডেনাম';

  @override
  String get nutrientChloride => 'ক্লোরাইড';

  @override
  String get nutrientSucrose => 'সুক্রোজ';

  @override
  String get nutrientGlucose => 'গ্লুকোজ';

  @override
  String get nutrientFructose => 'ফ্রুক্টোজ';

  @override
  String get nutrientLactose => 'ল্যাকটোজ';

  @override
  String get nutrientMaltose => 'মল্টোজ';

  @override
  String get nutrientGalactose => 'গ্যালাক্টোজ';

  @override
  String get nutrientStarch => 'স্টার্চ';

  @override
  String get nutrientSugarAlcohols => 'সুগার অ্যালকোহল';

  @override
  String get nutrientThiaminB1 => 'থায়ামিন (B1)';

  @override
  String get nutrientRiboflavinB2 => 'রাইবোফ্লাভিন (B2)';

  @override
  String get nutrientNiacinB3 => 'নায়াসিন (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'প্যান্টোথেনিক অ্যাসিড (B5)';

  @override
  String get nutrientVitaminB6 => 'ভিটামিন B6';

  @override
  String get nutrientBiotinB7 => 'বায়োটিন (B7)';

  @override
  String get nutrientFolateB9 => 'ফোলেট (B9)';

  @override
  String get nutrientFolicAcid => 'ফলিক অ্যাসিড';

  @override
  String get nutrientFoodFolate => 'খাদ্যজাত ফোলেট';

  @override
  String get nutrientFolateDfe => 'ডায়েটারি ফোলেট সমতুল্য (DFE)';

  @override
  String get nutrientCholine => 'কোলিন';

  @override
  String get nutrientBetaine => 'বিটেইন';

  @override
  String get nutrientRetinol => 'রেটিনল';

  @override
  String get nutrientBetaCarotene => 'বিটা-ক্যারোটিন';

  @override
  String get nutrientAlphaCarotene => 'আলফা-ক্যারোটিন';

  @override
  String get nutrientLycopene => 'লাইকোপিন';

  @override
  String get nutrientLuteinZeaxanthin => 'লুটেইন + জিয়াজ্যান্থিন';

  @override
  String get nutrientVitaminD2 => 'ভিটামিন D2 (এরগোক্যালসিফেরল)';

  @override
  String get nutrientVitaminD3 => 'ভিটামিন D3 (কোলেক্যালসিফেরল)';

  @override
  String get nutrientVitaminK => 'ভিটামিন K';

  @override
  String get nutrientDihydrophylloquinone => 'ডাইহাইড্রোফাইলোকুইনোন';

  @override
  String get nutrientMenaquinone4 => 'মেনাকুইনোন-৪';

  @override
  String get nutrientMonounsaturatedFat => 'মনোআনস্যাচুরেটেড ফ্যাট';

  @override
  String get nutrientPolyunsaturatedFat => 'পলিআনস্যাচুরেটেড ফ্যাট';

  @override
  String get nutrientAla => 'আলফা-লিনোলেনিক অ্যাসিড (ALA)';

  @override
  String get nutrientEpa => 'আইকোসাপেন্টাইনোইক অ্যাসিড (EPA)';

  @override
  String get nutrientDpa => 'ডোকোসাপেন্টাইনোইক অ্যাসিড (DPA)';

  @override
  String get nutrientDha => 'ডোকোসাহেক্সাইনোইক অ্যাসিড (DHA)';

  @override
  String get nutrientAlanine => 'অ্যালানিন';

  @override
  String get nutrientAlcohol => 'মদ';

  @override
  String get nutrientArginine => 'আর্জিনিন';

  @override
  String get nutrientAsparticAcid => 'অ্যাসপার্টিক অ্যাসিড';

  @override
  String get nutrientCystine => 'সিস্টিন';

  @override
  String get nutrientGlutamicAcid => 'গ্লুটামিক অ্যাসিড';

  @override
  String get nutrientGlycine => 'গ্লাইসিন';

  @override
  String get nutrientHistidine => 'হিস্টিডিন';

  @override
  String get nutrientHydroxyproline => 'হাইড্রক্সিপ্রোলিন';

  @override
  String get nutrientIsoleucine => 'আইসোলিউসিন';

  @override
  String get nutrientLeucine => 'লিউসিন';

  @override
  String get nutrientLysine => 'লাইসিন';

  @override
  String get nutrientMethionine => 'মেথিওনিন';

  @override
  String get nutrientPhenylalanine => 'ফেনাইলঅ্যালানিন';

  @override
  String get nutrientProline => 'প্রোলিন';

  @override
  String get nutrientSerine => 'সেরিন';

  @override
  String get nutrientThreonine => 'থ্রিওনিন';

  @override
  String get nutrientTryptophan => 'ট্রিপটোফ্যান';

  @override
  String get nutrientTyrosine => 'টাইরোসিন';

  @override
  String get nutrientValine => 'ভ্যালিন';

  @override
  String get nutrientCaffeine => 'ক্যাফেইন';

  @override
  String get nutrientTheobromine => 'থিওব্রোমিন';

  @override
  String servingWeightNumber(int number) {
    return 'পরিবেশনের ওজন $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'পরিবেশনের বিবরণ $number';
  }

  @override
  String get calorieEquivalentWeight200 => '২০০ kcal-এর সমতুল্য ওজন';
}
