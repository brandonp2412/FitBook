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
    return '$foodCount alimentos · $mealCount refeições';
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
    return '$foodCount alimentos · $mealCount refeições';
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
}
