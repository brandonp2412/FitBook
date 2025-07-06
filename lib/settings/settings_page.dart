import 'dart:io';

import 'package:fit_book/about_page.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/settings/appearance_settings.dart';
import 'package:fit_book/settings/data_settings.dart';
import 'package:fit_book/settings/diary_settings.dart';
import 'package:fit_book/settings/food_settings.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/settings/tab_settings.dart';
import 'package:fit_book/settings/weight_settings.dart';
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
  createState() => _SettingsPageState();
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          if (!Platform.isIOS && !Platform.isMacOS)
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SearchBar(
              hintText: "Search...",
              controller: search,
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: (_) {
                setState(() {});
              },
              leading: const Icon(Icons.search),
            ),
            const SizedBox(height: 8.0),
            if (search.text.isNotEmpty) ...filtered,
            if (search.text.isEmpty) ...[
              ListTile(
                leading: const Icon(Icons.color_lens_outlined),
                title: const Text('Appearance'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AppearanceSettings(),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.storage),
                title: const Text('Data'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DataSettings(),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.date_range),
                title: const Text('Diary'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DiarySettings(),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.restaurant),
                title: const Text('Food'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FoodSettings(),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.tab_sharp),
                title: const Text('Tabs'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TabSettings(),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.scale),
                title: const Text('Weight'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WeightSettings(),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
