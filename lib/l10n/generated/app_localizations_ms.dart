// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Diari';

  @override
  String get navGraph => 'Graf';

  @override
  String get navFood => 'Makanan';

  @override
  String get navWeight => 'Berat';

  @override
  String get navError => 'Ralat';

  @override
  String get loadDataFailed => 'Tidak dapat memuatkan data ini.';

  @override
  String get settings => 'Tetapan';

  @override
  String get invalidTabSettings => 'Tetapan tab tidak sah.';

  @override
  String newVersion(String version) {
    return 'Versi baharu $version';
  }

  @override
  String get changes => 'Perubahan';

  @override
  String get searchSettings => 'Cari tetapan...';

  @override
  String get appearance => 'Penampilan';

  @override
  String get appearanceSubtitle => 'Tema, warna dan paparan graf';

  @override
  String get diary => 'Diari';

  @override
  String get diarySubtitle => 'Sasaran harian, ringkasan dan catatan';

  @override
  String get food => 'Makanan';

  @override
  String get foodSubtitle => 'Unit makanan, medan dan nilai lalai';

  @override
  String get weight => 'Berat';

  @override
  String get weightSubtitle => 'Unit berat, sasaran dan paparan';

  @override
  String get tabs => 'Tab';

  @override
  String get tabsSubtitle => 'Tab navigasi dan susunan';

  @override
  String get data => 'Data';

  @override
  String get dataSubtitle => 'Import, eksport dan data setempat';

  @override
  String get todayProgress => 'Kemajuan hari ini';

  @override
  String get latestDay => 'Hari terkini';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count catatan direkodkan',
      one: '1 catatan direkodkan',
      zero: 'Tiada catatan direkodkan',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Edit $count catatan',
      one: 'Edit 1 catatan',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Kalori';

  @override
  String get protein => 'Protein';

  @override
  String get carbs => 'Karbohidrat';

  @override
  String get fat => 'Lemak';

  @override
  String get addDiaryEntry => 'Tambah catatan diari';

  @override
  String get noEntriesToday => 'Tiada catatan hari ini.';

  @override
  String addSearchToDiary(String search) {
    return 'Tambah \"$search\" ke diari anda';
  }

  @override
  String get tapStartLoggingFood => 'Ketik untuk mula mencatat makanan.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Tiada catatan diari yang sepadan. Ketik untuk mencipta makanan ini dan mencatatnya.';

  @override
  String get add => 'Tambah';

  @override
  String get quickAdd => 'Tambah pantas';

  @override
  String get scanBarcode => 'Imbas kod bar';

  @override
  String get foodLibrary => 'Pustaka makanan';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount makanan',
      one: '1 makanan',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount hidangan',
      one: '1 hidangan',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'Digunakan baru-baru ini';

  @override
  String get quickActions => 'Tindakan pantas';

  @override
  String get addFood => 'Tambah makanan';

  @override
  String get createMeal => 'Cipta hidangan';

  @override
  String get noFoodYet => 'Belum ada makanan';

  @override
  String get noMatchingFood => 'Tiada makanan yang sepadan';

  @override
  String get addFirstFoodOrMeal =>
      'Tambah makanan atau hidangan pertama anda untuk mula membina pustaka anda.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Tiada yang sepadan dengan “$search”. Kosongkan carian untuk melihat semuanya semula.';
  }

  @override
  String get clearSearch => 'Kosongkan carian';

  @override
  String get addMeal => 'Tambah hidangan';

  @override
  String get noWeightsYet => 'Belum ada rekod berat';

  @override
  String get noMatchingWeights => 'Tiada rekod berat yang sepadan';

  @override
  String get logFirstWeight =>
      'Catat berat pertama anda untuk mula menjejaki trend anda.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Tiada yang sepadan dengan “$search”. Kosongkan carian untuk melihat semua catatan.';
  }

  @override
  String get logWeight => 'Catat berat';

  @override
  String get weightTrend => 'Trend berat';

  @override
  String get weightTrendSubtitle => 'Ukuran terkini dan arah keseluruhan';

  @override
  String get bodyWeight => 'Berat badan';

  @override
  String get options => 'Pilihan';

  @override
  String get day => 'Hari';

  @override
  String get today => 'Hari ini';

  @override
  String get week => 'Minggu';

  @override
  String get month => 'Bulan';

  @override
  String get year => 'Tahun';

  @override
  String get dateRange => 'Julat tarikh';

  @override
  String get startDate => 'Tarikh mula';

  @override
  String get stopDate => 'Tarikh tamat';

  @override
  String get dataPoints => 'Titik data';

  @override
  String get customizeFields => 'Sesuaikan medan';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSubtitle => 'Pilih bahasa yang digunakan oleh FitBook';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get languageEnglish => 'Bahasa Inggeris';

  @override
  String get languageSpanish => 'Bahasa Sepanyol';

  @override
  String get languageFrench => 'Bahasa Perancis';

  @override
  String get languageGerman => 'Bahasa Jerman';

  @override
  String get languageItalian => 'Bahasa Itali';

  @override
  String get languagePortugueseBrazil => 'Bahasa Portugis (Brazil)';

  @override
  String get languagePortuguesePortugal => 'Bahasa Portugis (Portugal)';

  @override
  String get languageDutch => 'Bahasa Belanda';

  @override
  String get languagePolish => 'Bahasa Poland';

  @override
  String get languageJapanese => 'Bahasa Jepun';

  @override
  String get languageKorean => 'Bahasa Korea';

  @override
  String get languageChineseSimplified => 'Bahasa Cina (Ringkas)';

  @override
  String get languageChineseTraditional => 'Bahasa Cina (Tradisional)';

  @override
  String get languageRussian => 'Bahasa Rusia';

  @override
  String get languageHindi => 'Bahasa Hindi';

  @override
  String get languageIndonesian => 'Bahasa Indonesia';

  @override
  String get languageVietnamese => 'Bahasa Vietnam';

  @override
  String get languageThai => 'Bahasa Thai';

  @override
  String get languageBengali => 'Bahasa Bengali';

  @override
  String get languageUrdu => 'Bahasa Urdu';

  @override
  String get languagePersian => 'Bahasa Parsi';

  @override
  String get languageMalay => 'Bahasa Melayu';

  @override
  String get languageUkrainian => 'Bahasa Ukraine';

  @override
  String get appearanceSettings => 'Tetapan penampilan';

  @override
  String get delete => 'Padam';

  @override
  String get confirmDelete => 'Sahkan pemadaman';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Adakah anda pasti mahu memadam $count rekod? Tindakan ini tidak boleh dibatalkan.',
      one:
          'Adakah anda pasti mahu memadam 1 rekod? Tindakan ini tidak boleh dibatalkan.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Batal';

  @override
  String get search => 'Cari...';

  @override
  String get clear => 'Kosongkan';

  @override
  String get showMenu => 'Tunjukkan menu';

  @override
  String get selectAll => 'Pilih semua';

  @override
  String get edit => 'Edit';

  @override
  String get favorite => 'Kegemaran';

  @override
  String get atLeastOneTab => 'Anda memerlukan sekurang-kurangnya satu tab';

  @override
  String get scrollableTabs => 'Tab boleh ditatal';

  @override
  String get save => 'Simpan';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeDark => 'Gelap';

  @override
  String get themeLight => 'Cerah';

  @override
  String get pureBlackAmoled => 'Hitam tulen (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'Gunakan warna hitam tulen untuk paparan AMOLED';

  @override
  String get systemColorScheme => 'Skema warna sistem';

  @override
  String get systemColorSchemeTooltip =>
      'Gunakan warna utama peranti anda untuk aplikasi';

  @override
  String get showImages => 'Tunjukkan imej';

  @override
  String get showImagesTooltip =>
      'Pilih dan paparkan imej pada halaman diari dan makanan';

  @override
  String get curveLineGraphs => 'Graf garis melengkung';

  @override
  String get curveLineGraphsTooltip =>
      'Gunakan lengkung licin pada halaman graf';

  @override
  String get weightStatCards => 'Kad statistik berat';

  @override
  String get weightStatCardsTooltip =>
      'Tunjukkan catatan berat sebagai grid kad statistik dan bukannya senarai lalai';

  @override
  String get graphsStartAtZero => 'Graf bermula pada sifar';

  @override
  String get graphsStartAtZeroTooltip =>
      'Sentiasa mulakan paksi-y graf pada sifar';

  @override
  String get navigationAnimation => 'Animasi navigasi';

  @override
  String get animationFade => 'Pudar';

  @override
  String get animationZoom => 'Zum';

  @override
  String get animationSlide => 'Luncur';

  @override
  String get animationRise => 'Naik';

  @override
  String get animationNone => 'Tiada';

  @override
  String longDateFormat(String example) {
    return 'Format tarikh panjang ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Format tarikh pendek ($example)';
  }

  @override
  String get diarySettings => 'Tetapan diari';

  @override
  String get diaryUnit => 'Unit diari';

  @override
  String get diarySummary => 'Ringkasan diari';

  @override
  String get diarySummaryDivision => 'Pembahagian - semasa / jumlah';

  @override
  String get diarySummaryRemaining => 'Baki';

  @override
  String get diarySummaryBoth => 'Kedua-duanya - baki (jumlah)';

  @override
  String get diarySummaryNone => 'Tiada';

  @override
  String get dailyCaloriesKcal => 'Kalori harian (kcal)';

  @override
  String get dailyProteinG => 'Protein harian (g)';

  @override
  String get dailyFatG => 'Lemak harian (g)';

  @override
  String get dailyCarbsG => 'Karbohidrat harian (g)';

  @override
  String get dailyFiberG => 'Serat harian (g)';

  @override
  String get automaticDailies => 'Sasaran harian automatik';

  @override
  String get automaticDailiesTooltip =>
      'Kira secara automatik kalori, protein, lemak dan karbohidrat harian yang disyorkan berdasarkan berat badan anda';

  @override
  String get selectNameOnSubmit => 'Pilih nama semasa hantar';

  @override
  String get reminders => 'Peringatan';

  @override
  String get foodSettings => 'Tetapan makanan';

  @override
  String get foodUnit => 'Unit makanan';

  @override
  String get fields => 'Medan';

  @override
  String get favoriteNewFoods => 'Jadikan makanan baharu kegemaran';

  @override
  String get pickFields => 'Pilih medan';

  @override
  String get all => 'Semua';

  @override
  String get onlySelected => 'Hanya yang dipilih';

  @override
  String get weightSettings => 'Tetapan berat';

  @override
  String get targetWeight => 'Berat sasaran';

  @override
  String get positiveReinforcement => 'Pengukuhan positif';

  @override
  String get positiveReinforcementPreview =>
      'Mesej galakan akan dipaparkan seperti ini!';

  @override
  String get dataSettings => 'Tetapan data';

  @override
  String get automaticBackup => 'Sandaran automatik';

  @override
  String get shareDatabase => 'Kongsi pangkalan data';

  @override
  String get openNotification => 'Buka pemberitahuan';

  @override
  String get automaticBackupsEnabled => 'Sandaran automatik didayakan';

  @override
  String get automaticBackupBody =>
      'FitBook akan menyandarkan data dan imej anda secara automatik ke folder yang dipilih setiap hari.';

  @override
  String get backupSettings => 'Tetapan sandaran';

  @override
  String get backupSettingsChannelDescription =>
      'Pemberitahuan tentang sandaran automatik';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Nama pengguna';

  @override
  String get password => 'Kata laluan';

  @override
  String get close => 'Tutup';

  @override
  String get loggedIn => 'Telah log masuk';

  @override
  String get about => 'Perihal';

  @override
  String get version => 'Versi';

  @override
  String get whatsNew => 'Apa yang baharu?';

  @override
  String get author => 'Pengarang';

  @override
  String get license => 'Lesen';

  @override
  String get donate => 'Derma';

  @override
  String get supportProject => 'Bantu menyokong projek ini';

  @override
  String get leaveReview => 'Tinggalkan ulasan';

  @override
  String get rateOnPlayStore => 'Nilai FitBook di Play Store';

  @override
  String get sourceCode => 'Kod sumber';

  @override
  String get foods => 'Makanan';

  @override
  String get backup => 'Sandaran';

  @override
  String get exportData => 'Eksport data';

  @override
  String get importData => 'Import data';

  @override
  String get failedImportData => 'Gagal mengimport data';

  @override
  String get copyError => 'Salin ralat';

  @override
  String get deleteRecords => 'Padam rekod';

  @override
  String get unusedFood => 'Makanan tidak digunakan';

  @override
  String get database => 'Pangkalan data';

  @override
  String get deleteAllWeightsConfirm =>
      'Adakah anda pasti mahu memadam semua rekod berat? Tindakan ini tidak boleh dibatalkan.';

  @override
  String get deleteDatabaseConfirm =>
      'Adakah anda pasti mahu memadam pangkalan data anda? Tindakan ini tidak boleh dibatalkan dan akan memusnahkan semua data anda.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Adakah anda pasti mahu memadam semua catatan makanan dan diari? Tindakan ini tidak boleh dibatalkan.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Adakah anda pasti mahu memadam $count makanan yang tidak digunakan? Tindakan ini tidak boleh dibatalkan.',
      one:
          'Adakah anda pasti mahu memadam 1 makanan yang tidak digunakan? Tindakan ini tidak boleh dibatalkan.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Adakah anda pasti mahu memadam semua catatan diari? Tindakan ini tidak boleh dibatalkan.';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Gantikan imej';

  @override
  String get takePhoto => 'Ambil foto';

  @override
  String get deleteImage => 'Padam imej';

  @override
  String get filters => 'Penapis';

  @override
  String get foodGroup => 'Kumpulan makanan';

  @override
  String get exampleFruit => 'Buah';

  @override
  String clearFiltersCount(int count) {
    return 'Kosongkan ($count)';
  }

  @override
  String get done => 'Selesai';

  @override
  String get showFilters => 'Tunjukkan penapis';

  @override
  String get repeatEntry => 'Ulang catatan';

  @override
  String get timeOfDay => 'Masa dalam sehari';

  @override
  String get everyDay => 'Setiap hari';

  @override
  String get repeatEveryDayForYear =>
      'Cipta catatan ini setiap hari untuk setahun akan datang';

  @override
  String get repeatOn => 'Ulang pada';

  @override
  String get weekdayMon => 'Isn';

  @override
  String get weekdayTue => 'Sel';

  @override
  String get weekdayWed => 'Rab';

  @override
  String get weekdayThu => 'Kha';

  @override
  String get weekdayFri => 'Jum';

  @override
  String get weekdaySat => 'Sab';

  @override
  String get weekdaySun => 'Ahd';

  @override
  String get schedule => 'Jadual';

  @override
  String get enterValidNutritionValues => 'Masukkan nilai pemakanan yang sah';

  @override
  String get quickAddTitle => 'Tambah pantas';

  @override
  String get kilojoules => 'Kilojoule';

  @override
  String get createdDate => 'Tarikh dicipta';

  @override
  String get failedMigrations => 'Migrasi gagal';

  @override
  String get failedMigrationsDescription =>
      'Sesuatu berlaku semasa mencipta atau menaik taraf pangkalan data anda. Biasanya ini boleh dibaiki dengan memadam dan mencipta semula rekod anda.';

  @override
  String get errorMessage => 'Mesej ralat:';

  @override
  String get createIssue => 'Cipta isu';

  @override
  String get cameraPermissionRequired =>
      'Kebenaran kamera diperlukan untuk mengimbas.';

  @override
  String get scanFoodBarcode => 'Imbas kod bar makanan';

  @override
  String get holdBarcodeInFrame => 'Pastikan kod bar berada di dalam bingkai';

  @override
  String get pinchToZoom => 'Cubit untuk zum';

  @override
  String get cameraStartFailed => 'Tidak dapat memulakan kamera';

  @override
  String get editDiaryEntry => 'Edit catatan diari';

  @override
  String get addFoodToDiary => 'Tambah makanan ke diari';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Adakah anda pasti mahu memadam $name?';
  }

  @override
  String get imageError => 'Ralat imej';

  @override
  String get setImage => 'Tetapkan imej';

  @override
  String get name => 'Nama';

  @override
  String get searchFoodsAndMeals => 'Cari makanan dan hidangan...';

  @override
  String get clearSelection => 'Kosongkan pilihan';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Kod bar tidak ditemui. Simpan untuk memasukkan.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Cari OpenFoodFacts untuk \"$name\"';
  }

  @override
  String get meal => 'Hidangan';

  @override
  String get quantity => 'Kuantiti';

  @override
  String get unit => 'Unit';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Hidangan ($amount $unit)';
  }

  @override
  String get barcode => 'Kod bar';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (setiap $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
    String nutrient,
    String quantity,
    String unit,
  ) {
    return '$nutrient bagi setiap $quantity $unit';
  }

  @override
  String get fiber => 'Serat';

  @override
  String get unitServing => 'Hidangan';

  @override
  String get unitGrams => 'Gram';

  @override
  String get unitMilliliters => 'Mililiter';

  @override
  String get unitKilojoules => 'Kilojoule';

  @override
  String get unitCups => 'Cawan';

  @override
  String get unitTablespoons => 'Sudu besar';

  @override
  String get unitMilligrams => 'Miligram';

  @override
  String get unitTeaspoons => 'Sudu teh';

  @override
  String get unitOunces => 'Auns';

  @override
  String get unitPounds => 'Paun';

  @override
  String get unitKilograms => 'Kilogram';

  @override
  String get unitLiters => 'Liter';

  @override
  String get nameConflict => 'Konflik nama';

  @override
  String get replaceExistingFood =>
      'Makanan dengan nama ini sudah wujud. Adakah anda mahu menggantikan yang lama?';

  @override
  String get no => 'Tidak';

  @override
  String get yes => 'Ya';

  @override
  String get editFood => 'Edit makanan';

  @override
  String confirmDeleteFood(String name) {
    return 'Adakah anda pasti mahu memadam $name?';
  }

  @override
  String get caloriesKcal => 'Kalori (kcal)';

  @override
  String get kilojoulesKj => 'Kilojoule (kJ)';

  @override
  String get servingSize => 'Saiz hidangan';

  @override
  String get servingUnit => 'Unit hidangan';

  @override
  String get saveAsNewCopy => 'Simpan sebagai salinan baharu';

  @override
  String get filterFoods => 'Tapis makanan';

  @override
  String get narrowFoodsFilters =>
      'Sempitkan senarai menggunakan sebarang gabungan penapis.';

  @override
  String get foodDetails => 'Butiran makanan';

  @override
  String get exampleFruitHint => 'cth. Buah';

  @override
  String get servingSizeRangeHint =>
      'Tetapkan minimum, maksimum, atau kedua-duanya.';

  @override
  String get minimum => 'Minimum';

  @override
  String get maximum => 'Maksimum';

  @override
  String get noMinimum => 'Tiada minimum';

  @override
  String get noMaximum => 'Tiada maksimum';

  @override
  String get clearAll => 'Kosongkan semua';

  @override
  String get searchOpenFoodFacts => 'Cari Open Food Facts';

  @override
  String get noMatchingProducts => 'Tiada produk yang sepadan';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Cuba nama lain atau imbas kod bar.';

  @override
  String get enterFoodNameToSearch =>
      'Masukkan nama makanan di atas, kemudian hantar untuk mencari.';

  @override
  String get submitToSearch => 'Hantar untuk mencari...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g protein';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Edit $count makanan',
      one: 'Edit 1 makanan',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'Edit hidangan';

  @override
  String get addImage => 'Tambah imej';

  @override
  String get noFoodsInMeal => 'Belum ada makanan dalam hidangan ini';

  @override
  String get addFoodToMealHint =>
      'Tambah makanan untuk mula membina hidangan ini.';

  @override
  String get remove => 'Buang';

  @override
  String get searchFoods => 'Cari makanan...';

  @override
  String get noFoodsFound => 'Tiada makanan ditemui';

  @override
  String nothingMatchesSearch(String search) {
    return 'Tiada yang sepadan dengan “$search”.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Tambahkan beberapa makanan ke pustaka anda sebelum menambahkannya ke hidangan.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'Belum ada data';

  @override
  String get completePlansToViewGraphs =>
      'Lengkapkan beberapa rancangan untuk melihat graf di sini.';

  @override
  String get value => 'Nilai';

  @override
  String get goal => 'Sasaran';

  @override
  String get notSet => 'Belum ditetapkan';

  @override
  String get trend => 'Trend';

  @override
  String get smooth => 'Lancar';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Purata $count titik',
      one: 'Purata 1 titik',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Edit berat';

  @override
  String get addWeight => 'Tambah berat';

  @override
  String shareWeight(String value, String unit) {
    return 'Berat saya baru sahaja $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Berat ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Sila masukkan berat';

  @override
  String get pleaseEnterValidWeight => 'Sila masukkan berat yang sah';

  @override
  String get lastWeight => 'Berat terakhir';

  @override
  String unitWithValue(String unit) {
    return 'Unit ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Kekalkan unit sebagai $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Tukar kepada $unit';
  }

  @override
  String get removeImage => 'Buang imej';

  @override
  String get mealRemindersEnabled => 'Peringatan hidangan didayakan';

  @override
  String get mealRemindersEnabledBody =>
      'Kami akan mengingatkan anda untuk mencatat sarapan, makan tengah hari atau makan malam jika anda belum mencatatnya.';

  @override
  String get reminderSettingsChannel => 'Tetapan peringatan';

  @override
  String get reminderSettingsChannelDescription =>
      'Pemberitahuan yang menerangkan peringatan FitBook';

  @override
  String get breakfastReminderTitle => 'Jangan lupa mencatat sarapan';

  @override
  String get breakfastRemindersChannel => 'Peringatan sarapan';

  @override
  String get breakfastRemindersChannelDescription =>
      'Peringatan untuk mencatat sarapan';

  @override
  String get lunchReminderTitle => 'Jangan lupa mencatat makan tengah hari';

  @override
  String get lunchRemindersChannel => 'Peringatan makan tengah hari';

  @override
  String get lunchRemindersChannelDescription =>
      'Peringatan untuk mencatat makan tengah hari';

  @override
  String get dinnerReminderTitle => 'Jangan lupa mencatat makan malam';

  @override
  String get dinnerRemindersChannel => 'Peringatan makan malam';

  @override
  String get dinnerRemindersChannelDescription =>
      'Peringatan untuk mencatat makan malam';

  @override
  String get reinforcementGreatJob =>
      'Syabas! Usaha keras anda membuahkan hasil.';

  @override
  String get reinforcementKeepItUp =>
      'Teruskan! Anda mencapai kemajuan yang sangat baik.';

  @override
  String get reinforcementFantastic => 'Hebat! Dedikasi anda membuahkan hasil.';

  @override
  String get reinforcementWellDone =>
      'Syabas! Anda selangkah lebih dekat dengan sasaran anda.';

  @override
  String get reinforcementImpressive =>
      'Mengagumkan! Usaha anda membuahkan hasil.';

  @override
  String get reinforcementAmazing =>
      'Hebat! Anda berada di landasan yang betul.';

  @override
  String get reinforcementBravo => 'Bravo! Komitmen anda patut dipuji.';

  @override
  String get reinforcementExcellent =>
      'Cemerlang! Ketekunan anda memberi inspirasi.';

  @override
  String get reinforcementSuperb =>
      'Terbaik! Anda melakukan kerja yang cemerlang.';

  @override
  String get reinforcementIncredible =>
      'Luar biasa! Kemajuan anda jelas kelihatan.';

  @override
  String get reinforcementWayToGoKing => 'Terbaik, Raja!';

  @override
  String get reinforcementYeahBuddy => 'Ya, kawan!';

  @override
  String get reinforcementThatsHowItsDone => 'Begitulah caranya.';

  @override
  String get reinforcementEasyAsPie => 'Semudah ABC.';

  @override
  String get reinforcementDoingGreat => 'Anda melakukannya dengan hebat.';

  @override
  String get reinforcementProgressNice =>
      'Adakah itu kemajuan yang saya nampak? Bagus.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'Baki $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return 'Baki $remaining $unit ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'Gula';

  @override
  String get nutrientCholesterol => 'Kolesterol';

  @override
  String get nutrientSaturatedFat => 'Lemak tepu';

  @override
  String get nutrientCalcium => 'Kalsium';

  @override
  String get nutrientIron => 'Zat besi';

  @override
  String get nutrientPotassium => 'Kalium';

  @override
  String get nutrientMagnesium => 'Magnesium';

  @override
  String get nutrientVitaminA => 'Vitamin A';

  @override
  String get nutrientVitaminC => 'Vitamin C';

  @override
  String get nutrientVitaminB12 => 'Vitamin B12';

  @override
  String get nutrientVitaminD => 'Vitamin D';

  @override
  String get nutrientVitaminE => 'Vitamin E';

  @override
  String get nutrientAddedSugar => 'Gula tambahan';

  @override
  String get nutrientNetCarbs => 'Karbohidrat bersih';

  @override
  String get nutrientWater => 'Air';

  @override
  String get nutrientOmega3 => 'Asid lemak omega-3';

  @override
  String get nutrientOmega6 => 'Asid lemak omega-6';

  @override
  String get nutrientPralScore => 'Skor PRAL';

  @override
  String get nutrientTransFat => 'Lemak trans';

  @override
  String get nutrientSolubleFiber => 'Serat larut';

  @override
  String get nutrientInsolubleFiber => 'Serat tidak larut';

  @override
  String get nutrientPhosphorus => 'Fosforus';

  @override
  String get nutrientSodium => 'Natrium';

  @override
  String get nutrientZinc => 'Zink';

  @override
  String get nutrientCopper => 'Tembaga';

  @override
  String get nutrientManganese => 'Mangan';

  @override
  String get nutrientSelenium => 'Selenium';

  @override
  String get nutrientFluoride => 'Fluorida';

  @override
  String get nutrientMolybdenum => 'Molibdenum';

  @override
  String get nutrientChloride => 'Klorida';

  @override
  String get nutrientSucrose => 'Sukrosa';

  @override
  String get nutrientGlucose => 'Glukosa';

  @override
  String get nutrientFructose => 'Fruktosa';

  @override
  String get nutrientLactose => 'Laktosa';

  @override
  String get nutrientMaltose => 'Maltosa';

  @override
  String get nutrientGalactose => 'Galaktosa';

  @override
  String get nutrientStarch => 'Kanji';

  @override
  String get nutrientSugarAlcohols => 'Alkohol gula';

  @override
  String get nutrientThiaminB1 => 'Tiamina (B1)';

  @override
  String get nutrientRiboflavinB2 => 'Riboflavin (B2)';

  @override
  String get nutrientNiacinB3 => 'Niasin (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'Asid pantotenik (B5)';

  @override
  String get nutrientVitaminB6 => 'Vitamin B6';

  @override
  String get nutrientBiotinB7 => 'Biotin (B7)';

  @override
  String get nutrientFolateB9 => 'Folat (B9)';

  @override
  String get nutrientFolicAcid => 'Asid folik';

  @override
  String get nutrientFoodFolate => 'Folat makanan';

  @override
  String get nutrientFolateDfe => 'Setara folat diet (DFE)';

  @override
  String get nutrientCholine => 'Kolina';

  @override
  String get nutrientBetaine => 'Betaina';

  @override
  String get nutrientRetinol => 'Retinol';

  @override
  String get nutrientBetaCarotene => 'Beta-karotena';

  @override
  String get nutrientAlphaCarotene => 'Alfa-karotena';

  @override
  String get nutrientLycopene => 'Likopena';

  @override
  String get nutrientLuteinZeaxanthin => 'Lutein + zeaxanthin';

  @override
  String get nutrientVitaminD2 => 'Vitamin D2 (ergokalsiferol)';

  @override
  String get nutrientVitaminD3 => 'Vitamin D3 (kolekalsiferol)';

  @override
  String get nutrientVitaminK => 'Vitamin K';

  @override
  String get nutrientDihydrophylloquinone => 'Dihidrofilokuinon';

  @override
  String get nutrientMenaquinone4 => 'Menakuinon-4';

  @override
  String get nutrientMonounsaturatedFat => 'Lemak mono tak tepu';

  @override
  String get nutrientPolyunsaturatedFat => 'Lemak poli tak tepu';

  @override
  String get nutrientAla => 'Asid alfa-linolenik (ALA)';

  @override
  String get nutrientEpa => 'Asid eikosapentaenoik (EPA)';

  @override
  String get nutrientDpa => 'Asid dokosapentaenoik (DPA)';

  @override
  String get nutrientDha => 'Asid dokosaheksaenoik (DHA)';

  @override
  String get nutrientAlanine => 'Alanin';

  @override
  String get nutrientAlcohol => 'Alkohol';

  @override
  String get nutrientArginine => 'Arginina';

  @override
  String get nutrientAsparticAcid => 'Asid aspartik';

  @override
  String get nutrientCystine => 'Sistin';

  @override
  String get nutrientGlutamicAcid => 'Asid glutamik';

  @override
  String get nutrientGlycine => 'Glisina';

  @override
  String get nutrientHistidine => 'Histidina';

  @override
  String get nutrientHydroxyproline => 'Hidroksiprolina';

  @override
  String get nutrientIsoleucine => 'Isoleusina';

  @override
  String get nutrientLeucine => 'Leusina';

  @override
  String get nutrientLysine => 'Lisina';

  @override
  String get nutrientMethionine => 'Metionina';

  @override
  String get nutrientPhenylalanine => 'Fenilalanina';

  @override
  String get nutrientProline => 'Prolina';

  @override
  String get nutrientSerine => 'Serina';

  @override
  String get nutrientThreonine => 'Treonina';

  @override
  String get nutrientTryptophan => 'Triptofan';

  @override
  String get nutrientTyrosine => 'Tirosina';

  @override
  String get nutrientValine => 'Valina';

  @override
  String get nutrientCaffeine => 'Kafein';

  @override
  String get nutrientTheobromine => 'Teobromina';

  @override
  String servingWeightNumber(int number) {
    return 'Berat hidangan $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'Penerangan hidangan $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'Berat bersamaan 200 kcal';
}
