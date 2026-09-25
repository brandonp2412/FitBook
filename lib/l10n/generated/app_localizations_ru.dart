// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Дневник';

  @override
  String get navGraph => 'График';

  @override
  String get navFood => 'Еда';

  @override
  String get navWeight => 'Вес';

  @override
  String get navError => 'Ошибка';

  @override
  String get loadDataFailed => 'Не удалось загрузить эти данные.';

  @override
  String get settings => 'Настройки';

  @override
  String get invalidTabSettings => 'Некорректные настройки вкладок.';

  @override
  String newVersion(String version) {
    return 'Новая версия $version';
  }

  @override
  String get changes => 'Изменения';

  @override
  String get searchSettings => 'Поиск настроек...';

  @override
  String get appearance => 'Оформление';

  @override
  String get appearanceSubtitle => 'Тема, цвета и отображение графиков';

  @override
  String get diary => 'Дневник';

  @override
  String get diarySubtitle => 'Дневные цели, сводки и ведение записей';

  @override
  String get food => 'Еда';

  @override
  String get foodSubtitle => 'Единицы, поля и настройки продуктов';

  @override
  String get weight => 'Вес';

  @override
  String get weightSubtitle => 'Единицы веса, цели и отображение';

  @override
  String get tabs => 'Вкладки';

  @override
  String get tabsSubtitle => 'Вкладки навигации и их порядок';

  @override
  String get data => 'Данные';

  @override
  String get dataSubtitle => 'Импорт, экспорт и локальные данные';

  @override
  String get todayProgress => 'Прогресс за сегодня';

  @override
  String get latestDay => 'Последний день';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Добавлено $count записи',
      many: 'Добавлено $count записей',
      few: 'Добавлено $count записи',
      one: 'Добавлена $count запись',
      zero: 'Нет записей',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изменить $count записи',
      many: 'Изменить $count записей',
      few: 'Изменить $count записи',
      one: 'Изменить $count запись',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Калории';

  @override
  String get protein => 'Белок';

  @override
  String get carbs => 'Углеводы';

  @override
  String get fat => 'Жиры';

  @override
  String get addDiaryEntry => 'Добавить запись в дневник';

  @override
  String get noEntriesToday => 'Сегодня записей нет.';

  @override
  String addSearchToDiary(String search) {
    return 'Добавить «$search» в дневник';
  }

  @override
  String get tapStartLoggingFood =>
      'Нажмите, чтобы начать вести дневник питания.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Подходящих записей в дневнике нет. Нажмите, чтобы создать этот продукт и добавить его.';

  @override
  String get add => 'Добавить';

  @override
  String get quickAdd => 'Быстрое добавление';

  @override
  String get scanBarcode => 'Сканировать штрихкод';

  @override
  String get foodLibrary => 'Библиотека продуктов';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount продукта',
      many: '$foodCount продуктов',
      few: '$foodCount продукта',
      one: '$foodCount продукт',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount приёма пищи',
      many: '$mealCount приёмов пищи',
      few: '$mealCount приёма пищи',
      one: '$mealCount приём пищи',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'Недавно использованные';

  @override
  String get quickActions => 'Быстрые действия';

  @override
  String get addFood => 'Добавить продукт';

  @override
  String get createMeal => 'Создать приём пищи';

  @override
  String get noFoodYet => 'Продуктов пока нет';

  @override
  String get noMatchingFood => 'Подходящих продуктов нет';

  @override
  String get addFirstFoodOrMeal =>
      'Добавьте первый продукт или приём пищи, чтобы начать формировать библиотеку.';

  @override
  String noFoodSearchMatches(String search) {
    return 'По запросу «$search» ничего не найдено. Очистите поиск, чтобы снова увидеть всё.';
  }

  @override
  String get clearSearch => 'Очистить поиск';

  @override
  String get addMeal => 'Добавить приём пищи';

  @override
  String get noWeightsYet => 'Записей веса пока нет';

  @override
  String get noMatchingWeights => 'Подходящих записей веса нет';

  @override
  String get logFirstWeight =>
      'Запишите свой первый вес, чтобы начать отслеживать динамику.';

  @override
  String noWeightSearchMatches(String search) {
    return 'По запросу «$search» ничего не найдено. Очистите поиск, чтобы увидеть все записи.';
  }

  @override
  String get logWeight => 'Записать вес';

  @override
  String get weightTrend => 'Динамика веса';

  @override
  String get weightTrendSubtitle => 'Последние измерения и общее направление';

  @override
  String get bodyWeight => 'Масса тела';

  @override
  String get options => 'Параметры';

  @override
  String get day => 'День';

  @override
  String get today => 'Сегодня';

  @override
  String get week => 'Неделя';

  @override
  String get month => 'Месяц';

  @override
  String get year => 'Год';

  @override
  String get dateRange => 'Диапазон дат';

  @override
  String get startDate => 'Дата начала';

  @override
  String get stopDate => 'Дата окончания';

  @override
  String get dataPoints => 'Точки данных';

  @override
  String get customizeFields => 'Настроить поля';

  @override
  String get language => 'Язык';

  @override
  String get languageSubtitle => 'Выберите язык FitBook';

  @override
  String get languageSystem => 'Системный';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageSpanish => 'Испанский';

  @override
  String get languageFrench => 'Французский';

  @override
  String get languageGerman => 'Немецкий';

  @override
  String get languageItalian => 'Итальянский';

  @override
  String get languagePortugueseBrazil => 'Португальский (Бразилия)';

  @override
  String get languageDutch => 'Нидерландский';

  @override
  String get languagePolish => 'Польский';

  @override
  String get languageJapanese => 'Японский';

  @override
  String get languageKorean => 'Корейский';

  @override
  String get languageChineseSimplified => 'Китайский (упрощённый)';

  @override
  String get languageChineseTraditional => 'Китайский (традиционный)';

  @override
  String get languageRussian => 'Русский';

  @override
  String get appearanceSettings => 'Настройки оформления';

  @override
  String get delete => 'Удалить';

  @override
  String get confirmDelete => 'Подтверждение удаления';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Вы уверены, что хотите удалить $count записи? Это действие нельзя отменить.',
      many:
          'Вы уверены, что хотите удалить $count записей? Это действие нельзя отменить.',
      few:
          'Вы уверены, что хотите удалить $count записи? Это действие нельзя отменить.',
      one:
          'Вы уверены, что хотите удалить $count запись? Это действие нельзя отменить.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get search => 'Поиск...';

  @override
  String get clear => 'Очистить';

  @override
  String get showMenu => 'Показать меню';

  @override
  String get selectAll => 'Выбрать всё';

  @override
  String get edit => 'Изменить';

  @override
  String get favorite => 'Избранное';

  @override
  String get atLeastOneTab => 'Нужна хотя бы одна вкладка';

  @override
  String get scrollableTabs => 'Прокручиваемые вкладки';

  @override
  String get save => 'Сохранить';

  @override
  String get themeSystem => 'Системная';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get pureBlackAmoled => 'Чистый чёрный (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'Использовать чистый чёрный цвет для AMOLED-дисплеев';

  @override
  String get systemColorScheme => 'Системная цветовая схема';

  @override
  String get systemColorSchemeTooltip =>
      'Использовать основной цвет устройства в приложении';

  @override
  String get showImages => 'Показывать изображения';

  @override
  String get showImagesTooltip =>
      'Выбирать и показывать изображения на страницах дневника и продуктов';

  @override
  String get curveLineGraphs => 'Сглаженные линии графиков';

  @override
  String get curveLineGraphsTooltip =>
      'Использовать плавные кривые на странице графиков';

  @override
  String get weightStatCards => 'Карточки статистики веса';

  @override
  String get weightStatCardsTooltip =>
      'Показывать записи веса сеткой карточек статистики вместо стандартного списка';

  @override
  String get graphsStartAtZero => 'Графики начинаются с нуля';

  @override
  String get graphsStartAtZeroTooltip => 'Всегда начинать ось Y графика с нуля';

  @override
  String get navigationAnimation => 'Анимация навигации';

  @override
  String get animationFade => 'Затухание';

  @override
  String get animationZoom => 'Масштабирование';

  @override
  String get animationSlide => 'Сдвиг';

  @override
  String get animationRise => 'Подъём';

  @override
  String get animationNone => 'Нет';

  @override
  String longDateFormat(String example) {
    return 'Длинный формат даты ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Короткий формат даты ($example)';
  }

  @override
  String get diarySettings => 'Настройки дневника';

  @override
  String get diaryUnit => 'Единица дневника';

  @override
  String get diarySummary => 'Сводка дневника';

  @override
  String get diarySummaryDivision => 'Деление — текущее / всего';

  @override
  String get diarySummaryRemaining => 'Осталось';

  @override
  String get diarySummaryBoth => 'Оба — осталось (всего)';

  @override
  String get diarySummaryNone => 'Нет';

  @override
  String get dailyCaloriesKcal => 'Дневная норма калорий (ккал)';

  @override
  String get dailyProteinG => 'Дневная норма белка (г)';

  @override
  String get dailyFatG => 'Дневная норма жиров (г)';

  @override
  String get dailyCarbsG => 'Дневная норма углеводов (г)';

  @override
  String get dailyFiberG => 'Дневная норма клетчатки (г)';

  @override
  String get automaticDailies => 'Автоматические дневные цели';

  @override
  String get automaticDailiesTooltip =>
      'Автоматически рассчитывать рекомендуемые дневные калории, белки, жиры и углеводы по массе тела';

  @override
  String get selectNameOnSubmit => 'Выбирать название при сохранении';

  @override
  String get reminders => 'Напоминания';

  @override
  String get foodSettings => 'Настройки продуктов';

  @override
  String get foodUnit => 'Единица продукта';

  @override
  String get fields => 'Поля';

  @override
  String get favoriteNewFoods => 'Добавлять новые продукты в избранное';

  @override
  String get pickFields => 'Выбрать поля';

  @override
  String get all => 'Все';

  @override
  String get onlySelected => 'Только выбранные';

  @override
  String get weightSettings => 'Настройки веса';

  @override
  String get targetWeight => 'Целевой вес';

  @override
  String get positiveReinforcement => 'Позитивное подкрепление';

  @override
  String get positiveReinforcementPreview =>
      'Здесь будут показываться ободряющие сообщения!';

  @override
  String get dataSettings => 'Настройки данных';

  @override
  String get automaticBackup => 'Автоматическое резервное копирование';

  @override
  String get shareDatabase => 'Поделиться базой данных';

  @override
  String get openNotification => 'Открыть уведомление';

  @override
  String get automaticBackupsEnabled =>
      'Автоматическое резервное копирование включено';

  @override
  String get automaticBackupBody =>
      'FitBook будет каждый день автоматически создавать резервную копию данных и изображений в выбранной папке.';

  @override
  String get backupSettings => 'Настройки резервного копирования';

  @override
  String get backupSettingsChannelDescription =>
      'Уведомления об автоматическом резервном копировании';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Имя пользователя';

  @override
  String get password => 'Пароль';

  @override
  String get close => 'Закрыть';

  @override
  String get loggedIn => 'Выполнен вход';

  @override
  String get about => 'О приложении';

  @override
  String get version => 'Версия';

  @override
  String get whatsNew => 'Что нового?';

  @override
  String get author => 'Автор';

  @override
  String get license => 'Лицензия';

  @override
  String get donate => 'Поддержать';

  @override
  String get supportProject => 'Помочь поддержать этот проект';

  @override
  String get leaveReview => 'Оставить отзыв';

  @override
  String get rateOnPlayStore => 'Оценить FitBook в Play Store';

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get foods => 'Продукты';

  @override
  String get backup => 'Резервная копия';

  @override
  String get exportData => 'Экспорт данных';

  @override
  String get importData => 'Импорт данных';

  @override
  String get failedImportData => 'Не удалось импортировать данные';

  @override
  String get copyError => 'Скопировать ошибку';

  @override
  String get deleteRecords => 'Удалить записи';

  @override
  String get unusedFood => 'Неиспользуемые продукты';

  @override
  String get database => 'База данных';

  @override
  String get deleteAllWeightsConfirm =>
      'Вы уверены, что хотите удалить все записи веса? Это действие нельзя отменить.';

  @override
  String get deleteDatabaseConfirm =>
      'Вы уверены, что хотите удалить базу данных? Это действие нельзя отменить, и все ваши данные будут потеряны.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Вы уверены, что хотите удалить все продукты и записи дневника? Это действие нельзя отменить.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Вы уверены, что хотите удалить $count неиспользуемого продукта? Это действие необратимо.',
      many:
          'Вы уверены, что хотите удалить $count неиспользуемых продуктов? Это действие необратимо.',
      few:
          'Вы уверены, что хотите удалить $count неиспользуемых продукта? Это действие необратимо.',
      one:
          'Вы уверены, что хотите удалить $count неиспользуемый продукт? Это действие необратимо.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Вы уверены, что хотите удалить все записи дневника? Это действие нельзя отменить.';

  @override
  String get ok => 'ОК';

  @override
  String get replaceImage => 'Заменить изображение';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get deleteImage => 'Удалить изображение';

  @override
  String get filters => 'Фильтры';

  @override
  String get foodGroup => 'Группа продуктов';

  @override
  String get exampleFruit => 'Фрукты';

  @override
  String clearFiltersCount(int count) {
    return 'Очистить ($count)';
  }

  @override
  String get done => 'Готово';

  @override
  String get showFilters => 'Показать фильтры';

  @override
  String get repeatEntry => 'Повторять запись';

  @override
  String get timeOfDay => 'Время суток';

  @override
  String get everyDay => 'Каждый день';

  @override
  String get repeatEveryDayForYear =>
      'Создавать эту запись каждый день в течение следующего года';

  @override
  String get repeatOn => 'Повторять по';

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
  String get weekdaySun => 'Вс';

  @override
  String get schedule => 'Расписание';

  @override
  String get enterValidNutritionValues =>
      'Введите корректные значения пищевой ценности';

  @override
  String get quickAddTitle => 'Быстрое добавление';

  @override
  String get kilojoules => 'Килоджоули';

  @override
  String get createdDate => 'Дата создания';

  @override
  String get failedMigrations => 'Ошибки миграции';

  @override
  String get failedMigrationsDescription =>
      'При создании или обновлении базы данных произошла ошибка. Обычно её можно исправить, удалив и заново создав записи.';

  @override
  String get errorMessage => 'Сообщение об ошибке:';

  @override
  String get createIssue => 'Создать обращение';

  @override
  String get cameraPermissionRequired =>
      'Для сканирования требуется доступ к камере.';

  @override
  String get scanFoodBarcode => 'Сканировать штрихкод продукта';

  @override
  String get holdBarcodeInFrame => 'Расположите штрихкод внутри рамки';

  @override
  String get pinchToZoom => 'Сведите или разведите пальцы для масштабирования';

  @override
  String get cameraStartFailed => 'Не удалось запустить камеру';

  @override
  String get editDiaryEntry => 'Изменить запись дневника';

  @override
  String get addFoodToDiary => 'Добавить продукт в дневник';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Вы уверены, что хотите удалить $name?';
  }

  @override
  String get imageError => 'Ошибка изображения';

  @override
  String get setImage => 'Установить изображение';

  @override
  String get name => 'Название';

  @override
  String get searchFoodsAndMeals => 'Поиск продуктов и приёмов пищи...';

  @override
  String get clearSelection => 'Снять выделение';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Штрихкод не найден. Сохраните, чтобы добавить.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Искать «$name» в Open Food Facts';
  }

  @override
  String get meal => 'Приём пищи';

  @override
  String get quantity => 'Количество';

  @override
  String get unit => 'Единица';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Порция ($amount $unit)';
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
  String get fiber => 'Клетчатка';

  @override
  String get unitServing => 'Порция';

  @override
  String get unitGrams => 'Граммы';

  @override
  String get unitMilliliters => 'Миллилитры';

  @override
  String get unitKilojoules => 'Килоджоули';

  @override
  String get unitCups => 'Чашки';

  @override
  String get unitTablespoons => 'Столовые ложки';

  @override
  String get unitMilligrams => 'Миллиграммы';

  @override
  String get unitTeaspoons => 'Чайные ложки';

  @override
  String get unitOunces => 'Унции';

  @override
  String get unitPounds => 'Фунты';

  @override
  String get unitKilograms => 'Килограммы';

  @override
  String get unitLiters => 'Литры';

  @override
  String get nameConflict => 'Конфликт названий';

  @override
  String get replaceExistingFood =>
      'Продукт с таким названием уже существует. Заменить старый?';

  @override
  String get no => 'Нет';

  @override
  String get yes => 'Да';

  @override
  String get editFood => 'Изменить продукт';

  @override
  String confirmDeleteFood(String name) {
    return 'Вы уверены, что хотите удалить $name?';
  }

  @override
  String get caloriesKcal => 'Калории (ккал)';

  @override
  String get kilojoulesKj => 'Килоджоули (кДж)';

  @override
  String get servingSize => 'Размер порции';

  @override
  String get servingUnit => 'Единица порции';

  @override
  String get saveAsNewCopy => 'Сохранить как новую копию';

  @override
  String get filterFoods => 'Фильтр продуктов';

  @override
  String get narrowFoodsFilters =>
      'Сузьте список, используя любую комбинацию фильтров.';

  @override
  String get foodDetails => 'Сведения о продукте';

  @override
  String get exampleFruitHint => 'например, фрукты';

  @override
  String get servingSizeRangeHint =>
      'Укажите минимум, максимум или оба значения.';

  @override
  String get minimum => 'Минимум';

  @override
  String get maximum => 'Максимум';

  @override
  String get noMinimum => 'Без минимума';

  @override
  String get noMaximum => 'Без максимума';

  @override
  String get clearAll => 'Очистить всё';

  @override
  String get searchOpenFoodFacts => 'Поиск в Open Food Facts';

  @override
  String get noMatchingProducts => 'Подходящих продуктов нет';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Попробуйте другое название или отсканируйте штрихкод.';

  @override
  String get enterFoodNameToSearch =>
      'Введите название продукта выше, затем отправьте запрос для поиска.';

  @override
  String get submitToSearch => 'Отправить для поиска...';

  @override
  String kcalValue(String value) {
    return '$value ккал';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value г белка';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изменить $count продукта',
      many: 'Изменить $count продуктов',
      few: 'Изменить $count продукта',
      one: 'Изменить $count продукт',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'Изменить приём пищи';

  @override
  String get addImage => 'Добавить изображение';

  @override
  String get noFoodsInMeal => 'В этом приёме пищи пока нет продуктов';

  @override
  String get addFoodToMealHint =>
      'Добавьте продукт, чтобы начать формировать этот приём пищи.';

  @override
  String get remove => 'Удалить';

  @override
  String get searchFoods => 'Поиск продуктов...';

  @override
  String get noFoodsFound => 'Продукты не найдены';

  @override
  String nothingMatchesSearch(String search) {
    return 'По запросу «$search» ничего не найдено.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Сначала добавьте продукты в библиотеку, прежде чем добавлять их в приём пищи.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value ккал / 100 г';
  }

  @override
  String get noDataYet => 'Данных пока нет';

  @override
  String get completePlansToViewGraphs =>
      'Заполните несколько записей, чтобы увидеть здесь графики.';

  @override
  String get value => 'Значение';

  @override
  String get goal => 'Цель';

  @override
  String get notSet => 'Не задано';

  @override
  String get trend => 'Тренд';

  @override
  String get smooth => 'Сглаживание';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Среднее по $count точки',
      many: 'Среднее по $count точкам',
      few: 'Среднее по $count точкам',
      one: 'Среднее по $count точке',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Изменить вес';

  @override
  String get addWeight => 'Добавить вес';

  @override
  String shareWeight(String value, String unit) {
    return 'Мой вес: $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Вес ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Введите вес';

  @override
  String get pleaseEnterValidWeight => 'Введите корректный вес';

  @override
  String get lastWeight => 'Последний вес';

  @override
  String unitWithValue(String unit) {
    return 'Единица ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Оставить единицу $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Преобразовать в $unit';
  }

  @override
  String get removeImage => 'Удалить изображение';

  @override
  String get mealRemindersEnabled => 'Напоминания о приёмах пищи включены';

  @override
  String get mealRemindersEnabledBody =>
      'Мы напомним вам записать завтрак, обед или ужин, если вы ещё этого не сделали.';

  @override
  String get reminderSettingsChannel => 'Настройки напоминаний';

  @override
  String get reminderSettingsChannelDescription =>
      'Уведомления с пояснениями о напоминаниях FitBook';

  @override
  String get breakfastReminderTitle => 'Не забудьте записать завтрак';

  @override
  String get breakfastRemindersChannel => 'Напоминания о завтраке';

  @override
  String get breakfastRemindersChannelDescription =>
      'Напоминания записать завтрак';

  @override
  String get lunchReminderTitle => 'Не забудьте записать обед';

  @override
  String get lunchRemindersChannel => 'Напоминания об обеде';

  @override
  String get lunchRemindersChannelDescription => 'Напоминания записать обед';

  @override
  String get dinnerReminderTitle => 'Не забудьте записать ужин';

  @override
  String get dinnerRemindersChannel => 'Напоминания об ужине';

  @override
  String get dinnerRemindersChannelDescription => 'Напоминания записать ужин';

  @override
  String get reinforcementGreatJob =>
      'Отличная работа! Ваши усилия приносят результат.';

  @override
  String get reinforcementKeepItUp => 'Так держать! Вы отлично продвигаетесь.';

  @override
  String get reinforcementFantastic =>
      'Прекрасно! Ваша целеустремлённость даёт результат.';

  @override
  String get reinforcementWellDone =>
      'Молодец! Вы ещё на шаг ближе к своей цели.';

  @override
  String get reinforcementImpressive =>
      'Впечатляет! Ваши усилия приносят плоды.';

  @override
  String get reinforcementAmazing => 'Замечательно! Вы на правильном пути.';

  @override
  String get reinforcementBravo =>
      'Браво! Ваша целеустремлённость достойна похвалы.';

  @override
  String get reinforcementExcellent =>
      'Отлично! Ваша настойчивость вдохновляет.';

  @override
  String get reinforcementSuperb => 'Превосходно! Вы отлично справляетесь.';

  @override
  String get reinforcementIncredible => 'Невероятно! Ваш прогресс заметен.';

  @override
  String get reinforcementWayToGoKing => 'Так держать, король!';

  @override
  String get reinforcementYeahBuddy => 'Да, дружище!';

  @override
  String get reinforcementThatsHowItsDone => 'Вот как надо!';

  @override
  String get reinforcementEasyAsPie => 'Проще простого.';

  @override
  String get reinforcementDoingGreat => 'У вас отлично получается.';

  @override
  String get reinforcementProgressNice => 'Это прогресс? Отлично.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'Осталось $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return 'Осталось $remaining $unit (цель: $target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'Сахара';

  @override
  String get nutrientCholesterol => 'Холестерин';

  @override
  String get nutrientSaturatedFat => 'Насыщенные жиры';

  @override
  String get nutrientCalcium => 'Кальций';

  @override
  String get nutrientIron => 'Железо';

  @override
  String get nutrientPotassium => 'Калий';

  @override
  String get nutrientMagnesium => 'Магний';

  @override
  String get nutrientVitaminA => 'Витамин A';

  @override
  String get nutrientVitaminC => 'Витамин C';

  @override
  String get nutrientVitaminB12 => 'Витамин B12';

  @override
  String get nutrientVitaminD => 'Витамин D';

  @override
  String get nutrientVitaminE => 'Витамин E';

  @override
  String get nutrientAddedSugar => 'Добавленный сахар';

  @override
  String get nutrientNetCarbs => 'Чистые углеводы';

  @override
  String get nutrientWater => 'Вода';

  @override
  String get nutrientOmega3 => 'Омега-3 жирные кислоты';

  @override
  String get nutrientOmega6 => 'Омега-6 жирные кислоты';

  @override
  String get nutrientPralScore => 'Показатель PRAL';

  @override
  String get nutrientTransFat => 'Трансжиры';

  @override
  String get nutrientSolubleFiber => 'Растворимая клетчатка';

  @override
  String get nutrientInsolubleFiber => 'Нерастворимая клетчатка';

  @override
  String get nutrientPhosphorus => 'Фосфор';

  @override
  String get nutrientSodium => 'Натрий';

  @override
  String get nutrientZinc => 'Цинк';

  @override
  String get nutrientCopper => 'Медь';

  @override
  String get nutrientManganese => 'Марганец';

  @override
  String get nutrientSelenium => 'Селен';

  @override
  String get nutrientFluoride => 'Фторид';

  @override
  String get nutrientMolybdenum => 'Молибден';

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
  String get nutrientStarch => 'Крахмал';

  @override
  String get nutrientSugarAlcohols => 'Сахарные спирты';

  @override
  String get nutrientThiaminB1 => 'Тиамин (B1)';

  @override
  String get nutrientRiboflavinB2 => 'Рибофлавин (B2)';

  @override
  String get nutrientNiacinB3 => 'Ниацин (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'Пантотеновая кислота (B5)';

  @override
  String get nutrientVitaminB6 => 'Витамин B6';

  @override
  String get nutrientBiotinB7 => 'Биотин (B7)';

  @override
  String get nutrientFolateB9 => 'Фолат (B9)';

  @override
  String get nutrientFolicAcid => 'Фолиевая кислота';

  @override
  String get nutrientFoodFolate => 'Фолат из пищи';

  @override
  String get nutrientFolateDfe => 'Пищевые эквиваленты фолата (DFE)';

  @override
  String get nutrientCholine => 'Холин';

  @override
  String get nutrientBetaine => 'Бетаин';

  @override
  String get nutrientRetinol => 'Ретинол';

  @override
  String get nutrientBetaCarotene => 'Бета-каротин';

  @override
  String get nutrientAlphaCarotene => 'Альфа-каротин';

  @override
  String get nutrientLycopene => 'Ликопин';

  @override
  String get nutrientLuteinZeaxanthin => 'Лютеин + зеаксантин';

  @override
  String get nutrientVitaminD2 => 'Витамин D2 (эргокальциферол)';

  @override
  String get nutrientVitaminD3 => 'Витамин D3 (холекальциферол)';

  @override
  String get nutrientVitaminK => 'Витамин K';

  @override
  String get nutrientDihydrophylloquinone => 'Дигидрофиллохинон';

  @override
  String get nutrientMenaquinone4 => 'Менахинон-4';

  @override
  String get nutrientMonounsaturatedFat => 'Мононенасыщенные жиры';

  @override
  String get nutrientPolyunsaturatedFat => 'Полиненасыщенные жиры';

  @override
  String get nutrientAla => 'Альфа-линоленовая кислота (ALA)';

  @override
  String get nutrientEpa => 'Эйкозапентаеновая кислота (EPA)';

  @override
  String get nutrientDpa => 'Докозапентаеновая кислота (DPA)';

  @override
  String get nutrientDha => 'Докозагексаеновая кислота (DHA)';

  @override
  String get nutrientAlanine => 'Аланин';

  @override
  String get nutrientAlcohol => 'Алкоголь';

  @override
  String get nutrientArginine => 'Аргинин';

  @override
  String get nutrientAsparticAcid => 'Аспарагиновая кислота';

  @override
  String get nutrientCystine => 'Цистин';

  @override
  String get nutrientGlutamicAcid => 'Глутаминовая кислота';

  @override
  String get nutrientGlycine => 'Глицин';

  @override
  String get nutrientHistidine => 'Гистидин';

  @override
  String get nutrientHydroxyproline => 'Гидроксипролин';

  @override
  String get nutrientIsoleucine => 'Изолейцин';

  @override
  String get nutrientLeucine => 'Лейцин';

  @override
  String get nutrientLysine => 'Лизин';

  @override
  String get nutrientMethionine => 'Метионин';

  @override
  String get nutrientPhenylalanine => 'Фенилаланин';

  @override
  String get nutrientProline => 'Пролин';

  @override
  String get nutrientSerine => 'Серин';

  @override
  String get nutrientThreonine => 'Треонин';

  @override
  String get nutrientTryptophan => 'Триптофан';

  @override
  String get nutrientTyrosine => 'Тирозин';

  @override
  String get nutrientValine => 'Валин';

  @override
  String get nutrientCaffeine => 'Кофеин';

  @override
  String get nutrientTheobromine => 'Теобромин';

  @override
  String servingWeightNumber(int number) {
    return 'Вес порции $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'Описание порции $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'Вес, эквивалентный 200 ккал';
}
