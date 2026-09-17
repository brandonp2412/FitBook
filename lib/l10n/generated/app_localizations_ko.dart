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
}
