import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ExportData extends StatelessWidget {
  const ExportData({
    super.key,
  });

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
                  onTap: () async {
                    Navigator.pop(context);
                    final entries = await db.entries.select().get();

                    final List<List<dynamic>> csvData = [
                      [
                        'id',
                        'food',
                        'created',
                        'quantity',
                        'unit',
                        'kCalories',
                        'proteinG',
                        'fatG',
                        'carbG',
                      ]
                    ];
                    for (var entry in entries) {
                      csvData.add([
                        entry.id,
                        entry.food,
                        entry.created,
                        entry.quantity,
                        entry.unit,
                        entry.kCalories,
                        entry.proteinG,
                        entry.fatG,
                        entry.carbG,
                      ]);
                    }
                    final csv =
                        const ListToCsvConverter(eol: '\n').convert(csvData);
                    final bytes = Uint8List.fromList(csv.codeUnits);
                    await FilePicker.platform.saveFile(
                      fileName: 'entries.csv',
                      bytes: bytes,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.restaurant),
                  title: const Text('Foods'),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('Database'),
                  onTap: () async {
                    Navigator.pop(context);
                    final dbFolder = await getApplicationDocumentsDirectory();
                    final file = File(p.join(dbFolder.path, 'fitbook.sqlite'));
                    final bytes = await file.readAsBytes();
                    await FilePicker.platform.saveFile(
                      fileName: 'fitbook.sqlite',
                      bytes: bytes,
                    );
                  },
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.download),
      label: const Text('Export data'),
    );
  }
}
