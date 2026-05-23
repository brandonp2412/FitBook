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
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
        child: SegmentedButton<String>(
          segments: const [
            ButtonSegment(
              value: 'ThemeMode.system',
              label: Text('System'),
              icon: Icon(Icons.brightness_auto),
            ),
            ButtonSegment(
              value: 'ThemeMode.dark',
              label: Text('Dark'),
              icon: Icon(Icons.dark_mode),
            ),
            ButtonSegment(
              value: 'ThemeMode.light',
              label: Text('Light'),
              icon: Icon(Icons.light_mode),
            ),
          ],
          selected: {
            settings.value.themeMode == 'ThemeMode.amoled'
                ? 'ThemeMode.dark'
                : settings.value.themeMode,
          },
          onSelectionChanged: (selection) => db.settings.update().write(
                SettingsCompanion(themeMode: Value(selection.first)),
              ),
        ),
      ),
    if ('pure black amoled'.contains(term))
      Tooltip(
        message: 'Use pure black colors for AMOLED displays',
        child: ListTile(
          leading: const Icon(Icons.contrast),
          title: const Text('Pure black (AMOLED)'),
          onTap: () => db.settings.update().write(
                SettingsCompanion(
                  themeMode: Value(
                    settings.value.themeMode == 'ThemeMode.amoled'
                        ? 'ThemeMode.dark'
                        : 'ThemeMode.amoled',
                  ),
                ),
              ),
          trailing: Switch(
            value: settings.value.themeMode == 'ThemeMode.amoled',
            onChanged: (value) => db.settings.update().write(
                  SettingsCompanion(
                    themeMode: Value(
                      value ? 'ThemeMode.amoled' : 'ThemeMode.dark',
                    ),
                  ),
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
    if ('graphs start at zero'.contains(term))
      Tooltip(
        message: 'Always start the graph y-axis at zero',
        child: ListTile(
          title: const Text('Graphs start at zero'),
          leading: const Icon(Icons.vertical_align_bottom),
          onTap: () => db.settings.update().write(
                SettingsCompanion(
                  graphsStartAtZero: Value(!settings.value.graphsStartAtZero),
                ),
              ),
          trailing: Switch(
            value: settings.value.graphsStartAtZero,
            onChanged: (value) => db.settings.update().write(
                  SettingsCompanion(
                    graphsStartAtZero: Value(value),
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
