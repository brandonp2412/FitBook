import 'package:fit_book/delete_records_button.dart';
import 'package:fit_book/export_data.dart';
import 'package:fit_book/import_data.dart';
import 'package:fit_book/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final _searchController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _fatController = TextEditingController();
  final _carbsController = TextEditingController();
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
  }

  @override
  Widget build(BuildContext context) {
    _settings = context.watch<SettingsState>();
    List<SettingsLine> children = [
      SettingsLine(
        key: 'theme',
        widget: Padding(
          padding: const EdgeInsets.all(8.0),
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
        key: 'show remaining',
        widget: ListTile(
          title: const Text('Show remaining'),
          onTap: () => _settings.setShowRemaining(!_settings.showRemaining),
          trailing: Switch(
            value: _settings.showRemaining,
            onChanged: (value) => _settings.setShowRemaining(value),
          ),
        ),
      ),
      SettingsLine(
        key: 'favorite new foods',
        widget: ListTile(
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
          title: const Text('System color scheme'),
          onTap: () => _settings.setSystem(!_settings.systemColors),
          trailing: Switch(
            value: _settings.systemColors,
            onChanged: (value) => _settings.setSystem(value),
          ),
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
