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
    return '$foodCount alimentos · $mealCount comidas';
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
  String get appearanceSettings => 'Ajustes de apariencia';
}
