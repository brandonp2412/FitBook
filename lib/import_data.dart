import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fit_book/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ImportData extends StatelessWidget {
  final BuildContext pageContext;

  const ImportData({
    super.key,
    required this.pageContext,
  });

  _importFoods(BuildContext context) async {}

  _importDatabase(BuildContext context) async {
    Navigator.pop(context);
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    File sourceFile = File(result.files.single.path!);
    final dbFolder = await getApplicationDocumentsDirectory();
    await db.close();
    await sourceFile.copy(p.join(dbFolder.path, 'fitbook.sqlite'));
    db = AppDatabase();
    if (!pageContext.mounted) return;
    Navigator.pushNamedAndRemoveUntil(pageContext, '/', (_) => false);
  }

  _importEntries(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.date_range),
                  title: const Text('Diary'),
                  onTap: () => _importEntries(context),
                ),
                ListTile(
                  leading: const Icon(Icons.restaurant),
                  title: const Text('Foods'),
                  onTap: () => _importFoods(context),
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('Database'),
                  onTap: () => _importDatabase(context),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.upload),
      label: const Text('Import data'),
    );
  }
}
