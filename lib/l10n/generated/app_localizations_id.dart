// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Buku harian';

  @override
  String get navGraph => 'Grafik';

  @override
  String get navFood => 'Makanan';

  @override
  String get navWeight => 'Berat';

  @override
  String get navError => 'Kesalahan';

  @override
  String get loadDataFailed => 'Tidak dapat memuat data ini.';

  @override
  String get settings => 'Pengaturan';

  @override
  String get invalidTabSettings => 'Setelan tab tidak valid.';

  @override
  String newVersion(String version) {
    return 'Versi baru $version';
  }

  @override
  String get changes => 'Perubahan';

  @override
  String get searchSettings => 'Setelan penelusuran...';

  @override
  String get appearance => 'Penampilan';

  @override
  String get appearanceSubtitle => 'Tema, warna dan tampilan grafik';

  @override
  String get diary => 'Buku harian';

  @override
  String get diarySubtitle => 'Target harian, ringkasan dan pencatatan';

  @override
  String get food => 'Makanan';

  @override
  String get foodSubtitle => 'Unit makanan, bidang dan default';

  @override
  String get weight => 'Berat';

  @override
  String get weightSubtitle => 'Satuan berat, sasaran, dan tampilan';

  @override
  String get tabs => 'tab';

  @override
  String get tabsSubtitle => 'Tab navigasi dan pemesanan';

  @override
  String get data => 'Data';

  @override
  String get dataSubtitle => 'Impor, ekspor, dan data lokal';

  @override
  String get todayProgress => 'Kemajuan hari ini';

  @override
  String get latestDay => 'Hari terakhir';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entri dicatat',
      one: '1 entri dicatat',
      zero: 'Belum ada entri yang dicatat',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Edit $count entri',
      one: 'Edit 1 entri',
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
  String get fat => 'Gemuk';

  @override
  String get addDiaryEntry => 'Tambahkan entri buku harian';

  @override
  String get noEntriesToday => 'Tidak ada entri hari ini.';

  @override
  String addSearchToDiary(String search) {
    return 'Tambahkan \"$search\" ke buku harian Anda';
  }

  @override
  String get tapStartLoggingFood => 'Ketuk untuk mulai mencatat makanan.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Tidak ada entri buku harian yang cocok. Ketuk untuk membuat makanan ini dan mencatatnya.';

  @override
  String get add => 'Menambahkan';

  @override
  String get quickAdd => 'Tambahkan cepat';

  @override
  String get scanBarcode => 'Pindai kode batang';

  @override
  String get foodLibrary => 'Perpustakaan makanan';

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
  String get recentlyUsed => 'Baru-baru ini digunakan';

  @override
  String get quickActions => 'Tindakan cepat';

  @override
  String get addFood => 'Tambahkan makanan';

  @override
  String get createMeal => 'Buat makanan';

  @override
  String get noFoodYet => 'Belum ada makanan';

  @override
  String get noMatchingFood => 'Tidak ada makanan yang cocok';

  @override
  String get addFirstFoodOrMeal =>
      'Tambahkan makanan atau makanan pertama Anda untuk mulai membangun perpustakaan Anda.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Tidak ada yang cocok dengan “$search”. Hapus pencarian untuk melihat semuanya lagi.';
  }

  @override
  String get clearSearch => 'Hapus pencarian';

  @override
  String get addMeal => 'Tambahkan makanan';

  @override
  String get noWeightsYet => 'Belum ada beban';

  @override
  String get noMatchingWeights => 'Tidak ada bobot yang cocok';

  @override
  String get logFirstWeight =>
      'Catat berat badan pertama Anda untuk mulai melacak tren Anda.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Tidak ada yang cocok dengan “$search”. Hapus pencarian untuk melihat semua entri.';
  }

  @override
  String get logWeight => 'Catat beratnya';

  @override
  String get weightTrend => 'Tren berat badan';

  @override
  String get weightTrendSubtitle => 'Pengukuran terkini dan arah keseluruhan';

  @override
  String get bodyWeight => 'Berat badan';

  @override
  String get options => 'Pilihan';

  @override
  String get day => 'Hari';

  @override
  String get today => 'Hari ini';

  @override
  String get week => 'Pekan';

  @override
  String get month => 'Bulan';

  @override
  String get year => 'Tahun';

  @override
  String get dateRange => 'Rentang tanggal';

  @override
  String get startDate => 'Tanggal mulai';

  @override
  String get stopDate => 'Tanggal berhenti';

  @override
  String get dataPoints => 'Poin data';

  @override
  String get customizeFields => 'Sesuaikan bidang';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSubtitle => 'Pilih bahasa yang digunakan oleh FitBook';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get languageEnglish => 'Bahasa inggris';

  @override
  String get languageSpanish => 'Spanyol';

  @override
  String get languageFrench => 'Perancis';

  @override
  String get languageGerman => 'Jerman';

  @override
  String get languageItalian => 'Italia';

  @override
  String get languagePortugueseBrazil => 'Portugis (Brasil)';

  @override
  String get languagePortuguesePortugal => 'Portugis (Portugal)';

  @override
  String get languageDutch => 'Belanda';

  @override
  String get languagePolish => 'Polandia';

  @override
  String get languageJapanese => 'Jepang';

  @override
  String get languageKorean => 'Korea';

  @override
  String get languageChineseSimplified => 'Cina (Sederhana)';

  @override
  String get languageChineseTraditional => 'Cina (Tradisional)';

  @override
  String get languageRussian => 'Rusia';

  @override
  String get languageHindi => 'Hindi';

  @override
  String get languageIndonesian => 'Bahasa Indonesia';

  @override
  String get languageVietnamese => 'Vietnam';

  @override
  String get languageThai => 'Thai';

  @override
  String get languageBengali => 'Bengali';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get languagePersian => 'Persia';

  @override
  String get languageMalay => 'Melayu';

  @override
  String get languageUkrainian => 'Ukraina';

  @override
  String get appearanceSettings => 'Pengaturan penampilan';

  @override
  String get delete => 'Menghapus';

  @override
  String get confirmDelete => 'Konfirmasi penghapusan';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Yakin ingin menghapus $count catatan? Tindakan ini tidak dapat dibatalkan.',
      one:
          'Yakin ingin menghapus 1 catatan? Tindakan ini tidak dapat dibatalkan.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Membatalkan';

  @override
  String get search => 'Mencari...';

  @override
  String get clear => 'Jernih';

  @override
  String get showMenu => 'Tampilkan menu';

  @override
  String get selectAll => 'Pilih semua';

  @override
  String get edit => 'Sunting';

  @override
  String get favorite => 'Favorit';

  @override
  String get atLeastOneTab => 'Anda memerlukan setidaknya satu tab';

  @override
  String get scrollableTabs => 'Tab yang dapat digulir';

  @override
  String get save => 'Menyimpan';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeDark => 'Gelap';

  @override
  String get themeLight => 'Lampu';

  @override
  String get pureBlackAmoled => 'Hitam murni (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'Gunakan warna hitam murni untuk layar AMOLED';

  @override
  String get systemColorScheme => 'Skema warna sistem';

  @override
  String get systemColorSchemeTooltip =>
      'Gunakan warna utama perangkat Anda untuk aplikasi';

  @override
  String get showImages => 'Tampilkan gambar';

  @override
  String get showImagesTooltip =>
      'Pilih dan tampilkan gambar di halaman buku harian dan makanan';

  @override
  String get curveLineGraphs => 'Grafik garis kurva';

  @override
  String get curveLineGraphsTooltip =>
      'Gunakan kurva halus pada halaman grafik';

  @override
  String get weightStatCards => 'Kartu status berat badan';

  @override
  String get weightStatCardsTooltip =>
      'Tampilkan entri bobot sebagai kisi kartu stat, bukan daftar default';

  @override
  String get graphsStartAtZero => 'Grafik dimulai dari nol';

  @override
  String get graphsStartAtZeroTooltip => 'Selalu awali grafik sumbu y dari nol';

  @override
  String get navigationAnimation => 'Animasi navigasi';

  @override
  String get animationFade => 'Memudar';

  @override
  String get animationZoom => 'Perbesar';

  @override
  String get animationSlide => 'Menggeser';

  @override
  String get animationRise => 'Bangkit';

  @override
  String get animationNone => 'Tidak ada';

  @override
  String longDateFormat(String example) {
    return 'Format tanggal panjang ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Format tanggal pendek ($example)';
  }

  @override
  String get diarySettings => 'Pengaturan buku harian';

  @override
  String get diaryUnit => 'Satuan buku harian';

  @override
  String get diarySummary => 'Ringkasan buku harian';

  @override
  String get diarySummaryDivision => 'Divisi - saat ini / total';

  @override
  String get diarySummaryRemaining => 'Tersisa';

  @override
  String get diarySummaryBoth => 'Keduanya - tersisa (total)';

  @override
  String get diarySummaryNone => 'Tidak ada';

  @override
  String get dailyCaloriesKcal => 'Kalori harian (kkal)';

  @override
  String get dailyProteinG => 'Protein harian (g)';

  @override
  String get dailyFatG => 'Lemak harian (g)';

  @override
  String get dailyCarbsG => 'Karbohidrat harian (g)';

  @override
  String get dailyFiberG => 'Serat harian (g)';

  @override
  String get automaticDailies => 'Target harian otomatis';

  @override
  String get automaticDailiesTooltip =>
      'Secara otomatis menghitung rekomendasi kalori, protein, lemak, dan karbohidrat harian dari berat badan Anda';

  @override
  String get selectNameOnSubmit => 'Pilih nama saat dikirim';

  @override
  String get reminders => 'Pengingat';

  @override
  String get foodSettings => 'Pengaturan makanan';

  @override
  String get foodUnit => 'Satuan makanan';

  @override
  String get fields => 'Bidang';

  @override
  String get favoriteNewFoods => 'Makanan baru favorit';

  @override
  String get pickFields => 'Pilih bidang';

  @override
  String get all => 'Semua';

  @override
  String get onlySelected => 'Hanya dipilih';

  @override
  String get weightSettings => 'Pengaturan berat badan';

  @override
  String get targetWeight => 'Berat sasaran';

  @override
  String get positiveReinforcement => 'Penguatan positif';

  @override
  String get positiveReinforcementPreview =>
      'Pesan-pesan yang menyemangati akan ditampilkan seperti ini!';

  @override
  String get dataSettings => 'Pengaturan data';

  @override
  String get automaticBackup => 'Pencadangan otomatis';

  @override
  String get shareDatabase => 'Bagikan basis data';

  @override
  String get openNotification => 'Buka notifikasi';

  @override
  String get automaticBackupsEnabled => 'Pencadangan otomatis diaktifkan';

  @override
  String get automaticBackupBody =>
      'FitBook akan secara otomatis mencadangkan data dan gambar Anda ke folder yang dipilih setiap hari.';

  @override
  String get backupSettings => 'Pengaturan cadangan';

  @override
  String get backupSettingsChannelDescription =>
      'Pemberitahuan tentang pencadangan otomatis';

  @override
  String get openFoodFacts => 'Buka Fakta Makanan';

  @override
  String get username => 'Nama belakang';

  @override
  String get password => 'Kata sandi';

  @override
  String get close => 'Menutup';

  @override
  String get loggedIn => 'Masuk';

  @override
  String get about => 'Tentang';

  @override
  String get version => 'Versi';

  @override
  String get whatsNew => 'Apa yang baru?';

  @override
  String get author => 'Pengarang';

  @override
  String get license => 'Lisensi';

  @override
  String get donate => 'Menyumbangkan';

  @override
  String get supportProject => 'Bantu dukung proyek ini';

  @override
  String get leaveReview => 'Tinggalkan ulasan';

  @override
  String get rateOnPlayStore => 'Nilai FitBook di Play Store';

  @override
  String get sourceCode => 'Kode sumber';

  @override
  String get foods => 'Makanan';

  @override
  String get backup => 'Cadangan';

  @override
  String get exportData => 'Ekspor data';

  @override
  String get importData => 'Impor data';

  @override
  String get failedImportData => 'Gagal mengimpor data';

  @override
  String get copyError => 'Kesalahan penyalinan';

  @override
  String get deleteRecords => 'Hapus catatan';

  @override
  String get unusedFood => 'Makanan yang tidak terpakai';

  @override
  String get database => 'Basis data';

  @override
  String get deleteAllWeightsConfirm =>
      'Apakah Anda yakin ingin menghapus semua bobot? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get deleteDatabaseConfirm =>
      'Apakah Anda yakin ingin menghapus database Anda? Tindakan ini tidak dapat dibatalkan dan akan menghancurkan semua data Anda.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Apakah Anda yakin ingin menghapus semua entri makanan dan buku harian? Tindakan ini tidak dapat dibatalkan.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Yakin ingin menghapus $count makanan yang tidak digunakan? Tindakan ini tidak dapat dibatalkan.',
      one:
          'Yakin ingin menghapus 1 makanan yang tidak digunakan? Tindakan ini tidak dapat dibatalkan.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Apakah Anda yakin ingin menghapus semua entri buku harian? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get ok => 'OKE';

  @override
  String get replaceImage => 'Ganti gambar';

  @override
  String get takePhoto => 'Ambil foto';

  @override
  String get deleteImage => 'Hapus gambar';

  @override
  String get filters => 'Filter';

  @override
  String get foodGroup => 'Kelompok makanan';

  @override
  String get exampleFruit => 'Buah';

  @override
  String clearFiltersCount(int count) {
    return 'Jelas ($count)';
  }

  @override
  String get done => 'Selesai';

  @override
  String get showFilters => 'Tampilkan filter';

  @override
  String get repeatEntry => 'Ulangi entri';

  @override
  String get timeOfDay => 'Waktu hari ini';

  @override
  String get everyDay => 'Setiap hari';

  @override
  String get repeatEveryDayForYear =>
      'Buat entri ini setiap hari untuk tahun berikutnya';

  @override
  String get repeatOn => 'Ulangi terus';

  @override
  String get weekdayMon => 'Senin';

  @override
  String get weekdayTue => 'Selasa';

  @override
  String get weekdayWed => 'Menikahi';

  @override
  String get weekdayThu => 'Kam';

  @override
  String get weekdayFri => 'Jumat';

  @override
  String get weekdaySat => 'Duduk';

  @override
  String get weekdaySun => 'Matahari';

  @override
  String get schedule => 'Jadwal';

  @override
  String get enterValidNutritionValues => 'Masukkan nilai nutrisi yang valid';

  @override
  String get quickAddTitle => 'Tambah cepat';

  @override
  String get kilojoules => 'Kilojoule';

  @override
  String get createdDate => 'Tanggal dibuat';

  @override
  String get failedMigrations => 'Migrasi gagal';

  @override
  String get failedMigrationsDescription =>
      'Ada yang tidak beres saat membuat atau mengupgrade database Anda. Biasanya hal ini dapat diperbaiki dengan menghapus dan membuat ulang catatan Anda.';

  @override
  String get errorMessage => 'Pesan kesalahan:';

  @override
  String get createIssue => 'Buat masalah';

  @override
  String get cameraPermissionRequired =>
      'Izin kamera diperlukan untuk memindai.';

  @override
  String get scanFoodBarcode => 'Pindai kode batang makanan';

  @override
  String get holdBarcodeInFrame => 'Pegang kode batang di dalam bingkai';

  @override
  String get pinchToZoom => 'Cubit untuk memperbesar';

  @override
  String get cameraStartFailed => 'Tidak dapat memulai kamera';

  @override
  String get editDiaryEntry => 'Edit entri buku harian';

  @override
  String get addFoodToDiary => 'Tambahkan makanan ke buku harian';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Apakah Anda yakin ingin menghapus $name?';
  }

  @override
  String get imageError => 'Kesalahan gambar';

  @override
  String get setImage => 'Tetapkan gambar';

  @override
  String get name => 'Nama';

  @override
  String get searchFoodsAndMeals => 'Cari makanan dan makanan...';

  @override
  String get clearSelection => 'Hapus pilihan';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Kode batang tidak ditemukan. Simpan untuk disisipkan.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Telusuri OpenFoodFacts untuk \"$name\"';
  }

  @override
  String get meal => 'Makanan';

  @override
  String get quantity => 'Kuantitas';

  @override
  String get unit => 'Satuan';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Penyajian ($amount $unit)';
  }

  @override
  String get barcode => 'kode batang';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (sesuai $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
    String nutrient,
    String quantity,
    String unit,
  ) {
    return '$nutrient untuk $quantity $unit';
  }

  @override
  String get fiber => 'Serat';

  @override
  String get unitServing => 'Porsi';

  @override
  String get unitGrams => 'gram';

  @override
  String get unitMilliliters => 'Mililiter';

  @override
  String get unitKilojoules => 'Kilojoule';

  @override
  String get unitCups => 'Piala';

  @override
  String get unitTablespoons => 'sendok makan';

  @override
  String get unitMilligrams => 'Miligram';

  @override
  String get unitTeaspoons => 'sendok teh';

  @override
  String get unitOunces => 'Ons';

  @override
  String get unitPounds => 'Pound';

  @override
  String get unitKilograms => 'Kilogram';

  @override
  String get unitLiters => 'liter';

  @override
  String get nameConflict => 'Konflik nama';

  @override
  String get replaceExistingFood =>
      'Makanan sudah ada dengan nama ini. Apakah Anda ingin mengganti yang lama?';

  @override
  String get no => 'TIDAK';

  @override
  String get yes => 'Ya';

  @override
  String get editFood => 'Sunting makanan';

  @override
  String confirmDeleteFood(String name) {
    return 'Apakah Anda yakin ingin menghapus $name?';
  }

  @override
  String get caloriesKcal => 'Kalori (kkal)';

  @override
  String get kilojoulesKj => 'Kilojoule (kJ)';

  @override
  String get servingSize => 'Ukuran porsi';

  @override
  String get servingUnit => 'Satuan penyajian';

  @override
  String get saveAsNewCopy => 'Simpan sebagai salinan baru';

  @override
  String get filterFoods => 'Saring makanan';

  @override
  String get narrowFoodsFilters =>
      'Persempit daftar menggunakan kombinasi filter apa pun.';

  @override
  String get foodDetails => 'Detail makanan';

  @override
  String get exampleFruitHint => 'misalnya Buah';

  @override
  String get servingSizeRangeHint =>
      'Tetapkan minimum, maksimum, atau keduanya.';

  @override
  String get minimum => 'Minimum';

  @override
  String get maximum => 'Maksimum';

  @override
  String get noMinimum => 'Tidak ada minimal';

  @override
  String get noMaximum => 'Tidak maksimal';

  @override
  String get clearAll => 'Hapus semuanya';

  @override
  String get searchOpenFoodFacts => 'Cari Fakta Makanan Terbuka';

  @override
  String get noMatchingProducts => 'Tidak ada produk yang cocok';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Coba nama lain atau pindai kode batang.';

  @override
  String get enterFoodNameToSearch =>
      'Masukkan nama makanan di atas, lalu kirimkan ke pencarian.';

  @override
  String get submitToSearch => 'Kirim untuk mencari...';

  @override
  String kcalValue(String value) {
    return '$value kkal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value gram protein';
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
  String get editMeal => 'Sunting makanan';

  @override
  String get addImage => 'Tambahkan gambar';

  @override
  String get noFoodsInMeal => 'Belum ada makanan dalam makanan ini';

  @override
  String get addFoodToMealHint =>
      'Tambahkan makanan untuk mulai membuat makanan ini.';

  @override
  String get remove => 'Menghapus';

  @override
  String get searchFoods => 'Cari makanan...';

  @override
  String get noFoodsFound => 'Tidak ada makanan yang ditemukan';

  @override
  String nothingMatchesSearch(String search) {
    return 'Tidak ada yang cocok dengan “$search”.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Tambahkan beberapa makanan ke perpustakaan Anda sebelum menambahkannya ke makanan.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kkal / 100 gram';
  }

  @override
  String get noDataYet => 'Belum ada datanya';

  @override
  String get completePlansToViewGraphs =>
      'Selesaikan beberapa rencana untuk melihat grafik di sini.';

  @override
  String get value => 'Nilai';

  @override
  String get goal => 'Sasaran';

  @override
  String get notSet => 'Tidak disetel';

  @override
  String get trend => 'Kecenderungan';

  @override
  String get smooth => 'Mulus';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rata-rata $count titik',
      one: 'Rata-rata 1 titik',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Sunting berat';

  @override
  String get addWeight => 'Tambahkan berat';

  @override
  String shareWeight(String value, String unit) {
    return 'Saya baru saja menimbang $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Berat ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Silakan masukkan berat badan';

  @override
  String get pleaseEnterValidWeight => 'Silakan masukkan berat yang valid';

  @override
  String get lastWeight => 'Berat terakhir';

  @override
  String unitWithValue(String unit) {
    return 'Satuan ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Pertahankan unit sebagai $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Ubah menjadi $unit';
  }

  @override
  String get removeImage => 'Hapus gambar';

  @override
  String get mealRemindersEnabled => 'Pengingat makan diaktifkan';

  @override
  String get mealRemindersEnabledBody =>
      'Kami akan mengingatkan Anda untuk mencatat sarapan, makan siang, atau makan malam jika Anda belum mencatatnya.';

  @override
  String get reminderSettingsChannel => 'Pengaturan pengingat';

  @override
  String get reminderSettingsChannelDescription =>
      'Pemberitahuan menjelaskan pengingat FitBook';

  @override
  String get breakfastReminderTitle => 'Jangan lupa untuk mencatat sarapan';

  @override
  String get breakfastRemindersChannel => 'Pengingat sarapan';

  @override
  String get breakfastRemindersChannelDescription =>
      'Pengingat untuk mencatat sarapan';

  @override
  String get lunchReminderTitle => 'Jangan lupa mencatat makan siangnya';

  @override
  String get lunchRemindersChannel => 'Pengingat makan siang';

  @override
  String get lunchRemindersChannelDescription =>
      'Pengingat untuk mencatat makan siang';

  @override
  String get dinnerReminderTitle => 'Jangan lupa untuk mencatat makan malam';

  @override
  String get dinnerRemindersChannel => 'Pengingat makan malam';

  @override
  String get dinnerRemindersChannelDescription =>
      'Pengingat untuk mencatat makan malam';

  @override
  String get reinforcementGreatJob =>
      'Kerja bagus! Kerja keras Anda membuahkan hasil.';

  @override
  String get reinforcementKeepItUp =>
      'Lanjutkan kerja baikmu! Anda membuat kemajuan luar biasa.';

  @override
  String get reinforcementFantastic =>
      'Fantastis! Dedikasi Anda mulai membuahkan hasil.';

  @override
  String get reinforcementWellDone =>
      'Bagus sekali! Anda selangkah lebih dekat ke tujuan Anda.';

  @override
  String get reinforcementImpressive =>
      'Menakjubkan! Upaya Anda membuahkan hasil.';

  @override
  String get reinforcementAmazing =>
      'Luar biasa! Anda berada di jalur yang benar.';

  @override
  String get reinforcementBravo =>
      'Bagus sekali! Komitmen Anda patut diacungi jempol.';

  @override
  String get reinforcementExcellent =>
      'Bagus sekali! Ketekunan Anda sangat menginspirasi.';

  @override
  String get reinforcementSuperb =>
      'Hebat! Anda melakukan pekerjaan luar biasa.';

  @override
  String get reinforcementIncredible =>
      'Menakjubkan! Kemajuan Anda terlihat jelas.';

  @override
  String get reinforcementWayToGoKing => 'Bagus sekali, Raja';

  @override
  String get reinforcementYeahBuddy => 'Ya sobat!';

  @override
  String get reinforcementThatsHowItsDone => 'Begitulah cara melakukannya.';

  @override
  String get reinforcementEasyAsPie => 'Mudah sekali.';

  @override
  String get reinforcementDoingGreat => 'Anda melakukannya dengan baik.';

  @override
  String get reinforcementProgressNice =>
      'Apakah itu kemajuan yang saya lihat? Bagus.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return '$remaining $unit tersisa';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return '$remaining $unit tersisa ($target $unit)';
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
  String get nutrientSaturatedFat => 'Lemak jenuh';

  @override
  String get nutrientCalcium => 'Kalsium';

  @override
  String get nutrientIron => 'Besi';

  @override
  String get nutrientPotassium => 'Kalium';

  @override
  String get nutrientMagnesium => 'Magnesium';

  @override
  String get nutrientVitaminA => 'vitamin A';

  @override
  String get nutrientVitaminC => 'Vitamin C';

  @override
  String get nutrientVitaminB12 => 'Vitamin B12';

  @override
  String get nutrientVitaminD => 'Vitamin D';

  @override
  String get nutrientVitaminE => 'Vitamin E';

  @override
  String get nutrientAddedSugar => 'Ditambahkan gula';

  @override
  String get nutrientNetCarbs => 'Karbohidrat bersih';

  @override
  String get nutrientWater => 'Air';

  @override
  String get nutrientOmega3 => 'Asam lemak omega-3';

  @override
  String get nutrientOmega6 => 'Asam lemak omega-6';

  @override
  String get nutrientPralScore => 'skor PRAL';

  @override
  String get nutrientTransFat => 'Lemak trans';

  @override
  String get nutrientSolubleFiber => 'Serat larut';

  @override
  String get nutrientInsolubleFiber => 'Serat tidak larut';

  @override
  String get nutrientPhosphorus => 'Fosfor';

  @override
  String get nutrientSodium => 'Sodium';

  @override
  String get nutrientZinc => 'Seng';

  @override
  String get nutrientCopper => 'Tembaga';

  @override
  String get nutrientManganese => 'mangan';

  @override
  String get nutrientSelenium => 'Selenium';

  @override
  String get nutrientFluoride => 'Fluor';

  @override
  String get nutrientMolybdenum => 'Molibdenum';

  @override
  String get nutrientChloride => 'Khlorida';

  @override
  String get nutrientSucrose => 'sukrosa';

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
  String get nutrientStarch => 'Pati';

  @override
  String get nutrientSugarAlcohols => 'Alkohol gula';

  @override
  String get nutrientThiaminB1 => 'Tiamin (B1)';

  @override
  String get nutrientRiboflavinB2 => 'Riboflavin (B2)';

  @override
  String get nutrientNiacinB3 => 'Niasin (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'Asam pantotenat (B5)';

  @override
  String get nutrientVitaminB6 => 'Vitamin B6';

  @override
  String get nutrientBiotinB7 => 'Biotin (B7)';

  @override
  String get nutrientFolateB9 => 'Folat (B9)';

  @override
  String get nutrientFolicAcid => 'Asam folat';

  @override
  String get nutrientFoodFolate => 'Folat makanan';

  @override
  String get nutrientFolateDfe => 'Setara folat makanan (DFE)';

  @override
  String get nutrientCholine => 'Kolin';

  @override
  String get nutrientBetaine => 'betaine';

  @override
  String get nutrientRetinol => 'Retinol';

  @override
  String get nutrientBetaCarotene => 'Beta-karoten';

  @override
  String get nutrientAlphaCarotene => 'Alfa-karoten';

  @override
  String get nutrientLycopene => 'likopen';

  @override
  String get nutrientLuteinZeaxanthin => 'Lutein + zeaksantin';

  @override
  String get nutrientVitaminD2 => 'Vitamin D2 (ergokalsiferol)';

  @override
  String get nutrientVitaminD3 => 'Vitamin D3 (kolekalsiferol)';

  @override
  String get nutrientVitaminK => 'Vitamin K';

  @override
  String get nutrientDihydrophylloquinone => 'Dihidrofilokuinon';

  @override
  String get nutrientMenaquinone4 => 'Menaquinon-4';

  @override
  String get nutrientMonounsaturatedFat => 'Lemak tak jenuh tunggal';

  @override
  String get nutrientPolyunsaturatedFat => 'Lemak tak jenuh ganda';

  @override
  String get nutrientAla => 'Asam alfa-linolenat (ALA)';

  @override
  String get nutrientEpa => 'Asam eicosapentaenoic (EPA)';

  @override
  String get nutrientDpa => 'Asam dokosapentaenoat (DPA)';

  @override
  String get nutrientDha => 'Asam docosahexaenoic (DHA)';

  @override
  String get nutrientAlanine => 'Alanin';

  @override
  String get nutrientAlcohol => 'Alkohol';

  @override
  String get nutrientArginine => 'Arginin';

  @override
  String get nutrientAsparticAcid => 'Asam aspartat';

  @override
  String get nutrientCystine => 'sistin';

  @override
  String get nutrientGlutamicAcid => 'Asam glutamat';

  @override
  String get nutrientGlycine => 'Glisin';

  @override
  String get nutrientHistidine => 'Histidin';

  @override
  String get nutrientHydroxyproline => 'Hidroksiprolin';

  @override
  String get nutrientIsoleucine => 'Isoleusin';

  @override
  String get nutrientLeucine => 'Leusin';

  @override
  String get nutrientLysine => 'lisin';

  @override
  String get nutrientMethionine => 'Metionin';

  @override
  String get nutrientPhenylalanine => 'Fenilalanin';

  @override
  String get nutrientProline => 'Prolin';

  @override
  String get nutrientSerine => 'Serin';

  @override
  String get nutrientThreonine => 'Treonin';

  @override
  String get nutrientTryptophan => 'triptofan';

  @override
  String get nutrientTyrosine => 'Tirosin';

  @override
  String get nutrientValine => 'Valin';

  @override
  String get nutrientCaffeine => 'Kafein';

  @override
  String get nutrientTheobromine => 'Teobromin';

  @override
  String servingWeightNumber(int number) {
    return 'Berat porsi $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'Deskripsi penyajian $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'Berat setara dengan 200 kkal';
}
