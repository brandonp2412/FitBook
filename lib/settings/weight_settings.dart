import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> getWeightSettings({
  required BuildContext context,
  required String term,
  required SettingsState settings,
  required TextEditingController targetWeight,
}) {
  return [
    if ('target weight'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: targetWeight,
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(
                  targetWeight: Value(double.tryParse(value)),
                ),
              ),
          onTap: () => selectAll(targetWeight),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Target weight',
          ),
        ),
      ),
    if ('positive reinforcement'.contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListTile(
          leading: const Icon(Icons.sentiment_very_satisfied),
          title: const Text('Positive reinforcement'),
          onTap: () {
            db.settings.update().write(
                  SettingsCompanion(
                    positiveReinforcement:
                        Value(!settings.value.positiveReinforcement),
                  ),
                );
            if (!settings.value.positiveReinforcement)
              toast(context, 'Nice messages will be shown like this!');
          },
          trailing: Switch(
            value: settings.value.positiveReinforcement,
            onChanged: (value) => db.settings
                .update()
                .write(SettingsCompanion(positiveReinforcement: Value(value))),
          ),
        ),
      ),
  ];
}

class WeightSettings extends StatefulWidget {
  const WeightSettings({super.key});

  @override
  State<WeightSettings> createState() => _WeightSettingsState();
}

class _WeightSettingsState extends State<WeightSettings> {
  late final settings = context.read<SettingsState>();
  late final targetWeight = TextEditingController(
    text: settings.value.targetWeight.toString(),
  );

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weight settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: getWeightSettings(
            context: context,
            term: '',
            settings: settings,
            targetWeight: targetWeight,
          ),
        ),
      ),
    );
  }
}
