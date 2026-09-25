// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Diario';

  @override
  String get navGraph => 'Gráfico';

  @override
  String get navFood => 'Alimentos';

  @override
  String get navWeight => 'Peso';

  @override
  String get navError => 'Error';

  @override
  String get loadDataFailed => 'No se pudieron cargar estos datos.';

  @override
  String get settings => 'Ajustes';

  @override
  String get invalidTabSettings => 'Configuración de pestañas no válida.';

  @override
  String newVersion(String version) {
    return 'Nueva versión $version';
  }

  @override
  String get changes => 'Cambios';

  @override
  String get searchSettings => 'Buscar en ajustes...';

  @override
  String get appearance => 'Apariencia';

  @override
  String get appearanceSubtitle => 'Tema, colores y visualización de gráficos';

  @override
  String get diary => 'Diario';

  @override
  String get diarySubtitle => 'Objetivos diarios, resúmenes y registro';

  @override
  String get food => 'Alimentos';

  @override
  String get foodSubtitle => 'Unidades, campos y valores predeterminados';

  @override
  String get weight => 'Peso';

  @override
  String get weightSubtitle => 'Unidades, objetivos y visualización del peso';

  @override
  String get tabs => 'Pestañas';

  @override
  String get tabsSubtitle => 'Pestañas de navegación y orden';

  @override
  String get data => 'Datos';

  @override
  String get dataSubtitle => 'Importación, exportación y datos locales';

  @override
  String get todayProgress => 'Progreso de hoy';

  @override
  String get latestDay => 'Último día';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros',
      one: '1 registro',
      zero: 'No hay registros',
    );
    return '$_temp0';
  }

  @override
  String editEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Editar $count registros',
      one: 'Editar 1 registro',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Calorías';

  @override
  String get protein => 'Proteínas';

  @override
  String get carbs => 'Carbohidratos';

  @override
  String get fat => 'Grasas';

  @override
  String get addDiaryEntry => 'Añadir registro al diario';

  @override
  String get noEntriesToday => 'No hay registros hoy.';

  @override
  String addSearchToDiary(String search) {
    return 'Añadir \"$search\" al diario';
  }

  @override
  String get tapStartLoggingFood => 'Toca para empezar a registrar alimentos.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'No hay registros coincidentes. Toca para crear este alimento y registrarlo.';

  @override
  String get add => 'Añadir';

  @override
  String get quickAdd => 'Añadido rápido';

  @override
  String get scanBarcode => 'Escanear código de barras';

  @override
  String get foodLibrary => 'Biblioteca de alimentos';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    String _temp0 = intl.Intl.pluralLogic(
      foodCount,
      locale: localeName,
      other: '$foodCount alimentos',
      one: '1 alimento',
    );
    String _temp1 = intl.Intl.pluralLogic(
      mealCount,
      locale: localeName,
      other: '$mealCount comidas',
      one: '1 comida',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'Usados recientemente';

  @override
  String get quickActions => 'Acciones rápidas';

  @override
  String get addFood => 'Añadir alimento';

  @override
  String get createMeal => 'Crear comida';

  @override
  String get noFoodYet => 'Aún no hay alimentos';

  @override
  String get noMatchingFood => 'No hay alimentos coincidentes';

  @override
  String get addFirstFoodOrMeal =>
      'Añade tu primer alimento o comida para empezar a crear tu biblioteca.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Nada coincide con “$search”. Borra la búsqueda para volver a ver todo.';
  }

  @override
  String get clearSearch => 'Borrar búsqueda';

  @override
  String get addMeal => 'Añadir comida';

  @override
  String get noWeightsYet => 'Aún no hay pesos';

  @override
  String get noMatchingWeights => 'No hay pesos coincidentes';

  @override
  String get logFirstWeight =>
      'Registra tu primer peso para empezar a seguir la tendencia.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Nada coincide con “$search”. Borra la búsqueda para ver todas las entradas.';
  }

  @override
  String get logWeight => 'Registrar peso';

  @override
  String get weightTrend => 'Tendencia del peso';

  @override
  String get weightTrendSubtitle => 'Mediciones recientes y dirección general';

  @override
  String get bodyWeight => 'Peso corporal';

  @override
  String get options => 'Opciones';

  @override
  String get day => 'Día';

  @override
  String get today => 'Hoy';

  @override
  String get week => 'Semana';

  @override
  String get month => 'Mes';

  @override
  String get year => 'Año';

  @override
  String get dateRange => 'Intervalo de fechas';

  @override
  String get startDate => 'Fecha de inicio';

  @override
  String get stopDate => 'Fecha de fin';

  @override
  String get dataPoints => 'Puntos de datos';

  @override
  String get customizeFields => 'Personalizar campos';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Elige el idioma que usa FitBook';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageFrench => 'Francés';

  @override
  String get languageGerman => 'Alemán';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languagePortugueseBrazil => 'Portugués (Brasil)';

  @override
  String get languageDutch => 'Neerlandés';

  @override
  String get languagePolish => 'Polaco';

  @override
  String get languageJapanese => 'Japonés';

  @override
  String get languageKorean => 'Coreano';

  @override
  String get languageChineseSimplified => 'Chino (simplificado)';

  @override
  String get languageChineseTraditional => 'Chino (tradicional)';

  @override
  String get languageRussian => 'Ruso';

  @override
  String get languageHindi => 'Hindi';

  @override
  String get appearanceSettings => 'Ajustes de apariencia';

  @override
  String get delete => 'Eliminar';

  @override
  String get confirmDelete => 'Confirmar eliminación';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '¿Seguro que quieres eliminar $count registros? Esta acción no se puede deshacer.',
      one:
          '¿Seguro que quieres eliminar 1 registro? Esta acción no se puede deshacer.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get search => 'Buscar...';

  @override
  String get clear => 'Borrar';

  @override
  String get showMenu => 'Mostrar menú';

  @override
  String get selectAll => 'Seleccionar todo';

  @override
  String get edit => 'Editar';

  @override
  String get favorite => 'Favorito';

  @override
  String get atLeastOneTab => 'Necesitas al menos una pestaña';

  @override
  String get scrollableTabs => 'Pestañas desplazables';

  @override
  String get save => 'Guardar';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get pureBlackAmoled => 'Negro puro (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => 'Usa negro puro en pantallas AMOLED';

  @override
  String get systemColorScheme => 'Esquema de color del sistema';

  @override
  String get systemColorSchemeTooltip =>
      'Usa el color principal de tu dispositivo en la aplicación';

  @override
  String get showImages => 'Mostrar imágenes';

  @override
  String get showImagesTooltip =>
      'Selecciona y muestra imágenes en las páginas de diario y alimentos';

  @override
  String get curveLineGraphs => 'Gráficas de líneas curvas';

  @override
  String get curveLineGraphsTooltip =>
      'Usa curvas suaves en la página de gráficas';

  @override
  String get weightStatCards => 'Tarjetas de estadísticas de peso';

  @override
  String get weightStatCardsTooltip =>
      'Muestra las entradas de peso como una cuadrícula de tarjetas en lugar de la lista predeterminada';

  @override
  String get graphsStartAtZero => 'Las gráficas empiezan en cero';

  @override
  String get graphsStartAtZeroTooltip =>
      'Haz que el eje Y de las gráficas empiece siempre en cero';

  @override
  String get navigationAnimation => 'Animación de navegación';

  @override
  String get animationFade => 'Fundido';

  @override
  String get animationZoom => 'Zoom';

  @override
  String get animationSlide => 'Deslizamiento';

  @override
  String get animationRise => 'Ascenso';

  @override
  String get animationNone => 'Ninguna';

  @override
  String longDateFormat(String example) {
    return 'Formato de fecha largo ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Formato de fecha corto ($example)';
  }

  @override
  String get diarySettings => 'Ajustes del diario';

  @override
  String get diaryUnit => 'Unidad del diario';

  @override
  String get diarySummary => 'Resumen del diario';

  @override
  String get diarySummaryDivision => 'División - actual / total';

  @override
  String get diarySummaryRemaining => 'Restante';

  @override
  String get diarySummaryBoth => 'Ambos - restante (total)';

  @override
  String get diarySummaryNone => 'Ninguno';

  @override
  String get dailyCaloriesKcal => 'Calorías diarias (kcal)';

  @override
  String get dailyProteinG => 'Proteína diaria (g)';

  @override
  String get dailyFatG => 'Grasa diaria (g)';

  @override
  String get dailyCarbsG => 'Carbohidratos diarios (g)';

  @override
  String get dailyFiberG => 'Fibra diaria (g)';

  @override
  String get automaticDailies => 'Objetivos diarios automáticos';

  @override
  String get automaticDailiesTooltip =>
      'Calcula automáticamente las calorías, proteínas, grasas y carbohidratos diarios recomendados a partir de tu peso corporal';

  @override
  String get selectNameOnSubmit => 'Seleccionar el nombre al guardar';

  @override
  String get reminders => 'Recordatorios';

  @override
  String get foodSettings => 'Ajustes de alimentos';

  @override
  String get foodUnit => 'Unidad de alimento';

  @override
  String get fields => 'Campos';

  @override
  String get favoriteNewFoods => 'Marcar nuevos alimentos como favoritos';

  @override
  String get pickFields => 'Elegir campos';

  @override
  String get all => 'Todos';

  @override
  String get onlySelected => 'Solo seleccionados';

  @override
  String get weightSettings => 'Ajustes de peso';

  @override
  String get targetWeight => 'Peso objetivo';

  @override
  String get positiveReinforcement => 'Refuerzo positivo';

  @override
  String get positiveReinforcementPreview =>
      '¡Los mensajes motivadores se mostrarán así!';

  @override
  String get dataSettings => 'Ajustes de datos';

  @override
  String get automaticBackup => 'Copia de seguridad automática';

  @override
  String get shareDatabase => 'Compartir base de datos';

  @override
  String get openNotification => 'Abrir notificación';

  @override
  String get automaticBackupsEnabled =>
      'Copias de seguridad automáticas activadas';

  @override
  String get automaticBackupBody =>
      'FitBook guardará automáticamente tus datos e imágenes en la carpeta seleccionada cada día.';

  @override
  String get backupSettings => 'Ajustes de copia de seguridad';

  @override
  String get backupSettingsChannelDescription =>
      'Notificaciones sobre copias de seguridad automáticas';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get close => 'Cerrar';

  @override
  String get loggedIn => 'Sesión iniciada';

  @override
  String get about => 'Acerca de';

  @override
  String get version => 'Versión';

  @override
  String get whatsNew => 'Novedades';

  @override
  String get author => 'Autor';

  @override
  String get license => 'Licencia';

  @override
  String get donate => 'Donar';

  @override
  String get supportProject => 'Ayuda a mantener este proyecto';

  @override
  String get leaveReview => 'Dejar una reseña';

  @override
  String get rateOnPlayStore => 'Valora FitBook en Play Store';

  @override
  String get sourceCode => 'Código fuente';

  @override
  String get foods => 'Alimentos';

  @override
  String get backup => 'Copia de seguridad';

  @override
  String get exportData => 'Exportar datos';

  @override
  String get importData => 'Importar datos';

  @override
  String get failedImportData => 'No se pudieron importar los datos';

  @override
  String get copyError => 'Copiar error';

  @override
  String get deleteRecords => 'Eliminar registros';

  @override
  String get unusedFood => 'Alimentos sin usar';

  @override
  String get database => 'Base de datos';

  @override
  String get deleteAllWeightsConfirm =>
      '¿Seguro que quieres eliminar todos los registros de peso? Esta acción no se puede deshacer.';

  @override
  String get deleteDatabaseConfirm =>
      '¿Seguro que quieres eliminar tu base de datos? Esta acción no se puede deshacer y destruirá todos tus datos.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      '¿Seguro que quieres eliminar todos los alimentos y las entradas del diario? Esta acción no se puede deshacer.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '¿Seguro que quieres eliminar $count alimentos sin usar? Esta acción es irreversible.',
      one:
          '¿Seguro que quieres eliminar 1 alimento sin usar? Esta acción es irreversible.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      '¿Seguro que quieres eliminar todas las entradas del diario? Esta acción no se puede deshacer.';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Reemplazar imagen';

  @override
  String get takePhoto => 'Tomar foto';

  @override
  String get deleteImage => 'Eliminar imagen';

  @override
  String get filters => 'Filtros';

  @override
  String get foodGroup => 'Grupo de alimentos';

  @override
  String get exampleFruit => 'Fruta';

  @override
  String clearFiltersCount(int count) {
    return 'Limpiar ($count)';
  }

  @override
  String get done => 'Hecho';

  @override
  String get showFilters => 'Mostrar filtros';

  @override
  String get repeatEntry => 'Repetir entrada';

  @override
  String get timeOfDay => 'Hora del día';

  @override
  String get everyDay => 'Todos los días';

  @override
  String get repeatEveryDayForYear =>
      'Crear esta entrada cada día durante el próximo año';

  @override
  String get repeatOn => 'Repetir el';

  @override
  String get weekdayMon => 'Lun';

  @override
  String get weekdayTue => 'Mar';

  @override
  String get weekdayWed => 'Mié';

  @override
  String get weekdayThu => 'Jue';

  @override
  String get weekdayFri => 'Vie';

  @override
  String get weekdaySat => 'Sáb';

  @override
  String get weekdaySun => 'Dom';

  @override
  String get schedule => 'Programar';

  @override
  String get enterValidNutritionValues =>
      'Introduce valores nutricionales válidos';

  @override
  String get quickAddTitle => 'Adición rápida';

  @override
  String get kilojoules => 'Kilojulios';

  @override
  String get createdDate => 'Fecha de creación';

  @override
  String get failedMigrations => 'Migraciones fallidas';

  @override
  String get failedMigrationsDescription =>
      'Algo salió mal al crear o actualizar la base de datos. Normalmente se puede solucionar eliminando y volviendo a crear los registros.';

  @override
  String get errorMessage => 'Mensaje de error:';

  @override
  String get createIssue => 'Crear incidencia';

  @override
  String get cameraPermissionRequired =>
      'Se requiere permiso para usar la cámara y escanear.';

  @override
  String get scanFoodBarcode => 'Escanear el código de barras de un alimento';

  @override
  String get holdBarcodeInFrame =>
      'Mantén el código de barras dentro del marco';

  @override
  String get pinchToZoom => 'Pellizca para ampliar';

  @override
  String get cameraStartFailed => 'No se pudo iniciar la cámara';

  @override
  String get editDiaryEntry => 'Editar registro del diario';

  @override
  String get addFoodToDiary => 'Añadir alimento al diario';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return '¿Seguro que quieres eliminar $name?';
  }

  @override
  String get imageError => 'Error de imagen';

  @override
  String get setImage => 'Establecer imagen';

  @override
  String get name => 'Nombre';

  @override
  String get searchFoodsAndMeals => 'Buscar alimentos y comidas...';

  @override
  String get clearSelection => 'Borrar selección';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Código de barras no encontrado. Guarda para añadirlo.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Buscar \"$name\" en OpenFoodFacts';
  }

  @override
  String get meal => 'Comida';

  @override
  String get quantity => 'Cantidad';

  @override
  String get unit => 'Unidad';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Ración ($amount $unit)';
  }

  @override
  String get barcode => 'Código de barras';

  @override
  String nutritionPerAmountUnit(String nutrient, String amount, String unit) {
    return '$nutrient (por $amount $unit)';
  }

  @override
  String nutritionPerQuantityUnit(
      String nutrient, String quantity, String unit) {
    return '$nutrient por $quantity $unit';
  }

  @override
  String get fiber => 'Fibra';

  @override
  String get unitServing => 'Ración';

  @override
  String get unitGrams => 'Gramos';

  @override
  String get unitMilliliters => 'Mililitros';

  @override
  String get unitKilojoules => 'Kilojulios';

  @override
  String get unitCups => 'Tazas';

  @override
  String get unitTablespoons => 'Cucharadas';

  @override
  String get unitMilligrams => 'Miligramos';

  @override
  String get unitTeaspoons => 'Cucharaditas';

  @override
  String get unitOunces => 'Onzas';

  @override
  String get unitPounds => 'Libras';

  @override
  String get unitKilograms => 'Kilogramos';

  @override
  String get unitLiters => 'Litros';

  @override
  String get nameConflict => 'Conflicto de nombre';

  @override
  String get replaceExistingFood =>
      'Ya existe un alimento con este nombre. ¿Quieres sustituir el anterior?';

  @override
  String get no => 'No';

  @override
  String get yes => 'Sí';

  @override
  String get editFood => 'Editar alimento';

  @override
  String confirmDeleteFood(String name) {
    return '¿Seguro que quieres eliminar $name?';
  }

  @override
  String get caloriesKcal => 'Calorías (kcal)';

  @override
  String get kilojoulesKj => 'Kilojulios (kJ)';

  @override
  String get servingSize => 'Tamaño de la ración';

  @override
  String get servingUnit => 'Unidad de la ración';

  @override
  String get saveAsNewCopy => 'Guardar como copia nueva';

  @override
  String get filterFoods => 'Filtrar alimentos';

  @override
  String get narrowFoodsFilters =>
      'Acota la lista con cualquier combinación de filtros.';

  @override
  String get foodDetails => 'Detalles del alimento';

  @override
  String get exampleFruitHint => 'p. ej., Fruta';

  @override
  String get servingSizeRangeHint => 'Define un mínimo, un máximo o ambos.';

  @override
  String get minimum => 'Mínimo';

  @override
  String get maximum => 'Máximo';

  @override
  String get noMinimum => 'Sin mínimo';

  @override
  String get noMaximum => 'Sin máximo';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String get searchOpenFoodFacts => 'Buscar en Open Food Facts';

  @override
  String get noMatchingProducts => 'No hay productos coincidentes';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Prueba con otro nombre o escanea un código de barras.';

  @override
  String get enterFoodNameToSearch =>
      'Introduce arriba el nombre de un alimento y envíalo para buscar.';

  @override
  String get submitToSearch => 'Enviar para buscar...';

  @override
  String kcalValue(String value) {
    return '$value kcal';
  }

  @override
  String proteinGramsValue(String value) {
    return '$value g de proteína';
  }

  @override
  String editFoodsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Editar $count alimentos',
      one: 'Editar 1 alimento',
    );
    return '$_temp0';
  }

  @override
  String get editMeal => 'Editar comida';

  @override
  String get addImage => 'Añadir imagen';

  @override
  String get noFoodsInMeal => 'Aún no hay alimentos en esta comida';

  @override
  String get addFoodToMealHint =>
      'Añade un alimento para empezar a preparar esta comida.';

  @override
  String get remove => 'Eliminar';

  @override
  String get searchFoods => 'Buscar alimentos...';

  @override
  String get noFoodsFound => 'No se encontraron alimentos';

  @override
  String nothingMatchesSearch(String search) {
    return 'No hay resultados para «$search».';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Añade alimentos a tu biblioteca antes de añadirlos a una comida.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'Aún no hay datos';

  @override
  String get completePlansToViewGraphs =>
      'Completa algunos planes para ver gráficos aquí.';

  @override
  String get value => 'Valor';

  @override
  String get goal => 'Objetivo';

  @override
  String get notSet => 'Sin configurar';

  @override
  String get trend => 'Tendencia';

  @override
  String get smooth => 'Suavizado';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Promedio de $count puntos',
      one: 'Promedio de 1 punto',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Editar peso';

  @override
  String get addWeight => 'Añadir peso';

  @override
  String shareWeight(String value, String unit) {
    return '¡Acabo de pesarme: $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Peso ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Introduce el peso';

  @override
  String get pleaseEnterValidWeight => 'Introduce un peso válido';

  @override
  String get lastWeight => 'Último peso';

  @override
  String unitWithValue(String unit) {
    return 'Unidad ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Mantener la unidad en $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Convertir a $unit';
  }

  @override
  String get removeImage => 'Quitar imagen';

  @override
  String get mealRemindersEnabled => 'Recordatorios de comidas activados';

  @override
  String get mealRemindersEnabledBody =>
      'Te recordaremos que registres el desayuno, el almuerzo o la cena si aún no lo has hecho.';

  @override
  String get reminderSettingsChannel => 'Ajustes de recordatorios';

  @override
  String get reminderSettingsChannelDescription =>
      'Notificaciones sobre los recordatorios de FitBook';

  @override
  String get breakfastReminderTitle => 'No olvides registrar el desayuno';

  @override
  String get breakfastRemindersChannel => 'Recordatorios del desayuno';

  @override
  String get breakfastRemindersChannelDescription =>
      'Recordatorios para registrar el desayuno';

  @override
  String get lunchReminderTitle => 'No olvides registrar el almuerzo';

  @override
  String get lunchRemindersChannel => 'Recordatorios del almuerzo';

  @override
  String get lunchRemindersChannelDescription =>
      'Recordatorios para registrar el almuerzo';

  @override
  String get dinnerReminderTitle => 'No olvides registrar la cena';

  @override
  String get dinnerRemindersChannel => 'Recordatorios de la cena';

  @override
  String get dinnerRemindersChannelDescription =>
      'Recordatorios para registrar la cena';

  @override
  String get reinforcementGreatJob =>
      '¡Buen trabajo! Tu esfuerzo está dando sus frutos.';

  @override
  String get reinforcementKeepItUp =>
      '¡Sigue así! Estás progresando de maravilla.';

  @override
  String get reinforcementFantastic =>
      '¡Fantástico! Tu constancia está dando resultados.';

  @override
  String get reinforcementWellDone =>
      '¡Bien hecho! Estás un paso más cerca de tu objetivo.';

  @override
  String get reinforcementImpressive =>
      '¡Impresionante! Tu esfuerzo está dando frutos.';

  @override
  String get reinforcementAmazing => '¡Genial! Vas por buen camino.';

  @override
  String get reinforcementBravo => '¡Bravo! Tu compromiso es admirable.';

  @override
  String get reinforcementExcellent => '¡Excelente! Tu perseverancia inspira.';

  @override
  String get reinforcementSuperb =>
      '¡Magnífico! Lo estás haciendo de maravilla.';

  @override
  String get reinforcementIncredible => '¡Increíble! Se nota tu progreso.';

  @override
  String get reinforcementWayToGoKing => '¡Así se hace, rey!';

  @override
  String get reinforcementYeahBuddy => '¡Eso es!';

  @override
  String get reinforcementThatsHowItsDone => 'Así se hace.';

  @override
  String get reinforcementEasyAsPie => 'Pan comido.';

  @override
  String get reinforcementDoingGreat => 'Lo estás haciendo muy bien.';

  @override
  String get reinforcementProgressNice => '¿Eso que veo es progreso? Bien.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'Quedan $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return 'Quedan $remaining $unit ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'Azúcares';

  @override
  String get nutrientCholesterol => 'Colesterol';

  @override
  String get nutrientSaturatedFat => 'Grasas saturadas';

  @override
  String get nutrientCalcium => 'Calcio';

  @override
  String get nutrientIron => 'Hierro';

  @override
  String get nutrientPotassium => 'Potasio';

  @override
  String get nutrientMagnesium => 'Magnesio';

  @override
  String get nutrientVitaminA => 'Vitamina A';

  @override
  String get nutrientVitaminC => 'Vitamina C';

  @override
  String get nutrientVitaminB12 => 'Vitamina B12';

  @override
  String get nutrientVitaminD => 'Vitamina D';

  @override
  String get nutrientVitaminE => 'Vitamina E';

  @override
  String get nutrientAddedSugar => 'Azúcares añadidos';

  @override
  String get nutrientNetCarbs => 'Carbohidratos netos';

  @override
  String get nutrientWater => 'Agua';

  @override
  String get nutrientOmega3 => 'Ácidos grasos omega-3';

  @override
  String get nutrientOmega6 => 'Ácidos grasos omega-6';

  @override
  String get nutrientPralScore => 'Puntuación PRAL';

  @override
  String get nutrientTransFat => 'Grasas trans';

  @override
  String get nutrientSolubleFiber => 'Fibra soluble';

  @override
  String get nutrientInsolubleFiber => 'Fibra insoluble';

  @override
  String get nutrientPhosphorus => 'Fósforo';

  @override
  String get nutrientSodium => 'Sodio';

  @override
  String get nutrientZinc => 'Zinc';

  @override
  String get nutrientCopper => 'Cobre';

  @override
  String get nutrientManganese => 'Manganeso';

  @override
  String get nutrientSelenium => 'Selenio';

  @override
  String get nutrientFluoride => 'Fluoruro';

  @override
  String get nutrientMolybdenum => 'Molibdeno';

  @override
  String get nutrientChloride => 'Cloruro';

  @override
  String get nutrientSucrose => 'Sacarosa';

  @override
  String get nutrientGlucose => 'Glucosa';

  @override
  String get nutrientFructose => 'Fructosa';

  @override
  String get nutrientLactose => 'Lactosa';

  @override
  String get nutrientMaltose => 'Maltosa';

  @override
  String get nutrientGalactose => 'Galactosa';

  @override
  String get nutrientStarch => 'Almidón';

  @override
  String get nutrientSugarAlcohols => 'Polialcoholes';

  @override
  String get nutrientThiaminB1 => 'Tiamina (B1)';

  @override
  String get nutrientRiboflavinB2 => 'Riboflavina (B2)';

  @override
  String get nutrientNiacinB3 => 'Niacina (B3)';

  @override
  String get nutrientPantothenicAcidB5 => 'Ácido pantoténico (B5)';

  @override
  String get nutrientVitaminB6 => 'Vitamina B6';

  @override
  String get nutrientBiotinB7 => 'Biotina (B7)';

  @override
  String get nutrientFolateB9 => 'Folato (B9)';

  @override
  String get nutrientFolicAcid => 'Ácido fólico';

  @override
  String get nutrientFoodFolate => 'Folato de los alimentos';

  @override
  String get nutrientFolateDfe => 'Equivalentes de folato dietético (DFE)';

  @override
  String get nutrientCholine => 'Colina';

  @override
  String get nutrientBetaine => 'Betaína';

  @override
  String get nutrientRetinol => 'Retinol';

  @override
  String get nutrientBetaCarotene => 'Betacaroteno';

  @override
  String get nutrientAlphaCarotene => 'Alfacaroteno';

  @override
  String get nutrientLycopene => 'Licopeno';

  @override
  String get nutrientLuteinZeaxanthin => 'Luteína + zeaxantina';

  @override
  String get nutrientVitaminD2 => 'Vitamina D2 (ergocalciferol)';

  @override
  String get nutrientVitaminD3 => 'Vitamina D3 (colecalciferol)';

  @override
  String get nutrientVitaminK => 'Vitamina K';

  @override
  String get nutrientDihydrophylloquinone => 'Dihidrofiloquinona';

  @override
  String get nutrientMenaquinone4 => 'Menaquinona-4';

  @override
  String get nutrientMonounsaturatedFat => 'Grasas monoinsaturadas';

  @override
  String get nutrientPolyunsaturatedFat => 'Grasas poliinsaturadas';

  @override
  String get nutrientAla => 'Ácido alfa-linolénico (ALA)';

  @override
  String get nutrientEpa => 'Ácido eicosapentaenoico (EPA)';

  @override
  String get nutrientDpa => 'Ácido docosapentaenoico (DPA)';

  @override
  String get nutrientDha => 'Ácido docosahexaenoico (DHA)';

  @override
  String get nutrientAlanine => 'Alanina';

  @override
  String get nutrientAlcohol => 'Alcohol';

  @override
  String get nutrientArginine => 'Arginina';

  @override
  String get nutrientAsparticAcid => 'Ácido aspártico';

  @override
  String get nutrientCystine => 'Cistina';

  @override
  String get nutrientGlutamicAcid => 'Ácido glutámico';

  @override
  String get nutrientGlycine => 'Glicina';

  @override
  String get nutrientHistidine => 'Histidina';

  @override
  String get nutrientHydroxyproline => 'Hidroxiprolina';

  @override
  String get nutrientIsoleucine => 'Isoleucina';

  @override
  String get nutrientLeucine => 'Leucina';

  @override
  String get nutrientLysine => 'Lisina';

  @override
  String get nutrientMethionine => 'Metionina';

  @override
  String get nutrientPhenylalanine => 'Fenilalanina';

  @override
  String get nutrientProline => 'Prolina';

  @override
  String get nutrientSerine => 'Serina';

  @override
  String get nutrientThreonine => 'Treonina';

  @override
  String get nutrientTryptophan => 'Triptófano';

  @override
  String get nutrientTyrosine => 'Tirosina';

  @override
  String get nutrientValine => 'Valina';

  @override
  String get nutrientCaffeine => 'Cafeína';

  @override
  String get nutrientTheobromine => 'Teobromina';

  @override
  String servingWeightNumber(int number) {
    return 'Peso de ración $number';
  }

  @override
  String servingDescriptionNumber(int number) {
    return 'Descripción de ración $number';
  }

  @override
  String get calorieEquivalentWeight200 => 'Peso equivalente a 200 kcal';
}
