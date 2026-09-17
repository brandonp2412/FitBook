import 'dart:io';

import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/settings/delete_records_button.dart';
import 'package:fit_book/settings/export_data.dart';
import 'package:fit_book/settings/import_data.dart';
import 'package:fit_book/settings/open_food_facts_login.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> notifyAutomaticBackupEnabled(AppLocalizations l10n) async {
  if (kIsWeb) return;

  if (Platform.isAndroid || Platform.isIOS) {
    final permission = await Permission.notification.request();
    if (!permission.isGranted) return;
  }

  const darwin = DarwinInitializationSettings();
  const android = AndroidInitializationSettings('@drawable/nutrition');
  final linux = LinuxInitializationSettings(
    defaultActionName: l10n.openNotification,
  );
  final init = InitializationSettings(
    android: android,
    iOS: darwin,
    macOS: darwin,
    linux: linux,
  );
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(settings: init);
  await plugin.show(
    id: 4,
    title: l10n.automaticBackupsEnabled,
    body: l10n.automaticBackupBody,
    notificationDetails: NotificationDetails(
      android: AndroidNotificationDetails(
        'backup-settings',
        l10n.backupSettings,
        channelDescription: l10n.backupSettingsChannelDescription,
      ),
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
      linux: LinuxNotificationDetails(),
    ),
  );
}

Future<void> tapBackup(bool value, AppLocalizations l10n) async {
  if (!value) {
    await db.settings.update().write(
          const SettingsCompanion(
            automaticBackups: Value(false),
          ),
        );
    return;
  }

  await db.settings.update().write(
        const SettingsCompanion(
          automaticBackups: Value(false),
        ),
      );

  try {
    final selectedPath = await androidChannel.invokeMethod<String>('pick');
    if (selectedPath == null) return;

    await db.settings.update().write(
          const SettingsCompanion(
            automaticBackups: Value(true),
          ),
        );
    await notifyAutomaticBackupEnabled(l10n);
  } catch (_) {
    await db.settings.update().write(
          const SettingsCompanion(
            automaticBackups: Value(false),
          ),
        );
    rethrow;
  }
}

List<Widget> getDataSettings({
  required String term,
  required SettingsState settings,
  required BuildContext context,
}) {
  final l10n = context.l10n;

  return [
    if (l10n.automaticBackup.toLowerCase().contains(term.toLowerCase()))
      ListTile(
        key: const Key('automaticBackupTile'),
        title: Text(l10n.automaticBackup),
        leading: settings.value.automaticBackups
            ? const Icon(Icons.timer)
            : const Icon(Icons.timer_outlined),
        onTap: () => tapBackup(!settings.value.automaticBackups, l10n),
        trailing: Switch(
          key: const Key('automaticBackupSwitch'),
          value: settings.value.automaticBackups,
          onChanged: (value) => tapBackup(value, l10n),
        ),
      ),
    if (l10n.openFoodFacts.toLowerCase().contains(term))
      const OpenFoodFactsLogin(),
    const SizedBox(height: 8),
    if (l10n.shareDatabase.toLowerCase().contains(term))
      TextButton.icon(
        onPressed: () async {
          final dbFolder = await getApplicationDocumentsDirectory();
          final dbPath = p.join(dbFolder.path, 'fitbook.sqlite');
          await SharePlus.instance.share(ShareParams(files: [XFile(dbPath)]));
        },
        label: Text(l10n.shareDatabase),
        icon: const Icon(Icons.share),
      ),
    const SizedBox(height: 8),
    if (l10n.exportData.toLowerCase().contains(term)) const ExportData(),
    const SizedBox(height: 8),
    if (l10n.importData.toLowerCase().contains(term))
      ImportData(pageContext: context),
    const SizedBox(height: 8),
    if (l10n.deleteRecords.toLowerCase().contains(term))
      DeleteRecordsButton(pageContext: context),
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
        title: Text(context.l10n.dataSettings),
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
