import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

List<Widget> getAppearanceSettings(String term, SettingsState settings) {
  final now = DateTime.now();
  String longExample = DateFormat(settings.value.longDateFormat)
      .format(DateTime(now.year, now.month, now.day, 13, 54));
  String shortExample = DateFormat(settings.value.shortDateFormat)
      .format(DateTime(now.year, now.month, now.day, 13, 54));

  return [
    if ('theme'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButtonFormField<ThemeMode>(
          initialValue: ThemeMode.values
              .byName(settings.value.themeMode.replaceFirst('ThemeMode.', '')),
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
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(
                  themeMode: Value(value.toString()),
                ),
              ),
        ),
      ),
    if ('long date format'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButtonFormField<String>(
          initialValue: settings.value.longDateFormat,
          items: longFormats.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(longDateFormat: Value(value!)),
              ),
          decoration: InputDecoration(
            labelText: 'Long date format ($longExample)',
          ),
        ),
      ),
    if ('short date format'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButtonFormField<String>(
          initialValue: settings.value.shortDateFormat,
          items: shortFormats.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(shortDateFormat: Value(value!)),
              ),
          decoration: InputDecoration(
            labelText: 'Short date format ($shortExample)',
          ),
        ),
      ),
    if ('system color scheme'.contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Tooltip(
          message: 'Use the primary color of your device for the app',
          child: ListTile(
            title: const Text('System color scheme'),
            leading: settings.value.systemColors
                ? const Icon(Icons.color_lens)
                : const Icon(Icons.color_lens_outlined),
            onTap: () => db.settings.update().write(
                  SettingsCompanion(
                    systemColors: Value(!settings.value.systemColors),
                  ),
                ),
            trailing: Switch(
              value: settings.value.systemColors,
              onChanged: (value) => db.settings.update().write(
                    SettingsCompanion(
                      systemColors: Value(value),
                    ),
                  ),
            ),
          ),
        ),
      ),
    if ('show images'.contains(term))
      Tooltip(
        message: 'Pick/display images on the diary and foods page',
        child: ListTile(
          title: const Text('Show images'),
          leading: settings.value.showImages
              ? const Icon(Icons.image)
              : const Icon(Icons.image_outlined),
          onTap: () => db.settings.update().write(
                SettingsCompanion(
                  showImages: Value(!settings.value.showImages),
                ),
              ),
          trailing: Switch(
            value: settings.value.showImages,
            onChanged: (value) => db.settings.update().write(
                  SettingsCompanion(
                    showImages: Value(value),
                  ),
                ),
          ),
        ),
      ),
    if ('curve line graphs'.contains(term))
      Tooltip(
        message: 'Use wavy curves in the graphs page',
        child: ListTile(
          title: const Text('Curve line graphs'),
          leading: const Icon(Icons.insights),
          onTap: () => db.settings.update().write(
                SettingsCompanion(
                  curveLines: Value(!settings.value.curveLines),
                ),
              ),
          trailing: Switch(
            value: settings.value.curveLines,
            onChanged: (value) => db.settings.update().write(
                  SettingsCompanion(
                    curveLines: Value(value),
                  ),
                ),
          ),
        ),
      ),
    if ('compact diary'.contains(term))
      Tooltip(
        message: 'Use a compact list display for diary entries',
        child: ListTile(
          title: const Text('Compact diary display'),
          leading: settings.value.compactDiary
              ? const Icon(Icons.list)
              : const Icon(Icons.grid_view),
          onTap: () => db.settings.update().write(
                SettingsCompanion(
                  compactDiary: Value(!settings.value.compactDiary),
                ),
              ),
          trailing: Switch(
            value: settings.value.compactDiary,
            onChanged: (value) => db.settings.update().write(
                  SettingsCompanion(
                    compactDiary: Value(value),
                  ),
                ),
          ),
        ),
      ),
    if ('compact weights'.contains(term))
      Tooltip(
        message: 'Use a compact list display for weights',
        child: ListTile(
          title: const Text('Compact weights display'),
          leading: settings.value.compactWeights
              ? const Icon(Icons.list)
              : const Icon(Icons.grid_view),
          onTap: () => db.settings.update().write(
                SettingsCompanion(
                  compactWeights: Value(!settings.value.compactWeights),
                ),
              ),
          trailing: Switch(
            value: settings.value.compactWeights,
            onChanged: (value) => db.settings.update().write(
                  SettingsCompanion(
                    compactWeights: Value(value),
                  ),
                ),
          ),
        ),
      ),
  ];
}

class AppearanceSettings extends StatelessWidget {
  const AppearanceSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Appearance settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: getAppearanceSettings('', settings),
        ),
      ),
    );
  }
}
