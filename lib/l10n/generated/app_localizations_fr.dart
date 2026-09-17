// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'FitBook';

  @override
  String get navDiary => 'Journal';

  @override
  String get navGraph => 'Graphique';

  @override
  String get navFood => 'Aliments';

  @override
  String get navWeight => 'Poids';

  @override
  String get navError => 'Erreur';

  @override
  String get settings => 'Paramètres';

  @override
  String get invalidTabSettings => 'Configuration des onglets non valide.';

  @override
  String newVersion(String version) {
    return 'Nouvelle version $version';
  }

  @override
  String get changes => 'Nouveautés';

  @override
  String get searchSettings => 'Rechercher dans les paramètres...';

  @override
  String get appearance => 'Apparence';

  @override
  String get appearanceSubtitle =>
      'Thème, couleurs et affichage des graphiques';

  @override
  String get diary => 'Journal';

  @override
  String get diarySubtitle => 'Objectifs quotidiens, résumés et suivi';

  @override
  String get food => 'Aliments';

  @override
  String get foodSubtitle => 'Unités, champs et valeurs par défaut';

  @override
  String get weight => 'Poids';

  @override
  String get weightSubtitle => 'Unités, objectifs et affichage du poids';

  @override
  String get tabs => 'Onglets';

  @override
  String get tabsSubtitle => 'Onglets de navigation et ordre';

  @override
  String get data => 'Données';

  @override
  String get dataSubtitle => 'Importation, exportation et données locales';

  @override
  String get todayProgress => 'Progression du jour';

  @override
  String get latestDay => 'Dernier jour';

  @override
  String loggedEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entrées enregistrées',
      one: '1 entrée enregistrée',
      zero: 'Aucune entrée enregistrée',
    );
    return '$_temp0';
  }

  @override
  String get calories => 'Calories';

  @override
  String get protein => 'Protéines';

  @override
  String get carbs => 'Glucides';

  @override
  String get fat => 'Lipides';

  @override
  String get addDiaryEntry => 'Ajouter une entrée au journal';

  @override
  String get noEntriesToday => 'Aucune entrée aujourd’hui.';

  @override
  String addSearchToDiary(String search) {
    return 'Ajouter \"$search\" au journal';
  }

  @override
  String get tapStartLoggingFood =>
      'Touchez pour commencer à enregistrer des aliments.';

  @override
  String get noMatchingDiaryEntriesTapCreate =>
      'Aucune entrée correspondante. Touchez pour créer cet aliment et l’enregistrer.';

  @override
  String get add => 'Ajouter';

  @override
  String get quickAdd => 'Ajout rapide';

  @override
  String get scanBarcode => 'Scanner le code-barres';

  @override
  String get foodLibrary => 'Bibliothèque d’aliments';

  @override
  String foodLibraryCounts(int foodCount, int mealCount) {
    return '$foodCount aliments · $mealCount repas';
  }

  @override
  String get recentlyUsed => 'Utilisés récemment';

  @override
  String get quickActions => 'Actions rapides';

  @override
  String get addFood => 'Ajouter un aliment';

  @override
  String get createMeal => 'Créer un repas';

  @override
  String get noFoodYet => 'Aucun aliment pour le moment';

  @override
  String get noMatchingFood => 'Aucun aliment correspondant';

  @override
  String get addFirstFoodOrMeal =>
      'Ajoutez votre premier aliment ou repas pour commencer à constituer votre bibliothèque.';

  @override
  String noFoodSearchMatches(String search) {
    return 'Aucun résultat pour “$search”. Effacez la recherche pour tout afficher de nouveau.';
  }

  @override
  String get clearSearch => 'Effacer la recherche';

  @override
  String get addMeal => 'Ajouter un repas';

  @override
  String get noWeightsYet => 'Aucune mesure de poids pour le moment';

  @override
  String get noMatchingWeights => 'Aucune mesure correspondante';

  @override
  String get logFirstWeight =>
      'Enregistrez votre premier poids pour commencer à suivre la tendance.';

  @override
  String noWeightSearchMatches(String search) {
    return 'Aucun résultat pour “$search”. Effacez la recherche pour voir toutes les entrées.';
  }

  @override
  String get logWeight => 'Enregistrer le poids';

  @override
  String get weightTrend => 'Évolution du poids';

  @override
  String get weightTrendSubtitle => 'Mesures récentes et tendance générale';

  @override
  String get bodyWeight => 'Poids corporel';

  @override
  String get options => 'Options';

  @override
  String get day => 'Jour';

  @override
  String get week => 'Semaine';

  @override
  String get month => 'Mois';

  @override
  String get year => 'Année';

  @override
  String get dateRange => 'Plage de dates';

  @override
  String get startDate => 'Date de début';

  @override
  String get stopDate => 'Date de fin';

  @override
  String get dataPoints => 'Points de données';

  @override
  String get customizeFields => 'Personnaliser les champs';

  @override
  String get language => 'Langue';

  @override
  String get languageSubtitle => 'Choisissez la langue utilisée par FitBook';

  @override
  String get languageSystem => 'Système';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get languageSpanish => 'Espagnol';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageGerman => 'Allemand';

  @override
  String get languageItalian => 'Italien';

  @override
  String get languagePortugueseBrazil => 'Portugais (Brésil)';

  @override
  String get languageDutch => 'Néerlandais';

  @override
  String get languagePolish => 'Polonais';

  @override
  String get languageJapanese => 'Japonais';

  @override
  String get languageKorean => 'Coréen';

  @override
  String get languageChineseSimplified => 'Chinois (simplifié)';

  @override
  String get appearanceSettings => 'Paramètres d’apparence';
}
