// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'ڈائری';

  @override
  String get navGraph => 'گراف';

  @override
  String get navFood => 'خوراک';

  @override
  String get navWeight => 'وزن';

  @override
  String get navError => 'خرابی';

  @override
  String get loadDataFailed => 'یہ ڈیٹا لوڈ نہیں ہو سکا۔';

  @override
  String get settings => 'ترتیبات';

  @override
  String get invalidTabSettings => 'ٹیب کی ترتیبات درست نہیں ہیں۔';

  @override
  String newVersion(String version) {
    return 'نیا ورژن $version';
  }

  @override
  String get changes => 'تبدیلیاں';

  @override
  String get searchSettings => 'ترتیبات تلاش کریں...';

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get appearanceSubtitle => 'تھیم، رنگ اور گراف کا ڈسپلے';

  @override
  String get diary => 'ڈائری';

  @override
  String get diarySubtitle => 'روزانہ کے اہداف، خلاصے اور اندراج';

  @override
  String get food => 'خوراک';

  @override
  String get foodSubtitle => 'خوراک کی اکائیاں، فیلڈز اور ڈیفالٹس';

  @override
  String get weight => 'وزن';

  @override
  String get weightSubtitle => 'وزن کی اکائیاں، اہداف اور ڈسپلے';

  @override
  String get tabs => 'ٹیبز';

  @override
  String get tabsSubtitle => 'نیویگیشن ٹیبز اور ان کی ترتیب';

  @override
  String get data => 'ڈیٹا';

  @override
  String get dataSubtitle => 'درآمد، برآمد اور مقامی ڈیٹا';

  @override
  String get todayProgress => 'آج کی پیش رفت';

  @override
  String get latestDay => 'تازہ ترین دن';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count اندراج کیے گئے',
      one: '1 اندراج کیا گیا',
      zero: 'کوئی اندراج نہیں کیا گیا',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count اندراجات میں ترمیم کریں',
      one: '1 اندراج میں ترمیم کریں',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'کیلوریز';

  @override
  String get protein => 'پروٹین';

  @override
  String get carbs => 'کاربوہائیڈریٹس';

  @override
  String get fat => 'چربی';

  @override
  String get addDiaryEntry => 'ڈائری میں اندراج شامل کریں';

  @override
  String get noEntriesToday => 'آج کوئی اندراج نہیں ہے۔';

  @override
  String addSearchToDiary(String search) {
    return '\"$search\" کو اپنی ڈائری میں شامل کریں';
  }

  @override
  String get tapStartLoggingFood => 'خوراک درج کرنا شروع کرنے کے لیے ٹیپ کریں۔';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'ڈائری میں کوئی مماثل اندراج نہیں۔ یہ خوراک بنانے اور درج کرنے کے لیے ٹیپ کریں۔';

  @override
  String get add => 'شامل کریں';

  @override
  String get quickAdd => 'فوری اضافہ';

  @override
  String get scanBarcode => 'بارکوڈ اسکین کریں';

  @override
  String get foodLibrary => 'خوراک کی لائبریری';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount خوراکیں',
      one: '1 خوراک',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount کھانے',
      one: '1 کھانا',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'حال ہی میں استعمال شدہ';

  @override
  String get quickActions => 'فوری اقدامات';

  @override
  String get addFood => 'خوراک شامل کریں';

  @override
  String get createMeal => 'کھانا بنائیں';

  @override
  String get noFoodYet => 'ابھی کوئی خوراک نہیں';

  @override
  String get noMatchingFood => 'کوئی مماثل خوراک نہیں';

  @override
  String get addFirstFoodOrMeal =>
      'اپنی لائبریری بنانا شروع کرنے کے لیے پہلی خوراک یا کھانا شامل کریں۔';

  @override
  String noFoodSearchMatches(String search) {
    return '“$search” سے کچھ مماثل نہیں۔ سب کچھ دوبارہ دیکھنے کے لیے تلاش صاف کریں۔';
  }

  @override
  String get clearSearch => 'تلاش صاف کریں';

  @override
  String get addMeal => 'کھانا شامل کریں';

  @override
  String get noWeightsYet => 'ابھی کوئی وزن درج نہیں';

  @override
  String get noMatchingWeights => 'کوئی مماثل وزن نہیں';

  @override
  String get logFirstWeight =>
      'اپنا پہلا وزن درج کریں تاکہ رجحان کو ٹریک کرنا شروع ہو۔';

  @override
  String noWeightSearchMatches(String search) {
    return '“$search” سے کچھ مماثل نہیں۔ تمام اندراجات دیکھنے کے لیے تلاش صاف کریں۔';
  }

  @override
  String get logWeight => 'وزن درج کریں';

  @override
  String get weightTrend => 'وزن کا رجحان';

  @override
  String get weightTrendSubtitle => 'حالیہ پیمائشیں اور مجموعی سمت';

  @override
  String get bodyWeight => 'جسمانی وزن';

  @override
  String get options => 'اختیارات';

  @override
  String get day => 'دن';

  @override
  String get today => 'آج';

  @override
  String get week => 'ہفتہ';

  @override
  String get month => 'مہینہ';

  @override
  String get year => 'سال';

  @override
  String get dateRange => 'تاریخ کی حد';

  @override
  String get startDate => 'شروع کی تاریخ';

  @override
  String get stopDate => 'اختتامی تاریخ';

  @override
  String get dataPoints => 'ڈیٹا پوائنٹس';

  @override
  String get customizeFields => 'فیلڈز حسبِ ضرورت بنائیں';

  @override
  String get language => 'زبان';

  @override
  String get languageSubtitle =>
      'FitBook میں استعمال ہونے والی زبان منتخب کریں';

  @override
  String get languageSystem => 'سسٹم';

  @override
  String get languageEnglish => 'انگریزی';

  @override
  String get languageSpanish => 'ہسپانوی';

  @override
  String get languageFrench => 'فرانسیسی';

  @override
  String get languageGerman => 'جرمن';

  @override
  String get languageItalian => 'اطالوی';

  @override
  String get languagePortugueseBrazil => 'پرتگالی (برازیل)';

  @override
  String get languagePortuguesePortugal => 'پرتگالی (پرتگال)';

  @override
  String get languageDutch => 'ڈچ';

  @override
  String get languagePolish => 'پولش';

  @override
  String get languageJapanese => 'جاپانی';

  @override
  String get languageKorean => 'کوریائی';

  @override
  String get languageChineseSimplified => 'چینی (سادہ)';

  @override
  String get languageChineseTraditional => 'چینی (روایتی)';

  @override
  String get languageRussian => 'روسی';

  @override
  String get languageHindi => 'ہندی';

  @override
  String get languageIndonesian => 'انڈونیشیائی';

  @override
  String get languageVietnamese => 'ویتنامی';

  @override
  String get languageThai => 'تھائی';

  @override
  String get languageBengali => 'بنگالی';

  @override
  String get languageUrdu => 'اردو';

  @override
  String get languagePersian => 'فارسی';

  @override
  String get languageMalay => 'مالائی';

  @override
  String get languageUkrainian => 'یوکرینی';

  @override
  String get appearanceSettings => 'ظاہری شکل کی ترتیبات';

  @override
  String get delete => 'حذف کریں';

  @override
  String get confirmDelete => 'حذف کرنے کی تصدیق';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'کیا آپ واقعی $count ریکارڈ حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا۔',
      one:
          'کیا آپ واقعی 1 ریکارڈ حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا۔',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get search => 'تلاش کریں...';

  @override
  String get clear => 'صاف کریں';

  @override
  String get showMenu => 'مینو دکھائیں';

  @override
  String get selectAll => 'سب منتخب کریں';

  @override
  String get edit => 'ترمیم';

  @override
  String get favorite => 'پسندیدہ';

  @override
  String get atLeastOneTab => 'کم از کم ایک ٹیب ضروری ہے';

  @override
  String get scrollableTabs => 'اسکرول ہونے والے ٹیبز';

  @override
  String get save => 'محفوظ کریں';

  @override
  String get themeSystem => 'سسٹم';

  @override
  String get themeDark => 'گہرا';

  @override
  String get themeLight => 'روشن';

  @override
  String get pureBlackAmoled => 'مکمل سیاہ (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'AMOLED ڈسپلے کے لیے مکمل سیاہ رنگ استعمال کریں';

  @override
  String get systemColorScheme => 'سسٹم کی رنگ اسکیم';

  @override
  String get systemColorSchemeTooltip =>
      'ایپ کے لیے اپنے آلے کا بنیادی رنگ استعمال کریں';

  @override
  String get showImages => 'تصاویر دکھائیں';

  @override
  String get showImagesTooltip =>
      'ڈائری اور خوراک کے صفحات پر تصاویر منتخب اور دکھائیں';

  @override
  String get curveLineGraphs => 'گراف کی لائنیں خم دار کریں';

  @override
  String get curveLineGraphsTooltip => 'گراف کے صفحے پر ہموار خم استعمال کریں';

  @override
  String get weightStatCards => 'وزن کے اسٹیٹ کارڈز';

  @override
  String get weightStatCardsTooltip =>
      'وزن کے اندراجات کو ڈیفالٹ فہرست کے بجائے اسٹیٹ کارڈز کی گرڈ میں دکھائیں';

  @override
  String get graphsStartAtZero => 'گراف صفر سے شروع ہوں';

  @override
  String get graphsStartAtZeroTooltip =>
      'گراف کے y-axis کو ہمیشہ صفر سے شروع کریں';

  @override
  String get navigationAnimation => 'نیویگیشن اینیمیشن';

  @override
  String get animationFade => 'مدھم ہونا';

  @override
  String get animationZoom => 'زوم';

  @override
  String get animationSlide => 'سلائیڈ';

  @override
  String get animationRise => 'اوپر آنا';

  @override
  String get animationNone => 'کوئی نہیں';

  @override
  String longDateFormat(String example) {
    return 'طویل تاریخ کا فارمیٹ ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'مختصر تاریخ کا فارمیٹ ($example)';
  }

  @override
  String get diarySettings => 'ڈائری کی ترتیبات';

  @override
  String get diaryUnit => 'ڈائری کی اکائی';

  @override
  String get diarySummary => 'ڈائری کا خلاصہ';

  @override
  String get diarySummaryDivision => 'تقسیم - موجودہ / کل';

  @override
  String get diarySummaryRemaining => 'باقی';

  @override
  String get diarySummaryBoth => 'دونوں - باقی (کل)';

  @override
  String get diarySummaryNone => 'کوئی نہیں';

  @override
  String get dailyCaloriesKcal => 'روزانہ کیلوریز (kcal)';

  @override
  String get dailyProteinG => 'روزانہ پروٹین (g)';

  @override
  String get dailyFatG => 'روزانہ چربی (g)';

  @override
  String get dailyCarbsG => 'روزانہ کاربوہائیڈریٹس (g)';

  @override
  String get dailyFiberG => 'روزانہ فائبر (g)';

  @override
  String get automaticDailies => 'خودکار روزانہ اہداف';

  @override
  String get automaticDailiesTooltip =>
      'اپنے جسمانی وزن سے تجویز کردہ روزانہ کیلوریز، پروٹین، چربی اور کاربوہائیڈریٹس خودکار طور پر حساب کریں';

  @override
  String get selectNameOnSubmit => 'جمع کراتے وقت نام منتخب کریں';

  @override
  String get reminders => 'یاد دہانیاں';

  @override
  String get foodSettings => 'خوراک کی ترتیبات';

  @override
  String get foodUnit => 'خوراک کی اکائی';

  @override
  String get fields => 'فیلڈز';

  @override
  String get favoriteNewFoods => 'نئی خوراکوں کو پسندیدہ بنائیں';

  @override
  String get pickFields => 'فیلڈز منتخب کریں';

  @override
  String get all => 'سب';

  @override
  String get onlySelected => 'صرف منتخب شدہ';

  @override
  String get weightSettings => 'وزن کی ترتیبات';

  @override
  String get targetWeight => 'ہدف وزن';

  @override
  String get positiveReinforcement => 'مثبت حوصلہ افزائی';

  @override
  String get positiveReinforcementPreview =>
      'حوصلہ افزا پیغامات اس طرح دکھائے جائیں گے!';

  @override
  String get dataSettings => 'ڈیٹا کی ترتیبات';

  @override
  String get automaticBackup => 'خودکار بیک اپ';

  @override
  String get shareDatabase => 'ڈیٹابیس شیئر کریں';

  @override
  String get openNotification => 'نوٹیفکیشن کھولیں';

  @override
  String get automaticBackupsEnabled => 'خودکار بیک اپ فعال ہیں';

  @override
  String get automaticBackupBody =>
      'FitBook ہر روز آپ کے ڈیٹا اور تصاویر کا منتخب فولڈر میں خودکار بیک اپ بنائے گا۔';

  @override
  String get backupSettings => 'بیک اپ کی ترتیبات';

  @override
  String get backupSettingsChannelDescription =>
      'خودکار بیک اپ کے بارے میں نوٹیفکیشن';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'صارف نام';

  @override
  String get password => 'پاس ورڈ';

  @override
  String get close => 'بند کریں';

  @override
  String get loggedIn => 'لاگ اِن ہے';

  @override
  String get about => 'بارے میں';

  @override
  String get version => 'ورژن';

  @override
  String get whatsNew => 'نیا کیا ہے؟';

  @override
  String get author => 'مصنف';

  @override
  String get license => 'لائسنس';

  @override
  String get donate => 'عطیہ دیں';

  @override
  String get supportProject => 'اس منصوبے کی حمایت میں مدد کریں';

  @override
  String get leaveReview => 'جائزہ دیں';

  @override
  String get rateOnPlayStore => 'Play Store پر FitBook کو ریٹ کریں';

  @override
  String get sourceCode => 'سورس کوڈ';

  @override
  String get foods => 'خوراکیں';

  @override
  String get backup => 'بیک اپ';

  @override
  String get exportData => 'ڈیٹا برآمد کریں';

  @override
  String get importData => 'ڈیٹا درآمد کریں';

  @override
  String get failedImportData => 'ڈیٹا درآمد نہیں ہو سکا';

  @override
  String get copyError => 'خرابی کاپی کریں';

  @override
  String get deleteRecords => 'ریکارڈز حذف کریں';

  @override
  String get unusedFood => 'غیر استعمال شدہ خوراک';

  @override
  String get database => 'ڈیٹابیس';

  @override
  String get deleteAllWeightsConfirm =>
      'کیا آپ واقعی تمام وزن حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا۔';

  @override
  String get deleteDatabaseConfirm =>
      'کیا آپ واقعی اپنا ڈیٹابیس حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا اور آپ کا تمام ڈیٹا ضائع ہو جائے گا۔';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'کیا آپ واقعی تمام خوراکیں اور ڈائری کے اندراجات حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا۔';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'کیا آپ واقعی $count غیر استعمال شدہ خوراکیں حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا۔',
      one:
          'کیا آپ واقعی 1 غیر استعمال شدہ خوراک حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا۔',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'کیا آپ واقعی ڈائری کے تمام اندراجات حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا۔';

  @override
  String get ok => 'ٹھیک ہے';

  @override
  String get replaceImage => 'تصویر تبدیل کریں';

  @override
  String get takePhoto => 'تصویر لیں';

  @override
  String get deleteImage => 'تصویر حذف کریں';

  @override
  String get filters => 'فلٹرز';

  @override
  String get foodGroup => 'خوراک کا گروپ';

  @override
  String get exampleFruit => 'پھل';

  @override
  String clearFiltersCount(int count) {
    return 'صاف کریں ($count)';
  }

  @override
  String get done => 'مکمل';

  @override
  String get showFilters => 'فلٹرز دکھائیں';

  @override
  String get repeatEntry => 'اندراج دہرائیں';

  @override
  String get timeOfDay => 'دن کا وقت';

  @override
  String get everyDay => 'ہر روز';

  @override
  String get repeatEveryDayForYear => 'اگلے ایک سال تک ہر روز یہ اندراج بنائیں';

  @override
  String get repeatOn => 'ان دنوں دہرائیں';

  @override
  String get weekdayMon => 'پیر';

  @override
  String get weekdayTue => 'منگل';

  @override
  String get weekdayWed => 'بدھ';

  @override
  String get weekdayThu => 'جمعرات';

  @override
  String get weekdayFri => 'جمعہ';

  @override
  String get weekdaySat => 'ہفتہ';

  @override
  String get weekdaySun => 'اتوار';

  @override
  String get schedule => 'شیڈول';

  @override
  String get enterValidNutritionValues => 'درست غذائی اقدار درج کریں';

  @override
  String get quickAddTitle => 'فوری اضافہ';

  @override
  String get kilojoules => 'کلو جولز';

  @override
  String get createdDate => 'تخلیق کی تاریخ';

  @override
  String get failedMigrations => 'ناکام مائیگریشنز';

  @override
  String get failedMigrationsDescription =>
      'آپ کا ڈیٹابیس بناتے یا اپ گریڈ کرتے وقت کچھ غلط ہو گیا۔ عموماً ریکارڈز حذف کر کے دوبارہ بنانے سے یہ مسئلہ حل ہو جاتا ہے۔';

  @override
  String get errorMessage => 'خرابی کا پیغام:';

  @override
  String get createIssue => 'ایشو بنائیں';

  @override
  String get cameraPermissionRequired =>
      'اسکین کرنے کے لیے کیمرے کی اجازت درکار ہے۔';

  @override
  String get scanFoodBarcode => 'خوراک کا بارکوڈ اسکین کریں';

  @override
  String get holdBarcodeInFrame => 'بارکوڈ کو فریم کے اندر رکھیں';

  @override
  String get pinchToZoom => 'زوم کرنے کے لیے پِنچ کریں';

  @override
  String get cameraStartFailed => 'کیمرہ شروع نہیں ہو سکا';

  @override
  String get editDiaryEntry => 'ڈائری کے اندراج میں ترمیم کریں';

  @override
  String get addFoodToDiary => 'ڈائری میں خوراک شامل کریں';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'کیا آپ واقعی $name حذف کرنا چاہتے ہیں؟';
  }

  @override
  String get imageError => 'تصویر کی خرابی';

  @override
  String get setImage => 'تصویر مقرر کریں';

  @override
  String get name => 'نام';

  @override
  String get searchFoodsAndMeals => 'خوراکیں اور کھانے تلاش کریں...';

  @override
  String get clearSelection => 'انتخاب صاف کریں';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'بارکوڈ نہیں ملا۔ شامل کرنے کے لیے محفوظ کریں۔';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'OpenFoodFacts میں \"$name\" تلاش کریں';
  }

  @override
  String get meal => 'کھانا';

  @override
  String get quantity => 'مقدار';

  @override
  String get unit => 'اکائی';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'سرونگ ($amount $unit)';
  }

  @override
  String get barcode => 'بارکوڈ';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (فی $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
    String nutrient,
    String quantity,
    String unit,
  ) {
    return '$nutrient فی $quantity $unit';
  }

  @override
  String get fiber => 'فائبر';

  @override
  String get unitServing => 'سرونگ';

  @override
  String get unitGrams => 'گرام';

  @override
  String get unitMilliliters => 'ملی لیٹر';

  @override
  String get unitKilojoules => 'کلو جولز';

  @override
  String get unitCups => 'کپ';

  @override
  String get unitTablespoons => 'کھانے کے چمچ';

  @override
  String get unitMilligrams => 'ملی گرام';

  @override
  String get unitTeaspoons => 'چائے کے چمچ';

  @override
  String get unitOunces => 'اونس';

  @override
  String get unitPounds => 'پاؤنڈ';

  @override
  String get unitKilograms => 'کلوگرام';

  @override
  String get unitLiters => 'لیٹر';

  @override
  String get nameConflict => 'نام کا تصادم';

  @override
  String get replaceExistingFood =>
      'اس نام سے ایک خوراک پہلے سے موجود ہے۔ کیا آپ پرانی خوراک کو تبدیل کرنا چاہتے ہیں؟';

  @override
  String get no => 'نہیں';

  @override
  String get yes => 'ہاں';

  @override
  String get editFood => 'خوراک میں ترمیم کریں';

  @override
  String confirmDeleteFood(String name) {
    return 'کیا آپ واقعی $name حذف کرنا چاہتے ہیں؟';
  }

  @override
  String get caloriesKcal => 'کیلوریز (kcal)';

  @override
  String get kilojoulesKj => 'کلو جولز (kJ)';

  @override
  String get servingSize => 'سرونگ کا سائز';

  @override
  String get servingUnit => 'سرونگ کی اکائی';

  @override
  String get saveAsNewCopy => 'نئی نقل کے طور پر محفوظ کریں';

  @override
  String get filterFoods => 'خوراکیں فلٹر کریں';

  @override
  String get narrowFoodsFilters =>
      'فلٹرز کے کسی بھی امتزاج سے فہرست محدود کریں۔';

  @override
  String get foodDetails => 'خوراک کی تفصیلات';

  @override
  String get exampleFruitHint => 'مثلاً پھل';

  @override
  String get servingSizeRangeHint =>
      'کم از کم، زیادہ سے زیادہ، یا دونوں مقرر کریں۔';

  @override
  String get minimum => 'کم از کم';

  @override
  String get maximum => 'زیادہ سے زیادہ';

  @override
  String get noMinimum => 'کوئی کم از کم حد نہیں';

  @override
  String get noMaximum => 'کوئی زیادہ سے زیادہ حد نہیں';

  @override
  String get clearAll => 'سب صاف کریں';

  @override
  String get searchOpenFoodFacts => 'Open Food Facts میں تلاش کریں';

  @override
  String get noMatchingProducts => 'کوئی مماثل پروڈکٹ نہیں';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'کوئی دوسرا نام آزمائیں یا بارکوڈ اسکین کریں۔';

  @override
  String get enterFoodNameToSearch =>
      'اوپر خوراک کا نام درج کریں، پھر تلاش کے لیے جمع کرائیں۔';

  @override
  String get submitToSearch => 'تلاش کے لیے جمع کرائیں...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g پروٹین';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count خوراکوں میں ترمیم کریں',
      one: '1 خوراک میں ترمیم کریں',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'کھانے میں ترمیم کریں';

  @override
  String get addImage => 'تصویر شامل کریں';

  @override
  String get noFoodsInMeal => 'اس کھانے میں ابھی کوئی خوراک نہیں';

  @override
  String get addFoodToMealHint =>
      'یہ کھانا بنانا شروع کرنے کے لیے خوراک شامل کریں۔';

  @override
  String get remove => 'ہٹائیں';

  @override
  String get searchFoods => 'خوراکیں تلاش کریں...';

  @override
  String get noFoodsFound => 'کوئی خوراک نہیں ملی';

  @override
  String nothingMatchesSearch(String search) {
    return '“$search” سے کچھ مماثل نہیں۔';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'کسی کھانے میں شامل کرنے سے پہلے اپنی لائبریری میں کچھ خوراکیں شامل کریں۔';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'ابھی کوئی ڈیٹا نہیں';

  @override
  String get completePlansToViewGraphs =>
      'یہاں گراف دیکھنے کے لیے کچھ منصوبے مکمل کریں۔';

  @override
  String get value => 'قدر';

  @override
  String get goal => 'ہدف';

  @override
  String get notSet => 'مقرر نہیں';

  @override
  String get trend => 'رجحان';

  @override
  String get smooth => 'ہموار';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count پوائنٹ اوسط',
      one: '1 پوائنٹ اوسط',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'وزن میں ترمیم کریں';

  @override
  String get addWeight => 'وزن شامل کریں';

  @override
  String shareWeight(String value, String unit) {
    return 'میں نے ابھی $value $unit وزن کیا!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'وزن ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'براہ کرم وزن درج کریں';

  @override
  String get pleaseEnterValidWeight => 'براہ کرم درست وزن درج کریں';

  @override
  String get lastWeight => 'آخری وزن';

  @override
  String unitWithValue(String unit) {
    return 'اکائی ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'اکائی $unit ہی رکھیں';
  }

  @override
  String convertToUnit(String unit) {
    return '$unit میں تبدیل کریں';
  }

  @override
  String get removeImage => 'تصویر ہٹائیں';

  @override
  String get mealRemindersEnabled => 'کھانے کی یاد دہانیاں فعال ہیں';

  @override
  String get mealRemindersEnabledBody =>
      'اگر آپ نے ابھی تک ناشتہ، دوپہر یا رات کا کھانا درج نہیں کیا تو ہم آپ کو یاد دلائیں گے۔';

  @override
  String get reminderSettingsChannel => 'یاد دہانی کی ترتیبات';

  @override
  String get reminderSettingsChannelDescription =>
      'FitBook کی یاد دہانیوں کی وضاحت کرنے والے نوٹیفکیشن';

  @override
  String get breakfastReminderTitle => 'ناشتہ درج کرنا نہ بھولیں';

  @override
  String get breakfastRemindersChannel => 'ناشتے کی یاد دہانیاں';

  @override
  String get breakfastRemindersChannelDescription =>
      'ناشتہ درج کرنے کی یاد دہانیاں';

  @override
  String get lunchReminderTitle => 'دوپہر کا کھانا درج کرنا نہ بھولیں';

  @override
  String get lunchRemindersChannel => 'دوپہر کے کھانے کی یاد دہانیاں';

  @override
  String get lunchRemindersChannelDescription =>
      'دوپہر کا کھانا درج کرنے کی یاد دہانیاں';

  @override
  String get dinnerReminderTitle => 'رات کا کھانا درج کرنا نہ بھولیں';

  @override
  String get dinnerRemindersChannel => 'رات کے کھانے کی یاد دہانیاں';

  @override
  String get dinnerRemindersChannelDescription =>
      'رات کا کھانا درج کرنے کی یاد دہانیاں';

  @override
  String get reinforcementGreatJob => 'بہت خوب! آپ کی محنت رنگ لا رہی ہے۔';

  @override
  String get reinforcementKeepItUp =>
      'اسی طرح جاری رکھیں! آپ بہترین پیش رفت کر رہے ہیں۔';

  @override
  String get reinforcementFantastic =>
      'شاندار! آپ کی لگن کے نتائج نظر آ رہے ہیں۔';

  @override
  String get reinforcementWellDone =>
      'شاباش! آپ اپنے ہدف کے ایک قدم اور قریب ہیں۔';

  @override
  String get reinforcementImpressive =>
      'زبردست! آپ کی کوششیں نتیجہ دے رہی ہیں۔';

  @override
  String get reinforcementAmazing => 'کمال! آپ درست راستے پر ہیں۔';

  @override
  String get reinforcementBravo => 'واہ! آپ کی ثابت قدمی قابلِ تعریف ہے۔';

  @override
  String get reinforcementExcellent => 'بہترین! آپ کی مستقل مزاجی متاثر کن ہے۔';

  @override
  String get reinforcementSuperb => 'لاجواب! آپ بہت عمدہ کام کر رہے ہیں۔';

  @override
  String get reinforcementIncredible => 'حیرت انگیز! آپ کی پیش رفت واضح ہے۔';

  @override
  String get reinforcementWayToGoKing => 'شاباش بادشاہ';

  @override
  String get reinforcementYeahBuddy => 'ہاں دوست!';

  @override
  String get reinforcementThatsHowItsDone => 'ایسے ہی کیا جاتا ہے۔';

  @override
  String get reinforcementEasyAsPie => 'بالکل آسان۔';

  @override
  String get reinforcementDoingGreat => 'آپ بہت اچھا کر رہے ہیں۔';

  @override
  String get reinforcementProgressNice =>
      'کیا یہ پیش رفت ہے جو مجھے نظر آ رہی ہے؟ بہت خوب۔';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return '$remaining $unit باقی';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return '$remaining $unit باقی ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'شکر';

  @override
  String get nutrientCholesterol => 'کولیسٹرول';

  @override
  String get nutrientSaturatedFat => 'سیر شدہ چربی';

  @override
  String get nutrientCalcium => 'کیلشیم';

  @override
  String get nutrientIron => 'آئرن';

  @override
  String get nutrientPotassium => 'پوٹاشیم';

  @override
  String get nutrientMagnesium => 'میگنیشیم';

  @override
  String get nutrientVitaminA => 'وٹامن A';

  @override
  String get nutrientVitaminC => 'وٹامن C';

  @override
  String get nutrientVitaminB12 => 'وٹامن B12';

  @override
  String get nutrientVitaminD => 'وٹامن D';

  @override
  String get nutrientVitaminE => 'وٹامن E';

  @override
  String get nutrientAddedSugar => 'اضافی شکر';

  @override
  String get nutrientNetCarbs => 'خالص کاربوہائیڈریٹس';

  @override
  String get nutrientWater => 'پانی';

  @override
  String get nutrientOmega3 => 'اومیگا-3 فیٹی ایسڈز';

  @override
  String get nutrientOmega6 => 'اومیگا-6 فیٹی ایسڈز';

  @override
  String get nutrientPralScore => 'PRAL اسکور';

  @override
  String get nutrientTransFat => 'ٹرانس فیٹ';

  @override
  String get nutrientSolubleFiber => 'حل پذیر فائبر';

  @override
  String get nutrientInsolubleFiber => 'ناقابلِ حل فائبر';

  @override
  String get nutrientPhosphorus => 'فاسفورس';

  @override
  String get nutrientSodium => 'سوڈیم';

  @override
  String get nutrientZinc => 'زنک';

  @override
  String get nutrientCopper => 'تانبا';

  @override
  String get nutrientManganese => 'مینگنیز';

  @override
  String get nutrientSelenium => 'سیلینیم';

  @override
  String get nutrientFluoride => 'فلورائیڈ';

  @override
  String get nutrientMolybdenum => 'مولبڈینم';

  @override
  String get nutrientChloride => 'کلورائیڈ';

  @override
  String get nutrientSucrose => 'سکروز';

  @override
  String get nutrientGlucose => 'گلوکوز';

  @override
  String get nutrientFructose => 'فریکٹوز';

  @override
  String get nutrientLactose => 'لیکٹوز';

  @override
  String get nutrientMaltose => 'مالٹوز';

  @override
  String get nutrientGalactose => 'گیلیکٹوز';

  @override
  String get nutrientStarch => 'نشاستہ';

  @override
  String get nutrientSugarAlcohols => 'شوگر الکوحلز';

  @override
  String get nutrientThiaminB1 => 'تھیامین (B1)';

  @override
  String get nutrientRiboflavinB2 => 'رائبوفلیون (B2)';

  @override
  String get nutrientNiacinB3 => 'نیاسین (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'پینٹوتھینک ایسڈ (B5)';

  @override
  String get nutrientVitaminB6 => 'وٹامن B6';

  @override
  String get nutrientBiotinB7 => 'بایوٹن (B7)';

  @override
  String get nutrientFolateB9 => 'فولیٹ (B9)';

  @override
  String get nutrientFolicAcid => 'فولک ایسڈ';

  @override
  String get nutrientFoodFolate => 'غذائی فولیٹ';

  @override
  String get nutrientFolateDfe => 'غذائی فولیٹ مساویات (DFE)';

  @override
  String get nutrientCholine => 'کولین';

  @override
  String get nutrientBetaine => 'بیٹین';

  @override
  String get nutrientRetinol => 'ریٹینول';

  @override
  String get nutrientBetaCarotene => 'بیٹا کیروٹین';

  @override
  String get nutrientAlphaCarotene => 'الفا کیروٹین';

  @override
  String get nutrientLycopene => 'لائیکوپین';

  @override
  String get nutrientLuteinZeaxanthin => 'لوٹین + زیاگزینتھین';

  @override
  String get nutrientVitaminD2 => 'وٹامن D2 (ارگوکیلسیفیرول)';

  @override
  String get nutrientVitaminD3 => 'وٹامن D3 (کولیکلسیفیرول)';

  @override
  String get nutrientVitaminK => 'وٹامن K';

  @override
  String get nutrientDihydrophylloquinone => 'ڈائی ہائیڈروفائلوکوئنون';

  @override
  String get nutrientMenaquinone4 => 'میناکوئنون-4';

  @override
  String get nutrientMonounsaturatedFat => 'یک غیر سیر شدہ چربی';

  @override
  String get nutrientPolyunsaturatedFat => 'کثیر غیر سیر شدہ چربی';

  @override
  String get nutrientAla => 'الفا-لینولینک ایسڈ (ALA)';

  @override
  String get nutrientEpa => 'ایکوساپینٹاینوئک ایسڈ (EPA)';

  @override
  String get nutrientDpa => 'ڈوکوساپینٹاینوئک ایسڈ (DPA)';

  @override
  String get nutrientDha => 'ڈوکوساہیکساینوئک ایسڈ (DHA)';

  @override
  String get nutrientAlanine => 'ایلینین';

  @override
  String get nutrientAlcohol => 'الکوحل';

  @override
  String get nutrientArginine => 'ارجینین';

  @override
  String get nutrientAsparticAcid => 'ایسپارٹک ایسڈ';

  @override
  String get nutrientCystine => 'سسٹین';

  @override
  String get nutrientGlutamicAcid => 'گلوٹامک ایسڈ';

  @override
  String get nutrientGlycine => 'گلائسین';

  @override
  String get nutrientHistidine => 'ہسٹیڈین';

  @override
  String get nutrientHydroxyproline => 'ہائیڈروکسی پرولین';

  @override
  String get nutrientIsoleucine => 'آئیسولیوسین';

  @override
  String get nutrientLeucine => 'لیوسین';

  @override
  String get nutrientLysine => 'لائسین';

  @override
  String get nutrientMethionine => 'میتھیونین';

  @override
  String get nutrientPhenylalanine => 'فینائل ایلینین';

  @override
  String get nutrientProline => 'پرولین';

  @override
  String get nutrientSerine => 'سیرین';

  @override
  String get nutrientThreonine => 'تھریونین';

  @override
  String get nutrientTryptophan => 'ٹرپٹوفین';

  @override
  String get nutrientTyrosine => 'ٹائروسین';

  @override
  String get nutrientValine => 'ویلین';

  @override
  String get nutrientCaffeine => 'کیفین';

  @override
  String get nutrientTheobromine => 'تھیوبرومین';

  @override
  String servingWeightNumber(int number) {
    return 'سرونگ کا وزن $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'سرونگ کی تفصیل $number';
  }

  @override
  String get calorieEquivalentWeight200 => '200 kcal کے برابر وزن';
}
