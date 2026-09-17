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

  @override
  String get delete => 'Supprimer';

  @override
  String get confirmDelete => 'Confirmer la suppression';

  @override
  String confirmDeleteRecords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Voulez-vous vraiment supprimer $count éléments ? Cette action est irréversible.',
      one:
          'Voulez-vous vraiment supprimer 1 élément ? Cette action est irréversible.',
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get search => 'Rechercher...';

  @override
  String get clear => 'Effacer';

  @override
  String get showMenu => 'Afficher le menu';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String get edit => 'Modifier';

  @override
  String get favorite => 'Favori';

  @override
  String get atLeastOneTab => 'Vous devez conserver au moins un onglet';

  @override
  String get scrollableTabs => 'Onglets défilants';

  @override
  String get save => 'Enregistrer';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeLight => 'Clair';

  @override
  String get pureBlackAmoled => 'Noir pur (AMOLED)';

  @override
  String get pureBlackAmoledTooltip =>
      'Utiliser du noir pur sur les écrans AMOLED';

  @override
  String get systemColorScheme => 'Palette de couleurs du système';

  @override
  String get systemColorSchemeTooltip =>
      'Utiliser la couleur principale de votre appareil dans l’application';

  @override
  String get showImages => 'Afficher les images';

  @override
  String get showImagesTooltip =>
      'Choisir et afficher des images dans le journal et les pages d’aliments';

  @override
  String get curveLineGraphs => 'Courbes lissées';

  @override
  String get curveLineGraphsTooltip =>
      'Utiliser des courbes lisses sur la page des graphiques';

  @override
  String get weightStatCards => 'Cartes de statistiques de poids';

  @override
  String get weightStatCardsTooltip =>
      'Afficher les entrées de poids sous forme de grille de cartes plutôt que dans la liste par défaut';

  @override
  String get graphsStartAtZero => 'Graphiques à partir de zéro';

  @override
  String get graphsStartAtZeroTooltip =>
      'Toujours faire commencer l’axe Y du graphique à zéro';

  @override
  String get navigationAnimation => 'Animation de navigation';

  @override
  String get animationFade => 'Fondu';

  @override
  String get animationZoom => 'Zoom';

  @override
  String get animationSlide => 'Glissement';

  @override
  String get animationRise => 'Montée';

  @override
  String get animationNone => 'Aucune';

  @override
  String longDateFormat(String example) {
    return 'Format de date long ($example)';
  }

  @override
  String shortDateFormat(String example) {
    return 'Format de date court ($example)';
  }

  @override
  String get diarySettings => 'Paramètres du journal';

  @override
  String get diaryUnit => 'Unité du journal';

  @override
  String get diarySummary => 'Résumé du journal';

  @override
  String get diarySummaryDivision => 'Division - actuel / total';

  @override
  String get diarySummaryRemaining => 'Restant';

  @override
  String get diarySummaryBoth => 'Les deux - restant (total)';

  @override
  String get diarySummaryNone => 'Aucun';

  @override
  String get dailyCaloriesKcal => 'Calories quotidiennes (kcal)';

  @override
  String get dailyProteinG => 'Protéines quotidiennes (g)';

  @override
  String get dailyFatG => 'Lipides quotidiens (g)';

  @override
  String get dailyCarbsG => 'Glucides quotidiens (g)';

  @override
  String get dailyFiberG => 'Fibres quotidiennes (g)';

  @override
  String get automaticDailies => 'Objectifs quotidiens automatiques';

  @override
  String get automaticDailiesTooltip =>
      'Calculer automatiquement les calories, protéines, lipides et glucides quotidiens recommandés à partir de votre poids';

  @override
  String get selectNameOnSubmit => 'Sélectionner le nom à l’enregistrement';

  @override
  String get reminders => 'Rappels';

  @override
  String get foodSettings => 'Paramètres des aliments';

  @override
  String get foodUnit => 'Unité des aliments';

  @override
  String get fields => 'Champs';

  @override
  String get favoriteNewFoods => 'Ajouter les nouveaux aliments aux favoris';

  @override
  String get pickFields => 'Choisir les champs';

  @override
  String get all => 'Tous';

  @override
  String get onlySelected => 'Sélection uniquement';

  @override
  String get weightSettings => 'Paramètres du poids';

  @override
  String get targetWeight => 'Poids cible';

  @override
  String get positiveReinforcement => 'Renforcement positif';

  @override
  String get positiveReinforcementPreview =>
      'Les messages encourageants s’afficheront ainsi !';

  @override
  String get dataSettings => 'Paramètres des données';

  @override
  String get automaticBackup => 'Sauvegarde automatique';

  @override
  String get shareDatabase => 'Partager la base de données';

  @override
  String get openNotification => 'Ouvrir la notification';

  @override
  String get automaticBackupsEnabled => 'Sauvegardes automatiques activées';

  @override
  String get automaticBackupBody =>
      'FitBook sauvegardera automatiquement vos données et vos images dans le dossier sélectionné chaque jour.';

  @override
  String get backupSettings => 'Paramètres de sauvegarde';

  @override
  String get backupSettingsChannelDescription =>
      'Notifications concernant les sauvegardes automatiques';

  @override
  String get openFoodFacts => 'Open Food Facts';

  @override
  String get username => 'Nom d’utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get close => 'Fermer';

  @override
  String get loggedIn => 'Connecté';

  @override
  String get about => 'À propos';

  @override
  String get version => 'Version';

  @override
  String get whatsNew => 'Nouveautés';

  @override
  String get author => 'Auteur';

  @override
  String get license => 'Licence';

  @override
  String get donate => 'Faire un don';

  @override
  String get supportProject => 'Aidez à soutenir ce projet';

  @override
  String get leaveReview => 'Laisser un avis';

  @override
  String get rateOnPlayStore => 'Évaluer FitBook sur le Play Store';

  @override
  String get sourceCode => 'Code source';

  @override
  String get foods => 'Aliments';

  @override
  String get backup => 'Sauvegarde';

  @override
  String get exportData => 'Exporter les données';

  @override
  String get importData => 'Importer les données';

  @override
  String get failedImportData => 'Échec de l’importation des données';

  @override
  String get copyError => 'Copier l’erreur';

  @override
  String get deleteRecords => 'Supprimer des données';

  @override
  String get unusedFood => 'Aliments inutilisés';

  @override
  String get database => 'Base de données';

  @override
  String get deleteAllWeightsConfirm =>
      'Voulez-vous vraiment supprimer toutes les entrées de poids ? Cette action est irréversible.';

  @override
  String get deleteDatabaseConfirm =>
      'Voulez-vous vraiment supprimer votre base de données ? Cette action est irréversible et supprimera toutes vos données.';

  @override
  String get deleteFoodsAndDiaryConfirm =>
      'Voulez-vous vraiment supprimer tous les aliments et toutes les entrées du journal ? Cette action est irréversible.';

  @override
  String deleteUnusedFoodsConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Voulez-vous vraiment supprimer $count aliments inutilisés ? Cette action est irréversible.',
      one:
          'Voulez-vous vraiment supprimer 1 aliment inutilisé ? Cette action est irréversible.',
    );
    return '$_temp0';
  }

  @override
  String get deleteAllDiaryConfirm =>
      'Voulez-vous vraiment supprimer toutes les entrées du journal ? Cette action est irréversible.';

  @override
  String get ok => 'OK';

  @override
  String get replaceImage => 'Remplacer l’image';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get deleteImage => 'Supprimer l’image';

  @override
  String get filters => 'Filtres';

  @override
  String get foodGroup => 'Groupe d’aliments';

  @override
  String get exampleFruit => 'Fruit';

  @override
  String clearFiltersCount(int count) {
    return 'Effacer ($count)';
  }

  @override
  String get done => 'Terminé';

  @override
  String get showFilters => 'Afficher les filtres';

  @override
  String get repeatEntry => 'Répéter l’entrée';

  @override
  String get timeOfDay => 'Heure de la journée';

  @override
  String get everyDay => 'Tous les jours';

  @override
  String get repeatEveryDayForYear =>
      'Créer cette entrée chaque jour pendant un an';

  @override
  String get repeatOn => 'Répéter le';

  @override
  String get weekdayMon => 'Lun';

  @override
  String get weekdayTue => 'Mar';

  @override
  String get weekdayWed => 'Mer';

  @override
  String get weekdayThu => 'Jeu';

  @override
  String get weekdayFri => 'Ven';

  @override
  String get weekdaySat => 'Sam';

  @override
  String get weekdaySun => 'Dim';

  @override
  String get schedule => 'Programmer';

  @override
  String get enterValidNutritionValues =>
      'Saisissez des valeurs nutritionnelles valides';

  @override
  String get quickAddTitle => 'Ajout rapide';

  @override
  String get kilojoules => 'Kilojoules';

  @override
  String get createdDate => 'Date de création';

  @override
  String get failedMigrations => 'Échec des migrations';

  @override
  String get failedMigrationsDescription =>
      'Un problème est survenu lors de la création ou de la mise à niveau de la base de données. En général, vous pouvez le corriger en supprimant puis en recréant vos enregistrements.';

  @override
  String get errorMessage => 'Message d’erreur :';

  @override
  String get createIssue => 'Créer un ticket';

  @override
  String get cameraPermissionRequired =>
      'L’autorisation d’utiliser la caméra est requise pour scanner.';

  @override
  String get scanFoodBarcode => 'Scanner le code-barres d’un aliment';

  @override
  String get holdBarcodeInFrame =>
      'Maintenez le code-barres à l’intérieur du cadre';

  @override
  String get pinchToZoom => 'Pincez pour zoomer';

  @override
  String get cameraStartFailed => 'Impossible de démarrer la caméra';
}
