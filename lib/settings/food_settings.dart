import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/fields_picker.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> getFoodSettings({
  required String term,
  required SettingsState settings,
  required BuildContext context,
}) {
  return [
    if ('food unit'.contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButtonFormField<String>(
          value: settings.value.foodUnit,
          decoration: const InputDecoration(labelText: 'Food unit'),
          items: unitOptions.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(foodUnit: Value(value!)),
              ),
        ),
      ),
    if ('fields'.contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          leading: const Icon(Icons.list),
          title: const Text('Fields'),
          trailing: Text(
            "(${settings.value.fields?.split(',').length.toString()})",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FieldsPicker(),
            ),
          ),
        ),
      ),
    if ('favorite new foods'.contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text('Favorite new foods'),
          onTap: () => db.settings.update().write(
                SettingsCompanion(
                  favoriteNew: Value(!settings.value.favoriteNew),
                ),
              ),
          trailing: Switch(
            value: settings.value.favoriteNew,
            onChanged: (value) => db.settings
                .update()
                .write(SettingsCompanion(favoriteNew: Value(value))),
          ),
        ),
      ),
  ];
}

class FoodSettings extends StatefulWidget {
  const FoodSettings({super.key});

  @override
  State<FoodSettings> createState() => _FoodSettingsState();
}

class _FoodSettingsState extends State<FoodSettings> {
  late final settings = context.read<SettingsState>();

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Food settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: getFoodSettings(
            term: '',
            settings: settings,
            context: context,
          ),
        ),
      ),
    );
  }
}
