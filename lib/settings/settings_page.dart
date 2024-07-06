import 'dart:io';

import 'package:fit_book/about_page.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/settings/delete_records_button.dart';
import 'package:fit_book/settings/export_data.dart';
import 'package:fit_book/settings/import_data.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
  final searchController = TextEditingController();
  final caloriesController = TextEditingController();
  final proteinController = TextEditingController();
  final fatController = TextEditingController();
  final carbsController = TextEditingController();
  final targetWeightController = TextEditingController();
  late SettingsState settings;

  final List<String> shortFormats = [
    'd/M/yy',
    'M/d/yy',
    'd-M-yy',
    'M-d-yy',
    'd.M.yy',
    'M.d.yy',
  ];

  final List<String> longFormats = [
    'dd/MM/yy',
    'dd/MM/yy h:mm a',
    'dd/MM/yy H:mm',
    'EEE h:mm a',
    'yyyy-MM-dd',
    'yyyy-MM-dd h:mm a',
    'yyyy-MM-dd H:mm',
    'yyyy.MM.dd',
    'yyyy.MM.dd h:mm a',
    'yyyy.MM.dd H:mm',
  ];

  final now = DateTime.now();
  String get _longExample => DateFormat(settings.longDateFormat)
      .format(DateTime(now.year, now.month, now.day, 13, 54));
  String get _shortExample => DateFormat(settings.shortDateFormat)
      .format(DateTime(now.year, now.month, now.day, 13, 54));

  @override
  void initState() {
    super.initState();
    settings = context.read<SettingsState>();
    caloriesController.text = settings.dailyCalories?.toString() ?? "";
    proteinController.text = settings.dailyProtein?.toString() ?? "";
    fatController.text = settings.dailyFat?.toString() ?? "";
    carbsController.text = settings.dailyCarbs?.toString() ?? "";
    targetWeightController.text = settings.targetWeight?.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    settings = context.watch<SettingsState>();
    List<SettingsLine> children = [
      SettingsLine(
        key: 'theme',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField(
            value: settings.themeMode,
            decoration: const InputDecoration(
              labelStyle: TextStyle(),
              labelText: 'Theme',
            ),
            items: const [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text("System"),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text("Dark"),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text("Light"),
              ),
            ],
            onChanged: (value) => settings.setTheme(value!),
          ),
        ),
      ),
      SettingsLine(
        key: 'long date format',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField<String>(
            value: settings.longDateFormat,
            items: longFormats.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              settings.setLong(newValue!);
            },
            decoration: InputDecoration(
              labelText: 'Long date format ($_longExample)',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'short date format',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField<String>(
            value: settings.shortDateFormat,
            items: shortFormats.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              settings.setShort(newValue!);
            },
            decoration: InputDecoration(
              labelText: 'Short date format ($_shortExample)',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'entry unit',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField<String>(
            value: settings.entryUnit,
            decoration: const InputDecoration(labelText: 'Diary unit'),
            items: units.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              settings.setEntryUnit(newValue!);
            },
          ),
        ),
      ),
      SettingsLine(
        key: 'food unit',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField<String>(
            value: settings.foodUnit,
            decoration: const InputDecoration(labelText: 'Food unit'),
            items: units.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              settings.setFoodUnit(newValue!);
            },
          ),
        ),
      ),
      SettingsLine(
        key: 'diary summary',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField(
            value: settings.diarySummary,
            decoration: const InputDecoration(
              labelStyle: TextStyle(),
              labelText: 'Diary summary',
            ),
            items: const [
              DropdownMenuItem(
                value: DiarySummary.division,
                child: Text("Division - current / total"),
              ),
              DropdownMenuItem(
                value: DiarySummary.remaining,
                child: Text("Remaining"),
              ),
              DropdownMenuItem(
                value: DiarySummary.both,
                child: Text("Both - remaining (total)"),
              ),
              DropdownMenuItem(
                value: DiarySummary.none,
                child: Text("None"),
              ),
            ],
            onChanged: (value) => settings.setDiarySummary(value!),
          ),
        ),
      ),
      SettingsLine(
        key: 'daily calories',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: caloriesController,
            onChanged: (newValue) {
              settings.setDailyCalories(int.tryParse(newValue));
            },
            onTap: () => caloriesController.selection = TextSelection(
              baseOffset: 0,
              extentOffset: caloriesController.text.length,
            ),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Daily calories',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'daily protein',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: proteinController,
            onChanged: (newValue) {
              settings.setDailyProtein(int.tryParse(newValue));
            },
            onTap: () => selectAll(proteinController),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Daily protein',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'daily fat',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: fatController,
            onChanged: (newValue) {
              settings.setDailyFat(int.tryParse(newValue));
            },
            onTap: () => selectAll(fatController),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Daily fat',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'daily carbs',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: carbsController,
            onChanged: (newValue) {
              settings.setDailyCarbs(int.tryParse(newValue));
            },
            onTap: () => selectAll(carbsController),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Daily carbs',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'target weight',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: targetWeightController,
            onChanged: (newValue) {
              settings.setTargetWeight(double.tryParse(newValue));
            },
            onTap: () => selectAll(targetWeightController),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Target weight',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'images',
        widget: ListTile(
          leading: const Icon(Icons.image),
          title: const Text('Show images'),
          onTap: () => settings.setShowImages(!settings.showImages),
          trailing: Switch(
            value: settings.showImages,
            onChanged: (value) => settings.setShowImages(value),
          ),
        ),
      ),
      SettingsLine(
        key: 'favorite new foods',
        widget: ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text('Favorite new foods'),
          onTap: () => settings.setFavoriteNew(!settings.favoriteNew),
          trailing: Switch(
            value: settings.favoriteNew,
            onChanged: (value) => settings.setFavoriteNew(value),
          ),
        ),
      ),
      SettingsLine(
        key: 'select entry on submit',
        widget: ListTile(
          leading: const Icon(Icons.check),
          title: const Text('Select entry on submit'),
          onTap: () =>
              settings.setSelectEntryOnSubmit(!settings.selectEntryOnSubmit),
          trailing: Switch(
            value: settings.selectEntryOnSubmit,
            onChanged: (value) => settings.setSelectEntryOnSubmit(value),
          ),
        ),
      ),
      SettingsLine(
        key: 'notifications',
        widget: ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notifications'),
          onTap: () => settings.setNotifications(!settings.notifications),
          trailing: Switch(
            value: settings.notifications,
            onChanged: (value) => settings.setNotifications(value),
          ),
        ),
      ),
      SettingsLine(
        key: 'system color',
        widget: ListTile(
          leading: const Icon(Icons.color_lens_outlined),
          title: const Text('System color scheme'),
          onTap: () => settings.setSystem(!settings.systemColors),
          trailing: Switch(
            value: settings.systemColors,
            onChanged: (value) => settings.setSystem(value),
          ),
        ),
      ),
      SettingsLine(
        key: 'share database',
        widget: TextButton.icon(
          onPressed: () async {
            final dbFolder = await getApplicationDocumentsDirectory();
            final dbPath = p.join(dbFolder.path, 'fitbook.sqlite');
            await Share.shareXFiles([XFile(dbPath)]);
          },
          label: const Text("Share database"),
          icon: const Icon(Icons.share),
        ),
      ),
      SettingsLine(
        key: 'export data',
        widget: const ExportData(),
      ),
      SettingsLine(
        key: 'import data',
        widget: ImportData(
          pageContext: context,
        ),
      ),
      SettingsLine(
        key: 'delete data',
        widget: DeleteRecordsButton(
          pageContext: context,
        ),
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
                  controller: searchController,
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  onChanged: (_) {
                    setState(() {});
                  },
                  leading: const Icon(Icons.search),
                ),
                const SizedBox(height: 8.0),
              ] +
              children
                  .where(
                    (element) => element.key
                        .contains(searchController.text.toLowerCase()),
                  )
                  .map((e) => e.widget)
                  .toList(),
        ),
      ),
    );
  }
}
