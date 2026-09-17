// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Diário';

  @override
  String get navGraph => 'Gráfico';

  @override
  String get navFood => 'Alimentos';

  @override
  String get navWeight => 'Peso';

  @override
  String get navError => 'Erro';

  @override
  String get settings => 'Configurações';

  @override
  String get invalidTabSettings => 'Configuração de abas inválida.';

  @override
  String newVersion(String version) {
    return 'Nova versão $version';
  }

  @override
  String get changes => 'Novidades';

  @override
  String get searchSettings => 'Pesquisar configurações...';

  @override
  String get appearance => 'Aparência';

  @override
  String get appearanceSubtitle => 'Tema, cores e exibição dos gráficos';

  @override
  String get diary => 'Diário';

  @override
  String get diarySubtitle => 'Metas diárias, resumos e registros';

  @override
  String get food => 'Alimentos';

  @override
  String get foodSubtitle => 'Unidades, campos e valores padrão';

  @override
  String get weight => 'Peso';

  @override
  String get weightSubtitle => 'Unidades, metas e exibição do peso';

  @override
  String get tabs => 'Abas';

  @override
  String get tabsSubtitle => 'Abas de navegação e ordem';

  @override
  String get data => 'Dados';

  @override
  String get dataSubtitle => 'Importação, exportação e dados locais';

  @override
  String get todayProgress => 'Progresso de hoje';

  @override
  String get latestDay => 'Último dia';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros',
      one: '1 registro',
      zero: 'Nenhum registro',
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
  String get calories => 'Calorias';

  @override
  String get protein => 'Proteínas';

  @override
  String get carbs => 'Carboidratos';

  @override
  String get fat => 'Gorduras';

  @override
  String get addDiaryEntry => 'Adicionar registro ao diário';

  @override
  String get noEntriesToday => 'Nenhum registro hoje.';

  @override
  String addSearchToDiary(String search) {
    return 'Adicionar \"$search\" ao diário';
  }

  @override
  String get tapStartLoggingFood => 'Toque para começar a registrar alimentos.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Nenhum registro correspondente. Toque para criar este alimento e registrá-lo.';

  @override
  String get add => 'Adicionar';

  @override
  String get quickAdd => 'Adição rápida';

  @override
  String get scanBarcode => 'Ler código de barras';

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
      other: '$mealCount refeições',
      one: '1 refeição',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'Usados recentemente';

  @override
  String get quickActions => 'Ações rápidas';

  @override
  String get addFood => 'Adicionar alimento';

  @override
  String get createMeal => 'Criar refeição';

  @override
  String get noFoodYet => 'Nenhum alimento ainda';

  @override
  String get noMatchingFood => 'Nenhum alimento correspondente';

  @override
  String get addFirstFoodOrMeal =>
      'Adicione seu primeiro alimento ou refeição para começar a montar sua biblioteca.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Nada corresponde a “$search”. Limpe a pesquisa para ver tudo novamente.';
  }

  @override
  String get clearSearch => 'Limpar pesquisa';

  @override
  String get addMeal => 'Adicionar refeição';

  @override
  String get noWeightsYet => 'Nenhum peso registrado ainda';

  @override
  String get noMatchingWeights => 'Nenhum peso correspondente';

  @override
  String get logFirstWeight =>
      'Registre seu primeiro peso para começar a acompanhar a tendência.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Nada corresponde a “$search”. Limpe a pesquisa para ver todos os registros.';
  }

  @override
  String get logWeight => 'Registrar peso';

  @override
  String get weightTrend => 'Tendência do peso';

  @override
  String get weightTrendSubtitle => 'Medições recentes e direção geral';

  @override
  String get bodyWeight => 'Peso corporal';

  @override
  String get options => 'Opções';

  @override
  String get day => 'Dia';

  @override
  String get today => 'Hoje';

  @override
  String get week => 'Semana';

  @override
  String get month => 'Mês';

  @override
  String get year => 'Ano';

  @override
  String get dateRange => 'Intervalo de datas';

  @override
  String get startDate => 'Data inicial';

  @override
  String get stopDate => 'Data final';

  @override
  String get dataPoints => 'Pontos de dados';

  @override
  String get customizeFields => 'Personalizar campos';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Escolha o idioma usado pelo FitBook';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageSpanish => 'Espanhol';

  @override
  String get languageFrench => 'Francês';

  @override
  String get languageGerman => 'Alemão';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languagePortugueseBrazil => 'Português (Brasil)';

  @override
  String get languageDutch => 'Holandês';

  @override
  String get languagePolish => 'Polonês';

  @override
  String get languageJapanese => 'Japonês';

  @override
  String get languageKorean => 'Coreano';

  @override
  String get languageChineseSimplified => 'Chinês (simplificado)';

  @override
  String get appearanceSettings => 'Configurações de aparência';

  @override
  String get delete => 'Eliminar';

  @override
  String get confirmDelete => 'Confirmar eliminação';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tem a certeza de que pretende eliminar $count registos? Esta ação não pode ser anulada.',
      one:
          'Tem a certeza de que pretende eliminar 1 registo? Esta ação não pode ser anulada.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get search => 'Pesquisar...';

  @override
  String get clear => 'Limpar';

  @override
  String get showMenu => 'Mostrar menu';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String get edit => 'Editar';

  @override
  String get favorite => 'Favorito';

  @override
  String get atLeastOneTab => 'É necessário manter pelo menos um separador';

  @override
  String get scrollableTabs => 'Separadores deslocáveis';

  @override
  String get save => 'Guardar';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get pureBlackAmoled => 'Preto puro (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => 'Utilizar preto puro em ecrãs AMOLED';

  @override
  String get systemColorScheme => 'Esquema de cores do sistema';

  @override
  String get systemColorSchemeTooltip =>
      'Utilizar a cor principal do dispositivo na aplicação';

  @override
  String get showImages => 'Mostrar imagens';

  @override
  String get showImagesTooltip =>
      'Escolher e mostrar imagens nas páginas do diário e dos alimentos';

  @override
  String get curveLineGraphs => 'Gráficos de linhas curvas';

  @override
  String get curveLineGraphsTooltip =>
      'Utilizar curvas suaves na página dos gráficos';

  @override
  String get weightStatCards => 'Cartões de estatísticas de peso';

  @override
  String get weightStatCardsTooltip =>
      'Mostrar os registos de peso numa grelha de cartões em vez da lista predefinida';

  @override
  String get graphsStartAtZero => 'Gráficos começam em zero';

  @override
  String get graphsStartAtZeroTooltip =>
      'Começar sempre o eixo Y do gráfico em zero';

  @override
  String get navigationAnimation => 'Animação de navegação';

  @override
  String get animationFade => 'Desvanecer';

  @override
  String get animationZoom => 'Zoom';

  @override
  String get animationSlide => 'Deslizar';

  @override
  String get animationRise => 'Subir';

  @override
  String get animationNone => 'Nenhuma';

  @override
  String longDateFormat(String example) {
    return 'Formato de data longo ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Formato de data curto ($example)';
  }

  @override
  String get diarySettings => 'Definições do diário';

  @override
  String get diaryUnit => 'Unidade do diário';

  @override
  String get diarySummary => 'Resumo do diário';

  @override
  String get diarySummaryDivision => 'Divisão - atual / total';

  @override
  String get diarySummaryRemaining => 'Restante';

  @override
  String get diarySummaryBoth => 'Ambos - restante (total)';

  @override
  String get diarySummaryNone => 'Nenhum';

  @override
  String get dailyCaloriesKcal => 'Calorias diárias (kcal)';

  @override
  String get dailyProteinG => 'Proteína diária (g)';

  @override
  String get dailyFatG => 'Gordura diária (g)';

  @override
  String get dailyCarbsG => 'Hidratos de carbono diários (g)';

  @override
  String get dailyFiberG => 'Fibra diária (g)';

  @override
  String get automaticDailies => 'Objetivos diários automáticos';

  @override
  String get automaticDailiesTooltip =>
      'Calcular automaticamente as calorias, proteínas, gorduras e hidratos de carbono diários recomendados com base no peso corporal';

  @override
  String get selectNameOnSubmit => 'Selecionar o nome ao guardar';

  @override
  String get reminders => 'Lembretes';

  @override
  String get foodSettings => 'Definições dos alimentos';

  @override
  String get foodUnit => 'Unidade do alimento';

  @override
  String get fields => 'Campos';

  @override
  String get favoriteNewFoods => 'Adicionar novos alimentos aos favoritos';

  @override
  String get pickFields => 'Escolher campos';

  @override
  String get all => 'Todos';

  @override
  String get onlySelected => 'Apenas selecionados';

  @override
  String get weightSettings => 'Definições de peso';

  @override
  String get targetWeight => 'Peso-alvo';

  @override
  String get positiveReinforcement => 'Reforço positivo';

  @override
  String get positiveReinforcementPreview =>
      'As mensagens de incentivo serão apresentadas assim!';

  @override
  String get dataSettings => 'Definições de dados';

  @override
  String get automaticBackup => 'Cópia de segurança automática';

  @override
  String get shareDatabase => 'Partilhar base de dados';

  @override
  String get openNotification => 'Abrir notificação';

  @override
  String get automaticBackupsEnabled =>
      'Cópias de segurança automáticas ativadas';

  @override
  String get automaticBackupBody =>
      'O FitBook fará automaticamente, todos os dias, uma cópia dos seus dados e imagens para a pasta selecionada.';

  @override
  String get backupSettings => 'Definições de cópia de segurança';

  @override
  String get backupSettingsChannelDescription =>
      'Notificações sobre cópias de segurança automáticas';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Nome de utilizador';

  @override
  String get password => 'Palavra-passe';

  @override
  String get close => 'Fechar';

  @override
  String get loggedIn => 'Sessão iniciada';

  @override
  String get about => 'Sobre';

  @override
  String get version => 'Versão';

  @override
  String get whatsNew => 'Novidades';

  @override
  String get author => 'Autor';

  @override
  String get license => 'Licença';

  @override
  String get donate => 'Doar';

  @override
  String get supportProject => 'Ajude a apoiar este projeto';

  @override
  String get leaveReview => 'Deixar uma avaliação';

  @override
  String get rateOnPlayStore => 'Avaliar o FitBook na Play Store';

  @override
  String get sourceCode => 'Código-fonte';

  @override
  String get foods => 'Alimentos';

  @override
  String get backup => 'Cópia de segurança';

  @override
  String get exportData => 'Exportar dados';

  @override
  String get importData => 'Importar dados';

  @override
  String get failedImportData => 'Falha ao importar dados';

  @override
  String get copyError => 'Copiar erro';

  @override
  String get deleteRecords => 'Eliminar registos';

  @override
  String get unusedFood => 'Alimentos não utilizados';

  @override
  String get database => 'Base de dados';

  @override
  String get deleteAllWeightsConfirm =>
      'Tem a certeza de que pretende eliminar todos os registos de peso? Esta ação não pode ser anulada.';

  @override
  String get deleteDatabaseConfirm =>
      'Tem a certeza de que pretende eliminar a base de dados? Esta ação não pode ser anulada e eliminará todos os seus dados.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Tem a certeza de que pretende eliminar todos os alimentos e registos do diário? Esta ação não pode ser anulada.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tem a certeza de que pretende eliminar $count alimentos não utilizados? Esta ação é irreversível.',
      one:
          'Tem a certeza de que pretende eliminar 1 alimento não utilizado? Esta ação é irreversível.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Tem a certeza de que pretende eliminar todos os registos do diário? Esta ação não pode ser anulada.';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Substituir imagem';

  @override
  String get takePhoto => 'Tirar fotografia';

  @override
  String get deleteImage => 'Eliminar imagem';

  @override
  String get filters => 'Filtros';

  @override
  String get foodGroup => 'Grupo alimentar';

  @override
  String get exampleFruit => 'Fruta';

  @override
  String clearFiltersCount(int count) {
    return 'Limpar ($count)';
  }

  @override
  String get done => 'Concluído';

  @override
  String get showFilters => 'Mostrar filtros';

  @override
  String get repeatEntry => 'Repetir registo';

  @override
  String get timeOfDay => 'Hora do dia';

  @override
  String get everyDay => 'Todos os dias';

  @override
  String get repeatEveryDayForYear =>
      'Criar este registo todos os dias durante o próximo ano';

  @override
  String get repeatOn => 'Repetir em';

  @override
  String get weekdayMon => 'Seg';

  @override
  String get weekdayTue => 'Ter';

  @override
  String get weekdayWed => 'Qua';

  @override
  String get weekdayThu => 'Qui';

  @override
  String get weekdayFri => 'Sex';

  @override
  String get weekdaySat => 'Sáb';

  @override
  String get weekdaySun => 'Dom';

  @override
  String get schedule => 'Agendar';

  @override
  String get enterValidNutritionValues =>
      'Introduza valores nutricionais válidos';

  @override
  String get quickAddTitle => 'Adição rápida';

  @override
  String get kilojoules => 'Quilojoules';

  @override
  String get createdDate => 'Data de criação';

  @override
  String get failedMigrations => 'Migrações falhadas';

  @override
  String get failedMigrationsDescription =>
      'Ocorreu um problema ao criar ou atualizar a base de dados. Normalmente, pode corrigi-lo eliminando e voltando a criar os registos.';

  @override
  String get errorMessage => 'Mensagem de erro:';

  @override
  String get createIssue => 'Criar ocorrência';

  @override
  String get cameraPermissionRequired =>
      'É necessária autorização para usar a câmara e digitalizar.';

  @override
  String get scanFoodBarcode => 'Digitalizar o código de barras de um alimento';

  @override
  String get holdBarcodeInFrame =>
      'Mantenha o código de barras dentro da moldura';

  @override
  String get pinchToZoom => 'Aperte para ampliar';

  @override
  String get cameraStartFailed => 'Não foi possível iniciar a câmara';

  @override
  String get editDiaryEntry => 'Editar entrada do diário';

  @override
  String get addFoodToDiary => 'Adicionar alimento ao diário';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Tem a certeza de que pretende eliminar $name?';
  }

  @override
  String get imageError => 'Erro na imagem';

  @override
  String get setImage => 'Definir imagem';

  @override
  String get name => 'Nome';

  @override
  String get searchFoodsAndMeals => 'Pesquisar alimentos e refeições...';

  @override
  String get clearSelection => 'Limpar seleção';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Código de barras não encontrado. Guarde para adicionar.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Pesquisar \"$name\" no OpenFoodFacts';
  }

  @override
  String get meal => 'Refeição';

  @override
  String get quantity => 'Quantidade';

  @override
  String get unit => 'Unidade';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Porção ($amount $unit)';
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
  String get unitServing => 'Porção';

  @override
  String get unitGrams => 'Gramas';

  @override
  String get unitMilliliters => 'Mililitros';

  @override
  String get unitKilojoules => 'Quilojoules';

  @override
  String get unitCups => 'Chávenas';

  @override
  String get unitTablespoons => 'Colheres de sopa';

  @override
  String get unitMilligrams => 'Miligramas';

  @override
  String get unitTeaspoons => 'Colheres de chá';

  @override
  String get unitOunces => 'Onças';

  @override
  String get unitPounds => 'Libras';

  @override
  String get unitKilograms => 'Quilogramas';

  @override
  String get unitLiters => 'Litros';

  @override
  String get nameConflict => 'Conflito de nome';

  @override
  String get replaceExistingFood =>
      'Já existe um alimento com este nome. Pretende substituir o anterior?';

  @override
  String get no => 'Não';

  @override
  String get yes => 'Sim';

  @override
  String get editFood => 'Editar alimento';

  @override
  String confirmDeleteFood(String name) {
    return 'Tem a certeza de que pretende eliminar $name?';
  }

  @override
  String get caloriesKcal => 'Calorias (kcal)';

  @override
  String get kilojoulesKj => 'Quilojoules (kJ)';

  @override
  String get servingSize => 'Tamanho da porção';

  @override
  String get servingUnit => 'Unidade da porção';

  @override
  String get saveAsNewCopy => 'Guardar como nova cópia';

  @override
  String get filterFoods => 'Filtrar alimentos';

  @override
  String get narrowFoodsFilters =>
      'Restrinja a lista usando qualquer combinação de filtros.';

  @override
  String get foodDetails => 'Detalhes do alimento';

  @override
  String get exampleFruitHint => 'ex.: Fruta';

  @override
  String get servingSizeRangeHint => 'Defina um mínimo, um máximo ou ambos.';

  @override
  String get minimum => 'Mínimo';

  @override
  String get maximum => 'Máximo';

  @override
  String get noMinimum => 'Sem mínimo';

  @override
  String get noMaximum => 'Sem máximo';

  @override
  String get clearAll => 'Limpar tudo';

  @override
  String get searchOpenFoodFacts => 'Pesquisar no Open Food Facts';

  @override
  String get noMatchingProducts => 'Nenhum produto correspondente';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Experimente outro nome ou leia um código de barras.';

  @override
  String get enterFoodNameToSearch =>
      'Introduza acima o nome de um alimento e inicie a pesquisa.';

  @override
  String get submitToSearch => 'Pesquisar...';

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
  String get editMeal => 'Editar refeição';

  @override
  String get addImage => 'Adicionar imagem';

  @override
  String get noFoodsInMeal => 'Ainda não há alimentos nesta refeição';

  @override
  String get addFoodToMealHint =>
      'Adicione um alimento para começar a montar esta refeição.';

  @override
  String get remove => 'Remover';

  @override
  String get searchFoods => 'Pesquisar alimentos...';

  @override
  String get noFoodsFound => 'Nenhum alimento encontrado';

  @override
  String nothingMatchesSearch(String search) {
    return 'Nada corresponde a “$search”.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Adicione alimentos à sua biblioteca antes de adicioná-los a uma refeição.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'Ainda não há dados';

  @override
  String get completePlansToViewGraphs =>
      'Conclua alguns planos para ver gráficos aqui.';

  @override
  String get value => 'Valor';

  @override
  String get goal => 'Meta';

  @override
  String get notSet => 'Não definido';

  @override
  String get trend => 'Tendência';

  @override
  String get smooth => 'Suavização';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Média de $count pontos',
      one: 'Média de 1 ponto',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Editar peso';

  @override
  String get addWeight => 'Adicionar peso';

  @override
  String shareWeight(String value, String unit) {
    return 'Acabei de me pesar: $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Peso ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Digite o peso';

  @override
  String get pleaseEnterValidWeight => 'Digite um peso válido';

  @override
  String get lastWeight => 'Último peso';

  @override
  String unitWithValue(String unit) {
    return 'Unidade ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Manter unidade em $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Converter para $unit';
  }

  @override
  String get removeImage => 'Remover imagem';

  @override
  String get mealRemindersEnabled => 'Lembretes de refeições ativados';

  @override
  String get mealRemindersEnabledBody =>
      'Vamos lembrar você de registrar o café da manhã, o almoço ou o jantar se ainda não tiver feito isso.';

  @override
  String get reminderSettingsChannel => 'Configurações de lembretes';

  @override
  String get reminderSettingsChannelDescription =>
      'Notificações sobre os lembretes do FitBook';

  @override
  String get breakfastReminderTitle =>
      'Não se esqueça de registrar o café da manhã';

  @override
  String get breakfastRemindersChannel => 'Lembretes do café da manhã';

  @override
  String get breakfastRemindersChannelDescription =>
      'Lembretes para registrar o café da manhã';

  @override
  String get lunchReminderTitle => 'Não se esqueça de registrar o almoço';

  @override
  String get lunchRemindersChannel => 'Lembretes do almoço';

  @override
  String get lunchRemindersChannelDescription =>
      'Lembretes para registrar o almoço';

  @override
  String get dinnerReminderTitle => 'Não se esqueça de registrar o jantar';

  @override
  String get dinnerRemindersChannel => 'Lembretes do jantar';

  @override
  String get dinnerRemindersChannelDescription =>
      'Lembretes para registrar o jantar';

  @override
  String get reinforcementGreatJob =>
      'Bom trabalho! O teu esforço está a dar frutos.';

  @override
  String get reinforcementKeepItUp =>
      'Continua assim! Estás a fazer excelentes progressos.';

  @override
  String get reinforcementFantastic =>
      'Fantástico! A tua dedicação está a dar resultados.';

  @override
  String get reinforcementWellDone =>
      'Muito bem! Estás um passo mais perto do teu objetivo.';

  @override
  String get reinforcementImpressive =>
      'Impressionante! O teu esforço está a dar frutos.';

  @override
  String get reinforcementAmazing => 'Excelente! Estás no caminho certo.';

  @override
  String get reinforcementBravo => 'Bravo! O teu empenho é admirável.';

  @override
  String get reinforcementExcellent =>
      'Excelente! A tua perseverança é inspiradora.';

  @override
  String get reinforcementSuperb =>
      'Fantástico! Estás a fazer um trabalho excecional.';

  @override
  String get reinforcementIncredible => 'Incrível! O teu progresso é visível.';

  @override
  String get reinforcementWayToGoKing => 'Força, rei!';

  @override
  String get reinforcementYeahBuddy => 'É isso mesmo!';

  @override
  String get reinforcementThatsHowItsDone => 'É assim que se faz.';

  @override
  String get reinforcementEasyAsPie => 'Canja.';

  @override
  String get reinforcementDoingGreat => 'Estás a sair-te muito bem.';

  @override
  String get reinforcementProgressNice => 'É progresso que estou a ver? Boa.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'Faltam $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return 'Faltam $remaining $unit ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'Açúcares';

  @override
  String get nutrientCholesterol => 'Colesterol';

  @override
  String get nutrientSaturatedFat => 'Gorduras saturadas';

  @override
  String get nutrientCalcium => 'Cálcio';

  @override
  String get nutrientIron => 'Ferro';

  @override
  String get nutrientPotassium => 'Potássio';

  @override
  String get nutrientMagnesium => 'Magnésio';

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
  String get nutrientAddedSugar => 'Açúcares adicionados';

  @override
  String get nutrientNetCarbs => 'Hidratos de carbono líquidos';

  @override
  String get nutrientWater => 'Água';

  @override
  String get nutrientOmega3 => 'Ácidos gordos ómega-3';

  @override
  String get nutrientOmega6 => 'Ácidos gordos ómega-6';

  @override
  String get nutrientPralScore => 'Pontuação PRAL';

  @override
  String get nutrientTransFat => 'Gorduras trans';

  @override
  String get nutrientSolubleFiber => 'Fibra solúvel';

  @override
  String get nutrientInsolubleFiber => 'Fibra insolúvel';

  @override
  String get nutrientPhosphorus => 'Fósforo';

  @override
  String get nutrientSodium => 'Sódio';

  @override
  String get nutrientZinc => 'Zinco';

  @override
  String get nutrientCopper => 'Cobre';

  @override
  String get nutrientManganese => 'Manganês';

  @override
  String get nutrientSelenium => 'Selénio';

  @override
  String get nutrientFluoride => 'Fluoreto';

  @override
  String get nutrientMolybdenum => 'Molibdénio';

  @override
  String get nutrientChloride => 'Cloreto';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Diário';

  @override
  String get navGraph => 'Gráfico';

  @override
  String get navFood => 'Alimentos';

  @override
  String get navWeight => 'Peso';

  @override
  String get navError => 'Erro';

  @override
  String get settings => 'Configurações';

  @override
  String get invalidTabSettings => 'Configuração de abas inválida.';

  @override
  String newVersion(String version) {
    return 'Nova versão $version';
  }

  @override
  String get changes => 'Novidades';

  @override
  String get searchSettings => 'Pesquisar configurações...';

  @override
  String get appearance => 'Aparência';

  @override
  String get appearanceSubtitle => 'Tema, cores e exibição dos gráficos';

  @override
  String get diary => 'Diário';

  @override
  String get diarySubtitle => 'Metas diárias, resumos e registros';

  @override
  String get food => 'Alimentos';

  @override
  String get foodSubtitle => 'Unidades, campos e padrões dos alimentos';

  @override
  String get weight => 'Peso';

  @override
  String get weightSubtitle => 'Unidades, metas e exibição do peso';

  @override
  String get tabs => 'Abas';

  @override
  String get tabsSubtitle => 'Abas de navegação e ordem';

  @override
  String get data => 'Dados';

  @override
  String get dataSubtitle => 'Importação, exportação e dados locais';

  @override
  String get todayProgress => 'Progresso de hoje';

  @override
  String get latestDay => 'Último dia';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros',
      one: '1 registro',
      zero: 'Nenhum registro',
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
  String get calories => 'Calorias';

  @override
  String get protein => 'Proteínas';

  @override
  String get carbs => 'Carboidratos';

  @override
  String get fat => 'Gorduras';

  @override
  String get addDiaryEntry => 'Adicionar registro ao diário';

  @override
  String get noEntriesToday => 'Nenhum registro hoje.';

  @override
  String addSearchToDiary(String search) {
    return 'Adicionar \"$search\" ao diário';
  }

  @override
  String get tapStartLoggingFood => 'Toque para começar a registrar alimentos.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Nenhum registro correspondente. Toque para criar este alimento e registrá-lo.';

  @override
  String get add => 'Adicionar';

  @override
  String get quickAdd => 'Adição rápida';

  @override
  String get scanBarcode => 'Ler código de barras';

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
      other: '$mealCount refeições',
      one: '1 refeição',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get recentlyUsed => 'Usados recentemente';

  @override
  String get quickActions => 'Ações rápidas';

  @override
  String get addFood => 'Adicionar alimento';

  @override
  String get createMeal => 'Criar refeição';

  @override
  String get noFoodYet => 'Nenhum alimento ainda';

  @override
  String get noMatchingFood => 'Nenhum alimento correspondente';

  @override
  String get addFirstFoodOrMeal =>
      'Adicione seu primeiro alimento ou refeição para começar a montar sua biblioteca.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Nada corresponde a “$search”. Limpe a pesquisa para ver tudo novamente.';
  }

  @override
  String get clearSearch => 'Limpar pesquisa';

  @override
  String get addMeal => 'Adicionar refeição';

  @override
  String get noWeightsYet => 'Nenhum peso registrado ainda';

  @override
  String get noMatchingWeights => 'Nenhum peso correspondente';

  @override
  String get logFirstWeight =>
      'Registre seu primeiro peso para começar a acompanhar a tendência.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Nada corresponde a “$search”. Limpe a pesquisa para ver todos os registros.';
  }

  @override
  String get logWeight => 'Registrar peso';

  @override
  String get weightTrend => 'Tendência do peso';

  @override
  String get weightTrendSubtitle => 'Medições recentes e direção geral';

  @override
  String get bodyWeight => 'Peso corporal';

  @override
  String get options => 'Opções';

  @override
  String get day => 'Dia';

  @override
  String get today => 'Hoje';

  @override
  String get week => 'Semana';

  @override
  String get month => 'Mês';

  @override
  String get year => 'Ano';

  @override
  String get dateRange => 'Intervalo de datas';

  @override
  String get startDate => 'Data inicial';

  @override
  String get stopDate => 'Data final';

  @override
  String get dataPoints => 'Pontos de dados';

  @override
  String get customizeFields => 'Personalizar campos';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Escolha o idioma usado pelo FitBook';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageSpanish => 'Espanhol';

  @override
  String get languageFrench => 'Francês';

  @override
  String get languageGerman => 'Alemão';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languagePortugueseBrazil => 'Português (Brasil)';

  @override
  String get languageDutch => 'Holandês';

  @override
  String get languagePolish => 'Polonês';

  @override
  String get languageJapanese => 'Japonês';

  @override
  String get languageKorean => 'Coreano';

  @override
  String get languageChineseSimplified => 'Chinês (simplificado)';

  @override
  String get appearanceSettings => 'Configurações de aparência';

  @override
  String get delete => 'Excluir';

  @override
  String get confirmDelete => 'Confirmar exclusão';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tem certeza de que deseja excluir $count registros? Esta ação não pode ser desfeita.',
      one:
          'Tem certeza de que deseja excluir 1 registro? Esta ação não pode ser desfeita.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get search => 'Pesquisar...';

  @override
  String get clear => 'Limpar';

  @override
  String get showMenu => 'Mostrar menu';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String get edit => 'Editar';

  @override
  String get favorite => 'Favorito';

  @override
  String get atLeastOneTab => 'É preciso manter pelo menos uma aba';

  @override
  String get scrollableTabs => 'Abas roláveis';

  @override
  String get save => 'Salvar';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get pureBlackAmoled => 'Preto puro (AMOLED)';

  @override
  String get pureBlackAmoledTooltip => 'Use preto puro em telas AMOLED';

  @override
  String get systemColorScheme => 'Esquema de cores do sistema';

  @override
  String get systemColorSchemeTooltip =>
      'Use a cor principal do dispositivo no aplicativo';

  @override
  String get showImages => 'Mostrar imagens';

  @override
  String get showImagesTooltip =>
      'Escolha e mostre imagens nas páginas de diário e alimentos';

  @override
  String get curveLineGraphs => 'Gráficos de linhas curvas';

  @override
  String get curveLineGraphsTooltip =>
      'Use curvas suaves na página de gráficos';

  @override
  String get weightStatCards => 'Cartões de estatísticas de peso';

  @override
  String get weightStatCardsTooltip =>
      'Mostre os registros de peso como uma grade de cartões em vez da lista padrão';

  @override
  String get graphsStartAtZero => 'Gráficos começam em zero';

  @override
  String get graphsStartAtZeroTooltip =>
      'Sempre inicie o eixo Y do gráfico em zero';

  @override
  String get navigationAnimation => 'Animação de navegação';

  @override
  String get animationFade => 'Esmaecer';

  @override
  String get animationZoom => 'Zoom';

  @override
  String get animationSlide => 'Deslizar';

  @override
  String get animationRise => 'Subir';

  @override
  String get animationNone => 'Nenhuma';

  @override
  String longDateFormat(String example) {
    return 'Formato de data longo ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Formato de data curto ($example)';
  }

  @override
  String get diarySettings => 'Configurações do diário';

  @override
  String get diaryUnit => 'Unidade do diário';

  @override
  String get diarySummary => 'Resumo do diário';

  @override
  String get diarySummaryDivision => 'Divisão - atual / total';

  @override
  String get diarySummaryRemaining => 'Restante';

  @override
  String get diarySummaryBoth => 'Ambos - restante (total)';

  @override
  String get diarySummaryNone => 'Nenhum';

  @override
  String get dailyCaloriesKcal => 'Calorias diárias (kcal)';

  @override
  String get dailyProteinG => 'Proteína diária (g)';

  @override
  String get dailyFatG => 'Gordura diária (g)';

  @override
  String get dailyCarbsG => 'Carboidratos diários (g)';

  @override
  String get dailyFiberG => 'Fibra diária (g)';

  @override
  String get automaticDailies => 'Metas diárias automáticas';

  @override
  String get automaticDailiesTooltip =>
      'Calcule automaticamente as calorias, proteínas, gorduras e carboidratos diários recomendados com base no seu peso corporal';

  @override
  String get selectNameOnSubmit => 'Selecionar o nome ao salvar';

  @override
  String get reminders => 'Lembretes';

  @override
  String get foodSettings => 'Configurações de alimentos';

  @override
  String get foodUnit => 'Unidade do alimento';

  @override
  String get fields => 'Campos';

  @override
  String get favoriteNewFoods => 'Adicionar novos alimentos aos favoritos';

  @override
  String get pickFields => 'Escolher campos';

  @override
  String get all => 'Todos';

  @override
  String get onlySelected => 'Somente selecionados';

  @override
  String get weightSettings => 'Configurações de peso';

  @override
  String get targetWeight => 'Peso-alvo';

  @override
  String get positiveReinforcement => 'Reforço positivo';

  @override
  String get positiveReinforcementPreview =>
      'Mensagens de incentivo serão exibidas assim!';

  @override
  String get dataSettings => 'Configurações de dados';

  @override
  String get automaticBackup => 'Backup automático';

  @override
  String get shareDatabase => 'Compartilhar banco de dados';

  @override
  String get openNotification => 'Abrir notificação';

  @override
  String get automaticBackupsEnabled => 'Backups automáticos ativados';

  @override
  String get automaticBackupBody =>
      'O FitBook fará automaticamente, todos os dias, o backup dos seus dados e imagens na pasta selecionada.';

  @override
  String get backupSettings => 'Configurações de backup';

  @override
  String get backupSettingsChannelDescription =>
      'Notificações sobre backups automáticos';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Nome de usuário';

  @override
  String get password => 'Senha';

  @override
  String get close => 'Fechar';

  @override
  String get loggedIn => 'Login realizado';

  @override
  String get about => 'Sobre';

  @override
  String get version => 'Versão';

  @override
  String get whatsNew => 'Novidades';

  @override
  String get author => 'Autor';

  @override
  String get license => 'Licença';

  @override
  String get donate => 'Doar';

  @override
  String get supportProject => 'Ajude a apoiar este projeto';

  @override
  String get leaveReview => 'Deixar uma avaliação';

  @override
  String get rateOnPlayStore => 'Avaliar o FitBook na Play Store';

  @override
  String get sourceCode => 'Código-fonte';

  @override
  String get foods => 'Alimentos';

  @override
  String get backup => 'Backup';

  @override
  String get exportData => 'Exportar dados';

  @override
  String get importData => 'Importar dados';

  @override
  String get failedImportData => 'Falha ao importar dados';

  @override
  String get copyError => 'Copiar erro';

  @override
  String get deleteRecords => 'Excluir registros';

  @override
  String get unusedFood => 'Alimentos não utilizados';

  @override
  String get database => 'Banco de dados';

  @override
  String get deleteAllWeightsConfirm =>
      'Tem certeza de que deseja excluir todos os registros de peso? Esta ação não pode ser desfeita.';

  @override
  String get deleteDatabaseConfirm =>
      'Tem certeza de que deseja excluir o banco de dados? Esta ação não pode ser desfeita e apagará todos os seus dados.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Tem certeza de que deseja excluir todos os alimentos e registros do diário? Esta ação não pode ser desfeita.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tem certeza de que deseja excluir $count alimentos não utilizados? Esta ação é irreversível.',
      one:
          'Tem certeza de que deseja excluir 1 alimento não utilizado? Esta ação é irreversível.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Tem certeza de que deseja excluir todos os registros do diário? Esta ação não pode ser desfeita.';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Substituir imagem';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get deleteImage => 'Excluir imagem';

  @override
  String get filters => 'Filtros';

  @override
  String get foodGroup => 'Grupo de alimentos';

  @override
  String get exampleFruit => 'Fruta';

  @override
  String clearFiltersCount(int count) {
    return 'Limpar ($count)';
  }

  @override
  String get done => 'Concluído';

  @override
  String get showFilters => 'Mostrar filtros';

  @override
  String get repeatEntry => 'Repetir registro';

  @override
  String get timeOfDay => 'Horário';

  @override
  String get everyDay => 'Todos os dias';

  @override
  String get repeatEveryDayForYear =>
      'Criar este registro todos os dias durante o próximo ano';

  @override
  String get repeatOn => 'Repetir em';

  @override
  String get weekdayMon => 'Seg';

  @override
  String get weekdayTue => 'Ter';

  @override
  String get weekdayWed => 'Qua';

  @override
  String get weekdayThu => 'Qui';

  @override
  String get weekdayFri => 'Sex';

  @override
  String get weekdaySat => 'Sáb';

  @override
  String get weekdaySun => 'Dom';

  @override
  String get schedule => 'Agendar';

  @override
  String get enterValidNutritionValues => 'Insira valores nutricionais válidos';

  @override
  String get quickAddTitle => 'Adição rápida';

  @override
  String get kilojoules => 'Quilojoules';

  @override
  String get createdDate => 'Data de criação';

  @override
  String get failedMigrations => 'Falha nas migrações';

  @override
  String get failedMigrationsDescription =>
      'Ocorreu um problema ao criar ou atualizar o banco de dados. Normalmente, isso pode ser corrigido excluindo e recriando os registros.';

  @override
  String get errorMessage => 'Mensagem de erro:';

  @override
  String get createIssue => 'Criar issue';

  @override
  String get cameraPermissionRequired =>
      'É necessária permissão para usar a câmera e escanear.';

  @override
  String get scanFoodBarcode => 'Escanear o código de barras de um alimento';

  @override
  String get holdBarcodeInFrame =>
      'Mantenha o código de barras dentro do quadro';

  @override
  String get pinchToZoom => 'Faça o gesto de pinça para ampliar';

  @override
  String get cameraStartFailed => 'Não foi possível iniciar a câmera';

  @override
  String get editDiaryEntry => 'Editar entrada do diário';

  @override
  String get addFoodToDiary => 'Adicionar alimento ao diário';

  @override
  String confirmDeleteDiaryEntry(String name) {
    return 'Tem certeza de que deseja excluir $name?';
  }

  @override
  String get imageError => 'Erro na imagem';

  @override
  String get setImage => 'Definir imagem';

  @override
  String get name => 'Nome';

  @override
  String get searchFoodsAndMeals => 'Buscar alimentos e refeições...';

  @override
  String get clearSelection => 'Limpar seleção';

  @override
  String get barcodeNotFoundSaveToInsert =>
      'Código de barras não encontrado. Salve para adicionar.';

  @override
  String searchOpenFoodFactsFor(String name) {
    return 'Buscar \"$name\" no OpenFoodFacts';
  }

  @override
  String get meal => 'Refeição';

  @override
  String get quantity => 'Quantidade';

  @override
  String get unit => 'Unidade';

  @override
  String servingWithAmountUnit(String amount, String unit) {
    return 'Porção ($amount $unit)';
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
  String get unitServing => 'Porção';

  @override
  String get unitGrams => 'Gramas';

  @override
  String get unitMilliliters => 'Mililitros';

  @override
  String get unitKilojoules => 'Quilojoules';

  @override
  String get unitCups => 'Xícaras';

  @override
  String get unitTablespoons => 'Colheres de sopa';

  @override
  String get unitMilligrams => 'Miligramas';

  @override
  String get unitTeaspoons => 'Colheres de chá';

  @override
  String get unitOunces => 'Onças';

  @override
  String get unitPounds => 'Libras';

  @override
  String get unitKilograms => 'Quilogramas';

  @override
  String get unitLiters => 'Litros';

  @override
  String get nameConflict => 'Conflito de nome';

  @override
  String get replaceExistingFood =>
      'Já existe um alimento com este nome. Deseja substituir o anterior?';

  @override
  String get no => 'Não';

  @override
  String get yes => 'Sim';

  @override
  String get editFood => 'Editar alimento';

  @override
  String confirmDeleteFood(String name) {
    return 'Tem certeza de que deseja excluir $name?';
  }

  @override
  String get caloriesKcal => 'Calorias (kcal)';

  @override
  String get kilojoulesKj => 'Quilojoules (kJ)';

  @override
  String get servingSize => 'Tamanho da porção';

  @override
  String get servingUnit => 'Unidade da porção';

  @override
  String get saveAsNewCopy => 'Salvar como nova cópia';

  @override
  String get filterFoods => 'Filtrar alimentos';

  @override
  String get narrowFoodsFilters =>
      'Refine a lista usando qualquer combinação de filtros.';

  @override
  String get foodDetails => 'Detalhes do alimento';

  @override
  String get exampleFruitHint => 'ex.: Fruta';

  @override
  String get servingSizeRangeHint => 'Defina um mínimo, um máximo ou ambos.';

  @override
  String get minimum => 'Mínimo';

  @override
  String get maximum => 'Máximo';

  @override
  String get noMinimum => 'Sem mínimo';

  @override
  String get noMaximum => 'Sem máximo';

  @override
  String get clearAll => 'Limpar tudo';

  @override
  String get searchOpenFoodFacts => 'Pesquisar no Open Food Facts';

  @override
  String get noMatchingProducts => 'Nenhum produto correspondente';

  @override
  String get tryAnotherNameOrScanBarcode =>
      'Tente outro nome ou escaneie um código de barras.';

  @override
  String get enterFoodNameToSearch =>
      'Digite acima o nome de um alimento e faça a busca.';

  @override
  String get submitToSearch => 'Buscar...';

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
  String get editMeal => 'Editar refeição';

  @override
  String get addImage => 'Adicionar imagem';

  @override
  String get noFoodsInMeal => 'Ainda não há alimentos nesta refeição';

  @override
  String get addFoodToMealHint =>
      'Adicione um alimento para começar a montar esta refeição.';

  @override
  String get remove => 'Remover';

  @override
  String get searchFoods => 'Pesquisar alimentos...';

  @override
  String get noFoodsFound => 'Nenhum alimento encontrado';

  @override
  String nothingMatchesSearch(String search) {
    return 'Nada corresponde a “$search”.';
  }

  @override
  String get addFoodsToLibraryFirst =>
      'Adicione alimentos à sua biblioteca antes de adicioná-los a uma refeição.';

  @override
  String caloriesPer100gValue(String value) {
    return '$value kcal / 100 g';
  }

  @override
  String get noDataYet => 'Ainda não há dados';

  @override
  String get completePlansToViewGraphs =>
      'Conclua alguns planos para ver gráficos aqui.';

  @override
  String get value => 'Valor';

  @override
  String get goal => 'Meta';

  @override
  String get notSet => 'Não definido';

  @override
  String get trend => 'Tendência';

  @override
  String get smooth => 'Suavização';

  @override
  String pointAverage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Média de $count pontos',
      one: 'Média de 1 ponto',
    );
    return '$_temp0';
  }

  @override
  String get editWeight => 'Editar peso';

  @override
  String get addWeight => 'Adicionar peso';

  @override
  String shareWeight(String value, String unit) {
    return 'Acabei de me pesar: $value $unit!';
  }

  @override
  String weightWithUnit(String unit) {
    return 'Peso ($unit)';
  }

  @override
  String get pleaseEnterWeight => 'Digite o peso';

  @override
  String get pleaseEnterValidWeight => 'Digite um peso válido';

  @override
  String get lastWeight => 'Último peso';

  @override
  String unitWithValue(String unit) {
    return 'Unidade ($unit)';
  }

  @override
  String keepUnitAs(String unit) {
    return 'Manter unidade em $unit';
  }

  @override
  String convertToUnit(String unit) {
    return 'Converter para $unit';
  }

  @override
  String get removeImage => 'Remover imagem';

  @override
  String get mealRemindersEnabled => 'Lembretes de refeições ativados';

  @override
  String get mealRemindersEnabledBody =>
      'Vamos lembrar você de registrar o café da manhã, o almoço ou o jantar se ainda não tiver feito isso.';

  @override
  String get reminderSettingsChannel => 'Configurações de lembretes';

  @override
  String get reminderSettingsChannelDescription =>
      'Notificações sobre os lembretes do FitBook';

  @override
  String get breakfastReminderTitle =>
      'Não se esqueça de registrar o café da manhã';

  @override
  String get breakfastRemindersChannel => 'Lembretes do café da manhã';

  @override
  String get breakfastRemindersChannelDescription =>
      'Lembretes para registrar o café da manhã';

  @override
  String get lunchReminderTitle => 'Não se esqueça de registrar o almoço';

  @override
  String get lunchRemindersChannel => 'Lembretes do almoço';

  @override
  String get lunchRemindersChannelDescription =>
      'Lembretes para registrar o almoço';

  @override
  String get dinnerReminderTitle => 'Não se esqueça de registrar o jantar';

  @override
  String get dinnerRemindersChannel => 'Lembretes do jantar';

  @override
  String get dinnerRemindersChannelDescription =>
      'Lembretes para registrar o jantar';

  @override
  String get reinforcementGreatJob =>
      'Ótimo trabalho! Seu esforço está valendo a pena.';

  @override
  String get reinforcementKeepItUp =>
      'Continue assim! Você está fazendo um excelente progresso.';

  @override
  String get reinforcementFantastic =>
      'Fantástico! Sua dedicação está trazendo resultados.';

  @override
  String get reinforcementWellDone =>
      'Muito bem! Você está um passo mais perto da sua meta.';

  @override
  String get reinforcementImpressive =>
      'Impressionante! Seus esforços estão dando frutos.';

  @override
  String get reinforcementAmazing => 'Incrível! Você está no caminho certo.';

  @override
  String get reinforcementBravo => 'Bravo! Seu comprometimento é admirável.';

  @override
  String get reinforcementExcellent =>
      'Excelente! Sua perseverança é inspiradora.';

  @override
  String get reinforcementSuperb =>
      'Sensacional! Você está mandando muito bem.';

  @override
  String get reinforcementIncredible => 'Incrível! Dá para ver seu progresso.';

  @override
  String get reinforcementWayToGoKing => 'Boa, rei!';

  @override
  String get reinforcementYeahBuddy => 'É isso aí!';

  @override
  String get reinforcementThatsHowItsDone => 'É assim que se faz.';

  @override
  String get reinforcementEasyAsPie => 'Moleza.';

  @override
  String get reinforcementDoingGreat => 'Você está indo muito bem.';

  @override
  String get reinforcementProgressNice =>
      'Isso é progresso que eu estou vendo? Boa.';

  @override
  String diarySummaryRemainingValue(String remaining, String unit) {
    return 'Restam $remaining $unit';
  }

  @override
  String diarySummaryBothValue(String remaining, String target, String unit) {
    return 'Restam $remaining $unit ($target $unit)';
  }

  @override
  String diarySummaryDivisionValue(String current, String target, String unit) {
    return '$current / $target $unit';
  }

  @override
  String get nutrientSugars => 'Açúcares';

  @override
  String get nutrientCholesterol => 'Colesterol';

  @override
  String get nutrientSaturatedFat => 'Gorduras saturadas';

  @override
  String get nutrientCalcium => 'Cálcio';

  @override
  String get nutrientIron => 'Ferro';

  @override
  String get nutrientPotassium => 'Potássio';

  @override
  String get nutrientMagnesium => 'Magnésio';

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
  String get nutrientAddedSugar => 'Açúcares adicionados';

  @override
  String get nutrientNetCarbs => 'Carboidratos líquidos';

  @override
  String get nutrientWater => 'Água';

  @override
  String get nutrientOmega3 => 'Ácidos graxos ômega-3';

  @override
  String get nutrientOmega6 => 'Ácidos graxos ômega-6';

  @override
  String get nutrientPralScore => 'Pontuação PRAL';

  @override
  String get nutrientTransFat => 'Gorduras trans';

  @override
  String get nutrientSolubleFiber => 'Fibra solúvel';

  @override
  String get nutrientInsolubleFiber => 'Fibra insolúvel';

  @override
  String get nutrientPhosphorus => 'Fósforo';

  @override
  String get nutrientSodium => 'Sódio';

  @override
  String get nutrientZinc => 'Zinco';

  @override
  String get nutrientCopper => 'Cobre';

  @override
  String get nutrientManganese => 'Manganês';

  @override
  String get nutrientSelenium => 'Selênio';

  @override
  String get nutrientFluoride => 'Fluoreto';

  @override
  String get nutrientMolybdenum => 'Molibdênio';

  @override
  String get nutrientChloride => 'Cloreto';
}
