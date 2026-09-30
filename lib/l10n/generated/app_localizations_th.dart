// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'ไดอารี';

  @override
  String get navGraph => 'กราฟ';

  @override
  String get navFood => 'อาหาร';

  @override
  String get navWeight => 'น้ำหนัก';

  @override
  String get navError => 'ข้อผิดพลาด';

  @override
  String get loadDataFailed => 'โหลดข้อมูลนี้ไม่สำเร็จ';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get invalidTabSettings => 'การตั้งค่าแท็บไม่ถูกต้อง';

  @override
  String newVersion(String version) {
    return 'เวอร์ชันใหม่ $version';
  }

  @override
  String get changes => 'การเปลี่ยนแปลง';

  @override
  String get searchSettings => 'ค้นหาการตั้งค่า...';

  @override
  String get appearance => 'รูปลักษณ์';

  @override
  String get appearanceSubtitle => 'ธีม สี และการแสดงผลกราฟ';

  @override
  String get diary => 'ไดอารี';

  @override
  String get diarySubtitle => 'เป้าหมายรายวัน สรุป และการบันทึก';

  @override
  String get food => 'อาหาร';

  @override
  String get foodSubtitle => 'หน่วยอาหาร ช่องข้อมูล และค่าเริ่มต้น';

  @override
  String get weight => 'น้ำหนัก';

  @override
  String get weightSubtitle => 'หน่วยน้ำหนัก เป้าหมาย และการแสดงผล';

  @override
  String get tabs => 'แท็บ';

  @override
  String get tabsSubtitle => 'แท็บนำทางและลำดับ';

  @override
  String get data => 'ข้อมูล';

  @override
  String get dataSubtitle => 'นำเข้า ส่งออก และข้อมูลในเครื่อง';

  @override
  String get todayProgress => 'ความคืบหน้าวันนี้';

  @override
  String get latestDay => 'วันล่าสุด';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'บันทึก $count รายการ',
      one: 'บันทึก 1 รายการ',
      zero: 'ยังไม่มีรายการที่บันทึก',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'แก้ไข $count รายการ',
      one: 'แก้ไข 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'แคลอรี';

  @override
  String get protein => 'โปรตีน';

  @override
  String get carbs => 'คาร์โบไฮเดรต';

  @override
  String get fat => 'ไขมัน';

  @override
  String get addDiaryEntry => 'เพิ่มรายการไดอารี';

  @override
  String get noEntriesToday => 'วันนี้ยังไม่มีรายการ';

  @override
  String addSearchToDiary(String search) {
    return 'เพิ่ม \"$search\" ลงในไดอารี';
  }

  @override
  String get tapStartLoggingFood => 'แตะเพื่อเริ่มบันทึกอาหาร';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'ไม่พบรายการไดอารีที่ตรงกัน แตะเพื่อสร้างอาหารนี้และบันทึก';

  @override
  String get add => 'เพิ่ม';

  @override
  String get quickAdd => 'เพิ่มด่วน';

  @override
  String get scanBarcode => 'สแกนบาร์โค้ด';

  @override
  String get foodLibrary => 'คลังอาหาร';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: 'อาหาร $foodCount รายการ',
      one: 'อาหาร 1 รายการ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: 'มื้ออาหาร $mealCount รายการ',
      one: 'มื้ออาหาร 1 รายการ',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'ใช้ล่าสุด';

  @override
  String get quickActions => 'การทำงานด่วน';

  @override
  String get addFood => 'เพิ่มอาหาร';

  @override
  String get createMeal => 'สร้างมื้ออาหาร';

  @override
  String get noFoodYet => 'ยังไม่มีอาหาร';

  @override
  String get noMatchingFood => 'ไม่พบอาหารที่ตรงกัน';

  @override
  String get addFirstFoodOrMeal =>
      'เพิ่มอาหารหรือมื้อแรกเพื่อเริ่มสร้างคลังของคุณ';

  @override
  String noFoodSearchMatches(String search) {
    return 'ไม่พบรายการที่ตรงกับ “$search” ล้างการค้นหาเพื่อดูทั้งหมดอีกครั้ง';
  }

  @override
  String get clearSearch => 'ล้างการค้นหา';

  @override
  String get addMeal => 'เพิ่มมื้ออาหาร';

  @override
  String get noWeightsYet => 'ยังไม่มีข้อมูลน้ำหนัก';

  @override
  String get noMatchingWeights => 'ไม่พบน้ำหนักที่ตรงกัน';

  @override
  String get logFirstWeight => 'บันทึกน้ำหนักครั้งแรกเพื่อเริ่มติดตามแนวโน้ม';

  @override
  String noWeightSearchMatches(String search) {
    return 'ไม่พบรายการที่ตรงกับ “$search” ล้างการค้นหาเพื่อดูรายการทั้งหมด';
  }

  @override
  String get logWeight => 'บันทึกน้ำหนัก';

  @override
  String get weightTrend => 'แนวโน้มน้ำหนัก';

  @override
  String get weightTrendSubtitle => 'การวัดล่าสุดและแนวโน้มโดยรวม';

  @override
  String get bodyWeight => 'น้ำหนักตัว';

  @override
  String get options => 'ตัวเลือก';

  @override
  String get day => 'วัน';

  @override
  String get today => 'วันนี้';

  @override
  String get week => 'สัปดาห์';

  @override
  String get month => 'เดือน';

  @override
  String get year => 'ปี';

  @override
  String get dateRange => 'ช่วงวันที่';

  @override
  String get startDate => 'วันที่เริ่ม';

  @override
  String get stopDate => 'วันที่สิ้นสุด';

  @override
  String get dataPoints => 'จุดข้อมูล';

  @override
  String get customizeFields => 'ปรับแต่งช่องข้อมูล';

  @override
  String get language => 'ภาษา';

  @override
  String get languageSubtitle => 'เลือกภาษาที่ FitBook ใช้';

  @override
  String get languageSystem => 'ระบบ';

  @override
  String get languageEnglish => 'อังกฤษ';

  @override
  String get languageSpanish => 'สเปน';

  @override
  String get languageFrench => 'ฝรั่งเศส';

  @override
  String get languageGerman => 'เยอรมัน';

  @override
  String get languageItalian => 'อิตาลี';

  @override
  String get languagePortugueseBrazil => 'โปรตุเกส (บราซิล)';

  @override
  String get languageDutch => 'ดัตช์';

  @override
  String get languagePolish => 'โปแลนด์';

  @override
  String get languageJapanese => 'ญี่ปุ่น';

  @override
  String get languageKorean => 'เกาหลี';

  @override
  String get languageChineseSimplified => 'จีน (ตัวย่อ)';

  @override
  String get languageChineseTraditional => 'จีน (ตัวเต็ม)';

  @override
  String get languageRussian => 'รัสเซีย';

  @override
  String get languageHindi => 'ฮินดี';

  @override
  String get languageIndonesian => 'อินโดนีเซีย';

  @override
  String get languageVietnamese => 'เวียดนาม';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageBengali => 'เบงกาลี';

  @override
  String get appearanceSettings => 'การตั้งค่ารูปลักษณ์';

  @override
  String get delete => 'ลบ';

  @override
  String get confirmDelete => 'ยืนยันการลบ';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ต้องการลบ $count ระเบียนหรือไม่? การดำเนินการนี้ย้อนกลับไม่ได้',
      one: 'ต้องการลบ 1 ระเบียนหรือไม่? การดำเนินการนี้ย้อนกลับไม่ได้',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get search => 'ค้นหา...';

  @override
  String get clear => 'ล้าง';

  @override
  String get showMenu => 'แสดงเมนู';

  @override
  String get selectAll => 'เลือกทั้งหมด';

  @override
  String get edit => 'แก้ไข';

  @override
  String get favorite => 'รายการโปรด';

  @override
  String get atLeastOneTab => 'ต้องมีอย่างน้อยหนึ่งแท็บ';

  @override
  String get scrollableTabs => 'แท็บแบบเลื่อนได้';

  @override
  String get save => 'บันทึก';

  @override
  String get themeSystem => 'ระบบ';

  @override
  String get themeDark => 'มืด';

  @override
  String get themeLight => 'สว่าง';

  @override
  String get pureBlackAmoled => 'ดำสนิท (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => 'ใช้สีดำสนิทสำหรับจอ AMOLED';

  @override
  String get systemColorScheme => 'ชุดสีของระบบ';

  @override
  String get systemColorSchemeTooltip => 'ใช้สีหลักของอุปกรณ์กับแอป';

  @override
  String get showImages => 'แสดงรูปภาพ';

  @override
  String get showImagesTooltip => 'เลือกรูปและแสดงในหน้าไดอารีและอาหาร';

  @override
  String get curveLineGraphs => 'กราฟเส้นโค้ง';

  @override
  String get curveLineGraphsTooltip => 'ใช้เส้นโค้งแบบเรียบในหน้ากราฟ';

  @override
  String get weightStatCards => 'การ์ดสถิติน้ำหนัก';

  @override
  String get weightStatCardsTooltip =>
      'แสดงรายการน้ำหนักเป็นตารางการ์ดสถิติแทนรายการเริ่มต้น';

  @override
  String get graphsStartAtZero => 'ให้กราฟเริ่มที่ศูนย์';

  @override
  String get graphsStartAtZeroTooltip => 'ให้แกน y ของกราฟเริ่มที่ศูนย์เสมอ';

  @override
  String get navigationAnimation => 'แอนิเมชันการนำทาง';

  @override
  String get animationFade => 'จาง';

  @override
  String get animationZoom => 'ซูม';

  @override
  String get animationSlide => 'เลื่อน';

  @override
  String get animationRise => 'ยกขึ้น';

  @override
  String get animationNone => 'ไม่มี';

  @override
  String longDateFormat(String example) {
    return 'รูปแบบวันที่แบบยาว ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'รูปแบบวันที่แบบสั้น ($example)';
  }

  @override
  String get diarySettings => 'การตั้งค่าไดอารี';

  @override
  String get diaryUnit => 'หน่วยไดอารี';

  @override
  String get diarySummary => 'สรุปไดอารี';

  @override
  String get diarySummaryDivision => 'หาร - ปัจจุบัน / ทั้งหมด';

  @override
  String get diarySummaryRemaining => 'คงเหลือ';

  @override
  String get diarySummaryBoth => 'ทั้งคู่ - คงเหลือ (ทั้งหมด)';

  @override
  String get diarySummaryNone => 'ไม่มี';

  @override
  String get dailyCaloriesKcal => 'แคลอรีต่อวัน (kcal)';

  @override
  String get dailyProteinG => 'โปรตีนต่อวัน (g)';

  @override
  String get dailyFatG => 'ไขมันต่อวัน (g)';

  @override
  String get dailyCarbsG => 'คาร์โบไฮเดรตต่อวัน (g)';

  @override
  String get dailyFiberG => 'ใยอาหารต่อวัน (g)';

  @override
  String get automaticDailies => 'เป้าหมายรายวันอัตโนมัติ';

  @override
  String get automaticDailiesTooltip =>
      'คำนวณแคลอรี โปรตีน ไขมัน และคาร์โบไฮเดรตที่แนะนำต่อวันจากน้ำหนักตัวโดยอัตโนมัติ';

  @override
  String get selectNameOnSubmit => 'เลือกชื่อเมื่อส่ง';

  @override
  String get reminders => 'การแจ้งเตือน';

  @override
  String get foodSettings => 'การตั้งค่าอาหาร';

  @override
  String get foodUnit => 'หน่วยอาหาร';

  @override
  String get fields => 'ช่องข้อมูล';

  @override
  String get favoriteNewFoods => 'เพิ่มอาหารใหม่เป็นรายการโปรด';

  @override
  String get pickFields => 'เลือกช่องข้อมูล';

  @override
  String get all => 'ทั้งหมด';

  @override
  String get onlySelected => 'เฉพาะที่เลือก';

  @override
  String get weightSettings => 'การตั้งค่าน้ำหนัก';

  @override
  String get targetWeight => 'น้ำหนักเป้าหมาย';

  @override
  String get positiveReinforcement => 'ข้อความให้กำลังใจ';

  @override
  String get positiveReinforcementPreview => 'ข้อความให้กำลังใจจะแสดงแบบนี้!';

  @override
  String get dataSettings => 'การตั้งค่าข้อมูล';

  @override
  String get automaticBackup => 'สำรองข้อมูลอัตโนมัติ';

  @override
  String get shareDatabase => 'แชร์ฐานข้อมูล';

  @override
  String get openNotification => 'เปิดการแจ้งเตือน';

  @override
  String get automaticBackupsEnabled => 'เปิดการสำรองข้อมูลอัตโนมัติแล้ว';

  @override
  String get automaticBackupBody =>
      'FitBook จะสำรองข้อมูลและรูปภาพไปยังโฟลเดอร์ที่เลือกโดยอัตโนมัติทุกวัน';

  @override
  String get backupSettings => 'การตั้งค่าการสำรองข้อมูล';

  @override
  String get backupSettingsChannelDescription =>
      'การแจ้งเตือนเกี่ยวกับการสำรองข้อมูลอัตโนมัติ';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'ชื่อผู้ใช้';

  @override
  String get password => 'รหัสผ่าน';

  @override
  String get close => 'ปิด';

  @override
  String get loggedIn => 'เข้าสู่ระบบแล้ว';

  @override
  String get about => 'เกี่ยวกับ';

  @override
  String get version => 'เวอร์ชัน';

  @override
  String get whatsNew => 'มีอะไรใหม่?';

  @override
  String get author => 'ผู้เขียน';

  @override
  String get license => 'สัญญาอนุญาต';

  @override
  String get donate => 'บริจาค';

  @override
  String get supportProject => 'ช่วยสนับสนุนโปรเจกต์นี้';

  @override
  String get leaveReview => 'เขียนรีวิว';

  @override
  String get rateOnPlayStore => 'ให้คะแนน FitBook บน Play Store';

  @override
  String get sourceCode => 'ซอร์สโค้ด';

  @override
  String get foods => 'อาหาร';

  @override
  String get backup => 'สำรองข้อมูล';

  @override
  String get exportData => 'ส่งออกข้อมูล';

  @override
  String get importData => 'นำเข้าข้อมูล';

  @override
  String get failedImportData => 'นำเข้าข้อมูลไม่สำเร็จ';

  @override
  String get copyError => 'คัดลอกข้อผิดพลาด';

  @override
  String get deleteRecords => 'ลบระเบียน';

  @override
  String get unusedFood => 'อาหารที่ไม่ได้ใช้';

  @override
  String get database => 'ฐานข้อมูล';

  @override
  String get deleteAllWeightsConfirm =>
      'ต้องการลบน้ำหนักทั้งหมดหรือไม่? การดำเนินการนี้ย้อนกลับไม่ได้';

  @override
  String get deleteDatabaseConfirm =>
      'ต้องการลบฐานข้อมูลของคุณหรือไม่? การดำเนินการนี้ย้อนกลับไม่ได้และจะทำลายข้อมูลทั้งหมด';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'ต้องการลบอาหารและรายการไดอารีทั้งหมดหรือไม่? การดำเนินการนี้ย้อนกลับไม่ได้';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'ต้องการลบอาหารที่ไม่ได้ใช้ $count รายการหรือไม่? การดำเนินการนี้ย้อนกลับไม่ได้',
      one:
          'ต้องการลบอาหารที่ไม่ได้ใช้ 1 รายการหรือไม่? การดำเนินการนี้ย้อนกลับไม่ได้',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'ต้องการลบรายการไดอารีทั้งหมดหรือไม่? การดำเนินการนี้ย้อนกลับไม่ได้';

  @override
  String get ok => 'ตกลง';

  @override
  String get replaceImage => 'เปลี่ยนรูปภาพ';

  @override
  String get takePhoto => 'ถ่ายรูป';

  @override
  String get deleteImage => 'ลบรูปภาพ';

  @override
  String get filters => 'ตัวกรอง';

  @override
  String get foodGroup => 'กลุ่มอาหาร';

  @override
  String get exampleFruit => 'ผลไม้';

  @override
  String clearFiltersCount(int count) {
    return 'ล้าง ($count)';
  }

  @override
  String get done => 'เสร็จสิ้น';

  @override
  String get showFilters => 'แสดงตัวกรอง';

  @override
  String get repeatEntry => 'ทำรายการซ้ำ';

  @override
  String get timeOfDay => 'เวลาของวัน';

  @override
  String get everyDay => 'ทุกวัน';

  @override
  String get repeatEveryDayForYear => 'สร้างรายการนี้ทุกวันตลอดหนึ่งปีถัดไป';

  @override
  String get repeatOn => 'ทำซ้ำในวัน';

  @override
  String get weekdayMon => 'จ.';

  @override
  String get weekdayTue => 'อ.';

  @override
  String get weekdayWed => 'พ.';

  @override
  String get weekdayThu => 'พฤ.';

  @override
  String get weekdayFri => 'ศ.';

  @override
  String get weekdaySat => 'ส.';

  @override
  String get weekdaySun => 'อา.';

  @override
  String get schedule => 'กำหนดเวลา';

  @override
  String get enterValidNutritionValues => 'ใส่ค่าทางโภชนาการที่ถูกต้อง';

  @override
  String get quickAddTitle => 'เพิ่มด่วน';

  @override
  String get kilojoules => 'กิโลจูล';

  @override
  String get createdDate => 'วันที่สร้าง';

  @override
  String get failedMigrations => 'การย้ายฐานข้อมูลล้มเหลว';

  @override
  String get failedMigrationsDescription =>
      'เกิดข้อผิดพลาดขณะสร้างหรืออัปเกรดฐานข้อมูล โดยปกติแก้ได้ด้วยการลบและสร้างระเบียนใหม่';

  @override
  String get errorMessage => 'ข้อความข้อผิดพลาด:';

  @override
  String get createIssue => 'สร้าง issue';

  @override
  String get cameraPermissionRequired => 'ต้องอนุญาตการใช้กล้องเพื่อสแกน';

  @override
  String get scanFoodBarcode => 'สแกนบาร์โค้ดอาหาร';

  @override
  String get holdBarcodeInFrame => 'วางบาร์โค้ดให้อยู่ในกรอบ';

  @override
  String get pinchToZoom => 'จีบนิ้วเพื่อซูม';

  @override
  String get cameraStartFailed => 'ไม่สามารถเปิดกล้องได้';

  @override
  String get editDiaryEntry => 'แก้ไขรายการไดอารี';

  @override
  String get addFoodToDiary => 'เพิ่มอาหารลงไดอารี';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'ต้องการลบ $name หรือไม่?';
  }

  @override
  String get imageError => 'ข้อผิดพลาดของรูปภาพ';

  @override
  String get setImage => 'ตั้งรูปภาพ';

  @override
  String get name => 'ชื่อ';

  @override
  String get searchFoodsAndMeals => 'ค้นหาอาหารและมื้ออาหาร...';

  @override
  String get clearSelection => 'ล้างการเลือก';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'ไม่พบบาร์โค้ด บันทึกเพื่อเพิ่มรายการ';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'ค้นหา OpenFoodFacts สำหรับ \"$name\"';
  }

  @override
  String get meal => 'มื้ออาหาร';

  @override
  String get quantity => 'ปริมาณ';

  @override
  String get unit => 'หน่วย';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'หนึ่งหน่วยบริโภค ($amount $unit)';
  }

  @override
  String get barcode => 'บาร์โค้ด';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (ต่อ $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
    String nutrient,
    String quantity,
    String unit,
  ) {
    return '$nutrient ต่อ $quantity $unit';
  }

  @override
  String get fiber => 'ใยอาหาร';

  @override
  String get unitServing => 'หนึ่งหน่วยบริโภค';

  @override
  String get unitGrams => 'กรัม';

  @override
  String get unitMilliliters => 'มิลลิลิตร';

  @override
  String get unitKilojoules => 'กิโลจูล';

  @override
  String get unitCups => 'ถ้วย';

  @override
  String get unitTablespoons => 'ช้อนโต๊ะ';

  @override
  String get unitMilligrams => 'มิลลิกรัม';

  @override
  String get unitTeaspoons => 'ช้อนชา';

  @override
  String get unitOunces => 'ออนซ์';

  @override
  String get unitPounds => 'ปอนด์';

  @override
  String get unitKilograms => 'กิโลกรัม';

  @override
  String get unitLiters => 'ลิตร';

  @override
  String get nameConflict => 'ชื่อซ้ำ';

  @override
  String get replaceExistingFood =>
      'มีอาหารชื่อนี้อยู่แล้ว ต้องการแทนที่รายการเดิมหรือไม่?';

  @override
  String get no => 'ไม่';

  @override
  String get yes => 'ใช่';

  @override
  String get editFood => 'แก้ไขอาหาร';

  @override
  String confirmDeleteFood(String name) {
    return 'ต้องการลบ $name หรือไม่?';
  }

  @override
  String get caloriesKcal => 'แคลอรี (kcal)';

  @override
  String get kilojoulesKj => 'กิโลจูล (kJ)';

  @override
  String get servingSize => 'ขนาดหนึ่งหน่วยบริโภค';

  @override
  String get servingUnit => 'หน่วยบริโภค';

  @override
  String get saveAsNewCopy => 'บันทึกเป็นสำเนาใหม่';

  @override
  String get filterFoods => 'กรองอาหาร';

  @override
  String get narrowFoodsFilters => 'จำกัดรายการด้วยตัวกรองแบบใดก็ได้ร่วมกัน';

  @override
  String get foodDetails => 'รายละเอียดอาหาร';

  @override
  String get exampleFruitHint => 'เช่น ผลไม้';

  @override
  String get servingSizeRangeHint => 'กำหนดค่าต่ำสุด สูงสุด หรือทั้งสองค่า';

  @override
  String get minimum => 'ต่ำสุด';

  @override
  String get maximum => 'สูงสุด';

  @override
  String get noMinimum => 'ไม่มีค่าต่ำสุด';

  @override
  String get noMaximum => 'ไม่มีค่าสูงสุด';

  @override
  String get clearAll => 'ล้างทั้งหมด';

  @override
  String get searchOpenFoodFacts => 'ค้นหา Open Food Facts';

  @override
  String get noMatchingProducts => 'ไม่พบผลิตภัณฑ์ที่ตรงกัน';

  @override
  String get tryAnotherNameOrScanBarcode => 'ลองชื่ออื่นหรือสแกนบาร์โค้ด';

  @override
  String get enterFoodNameToSearch => 'ใส่ชื่ออาหารด้านบน แล้วส่งเพื่อค้นหา';

  @override
  String get submitToSearch => 'ส่งเพื่อค้นหา...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return 'โปรตีน $value g';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'แก้ไขอาหาร $count รายการ',
      one: 'แก้ไขอาหาร 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'แก้ไขมื้ออาหาร';

  @override
  String get addImage => 'เพิ่มรูปภาพ';

  @override
  String get noFoodsInMeal => 'ยังไม่มีอาหารในมื้อนี้';

  @override
  String get addFoodToMealHint => 'เพิ่มอาหารเพื่อเริ่มสร้างมื้อนี้';

  @override
  String get remove => 'นำออก';

  @override
  String get searchFoods => 'ค้นหาอาหาร...';

  @override
  String get noFoodsFound => 'ไม่พบอาหาร';

  @override
  String nothingMatchesSearch(String search) {
    return 'ไม่พบรายการที่ตรงกับ “$search”';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'เพิ่มอาหารลงในคลังก่อนนำไปเพิ่มในมื้ออาหาร';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'ยังไม่มีข้อมูล';

  @override
  String get completePlansToViewGraphs => 'บันทึกข้อมูลให้ครบเพื่อดูกราฟที่นี่';

  @override
  String get value => 'ค่า';

  @override
  String get goal => 'เป้าหมาย';

  @override
  String get notSet => 'ยังไม่ได้ตั้งค่า';

  @override
  String get trend => 'แนวโน้ม';

  @override
  String get smooth => 'ปรับให้เรียบ';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ค่าเฉลี่ย $count จุด',
      one: 'ค่าเฉลี่ย 1 จุด',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'แก้ไขน้ำหนัก';

  @override
  String get addWeight => 'เพิ่มน้ำหนัก';

  @override
  String shareWeight(String value, String unit) {
    return 'ฉันเพิ่งชั่งได้ $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'น้ำหนัก ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'โปรดใส่น้ำหนัก';

  @override
  String get pleaseEnterValidWeight => 'โปรดใส่น้ำหนักที่ถูกต้อง';

  @override
  String get lastWeight => 'น้ำหนักล่าสุด';

  @override
  String unitWithValue(String unit) {
    return 'หน่วย ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'ใช้หน่วย $unit ต่อไป';
  }

  @override
  String convertToUnit(String unit) {
    return 'แปลงเป็น $unit';
  }

  @override
  String get removeImage => 'นำรูปภาพออก';

  @override
  String get mealRemindersEnabled => 'เปิดการแจ้งเตือนมื้ออาหารแล้ว';

  @override
  String get mealRemindersEnabledBody =>
      'เราจะแจ้งเตือนให้บันทึกอาหารเช้า กลางวัน หรือเย็น หากคุณยังไม่ได้บันทึก';

  @override
  String get reminderSettingsChannel => 'การตั้งค่าการแจ้งเตือน';

  @override
  String get reminderSettingsChannelDescription =>
      'การแจ้งเตือนที่อธิบายการเตือนของ FitBook';

  @override
  String get breakfastReminderTitle => 'อย่าลืมบันทึกอาหารเช้า';

  @override
  String get breakfastRemindersChannel => 'การแจ้งเตือนอาหารเช้า';

  @override
  String get breakfastRemindersChannelDescription => 'เตือนให้บันทึกอาหารเช้า';

  @override
  String get lunchReminderTitle => 'อย่าลืมบันทึกอาหารกลางวัน';

  @override
  String get lunchRemindersChannel => 'การแจ้งเตือนอาหารกลางวัน';

  @override
  String get lunchRemindersChannelDescription => 'เตือนให้บันทึกอาหารกลางวัน';

  @override
  String get dinnerReminderTitle => 'อย่าลืมบันทึกอาหารเย็น';

  @override
  String get dinnerRemindersChannel => 'การแจ้งเตือนอาหารเย็น';

  @override
  String get dinnerRemindersChannelDescription => 'เตือนให้บันทึกอาหารเย็น';

  @override
  String get reinforcementGreatJob => 'ยอดเยี่ยม! ความพยายามของคุณกำลังเห็นผล';

  @override
  String get reinforcementKeepItUp => 'ทำต่อไป! คุณกำลังก้าวหน้าได้ดีมาก';

  @override
  String get reinforcementFantastic => 'เยี่ยมมาก! ความทุ่มเทของคุณกำลังเห็นผล';

  @override
  String get reinforcementWellDone =>
      'ทำได้ดี! คุณเข้าใกล้เป้าหมายอีกหนึ่งก้าวแล้ว';

  @override
  String get reinforcementImpressive =>
      'น่าประทับใจ! ความพยายามของคุณกำลังออกดอกผล';

  @override
  String get reinforcementAmazing => 'สุดยอด! คุณมาถูกทางแล้ว';

  @override
  String get reinforcementBravo => 'เยี่ยม! ความมุ่งมั่นของคุณน่าชื่นชม';

  @override
  String get reinforcementExcellent =>
      'ยอดเยี่ยม! ความพากเพียรของคุณสร้างแรงบันดาลใจ';

  @override
  String get reinforcementSuperb => 'สุดยอด! คุณทำได้ดีมาก';

  @override
  String get reinforcementIncredible =>
      'เหลือเชื่อ! เห็นความก้าวหน้าของคุณชัดเจน';

  @override
  String get reinforcementWayToGoKing => 'เยี่ยมไปเลย King';

  @override
  String get reinforcementYeahBuddy => 'เยี่ยมเลย!';

  @override
  String get reinforcementThatsHowItsDone => 'แบบนี้แหละ';

  @override
  String get reinforcementEasyAsPie => 'ง่ายนิดเดียว';

  @override
  String get reinforcementDoingGreat => 'คุณทำได้ดีมาก';

  @override
  String get reinforcementProgressNice =>
      'นั่นคือความก้าวหน้าที่เห็นใช่ไหม? ดีมาก';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'เหลือ $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return 'เหลือ $remaining $unit ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'น้ำตาล';

  @override
  String get nutrientCholesterol => 'คอเลสเตอรอล';

  @override
  String get nutrientSaturatedFat => 'ไขมันอิ่มตัว';

  @override
  String get nutrientCalcium => 'แคลเซียม';

  @override
  String get nutrientIron => 'ธาตุเหล็ก';

  @override
  String get nutrientPotassium => 'โพแทสเซียม';

  @override
  String get nutrientMagnesium => 'แมกนีเซียม';

  @override
  String get nutrientVitaminA => 'วิตามิน A';

  @override
  String get nutrientVitaminC => 'วิตามิน C';

  @override
  String get nutrientVitaminB12 => 'วิตามิน B12';

  @override
  String get nutrientVitaminD => 'วิตามิน D';

  @override
  String get nutrientVitaminE => 'วิตามิน E';

  @override
  String get nutrientAddedSugar => 'น้ำตาลเติมเพิ่ม';

  @override
  String get nutrientNetCarbs => 'คาร์โบไฮเดรตสุทธิ';

  @override
  String get nutrientWater => 'น้ำ';

  @override
  String get nutrientOmega3 => 'กรดไขมันโอเมกา-3';

  @override
  String get nutrientOmega6 => 'กรดไขมันโอเมกา-6';

  @override
  String get nutrientPralScore => 'คะแนน PRAL';

  @override
  String get nutrientTransFat => 'ไขมันทรานส์';

  @override
  String get nutrientSolubleFiber => 'ใยอาหารละลายน้ำ';

  @override
  String get nutrientInsolubleFiber => 'ใยอาหารไม่ละลายน้ำ';

  @override
  String get nutrientPhosphorus => 'ฟอสฟอรัส';

  @override
  String get nutrientSodium => 'โซเดียม';

  @override
  String get nutrientZinc => 'สังกะสี';

  @override
  String get nutrientCopper => 'ทองแดง';

  @override
  String get nutrientManganese => 'แมงกานีส';

  @override
  String get nutrientSelenium => 'ซีลีเนียม';

  @override
  String get nutrientFluoride => 'ฟลูออไรด์';

  @override
  String get nutrientMolybdenum => 'โมลิบดีนัม';

  @override
  String get nutrientChloride => 'คลอไรด์';

  @override
  String get nutrientSucrose => 'ซูโครส';

  @override
  String get nutrientGlucose => 'กลูโคส';

  @override
  String get nutrientFructose => 'ฟรุกโตส';

  @override
  String get nutrientLactose => 'แลคโตส';

  @override
  String get nutrientMaltose => 'มอลโทส';

  @override
  String get nutrientGalactose => 'กาแลคโตส';

  @override
  String get nutrientStarch => 'แป้ง';

  @override
  String get nutrientSugarAlcohols => 'น้ำตาลแอลกอฮอล์';

  @override
  String get nutrientThiaminB1 => 'ไทอามีน (B1)';

  @override
  String get nutrientRiboflavinB2 => 'ไรโบฟลาวิน (B2)';

  @override
  String get nutrientNiacinB3 => 'ไนอาซิน (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'กรดแพนโทเทนิก (B5)';

  @override
  String get nutrientVitaminB6 => 'วิตามิน B6';

  @override
  String get nutrientBiotinB7 => 'ไบโอติน (B7)';

  @override
  String get nutrientFolateB9 => 'โฟเลต (B9)';

  @override
  String get nutrientFolicAcid => 'กรดโฟลิก';

  @override
  String get nutrientFoodFolate => 'โฟเลตจากอาหาร';

  @override
  String get nutrientFolateDfe => 'โฟเลตเทียบเท่าในอาหาร (DFE)';

  @override
  String get nutrientCholine => 'โคลีน';

  @override
  String get nutrientBetaine => 'บีเทน';

  @override
  String get nutrientRetinol => 'เรตินอล';

  @override
  String get nutrientBetaCarotene => 'เบตาแคโรทีน';

  @override
  String get nutrientAlphaCarotene => 'แอลฟาแคโรทีน';

  @override
  String get nutrientLycopene => 'ไลโคปีน';

  @override
  String get nutrientLuteinZeaxanthin => 'ลูทีน + ซีแซนทีน';

  @override
  String get nutrientVitaminD2 => 'วิตามิน D2 (เออร์โกแคลซิเฟอรอล)';

  @override
  String get nutrientVitaminD3 => 'วิตามิน D3 (โคเลแคลซิเฟอรอล)';

  @override
  String get nutrientVitaminK => 'วิตามิน K';

  @override
  String get nutrientDihydrophylloquinone => 'ไดไฮโดรฟิลโลควิโนน';

  @override
  String get nutrientMenaquinone4 => 'เมนาควิโนน-4';

  @override
  String get nutrientMonounsaturatedFat => 'ไขมันไม่อิ่มตัวเชิงเดี่ยว';

  @override
  String get nutrientPolyunsaturatedFat => 'ไขมันไม่อิ่มตัวเชิงซ้อน';

  @override
  String get nutrientAla => 'กรดแอลฟาไลโนเลนิก (ALA)';

  @override
  String get nutrientEpa => 'กรดไอโคซาเพนตาอีโนอิก (EPA)';

  @override
  String get nutrientDpa => 'กรดโดโคซาเพนตาอีโนอิก (DPA)';

  @override
  String get nutrientDha => 'กรดโดโคซาเฮกซาอีโนอิก (DHA)';

  @override
  String get nutrientAlanine => 'อะลานีน';

  @override
  String get nutrientAlcohol => 'แอลกอฮอล์';

  @override
  String get nutrientArginine => 'อาร์จินีน';

  @override
  String get nutrientAsparticAcid => 'กรดแอสปาร์ติก';

  @override
  String get nutrientCystine => 'ซิสทีน';

  @override
  String get nutrientGlutamicAcid => 'กรดกลูตามิก';

  @override
  String get nutrientGlycine => 'ไกลซีน';

  @override
  String get nutrientHistidine => 'ฮิสทิดีน';

  @override
  String get nutrientHydroxyproline => 'ไฮดรอกซีโพรลีน';

  @override
  String get nutrientIsoleucine => 'ไอโซลิวซีน';

  @override
  String get nutrientLeucine => 'ลิวซีน';

  @override
  String get nutrientLysine => 'ไลซีน';

  @override
  String get nutrientMethionine => 'เมไทโอนีน';

  @override
  String get nutrientPhenylalanine => 'ฟีนิลอะลานีน';

  @override
  String get nutrientProline => 'โพรลีน';

  @override
  String get nutrientSerine => 'ซีรีน';

  @override
  String get nutrientThreonine => 'ทรีโอนีน';

  @override
  String get nutrientTryptophan => 'ทริปโตเฟน';

  @override
  String get nutrientTyrosine => 'ไทโรซีน';

  @override
  String get nutrientValine => 'วาลีน';

  @override
  String get nutrientCaffeine => 'คาเฟอีน';

  @override
  String get nutrientTheobromine => 'ธีโอโบรมีน';

  @override
  String servingWeightNumber(int number) {
    return 'น้ำหนักหนึ่งหน่วยบริโภค $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'คำอธิบายหนึ่งหน่วยบริโภค $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'น้ำหนักที่เทียบเท่า 200 kcal';
}
