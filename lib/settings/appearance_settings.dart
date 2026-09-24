import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/settings/navigation_animation.dart';
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

String _animationLabel(
  AppLocalizations l10n,
  NavigationAnimation animation,
) =>
    switch (animation) {
      NavigationAnimation.fade => l10n.animationFade,
      NavigationAnimation.zoom => l10n.animationZoom,
      NavigationAnimation.slide => l10n.animationSlide,
      NavigationAnimation.rise => l10n.animationRise,
      NavigationAnimation.none => l10n.animationNone,
    };

List<Widget> getAppearanceSettings(
  BuildContext context,
  String term,
  SettingsState settings,
) {
  final l10n = context.l10n;
  final locale = Localizations.localeOf(context).toLanguageTag();
  final now = DateTime.now();
  String longExample = DateFormat(settings.value.longDateFormat, locale)
      .format(DateTime(now.year, now.month, now.day, 13, 54));
  String shortExample = DateFormat(settings.value.shortDateFormat, locale)
      .format(DateTime(now.year, now.month, now.day, 13, 54));

  return [
    if ('language locale ${l10n.language.toLowerCase()}'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButtonFormField<String>(
          initialValue: settings.value.locale,
          items: [
            DropdownMenuItem(value: 'system', child: Text(l10n.languageSystem)),
            DropdownMenuItem(value: 'en', child: Text(l10n.languageEnglish)),
            DropdownMenuItem(value: 'es', child: Text(l10n.languageSpanish)),
            DropdownMenuItem(value: 'fr', child: Text(l10n.languageFrench)),
            DropdownMenuItem(value: 'de', child: Text(l10n.languageGerman)),
            DropdownMenuItem(value: 'it', child: Text(l10n.languageItalian)),
            DropdownMenuItem(
              value: 'pt-BR',
              child: Text(l10n.languagePortugueseBrazil),
            ),
            DropdownMenuItem(value: 'nl', child: Text(l10n.languageDutch)),
            DropdownMenuItem(value: 'pl', child: Text(l10n.languagePolish)),
            DropdownMenuItem(value: 'ja', child: Text(l10n.languageJapanese)),
            DropdownMenuItem(value: 'ko', child: Text(l10n.languageKorean)),
            DropdownMenuItem(
              value: 'zh-CN',
              child: Text(l10n.languageChineseSimplified),
            ),
            DropdownMenuItem(
              value: 'zh-TW',
              child: Text(l10n.languageChineseTraditional),
            ),
          ],
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(locale: Value(value!)),
              ),
          decoration: InputDecoration(
            labelText: l10n.language,
            helperText: l10n.languageSubtitle,
          ),
        ),
      ),
    if ('${l10n.themeSystem} ${l10n.themeDark} ${l10n.themeLight}'
        .toLowerCase()
        .contains(term))
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
        child: SegmentedButton<String>(
          segments: [
            ButtonSegment(
              value: 'ThemeMode.system',
              label: Text(l10n.themeSystem),
              icon: const Icon(Icons.brightness_auto),
            ),
            ButtonSegment(
              value: 'ThemeMode.dark',
              label: Text(l10n.themeDark),
              icon: const Icon(Icons.dark_mode),
            ),
            ButtonSegment(
              value: 'ThemeMode.light',
              label: Text(l10n.themeLight),
              icon: const Icon(Icons.light_mode),
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
    if (l10n.pureBlackAmoled.toLowerCase().contains(term))
      Tooltip(
        message: l10n.pureBlackAmoledTooltip,
        child: ListTile(
          leading: const Icon(Icons.contrast),
          title: Text(l10n.pureBlackAmoled),
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
    if (l10n.systemColorScheme.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Tooltip(
          message: l10n.systemColorSchemeTooltip,
          child: ListTile(
            title: Text(l10n.systemColorScheme),
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
    if (l10n.showImages.toLowerCase().contains(term))
      Tooltip(
        message: l10n.showImagesTooltip,
        child: ListTile(
          title: Text(l10n.showImages),
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
    if (l10n.curveLineGraphs.toLowerCase().contains(term))
      Tooltip(
        message: l10n.curveLineGraphsTooltip,
        child: ListTile(
          title: Text(l10n.curveLineGraphs),
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
    if (l10n.weightStatCards.toLowerCase().contains(term))
      Tooltip(
        message: l10n.weightStatCardsTooltip,
        child: ListTile(
          title: Text(l10n.weightStatCards),
          leading: settings.value.compactWeights
              ? const Icon(Icons.list)
              : const Icon(Icons.grid_view),
          onTap: () => db.settings.update().write(
                SettingsCompanion(
                  compactWeights: Value(!settings.value.compactWeights),
                ),
              ),
          trailing: Switch(
            value: !settings.value.compactWeights,
            onChanged: (value) => db.settings.update().write(
                  SettingsCompanion(
                    compactWeights: Value(!value),
                  ),
                ),
          ),
        ),
      ),
    if (l10n.graphsStartAtZero.toLowerCase().contains(term))
      Tooltip(
        message: l10n.graphsStartAtZeroTooltip,
        child: ListTile(
          title: Text(l10n.graphsStartAtZero),
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
    if (l10n.navigationAnimation.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButtonFormField<String>(
          initialValue: NavigationAnimation.fromValue(
            settings.value.navigationAnimation,
          ).value,
          items: NavigationAnimation.values
              .map(
                (animation) => DropdownMenuItem(
                  value: animation.value,
                  child: Text(_animationLabel(l10n, animation)),
                ),
              )
              .toList(),
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(navigationAnimation: Value(value!)),
              ),
          decoration: InputDecoration(
            labelText: l10n.navigationAnimation,
          ),
        ),
      ),
    if (l10n.longDateFormat('').toLowerCase().contains(term))
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
            labelText: l10n.longDateFormat(longExample),
          ),
        ),
      ),
    if (l10n.shortDateFormat('').toLowerCase().contains(term))
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
            labelText: l10n.shortDateFormat(shortExample),
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
        title: Text(context.l10n.appearanceSettings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: getAppearanceSettings(context, '', settings),
        ),
      ),
    );
  }
}
