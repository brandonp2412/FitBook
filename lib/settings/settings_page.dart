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

  @override
  void initState() {
    super.initState();
    settings = context.read<SettingsState>().value;
    calories.text = settings.dailyCalories?.toString() ?? "";
    protein.text = settings.dailyProtein?.toString() ?? "";
    fat.text = settings.dailyFat?.toString() ?? "";
    carb.text = settings.dailyCarb?.toString() ?? "";
    fiber.text = settings.dailyFiber?.toString() ?? "";
    targetWeight.text = settings.targetWeight?.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final settingsState = context.watch<SettingsState>();

    List<Widget> filtered = [];
    if (search.text.isNotEmpty)
      filtered = [
        ...getAppearanceSettings(search.text.toLowerCase(), settingsState),
        ...getDiarySettings(
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
      const _SettingsCategory(
        icon: Icons.color_lens_outlined,
        title: 'Appearance',
        subtitle: 'Theme, colors and graph display',
        page: AppearanceSettings(),
      ),
      const _SettingsCategory(
        icon: Icons.date_range,
        title: 'Diary',
        subtitle: 'Daily targets, summaries and logging',
        page: DiarySettings(),
      ),
      const _SettingsCategory(
        icon: Icons.restaurant,
        title: 'Food',
        subtitle: 'Food units, fields and defaults',
        page: FoodSettings(),
      ),
      const _SettingsCategory(
        icon: Icons.scale,
        title: 'Weight',
        subtitle: 'Weight units, goals and display',
        page: WeightSettings(),
      ),
      const _SettingsCategory(
        icon: Icons.tab_sharp,
        title: 'Tabs',
        subtitle: 'Navigation tabs and ordering',
        page: TabSettings(),
      ),
      const _SettingsCategory(
        icon: Icons.storage,
        title: 'Data',
        subtitle: 'Import, export and local data',
        page: DataSettings(),
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
        title: const Text('Settings'),
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
                    hintText: "Search settings...",
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
