// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'دفتر روزانه';

  @override
  String get navGraph => 'نمودار';

  @override
  String get navFood => 'غذا';

  @override
  String get navWeight => 'وزن';

  @override
  String get navError => 'خطا';

  @override
  String get loadDataFailed => 'بارگیری این داده ممکن نشد.';

  @override
  String get settings => 'تنظیمات';

  @override
  String get invalidTabSettings => 'تنظیمات زبانه نامعتبر است.';

  @override
  String newVersion(String version) {
    return 'نسخه جدید $version';
  }

  @override
  String get changes => 'تغییرات';

  @override
  String get searchSettings => 'جست‌وجوی تنظیمات...';

  @override
  String get appearance => 'ظاهر';

  @override
  String get appearanceSubtitle => 'پوسته، رنگ‌ها و نمایش نمودار';

  @override
  String get diary => 'دفتر روزانه';

  @override
  String get diarySubtitle => 'اهداف روزانه، خلاصه‌ها و ثبت اطلاعات';

  @override
  String get food => 'غذا';

  @override
  String get foodSubtitle => 'واحدها، فیلدها و پیش‌فرض‌های غذا';

  @override
  String get weight => 'وزن';

  @override
  String get weightSubtitle => 'واحدهای وزن، اهداف و نمایش';

  @override
  String get tabs => 'زبانه‌ها';

  @override
  String get tabsSubtitle => 'زبانه‌های پیمایش و ترتیب آن‌ها';

  @override
  String get data => 'داده‌ها';

  @override
  String get dataSubtitle => 'درون‌ریزی، برون‌ریزی و داده‌های محلی';

  @override
  String get todayProgress => 'پیشرفت امروز';

  @override
  String get latestDay => 'آخرین روز';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ورودی ثبت شده',
      one: '۱ ورودی ثبت شده',
      zero: 'هیچ ورودی‌ای ثبت نشده',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ویرایش $count ورودی',
      one: 'ویرایش ۱ ورودی',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'کالری';

  @override
  String get protein => 'پروتئین';

  @override
  String get carbs => 'کربوهیدرات';

  @override
  String get fat => 'چربی';

  @override
  String get addDiaryEntry => 'افزودن ورودی دفتر روزانه';

  @override
  String get noEntriesToday => 'امروز ورودی‌ای وجود ندارد.';

  @override
  String addSearchToDiary(String search) {
    return 'افزودن «$search» به دفتر روزانه';
  }

  @override
  String get tapStartLoggingFood => 'برای شروع ثبت غذا ضربه بزنید.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'ورودی منطبقی در دفتر روزانه نیست. برای ساخت این غذا و ثبت آن ضربه بزنید.';

  @override
  String get add => 'افزودن';

  @override
  String get quickAdd => 'افزودن سریع';

  @override
  String get scanBarcode => 'اسکن بارکد';

  @override
  String get foodLibrary => 'کتابخانه غذا';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount غذا',
      one: '۱ غذا',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount وعده',
      one: '۱ وعده',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'اخیراً استفاده‌شده';

  @override
  String get quickActions => 'اقدام‌های سریع';

  @override
  String get addFood => 'افزودن غذا';

  @override
  String get createMeal => 'ساخت وعده غذایی';

  @override
  String get noFoodYet => 'هنوز غذایی نیست';

  @override
  String get noMatchingFood => 'غذای منطبقی نیست';

  @override
  String get addFirstFoodOrMeal =>
      'برای ساخت کتابخانه خود، نخستین غذا یا وعده را اضافه کنید.';

  @override
  String noFoodSearchMatches(String search) {
    return 'چیزی با «$search» مطابقت ندارد. برای دیدن دوباره همه موارد، جست‌وجو را پاک کنید.';
  }

  @override
  String get clearSearch => 'پاک کردن جست‌وجو';

  @override
  String get addMeal => 'افزودن وعده غذایی';

  @override
  String get noWeightsYet => 'هنوز وزنی ثبت نشده';

  @override
  String get noMatchingWeights => 'وزن منطبقی نیست';

  @override
  String get logFirstWeight =>
      'نخستین وزن خود را ثبت کنید تا روندتان پیگیری شود.';

  @override
  String noWeightSearchMatches(String search) {
    return 'چیزی با «$search» مطابقت ندارد. برای دیدن همه ورودی‌ها، جست‌وجو را پاک کنید.';
  }

  @override
  String get logWeight => 'ثبت وزن';

  @override
  String get weightTrend => 'روند وزن';

  @override
  String get weightTrendSubtitle => 'اندازه‌گیری‌های اخیر و جهت کلی';

  @override
  String get bodyWeight => 'وزن بدن';

  @override
  String get options => 'گزینه‌ها';

  @override
  String get day => 'روز';

  @override
  String get today => 'امروز';

  @override
  String get week => 'هفته';

  @override
  String get month => 'ماه';

  @override
  String get year => 'سال';

  @override
  String get dateRange => 'بازه تاریخ';

  @override
  String get startDate => 'تاریخ شروع';

  @override
  String get stopDate => 'تاریخ پایان';

  @override
  String get dataPoints => 'نقاط داده';

  @override
  String get customizeFields => 'سفارشی‌سازی فیلدها';

  @override
  String get language => 'زبان';

  @override
  String get languageSubtitle => 'زبان مورد استفاده FitBook را انتخاب کنید';

  @override
  String get languageSystem => 'سیستم';

  @override
  String get languageEnglish => 'انگلیسی';

  @override
  String get languageSpanish => 'اسپانیایی';

  @override
  String get languageFrench => 'فرانسوی';

  @override
  String get languageGerman => 'آلمانی';

  @override
  String get languageItalian => 'ایتالیایی';

  @override
  String get languagePortugueseBrazil => 'پرتغالی (برزیل)';

  @override
  String get languageDutch => 'هلندی';

  @override
  String get languagePolish => 'لهستانی';

  @override
  String get languageJapanese => 'ژاپنی';

  @override
  String get languageKorean => 'کره‌ای';

  @override
  String get languageChineseSimplified => 'چینی (ساده‌شده)';

  @override
  String get languageChineseTraditional => 'چینی (سنتی)';

  @override
  String get languageRussian => 'روسی';

  @override
  String get languageHindi => 'هندی';

  @override
  String get languageIndonesian => 'اندونزیایی';

  @override
  String get languageVietnamese => 'ویتنامی';

  @override
  String get languageThai => 'تایلندی';

  @override
  String get languageBengali => 'بنگالی';

  @override
  String get languageUrdu => 'اردو';

  @override
  String get languagePersian => 'فارسی';

  @override
  String get languageMalay => 'مالایی';

  @override
  String get languageUkrainian => 'اوکراینی';

  @override
  String get appearanceSettings => 'تنظیمات ظاهر';

  @override
  String get delete => 'حذف';

  @override
  String get confirmDelete => 'تأیید حذف';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'آیا مطمئنید می‌خواهید $count رکورد را حذف کنید؟ این کار قابل بازگشت نیست.',
      one:
          'آیا مطمئنید می‌خواهید ۱ رکورد را حذف کنید؟ این کار قابل بازگشت نیست.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'لغو';

  @override
  String get search => 'جست‌وجو...';

  @override
  String get clear => 'پاک کردن';

  @override
  String get showMenu => 'نمایش منو';

  @override
  String get selectAll => 'انتخاب همه';

  @override
  String get edit => 'ویرایش';

  @override
  String get favorite => 'موردعلاقه';

  @override
  String get atLeastOneTab => 'حداقل یک زبانه لازم است';

  @override
  String get scrollableTabs => 'زبانه‌های قابل پیمایش';

  @override
  String get save => 'ذخیره';

  @override
  String get themeSystem => 'سیستم';

  @override
  String get themeDark => 'تیره';

  @override
  String get themeLight => 'روشن';

  @override
  String get pureBlackAmoled => 'سیاه خالص (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'برای نمایشگرهای AMOLED از رنگ سیاه خالص استفاده کنید';

  @override
  String get systemColorScheme => 'طرح رنگ سیستم';

  @override
  String get systemColorSchemeTooltip =>
      'از رنگ اصلی دستگاه برای برنامه استفاده کنید';

  @override
  String get showImages => 'نمایش تصاویر';

  @override
  String get showImagesTooltip =>
      'در صفحه‌های دفتر روزانه و غذا تصویر انتخاب و نمایش دهید';

  @override
  String get curveLineGraphs => 'منحنی کردن خطوط نمودار';

  @override
  String get curveLineGraphsTooltip =>
      'در صفحه نمودارها از منحنی‌های نرم استفاده کنید';

  @override
  String get weightStatCards => 'کارت‌های آماری وزن';

  @override
  String get weightStatCardsTooltip =>
      'ورودی‌های وزن را به‌جای فهرست پیش‌فرض به‌شکل شبکه‌ای از کارت‌های آماری نشان دهید';

  @override
  String get graphsStartAtZero => 'شروع نمودارها از صفر';

  @override
  String get graphsStartAtZeroTooltip => 'محور y نمودار همیشه از صفر آغاز شود';

  @override
  String get navigationAnimation => 'پویانمایی پیمایش';

  @override
  String get animationFade => 'محو شدن';

  @override
  String get animationZoom => 'بزرگ‌نمایی';

  @override
  String get animationSlide => 'لغزش';

  @override
  String get animationRise => 'بالا آمدن';

  @override
  String get animationNone => 'بدون پویانمایی';

  @override
  String longDateFormat(String example) {
    return 'قالب تاریخ بلند ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'قالب تاریخ کوتاه ($example)';
  }

  @override
  String get diarySettings => 'تنظیمات دفتر روزانه';

  @override
  String get diaryUnit => 'واحد دفتر روزانه';

  @override
  String get diarySummary => 'خلاصه دفتر روزانه';

  @override
  String get diarySummaryDivision => 'تقسیم - فعلی / کل';

  @override
  String get diarySummaryRemaining => 'باقی‌مانده';

  @override
  String get diarySummaryBoth => 'هر دو - باقی‌مانده (کل)';

  @override
  String get diarySummaryNone => 'هیچ‌کدام';

  @override
  String get dailyCaloriesKcal => 'کالری روزانه (kcal)';

  @override
  String get dailyProteinG => 'پروتئین روزانه (g)';

  @override
  String get dailyFatG => 'چربی روزانه (g)';

  @override
  String get dailyCarbsG => 'کربوهیدرات روزانه (g)';

  @override
  String get dailyFiberG => 'فیبر روزانه (g)';

  @override
  String get automaticDailies => 'اهداف روزانه خودکار';

  @override
  String get automaticDailiesTooltip =>
      'کالری، پروتئین، چربی و کربوهیدرات روزانه پیشنهادی را بر اساس وزن بدن به‌طور خودکار محاسبه کنید';

  @override
  String get selectNameOnSubmit => 'انتخاب نام هنگام ثبت';

  @override
  String get reminders => 'یادآورها';

  @override
  String get foodSettings => 'تنظیمات غذا';

  @override
  String get foodUnit => 'واحد غذا';

  @override
  String get fields => 'فیلدها';

  @override
  String get favoriteNewFoods => 'موردعلاقه کردن غذاهای جدید';

  @override
  String get pickFields => 'انتخاب فیلدها';

  @override
  String get all => 'همه';

  @override
  String get onlySelected => 'فقط انتخاب‌شده‌ها';

  @override
  String get weightSettings => 'تنظیمات وزن';

  @override
  String get targetWeight => 'وزن هدف';

  @override
  String get positiveReinforcement => 'تقویت مثبت';

  @override
  String get positiveReinforcementPreview =>
      'پیام‌های تشویقی به این شکل نمایش داده می‌شوند!';

  @override
  String get dataSettings => 'تنظیمات داده';

  @override
  String get automaticBackup => 'پشتیبان‌گیری خودکار';

  @override
  String get shareDatabase => 'اشتراک‌گذاری پایگاه داده';

  @override
  String get openNotification => 'باز کردن اعلان';

  @override
  String get automaticBackupsEnabled => 'پشتیبان‌گیری خودکار فعال است';

  @override
  String get automaticBackupBody =>
      'FitBook هر روز به‌طور خودکار از داده‌ها و تصاویر شما در پوشه انتخاب‌شده پشتیبان می‌گیرد.';

  @override
  String get backupSettings => 'تنظیمات پشتیبان‌گیری';

  @override
  String get backupSettingsChannelDescription =>
      'اعلان‌های مربوط به پشتیبان‌گیری خودکار';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'نام کاربری';

  @override
  String get password => 'رمز عبور';

  @override
  String get close => 'بستن';

  @override
  String get loggedIn => 'وارد شده';

  @override
  String get about => 'درباره';

  @override
  String get version => 'نسخه';

  @override
  String get whatsNew => 'چه چیز جدیدی است؟';

  @override
  String get author => 'نویسنده';

  @override
  String get license => 'مجوز';

  @override
  String get donate => 'حمایت مالی';

  @override
  String get supportProject => 'از این پروژه حمایت کنید';

  @override
  String get leaveReview => 'ثبت نظر';

  @override
  String get rateOnPlayStore => 'امتیاز دادن به FitBook در Play Store';

  @override
  String get sourceCode => 'کد منبع';

  @override
  String get foods => 'غذاها';

  @override
  String get backup => 'پشتیبان‌گیری';

  @override
  String get exportData => 'برون‌ریزی داده‌ها';

  @override
  String get importData => 'درون‌ریزی داده‌ها';

  @override
  String get failedImportData => 'درون‌ریزی داده‌ها ناموفق بود';

  @override
  String get copyError => 'کپی خطا';

  @override
  String get deleteRecords => 'حذف رکوردها';

  @override
  String get unusedFood => 'غذای استفاده‌نشده';

  @override
  String get database => 'پایگاه داده';

  @override
  String get deleteAllWeightsConfirm =>
      'آیا مطمئنید می‌خواهید همه وزن‌ها را حذف کنید؟ این کار قابل بازگشت نیست.';

  @override
  String get deleteDatabaseConfirm =>
      'آیا مطمئنید می‌خواهید پایگاه داده خود را حذف کنید؟ این کار قابل بازگشت نیست و همه داده‌های شما را از بین می‌برد.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'آیا مطمئنید می‌خواهید همه غذاها و ورودی‌های دفتر روزانه را حذف کنید؟ این کار قابل بازگشت نیست.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'آیا مطمئنید می‌خواهید $count غذای استفاده‌نشده را حذف کنید؟ این کار برگشت‌ناپذیر است.',
      one:
          'آیا مطمئنید می‌خواهید ۱ غذای استفاده‌نشده را حذف کنید؟ این کار برگشت‌ناپذیر است.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'آیا مطمئنید می‌خواهید همه ورودی‌های دفتر روزانه را حذف کنید؟ این کار قابل بازگشت نیست.';

  @override
  String get ok => 'تأیید';

  @override
  String get replaceImage => 'جایگزینی تصویر';

  @override
  String get takePhoto => 'گرفتن عکس';

  @override
  String get deleteImage => 'حذف تصویر';

  @override
  String get filters => 'فیلترها';

  @override
  String get foodGroup => 'گروه غذایی';

  @override
  String get exampleFruit => 'میوه';

  @override
  String clearFiltersCount(int count) {
    return 'پاک کردن ($count)';
  }

  @override
  String get done => 'انجام شد';

  @override
  String get showFilters => 'نمایش فیلترها';

  @override
  String get repeatEntry => 'تکرار ورودی';

  @override
  String get timeOfDay => 'زمان روز';

  @override
  String get everyDay => 'هر روز';

  @override
  String get repeatEveryDayForYear =>
      'این ورودی را هر روز در طول سال آینده ایجاد کنید';

  @override
  String get repeatOn => 'تکرار در';

  @override
  String get weekdayMon => 'دوشنبه';

  @override
  String get weekdayTue => 'سه‌شنبه';

  @override
  String get weekdayWed => 'چهارشنبه';

  @override
  String get weekdayThu => 'پنج‌شنبه';

  @override
  String get weekdayFri => 'جمعه';

  @override
  String get weekdaySat => 'شنبه';

  @override
  String get weekdaySun => 'یکشنبه';

  @override
  String get schedule => 'زمان‌بندی';

  @override
  String get enterValidNutritionValues => 'مقادیر تغذیه‌ای معتبر وارد کنید';

  @override
  String get quickAddTitle => 'افزودن سریع';

  @override
  String get kilojoules => 'کیلوژول';

  @override
  String get createdDate => 'تاریخ ایجاد';

  @override
  String get failedMigrations => 'مهاجرت‌های ناموفق';

  @override
  String get failedMigrationsDescription =>
      'هنگام ایجاد یا ارتقای پایگاه داده مشکلی رخ داد. معمولاً با حذف و ایجاد دوباره رکوردها می‌توان آن را برطرف کرد.';

  @override
  String get errorMessage => 'پیام خطا:';

  @override
  String get createIssue => 'ایجاد گزارش مشکل';

  @override
  String get cameraPermissionRequired => 'برای اسکن، اجازه دوربین لازم است.';

  @override
  String get scanFoodBarcode => 'اسکن بارکد غذا';

  @override
  String get holdBarcodeInFrame => 'بارکد را داخل کادر نگه دارید';

  @override
  String get pinchToZoom => 'برای بزرگ‌نمایی دو انگشت را باز و بسته کنید';

  @override
  String get cameraStartFailed => 'راه‌اندازی دوربین ممکن نشد';

  @override
  String get editDiaryEntry => 'ویرایش ورودی دفتر روزانه';

  @override
  String get addFoodToDiary => 'افزودن غذا به دفتر روزانه';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'آیا مطمئنید می‌خواهید $name را حذف کنید؟';
  }

  @override
  String get imageError => 'خطای تصویر';

  @override
  String get setImage => 'تنظیم تصویر';

  @override
  String get name => 'نام';

  @override
  String get searchFoodsAndMeals => 'جست‌وجوی غذاها و وعده‌ها...';

  @override
  String get clearSelection => 'پاک کردن انتخاب';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'بارکد پیدا نشد. برای افزودن، ذخیره کنید.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'جست‌وجوی «$name» در OpenFoodFacts';
  }

  @override
  String get meal => 'وعده غذایی';

  @override
  String get quantity => 'مقدار';

  @override
  String get unit => 'واحد';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'وعده ($amount $unit)';
  }

  @override
  String get barcode => 'بارکد';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (به‌ازای $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '$nutrient به‌ازای $quantity $unit';
  }

  @override
  String get fiber => 'فیبر';

  @override
  String get unitServing => 'وعده';

  @override
  String get unitGrams => 'گرم';

  @override
  String get unitMilliliters => 'میلی‌لیتر';

  @override
  String get unitKilojoules => 'کیلوژول';

  @override
  String get unitCups => 'پیمانه';

  @override
  String get unitTablespoons => 'قاشق غذاخوری';

  @override
  String get unitMilligrams => 'میلی‌گرم';

  @override
  String get unitTeaspoons => 'قاشق چای‌خوری';

  @override
  String get unitOunces => 'اونس';

  @override
  String get unitPounds => 'پوند';

  @override
  String get unitKilograms => 'کیلوگرم';

  @override
  String get unitLiters => 'لیتر';

  @override
  String get nameConflict => 'تداخل نام';

  @override
  String get replaceExistingFood =>
      'غذایی با این نام از قبل وجود دارد. می‌خواهید مورد قبلی را جایگزین کنید؟';

  @override
  String get no => 'خیر';

  @override
  String get yes => 'بله';

  @override
  String get editFood => 'ویرایش غذا';

  @override
  String confirmDeleteFood(String name) {
    return 'آیا مطمئنید می‌خواهید $name را حذف کنید؟';
  }

  @override
  String get caloriesKcal => 'کالری (kcal)';

  @override
  String get kilojoulesKj => 'کیلوژول (kJ)';

  @override
  String get servingSize => 'اندازه وعده';

  @override
  String get servingUnit => 'واحد وعده';

  @override
  String get saveAsNewCopy => 'ذخیره به‌عنوان نسخه جدید';

  @override
  String get filterFoods => 'فیلتر کردن غذاها';

  @override
  String get narrowFoodsFilters =>
      'فهرست را با هر ترکیبی از فیلترها محدود کنید.';

  @override
  String get foodDetails => 'جزئیات غذا';

  @override
  String get exampleFruitHint => 'مثلاً میوه';

  @override
  String get servingSizeRangeHint => 'حداقل، حداکثر یا هر دو را تعیین کنید.';

  @override
  String get minimum => 'حداقل';

  @override
  String get maximum => 'حداکثر';

  @override
  String get noMinimum => 'بدون حداقل';

  @override
  String get noMaximum => 'بدون حداکثر';

  @override
  String get clearAll => 'پاک کردن همه';

  @override
  String get searchOpenFoodFacts => 'جست‌وجو در Open Food Facts';

  @override
  String get noMatchingProducts => 'محصول منطبقی نیست';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'نام دیگری را امتحان کنید یا بارکد را اسکن کنید.';

  @override
  String get enterFoodNameToSearch =>
      'نام غذا را در بالا وارد کنید و سپس جست‌وجو را ارسال کنید.';

  @override
  String get submitToSearch => 'ارسال برای جست‌وجو...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value گرم پروتئین';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ویرایش $count غذا',
      one: 'ویرایش ۱ غذا',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'ویرایش وعده غذایی';

  @override
  String get addImage => 'افزودن تصویر';

  @override
  String get noFoodsInMeal => 'هنوز غذایی در این وعده نیست';

  @override
  String get addFoodToMealHint => 'برای ساخت این وعده، یک غذا اضافه کنید.';

  @override
  String get remove => 'حذف';

  @override
  String get searchFoods => 'جست‌وجوی غذاها...';

  @override
  String get noFoodsFound => 'غذایی پیدا نشد';

  @override
  String nothingMatchesSearch(String search) {
    return 'چیزی با «$search» مطابقت ندارد.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'پیش از افزودن غذا به یک وعده، چند غذا به کتابخانه خود اضافه کنید.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'هنوز داده‌ای نیست';

  @override
  String get completePlansToViewGraphs =>
      'چند برنامه را تکمیل کنید تا نمودارها را اینجا ببینید.';

  @override
  String get value => 'مقدار';

  @override
  String get goal => 'هدف';

  @override
  String get notSet => 'تنظیم نشده';

  @override
  String get trend => 'روند';

  @override
  String get smooth => 'هموار';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'میانگین $count نقطه‌ای',
      one: 'میانگین ۱ نقطه‌ای',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'ویرایش وزن';

  @override
  String get addWeight => 'افزودن وزن';

  @override
  String shareWeight(String value, String unit) {
    return 'همین الان $value $unit وزن کردم!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'وزن ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'لطفاً وزن را وارد کنید';

  @override
  String get pleaseEnterValidWeight => 'لطفاً یک وزن معتبر وارد کنید';

  @override
  String get lastWeight => 'آخرین وزن';

  @override
  String unitWithValue(String unit) {
    return 'واحد ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'واحد را $unit نگه دارید';
  }

  @override
  String convertToUnit(String unit) {
    return 'تبدیل به $unit';
  }

  @override
  String get removeImage => 'حذف تصویر';

  @override
  String get mealRemindersEnabled => 'یادآور وعده‌های غذایی فعال است';

  @override
  String get mealRemindersEnabledBody =>
      'اگر صبحانه، ناهار یا شام را ثبت نکرده باشید، به شما یادآوری می‌کنیم.';

  @override
  String get reminderSettingsChannel => 'تنظیمات یادآورها';

  @override
  String get reminderSettingsChannelDescription =>
      'اعلان‌هایی که یادآورهای FitBook را توضیح می‌دهند';

  @override
  String get breakfastReminderTitle => 'ثبت صبحانه را فراموش نکنید';

  @override
  String get breakfastRemindersChannel => 'یادآورهای صبحانه';

  @override
  String get breakfastRemindersChannelDescription => 'یادآوری برای ثبت صبحانه';

  @override
  String get lunchReminderTitle => 'ثبت ناهار را فراموش نکنید';

  @override
  String get lunchRemindersChannel => 'یادآورهای ناهار';

  @override
  String get lunchRemindersChannelDescription => 'یادآوری برای ثبت ناهار';

  @override
  String get dinnerReminderTitle => 'ثبت شام را فراموش نکنید';

  @override
  String get dinnerRemindersChannel => 'یادآورهای شام';

  @override
  String get dinnerRemindersChannelDescription => 'یادآوری برای ثبت شام';

  @override
  String get reinforcementGreatJob => 'عالی بود! تلاش شما دارد نتیجه می‌دهد.';

  @override
  String get reinforcementKeepItUp =>
      'ادامه بدهید! پیشرفت فوق‌العاده‌ای دارید.';

  @override
  String get reinforcementFantastic =>
      'فوق‌العاده است! پشتکار شما نتیجه داده است.';

  @override
  String get reinforcementWellDone =>
      'آفرین! یک قدم دیگر به هدفتان نزدیک‌تر شدید.';

  @override
  String get reinforcementImpressive =>
      'تحسین‌برانگیز است! تلاش‌هایتان به ثمر نشسته.';

  @override
  String get reinforcementAmazing => 'شگفت‌انگیز است! در مسیر درستی هستید.';

  @override
  String get reinforcementBravo => 'آفرین! تعهد شما ستودنی است.';

  @override
  String get reinforcementExcellent => 'عالی! پشتکار شما الهام‌بخش است.';

  @override
  String get reinforcementSuperb => 'فوق‌العاده! کارتان واقعاً عالی است.';

  @override
  String get reinforcementIncredible =>
      'باورنکردنی است! پیشرفتتان کاملاً پیداست.';

  @override
  String get reinforcementWayToGoKing => 'دمت گرم قهرمان';

  @override
  String get reinforcementYeahBuddy => 'آره رفیق!';

  @override
  String get reinforcementThatsHowItsDone => 'همینه که باید باشه.';

  @override
  String get reinforcementEasyAsPie => 'مثل آب خوردن.';

  @override
  String get reinforcementDoingGreat => 'خیلی خوب پیش می‌روید.';

  @override
  String get reinforcementProgressNice => 'این پیشرفته که می‌بینم؟ عالیه.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return '$remaining $unit باقی‌مانده';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return '$remaining $unit باقی‌مانده ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'قندها';

  @override
  String get nutrientCholesterol => 'کلسترول';

  @override
  String get nutrientSaturatedFat => 'چربی اشباع';

  @override
  String get nutrientCalcium => 'کلسیم';

  @override
  String get nutrientIron => 'آهن';

  @override
  String get nutrientPotassium => 'پتاسیم';

  @override
  String get nutrientMagnesium => 'منیزیم';

  @override
  String get nutrientVitaminA => 'ویتامین A';

  @override
  String get nutrientVitaminC => 'ویتامین C';

  @override
  String get nutrientVitaminB12 => 'ویتامین B12';

  @override
  String get nutrientVitaminD => 'ویتامین D';

  @override
  String get nutrientVitaminE => 'ویتامین E';

  @override
  String get nutrientAddedSugar => 'قند افزوده';

  @override
  String get nutrientNetCarbs => 'کربوهیدرات خالص';

  @override
  String get nutrientWater => 'آب';

  @override
  String get nutrientOmega3 => 'اسیدهای چرب امگا ۳';

  @override
  String get nutrientOmega6 => 'اسیدهای چرب امگا ۶';

  @override
  String get nutrientPralScore => 'امتیاز PRAL';

  @override
  String get nutrientTransFat => 'چربی ترانس';

  @override
  String get nutrientSolubleFiber => 'فیبر محلول';

  @override
  String get nutrientInsolubleFiber => 'فیبر نامحلول';

  @override
  String get nutrientPhosphorus => 'فسفر';

  @override
  String get nutrientSodium => 'سدیم';

  @override
  String get nutrientZinc => 'روی';

  @override
  String get nutrientCopper => 'مس';

  @override
  String get nutrientManganese => 'منگنز';

  @override
  String get nutrientSelenium => 'سلنیوم';

  @override
  String get nutrientFluoride => 'فلوراید';

  @override
  String get nutrientMolybdenum => 'مولیبدن';

  @override
  String get nutrientChloride => 'کلرید';

  @override
  String get nutrientSucrose => 'ساکاروز';

  @override
  String get nutrientGlucose => 'گلوکز';

  @override
  String get nutrientFructose => 'فروکتوز';

  @override
  String get nutrientLactose => 'لاکتوز';

  @override
  String get nutrientMaltose => 'مالتوز';

  @override
  String get nutrientGalactose => 'گالاکتوز';

  @override
  String get nutrientStarch => 'نشاسته';

  @override
  String get nutrientSugarAlcohols => 'الکل‌های قندی';

  @override
  String get nutrientThiaminB1 => 'تیامین (B1)';

  @override
  String get nutrientRiboflavinB2 => 'ریبوفلاوین (B2)';

  @override
  String get nutrientNiacinB3 => 'نیاسین (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'اسید پانتوتنیک (B5)';

  @override
  String get nutrientVitaminB6 => 'ویتامین B6';

  @override
  String get nutrientBiotinB7 => 'بیوتین (B7)';

  @override
  String get nutrientFolateB9 => 'فولات (B9)';

  @override
  String get nutrientFolicAcid => 'اسید فولیک';

  @override
  String get nutrientFoodFolate => 'فولات غذایی';

  @override
  String get nutrientFolateDfe => 'معادل فولات غذایی (DFE)';

  @override
  String get nutrientCholine => 'کولین';

  @override
  String get nutrientBetaine => 'بتائین';

  @override
  String get nutrientRetinol => 'رتینول';

  @override
  String get nutrientBetaCarotene => 'بتاکاروتن';

  @override
  String get nutrientAlphaCarotene => 'آلفاکاروتن';

  @override
  String get nutrientLycopene => 'لیکوپن';

  @override
  String get nutrientLuteinZeaxanthin => 'لوتئین + زآگزانتین';

  @override
  String get nutrientVitaminD2 => 'ویتامین D2 (ارگوکلسیفرول)';

  @override
  String get nutrientVitaminD3 => 'ویتامین D3 (کوله‌کلسیفرول)';

  @override
  String get nutrientVitaminK => 'ویتامین K';

  @override
  String get nutrientDihydrophylloquinone => 'دی‌هیدروفیلوکینون';

  @override
  String get nutrientMenaquinone4 => 'مناکینون-۴';

  @override
  String get nutrientMonounsaturatedFat => 'چربی تک‌غیراشباع';

  @override
  String get nutrientPolyunsaturatedFat => 'چربی چندغیراشباع';

  @override
  String get nutrientAla => 'اسید آلفا-لینولنیک (ALA)';

  @override
  String get nutrientEpa => 'اسید ایکوزاپنتانوئیک (EPA)';

  @override
  String get nutrientDpa => 'اسید دوکوزاپنتانوئیک (DPA)';

  @override
  String get nutrientDha => 'اسید دوکوزاهگزانوئیک (DHA)';

  @override
  String get nutrientAlanine => 'آلانین';

  @override
  String get nutrientAlcohol => 'الکل';

  @override
  String get nutrientArginine => 'آرژینین';

  @override
  String get nutrientAsparticAcid => 'اسید آسپارتیک';

  @override
  String get nutrientCystine => 'سیستین';

  @override
  String get nutrientGlutamicAcid => 'اسید گلوتامیک';

  @override
  String get nutrientGlycine => 'گلیسین';

  @override
  String get nutrientHistidine => 'هیستیدین';

  @override
  String get nutrientHydroxyproline => 'هیدروکسی‌پرولین';

  @override
  String get nutrientIsoleucine => 'ایزولوسین';

  @override
  String get nutrientLeucine => 'لوسین';

  @override
  String get nutrientLysine => 'لیزین';

  @override
  String get nutrientMethionine => 'متیونین';

  @override
  String get nutrientPhenylalanine => 'فنیل‌آلانین';

  @override
  String get nutrientProline => 'پرولین';

  @override
  String get nutrientSerine => 'سرین';

  @override
  String get nutrientThreonine => 'ترئونین';

  @override
  String get nutrientTryptophan => 'تریپتوفان';

  @override
  String get nutrientTyrosine => 'تیروزین';

  @override
  String get nutrientValine => 'والین';

  @override
  String get nutrientCaffeine => 'کافئین';

  @override
  String get nutrientTheobromine => 'تئوبرومین';

  @override
  String servingWeightNumber(int number) {
    return 'وزن وعده $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'توضیحات وعده $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'وزن معادل ۲۰۰ kcal';
}
