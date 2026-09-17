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
}
