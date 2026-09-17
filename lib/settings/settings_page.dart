import 'package:fit_book/about_page.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/settings/appearance_settings.dart';
import 'package:fit_book/settings/data_settings.dart';
import 'package:fit_book/settings/diary_settings.dart';
import 'package:fit_book/settings/food_settings.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/settings/tab_settings.dart';
import 'package:fit_book/settings/weight_settings.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsLine {
  final String key;
  final Widget widget;

  SettingsLine({required this.key, required this.widget});
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final search = TextEditingController();
  final calories = TextEditingController();
  final protein = TextEditingController();
  final fat = TextEditingController();
  final carb = TextEditingController();
  final fiber = TextEditingController();
  final targetWeight = TextEditingController();
  late Setting settings;
  bool _localizedInputsInitialized = false;

  @override
  void initState() {
    super.initState();
    settings = context.read<SettingsState>().value;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_localizedInputsInitialized) return;
    _localizedInputsInitialized = true;
    calories.text = settings.dailyCalories == null
        ? ''
        : formatDisplayNumber(
            context,
            settings.dailyCalories!,
            maximumFractionDigits: 0,
          );
    protein.text = settings.dailyProtein == null
        ? ''
        : formatDisplayNumber(
            context,
            settings.dailyProtein!,
            maximumFractionDigits: 0,
          );
    fat.text = settings.dailyFat == null
        ? ''
        : formatDisplayNumber(
            context,
            settings.dailyFat!,
            maximumFractionDigits: 0,
          );
    carb.text = settings.dailyCarb == null
        ? ''
        : formatDisplayNumber(
            context,
            settings.dailyCarb!,
            maximumFractionDigits: 0,
          );
    fiber.text = settings.dailyFiber == null
        ? ''
        : formatDisplayNumber(
            context,
            settings.dailyFiber!,
            maximumFractionDigits: 0,
          );
    targetWeight.text = settings.targetWeight == null
        ? ''
        : formatDisplayNumber(context, settings.targetWeight!);
  }

  @override
  Widget build(BuildContext context) {
    final settingsState = context.watch<SettingsState>();
    final l10n = context.l10n;

    List<Widget> filtered = [];
    if (search.text.isNotEmpty)
      filtered = [
        ...getAppearanceSettings(
          context,
          search.text.toLowerCase(),
          settingsState,
        ),
        ...getDiarySettings(
          context: context,
          calories: calories,
          carb: carb,
          fat: fat,
          protein: protein,
          fiber: fiber,
          settings: settingsState,
          term: search.text.toLowerCase(),
        ),
        ...getWeightSettings(
          context: context,
          settings: settingsState,
          term: search.text.toLowerCase(),
          targetWeight: targetWeight,
        ),
        ...getFoodSettings(
          settings: settingsState,
          term: search.text.toLowerCase(),
          context: context,
        ),
        ...getDataSettings(
          context: context,
          settings: settingsState,
          term: search.text.toLowerCase(),
        ),
      ];

    final categories = <_SettingsCategory>[
      _SettingsCategory(
        icon: Icons.color_lens_outlined,
        title: l10n.appearance,
        subtitle: l10n.appearanceSubtitle,
        page: const AppearanceSettings(),
      ),
      _SettingsCategory(
        icon: Icons.date_range,
        title: l10n.diary,
        subtitle: l10n.diarySubtitle,
        page: const DiarySettings(),
      ),
      _SettingsCategory(
        icon: Icons.restaurant,
        title: l10n.food,
        subtitle: l10n.foodSubtitle,
        page: const FoodSettings(),
      ),
      _SettingsCategory(
        icon: Icons.scale,
        title: l10n.weight,
        subtitle: l10n.weightSubtitle,
        page: const WeightSettings(),
      ),
      _SettingsCategory(
        icon: Icons.tab_sharp,
        title: l10n.tabs,
        subtitle: l10n.tabsSubtitle,
        page: const TabSettings(),
      ),
      _SettingsCategory(
        icon: Icons.storage,
        title: l10n.data,
        subtitle: l10n.dataSubtitle,
        page: const DataSettings(),
      ),
    ];

    Widget categoryTile(_SettingsCategory category, {required bool wide}) {
      final tile = ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: wide ? 20 : 16,
          vertical: wide ? 12 : 4,
        ),
        leading: Icon(category.icon),
        title: Text(
          category.title,
          style: wide
              ? Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700)
              : null,
        ),
        subtitle: Text(category.subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => category.page),
        ),
      );
      if (!wide) return tile;
      return Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: tile,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
        actions: [
          if (defaultTargetPlatform != TargetPlatform.iOS &&
              defaultTargetPlatform != TargetPlatform.macOS)
            IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              ),
              icon: const Icon(Icons.info_outline),
            ),
        ],
      ),
      body: AdaptivePageBody(
        maxWidth: 1100,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 760;
              return ListView(
                children: <Widget>[
                  SearchBar(
                    hintText: l10n.searchSettings,
                    controller: search,
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    onChanged: (_) => setState(() {}),
                    leading: const Icon(Icons.search),
                  ),
                  const SizedBox(height: 20),
                  if (search.text.isNotEmpty) ...filtered,
                  if (search.text.isEmpty && wide)
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 3.2,
                      children: categories
                          .map((category) => categoryTile(category, wide: true))
                          .toList(),
                    ),
                  if (search.text.isEmpty && !wide)
                    ...categories.map(
                      (category) => categoryTile(category, wide: false),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SettingsCategory {
  const _SettingsCategory({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.page,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget page;
}
