// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => '일지';

  @override
  String get navGraph => '그래프';

  @override
  String get navFood => '음식';

  @override
  String get navWeight => '체중';

  @override
  String get navError => '오류';

  @override
  String get settings => '설정';

  @override
  String get invalidTabSettings => '탭 설정이 올바르지 않습니다.';

  @override
  String newVersion(String version) {
    return '새 버전 $version';
  }

  @override
  String get changes => '변경 사항';

  @override
  String get searchSettings => '설정 검색...';

  @override
  String get appearance => '화면';

  @override
  String get appearanceSubtitle => '테마, 색상 및 그래프 표시';

  @override
  String get diary => '일지';

  @override
  String get diarySubtitle => '일일 목표, 요약 및 기록';

  @override
  String get food => '음식';

  @override
  String get foodSubtitle => '음식 단위, 필드 및 기본값';

  @override
  String get weight => '체중';

  @override
  String get weightSubtitle => '체중 단위, 목표 및 표시';

  @override
  String get tabs => '탭';

  @override
  String get tabsSubtitle => '탐색 탭 및 순서';

  @override
  String get data => '데이터';

  @override
  String get dataSubtitle => '가져오기, 내보내기 및 로컬 데이터';

  @override
  String get todayProgress => '오늘의 진행 상황';

  @override
  String get latestDay => '최근 날짜';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 기록됨',
    );
    return '$_temp0';
  }

  @override
  String get calories => '칼로리';

  @override
  String get protein => '단백질';

  @override
  String get carbs => '탄수화물';

  @override
  String get fat => '지방';

  @override
  String get addDiaryEntry => '일지 항목 추가';

  @override
  String get noEntriesToday => '오늘 기록이 없습니다.';

  @override
  String addSearchToDiary(String search) {
    return '\"$search\"을(를) 일지에 추가';
  }

  @override
  String get tapStartLoggingFood => '탭하여 음식 기록을 시작하세요.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      '일치하는 일지 항목이 없습니다. 탭하여 이 음식을 만들고 기록하세요.';

  @override
  String get add => '추가';

  @override
  String get quickAdd => '빠른 추가';

  @override
  String get scanBarcode => '바코드 스캔';

  @override
  String get foodLibrary => '음식 라이브러리';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    return '음식 $foodCount개 · 식사 $mealCount개';
  }

  @override
  String get recentlyUsed => '최근 사용';

  @override
  String get quickActions => '빠른 작업';

  @override
  String get addFood => '음식 추가';

  @override
  String get createMeal => '식사 만들기';

  @override
  String get noFoodYet => '아직 음식이 없습니다';

  @override
  String get noMatchingFood => '일치하는 음식이 없습니다';

  @override
  String get addFirstFoodOrMeal => '첫 음식이나 식사를 추가하여 라이브러리를 만들어 보세요.';

  @override
  String noFoodSearchMatches(String search) {
    return '“$search”과(와) 일치하는 항목이 없습니다. 검색을 지우면 모두 다시 볼 수 있습니다.';
  }

  @override
  String get clearSearch => '검색 지우기';

  @override
  String get addMeal => '식사 추가';

  @override
  String get noWeightsYet => '아직 체중 기록이 없습니다';

  @override
  String get noMatchingWeights => '일치하는 체중 기록이 없습니다';

  @override
  String get logFirstWeight => '첫 체중을 기록하여 추세를 추적해 보세요.';

  @override
  String noWeightSearchMatches(String search) {
    return '“$search”과(와) 일치하는 항목이 없습니다. 검색을 지우면 모든 기록을 볼 수 있습니다.';
  }

  @override
  String get logWeight => '체중 기록';

  @override
  String get weightTrend => '체중 추세';

  @override
  String get weightTrendSubtitle => '최근 측정값과 전체 추세';

  @override
  String get bodyWeight => '체중';

  @override
  String get options => '옵션';

  @override
  String get day => '일';

  @override
  String get week => '주';

  @override
  String get month => '월';

  @override
  String get year => '년';

  @override
  String get dateRange => '날짜 범위';

  @override
  String get startDate => '시작일';

  @override
  String get stopDate => '종료일';

  @override
  String get dataPoints => '데이터 포인트';

  @override
  String get customizeFields => '필드 사용자 지정';

  @override
  String get language => '언어';

  @override
  String get languageSubtitle => 'FitBook에서 사용할 언어를 선택하세요';

  @override
  String get languageSystem => '시스템';

  @override
  String get languageEnglish => '영어';

  @override
  String get languageSpanish => '스페인어';

  @override
  String get languageFrench => '프랑스어';

  @override
  String get languageGerman => '독일어';

  @override
  String get languageItalian => '이탈리아어';

  @override
  String get languagePortugueseBrazil => '포르투갈어(브라질)';

  @override
  String get languageDutch => '네덜란드어';

  @override
  String get languagePolish => '폴란드어';

  @override
  String get languageJapanese => '일본어';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageChineseSimplified => '중국어(간체)';

  @override
  String get appearanceSettings => '화면 설정';

  @override
  String get delete => '삭제';

  @override
  String get confirmDelete => '삭제 확인';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 항목을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.',
      one: '1개 항목을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => '취소';

  @override
  String get search => '검색...';

  @override
  String get clear => '지우기';

  @override
  String get showMenu => '메뉴 표시';

  @override
  String get selectAll => '모두 선택';

  @override
  String get edit => '편집';

  @override
  String get favorite => '즐겨찾기';

  @override
  String get atLeastOneTab => '탭이 하나 이상 필요합니다';

  @override
  String get scrollableTabs => '스크롤 가능한 탭';

  @override
  String get save => '저장';

  @override
  String get themeSystem => '시스템';

  @override
  String get themeDark => '다크';

  @override
  String get themeLight => '라이트';

  @override
  String get pureBlackAmoled => '완전한 검정 (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => 'AMOLED 디스플레이에서 완전한 검정을 사용합니다';

  @override
  String get systemColorScheme => '시스템 색상';

  @override
  String get systemColorSchemeTooltip => '기기의 기본 색상을 앱에 사용합니다';

  @override
  String get showImages => '이미지 표시';

  @override
  String get showImagesTooltip => '일기 및 음식 페이지에서 이미지를 선택하고 표시합니다';

  @override
  String get curveLineGraphs => '곡선 그래프';

  @override
  String get curveLineGraphsTooltip => '그래프 페이지에서 부드러운 곡선을 사용합니다';

  @override
  String get weightStatCards => '체중 통계 카드';

  @override
  String get weightStatCardsTooltip => '체중 기록을 기본 목록 대신 통계 카드 격자로 표시합니다';

  @override
  String get graphsStartAtZero => '그래프를 0에서 시작';

  @override
  String get graphsStartAtZeroTooltip => '그래프의 Y축을 항상 0에서 시작합니다';

  @override
  String get navigationAnimation => '탐색 애니메이션';

  @override
  String get animationFade => '페이드';

  @override
  String get animationZoom => '확대/축소';

  @override
  String get animationSlide => '슬라이드';

  @override
  String get animationRise => '상승';

  @override
  String get animationNone => '없음';

  @override
  String longDateFormat(String example) {
    return '긴 날짜 형식 ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return '짧은 날짜 형식 ($example)';
  }

  @override
  String get diarySettings => '일기 설정';

  @override
  String get diaryUnit => '일기 단위';

  @override
  String get diarySummary => '일기 요약';

  @override
  String get diarySummaryDivision => '비율 - 현재 / 전체';

  @override
  String get diarySummaryRemaining => '남음';

  @override
  String get diarySummaryBoth => '둘 다 - 남음 (전체)';

  @override
  String get diarySummaryNone => '없음';

  @override
  String get dailyCaloriesKcal => '일일 칼로리 (kcal)';

  @override
  String get dailyProteinG => '일일 단백질 (g)';

  @override
  String get dailyFatG => '일일 지방 (g)';

  @override
  String get dailyCarbsG => '일일 탄수화물 (g)';

  @override
  String get dailyFiberG => '일일 식이섬유 (g)';

  @override
  String get automaticDailies => '일일 목표 자동 계산';

  @override
  String get automaticDailiesTooltip =>
      '체중을 기준으로 권장 일일 칼로리, 단백질, 지방 및 탄수화물을 자동 계산합니다';

  @override
  String get selectNameOnSubmit => '저장할 때 이름 선택';

  @override
  String get reminders => '알림';

  @override
  String get foodSettings => '음식 설정';

  @override
  String get foodUnit => '음식 단위';

  @override
  String get fields => '필드';

  @override
  String get favoriteNewFoods => '새 음식을 즐겨찾기에 추가';

  @override
  String get pickFields => '필드 선택';

  @override
  String get all => '전체';

  @override
  String get onlySelected => '선택한 항목만';

  @override
  String get weightSettings => '체중 설정';

  @override
  String get targetWeight => '목표 체중';

  @override
  String get positiveReinforcement => '긍정적 강화';

  @override
  String get positiveReinforcementPreview => '격려 메시지가 이렇게 표시됩니다!';

  @override
  String get dataSettings => '데이터 설정';

  @override
  String get automaticBackup => '자동 백업';

  @override
  String get shareDatabase => '데이터베이스 공유';

  @override
  String get openNotification => '알림 열기';

  @override
  String get automaticBackupsEnabled => '자동 백업이 활성화되었습니다';

  @override
  String get automaticBackupBody => 'FitBook이 매일 데이터와 이미지를 선택한 폴더에 자동으로 백업합니다.';

  @override
  String get backupSettings => '백업 설정';

  @override
  String get backupSettingsChannelDescription => '자동 백업 관련 알림';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => '사용자 이름';

  @override
  String get password => '비밀번호';

  @override
  String get close => '닫기';

  @override
  String get loggedIn => '로그인됨';

  @override
  String get about => '정보';

  @override
  String get version => '버전';

  @override
  String get whatsNew => '새로운 기능';

  @override
  String get author => '작성자';

  @override
  String get license => '라이선스';

  @override
  String get donate => '후원';

  @override
  String get supportProject => '이 프로젝트를 후원해 주세요';

  @override
  String get leaveReview => '리뷰 남기기';

  @override
  String get rateOnPlayStore => 'Play 스토어에서 FitBook 평가';

  @override
  String get sourceCode => '소스 코드';

  @override
  String get foods => '음식';

  @override
  String get backup => '백업';

  @override
  String get exportData => '데이터 내보내기';

  @override
  String get importData => '데이터 가져오기';

  @override
  String get failedImportData => '데이터를 가져오지 못했습니다';

  @override
  String get copyError => '오류 복사';

  @override
  String get deleteRecords => '데이터 삭제';

  @override
  String get unusedFood => '사용하지 않는 음식';

  @override
  String get database => '데이터베이스';

  @override
  String get deleteAllWeightsConfirm => '모든 체중 기록을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.';

  @override
  String get deleteDatabaseConfirm =>
      '데이터베이스를 삭제하시겠습니까? 이 작업은 되돌릴 수 없으며 모든 데이터가 삭제됩니다.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      '모든 음식과 일기 기록을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사용하지 않는 음식 $count개를 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.',
      one: '사용하지 않는 음식 1개를 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm => '모든 일기 기록을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.';

  @override
  String get ok => '확인';

  @override
  String get replaceImage => '이미지 바꾸기';

  @override
  String get takePhoto => '사진 촬영';

  @override
  String get deleteImage => '이미지 삭제';

  @override
  String get filters => '필터';

  @override
  String get foodGroup => '식품군';

  @override
  String get exampleFruit => '과일';

  @override
  String clearFiltersCount(int count) {
    return '지우기 ($count)';
  }

  @override
  String get done => '완료';

  @override
  String get showFilters => '필터 표시';

  @override
  String get repeatEntry => '기록 반복';

  @override
  String get timeOfDay => '시간';

  @override
  String get everyDay => '매일';

  @override
  String get repeatEveryDayForYear => '앞으로 1년 동안 매일 이 기록을 생성합니다';

  @override
  String get repeatOn => '반복 요일';

  @override
  String get weekdayMon => '월';

  @override
  String get weekdayTue => '화';

  @override
  String get weekdayWed => '수';

  @override
  String get weekdayThu => '목';

  @override
  String get weekdayFri => '금';

  @override
  String get weekdaySat => '토';

  @override
  String get weekdaySun => '일';

  @override
  String get schedule => '예약';

  @override
  String get enterValidNutritionValues => '올바른 영양 값을 입력하세요';

  @override
  String get quickAddTitle => '빠른 추가';

  @override
  String get kilojoules => '킬로줄';

  @override
  String get createdDate => '생성 날짜';

  @override
  String get failedMigrations => '마이그레이션 실패';

  @override
  String get failedMigrationsDescription =>
      '데이터베이스를 만들거나 업그레이드하는 중 문제가 발생했습니다. 일반적으로 기록을 삭제한 뒤 다시 만들면 해결할 수 있습니다.';

  @override
  String get errorMessage => '오류 메시지:';

  @override
  String get createIssue => '문제 신고';

  @override
  String get cameraPermissionRequired => '스캔하려면 카메라 권한이 필요합니다.';

  @override
  String get scanFoodBarcode => '식품 바코드 스캔';

  @override
  String get holdBarcodeInFrame => '바코드를 프레임 안에 맞춰 주세요';

  @override
  String get pinchToZoom => '손가락을 모아 확대/축소';

  @override
  String get cameraStartFailed => '카메라를 시작할 수 없습니다';
}
