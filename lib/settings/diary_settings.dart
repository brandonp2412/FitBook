import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/reminders.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void setReminders(bool value) {
  db.settings.update().write(SettingsCompanion(reminders: Value(value)));
  if (value)
    setupReminders();
  else
    cancelReminders();
}

List<Widget> getDiarySettings({
  required String term,
  required SettingsState settings,
  required TextEditingController calories,
  required TextEditingController protein,
  required TextEditingController fat,
  required TextEditingController carb,
  required TextEditingController fiber,
}) {
  return [
    if ('diary unit'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: DropdownButtonFormField<String>(
          value: settings.value.entryUnit,
          decoration: const InputDecoration(labelText: 'Diary unit'),
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
    if ('diary summary'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: DropdownButtonFormField(
          value: settings.value.diarySummary,
          decoration: const InputDecoration(
            labelStyle: TextStyle(),
            labelText: 'Diary summary',
          ),
          items: [
            DropdownMenuItem(
              value: DiarySummary.division.toString(),
              child: const Text("Division - current / total"),
            ),
            DropdownMenuItem(
              value: DiarySummary.remaining.toString(),
              child: const Text("Remaining"),
            ),
            DropdownMenuItem(
              value: DiarySummary.both.toString(),
              child: const Text("Both - remaining (total)"),
            ),
            DropdownMenuItem(
              value: DiarySummary.none.toString(),
              child: const Text("None"),
            ),
          ],
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(diarySummary: Value(value.toString())),
              ),
        ),
      ),
    if ('daily calories'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          controller: calories,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(dailyCalories: Value(int.tryParse(value))),
              ),
          onTap: () => selectAll(calories),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Daily calories (kcal)',
          ),
        ),
      ),
    if ('daily protein'.contains(term))
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
            labelText: 'Daily protein (g)',
          ),
        ),
      ),
    if ('daily fat'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          controller: fat,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(dailyFat: Value(int.tryParse(value))),
              ),
          onTap: () => selectAll(fat),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Daily fat (g)',
          ),
        ),
      ),
    if ('daily carb'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          controller: carb,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(dailyCarb: Value(int.tryParse(value))),
              ),
          onTap: () => selectAll(carb),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Daily carbs (g)',
          ),
        ),
      ),
    if ('daily fiber'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          controller: fiber,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(dailyFiber: Value(int.tryParse(value))),
              ),
          onTap: () => selectAll(fiber),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Daily fiber (g)',
          ),
        ),
      ),
    if ('automatic dailies'.contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Tooltip(
          message:
              'Automatically calculate your recommended daily calories, protein, fat and carbs based on your body weight',
          child: ListTile(
            leading: const Icon(Icons.auto_mode),
            title: const Text('Automatic dailies'),
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
    if ('select name on submit'.contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListTile(
          leading: const Icon(Icons.check),
          title: const Text('Select name on submit'),
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
    if ('reminders'.contains(term))
      ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text('Reminders'),
        onTap: () => setReminders(!settings.value.reminders),
        trailing: Switch(
          value: settings.value.reminders,
          onChanged: (value) => setReminders(value),
        ),
      ),
  ];
}

class DiarySettings extends StatefulWidget {
  const DiarySettings({super.key});

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
        title: const Text("Diary settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: getDiarySettings(
            term: '',
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
