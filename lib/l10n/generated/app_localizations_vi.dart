// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Nhật ký';

  @override
  String get navGraph => 'Biểu đồ';

  @override
  String get navFood => 'Thực phẩm';

  @override
  String get navWeight => 'Trọng lượng';

  @override
  String get navError => 'Lỗi';

  @override
  String get loadDataFailed => 'Không thể tải dữ liệu này.';

  @override
  String get settings => 'Cài đặt';

  @override
  String get invalidTabSettings => 'Cài đặt tab không hợp lệ.';

  @override
  String newVersion(String version) {
    return 'Phiên bản mới $version';
  }

  @override
  String get changes => 'Thay đổi';

  @override
  String get searchSettings => 'Cài đặt tìm kiếm...';

  @override
  String get appearance => 'Ngoại quan';

  @override
  String get appearanceSubtitle => 'Chủ đề, màu sắc và biểu đồ hiển thị';

  @override
  String get diary => 'Nhật ký';

  @override
  String get diarySubtitle => 'Mục tiêu hàng ngày, tóm tắt và ghi nhật ký';

  @override
  String get food => 'Thực phẩm';

  @override
  String get foodSubtitle => 'Đơn vị thực phẩm, cánh đồng và mặc định';

  @override
  String get weight => 'Trọng lượng';

  @override
  String get weightSubtitle => 'Đơn vị trọng lượng, mục tiêu và hiển thị';

  @override
  String get tabs => 'Tab';

  @override
  String get tabsSubtitle => 'Tab điều hướng và thứ tự';

  @override
  String get data => 'Dữ liệu';

  @override
  String get dataSubtitle => 'Nhập, xuất và dữ liệu địa phương';

  @override
  String get todayProgress => 'Tiến độ của ngày hôm nay';

  @override
  String get latestDay => 'Ngày gần nhất';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mục nhập được ghi lại',
      one: '1 mục nhập được ghi lại',
      zero: 'Không có mục nhập nào được ghi lại',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chỉnh sửa $count mục',
      one: 'Chỉnh sửa 1 mục',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Calo';

  @override
  String get protein => 'Chất đạm';

  @override
  String get carbs => 'Carbohydrate';

  @override
  String get fat => 'Chất béo';

  @override
  String get addDiaryEntry => 'Thêm mục nhật ký';

  @override
  String get noEntriesToday => 'Hôm nay không có mục nhập nào.';

  @override
  String addSearchToDiary(String search) {
    return 'Thêm \"$search\" vào nhật ký của bạn';
  }

  @override
  String get tapStartLoggingFood => 'Nhấn để bắt đầu ghi nhật ký đồ ăn.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Không có mục nhập nhật ký phù hợp. Nhấn để tạo món ăn này và ghi lại.';

  @override
  String get add => 'Thêm';

  @override
  String get quickAdd => 'Thêm nhanh';

  @override
  String get scanBarcode => 'Quét mã vạch';

  @override
  String get foodLibrary => 'Thư viện thực phẩm';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount thực phẩm',
      one: '1 thực phẩm',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount bữa ăn',
      one: '1 bữa ăn',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'Được sử dụng gần đây';

  @override
  String get quickActions => 'Hành động nhanh chóng';

  @override
  String get addFood => 'Thêm đồ ăn';

  @override
  String get createMeal => 'Tạo bữa ăn';

  @override
  String get noFoodYet => 'Chưa có đồ ăn';

  @override
  String get noMatchingFood => 'Không có đồ ăn phù hợp';

  @override
  String get addFirstFoodOrMeal =>
      'Thêm thực phẩm hoặc bữa ăn đầu tiên của quý vị để bắt đầu xây dựng thư viện của quý vị.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Không có kết quả nào khớp với “$search”. Xóa tìm kiếm để xem lại mọi thứ.';
  }

  @override
  String get clearSearch => 'Xóa tìm kiếm';

  @override
  String get addMeal => 'Thêm bữa ăn';

  @override
  String get noWeightsYet => 'Chưa có trọng lượng';

  @override
  String get noMatchingWeights => 'Không có trọng lượng phù hợp';

  @override
  String get logFirstWeight =>
      'Ghi lại trọng lượng đầu tiên của bạn để bắt đầu theo dõi xu hướng của bạn.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Không có kết quả nào khớp với “$search”. Xóa tìm kiếm để xem tất cả các mục nhập.';
  }

  @override
  String get logWeight => 'Trọng lượng gỗ tròn';

  @override
  String get weightTrend => 'Xu hướng trọng lượng';

  @override
  String get weightTrendSubtitle => 'Các phép đo gần đây và hướng tổng thể';

  @override
  String get bodyWeight => 'Trọng lượng cơ thể';

  @override
  String get options => 'Tùy chọn';

  @override
  String get day => 'Ngày';

  @override
  String get today => 'Hôm nay';

  @override
  String get week => 'Tuần';

  @override
  String get month => 'Tháng';

  @override
  String get year => 'Năm';

  @override
  String get dateRange => 'Phạm vi ngày';

  @override
  String get startDate => 'Ngày bắt đầu';

  @override
  String get stopDate => 'Ngày kết thúc';

  @override
  String get dataPoints => 'Điểm dữ liệu';

  @override
  String get customizeFields => 'Tùy chỉnh các trường';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get languageSubtitle => 'Chọn ngôn ngữ được FitBook sử dụng';

  @override
  String get languageSystem => 'Hệ thống';

  @override
  String get languageEnglish => 'Tiếng Anh';

  @override
  String get languageSpanish => 'Tiếng Tây Ban Nha';

  @override
  String get languageFrench => 'Tiếng Pháp';

  @override
  String get languageGerman => 'Tiếng Đức';

  @override
  String get languageItalian => 'Tiếng Ý';

  @override
  String get languagePortugueseBrazil => 'Tiếng Bồ Đào Nha (Brazil)';

  @override
  String get languageDutch => 'Tiếng Hà Lan';

  @override
  String get languagePolish => 'Tiếng Ba Lan';

  @override
  String get languageJapanese => 'Tiếng Nhật';

  @override
  String get languageKorean => 'Tiếng Hàn';

  @override
  String get languageChineseSimplified => 'Tiếng Trung (Giản thể)';

  @override
  String get languageChineseTraditional => 'Tiếng Trung (Phồn thể)';

  @override
  String get languageRussian => 'Tiếng Nga';

  @override
  String get languageHindi => 'Tiếng Hindi';

  @override
  String get languageIndonesian => 'Tiếng Indonesia';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get languageThai => 'Tiếng Thái';

  @override
  String get languageBengali => 'Tiếng Bengal';

  @override
  String get languageUrdu => 'Tiếng Urdu';

  @override
  String get languagePersian => 'Tiếng Ba Tư';

  @override
  String get languageMalay => 'Tiếng Mã Lai';

  @override
  String get appearanceSettings => 'Cài đặt giao diện';

  @override
  String get delete => 'Xóa';

  @override
  String get confirmDelete => 'Xác nhận xóa';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bạn có chắc chắn muốn xóa $count bản ghi không? Hành động này không thể đảo ngược.',
      one:
          'Bạn có chắc chắn muốn xóa 1 bản ghi không? Hành động này không thể đảo ngược.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Hủy';

  @override
  String get search => 'Tìm kiếm...';

  @override
  String get clear => 'Xóa';

  @override
  String get showMenu => 'Hiển thị menu';

  @override
  String get selectAll => 'Chọn tất cả';

  @override
  String get edit => 'Chỉnh sửa';

  @override
  String get favorite => 'Yêu thích';

  @override
  String get atLeastOneTab => 'Bạn cần ít nhất one tab';

  @override
  String get scrollableTabs => 'Các tab có thể cuộn';

  @override
  String get save => 'Lưu';

  @override
  String get themeSystem => 'Hệ thống';

  @override
  String get themeDark => 'Tối';

  @override
  String get themeLight => 'Sáng';

  @override
  String get pureBlackAmoled => 'Đen tinh khiết (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'Sử dụng màu đen tinh khiết cho màn hình AMOLED';

  @override
  String get systemColorScheme => 'Bảng màu hệ thống';

  @override
  String get systemColorSchemeTooltip =>
      'Sử dụng màu chính của thiết bị cho ứng dụng';

  @override
  String get showImages => 'Hiển thị hình ảnh';

  @override
  String get showImagesTooltip =>
      'Chọn và hiển thị hình ảnh trên nhật ký và trang thực phẩm';

  @override
  String get curveLineGraphs => 'Đồ thị đường cong';

  @override
  String get curveLineGraphsTooltip =>
      'Sử dụng các đường cong mượt mà trên trang đồ thị';

  @override
  String get weightStatCards => 'Phiếu thống kê trọng lượng';

  @override
  String get weightStatCardsTooltip =>
      'Hiển thị các mục nhập trọng lượng dưới dạng lưới các thẻ chỉ số thay vì danh sách mặc định';

  @override
  String get graphsStartAtZero => 'Đồ thị bắt đầu từ 0';

  @override
  String get graphsStartAtZeroTooltip => 'Luôn bắt đầu biểu đồ trục y bằng 0';

  @override
  String get navigationAnimation => 'Hoạt ảnh điều hướng';

  @override
  String get animationFade => 'Mờ dần';

  @override
  String get animationZoom => 'Thu phóng';

  @override
  String get animationSlide => 'Trượt';

  @override
  String get animationRise => 'Tăng';

  @override
  String get animationNone => 'Không';

  @override
  String longDateFormat(String example) {
    return 'Định dạng ngày dài ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Định dạng ngày ngắn ($example)';
  }

  @override
  String get diarySettings => 'Cài đặt nhật ký';

  @override
  String get diaryUnit => 'Đơn vị nhật ký';

  @override
  String get diarySummary => 'Tóm tắt nhật ký';

  @override
  String get diarySummaryDivision => 'Bộ phận - hiện tại / tổng cộng';

  @override
  String get diarySummaryRemaining => 'Còn lại';

  @override
  String get diarySummaryBoth => 'Cả hai - còn lại (tổng cộng)';

  @override
  String get diarySummaryNone => 'Không';

  @override
  String get dailyCaloriesKcal => 'Lượng calo hàng ngày (kcal)';

  @override
  String get dailyProteinG => 'Protein hàng ngày (g)';

  @override
  String get dailyFatG => 'Chất béo hàng ngày (g)';

  @override
  String get dailyCarbsG => 'Carbs hàng ngày (g)';

  @override
  String get dailyFiberG => 'Chất xơ hàng ngày (g)';

  @override
  String get automaticDailies => 'Mục tiêu tự động hàng ngày';

  @override
  String get automaticDailiesTooltip =>
      'Tự động tính toán lượng calo, protein, chất béo và carbs khuyến nghị hàng ngày từ trọng lượng cơ thể của bạn';

  @override
  String get selectNameOnSubmit => 'Chọn tên khi gửi';

  @override
  String get reminders => 'Lời nhắc';

  @override
  String get foodSettings => 'Cài đặt thực phẩm';

  @override
  String get foodUnit => 'Đơn vị thực phẩm';

  @override
  String get fields => 'Trường';

  @override
  String get favoriteNewFoods => 'Món ăn mới yêu thích';

  @override
  String get pickFields => 'Chọn trường';

  @override
  String get all => 'Tất cả';

  @override
  String get onlySelected => 'Chỉ được chọn';

  @override
  String get weightSettings => 'Cài đặt trọng lượng';

  @override
  String get targetWeight => 'Trọng lượng mục tiêu';

  @override
  String get positiveReinforcement => 'Tăng cường tích cực';

  @override
  String get positiveReinforcementPreview =>
      'Tin nhắn khích lệ sẽ được hiển thị như thế này!';

  @override
  String get dataSettings => 'Cài đặt dữ liệu';

  @override
  String get automaticBackup => 'Sao lưu tự động';

  @override
  String get shareDatabase => 'Chia sẻ cơ sở dữ liệu';

  @override
  String get openNotification => 'Mở thông báo';

  @override
  String get automaticBackupsEnabled => 'Đã bật sao lưu tự động';

  @override
  String get automaticBackupBody =>
      'FitBook sẽ tự động sao lưu dữ liệu và hình ảnh của bạn vào thư mục đã chọn mỗi ngày.';

  @override
  String get backupSettings => 'Cài đặt sao lưu';

  @override
  String get backupSettingsChannelDescription => 'Thông báo về sao lưu tự động';

  @override
  String get openFoodFacts => 'Thông tin về thực phẩm mở';

  @override
  String get username => 'Tên người dùng';

  @override
  String get password => 'Mật khẩu';

  @override
  String get close => 'Đóng';

  @override
  String get loggedIn => 'Đã đăng nhập';

  @override
  String get about => 'Giới thiệu';

  @override
  String get version => 'Phiên bản';

  @override
  String get whatsNew => 'Có gì mới?';

  @override
  String get author => 'Tác giả';

  @override
  String get license => 'Giấy phép';

  @override
  String get donate => 'Quyên góp';

  @override
  String get supportProject => 'Giúp hỗ trợ dự án này';

  @override
  String get leaveReview => 'Để lại đánh giá';

  @override
  String get rateOnPlayStore => 'Xếp hạng FitBook trên Play Store';

  @override
  String get sourceCode => 'Mã nguồn';

  @override
  String get foods => 'Thực phẩm';

  @override
  String get backup => 'Sao lưu';

  @override
  String get exportData => 'Xuất dữ liệu';

  @override
  String get importData => 'Nhập dữ liệu';

  @override
  String get failedImportData => 'Không thể nhập dữ liệu';

  @override
  String get copyError => 'Lỗi sao chép';

  @override
  String get deleteRecords => 'Xóa bản ghi';

  @override
  String get unusedFood => 'Thực phẩm chưa sử dụng';

  @override
  String get database => 'Cơ sở dữ liệu';

  @override
  String get deleteAllWeightsConfirm =>
      'Bạn có chắc chắn muốn xóa tất cả các trọng số không? Hành động này không thể đảo ngược.';

  @override
  String get deleteDatabaseConfirm =>
      'Bạn có chắc chắn muốn xóa cơ sở dữ liệu của mình không? Hành động này không thể đảo ngược và sẽ phá hủy tất cả dữ liệu của bạn.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Bạn có chắc chắn muốn xóa tất cả các mục nhập thực phẩm và nhật ký không? Hành động này không thể đảo ngược.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bạn có chắc chắn muốn xóa $count thực phẩm chưa sử dụng không? Hành động này là không thể đảo ngược.',
      one:
          'Bạn có chắc chắn muốn xóa 1 thực phẩm chưa sử dụng không? Hành động này là không thể đảo ngược.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Bạn có chắc chắn muốn xóa tất cả các mục nhật ký không? Hành động này không thể đảo ngược.';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Thay thế hình ảnh';

  @override
  String get takePhoto => 'Chụp ảnh';

  @override
  String get deleteImage => 'Xóa hình ảnh';

  @override
  String get filters => 'Bộ lọc';

  @override
  String get foodGroup => 'Nhóm thực phẩm';

  @override
  String get exampleFruit => 'Trái cây';

  @override
  String clearFiltersCount(int count) {
    return 'Xóa ($count)';
  }

  @override
  String get done => 'Hoàn tất';

  @override
  String get showFilters => 'Hiển thị bộ lọc';

  @override
  String get repeatEntry => 'Nhập lại';

  @override
  String get timeOfDay => 'Thời gian trong ngày';

  @override
  String get everyDay => 'Mỗi ngày';

  @override
  String get repeatEveryDayForYear =>
      'Tạo mục nhập này mỗi ngày cho năm tiếp theo';

  @override
  String get repeatOn => 'Lặp lại vào';

  @override
  String get weekdayMon => 'T2';

  @override
  String get weekdayTue => 'Thứ Ba';

  @override
  String get weekdayWed => 'T4';

  @override
  String get weekdayThu => 'T5';

  @override
  String get weekdayFri => 'T6';

  @override
  String get weekdaySat => 'T7';

  @override
  String get weekdaySun => 'CN';

  @override
  String get schedule => 'Lịch trình';

  @override
  String get enterValidNutritionValues => 'Nhập giá trị dinh dưỡng hợp lệ';

  @override
  String get quickAddTitle => 'Thêm nhanh';

  @override
  String get kilojoules => 'Kilôjun';

  @override
  String get createdDate => 'Ngày tạo';

  @override
  String get failedMigrations => 'Di chuyển không thành công';

  @override
  String get failedMigrationsDescription =>
      'Đã xảy ra lỗi khi tạo hoặc nâng cấp cơ sở dữ liệu của bạn. Thông thường, điều này có thể được khắc phục bằng cách xóa và tạo lại hồ sơ của quý vị.';

  @override
  String get errorMessage => 'Thông báo lỗi:';

  @override
  String get createIssue => 'Tạo vấn đề';

  @override
  String get cameraPermissionRequired =>
      'Cần có quyền truy cập camera để quét.';

  @override
  String get scanFoodBarcode => 'Quét mã vạch thực phẩm';

  @override
  String get holdBarcodeInFrame => 'Giữ mã vạch bên trong khung';

  @override
  String get pinchToZoom => 'Chụm để thu phóng';

  @override
  String get cameraStartFailed => 'Không thể khởi động máy ảnh';

  @override
  String get editDiaryEntry => 'Chỉnh sửa mục nhập nhật ký';

  @override
  String get addFoodToDiary => 'Thêm thực phẩm vào nhật ký';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Bạn có chắc chắn muốn xóa $name không?';
  }

  @override
  String get imageError => 'Lỗi hình ảnh';

  @override
  String get setImage => 'Đặt hình ảnh';

  @override
  String get name => 'Tên';

  @override
  String get searchFoodsAndMeals => 'Tìm kiếm thực phẩm và bữa ăn...';

  @override
  String get clearSelection => 'Xóa lựa chọn';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Không tìm thấy mã vạch. Lưu để chèn.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Tìm kiếm OpenFoodFacts cho \"$name\"';
  }

  @override
  String get meal => 'Bữa ăn';

  @override
  String get quantity => 'Số lượng';

  @override
  String get unit => 'Đơn vị';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Phục vụ ($amount $unit)';
  }

  @override
  String get barcode => 'Mã vạch';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (mỗi $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '$nutrient trên $quantity $unit';
  }

  @override
  String get fiber => 'Chất xơ';

  @override
  String get unitServing => 'Phục vụ';

  @override
  String get unitGrams => 'Gram';

  @override
  String get unitMilliliters => 'Mi-li-lít';

  @override
  String get unitKilojoules => 'Kilôjun';

  @override
  String get unitCups => 'Cốc';

  @override
  String get unitTablespoons => 'Muỗng canh';

  @override
  String get unitMilligrams => 'Miligam';

  @override
  String get unitTeaspoons => 'Muỗng cà phê';

  @override
  String get unitOunces => 'Ounce';

  @override
  String get unitPounds => 'Pound';

  @override
  String get unitKilograms => 'Kilôgam';

  @override
  String get unitLiters => 'Lít';

  @override
  String get nameConflict => 'Xung đột tên';

  @override
  String get replaceExistingFood =>
      'Một món ăn đã tồn tại với tên này. Bạn có muốn thay thế one cũ không?';

  @override
  String get no => 'Không';

  @override
  String get yes => 'Có';

  @override
  String get editFood => 'Chỉnh sửa đồ ăn';

  @override
  String confirmDeleteFood(String name) {
    return 'Bạn có chắc chắn muốn xóa $name không?';
  }

  @override
  String get caloriesKcal => 'Calo (kcal)';

  @override
  String get kilojoulesKj => 'Kilôjun (kJ)';

  @override
  String get servingSize => 'Kích thước khẩu phần';

  @override
  String get servingUnit => 'Thiết bị phục vụ';

  @override
  String get saveAsNewCopy => 'Lưu dưới dạng bản sao mới';

  @override
  String get filterFoods => 'Lọc thực phẩm';

  @override
  String get narrowFoodsFilters =>
      'Thu hẹp danh sách bằng cách sử dụng bất kỳ kết hợp các bộ lọc nào.';

  @override
  String get foodDetails => 'Chi tiết đồ ăn';

  @override
  String get exampleFruitHint => 'ví dụ: Trái cây';

  @override
  String get servingSizeRangeHint => 'Đặt mức tối thiểu, tối đa hoặc cả hai.';

  @override
  String get minimum => 'Tối thiểu';

  @override
  String get maximum => 'Tối đa';

  @override
  String get noMinimum => 'Không có mức tối thiểu';

  @override
  String get noMaximum => 'Không có tối đa';

  @override
  String get clearAll => 'Xóa tất cả';

  @override
  String get searchOpenFoodFacts => 'Tìm kiếm thông tin về thực phẩm mở';

  @override
  String get noMatchingProducts => 'Không có sản phẩm phù hợp';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Hãy thử tên khác hoặc quét mã vạch.';

  @override
  String get enterFoodNameToSearch =>
      'Nhập tên thực phẩm ở trên, sau đó gửi để tìm kiếm.';

  @override
  String get submitToSearch => 'Gửi để tìm kiếm...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g chất đạm';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chỉnh sửa $count thực phẩm',
      one: 'Chỉnh sửa 1 thực phẩm',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'Chỉnh sửa bữa ăn';

  @override
  String get addImage => 'Thêm hình ảnh';

  @override
  String get noFoodsInMeal => 'Chưa có thực phẩm nào trong bữa ăn này';

  @override
  String get addFoodToMealHint =>
      'Thêm thực phẩm để bắt đầu xây dựng bữa ăn này.';

  @override
  String get remove => 'Xóa';

  @override
  String get searchFoods => 'Tìm kiếm thực phẩm...';

  @override
  String get noFoodsFound => 'Không tìm thấy thực phẩm';

  @override
  String nothingMatchesSearch(String search) {
    return 'Không có kết quả nào khớp với “$search”.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Thêm một số thực phẩm vào thư viện của bạn trước khi thêm chúng vào bữa ăn.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'Chưa có dữ liệu';

  @override
  String get completePlansToViewGraphs =>
      'Hoàn thành một số kế hoạch để xem biểu đồ tại đây.';

  @override
  String get value => 'Giá trị';

  @override
  String get goal => 'Mục tiêu';

  @override
  String get notSet => 'Chưa thiết lập';

  @override
  String get trend => 'Xu hướng';

  @override
  String get smooth => 'Mịn màng';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Trung bình $count điểm',
      one: 'Trung bình 1 điểm',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Chỉnh sửa trọng lượng';

  @override
  String get addWeight => 'Thêm trọng lượng';

  @override
  String shareWeight(String value, String unit) {
    return 'Tôi vừa cân $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Trọng lượng ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Vui lòng nhập trọng lượng';

  @override
  String get pleaseEnterValidWeight => 'Vui lòng nhập trọng lượng hợp lệ';

  @override
  String get lastWeight => 'Trọng lượng cuối cùng';

  @override
  String unitWithValue(String unit) {
    return 'Đơn vị ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Giữ đơn vị dưới dạng $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Chuyển đổi thành $unit';
  }

  @override
  String get removeImage => 'Xóa hình ảnh';

  @override
  String get mealRemindersEnabled => 'Đã bật lời nhắc bữa ăn';

  @override
  String get mealRemindersEnabledBody =>
      'Chúng tôi sẽ nhắc bạn ghi lại bữa sáng, bữa trưa hoặc bữa tối nếu bạn chưa ghi lại.';

  @override
  String get reminderSettingsChannel => 'Cài đặt lời nhắc';

  @override
  String get reminderSettingsChannelDescription =>
      'Thông báo giải thích lời nhắc FitBook';

  @override
  String get breakfastReminderTitle => 'Đừng quên ghi nhật ký bữa sáng';

  @override
  String get breakfastRemindersChannel => 'Nhắc nhở về bữa sáng';

  @override
  String get breakfastRemindersChannelDescription =>
      'Lời nhắc ghi lại bữa sáng';

  @override
  String get lunchReminderTitle => 'Đừng quên ghi nhật ký bữa trưa';

  @override
  String get lunchRemindersChannel => 'Nhắc nhở ăn trưa';

  @override
  String get lunchRemindersChannelDescription => 'Lời nhắc ghi nhật ký ăn trưa';

  @override
  String get dinnerReminderTitle => 'Đừng quên ghi nhật ký bữa tối';

  @override
  String get dinnerRemindersChannel => 'Lời nhắc về bữa tối';

  @override
  String get dinnerRemindersChannelDescription => 'Lời nhắc ghi nhật ký ăn tối';

  @override
  String get reinforcementGreatJob =>
      'Làm tốt lắm! Công việc khó khăn của bạn đang được đền đáp.';

  @override
  String get reinforcementKeepItUp =>
      'Hãy tiếp tục! Bạn đang đạt được tiến bộ tuyệt vời.';

  @override
  String get reinforcementFantastic =>
      'Tuyệt vời! Sự cống hiến của bạn đang cho thấy kết quả.';

  @override
  String get reinforcementWellDone =>
      'Làm tốt lắm! Bạn đã one tiến gần hơn đến mục tiêu của mình.';

  @override
  String get reinforcementImpressive =>
      'Thật ấn tượng! Nỗ lực của bạn đang mang lại kết quả.';

  @override
  String get reinforcementAmazing => 'Tuyệt vời! Bạn đang đi đúng hướng.';

  @override
  String get reinforcementBravo =>
      'Hoan hô! Cam kết của bạn thật đáng khen ngợi.';

  @override
  String get reinforcementExcellent =>
      'Tuyệt vời! Sự kiên trì của bạn là nguồn cảm hứng.';

  @override
  String get reinforcementSuperb =>
      'Tuyệt vời! Bạn đang làm một công việc xuất sắc.';

  @override
  String get reinforcementIncredible =>
      'Thật đáng kinh ngạc! Tiến độ của bạn thật đáng chú ý.';

  @override
  String get reinforcementWayToGoKing => 'Cách để trở thành Vua';

  @override
  String get reinforcementYeahBuddy => 'Yeah anh bạn!';

  @override
  String get reinforcementThatsHowItsDone => 'Đó là cách nó được thực hiện.';

  @override
  String get reinforcementEasyAsPie => 'Dễ như ăn bánh.';

  @override
  String get reinforcementDoingGreat => 'Bạn đang làm rất tốt.';

  @override
  String get reinforcementProgressNice =>
      'Đó có phải là sự tiến bộ mà tôi thấy không? Rất tốt.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'Còn lại $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return '$remaining $unit còn lại ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'Đường';

  @override
  String get nutrientCholesterol => 'Cholesterol';

  @override
  String get nutrientSaturatedFat => 'Chất béo bão hòa';

  @override
  String get nutrientCalcium => 'Canxi';

  @override
  String get nutrientIron => 'Sắt';

  @override
  String get nutrientPotassium => 'Kali';

  @override
  String get nutrientMagnesium => 'Magiê';

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
  String get nutrientAddedSugar => 'Đường bổ sung';

  @override
  String get nutrientNetCarbs => 'Cacbohydrat ròng';

  @override
  String get nutrientWater => 'Nước';

  @override
  String get nutrientOmega3 => 'Axit béo omega-3';

  @override
  String get nutrientOmega6 => 'Axit béo Omega-6';

  @override
  String get nutrientPralScore => 'Điểm PRAL';

  @override
  String get nutrientTransFat => 'Chất béo chuyển hóa';

  @override
  String get nutrientSolubleFiber => 'Chất xơ hòa tan';

  @override
  String get nutrientInsolubleFiber => 'Chất xơ không hòa tan';

  @override
  String get nutrientPhosphorus => 'Photpho';

  @override
  String get nutrientSodium => 'Natri';

  @override
  String get nutrientZinc => 'Kẽm';

  @override
  String get nutrientCopper => 'Đồng';

  @override
  String get nutrientManganese => 'Mangan';

  @override
  String get nutrientSelenium => 'Selen';

  @override
  String get nutrientFluoride => 'Florua';

  @override
  String get nutrientMolybdenum => 'Molypden';

  @override
  String get nutrientChloride => 'Clorua';

  @override
  String get nutrientSucrose => 'Sucroza';

  @override
  String get nutrientGlucose => 'Glucose';

  @override
  String get nutrientFructose => 'Fructoza';

  @override
  String get nutrientLactose => 'Lactoza';

  @override
  String get nutrientMaltose => 'Maltose';

  @override
  String get nutrientGalactose => 'Galactoza';

  @override
  String get nutrientStarch => 'Tinh bột';

  @override
  String get nutrientSugarAlcohols => 'Cồn đường';

  @override
  String get nutrientThiaminB1 => 'Thiamin (B1)';

  @override
  String get nutrientRiboflavinB2 => 'Riboflavin (B2)';

  @override
  String get nutrientNiacinB3 => 'Niacin (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'Axit pantothenic (B5)';

  @override
  String get nutrientVitaminB6 => 'Vitamin B6';

  @override
  String get nutrientBiotinB7 => 'Biotin (B7)';

  @override
  String get nutrientFolateB9 => 'Folat (B9)';

  @override
  String get nutrientFolicAcid => 'Axit folic';

  @override
  String get nutrientFoodFolate => 'Folate thực phẩm';

  @override
  String get nutrientFolateDfe => 'Chế độ ăn uống tương đương folate (DFE)';

  @override
  String get nutrientCholine => 'Choline';

  @override
  String get nutrientBetaine => 'Betaine';

  @override
  String get nutrientRetinol => 'Retinol';

  @override
  String get nutrientBetaCarotene => 'Beta-carotene';

  @override
  String get nutrientAlphaCarotene => 'Alpha-caroten';

  @override
  String get nutrientLycopene => 'Lycopene';

  @override
  String get nutrientLuteinZeaxanthin => 'Lutein + zeaxanthin';

  @override
  String get nutrientVitaminD2 => 'Vitamin D2 (ergocalciferol)';

  @override
  String get nutrientVitaminD3 => 'Vitamin D3 (cholecalciferol)';

  @override
  String get nutrientVitaminK => 'Vitamin K';

  @override
  String get nutrientDihydrophylloquinone => 'Dihydrophylloquinone';

  @override
  String get nutrientMenaquinone4 => 'Menaquinone-4';

  @override
  String get nutrientMonounsaturatedFat => 'Chất béo không bão hòa đơn';

  @override
  String get nutrientPolyunsaturatedFat => 'Chất béo không bão hòa đa';

  @override
  String get nutrientAla => 'Axit alpha-linolenic (ALA)';

  @override
  String get nutrientEpa => 'Axit eicosapentaenoic (EPA)';

  @override
  String get nutrientDpa => 'Axit Docosapentaenoic (DPA)';

  @override
  String get nutrientDha => 'Axit Docosahexaenoic (DHA)';

  @override
  String get nutrientAlanine => 'Alanine';

  @override
  String get nutrientAlcohol => 'Rượu';

  @override
  String get nutrientArginine => 'Arginine';

  @override
  String get nutrientAsparticAcid => 'Axit aspartic';

  @override
  String get nutrientCystine => 'Cystine';

  @override
  String get nutrientGlutamicAcid => 'Axit glutamic';

  @override
  String get nutrientGlycine => 'Glycine';

  @override
  String get nutrientHistidine => 'Histidin';

  @override
  String get nutrientHydroxyproline => 'Hydroxyproline';

  @override
  String get nutrientIsoleucine => 'Isoleucine';

  @override
  String get nutrientLeucine => 'Leucine';

  @override
  String get nutrientLysine => 'Lysine';

  @override
  String get nutrientMethionine => 'Methionin';

  @override
  String get nutrientPhenylalanine => 'Phenylalanin';

  @override
  String get nutrientProline => 'Prolin';

  @override
  String get nutrientSerine => 'Serin';

  @override
  String get nutrientThreonine => 'Threonin';

  @override
  String get nutrientTryptophan => 'Tryptophan';

  @override
  String get nutrientTyrosine => 'Tyrosine';

  @override
  String get nutrientValine => 'Valine';

  @override
  String get nutrientCaffeine => 'Caffeine';

  @override
  String get nutrientTheobromine => 'Theobromine';

  @override
  String servingWeightNumber(int number) {
    return 'Trọng lượng khẩu phần $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'Mô tả dịch vụ $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'Trọng lượng tương đương 200 kcal';
}
