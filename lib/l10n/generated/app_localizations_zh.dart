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

  @override
  String get delete => '删除';

  @override
  String get confirmDelete => '确认删除';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '确定要删除$count条记录吗？此操作无法撤销。',
      one: '确定要删除1条记录吗？此操作无法撤销。',
    );
    return '$_temp0';
  }

  @override
  String get cancel => '取消';

  @override
  String get search => '搜索...';

  @override
  String get clear => '清除';

  @override
  String get showMenu => '显示菜单';

  @override
  String get selectAll => '全选';

  @override
  String get edit => '编辑';

  @override
  String get favorite => '收藏';

  @override
  String get atLeastOneTab => '至少需要保留一个标签页';

  @override
  String get scrollableTabs => '可滚动标签页';

  @override
  String get save => '保存';

  @override
  String get themeSystem => '系统';

  @override
  String get themeDark => '深色';

  @override
  String get themeLight => '浅色';

  @override
  String get pureBlackAmoled => '纯黑 (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => '在 AMOLED 屏幕上使用纯黑色';

  @override
  String get systemColorScheme => '系统配色';

  @override
  String get systemColorSchemeTooltip => '在应用中使用设备的主色';

  @override
  String get showImages => '显示图片';

  @override
  String get showImagesTooltip => '在日记和食物页面选择并显示图片';

  @override
  String get curveLineGraphs => '曲线折线图';

  @override
  String get curveLineGraphsTooltip => '在图表页面使用平滑曲线';

  @override
  String get weightStatCards => '体重统计卡片';

  @override
  String get weightStatCardsTooltip => '将体重记录显示为统计卡片网格，而不是默认列表';

  @override
  String get graphsStartAtZero => '图表从零开始';

  @override
  String get graphsStartAtZeroTooltip => '始终让图表 Y 轴从零开始';

  @override
  String get navigationAnimation => '导航动画';

  @override
  String get animationFade => '淡入淡出';

  @override
  String get animationZoom => '缩放';

  @override
  String get animationSlide => '滑动';

  @override
  String get animationRise => '上升';

  @override
  String get animationNone => '无';

  @override
  String longDateFormat(String example) {
    return '长日期格式（$example）';
  }

  @override
  String shortDateFormat(String example) {
    return '短日期格式（$example）';
  }

  @override
  String get diarySettings => '日记设置';

  @override
  String get diaryUnit => '日记单位';

  @override
  String get diarySummary => '日记摘要';

  @override
  String get diarySummaryDivision => '比例 - 当前 / 总计';

  @override
  String get diarySummaryRemaining => '剩余';

  @override
  String get diarySummaryBoth => '两者 - 剩余（总计）';

  @override
  String get diarySummaryNone => '无';

  @override
  String get dailyCaloriesKcal => '每日热量 (kcal)';

  @override
  String get dailyProteinG => '每日蛋白质 (g)';

  @override
  String get dailyFatG => '每日脂肪 (g)';

  @override
  String get dailyCarbsG => '每日碳水化合物 (g)';

  @override
  String get dailyFiberG => '每日膳食纤维 (g)';

  @override
  String get automaticDailies => '自动每日目标';

  @override
  String get automaticDailiesTooltip => '根据体重自动计算建议的每日热量、蛋白质、脂肪和碳水化合物';

  @override
  String get selectNameOnSubmit => '保存时选择名称';

  @override
  String get reminders => '提醒';

  @override
  String get foodSettings => '食物设置';

  @override
  String get foodUnit => '食物单位';

  @override
  String get fields => '字段';

  @override
  String get favoriteNewFoods => '将新食物加入收藏';

  @override
  String get pickFields => '选择字段';

  @override
  String get all => '全部';

  @override
  String get onlySelected => '仅已选择';

  @override
  String get weightSettings => '体重设置';

  @override
  String get targetWeight => '目标体重';

  @override
  String get positiveReinforcement => '积极鼓励';

  @override
  String get positiveReinforcementPreview => '鼓励消息将像这样显示！';

  @override
  String get dataSettings => '数据设置';

  @override
  String get automaticBackup => '自动备份';

  @override
  String get shareDatabase => '共享数据库';

  @override
  String get openNotification => '打开通知';

  @override
  String get automaticBackupsEnabled => '已启用自动备份';

  @override
  String get automaticBackupBody => 'FitBook 每天会自动将你的数据和图片备份到所选文件夹。';

  @override
  String get backupSettings => '备份设置';

  @override
  String get backupSettingsChannelDescription => '关于自动备份的通知';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get close => '关闭';

  @override
  String get loggedIn => '已登录';

  @override
  String get about => '关于';

  @override
  String get version => '版本';

  @override
  String get whatsNew => '新功能';

  @override
  String get author => '作者';

  @override
  String get license => '许可证';

  @override
  String get donate => '捐赠';

  @override
  String get supportProject => '帮助支持此项目';

  @override
  String get leaveReview => '留下评价';

  @override
  String get rateOnPlayStore => '在 Play 商店评价 FitBook';

  @override
  String get sourceCode => '源代码';

  @override
  String get foods => '食物';

  @override
  String get backup => '备份';

  @override
  String get exportData => '导出数据';

  @override
  String get importData => '导入数据';

  @override
  String get failedImportData => '导入数据失败';

  @override
  String get copyError => '复制错误';

  @override
  String get deleteRecords => '删除数据';

  @override
  String get unusedFood => '未使用的食物';

  @override
  String get database => '数据库';

  @override
  String get deleteAllWeightsConfirm => '确定要删除所有体重记录吗？此操作无法撤销。';

  @override
  String get deleteDatabaseConfirm => '确定要删除数据库吗？此操作无法撤销，并会删除你的所有数据。';

  @override
  String get deleteFoodsAndDiaryConfirm => '确定要删除所有食物和日记记录吗？此操作无法撤销。';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '确定要删除 $count 个未使用的食物吗？此操作无法撤销。',
      one: '确定要删除 1 个未使用的食物吗？此操作无法撤销。',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm => '确定要删除所有日记记录吗？此操作无法撤销。';

  @override
  String get ok => '确定';

  @override
  String get replaceImage => '替换图片';

  @override
  String get takePhoto => '拍照';

  @override
  String get deleteImage => '删除图片';

  @override
  String get filters => '筛选';

  @override
  String get foodGroup => '食物组';

  @override
  String get exampleFruit => '水果';

  @override
  String clearFiltersCount(int count) {
    return '清除（$count）';
  }

  @override
  String get done => '完成';

  @override
  String get showFilters => '显示筛选条件';

  @override
  String get repeatEntry => '重复记录';

  @override
  String get timeOfDay => '时间';

  @override
  String get everyDay => '每天';

  @override
  String get repeatEveryDayForYear => '在接下来一年中每天创建此记录';

  @override
  String get repeatOn => '重复日期';

  @override
  String get weekdayMon => '周一';

  @override
  String get weekdayTue => '周二';

  @override
  String get weekdayWed => '周三';

  @override
  String get weekdayThu => '周四';

  @override
  String get weekdayFri => '周五';

  @override
  String get weekdaySat => '周六';

  @override
  String get weekdaySun => '周日';

  @override
  String get schedule => '安排';

  @override
  String get enterValidNutritionValues => '请输入有效的营养数值';

  @override
  String get quickAddTitle => '快速添加';

  @override
  String get kilojoules => '千焦';

  @override
  String get createdDate => '创建日期';

  @override
  String get failedMigrations => '迁移失败';

  @override
  String get failedMigrationsDescription => '创建或升级数据库时出现问题。通常可以通过删除并重新创建记录来修复。';

  @override
  String get errorMessage => '错误信息：';

  @override
  String get createIssue => '报告问题';

  @override
  String get cameraPermissionRequired => '扫描需要相机权限。';

  @override
  String get scanFoodBarcode => '扫描食物条形码';

  @override
  String get holdBarcodeInFrame => '将条形码保持在框内';

  @override
  String get pinchToZoom => '双指捏合缩放';

  @override
  String get cameraStartFailed => '无法启动相机';

  @override
  String get editDiaryEntry => '编辑日记条目';

  @override
  String get addFoodToDiary => '将食物添加到日记';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return '确定要删除 $name 吗？';
  }

  @override
  String get imageError => '图片错误';

  @override
  String get setImage => '设置图片';

  @override
  String get name => '名称';

  @override
  String get searchFoodsAndMeals => '搜索食物和餐食...';

  @override
  String get clearSelection => '清除选择';

  @override
  String get barcodeNotFoundSaveToInsert => '未找到条形码。保存以添加。';

  @override
  String searchOpenFoodFactsFor(String name) {
    return '在 OpenFoodFacts 中搜索“$name”';
  }

  @override
  String get meal => '餐食';

  @override
  String get quantity => '数量';

  @override
  String get unit => '单位';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return '份 ($amount $unit)';
  }

  @override
  String get barcode => '条形码';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient（每 $amount $unit）';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '每 $quantity $unit的$nutrient';
  }

  @override
  String get fiber => '膳食纤维';

  @override
  String get unitServing => '份';

  @override
  String get unitGrams => '克';

  @override
  String get unitMilliliters => '毫升';

  @override
  String get unitKilojoules => '千焦';

  @override
  String get unitCups => '杯';

  @override
  String get unitTablespoons => '汤匙';

  @override
  String get unitMilligrams => '毫克';

  @override
  String get unitTeaspoons => '茶匙';

  @override
  String get unitOunces => '盎司';

  @override
  String get unitPounds => '磅';

  @override
  String get unitKilograms => '千克';

  @override
  String get unitLiters => '升';

  @override
  String get nameConflict => '名称冲突';

  @override
  String get replaceExistingFood => '已有同名食物。要替换原来的食物吗？';

  @override
  String get no => '否';

  @override
  String get yes => '是';

  @override
  String get editFood => '编辑食物';

  @override
  String confirmDeleteFood(String name) {
    return '确定要删除 $name 吗？';
  }

  @override
  String get caloriesKcal => '卡路里 (kcal)';

  @override
  String get kilojoulesKj => '千焦 (kJ)';

  @override
  String get servingSize => '每份大小';

  @override
  String get servingUnit => '每份单位';

  @override
  String get saveAsNewCopy => '另存为新副本';

  @override
  String get filterFoods => '筛选食物';

  @override
  String get narrowFoodsFilters => '使用任意组合的筛选条件缩小列表范围。';

  @override
  String get foodDetails => '食物详情';

  @override
  String get exampleFruitHint => '例如：水果';

  @override
  String get servingSizeRangeHint => '设置最小值、最大值或两者。';

  @override
  String get minimum => '最小值';

  @override
  String get maximum => '最大值';

  @override
  String get noMinimum => '无最小值';

  @override
  String get noMaximum => '无最大值';

  @override
  String get clearAll => '全部清除';

  @override
  String get searchOpenFoodFacts => '搜索 Open Food Facts';

  @override
  String get noMatchingProducts => '没有匹配的产品';

  @override
  String get tryAnotherNameOrScanBarcode => '请尝试其他名称或扫描条形码。';

  @override
  String get enterFoodNameToSearch => '在上方输入食品名称，然后提交搜索。';

  @override
  String get submitToSearch => '搜索...';

  @override
  String kcalValue(String value) {
    return '$value 千卡';
  }

  @override
  String proteinGramsValue(String value) {
    return '蛋白质 $value 克';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '编辑 $count 种食品',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => '编辑餐食';

  @override
  String get addImage => '添加图片';

  @override
  String get noFoodsInMeal => '此餐食中还没有食物';

  @override
  String get addFoodToMealHint => '添加食物以开始搭配这顿餐食。';

  @override
  String get remove => '移除';

  @override
  String get searchFoods => '搜索食物...';

  @override
  String get noFoodsFound => '未找到食物';

  @override
  String nothingMatchesSearch(String search) {
    return '没有与“$search”匹配的结果。';
  }

  @override
  String get addFoodsToLibraryFirst => '请先将食物添加到食物库，再添加到餐食中。';

  @override
  String caloriesPer100gValue(String value) {
    return '每 100 克 $value 千卡';
  }

  @override
  String get noDataYet => '暂无数据';

  @override
  String get completePlansToViewGraphs => '完成一些计划后即可在此查看图表。';

  @override
  String get value => '数值';

  @override
  String get goal => '目标';

  @override
  String get notSet => '未设置';

  @override
  String get trend => '趋势';

  @override
  String get smooth => '平滑';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 点平均',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => '编辑体重';

  @override
  String get addWeight => '添加体重';

  @override
  String shareWeight(String value, String unit) {
    return '我刚称完体重：$value $unit！';
  }

  @override
  String weightWithUnit(String unit) {
    return '体重（$unit）';
  }

  @override
  String get pleaseEnterWeight => '请输入体重';

  @override
  String get pleaseEnterValidWeight => '请输入有效的体重';

  @override
  String get lastWeight => '上次体重';

  @override
  String unitWithValue(String unit) {
    return '单位（$unit）';
  }

  @override
  String keepUnitAs(String unit) {
    return '单位保持为 $unit';
  }

  @override
  String convertToUnit(String unit) {
    return '转换为 $unit';
  }

  @override
  String get removeImage => '移除图片';
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

  @override
  String get delete => '删除';

  @override
  String get confirmDelete => '确认删除';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '确定要删除$count条记录吗？此操作无法撤销。',
      one: '确定要删除1条记录吗？此操作无法撤销。',
    );
    return '$_temp0';
  }

  @override
  String get cancel => '取消';

  @override
  String get search => '搜索...';

  @override
  String get clear => '清除';

  @override
  String get showMenu => '显示菜单';

  @override
  String get selectAll => '全选';

  @override
  String get edit => '编辑';

  @override
  String get favorite => '收藏';

  @override
  String get atLeastOneTab => '至少需要保留一个标签页';

  @override
  String get scrollableTabs => '可滚动标签页';

  @override
  String get save => '保存';

  @override
  String get themeSystem => '系统';

  @override
  String get themeDark => '深色';

  @override
  String get themeLight => '浅色';

  @override
  String get pureBlackAmoled => '纯黑 (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => '在 AMOLED 屏幕上使用纯黑色';

  @override
  String get systemColorScheme => '系统配色';

  @override
  String get systemColorSchemeTooltip => '在应用中使用设备的主色';

  @override
  String get showImages => '显示图片';

  @override
  String get showImagesTooltip => '在日记和食物页面选择并显示图片';

  @override
  String get curveLineGraphs => '曲线折线图';

  @override
  String get curveLineGraphsTooltip => '在图表页面使用平滑曲线';

  @override
  String get weightStatCards => '体重统计卡片';

  @override
  String get weightStatCardsTooltip => '将体重记录显示为统计卡片网格，而不是默认列表';

  @override
  String get graphsStartAtZero => '图表从零开始';

  @override
  String get graphsStartAtZeroTooltip => '始终让图表 Y 轴从零开始';

  @override
  String get navigationAnimation => '导航动画';

  @override
  String get animationFade => '淡入淡出';

  @override
  String get animationZoom => '缩放';

  @override
  String get animationSlide => '滑动';

  @override
  String get animationRise => '上升';

  @override
  String get animationNone => '无';

  @override
  String longDateFormat(String example) {
    return '长日期格式（$example）';
  }

  @override
  String shortDateFormat(String example) {
    return '短日期格式（$example）';
  }

  @override
  String get diarySettings => '日记设置';

  @override
  String get diaryUnit => '日记单位';

  @override
  String get diarySummary => '日记摘要';

  @override
  String get diarySummaryDivision => '比例 - 当前 / 总计';

  @override
  String get diarySummaryRemaining => '剩余';

  @override
  String get diarySummaryBoth => '两者 - 剩余（总计）';

  @override
  String get diarySummaryNone => '无';

  @override
  String get dailyCaloriesKcal => '每日热量 (kcal)';

  @override
  String get dailyProteinG => '每日蛋白质 (g)';

  @override
  String get dailyFatG => '每日脂肪 (g)';

  @override
  String get dailyCarbsG => '每日碳水化合物 (g)';

  @override
  String get dailyFiberG => '每日膳食纤维 (g)';

  @override
  String get automaticDailies => '自动每日目标';

  @override
  String get automaticDailiesTooltip => '根据体重自动计算建议的每日热量、蛋白质、脂肪和碳水化合物';

  @override
  String get selectNameOnSubmit => '保存时选择名称';

  @override
  String get reminders => '提醒';

  @override
  String get foodSettings => '食物设置';

  @override
  String get foodUnit => '食物单位';

  @override
  String get fields => '字段';

  @override
  String get favoriteNewFoods => '将新食物加入收藏';

  @override
  String get pickFields => '选择字段';

  @override
  String get all => '全部';

  @override
  String get onlySelected => '仅已选择';

  @override
  String get weightSettings => '体重设置';

  @override
  String get targetWeight => '目标体重';

  @override
  String get positiveReinforcement => '积极鼓励';

  @override
  String get positiveReinforcementPreview => '鼓励消息将像这样显示！';

  @override
  String get dataSettings => '数据设置';

  @override
  String get automaticBackup => '自动备份';

  @override
  String get shareDatabase => '共享数据库';

  @override
  String get openNotification => '打开通知';

  @override
  String get automaticBackupsEnabled => '已启用自动备份';

  @override
  String get automaticBackupBody => 'FitBook 每天会自动将你的数据和图片备份到所选文件夹。';

  @override
  String get backupSettings => '备份设置';

  @override
  String get backupSettingsChannelDescription => '关于自动备份的通知';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get close => '关闭';

  @override
  String get loggedIn => '已登录';

  @override
  String get about => '关于';

  @override
  String get version => '版本';

  @override
  String get whatsNew => '新功能';

  @override
  String get author => '作者';

  @override
  String get license => '许可证';

  @override
  String get donate => '捐赠';

  @override
  String get supportProject => '帮助支持此项目';

  @override
  String get leaveReview => '留下评价';

  @override
  String get rateOnPlayStore => '在 Play 商店评价 FitBook';

  @override
  String get sourceCode => '源代码';

  @override
  String get foods => '食物';

  @override
  String get backup => '备份';

  @override
  String get exportData => '导出数据';

  @override
  String get importData => '导入数据';

  @override
  String get failedImportData => '导入数据失败';

  @override
  String get copyError => '复制错误';

  @override
  String get deleteRecords => '删除数据';

  @override
  String get unusedFood => '未使用的食物';

  @override
  String get database => '数据库';

  @override
  String get deleteAllWeightsConfirm => '确定要删除所有体重记录吗？此操作无法撤销。';

  @override
  String get deleteDatabaseConfirm => '确定要删除数据库吗？此操作无法撤销，并会删除你的所有数据。';

  @override
  String get deleteFoodsAndDiaryConfirm => '确定要删除所有食物和日记记录吗？此操作无法撤销。';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '确定要删除 $count 个未使用的食物吗？此操作无法撤销。',
      one: '确定要删除 1 个未使用的食物吗？此操作无法撤销。',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm => '确定要删除所有日记记录吗？此操作无法撤销。';

  @override
  String get ok => '确定';

  @override
  String get replaceImage => '替换图片';

  @override
  String get takePhoto => '拍照';

  @override
  String get deleteImage => '删除图片';

  @override
  String get filters => '筛选';

  @override
  String get foodGroup => '食物组';

  @override
  String get exampleFruit => '水果';

  @override
  String clearFiltersCount(int count) {
    return '清除（$count）';
  }

  @override
  String get done => '完成';

  @override
  String get showFilters => '显示筛选条件';

  @override
  String get repeatEntry => '重复记录';

  @override
  String get timeOfDay => '时间';

  @override
  String get everyDay => '每天';

  @override
  String get repeatEveryDayForYear => '在接下来一年中每天创建此记录';

  @override
  String get repeatOn => '重复日期';

  @override
  String get weekdayMon => '周一';

  @override
  String get weekdayTue => '周二';

  @override
  String get weekdayWed => '周三';

  @override
  String get weekdayThu => '周四';

  @override
  String get weekdayFri => '周五';

  @override
  String get weekdaySat => '周六';

  @override
  String get weekdaySun => '周日';

  @override
  String get schedule => '安排';

  @override
  String get enterValidNutritionValues => '请输入有效的营养数值';

  @override
  String get quickAddTitle => '快速添加';

  @override
  String get kilojoules => '千焦';

  @override
  String get createdDate => '创建日期';

  @override
  String get failedMigrations => '迁移失败';

  @override
  String get failedMigrationsDescription => '创建或升级数据库时出现问题。通常可以通过删除并重新创建记录来修复。';

  @override
  String get errorMessage => '错误信息：';

  @override
  String get createIssue => '报告问题';

  @override
  String get cameraPermissionRequired => '扫描需要相机权限。';

  @override
  String get scanFoodBarcode => '扫描食物条形码';

  @override
  String get holdBarcodeInFrame => '将条形码保持在框内';

  @override
  String get pinchToZoom => '双指捏合缩放';

  @override
  String get cameraStartFailed => '无法启动相机';

  @override
  String get editDiaryEntry => '编辑日记条目';

  @override
  String get addFoodToDiary => '将食物添加到日记';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return '确定要删除 $name 吗？';
  }

  @override
  String get imageError => '图片错误';

  @override
  String get setImage => '设置图片';

  @override
  String get name => '名称';

  @override
  String get searchFoodsAndMeals => '搜索食物和餐食...';

  @override
  String get clearSelection => '清除选择';

  @override
  String get barcodeNotFoundSaveToInsert => '未找到条形码。保存以添加。';

  @override
  String searchOpenFoodFactsFor(String name) {
    return '在 OpenFoodFacts 中搜索“$name”';
  }

  @override
  String get meal => '餐食';

  @override
  String get quantity => '数量';

  @override
  String get unit => '单位';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return '份 ($amount $unit)';
  }

  @override
  String get barcode => '条形码';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient（每 $amount $unit）';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '每 $quantity $unit的$nutrient';
  }

  @override
  String get fiber => '膳食纤维';

  @override
  String get unitServing => '份';

  @override
  String get unitGrams => '克';

  @override
  String get unitMilliliters => '毫升';

  @override
  String get unitKilojoules => '千焦';

  @override
  String get unitCups => '杯';

  @override
  String get unitTablespoons => '汤匙';

  @override
  String get unitMilligrams => '毫克';

  @override
  String get unitTeaspoons => '茶匙';

  @override
  String get unitOunces => '盎司';

  @override
  String get unitPounds => '磅';

  @override
  String get unitKilograms => '千克';

  @override
  String get unitLiters => '升';

  @override
  String get nameConflict => '名称冲突';

  @override
  String get replaceExistingFood => '已有同名食物。要替换原来的食物吗？';

  @override
  String get no => '否';

  @override
  String get yes => '是';

  @override
  String get editFood => '编辑食物';

  @override
  String confirmDeleteFood(String name) {
    return '确定要删除 $name 吗？';
  }

  @override
  String get caloriesKcal => '卡路里 (kcal)';

  @override
  String get kilojoulesKj => '千焦 (kJ)';

  @override
  String get servingSize => '每份大小';

  @override
  String get servingUnit => '每份单位';

  @override
  String get saveAsNewCopy => '另存为新副本';

  @override
  String get filterFoods => '筛选食物';

  @override
  String get narrowFoodsFilters => '使用任意组合的筛选条件缩小列表范围。';

  @override
  String get foodDetails => '食物详情';

  @override
  String get exampleFruitHint => '例如：水果';

  @override
  String get servingSizeRangeHint => '设置最小值、最大值或两者。';

  @override
  String get minimum => '最小值';

  @override
  String get maximum => '最大值';

  @override
  String get noMinimum => '无最小值';

  @override
  String get noMaximum => '无最大值';

  @override
  String get clearAll => '全部清除';

  @override
  String get searchOpenFoodFacts => '搜索 Open Food Facts';

  @override
  String get noMatchingProducts => '没有匹配的产品';

  @override
  String get tryAnotherNameOrScanBarcode => '请尝试其他名称或扫描条形码。';

  @override
  String get enterFoodNameToSearch => '在上方输入食品名称，然后提交搜索。';

  @override
  String get submitToSearch => '搜索...';

  @override
  String kcalValue(String value) {
    return '$value 千卡';
  }

  @override
  String proteinGramsValue(String value) {
    return '蛋白质 $value 克';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '编辑 $count 种食品',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => '编辑餐食';

  @override
  String get addImage => '添加图片';

  @override
  String get noFoodsInMeal => '此餐食中还没有食物';

  @override
  String get addFoodToMealHint => '添加食物以开始搭配这顿餐食。';

  @override
  String get remove => '移除';

  @override
  String get searchFoods => '搜索食物...';

  @override
  String get noFoodsFound => '未找到食物';

  @override
  String nothingMatchesSearch(String search) {
    return '没有与“$search”匹配的结果。';
  }

  @override
  String get addFoodsToLibraryFirst => '请先将食物添加到食物库，再添加到餐食中。';

  @override
  String caloriesPer100gValue(String value) {
    return '每 100 克 $value 千卡';
  }

  @override
  String get noDataYet => '暂无数据';

  @override
  String get completePlansToViewGraphs => '完成一些计划后即可在此查看图表。';

  @override
  String get value => '数值';

  @override
  String get goal => '目标';

  @override
  String get notSet => '未设置';

  @override
  String get trend => '趋势';

  @override
  String get smooth => '平滑';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 点平均',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => '编辑体重';

  @override
  String get addWeight => '添加体重';

  @override
  String shareWeight(String value, String unit) {
    return '我刚称完体重：$value $unit！';
  }

  @override
  String weightWithUnit(String unit) {
    return '体重（$unit）';
  }

  @override
  String get pleaseEnterWeight => '请输入体重';

  @override
  String get pleaseEnterValidWeight => '请输入有效的体重';

  @override
  String get lastWeight => '上次体重';

  @override
  String unitWithValue(String unit) {
    return '单位（$unit）';
  }

  @override
  String keepUnitAs(String unit) {
    return '单位保持为 $unit';
  }

  @override
  String convertToUnit(String unit) {
    return '转换为 $unit';
  }

  @override
  String get removeImage => '移除图片';
}
