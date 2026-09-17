import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/settings/fields_picker.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> getFoodSettings({
  required String term,
  required SettingsState settings,
  required BuildContext context,
}) {
  final l10n = context.l10n;

  return [
    if (l10n.foodUnit.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButtonFormField<String>(
          initialValue: settings.value.foodUnit,
          decoration: InputDecoration(labelText: l10n.foodUnit),
          items: unitOptions.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(localizedUnit(l10n, value)),
            );
          }).toList(),
          onChanged: (value) => db.settings.update().write(
                SettingsCompanion(foodUnit: Value(value!)),
              ),
        ),
      ),
    if (l10n.fields.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          leading: const Icon(Icons.list),
          title: Text(l10n.fields),
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
    if (l10n.favoriteNewFoods.toLowerCase().contains(term))
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: Text(l10n.favoriteNewFoods),
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
        title: Text(context.l10n.foodSettings),
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
