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
}
