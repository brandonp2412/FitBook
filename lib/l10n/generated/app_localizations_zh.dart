// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => '日记';

  @override
  String get navGraph => '图表';

  @override
  String get navFood => '食物';

  @override
  String get navWeight => '体重';

  @override
  String get navError => '错误';

  @override
  String get settings => '设置';

  @override
  String get invalidTabSettings => '标签页设置无效。';

  @override
  String newVersion(String version) {
    return '新版本 $version';
  }

  @override
  String get changes => '更新内容';

  @override
  String get searchSettings => '搜索设置...';

  @override
  String get appearance => '外观';

  @override
  String get appearanceSubtitle => '主题、颜色和图表显示';

  @override
  String get diary => '日记';

  @override
  String get diarySubtitle => '每日目标、摘要和记录';

  @override
  String get food => '食物';

  @override
  String get foodSubtitle => '食物单位、字段和默认值';

  @override
  String get weight => '体重';

  @override
  String get weightSubtitle => '体重单位、目标和显示';

  @override
  String get tabs => '标签页';

  @override
  String get tabsSubtitle => '导航标签页及顺序';

  @override
  String get data => '数据';

  @override
  String get dataSubtitle => '导入、导出和本地数据';

  @override
  String get todayProgress => '今日进度';

  @override
  String get latestDay => '最近一天';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已记录 $count 项',
    );
    return '$_temp0';
  }

  @override
  String get calories => '热量';

  @override
  String get protein => '蛋白质';

  @override
  String get carbs => '碳水化合物';

  @override
  String get fat => '脂肪';

  @override
  String get addDiaryEntry => '添加日记记录';

  @override
  String get noEntriesToday => '今天还没有记录。';

  @override
  String addSearchToDiary(String search) {
    return '将“$search”添加到日记';
  }

  @override
  String get tapStartLoggingFood => '点按即可开始记录食物。';

  @override
  String get noMatchingDiaryEntriesTapCreate => '没有匹配的日记记录。点按即可创建此食物并记录。';

  @override
  String get add => '添加';

  @override
  String get quickAdd => '快速添加';

  @override
  String get scanBarcode => '扫描条形码';

  @override
  String get foodLibrary => '食物库';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    return '$foodCount 种食物 · $mealCount 份餐食';
  }

  @override
  String get recentlyUsed => '最近使用';

  @override
  String get quickActions => '快捷操作';

  @override
  String get addFood => '添加食物';

  @override
  String get createMeal => '创建餐食';

  @override
  String get noFoodYet => '还没有食物';

  @override
  String get noMatchingFood => '没有匹配的食物';

  @override
  String get addFirstFoodOrMeal => '添加第一种食物或第一份餐食，开始建立你的食物库。';

  @override
  String noFoodSearchMatches(String search) {
    return '没有与“$search”匹配的内容。清除搜索即可再次查看全部内容。';
  }

  @override
  String get clearSearch => '清除搜索';

  @override
  String get addMeal => '添加餐食';

  @override
  String get noWeightsYet => '还没有体重记录';

  @override
  String get noMatchingWeights => '没有匹配的体重记录';

  @override
  String get logFirstWeight => '记录第一次体重，开始跟踪变化趋势。';

  @override
  String noWeightSearchMatches(String search) {
    return '没有与“$search”匹配的内容。清除搜索即可查看所有记录。';
  }

  @override
  String get logWeight => '记录体重';

  @override
  String get weightTrend => '体重趋势';

  @override
  String get weightTrendSubtitle => '近期测量和整体趋势';

  @override
  String get bodyWeight => '体重';

  @override
  String get options => '选项';

  @override
  String get day => '日';

  @override
  String get week => '周';

  @override
  String get month => '月';

  @override
  String get year => '年';

  @override
  String get dateRange => '日期范围';

  @override
  String get startDate => '开始日期';

  @override
  String get stopDate => '结束日期';

  @override
  String get dataPoints => '数据点';

  @override
  String get customizeFields => '自定义字段';

  @override
  String get language => '语言';

  @override
  String get languageSubtitle => '选择 FitBook 使用的语言';

  @override
  String get languageSystem => '系统';

  @override
  String get languageEnglish => '英语';

  @override
  String get languageSpanish => '西班牙语';

  @override
  String get languageFrench => '法语';

  @override
  String get languageGerman => '德语';

  @override
  String get languageItalian => '意大利语';

  @override
  String get languagePortugueseBrazil => '葡萄牙语（巴西）';

  @override
  String get languageDutch => '荷兰语';

  @override
  String get languagePolish => '波兰语';

  @override
  String get languageJapanese => '日语';

  @override
  String get languageKorean => '韩语';

  @override
  String get languageChineseSimplified => '中文（简体）';

  @override
  String get appearanceSettings => '外观设置';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class AppLocalizationsZhCn extends AppLocalizationsZh {
  AppLocalizationsZhCn() : super('zh_CN');

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => '日记';

  @override
  String get navGraph => '图表';

  @override
  String get navFood => '食物';

  @override
  String get navWeight => '体重';

  @override
  String get navError => '错误';

  @override
  String get settings => '设置';

  @override
  String get invalidTabSettings => '标签页设置无效。';

  @override
  String newVersion(String version) {
    return '新版本 $version';
  }

  @override
  String get changes => '更新内容';

  @override
  String get searchSettings => '搜索设置...';

  @override
  String get appearance => '外观';

  @override
  String get appearanceSubtitle => '主题、颜色和图表显示';

  @override
  String get diary => '日记';

  @override
  String get diarySubtitle => '每日目标、摘要和记录';

  @override
  String get food => '食物';

  @override
  String get foodSubtitle => '食物单位、字段和默认值';

  @override
  String get weight => '体重';

  @override
  String get weightSubtitle => '体重单位、目标和显示';

  @override
  String get tabs => '标签页';

  @override
  String get tabsSubtitle => '导航标签页及顺序';

  @override
  String get data => '数据';

  @override
  String get dataSubtitle => '导入、导出和本地数据';

  @override
  String get todayProgress => '今日进度';

  @override
  String get latestDay => '最近一天';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已记录 $count 项',
    );
    return '$_temp0';
  }

  @override
  String get calories => '热量';

  @override
  String get protein => '蛋白质';

  @override
  String get carbs => '碳水化合物';

  @override
  String get fat => '脂肪';

  @override
  String get addDiaryEntry => '添加日记记录';

  @override
  String get noEntriesToday => '今天还没有记录。';

  @override
  String addSearchToDiary(String search) {
    return '将“$search”添加到日记';
  }

  @override
  String get tapStartLoggingFood => '点按即可开始记录食物。';

  @override
  String get noMatchingDiaryEntriesTapCreate => '没有匹配的日记记录。点按即可创建此食物并记录。';

  @override
  String get add => '添加';

  @override
  String get quickAdd => '快速添加';

  @override
  String get scanBarcode => '扫描条形码';

  @override
  String get foodLibrary => '食物库';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    return '$foodCount 种食物 · $mealCount 份餐食';
  }

  @override
  String get recentlyUsed => '最近使用';

  @override
  String get quickActions => '快捷操作';

  @override
  String get addFood => '添加食物';

  @override
  String get createMeal => '创建餐食';

  @override
  String get noFoodYet => '还没有食物';

  @override
  String get noMatchingFood => '没有匹配的食物';

  @override
  String get addFirstFoodOrMeal => '添加第一种食物或第一份餐食，开始建立你的食物库。';

  @override
  String noFoodSearchMatches(String search) {
    return '没有与“$search”匹配的内容。清除搜索即可再次查看全部内容。';
  }

  @override
  String get clearSearch => '清除搜索';

  @override
  String get addMeal => '添加餐食';

  @override
  String get noWeightsYet => '还没有体重记录';

  @override
  String get noMatchingWeights => '没有匹配的体重记录';

  @override
  String get logFirstWeight => '记录第一次体重，开始跟踪变化趋势。';

  @override
  String noWeightSearchMatches(String search) {
    return '没有与“$search”匹配的内容。清除搜索即可查看所有记录。';
  }

  @override
  String get logWeight => '记录体重';

  @override
  String get weightTrend => '体重趋势';

  @override
  String get weightTrendSubtitle => '近期测量和整体趋势';

  @override
  String get bodyWeight => '体重';

  @override
  String get options => '选项';

  @override
  String get day => '日';

  @override
  String get week => '周';

  @override
  String get month => '月';

  @override
  String get year => '年';

  @override
  String get dateRange => '日期范围';

  @override
  String get startDate => '开始日期';

  @override
  String get stopDate => '结束日期';

  @override
  String get dataPoints => '数据点';

  @override
  String get customizeFields => '自定义字段';

  @override
  String get language => '语言';

  @override
  String get languageSubtitle => '选择 FitBook 使用的语言';

  @override
  String get languageSystem => '系统';

  @override
  String get languageEnglish => '英语';

  @override
  String get languageSpanish => '西班牙语';

  @override
  String get languageFrench => '法语';

  @override
  String get languageGerman => '德语';

  @override
  String get languageItalian => '意大利语';

  @override
  String get languagePortugueseBrazil => '葡萄牙语（巴西）';

  @override
  String get languageDutch => '荷兰语';

  @override
  String get languagePolish => '波兰语';

  @override
  String get languageJapanese => '日语';

  @override
  String get languageKorean => '韩语';

  @override
  String get languageChineseSimplified => '中文（简体）';

  @override
  String get appearanceSettings => '外观设置';
}
