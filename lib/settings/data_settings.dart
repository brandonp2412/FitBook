import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/delete_records_button.dart';
import 'package:fit_book/settings/export_data.dart';
import 'package:fit_book/settings/import_data.dart';
import 'package:fit_book/settings/open_food_facts_login.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

void tapBackup(bool value) async {
  await db.settings.update().write(
        SettingsCompanion(
          automaticBackups: Value(value),
        ),
      );

  if (value) {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dbFolder.path, 'flexify.sqlite');
    androidChannel.invokeMethod('pick', {'dbPath': dbPath});
    await Permission.notification.request();
  }
}

List<Widget> getDataSettings({
  required String term,
  required SettingsState settings,
  required BuildContext context,
}) {
  return [
    if ('automatic backup'.contains(term.toLowerCase()))
      ListTile(
        title: const Text('Automatic backup'),
        leading: settings.value.automaticBackups
            ? const Icon(Icons.timer)
            : const Icon(Icons.timer_outlined),
        onTap: () => tapBackup(!settings.value.automaticBackups),
        trailing: Switch(
          value: settings.value.automaticBackups,
          onChanged: (value) => tapBackup(value),
        ),
      ),
    if ('open food facts'.contains(term)) const OpenFoodFactsLogin(),
    const SizedBox(height: 8),
    if ('share database'.contains(term))
      TextButton.icon(
        onPressed: () async {
          final dbFolder = await getApplicationDocumentsDirectory();
          final dbPath = p.join(dbFolder.path, 'fitbook.sqlite');
          await Share.shareXFiles([XFile(dbPath)]);
        },
        label: const Text("Share database"),
        icon: const Icon(Icons.share),
      ),
    const SizedBox(height: 8),
    if ('export data'.contains(term)) const ExportData(),
    const SizedBox(height: 8),
    if ('import data'.contains(term)) ImportData(pageContext: context),
    const SizedBox(height: 8),
    if ('delete data'.contains(term)) DeleteRecordsButton(pageContext: context),
  ];
}

class DataSettings extends StatefulWidget {
  const DataSettings({super.key});

  @override
  State<DataSettings> createState() => _DataSettingsState();
}

class _DataSettingsState extends State<DataSettings> {
  late final settings = context.read<SettingsState>();

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: getDataSettings(
            term: '',
            settings: settings,
            context: context,
          ),
        ),
      ),
    );
  }
}
