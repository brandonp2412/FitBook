// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Щоденник';

  @override
  String get navGraph => 'Графік';

  @override
  String get navFood => 'Їжа';

  @override
  String get navWeight => 'Вага';

  @override
  String get navError => 'Помилка';

  @override
  String get loadDataFailed => 'Не вдалося завантажити ці дані.';

  @override
  String get settings => 'Налаштування';

  @override
  String get invalidTabSettings => 'Некоректні налаштування вкладок.';

  @override
  String newVersion(String version) {
    return 'Нова версія $version';
  }

  @override
  String get changes => 'Зміни';

  @override
  String get searchSettings => 'Пошук налаштувань...';

  @override
  String get appearance => 'Вигляд';

  @override
  String get appearanceSubtitle => 'Тема, кольори та відображення графіків';

  @override
  String get diary => 'Щоденник';

  @override
  String get diarySubtitle => 'Щоденні цілі, підсумки та ведення записів';

  @override
  String get food => 'Їжа';

  @override
  String get foodSubtitle => 'Одиниці їжі, поля та типові значення';

  @override
  String get weight => 'Вага';

  @override
  String get weightSubtitle => 'Одиниці ваги, цілі та відображення';

  @override
  String get tabs => 'Вкладки';

  @override
  String get tabsSubtitle => 'Навігаційні вкладки та їх порядок';

  @override
  String get data => 'Дані';

  @override
  String get dataSubtitle => 'Імпорт, експорт і локальні дані';

  @override
  String get todayProgress => 'Сьогоднішній прогрес';

  @override
  String get latestDay => 'Останній день';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count запису',
      many: '$count записів',
      few: '$count записи',
      one: '$count запис',
      zero: 'Записів немає',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Редагувати $count запису',
      many: 'Редагувати $count записів',
      few: 'Редагувати $count записи',
      one: 'Редагувати $count запис',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Калорії';

  @override
  String get protein => 'Білок';

  @override
  String get carbs => 'Вуглеводи';

  @override
  String get fat => 'Жири';

  @override
  String get addDiaryEntry => 'Додати запис до щоденника';

  @override
  String get noEntriesToday => 'Сьогодні записів немає.';

  @override
  String addSearchToDiary(String search) {
    return 'Додати «$search» до щоденника';
  }

  @override
  String get tapStartLoggingFood => 'Торкніться, щоб почати записувати їжу.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Відповідних записів у щоденнику немає. Торкніться, щоб створити цю їжу та записати її.';

  @override
  String get add => 'Додати';

  @override
  String get quickAdd => 'Швидке додавання';

  @override
  String get scanBarcode => 'Сканувати штрихкод';

  @override
  String get foodLibrary => 'Бібліотека продуктів';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount продукту',
      many: '$foodCount продуктів',
      few: '$foodCount продукти',
      one: '$foodCount продукт',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount прийому їжі',
      many: '$mealCount прийомів їжі',
      few: '$mealCount прийоми їжі',
      one: '$mealCount прийом їжі',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'Нещодавно використані';

  @override
  String get quickActions => 'Швидкі дії';

  @override
  String get addFood => 'Додати продукт';

  @override
  String get createMeal => 'Створити прийом їжі';

  @override
  String get noFoodYet => 'Продуктів ще немає';

  @override
  String get noMatchingFood => 'Відповідних продуктів немає';

  @override
  String get addFirstFoodOrMeal =>
      'Додайте перший продукт або прийом їжі, щоб почати наповнювати бібліотеку.';

  @override
  String noFoodSearchMatches(String search) {
    return 'За запитом «$search» нічого не знайдено. Очистьте пошук, щоб знову побачити все.';
  }

  @override
  String get clearSearch => 'Очистити пошук';

  @override
  String get addMeal => 'Додати прийом їжі';

  @override
  String get noWeightsYet => 'Записів ваги ще немає';

  @override
  String get noMatchingWeights => 'Відповідних записів ваги немає';

  @override
  String get logFirstWeight =>
      'Запишіть свою першу вагу, щоб почати відстежувати тенденцію.';

  @override
  String noWeightSearchMatches(String search) {
    return 'За запитом «$search» нічого не знайдено. Очистьте пошук, щоб побачити всі записи.';
  }

  @override
  String get logWeight => 'Записати вагу';

  @override
  String get weightTrend => 'Тенденція ваги';

  @override
  String get weightTrendSubtitle => 'Останні вимірювання та загальний напрямок';

  @override
  String get bodyWeight => 'Вага тіла';

  @override
  String get options => 'Параметри';

  @override
  String get day => 'День';

  @override
  String get today => 'Сьогодні';

  @override
  String get week => 'Тиждень';

  @override
  String get month => 'Місяць';

  @override
  String get year => 'Рік';

  @override
  String get dateRange => 'Діапазон дат';

  @override
  String get startDate => 'Дата початку';

  @override
  String get stopDate => 'Дата завершення';

  @override
  String get dataPoints => 'Точки даних';

  @override
  String get customizeFields => 'Налаштувати поля';

  @override
  String get language => 'Мова';

  @override
  String get languageSubtitle => 'Виберіть мову FitBook';

  @override
  String get languageSystem => 'Системна';

  @override
  String get languageEnglish => 'Англійська';

  @override
  String get languageSpanish => 'Іспанська';

  @override
  String get languageFrench => 'Французька';

  @override
  String get languageGerman => 'Німецька';

  @override
  String get languageItalian => 'Італійська';

  @override
  String get languagePortugueseBrazil => 'Португальська (Бразилія)';

  @override
  String get languageDutch => 'Нідерландська';

  @override
  String get languagePolish => 'Польська';

  @override
  String get languageJapanese => 'Японська';

  @override
  String get languageKorean => 'Корейська';

  @override
  String get languageChineseSimplified => 'Китайська (спрощена)';

  @override
  String get languageChineseTraditional => 'Китайська (традиційна)';

  @override
  String get languageRussian => 'Російська';

  @override
  String get languageHindi => 'Гінді';

  @override
  String get languageIndonesian => 'Індонезійська';

  @override
  String get languageVietnamese => 'В’єтнамська';

  @override
  String get languageThai => 'Тайська';

  @override
  String get languageBengali => 'Бенгальська';

  @override
  String get languageUrdu => 'Урду';

  @override
  String get languagePersian => 'Перська';

  @override
  String get languageMalay => 'Малайська';

  @override
  String get languageUkrainian => 'Українська';

  @override
  String get appearanceSettings => 'Налаштування вигляду';

  @override
  String get delete => 'Видалити';

  @override
  String get confirmDelete => 'Підтвердження видалення';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ви впевнені, що хочете видалити $count запису? Цю дію не можна скасувати.',
      many:
          'Ви впевнені, що хочете видалити $count записів? Цю дію не можна скасувати.',
      few:
          'Ви впевнені, що хочете видалити $count записи? Цю дію не можна скасувати.',
      one:
          'Ви впевнені, що хочете видалити $count запис? Цю дію не можна скасувати.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Скасувати';

  @override
  String get search => 'Пошук...';

  @override
  String get clear => 'Очистити';

  @override
  String get showMenu => 'Показати меню';

  @override
  String get selectAll => 'Вибрати все';

  @override
  String get edit => 'Редагувати';

  @override
  String get favorite => 'Улюблене';

  @override
  String get atLeastOneTab => 'Потрібна щонайменше одна вкладка';

  @override
  String get scrollableTabs => 'Прокручувані вкладки';

  @override
  String get save => 'Зберегти';

  @override
  String get themeSystem => 'Системна';

  @override
  String get themeDark => 'Темна';

  @override
  String get themeLight => 'Світла';

  @override
  String get pureBlackAmoled => 'Чистий чорний (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'Використовувати чистий чорний колір для AMOLED-дисплеїв';

  @override
  String get systemColorScheme => 'Системна колірна схема';

  @override
  String get systemColorSchemeTooltip =>
      'Використовувати основний колір пристрою для застосунку';

  @override
  String get showImages => 'Показувати зображення';

  @override
  String get showImagesTooltip =>
      'Вибирати та показувати зображення на сторінках щоденника й продуктів';

  @override
  String get curveLineGraphs => 'Плавні лінії графіків';

  @override
  String get curveLineGraphsTooltip =>
      'Використовувати плавні криві на сторінці графіків';

  @override
  String get weightStatCards => 'Картки статистики ваги';

  @override
  String get weightStatCardsTooltip =>
      'Показувати записи ваги у вигляді сітки карток статистики замість стандартного списку';

  @override
  String get graphsStartAtZero => 'Графіки починаються з нуля';

  @override
  String get graphsStartAtZeroTooltip =>
      'Завжди починати вісь Y графіка з нуля';

  @override
  String get navigationAnimation => 'Анімація навігації';

  @override
  String get animationFade => 'Згасання';

  @override
  String get animationZoom => 'Масштабування';

  @override
  String get animationSlide => 'Ковзання';

  @override
  String get animationRise => 'Підйом';

  @override
  String get animationNone => 'Немає';

  @override
  String longDateFormat(String example) {
    return 'Довгий формат дати ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Короткий формат дати ($example)';
  }

  @override
  String get diarySettings => 'Налаштування щоденника';

  @override
  String get diaryUnit => 'Одиниця щоденника';

  @override
  String get diarySummary => 'Підсумок щоденника';

  @override
  String get diarySummaryDivision => 'Поділ — поточне / загальне';

  @override
  String get diarySummaryRemaining => 'Залишок';

  @override
  String get diarySummaryBoth => 'Обидва — залишок (загалом)';

  @override
  String get diarySummaryNone => 'Немає';

  @override
  String get dailyCaloriesKcal => 'Добові калорії (ккал)';

  @override
  String get dailyProteinG => 'Добовий білок (г)';

  @override
  String get dailyFatG => 'Добові жири (г)';

  @override
  String get dailyCarbsG => 'Добові вуглеводи (г)';

  @override
  String get dailyFiberG => 'Добова клітковина (г)';

  @override
  String get automaticDailies => 'Автоматичні добові цілі';

  @override
  String get automaticDailiesTooltip =>
      'Автоматично розраховувати рекомендовану добову кількість калорій, білка, жирів і вуглеводів на основі ваги тіла';

  @override
  String get selectNameOnSubmit => 'Вибирати назву після підтвердження';

  @override
  String get reminders => 'Нагадування';

  @override
  String get foodSettings => 'Налаштування продуктів';

  @override
  String get foodUnit => 'Одиниця їжі';

  @override
  String get fields => 'Поля';

  @override
  String get favoriteNewFoods => 'Додавати нові продукти до улюблених';

  @override
  String get pickFields => 'Вибрати поля';

  @override
  String get all => 'Усі';

  @override
  String get onlySelected => 'Лише вибрані';

  @override
  String get weightSettings => 'Налаштування ваги';

  @override
  String get targetWeight => 'Цільова вага';

  @override
  String get positiveReinforcement => 'Позитивне підкріплення';

  @override
  String get positiveReinforcementPreview =>
      'Заохочувальні повідомлення виглядатимуть так!';

  @override
  String get dataSettings => 'Налаштування даних';

  @override
  String get automaticBackup => 'Автоматичне резервне копіювання';

  @override
  String get shareDatabase => 'Поділитися базою даних';

  @override
  String get openNotification => 'Відкрити сповіщення';

  @override
  String get automaticBackupsEnabled => 'Автоматичні резервні копії ввімкнено';

  @override
  String get automaticBackupBody =>
      'FitBook автоматично створюватиме резервну копію ваших даних і зображень у вибраній папці щодня.';

  @override
  String get backupSettings => 'Налаштування резервного копіювання';

  @override
  String get backupSettingsChannelDescription =>
      'Сповіщення про автоматичне резервне копіювання';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Ім’я користувача';

  @override
  String get password => 'Пароль';

  @override
  String get close => 'Закрити';

  @override
  String get loggedIn => 'Вхід виконано';

  @override
  String get about => 'Про застосунок';

  @override
  String get version => 'Версія';

  @override
  String get whatsNew => 'Що нового?';

  @override
  String get author => 'Автор';

  @override
  String get license => 'Ліцензія';

  @override
  String get donate => 'Підтримати';

  @override
  String get supportProject => 'Допоможіть підтримати цей проєкт';

  @override
  String get leaveReview => 'Залишити відгук';

  @override
  String get rateOnPlayStore => 'Оцінити FitBook у Play Store';

  @override
  String get sourceCode => 'Вихідний код';

  @override
  String get foods => 'Продукти';

  @override
  String get backup => 'Резервна копія';

  @override
  String get exportData => 'Експортувати дані';

  @override
  String get importData => 'Імпортувати дані';

  @override
  String get failedImportData => 'Не вдалося імпортувати дані';

  @override
  String get copyError => 'Копіювати помилку';

  @override
  String get deleteRecords => 'Видалити записи';

  @override
  String get unusedFood => 'Невикористані продукти';

  @override
  String get database => 'База даних';

  @override
  String get deleteAllWeightsConfirm =>
      'Ви впевнені, що хочете видалити всі записи ваги? Цю дію не можна скасувати.';

  @override
  String get deleteDatabaseConfirm =>
      'Ви впевнені, що хочете видалити базу даних? Цю дію не можна скасувати, і всі ваші дані буде знищено.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Ви впевнені, що хочете видалити всі продукти та записи щоденника? Цю дію не можна скасувати.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ви впевнені, що хочете видалити $count невикористаного продукту? Цю дію не можна скасувати.',
      many:
          'Ви впевнені, що хочете видалити $count невикористаних продуктів? Цю дію не можна скасувати.',
      few:
          'Ви впевнені, що хочете видалити $count невикористані продукти? Цю дію не можна скасувати.',
      one:
          'Ви впевнені, що хочете видалити $count невикористаний продукт? Цю дію не можна скасувати.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Ви впевнені, що хочете видалити всі записи щоденника? Цю дію не можна скасувати.';

  @override
  String get ok => 'Гаразд';

  @override
  String get replaceImage => 'Замінити зображення';

  @override
  String get takePhoto => 'Зробити фото';

  @override
  String get deleteImage => 'Видалити зображення';

  @override
  String get filters => 'Фільтри';

  @override
  String get foodGroup => 'Група продуктів';

  @override
  String get exampleFruit => 'Фрукти';

  @override
  String clearFiltersCount(int count) {
    return 'Очистити ($count)';
  }

  @override
  String get done => 'Готово';

  @override
  String get showFilters => 'Показати фільтри';

  @override
  String get repeatEntry => 'Повторити запис';

  @override
  String get timeOfDay => 'Час доби';

  @override
  String get everyDay => 'Щодня';

  @override
  String get repeatEveryDayForYear =>
      'Створювати цей запис щодня протягом наступного року';

  @override
  String get repeatOn => 'Повторювати в';

  @override
  String get weekdayMon => 'Пн';

  @override
  String get weekdayTue => 'Вт';

  @override
  String get weekdayWed => 'Ср';

  @override
  String get weekdayThu => 'Чт';

  @override
  String get weekdayFri => 'Пт';

  @override
  String get weekdaySat => 'Сб';

  @override
  String get weekdaySun => 'Нд';

  @override
  String get schedule => 'Розклад';

  @override
  String get enterValidNutritionValues =>
      'Введіть коректні значення поживності';

  @override
  String get quickAddTitle => 'Швидке додавання';

  @override
  String get kilojoules => 'Кілоджоулі';

  @override
  String get createdDate => 'Дата створення';

  @override
  String get failedMigrations => 'Невдалі міграції';

  @override
  String get failedMigrationsDescription =>
      'Під час створення або оновлення бази даних сталася помилка. Зазвичай це можна виправити, видаливши й повторно створивши записи.';

  @override
  String get errorMessage => 'Повідомлення про помилку:';

  @override
  String get createIssue => 'Створити звернення';

  @override
  String get cameraPermissionRequired =>
      'Для сканування потрібен дозвіл на використання камери.';

  @override
  String get scanFoodBarcode => 'Сканувати штрихкод продукту';

  @override
  String get holdBarcodeInFrame => 'Тримайте штрихкод у межах рамки';

  @override
  String get pinchToZoom => 'Зведіть або розведіть пальці для масштабування';

  @override
  String get cameraStartFailed => 'Не вдалося запустити камеру';

  @override
  String get editDiaryEntry => 'Редагувати запис щоденника';

  @override
  String get addFoodToDiary => 'Додати продукт до щоденника';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Ви впевнені, що хочете видалити $name?';
  }

  @override
  String get imageError => 'Помилка зображення';

  @override
  String get setImage => 'Встановити зображення';

  @override
  String get name => 'Назва';

  @override
  String get searchFoodsAndMeals => 'Пошук продуктів і прийомів їжі...';

  @override
  String get clearSelection => 'Очистити вибір';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Штрихкод не знайдено. Збережіть, щоб додати.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Шукати «$name» в Open Food Facts';
  }

  @override
  String get meal => 'Прийом їжі';

  @override
  String get quantity => 'Кількість';

  @override
  String get unit => 'Одиниця';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Порція ($amount $unit)';
  }

  @override
  String get barcode => 'Штрихкод';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (на $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '$nutrient на $quantity $unit';
  }

  @override
  String get fiber => 'Клітковина';

  @override
  String get unitServing => 'Порція';

  @override
  String get unitGrams => 'Грами';

  @override
  String get unitMilliliters => 'Мілілітри';

  @override
  String get unitKilojoules => 'Кілоджоулі';

  @override
  String get unitCups => 'Чашки';

  @override
  String get unitTablespoons => 'Столові ложки';

  @override
  String get unitMilligrams => 'Міліграми';

  @override
  String get unitTeaspoons => 'Чайні ложки';

  @override
  String get unitOunces => 'Унції';

  @override
  String get unitPounds => 'Фунти';

  @override
  String get unitKilograms => 'Кілограми';

  @override
  String get unitLiters => 'Літри';

  @override
  String get nameConflict => 'Конфлікт назв';

  @override
  String get replaceExistingFood =>
      'Продукт із такою назвою вже існує. Замінити старий?';

  @override
  String get no => 'Ні';

  @override
  String get yes => 'Так';

  @override
  String get editFood => 'Редагувати продукт';

  @override
  String confirmDeleteFood(String name) {
    return 'Ви впевнені, що хочете видалити $name?';
  }

  @override
  String get caloriesKcal => 'Калорії (ккал)';

  @override
  String get kilojoulesKj => 'Кілоджоулі (кДж)';

  @override
  String get servingSize => 'Розмір порції';

  @override
  String get servingUnit => 'Одиниця порції';

  @override
  String get saveAsNewCopy => 'Зберегти як нову копію';

  @override
  String get filterFoods => 'Фільтрувати продукти';

  @override
  String get narrowFoodsFilters =>
      'Звузьте список за допомогою будь-якої комбінації фільтрів.';

  @override
  String get foodDetails => 'Відомості про продукт';

  @override
  String get exampleFruitHint => 'наприклад, фрукти';

  @override
  String get servingSizeRangeHint =>
      'Установіть мінімум, максимум або обидва значення.';

  @override
  String get minimum => 'Мінімум';

  @override
  String get maximum => 'Максимум';

  @override
  String get noMinimum => 'Без мінімуму';

  @override
  String get noMaximum => 'Без максимуму';

  @override
  String get clearAll => 'Очистити все';

  @override
  String get searchOpenFoodFacts => 'Пошук в Open Food Facts';

  @override
  String get noMatchingProducts => 'Відповідних продуктів немає';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Спробуйте іншу назву або відскануйте штрихкод.';

  @override
  String get enterFoodNameToSearch =>
      'Введіть назву продукту вище, а потім надішліть запит для пошуку.';

  @override
  String get submitToSearch => 'Надіслати для пошуку...';

  @override
  String kcalValue(String value) {
    return '$value ккал';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value г білка';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Редагувати $count продукту',
      many: 'Редагувати $count продуктів',
      few: 'Редагувати $count продукти',
      one: 'Редагувати $count продукт',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'Редагувати прийом їжі';

  @override
  String get addImage => 'Додати зображення';

  @override
  String get noFoodsInMeal => 'У цьому прийомі їжі ще немає продуктів';

  @override
  String get addFoodToMealHint =>
      'Додайте продукт, щоб почати формувати цей прийом їжі.';

  @override
  String get remove => 'Вилучити';

  @override
  String get searchFoods => 'Пошук продуктів...';

  @override
  String get noFoodsFound => 'Продуктів не знайдено';

  @override
  String nothingMatchesSearch(String search) {
    return 'За запитом «$search» нічого не знайдено.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Додайте кілька продуктів до бібліотеки, перш ніж додавати їх до прийому їжі.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value ккал / 100 г';
  }

  @override
  String get noDataYet => 'Даних ще немає';

  @override
  String get completePlansToViewGraphs =>
      'Завершіть кілька планів, щоб переглядати тут графіки.';

  @override
  String get value => 'Значення';

  @override
  String get goal => 'Ціль';

  @override
  String get notSet => 'Не задано';

  @override
  String get trend => 'Тенденція';

  @override
  String get smooth => 'Згладжування';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Середнє за $count точки',
      many: 'Середнє за $count точками',
      few: 'Середнє за $count точками',
      one: 'Середнє за 1 точкою',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Редагувати вагу';

  @override
  String get addWeight => 'Додати вагу';

  @override
  String shareWeight(String value, String unit) {
    return 'Моя щойно виміряна вага — $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Вага ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Введіть вагу';

  @override
  String get pleaseEnterValidWeight => 'Введіть коректну вагу';

  @override
  String get lastWeight => 'Остання вага';

  @override
  String unitWithValue(String unit) {
    return 'Одиниця ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Залишити одиницю $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Перетворити на $unit';
  }

  @override
  String get removeImage => 'Вилучити зображення';

  @override
  String get mealRemindersEnabled => 'Нагадування про прийоми їжі ввімкнено';

  @override
  String get mealRemindersEnabledBody =>
      'Ми нагадаємо записати сніданок, обід або вечерю, якщо ви ще цього не зробили.';

  @override
  String get reminderSettingsChannel => 'Налаштування нагадувань';

  @override
  String get reminderSettingsChannelDescription =>
      'Сповіщення з поясненнями нагадувань FitBook';

  @override
  String get breakfastReminderTitle => 'Не забудьте записати сніданок';

  @override
  String get breakfastRemindersChannel => 'Нагадування про сніданок';

  @override
  String get breakfastRemindersChannelDescription =>
      'Нагадування записати сніданок';

  @override
  String get lunchReminderTitle => 'Не забудьте записати обід';

  @override
  String get lunchRemindersChannel => 'Нагадування про обід';

  @override
  String get lunchRemindersChannelDescription => 'Нагадування записати обід';

  @override
  String get dinnerReminderTitle => 'Не забудьте записати вечерю';

  @override
  String get dinnerRemindersChannel => 'Нагадування про вечерю';

  @override
  String get dinnerRemindersChannelDescription => 'Нагадування записати вечерю';

  @override
  String get reinforcementGreatJob =>
      'Чудова робота! Ваші зусилля дають результат.';

  @override
  String get reinforcementKeepItUp =>
      'Так тримати! Ви чудово просуваєтеся вперед.';

  @override
  String get reinforcementFantastic =>
      'Фантастично! Ваша наполегливість дає результат.';

  @override
  String get reinforcementWellDone =>
      'Чудово! Ви ще на крок ближче до своєї цілі.';

  @override
  String get reinforcementImpressive => 'Вражає! Ваші зусилля приносять плоди.';

  @override
  String get reinforcementAmazing => 'Неймовірно! Ви на правильному шляху.';

  @override
  String get reinforcementBravo =>
      'Браво! Ваша відданість заслуговує на похвалу.';

  @override
  String get reinforcementExcellent => 'Відмінно! Ваша наполегливість надихає.';

  @override
  String get reinforcementSuperb => 'Прекрасно! Ви виконуєте чудову роботу.';

  @override
  String get reinforcementIncredible => 'Неймовірно! Ваш прогрес помітний.';

  @override
  String get reinforcementWayToGoKing => 'Так тримати, королю!';

  @override
  String get reinforcementYeahBuddy => 'Так, друже!';

  @override
  String get reinforcementThatsHowItsDone => 'Ось як це робиться.';

  @override
  String get reinforcementEasyAsPie => 'Простіше простого.';

  @override
  String get reinforcementDoingGreat => 'У вас чудово виходить.';

  @override
  String get reinforcementProgressNice => 'Це прогрес, який я бачу? Чудово.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'Залишилося $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return 'Залишилося $remaining $unit (ціль: $target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'Цукри';

  @override
  String get nutrientCholesterol => 'Холестерин';

  @override
  String get nutrientSaturatedFat => 'Насичені жири';

  @override
  String get nutrientCalcium => 'Кальцій';

  @override
  String get nutrientIron => 'Залізо';

  @override
  String get nutrientPotassium => 'Калій';

  @override
  String get nutrientMagnesium => 'Магній';

  @override
  String get nutrientVitaminA => 'Вітамін A';

  @override
  String get nutrientVitaminC => 'Вітамін C';

  @override
  String get nutrientVitaminB12 => 'Вітамін B12';

  @override
  String get nutrientVitaminD => 'Вітамін D';

  @override
  String get nutrientVitaminE => 'Вітамін E';

  @override
  String get nutrientAddedSugar => 'Доданий цукор';

  @override
  String get nutrientNetCarbs => 'Чисті вуглеводи';

  @override
  String get nutrientWater => 'Вода';

  @override
  String get nutrientOmega3 => 'Омега-3 жирні кислоти';

  @override
  String get nutrientOmega6 => 'Омега-6 жирні кислоти';

  @override
  String get nutrientPralScore => 'Показник PRAL';

  @override
  String get nutrientTransFat => 'Трансжири';

  @override
  String get nutrientSolubleFiber => 'Розчинна клітковина';

  @override
  String get nutrientInsolubleFiber => 'Нерозчинна клітковина';

  @override
  String get nutrientPhosphorus => 'Фосфор';

  @override
  String get nutrientSodium => 'Натрій';

  @override
  String get nutrientZinc => 'Цинк';

  @override
  String get nutrientCopper => 'Мідь';

  @override
  String get nutrientManganese => 'Марганець';

  @override
  String get nutrientSelenium => 'Селен';

  @override
  String get nutrientFluoride => 'Фторид';

  @override
  String get nutrientMolybdenum => 'Молібден';

  @override
  String get nutrientChloride => 'Хлорид';

  @override
  String get nutrientSucrose => 'Сахароза';

  @override
  String get nutrientGlucose => 'Глюкоза';

  @override
  String get nutrientFructose => 'Фруктоза';

  @override
  String get nutrientLactose => 'Лактоза';

  @override
  String get nutrientMaltose => 'Мальтоза';

  @override
  String get nutrientGalactose => 'Галактоза';

  @override
  String get nutrientStarch => 'Крохмаль';

  @override
  String get nutrientSugarAlcohols => 'Цукрові спирти';

  @override
  String get nutrientThiaminB1 => 'Тіамін (B1)';

  @override
  String get nutrientRiboflavinB2 => 'Рибофлавін (B2)';

  @override
  String get nutrientNiacinB3 => 'Ніацин (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'Пантотенова кислота (B5)';

  @override
  String get nutrientVitaminB6 => 'Вітамін B6';

  @override
  String get nutrientBiotinB7 => 'Біотин (B7)';

  @override
  String get nutrientFolateB9 => 'Фолат (B9)';

  @override
  String get nutrientFolicAcid => 'Фолієва кислота';

  @override
  String get nutrientFoodFolate => 'Харчовий фолат';

  @override
  String get nutrientFolateDfe => 'Дієтичний фолатний еквівалент (DFE)';

  @override
  String get nutrientCholine => 'Холін';

  @override
  String get nutrientBetaine => 'Бетаїн';

  @override
  String get nutrientRetinol => 'Ретинол';

  @override
  String get nutrientBetaCarotene => 'Бета-каротин';

  @override
  String get nutrientAlphaCarotene => 'Альфа-каротин';

  @override
  String get nutrientLycopene => 'Лікопін';

  @override
  String get nutrientLuteinZeaxanthin => 'Лютеїн + зеаксантин';

  @override
  String get nutrientVitaminD2 => 'Вітамін D2 (ергокальциферол)';

  @override
  String get nutrientVitaminD3 => 'Вітамін D3 (холекальциферол)';

  @override
  String get nutrientVitaminK => 'Вітамін K';

  @override
  String get nutrientDihydrophylloquinone => 'Дигідрофілохінон';

  @override
  String get nutrientMenaquinone4 => 'Менахінон-4';

  @override
  String get nutrientMonounsaturatedFat => 'Мононенасичені жири';

  @override
  String get nutrientPolyunsaturatedFat => 'Поліненасичені жири';

  @override
  String get nutrientAla => 'Альфа-ліноленова кислота (ALA)';

  @override
  String get nutrientEpa => 'Ейкозапентаєнова кислота (EPA)';

  @override
  String get nutrientDpa => 'Докозапентаєнова кислота (DPA)';

  @override
  String get nutrientDha => 'Докозагексаєнова кислота (DHA)';

  @override
  String get nutrientAlanine => 'Аланін';

  @override
  String get nutrientAlcohol => 'Алкоголь';

  @override
  String get nutrientArginine => 'Аргінін';

  @override
  String get nutrientAsparticAcid => 'Аспарагінова кислота';

  @override
  String get nutrientCystine => 'Цистин';

  @override
  String get nutrientGlutamicAcid => 'Глутамінова кислота';

  @override
  String get nutrientGlycine => 'Гліцин';

  @override
  String get nutrientHistidine => 'Гістидин';

  @override
  String get nutrientHydroxyproline => 'Гідроксипролін';

  @override
  String get nutrientIsoleucine => 'Ізолейцин';

  @override
  String get nutrientLeucine => 'Лейцин';

  @override
  String get nutrientLysine => 'Лізин';

  @override
  String get nutrientMethionine => 'Метіонін';

  @override
  String get nutrientPhenylalanine => 'Фенілаланін';

  @override
  String get nutrientProline => 'Пролін';

  @override
  String get nutrientSerine => 'Серин';

  @override
  String get nutrientThreonine => 'Треонін';

  @override
  String get nutrientTryptophan => 'Триптофан';

  @override
  String get nutrientTyrosine => 'Тирозин';

  @override
  String get nutrientValine => 'Валін';

  @override
  String get nutrientCaffeine => 'Кофеїн';

  @override
  String get nutrientTheobromine => 'Теобромін';

  @override
  String servingWeightNumber(int number) {
    return 'Вага порції $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'Опис порції $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'Вага, еквівалентна 200 ккал';
}
