// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'डायरी';

  @override
  String get navGraph => 'ग्राफ़';

  @override
  String get navFood => 'भोजन';

  @override
  String get navWeight => 'वज़न';

  @override
  String get navError => 'त्रुटि';

  @override
  String get loadDataFailed => 'यह डेटा लोड नहीं हो सका।';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get invalidTabSettings => 'टैब सेटिंग्स अमान्य हैं।';

  @override
  String newVersion(String version) {
    return 'नया संस्करण $version';
  }

  @override
  String get changes => 'बदलाव';

  @override
  String get searchSettings => 'सेटिंग्स खोजें...';

  @override
  String get appearance => 'दिखावट';

  @override
  String get appearanceSubtitle => 'थीम, रंग और ग्राफ़ प्रदर्शन';

  @override
  String get diary => 'डायरी';

  @override
  String get diarySubtitle => 'दैनिक लक्ष्य, सारांश और लॉगिंग';

  @override
  String get food => 'भोजन';

  @override
  String get foodSubtitle => 'भोजन की इकाइयाँ, फ़ील्ड और डिफ़ॉल्ट';

  @override
  String get weight => 'वज़न';

  @override
  String get weightSubtitle => 'वज़न की इकाइयाँ, लक्ष्य और प्रदर्शन';

  @override
  String get tabs => 'टैब';

  @override
  String get tabsSubtitle => 'नेविगेशन टैब और क्रम';

  @override
  String get data => 'डेटा';

  @override
  String get dataSubtitle => 'इम्पोर्ट, एक्सपोर्ट और स्थानीय डेटा';

  @override
  String get todayProgress => 'आज की प्रगति';

  @override
  String get latestDay => 'नवीनतम दिन';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count प्रविष्टियाँ लॉग हुईं',
      one: '1 प्रविष्टि लॉग हुई',
      zero: 'कोई प्रविष्टि लॉग नहीं हुई',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count प्रविष्टियाँ संपादित करें',
      one: '1 प्रविष्टि संपादित करें',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'कैलोरी';

  @override
  String get protein => 'प्रोटीन';

  @override
  String get carbs => 'कार्ब्स';

  @override
  String get fat => 'वसा';

  @override
  String get addDiaryEntry => 'डायरी प्रविष्टि जोड़ें';

  @override
  String get noEntriesToday => 'आज कोई प्रविष्टि नहीं है।';

  @override
  String addSearchToDiary(String search) {
    return '\"$search\" को अपनी डायरी में जोड़ें';
  }

  @override
  String get tapStartLoggingFood => 'भोजन लॉग करना शुरू करने के लिए टैप करें।';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'कोई मेल खाती डायरी प्रविष्टि नहीं मिली। यह भोजन बनाने और लॉग करने के लिए टैप करें।';

  @override
  String get add => 'जोड़ें';

  @override
  String get quickAdd => 'त्वरित जोड़ें';

  @override
  String get scanBarcode => 'बारकोड स्कैन करें';

  @override
  String get foodLibrary => 'भोजन लाइब्रेरी';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount भोजन',
      one: '1 भोजन',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount मील',
      one: '1 मील',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'हाल में उपयोग किए गए';

  @override
  String get quickActions => 'त्वरित कार्रवाइयाँ';

  @override
  String get addFood => 'भोजन जोड़ें';

  @override
  String get createMeal => 'मील बनाएँ';

  @override
  String get noFoodYet => 'अभी कोई भोजन नहीं';

  @override
  String get noMatchingFood => 'कोई मेल खाता भोजन नहीं';

  @override
  String get addFirstFoodOrMeal =>
      'अपनी लाइब्रेरी बनाना शुरू करने के लिए पहला भोजन या मील जोड़ें।';

  @override
  String noFoodSearchMatches(String search) {
    return '“$search” से कुछ भी मेल नहीं खाता। सब कुछ फिर से देखने के लिए खोज साफ़ करें।';
  }

  @override
  String get clearSearch => 'खोज साफ़ करें';

  @override
  String get addMeal => 'मील जोड़ें';

  @override
  String get noWeightsYet => 'अभी कोई वज़न नहीं';

  @override
  String get noMatchingWeights => 'कोई मेल खाता वज़न नहीं';

  @override
  String get logFirstWeight =>
      'अपना रुझान ट्रैक करना शुरू करने के लिए पहला वज़न लॉग करें।';

  @override
  String noWeightSearchMatches(String search) {
    return '“$search” से कुछ भी मेल नहीं खाता। सभी प्रविष्टियाँ देखने के लिए खोज साफ़ करें।';
  }

  @override
  String get logWeight => 'वज़न लॉग करें';

  @override
  String get weightTrend => 'वज़न का रुझान';

  @override
  String get weightTrendSubtitle => 'हाल के माप और समग्र दिशा';

  @override
  String get bodyWeight => 'शरीर का वज़न';

  @override
  String get options => 'विकल्प';

  @override
  String get day => 'दिन';

  @override
  String get today => 'आज';

  @override
  String get week => 'सप्ताह';

  @override
  String get month => 'महीना';

  @override
  String get year => 'वर्ष';

  @override
  String get dateRange => 'तारीख़ सीमा';

  @override
  String get startDate => 'प्रारंभ तारीख़';

  @override
  String get stopDate => 'समाप्ति तारीख़';

  @override
  String get dataPoints => 'डेटा बिंदु';

  @override
  String get customizeFields => 'फ़ील्ड अनुकूलित करें';

  @override
  String get language => 'भाषा';

  @override
  String get languageSubtitle => 'FitBook में इस्तेमाल होने वाली भाषा चुनें';

  @override
  String get languageSystem => 'सिस्टम';

  @override
  String get languageEnglish => 'अंग्रेज़ी';

  @override
  String get languageSpanish => 'स्पेनिश';

  @override
  String get languageFrench => 'फ़्रेंच';

  @override
  String get languageGerman => 'जर्मन';

  @override
  String get languageItalian => 'इतालवी';

  @override
  String get languagePortugueseBrazil => 'पुर्तगाली (ब्राज़ील)';

  @override
  String get languageDutch => 'डच';

  @override
  String get languagePolish => 'पोलिश';

  @override
  String get languageJapanese => 'जापानी';

  @override
  String get languageKorean => 'कोरियाई';

  @override
  String get languageChineseSimplified => 'चीनी (सरलीकृत)';

  @override
  String get languageChineseTraditional => 'चीनी (पारंपरिक)';

  @override
  String get languageRussian => 'रूसी';

  @override
  String get languageHindi => 'हिन्दी';

  @override
  String get appearanceSettings => 'दिखावट सेटिंग्स';

  @override
  String get delete => 'हटाएँ';

  @override
  String get confirmDelete => 'हटाने की पुष्टि करें';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'क्या आप वाकई $count रिकॉर्ड हटाना चाहते हैं? यह कार्रवाई वापस नहीं की जा सकती।',
      one:
          'क्या आप वाकई 1 रिकॉर्ड हटाना चाहते हैं? यह कार्रवाई वापस नहीं की जा सकती।',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'रद्द करें';

  @override
  String get search => 'खोजें...';

  @override
  String get clear => 'साफ़ करें';

  @override
  String get showMenu => 'मेन्यू दिखाएँ';

  @override
  String get selectAll => 'सभी चुनें';

  @override
  String get edit => 'संपादित करें';

  @override
  String get favorite => 'पसंदीदा';

  @override
  String get atLeastOneTab => 'कम से कम एक टैब आवश्यक है';

  @override
  String get scrollableTabs => 'स्क्रॉल करने योग्य टैब';

  @override
  String get save => 'सहेजें';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeDark => 'गहरा';

  @override
  String get themeLight => 'हल्का';

  @override
  String get pureBlackAmoled => 'शुद्ध काला (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'AMOLED डिस्प्ले के लिए शुद्ध काले रंग इस्तेमाल करें';

  @override
  String get systemColorScheme => 'सिस्टम रंग योजना';

  @override
  String get systemColorSchemeTooltip =>
      'ऐप के लिए अपने डिवाइस का प्राथमिक रंग इस्तेमाल करें';

  @override
  String get showImages => 'चित्र दिखाएँ';

  @override
  String get showImagesTooltip =>
      'डायरी और भोजन पेजों पर चित्र चुनें और दिखाएँ';

  @override
  String get curveLineGraphs => 'घुमावदार रेखा ग्राफ़';

  @override
  String get curveLineGraphsTooltip =>
      'ग्राफ़ पेज पर चिकनी वक्र रेखाएँ इस्तेमाल करें';

  @override
  String get weightStatCards => 'वज़न आँकड़ा कार्ड';

  @override
  String get weightStatCardsTooltip =>
      'डिफ़ॉल्ट सूची की जगह वज़न प्रविष्टियों को आँकड़ा कार्ड के ग्रिड के रूप में दिखाएँ';

  @override
  String get graphsStartAtZero => 'ग्राफ़ शून्य से शुरू हों';

  @override
  String get graphsStartAtZeroTooltip =>
      'ग्राफ़ की y-अक्ष हमेशा शून्य से शुरू करें';

  @override
  String get navigationAnimation => 'नेविगेशन एनीमेशन';

  @override
  String get animationFade => 'फेड';

  @override
  String get animationZoom => 'ज़ूम';

  @override
  String get animationSlide => 'स्लाइड';

  @override
  String get animationRise => 'ऊपर उठना';

  @override
  String get animationNone => 'कोई नहीं';

  @override
  String longDateFormat(String example) {
    return 'लंबा तारीख़ प्रारूप ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'छोटा तारीख़ प्रारूप ($example)';
  }

  @override
  String get diarySettings => 'डायरी सेटिंग्स';

  @override
  String get diaryUnit => 'डायरी इकाई';

  @override
  String get diarySummary => 'डायरी सारांश';

  @override
  String get diarySummaryDivision => 'विभाजन - वर्तमान / कुल';

  @override
  String get diarySummaryRemaining => 'शेष';

  @override
  String get diarySummaryBoth => 'दोनों - शेष (कुल)';

  @override
  String get diarySummaryNone => 'कोई नहीं';

  @override
  String get dailyCaloriesKcal => 'दैनिक कैलोरी (kcal)';

  @override
  String get dailyProteinG => 'दैनिक प्रोटीन (g)';

  @override
  String get dailyFatG => 'दैनिक वसा (g)';

  @override
  String get dailyCarbsG => 'दैनिक कार्ब्स (g)';

  @override
  String get dailyFiberG => 'दैनिक फ़ाइबर (g)';

  @override
  String get automaticDailies => 'स्वचालित दैनिक लक्ष्य';

  @override
  String get automaticDailiesTooltip =>
      'अपने शरीर के वज़न से सुझाई गई दैनिक कैलोरी, प्रोटीन, वसा और कार्ब्स अपने-आप गणना करें';

  @override
  String get selectNameOnSubmit => 'सबमिट करने पर नाम चुनें';

  @override
  String get reminders => 'रिमाइंडर';

  @override
  String get foodSettings => 'भोजन सेटिंग्स';

  @override
  String get foodUnit => 'भोजन इकाई';

  @override
  String get fields => 'फ़ील्ड';

  @override
  String get favoriteNewFoods => 'नए भोजन को पसंदीदा बनाएँ';

  @override
  String get pickFields => 'फ़ील्ड चुनें';

  @override
  String get all => 'सभी';

  @override
  String get onlySelected => 'केवल चुने हुए';

  @override
  String get weightSettings => 'वज़न सेटिंग्स';

  @override
  String get targetWeight => 'लक्ष्य वज़न';

  @override
  String get positiveReinforcement => 'सकारात्मक प्रोत्साहन';

  @override
  String get positiveReinforcementPreview =>
      'प्रोत्साहन संदेश इस तरह दिखाए जाएँगे!';

  @override
  String get dataSettings => 'डेटा सेटिंग्स';

  @override
  String get automaticBackup => 'स्वचालित बैकअप';

  @override
  String get shareDatabase => 'डेटाबेस साझा करें';

  @override
  String get openNotification => 'सूचना खोलें';

  @override
  String get automaticBackupsEnabled => 'स्वचालित बैकअप चालू हैं';

  @override
  String get automaticBackupBody =>
      'FitBook हर दिन चुने हुए फ़ोल्डर में आपके डेटा और चित्रों का अपने-आप बैकअप बनाएगा।';

  @override
  String get backupSettings => 'बैकअप सेटिंग्स';

  @override
  String get backupSettingsChannelDescription =>
      'स्वचालित बैकअप के बारे में सूचनाएँ';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'उपयोगकर्ता नाम';

  @override
  String get password => 'पासवर्ड';

  @override
  String get close => 'बंद करें';

  @override
  String get loggedIn => 'लॉग इन';

  @override
  String get about => 'परिचय';

  @override
  String get version => 'संस्करण';

  @override
  String get whatsNew => 'नया क्या है?';

  @override
  String get author => 'लेखक';

  @override
  String get license => 'लाइसेंस';

  @override
  String get donate => 'दान करें';

  @override
  String get supportProject => 'इस परियोजना का समर्थन करें';

  @override
  String get leaveReview => 'समीक्षा दें';

  @override
  String get rateOnPlayStore => 'Play Store पर FitBook को रेट करें';

  @override
  String get sourceCode => 'स्रोत कोड';

  @override
  String get foods => 'भोजन';

  @override
  String get backup => 'बैकअप';

  @override
  String get exportData => 'डेटा एक्सपोर्ट करें';

  @override
  String get importData => 'डेटा इम्पोर्ट करें';

  @override
  String get failedImportData => 'डेटा इम्पोर्ट नहीं हो सका';

  @override
  String get copyError => 'त्रुटि कॉपी करें';

  @override
  String get deleteRecords => 'रिकॉर्ड हटाएँ';

  @override
  String get unusedFood => 'अप्रयुक्त भोजन';

  @override
  String get database => 'डेटाबेस';

  @override
  String get deleteAllWeightsConfirm =>
      'क्या आप वाकई सभी वज़न हटाना चाहते हैं? यह कार्रवाई वापस नहीं की जा सकती।';

  @override
  String get deleteDatabaseConfirm =>
      'क्या आप वाकई अपना डेटाबेस हटाना चाहते हैं? यह कार्रवाई वापस नहीं की जा सकती और आपका सारा डेटा नष्ट हो जाएगा।';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'क्या आप वाकई सभी भोजन और डायरी प्रविष्टियाँ हटाना चाहते हैं? यह कार्रवाई वापस नहीं की जा सकती।';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'क्या आप वाकई $count अप्रयुक्त भोजन हटाना चाहते हैं? यह कार्रवाई वापस नहीं की जा सकती।',
      one:
          'क्या आप वाकई 1 अप्रयुक्त भोजन हटाना चाहते हैं? यह कार्रवाई वापस नहीं की जा सकती।',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'क्या आप वाकई सभी डायरी प्रविष्टियाँ हटाना चाहते हैं? यह कार्रवाई वापस नहीं की जा सकती।';

  @override
  String get ok => 'ठीक है';

  @override
  String get replaceImage => 'चित्र बदलें';

  @override
  String get takePhoto => 'फ़ोटो लें';

  @override
  String get deleteImage => 'चित्र हटाएँ';

  @override
  String get filters => 'फ़िल्टर';

  @override
  String get foodGroup => 'भोजन समूह';

  @override
  String get exampleFruit => 'फल';

  @override
  String clearFiltersCount(int count) {
    return 'साफ़ करें ($count)';
  }

  @override
  String get done => 'हो गया';

  @override
  String get showFilters => 'फ़िल्टर दिखाएँ';

  @override
  String get repeatEntry => 'प्रविष्टि दोहराएँ';

  @override
  String get timeOfDay => 'दिन का समय';

  @override
  String get everyDay => 'हर दिन';

  @override
  String get repeatEveryDayForYear =>
      'अगले एक वर्ष तक हर दिन यह प्रविष्टि बनाएँ';

  @override
  String get repeatOn => 'इन दिनों दोहराएँ';

  @override
  String get weekdayMon => 'सोम';

  @override
  String get weekdayTue => 'मंगल';

  @override
  String get weekdayWed => 'बुध';

  @override
  String get weekdayThu => 'गुरु';

  @override
  String get weekdayFri => 'शुक्र';

  @override
  String get weekdaySat => 'शनि';

  @override
  String get weekdaySun => 'रवि';

  @override
  String get schedule => 'शेड्यूल';

  @override
  String get enterValidNutritionValues => 'मान्य पोषण मान दर्ज करें';

  @override
  String get quickAddTitle => 'त्वरित जोड़ें';

  @override
  String get kilojoules => 'किलोजूल';

  @override
  String get createdDate => 'बनाने की तारीख़';

  @override
  String get failedMigrations => 'माइग्रेशन विफल';

  @override
  String get failedMigrationsDescription =>
      'डेटाबेस बनाते या अपग्रेड करते समय कुछ गड़बड़ हुई। आम तौर पर रिकॉर्ड हटाकर और फिर से बनाकर इसे ठीक किया जा सकता है।';

  @override
  String get errorMessage => 'त्रुटि संदेश:';

  @override
  String get createIssue => 'समस्या रिपोर्ट बनाएँ';

  @override
  String get cameraPermissionRequired =>
      'स्कैन करने के लिए कैमरा अनुमति आवश्यक है।';

  @override
  String get scanFoodBarcode => 'भोजन का बारकोड स्कैन करें';

  @override
  String get holdBarcodeInFrame => 'बारकोड को फ़्रेम के अंदर रखें';

  @override
  String get pinchToZoom => 'ज़ूम करने के लिए पिंच करें';

  @override
  String get cameraStartFailed => 'कैमरा शुरू नहीं हो सका';

  @override
  String get editDiaryEntry => 'डायरी प्रविष्टि संपादित करें';

  @override
  String get addFoodToDiary => 'डायरी में भोजन जोड़ें';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'क्या आप वाकई $name को हटाना चाहते हैं?';
  }

  @override
  String get imageError => 'चित्र त्रुटि';

  @override
  String get setImage => 'चित्र सेट करें';

  @override
  String get name => 'नाम';

  @override
  String get searchFoodsAndMeals => 'भोजन और मील खोजें...';

  @override
  String get clearSelection => 'चयन साफ़ करें';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'बारकोड नहीं मिला। जोड़ने के लिए सहेजें।';

  @override
  String searchOpenFoodFactsFor(String name) {
    return '\"$name\" के लिए OpenFoodFacts खोजें';
  }

  @override
  String get meal => 'मील';

  @override
  String get quantity => 'मात्रा';

  @override
  String get unit => 'इकाई';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'सर्विंग ($amount $unit)';
  }

  @override
  String get barcode => 'बारकोड';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (प्रति $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return 'प्रति $quantity $unit में $nutrient';
  }

  @override
  String get fiber => 'फ़ाइबर';

  @override
  String get unitServing => 'सर्विंग';

  @override
  String get unitGrams => 'ग्राम';

  @override
  String get unitMilliliters => 'मिलीलीटर';

  @override
  String get unitKilojoules => 'किलोजूल';

  @override
  String get unitCups => 'कप';

  @override
  String get unitTablespoons => 'बड़ा चम्मच';

  @override
  String get unitMilligrams => 'मिलीग्राम';

  @override
  String get unitTeaspoons => 'छोटा चम्मच';

  @override
  String get unitOunces => 'औंस';

  @override
  String get unitPounds => 'पाउंड';

  @override
  String get unitKilograms => 'किलोग्राम';

  @override
  String get unitLiters => 'लीटर';

  @override
  String get nameConflict => 'नाम टकराव';

  @override
  String get replaceExistingFood =>
      'इस नाम का भोजन पहले से मौजूद है। क्या आप पुराने भोजन को बदलना चाहते हैं?';

  @override
  String get no => 'नहीं';

  @override
  String get yes => 'हाँ';

  @override
  String get editFood => 'भोजन संपादित करें';

  @override
  String confirmDeleteFood(String name) {
    return 'क्या आप वाकई $name को हटाना चाहते हैं?';
  }

  @override
  String get caloriesKcal => 'कैलोरी (kcal)';

  @override
  String get kilojoulesKj => 'किलोजूल (kJ)';

  @override
  String get servingSize => 'सर्विंग आकार';

  @override
  String get servingUnit => 'सर्विंग इकाई';

  @override
  String get saveAsNewCopy => 'नई कॉपी के रूप में सहेजें';

  @override
  String get filterFoods => 'भोजन फ़िल्टर करें';

  @override
  String get narrowFoodsFilters =>
      'फ़िल्टरों के किसी भी संयोजन से सूची को सीमित करें।';

  @override
  String get foodDetails => 'भोजन विवरण';

  @override
  String get exampleFruitHint => 'जैसे, फल';

  @override
  String get servingSizeRangeHint => 'न्यूनतम, अधिकतम या दोनों सेट करें।';

  @override
  String get minimum => 'न्यूनतम';

  @override
  String get maximum => 'अधिकतम';

  @override
  String get noMinimum => 'कोई न्यूनतम नहीं';

  @override
  String get noMaximum => 'कोई अधिकतम नहीं';

  @override
  String get clearAll => 'सभी साफ़ करें';

  @override
  String get searchOpenFoodFacts => 'Open Food Facts खोजें';

  @override
  String get noMatchingProducts => 'कोई मेल खाता उत्पाद नहीं';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'कोई दूसरा नाम आज़माएँ या बारकोड स्कैन करें।';

  @override
  String get enterFoodNameToSearch =>
      'ऊपर भोजन का नाम दर्ज करें, फिर खोजने के लिए सबमिट करें।';

  @override
  String get submitToSearch => 'खोजने के लिए सबमिट करें...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g प्रोटीन';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count भोजन संपादित करें',
      one: '1 भोजन संपादित करें',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'मील संपादित करें';

  @override
  String get addImage => 'चित्र जोड़ें';

  @override
  String get noFoodsInMeal => 'इस मील में अभी कोई भोजन नहीं है';

  @override
  String get addFoodToMealHint => 'यह मील बनाना शुरू करने के लिए भोजन जोड़ें।';

  @override
  String get remove => 'हटाएँ';

  @override
  String get searchFoods => 'भोजन खोजें...';

  @override
  String get noFoodsFound => 'कोई भोजन नहीं मिला';

  @override
  String nothingMatchesSearch(String search) {
    return '“$search” से कुछ भी मेल नहीं खाता।';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'मील में जोड़ने से पहले अपनी लाइब्रेरी में कुछ भोजन जोड़ें।';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'अभी कोई डेटा नहीं';

  @override
  String get completePlansToViewGraphs =>
      'यहाँ ग्राफ़ देखने के लिए कुछ योजनाएँ पूरी करें।';

  @override
  String get value => 'मान';

  @override
  String get goal => 'लक्ष्य';

  @override
  String get notSet => 'सेट नहीं';

  @override
  String get trend => 'रुझान';

  @override
  String get smooth => 'स्मूद';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-बिंदु औसत',
      one: '1-बिंदु औसत',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'वज़न संपादित करें';

  @override
  String get addWeight => 'वज़न जोड़ें';

  @override
  String shareWeight(String value, String unit) {
    return 'मैंने अभी $value $unit वज़न मापा!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'वज़न ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'कृपया वज़न दर्ज करें';

  @override
  String get pleaseEnterValidWeight => 'कृपया मान्य वज़न दर्ज करें';

  @override
  String get lastWeight => 'पिछला वज़न';

  @override
  String unitWithValue(String unit) {
    return 'इकाई ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'इकाई $unit ही रखें';
  }

  @override
  String convertToUnit(String unit) {
    return '$unit में बदलें';
  }

  @override
  String get removeImage => 'चित्र हटाएँ';

  @override
  String get mealRemindersEnabled => 'मील रिमाइंडर चालू हैं';

  @override
  String get mealRemindersEnabledBody =>
      'अगर आपने नाश्ता, दोपहर का भोजन या रात का खाना लॉग नहीं किया है, तो हम आपको याद दिलाएँगे।';

  @override
  String get reminderSettingsChannel => 'रिमाइंडर सेटिंग्स';

  @override
  String get reminderSettingsChannelDescription =>
      'FitBook रिमाइंडर समझाने वाली सूचनाएँ';

  @override
  String get breakfastReminderTitle => 'नाश्ता लॉग करना न भूलें';

  @override
  String get breakfastRemindersChannel => 'नाश्ता रिमाइंडर';

  @override
  String get breakfastRemindersChannelDescription =>
      'नाश्ता लॉग करने के रिमाइंडर';

  @override
  String get lunchReminderTitle => 'दोपहर का भोजन लॉग करना न भूलें';

  @override
  String get lunchRemindersChannel => 'दोपहर के भोजन के रिमाइंडर';

  @override
  String get lunchRemindersChannelDescription =>
      'दोपहर का भोजन लॉग करने के रिमाइंडर';

  @override
  String get dinnerReminderTitle => 'रात का खाना लॉग करना न भूलें';

  @override
  String get dinnerRemindersChannel => 'रात के खाने के रिमाइंडर';

  @override
  String get dinnerRemindersChannelDescription =>
      'रात का खाना लॉग करने के रिमाइंडर';

  @override
  String get reinforcementGreatJob => 'बहुत बढ़िया! आपकी मेहनत रंग ला रही है।';

  @override
  String get reinforcementKeepItUp =>
      'ऐसे ही जारी रखें! आप शानदार प्रगति कर रहे हैं।';

  @override
  String get reinforcementFantastic =>
      'शानदार! आपकी लगन के परिणाम दिख रहे हैं।';

  @override
  String get reinforcementWellDone =>
      'बहुत अच्छा! आप अपने लक्ष्य के एक कदम और करीब हैं।';

  @override
  String get reinforcementImpressive =>
      'प्रभावशाली! आपकी कोशिशें फल दे रही हैं।';

  @override
  String get reinforcementAmazing => 'कमाल! आप सही रास्ते पर हैं।';

  @override
  String get reinforcementBravo => 'वाह! आपकी प्रतिबद्धता सराहनीय है।';

  @override
  String get reinforcementExcellent => 'उत्कृष्ट! आपकी दृढ़ता प्रेरणादायक है।';

  @override
  String get reinforcementSuperb => 'बहुत बढ़िया! आप शानदार काम कर रहे हैं।';

  @override
  String get reinforcementIncredible =>
      'अविश्वसनीय! आपकी प्रगति साफ़ दिख रही है।';

  @override
  String get reinforcementWayToGoKing => 'शाबाश, किंग';

  @override
  String get reinforcementYeahBuddy => 'हाँ दोस्त!';

  @override
  String get reinforcementThatsHowItsDone => 'ऐसे ही किया जाता है।';

  @override
  String get reinforcementEasyAsPie => 'बहुत आसान।';

  @override
  String get reinforcementDoingGreat => 'आप बहुत अच्छा कर रहे हैं।';

  @override
  String get reinforcementProgressNice =>
      'क्या यह प्रगति है जो मुझे दिख रही है? बढ़िया।';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return '$remaining $unit शेष';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return '$remaining $unit शेष ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'शर्करा';

  @override
  String get nutrientCholesterol => 'कोलेस्ट्रॉल';

  @override
  String get nutrientSaturatedFat => 'संतृप्त वसा';

  @override
  String get nutrientCalcium => 'कैल्शियम';

  @override
  String get nutrientIron => 'आयरन';

  @override
  String get nutrientPotassium => 'पोटैशियम';

  @override
  String get nutrientMagnesium => 'मैग्नीशियम';

  @override
  String get nutrientVitaminA => 'विटामिन A';

  @override
  String get nutrientVitaminC => 'विटामिन C';

  @override
  String get nutrientVitaminB12 => 'विटामिन B12';

  @override
  String get nutrientVitaminD => 'विटामिन D';

  @override
  String get nutrientVitaminE => 'विटामिन E';

  @override
  String get nutrientAddedSugar => 'अतिरिक्त शर्करा';

  @override
  String get nutrientNetCarbs => 'शुद्ध कार्ब्स';

  @override
  String get nutrientWater => 'पानी';

  @override
  String get nutrientOmega3 => 'ओमेगा-3 फैटी एसिड';

  @override
  String get nutrientOmega6 => 'ओमेगा-6 फैटी एसिड';

  @override
  String get nutrientPralScore => 'PRAL स्कोर';

  @override
  String get nutrientTransFat => 'ट्रांस वसा';

  @override
  String get nutrientSolubleFiber => 'घुलनशील फ़ाइबर';

  @override
  String get nutrientInsolubleFiber => 'अघुलनशील फ़ाइबर';

  @override
  String get nutrientPhosphorus => 'फॉस्फोरस';

  @override
  String get nutrientSodium => 'सोडियम';

  @override
  String get nutrientZinc => 'ज़िंक';

  @override
  String get nutrientCopper => 'कॉपर';

  @override
  String get nutrientManganese => 'मैंगनीज़';

  @override
  String get nutrientSelenium => 'सेलेनियम';

  @override
  String get nutrientFluoride => 'फ्लोराइड';

  @override
  String get nutrientMolybdenum => 'मोलिब्डेनम';

  @override
  String get nutrientChloride => 'क्लोराइड';

  @override
  String get nutrientSucrose => 'सुक्रोज़';

  @override
  String get nutrientGlucose => 'ग्लूकोज़';

  @override
  String get nutrientFructose => 'फ्रुक्टोज़';

  @override
  String get nutrientLactose => 'लैक्टोज़';

  @override
  String get nutrientMaltose => 'माल्टोज़';

  @override
  String get nutrientGalactose => 'गैलेक्टोज़';

  @override
  String get nutrientStarch => 'स्टार्च';

  @override
  String get nutrientSugarAlcohols => 'शुगर अल्कोहल';

  @override
  String get nutrientThiaminB1 => 'थायमिन (B1)';

  @override
  String get nutrientRiboflavinB2 => 'राइबोफ्लेविन (B2)';

  @override
  String get nutrientNiacinB3 => 'नायसिन (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'पैंटोथेनिक एसिड (B5)';

  @override
  String get nutrientVitaminB6 => 'विटामिन B6';

  @override
  String get nutrientBiotinB7 => 'बायोटिन (B7)';

  @override
  String get nutrientFolateB9 => 'फोलेट (B9)';

  @override
  String get nutrientFolicAcid => 'फोलिक एसिड';

  @override
  String get nutrientFoodFolate => 'भोजन फोलेट';

  @override
  String get nutrientFolateDfe => 'डाइटरी फोलेट समतुल्य (DFE)';

  @override
  String get nutrientCholine => 'कोलीन';

  @override
  String get nutrientBetaine => 'बीटेन';

  @override
  String get nutrientRetinol => 'रेटिनॉल';

  @override
  String get nutrientBetaCarotene => 'बीटा-कैरोटीन';

  @override
  String get nutrientAlphaCarotene => 'अल्फ़ा-कैरोटीन';

  @override
  String get nutrientLycopene => 'लाइकोपीन';

  @override
  String get nutrientLuteinZeaxanthin => 'ल्यूटिन + ज़ीएक्सैंथिन';

  @override
  String get nutrientVitaminD2 => 'विटामिन D2 (एर्गोकैल्सीफेरॉल)';

  @override
  String get nutrientVitaminD3 => 'विटामिन D3 (कोलेकैल्सीफेरॉल)';

  @override
  String get nutrientVitaminK => 'विटामिन K';

  @override
  String get nutrientDihydrophylloquinone => 'डाइहाइड्रोफाइलोक्विनोन';

  @override
  String get nutrientMenaquinone4 => 'मेनाक्विनोन-4';

  @override
  String get nutrientMonounsaturatedFat => 'मोनोअनसैचुरेटेड वसा';

  @override
  String get nutrientPolyunsaturatedFat => 'पॉलीअनसैचुरेटेड वसा';

  @override
  String get nutrientAla => 'अल्फ़ा-लिनोलेनिक एसिड (ALA)';

  @override
  String get nutrientEpa => 'इकोसापेंटेनोइक एसिड (EPA)';

  @override
  String get nutrientDpa => 'डोकोसापेंटेनोइक एसिड (DPA)';

  @override
  String get nutrientDha => 'डोकोसाहेक्साएनोइक एसिड (DHA)';

  @override
  String get nutrientAlanine => 'एलानिन';

  @override
  String get nutrientAlcohol => 'अल्कोहल';

  @override
  String get nutrientArginine => 'आर्जिनिन';

  @override
  String get nutrientAsparticAcid => 'एस्पार्टिक एसिड';

  @override
  String get nutrientCystine => 'सिस्टिन';

  @override
  String get nutrientGlutamicAcid => 'ग्लूटामिक एसिड';

  @override
  String get nutrientGlycine => 'ग्लाइसिन';

  @override
  String get nutrientHistidine => 'हिस्टिडिन';

  @override
  String get nutrientHydroxyproline => 'हाइड्रॉक्सीप्रोलिन';

  @override
  String get nutrientIsoleucine => 'आइसोल्यूसीन';

  @override
  String get nutrientLeucine => 'ल्यूसीन';

  @override
  String get nutrientLysine => 'लाइसिन';

  @override
  String get nutrientMethionine => 'मेथियोनीन';

  @override
  String get nutrientPhenylalanine => 'फेनिलएलानिन';

  @override
  String get nutrientProline => 'प्रोलिन';

  @override
  String get nutrientSerine => 'सेरीन';

  @override
  String get nutrientThreonine => 'थ्रियोनीन';

  @override
  String get nutrientTryptophan => 'ट्रिप्टोफैन';

  @override
  String get nutrientTyrosine => 'टायरोसीन';

  @override
  String get nutrientValine => 'वेलिन';

  @override
  String get nutrientCaffeine => 'कैफ़ीन';

  @override
  String get nutrientTheobromine => 'थियोब्रोमीन';

  @override
  String servingWeightNumber(int number) {
    return 'सर्विंग वज़न $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'सर्विंग विवरण $number';
  }

  @override
  String get calorieEquivalentWeight200 => '200 kcal के बराबर वज़न';
}
