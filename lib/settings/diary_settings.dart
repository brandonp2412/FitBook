import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/reminders.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> setReminders(bool value) async {
  await db.settings.update().write(SettingsCompanion(reminders: Value(value)));
  if (value) {
    setupReminders(requestPermission: false);
    await notifyRemindersEnabled();
  } else {
    cancelReminders();
  }
}

List<Widget> getDiarySettings({
  required BuildContext context,
  required String term,
  required SettingsState settings,
  required TextEditingController calories,
  required TextEditingController protein,
  required TextEditingController fat,
  required TextEditingController carb,
  required TextEditingController fiber,
}) {
  final l10n = context.l10n;

  return [
    if (l10n.diaryUnit.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: DropdownButtonFormField<String>(
          initialValue: settings.value.entryUnit,
          decoration: InputDecoration(labelText: l10n.diaryUnit),
          items: unitOptions.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(entryUnit: Value(value!)),
              ),
        ),
      ),
    if (l10n.diarySummary.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: DropdownButtonFormField(
          initialValue: settings.value.diarySummary,
          decoration: InputDecoration(
            labelStyle: const TextStyle(),
            labelText: l10n.diarySummary,
          ),
          items: [
            DropdownMenuItem(
              value: DiarySummary.division.toString(),
              child: Text(l10n.diarySummaryDivision),
            ),
            DropdownMenuItem(
              value: DiarySummary.remaining.toString(),
              child: Text(l10n.diarySummaryRemaining),
            ),
            DropdownMenuItem(
              value: DiarySummary.both.toString(),
              child: Text(l10n.diarySummaryBoth),
            ),
            DropdownMenuItem(
              value: DiarySummary.none.toString(),
              child: Text(l10n.diarySummaryNone),
            ),
          ],
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(diarySummary: Value(value.toString())),
              ),
        ),
      ),
    if (l10n.dailyCaloriesKcal.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          controller: calories,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(dailyCalories: Value(int.tryParse(value))),
              ),
          onTap: () => selectAll(calories),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: l10n.dailyCaloriesKcal,
          ),
        ),
      ),
    if (l10n.dailyProteinG.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          controller: protein,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(
                  dailyProtein:
                      value == "" ? Value(null) : Value(int.tryParse(value)),
                ),
              ),
          onTap: () => selectAll(protein),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: l10n.dailyProteinG,
          ),
        ),
      ),
    if (l10n.dailyFatG.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          controller: fat,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(dailyFat: Value(int.tryParse(value))),
              ),
          onTap: () => selectAll(fat),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: l10n.dailyFatG,
          ),
        ),
      ),
    if (l10n.dailyCarbsG.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          controller: carb,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(dailyCarb: Value(int.tryParse(value))),
              ),
          onTap: () => selectAll(carb),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: l10n.dailyCarbsG,
          ),
        ),
      ),
    if (l10n.dailyFiberG.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          controller: fiber,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(dailyFiber: Value(int.tryParse(value))),
              ),
          onTap: () => selectAll(fiber),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: l10n.dailyFiberG,
          ),
        ),
      ),
    if (l10n.automaticDailies.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Tooltip(
          message: l10n.automaticDailiesTooltip,
          child: ListTile(
            leading: const Icon(Icons.auto_mode),
            title: Text(l10n.automaticDailies),
            onTap: () async {
              final value = !settings.value.autoCalc;
              db.settings.update().write(
                    SettingsCompanion(
                      autoCalc: Value(value),
                    ),
                  );

              if (!value) return;

              final bodyWeight = await (db.weights.select()
                    ..orderBy([
                      (u) => OrderingTerm(
                            expression: u.created,
                            mode: OrderingMode.desc,
                          ),
                    ])
                    ..limit(1))
                  .getSingle();

              final macros = getMacros(bodyWeight.amount, bodyWeight.unit);
              calories.text = macros.calories.toStringAsFixed(0);
              protein.text = macros.protein.toStringAsFixed(0);
              fat.text = macros.fat.toStringAsFixed(0);
              carb.text = macros.carb.toStringAsFixed(0);
              db.settings.update().write(
                    SettingsCompanion(
                      dailyCalories: Value(macros.calories.toInt()),
                      dailyCarb: Value(macros.carb.toInt()),
                      dailyFat: Value(macros.fat.toInt()),
                      dailyProtein: Value(macros.protein.toInt()),
                    ),
                  );
            },
            trailing: Switch(
              value: settings.value.autoCalc,
              onChanged: (value) => db.settings.update().write(
                    SettingsCompanion(
                      autoCalc: Value(value),
                    ),
                  ),
            ),
          ),
        ),
      ),
    if (l10n.selectNameOnSubmit.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListTile(
          leading: const Icon(Icons.check),
          title: Text(l10n.selectNameOnSubmit),
          onTap: () => db.settings.update().write(
                SettingsCompanion(
                  selectEntryOnSubmit:
                      Value(!settings.value.selectEntryOnSubmit),
                ),
              ),
          trailing: Switch(
            value: settings.value.selectEntryOnSubmit,
            onChanged: (value) => db.settings.update().write(
                  SettingsCompanion(
                    selectEntryOnSubmit: Value(value),
                  ),
                ),
          ),
        ),
      ),
    if (l10n.reminders.toLowerCase().contains(term))
      ListTile(
        key: const Key('remindersTile'),
        leading: const Icon(Icons.notifications),
        title: Text(l10n.reminders),
        onTap: () => setReminders(!settings.value.reminders),
        trailing: Switch(
          key: const Key('remindersSwitch'),
          value: settings.value.reminders,
          onChanged: (value) => setReminders(value),
        ),
      ),
  ];
}

class DiarySettings extends StatefulWidget {
  final String initialTerm;

  const DiarySettings({super.key, this.initialTerm = ''});

  @override
  State<DiarySettings> createState() => _DiarySettingsState();
}

class _DiarySettingsState extends State<DiarySettings> {
  late final settings = context.read<SettingsState>();
  late final calories =
      TextEditingController(text: settings.value.dailyCalories?.toString());
  late final protein =
      TextEditingController(text: settings.value.dailyProtein?.toString());
  late final fat =
      TextEditingController(text: settings.value.dailyFat?.toString());
  late final carb =
      TextEditingController(text: settings.value.dailyCarb?.toString());
  late final fiber =
      TextEditingController(text: settings.value.dailyFiber?.toString());

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.diarySettings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: getDiarySettings(
            context: context,
            term: widget.initialTerm,
            calories: calories,
            protein: protein,
            settings: settings,
            fat: fat,
            carb: carb,
            fiber: fiber,
          ),
        ),
      ),
    );
  }
}
