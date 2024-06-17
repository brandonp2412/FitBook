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
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as p;

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
  final _searchController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _fatController = TextEditingController();
  final _carbsController = TextEditingController();
  final _targetWeightController = TextEditingController();
  late SettingsState _settings;

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
    'EEE h:mm a',
    'yyyy-MM-dd',
    'yyyy-MM-dd h:mm a',
    'yyyy.MM.dd',
  ];

  @override
  void initState() {
    super.initState();
    _settings = context.read<SettingsState>();
    _caloriesController.text = _settings.dailyCalories?.toString() ?? "";
    _proteinController.text = _settings.dailyProtein?.toString() ?? "";
    _fatController.text = _settings.dailyFat?.toString() ?? "";
    _carbsController.text = _settings.dailyCarbs?.toString() ?? "";
    _targetWeightController.text = _settings.targetWeight?.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    _settings = context.watch<SettingsState>();
    List<SettingsLine> children = [
      SettingsLine(
        key: 'theme',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: DropdownButtonFormField(
            value: _settings.themeMode,
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
            onChanged: (value) => _settings.setTheme(value!),
          ),
        ),
      ),
      SettingsLine(
        key: 'long date format',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField<String>(
            value: _settings.longDateFormat,
            items: longFormats.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              _settings.setLong(newValue!);
            },
            decoration: InputDecoration(
              labelText:
                  'Long date format (${DateFormat(_settings.longDateFormat).format(DateTime.now())})',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'short date format',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField<String>(
            value: _settings.shortDateFormat,
            items: shortFormats.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              _settings.setShort(newValue!);
            },
            decoration: InputDecoration(
              labelText:
                  'Short date format (${DateFormat(_settings.shortDateFormat).format(DateTime.now())})',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'entry unit',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField<String>(
            value: _settings.entryUnit,
            decoration: const InputDecoration(labelText: 'Diary unit'),
            items: units.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              _settings.setEntryUnit(newValue!);
            },
          ),
        ),
      ),
      SettingsLine(
        key: 'food unit',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField<String>(
            value: _settings.foodUnit,
            decoration: const InputDecoration(labelText: 'Food unit'),
            items: units.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              _settings.setFoodUnit(newValue!);
            },
          ),
        ),
      ),
      SettingsLine(
        key: 'diary summary',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButtonFormField(
            value: _settings.diarySummary,
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
            onChanged: (value) => _settings.setDiarySummary(value!),
          ),
        ),
      ),
      SettingsLine(
        key: 'daily calories',
        widget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: _caloriesController,
            onChanged: (newValue) {
              _settings.setDailyCalories(int.tryParse(newValue));
            },
            onTap: () => _caloriesController.selection = TextSelection(
              baseOffset: 0,
              extentOffset: _caloriesController.text.length,
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
            controller: _proteinController,
            onChanged: (newValue) {
              _settings.setDailyProtein(int.tryParse(newValue));
            },
            onTap: () => selectAll(_proteinController),
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
            controller: _fatController,
            onChanged: (newValue) {
              _settings.setDailyFat(int.tryParse(newValue));
            },
            onTap: () => selectAll(_fatController),
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
            controller: _carbsController,
            onChanged: (newValue) {
              _settings.setDailyCarbs(int.tryParse(newValue));
            },
            onTap: () => selectAll(_carbsController),
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
            controller: _targetWeightController,
            onChanged: (newValue) {
              _settings.setTargetWeight(double.tryParse(newValue));
            },
            onTap: () => selectAll(_targetWeightController),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Target weight',
            ),
          ),
        ),
      ),
      SettingsLine(
        key: 'notifications',
        widget: ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notifications'),
          onTap: () => _settings.setNotifications(!_settings.notifications),
          trailing: Switch(
            value: _settings.notifications,
            onChanged: (value) => _settings.setNotifications(value),
          ),
        ),
      ),
      SettingsLine(
        key: 'select entry on submit',
        widget: ListTile(
          leading: const Icon(Icons.check),
          title: const Text('Select entry on submit'),
          onTap: () =>
              _settings.setSelectEntryOnSubmit(!_settings.selectEntryOnSubmit),
          trailing: Switch(
            value: _settings.selectEntryOnSubmit,
            onChanged: (value) => _settings.setSelectEntryOnSubmit(value),
          ),
        ),
      ),
      SettingsLine(
        key: 'favorite new foods',
        widget: ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text('Favorite new foods'),
          onTap: () => _settings.setFavoriteNew(!_settings.favoriteNew),
          trailing: Switch(
            value: _settings.favoriteNew,
            onChanged: (value) => _settings.setFavoriteNew(value),
          ),
        ),
      ),
      SettingsLine(
        key: 'system color',
        widget: ListTile(
          leading: const Icon(Icons.color_lens_outlined),
          title: const Text('System color scheme'),
          onTap: () => _settings.setSystem(!_settings.systemColors),
          trailing: Switch(
            value: _settings.systemColors,
            onChanged: (value) => _settings.setSystem(value),
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
                  controller: _searchController,
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  onChanged: (_) {
                    setState(() {});
                  },
                  leading: const Icon(Icons.search),
                ),
              ] +
              children
                  .where(
                    (element) => element.key
                        .contains(_searchController.text.toLowerCase()),
                  )
                  .map((e) => e.widget)
                  .toList(),
        ),
      ),
    );
  }
}
