// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => '日記';

  @override
  String get navGraph => 'グラフ';

  @override
  String get navFood => '食品';

  @override
  String get navWeight => '体重';

  @override
  String get navError => 'エラー';

  @override
  String get settings => '設定';

  @override
  String get invalidTabSettings => 'タブ設定が無効です。';

  @override
  String newVersion(String version) {
    return '新しいバージョン $version';
  }

  @override
  String get changes => '変更点';

  @override
  String get searchSettings => '設定を検索...';

  @override
  String get appearance => '外観';

  @override
  String get appearanceSubtitle => 'テーマ、色、グラフ表示';

  @override
  String get diary => '日記';

  @override
  String get diarySubtitle => '1日の目標、概要、記録';

  @override
  String get food => '食品';

  @override
  String get foodSubtitle => '食品の単位、項目、既定値';

  @override
  String get weight => '体重';

  @override
  String get weightSubtitle => '体重の単位、目標、表示';

  @override
  String get tabs => 'タブ';

  @override
  String get tabsSubtitle => 'ナビゲーションタブと順序';

  @override
  String get data => 'データ';

  @override
  String get dataSubtitle => 'インポート、エクスポート、ローカルデータ';

  @override
  String get todayProgress => '今日の進捗';

  @override
  String get latestDay => '最新の日';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件を記録',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件の記録を編集',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'カロリー';

  @override
  String get protein => 'たんぱく質';

  @override
  String get carbs => '炭水化物';

  @override
  String get fat => '脂質';

  @override
  String get addDiaryEntry => '日記に記録を追加';

  @override
  String get noEntriesToday => '今日はまだ記録がありません。';

  @override
  String addSearchToDiary(String search) {
    return '「$search」を日記に追加';
  }

  @override
  String get tapStartLoggingFood => 'タップして食品の記録を始めます。';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      '一致する記録がありません。タップしてこの食品を作成し、記録します。';

  @override
  String get add => '追加';

  @override
  String get quickAdd => 'クイック追加';

  @override
  String get scanBarcode => 'バーコードをスキャン';

  @override
  String get foodLibrary => '食品ライブラリ';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount 件',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount 件',
    );
    return '食品 $_temp0 · 食事 $_temp1';
  }

  @override
  String get recentlyUsed => '最近使用';

  @override
  String get quickActions => 'クイック操作';

  @override
  String get addFood => '食品を追加';

  @override
  String get createMeal => '食事を作成';

  @override
  String get noFoodYet => '食品がまだありません';

  @override
  String get noMatchingFood => '一致する食品がありません';

  @override
  String get addFirstFoodOrMeal => '最初の食品または食事を追加して、ライブラリを作り始めましょう。';

  @override
  String noFoodSearchMatches(String search) {
    return '「$search」に一致するものはありません。検索をクリアするとすべて表示されます。';
  }

  @override
  String get clearSearch => '検索をクリア';

  @override
  String get addMeal => '食事を追加';

  @override
  String get noWeightsYet => '体重記録がまだありません';

  @override
  String get noMatchingWeights => '一致する体重記録がありません';

  @override
  String get logFirstWeight => '最初の体重を記録して、推移を追跡し始めましょう。';

  @override
  String noWeightSearchMatches(String search) {
    return '「$search」に一致するものはありません。検索をクリアするとすべての記録が表示されます。';
  }

  @override
  String get logWeight => '体重を記録';

  @override
  String get weightTrend => '体重の推移';

  @override
  String get weightTrendSubtitle => '最近の測定値と全体的な傾向';

  @override
  String get bodyWeight => '体重';

  @override
  String get options => 'オプション';

  @override
  String get day => '日';

  @override
  String get today => '今日';

  @override
  String get week => '週';

  @override
  String get month => '月';

  @override
  String get year => '年';

  @override
  String get dateRange => '期間';

  @override
  String get startDate => '開始日';

  @override
  String get stopDate => '終了日';

  @override
  String get dataPoints => 'データ点';

  @override
  String get customizeFields => '項目をカスタマイズ';

  @override
  String get language => '言語';

  @override
  String get languageSubtitle => 'FitBook で使用する言語を選択';

  @override
  String get languageSystem => 'システム';

  @override
  String get languageEnglish => '英語';

  @override
  String get languageSpanish => 'スペイン語';

  @override
  String get languageFrench => 'フランス語';

  @override
  String get languageGerman => 'ドイツ語';

  @override
  String get languageItalian => 'イタリア語';

  @override
  String get languagePortugueseBrazil => 'ポルトガル語（ブラジル）';

  @override
  String get languageDutch => 'オランダ語';

  @override
  String get languagePolish => 'ポーランド語';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageKorean => '韓国語';

  @override
  String get languageChineseSimplified => '中国語（簡体字）';

  @override
  String get appearanceSettings => '外観設定';

  @override
  String get delete => '削除';

  @override
  String get confirmDelete => '削除の確認';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のレコードを削除しますか？この操作は元に戻せません。',
      one: '1件のレコードを削除しますか？この操作は元に戻せません。',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get search => '検索...';

  @override
  String get clear => 'クリア';

  @override
  String get showMenu => 'メニューを表示';

  @override
  String get selectAll => 'すべて選択';

  @override
  String get edit => '編集';

  @override
  String get favorite => 'お気に入り';

  @override
  String get atLeastOneTab => '少なくとも1つのタブが必要です';

  @override
  String get scrollableTabs => 'スクロール可能なタブ';

  @override
  String get save => '保存';

  @override
  String get themeSystem => 'システム';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeLight => 'ライト';

  @override
  String get pureBlackAmoled => '純黒 (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => 'AMOLED ディスプレイで純黒を使用します';

  @override
  String get systemColorScheme => 'システムの配色';

  @override
  String get systemColorSchemeTooltip => '端末のメインカラーをアプリに使用します';

  @override
  String get showImages => '画像を表示';

  @override
  String get showImagesTooltip => '日記と食品ページで画像を選択して表示します';

  @override
  String get curveLineGraphs => '曲線グラフ';

  @override
  String get curveLineGraphsTooltip => 'グラフページで滑らかな曲線を使用します';

  @override
  String get weightStatCards => '体重統計カード';

  @override
  String get weightStatCardsTooltip => '体重記録を標準の一覧ではなく統計カードのグリッドで表示します';

  @override
  String get graphsStartAtZero => 'グラフをゼロから開始';

  @override
  String get graphsStartAtZeroTooltip => 'グラフの Y 軸を常にゼロから開始します';

  @override
  String get navigationAnimation => 'ナビゲーションアニメーション';

  @override
  String get animationFade => 'フェード';

  @override
  String get animationZoom => 'ズーム';

  @override
  String get animationSlide => 'スライド';

  @override
  String get animationRise => 'ライズ';

  @override
  String get animationNone => 'なし';

  @override
  String longDateFormat(String example) {
    return '長い日付形式 ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return '短い日付形式 ($example)';
  }

  @override
  String get diarySettings => '日記設定';

  @override
  String get diaryUnit => '日記の単位';

  @override
  String get diarySummary => '日記の概要';

  @override
  String get diarySummaryDivision => '比率 - 現在 / 合計';

  @override
  String get diarySummaryRemaining => '残り';

  @override
  String get diarySummaryBoth => '両方 - 残り（合計）';

  @override
  String get diarySummaryNone => 'なし';

  @override
  String get dailyCaloriesKcal => '1日のカロリー (kcal)';

  @override
  String get dailyProteinG => '1日のたんぱく質 (g)';

  @override
  String get dailyFatG => '1日の脂質 (g)';

  @override
  String get dailyCarbsG => '1日の炭水化物 (g)';

  @override
  String get dailyFiberG => '1日の食物繊維 (g)';

  @override
  String get automaticDailies => '1日の目標を自動計算';

  @override
  String get automaticDailiesTooltip =>
      '体重に基づいて推奨される1日のカロリー、たんぱく質、脂質、炭水化物を自動計算します';

  @override
  String get selectNameOnSubmit => '保存時に名前を選択';

  @override
  String get reminders => 'リマインダー';

  @override
  String get foodSettings => '食品設定';

  @override
  String get foodUnit => '食品の単位';

  @override
  String get fields => '項目';

  @override
  String get favoriteNewFoods => '新しい食品をお気に入りに追加';

  @override
  String get pickFields => '項目を選択';

  @override
  String get all => 'すべて';

  @override
  String get onlySelected => '選択済みのみ';

  @override
  String get weightSettings => '体重設定';

  @override
  String get targetWeight => '目標体重';

  @override
  String get positiveReinforcement => 'ポジティブな励まし';

  @override
  String get positiveReinforcementPreview => '励ましのメッセージはこのように表示されます！';

  @override
  String get dataSettings => 'データ設定';

  @override
  String get automaticBackup => '自動バックアップ';

  @override
  String get shareDatabase => 'データベースを共有';

  @override
  String get openNotification => '通知を開く';

  @override
  String get automaticBackupsEnabled => '自動バックアップが有効です';

  @override
  String get automaticBackupBody =>
      'FitBook は毎日、データと画像を選択したフォルダーに自動でバックアップします。';

  @override
  String get backupSettings => 'バックアップ設定';

  @override
  String get backupSettingsChannelDescription => '自動バックアップに関する通知';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'ユーザー名';

  @override
  String get password => 'パスワード';

  @override
  String get close => '閉じる';

  @override
  String get loggedIn => 'ログインしました';

  @override
  String get about => 'このアプリについて';

  @override
  String get version => 'バージョン';

  @override
  String get whatsNew => '新着情報';

  @override
  String get author => '作者';

  @override
  String get license => 'ライセンス';

  @override
  String get donate => '寄付';

  @override
  String get supportProject => 'このプロジェクトを支援する';

  @override
  String get leaveReview => 'レビューを書く';

  @override
  String get rateOnPlayStore => 'Play ストアで FitBook を評価';

  @override
  String get sourceCode => 'ソースコード';

  @override
  String get foods => '食品';

  @override
  String get backup => 'バックアップ';

  @override
  String get exportData => 'データをエクスポート';

  @override
  String get importData => 'データをインポート';

  @override
  String get failedImportData => 'データのインポートに失敗しました';

  @override
  String get copyError => 'エラーをコピー';

  @override
  String get deleteRecords => 'データを削除';

  @override
  String get unusedFood => '未使用の食品';

  @override
  String get database => 'データベース';

  @override
  String get deleteAllWeightsConfirm => 'すべての体重記録を削除しますか？この操作は元に戻せません。';

  @override
  String get deleteDatabaseConfirm =>
      'データベースを削除しますか？この操作は元に戻せず、すべてのデータが削除されます。';

  @override
  String get deleteFoodsAndDiaryConfirm => 'すべての食品と日記の記録を削除しますか？この操作は元に戻せません。';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '未使用の食品$count件を削除しますか？この操作は元に戻せません。',
      one: '未使用の食品1件を削除しますか？この操作は元に戻せません。',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm => 'すべての日記の記録を削除しますか？この操作は元に戻せません。';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => '画像を置き換える';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get deleteImage => '画像を削除';

  @override
  String get filters => 'フィルター';

  @override
  String get foodGroup => '食品グループ';

  @override
  String get exampleFruit => '果物';

  @override
  String clearFiltersCount(int count) {
    return 'クリア（$count）';
  }

  @override
  String get done => '完了';

  @override
  String get showFilters => 'フィルターを表示';

  @override
  String get repeatEntry => '記録を繰り返す';

  @override
  String get timeOfDay => '時刻';

  @override
  String get everyDay => '毎日';

  @override
  String get repeatEveryDayForYear => '今後1年間、毎日この記録を作成します';

  @override
  String get repeatOn => '繰り返す曜日';

  @override
  String get weekdayMon => '月';

  @override
  String get weekdayTue => '火';

  @override
  String get weekdayWed => '水';

  @override
  String get weekdayThu => '木';

  @override
  String get weekdayFri => '金';

  @override
  String get weekdaySat => '土';

  @override
  String get weekdaySun => '日';

  @override
  String get schedule => 'スケジュール';

  @override
  String get enterValidNutritionValues => '有効な栄養値を入力してください';

  @override
  String get quickAddTitle => 'クイック追加';

  @override
  String get kilojoules => 'キロジュール';

  @override
  String get createdDate => '作成日';

  @override
  String get failedMigrations => 'マイグレーションに失敗しました';

  @override
  String get failedMigrationsDescription =>
      'データベースの作成またはアップグレード中に問題が発生しました。通常は、記録を削除して作り直すことで修正できます。';

  @override
  String get errorMessage => 'エラーメッセージ:';

  @override
  String get createIssue => '問題を報告';

  @override
  String get cameraPermissionRequired => 'スキャンにはカメラの許可が必要です。';

  @override
  String get scanFoodBarcode => '食品のバーコードをスキャン';

  @override
  String get holdBarcodeInFrame => 'バーコードを枠内に合わせてください';

  @override
  String get pinchToZoom => 'ピンチしてズーム';

  @override
  String get cameraStartFailed => 'カメラを起動できませんでした';

  @override
  String get editDiaryEntry => '日記エントリを編集';

  @override
  String get addFoodToDiary => '日記に食品を追加';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return '$name を削除しますか？';
  }

  @override
  String get imageError => '画像エラー';

  @override
  String get setImage => '画像を設定';

  @override
  String get name => '名前';

  @override
  String get searchFoodsAndMeals => '食品と食事を検索...';

  @override
  String get clearSelection => '選択をクリア';

  @override
  String get barcodeNotFoundSaveToInsert => 'バーコードが見つかりません。保存して追加してください。';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'OpenFoodFactsで「$name」を検索';
  }

  @override
  String get meal => '食事';

  @override
  String get quantity => '数量';

  @override
  String get unit => '単位';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return '1食分 ($amount $unit)';
  }

  @override
  String get barcode => 'バーコード';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$amount $unitあたりの$nutrient';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '$quantity $unitあたりの$nutrient';
  }

  @override
  String get fiber => '食物繊維';

  @override
  String get unitServing => '1食分';

  @override
  String get unitGrams => 'グラム';

  @override
  String get unitMilliliters => 'ミリリットル';

  @override
  String get unitKilojoules => 'キロジュール';

  @override
  String get unitCups => 'カップ';

  @override
  String get unitTablespoons => '大さじ';

  @override
  String get unitMilligrams => 'ミリグラム';

  @override
  String get unitTeaspoons => '小さじ';

  @override
  String get unitOunces => 'オンス';

  @override
  String get unitPounds => 'ポンド';

  @override
  String get unitKilograms => 'キログラム';

  @override
  String get unitLiters => 'リットル';

  @override
  String get nameConflict => '名前の重複';

  @override
  String get replaceExistingFood => '同じ名前の食品がすでにあります。以前の食品を置き換えますか？';

  @override
  String get no => 'いいえ';

  @override
  String get yes => 'はい';

  @override
  String get editFood => '食品を編集';

  @override
  String confirmDeleteFood(String name) {
    return '$name を削除しますか？';
  }

  @override
  String get caloriesKcal => 'カロリー (kcal)';

  @override
  String get kilojoulesKj => 'キロジュール (kJ)';

  @override
  String get servingSize => '1食分の量';

  @override
  String get servingUnit => '1食分の単位';

  @override
  String get saveAsNewCopy => '新しいコピーとして保存';

  @override
  String get filterFoods => '食品を絞り込む';

  @override
  String get narrowFoodsFilters => '任意のフィルターを組み合わせて一覧を絞り込みます。';

  @override
  String get foodDetails => '食品の詳細';

  @override
  String get exampleFruitHint => '例：果物';

  @override
  String get servingSizeRangeHint => '最小値、最大値、または両方を設定します。';

  @override
  String get minimum => '最小値';

  @override
  String get maximum => '最大値';

  @override
  String get noMinimum => '最小値なし';

  @override
  String get noMaximum => '最大値なし';

  @override
  String get clearAll => 'すべてクリア';

  @override
  String get searchOpenFoodFacts => 'Open Food Factsを検索';

  @override
  String get noMatchingProducts => '一致する商品がありません';

  @override
  String get tryAnotherNameOrScanBarcode => '別の名前を試すか、バーコードをスキャンしてください。';

  @override
  String get enterFoodNameToSearch => '上に食品名を入力して検索してください。';

  @override
  String get submitToSearch => '検索...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return 'たんぱく質 $value g';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の食品を編集',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => '食事を編集';

  @override
  String get addImage => '画像を追加';

  @override
  String get noFoodsInMeal => 'この食事にはまだ食品がありません';

  @override
  String get addFoodToMealHint => '食品を追加してこの食事を作成しましょう。';

  @override
  String get remove => '削除';

  @override
  String get searchFoods => '食品を検索...';

  @override
  String get noFoodsFound => '食品が見つかりません';

  @override
  String nothingMatchesSearch(String search) {
    return '「$search」に一致する食品はありません。';
  }

  @override
  String get addFoodsToLibraryFirst => '食事に追加する前に、食品をライブラリに追加してください。';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'まだデータがありません';

  @override
  String get completePlansToViewGraphs => 'いくつかのプランを完了すると、ここにグラフが表示されます。';

  @override
  String get value => '値';

  @override
  String get goal => '目標';

  @override
  String get notSet => '未設定';

  @override
  String get trend => '傾向';

  @override
  String get smooth => '平滑化';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count点平均',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => '体重を編集';

  @override
  String get addWeight => '体重を追加';

  @override
  String shareWeight(String value, String unit) {
    return '今の体重は $value $unit！';
  }

  @override
  String weightWithUnit(String unit) {
    return '体重（$unit）';
  }

  @override
  String get pleaseEnterWeight => '体重を入力してください';

  @override
  String get pleaseEnterValidWeight => '有効な体重を入力してください';

  @override
  String get lastWeight => '前回の体重';

  @override
  String unitWithValue(String unit) {
    return '単位（$unit）';
  }

  @override
  String keepUnitAs(String unit) {
    return '単位を $unit のままにする';
  }

  @override
  String convertToUnit(String unit) {
    return '$unit に変換';
  }

  @override
  String get removeImage => '画像を削除';

  @override
  String get mealRemindersEnabled => '食事のリマインダーを有効にしました';

  @override
  String get mealRemindersEnabledBody =>
      '朝食、昼食、夕食がまだ記録されていない場合に、記録するようお知らせします。';

  @override
  String get reminderSettingsChannel => 'リマインダー設定';

  @override
  String get reminderSettingsChannelDescription => 'FitBook のリマインダーに関する通知';

  @override
  String get breakfastReminderTitle => '朝食の記録をお忘れなく';

  @override
  String get breakfastRemindersChannel => '朝食のリマインダー';

  @override
  String get breakfastRemindersChannelDescription => '朝食を記録するためのリマインダー';

  @override
  String get lunchReminderTitle => '昼食の記録をお忘れなく';

  @override
  String get lunchRemindersChannel => '昼食のリマインダー';

  @override
  String get lunchRemindersChannelDescription => '昼食を記録するためのリマインダー';

  @override
  String get dinnerReminderTitle => '夕食の記録をお忘れなく';

  @override
  String get dinnerRemindersChannel => '夕食のリマインダー';

  @override
  String get dinnerRemindersChannelDescription => '夕食を記録するためのリマインダー';

  @override
  String get reinforcementGreatJob => 'いい調子！努力が成果につながっています。';

  @override
  String get reinforcementKeepItUp => 'その調子！素晴らしい進歩です。';

  @override
  String get reinforcementFantastic => '最高！継続した努力が結果に表れています。';

  @override
  String get reinforcementWellDone => 'よくできました！目標にまた一歩近づきました。';

  @override
  String get reinforcementImpressive => 'すごい！努力が実を結んでいます。';

  @override
  String get reinforcementAmazing => '素晴らしい！正しい方向に進んでいます。';

  @override
  String get reinforcementBravo => 'ブラボー！その頑張りは立派です。';

  @override
  String get reinforcementExcellent => '最高です！その粘り強さは見事です。';

  @override
  String get reinforcementSuperb => '素晴らしい！とてもよく頑張っています。';

  @override
  String get reinforcementIncredible => 'すごい！進歩がはっきり見えます。';

  @override
  String get reinforcementWayToGoKing => 'さすが、キング！';

  @override
  String get reinforcementYeahBuddy => 'よっしゃ！';

  @override
  String get reinforcementThatsHowItsDone => 'そう、それでこそ！';

  @override
  String get reinforcementEasyAsPie => '楽勝です。';

  @override
  String get reinforcementDoingGreat => 'とても順調です。';

  @override
  String get reinforcementProgressNice => 'おっ、進歩してますね。いい感じ！';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return '残り $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return '残り $remaining $unit（目標 $target $unit）';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }
}
