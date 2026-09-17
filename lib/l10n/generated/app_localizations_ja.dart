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
    return '食品 $foodCount 件 · 食事 $mealCount 件';
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
}
