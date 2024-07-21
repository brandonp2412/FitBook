import 'package:drift/drift.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeleteRecordsButton extends StatelessWidget {
  final BuildContext pageContext;

  DeleteRecordsButton({
    super.key,
    required this.pageContext,
  });

  deleteWeights(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm delete'),
          content: const Text(
            'Are you sure you want to delete all weights? This action is not reversible.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.pop(dialogContext);
                await db.weights.deleteAll();
                if (pageContext.mounted) Navigator.pop(pageContext);
              },
            ),
          ],
        );
      },
    );
  }

  deleteDatabase(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm delete'),
          content: const Text(
            'Are you sure you want to delete everything? This action is not reversible.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.pop(dialogContext);
                db.transaction(() async {
                  for (final table in db.allTables)
                    await db.customStatement(
                      'DELETE FROM ${table.actualTableName}',
                    );
                  await db.settings.insertOne(defaultSettings);
                });
              },
            ),
          ],
        );
      },
    );
  }

  deleteFoods(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm delete'),
          content: const Text(
            'Are you sure you want to delete all food & entries? This action is not reversible.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.pop(dialogContext);
                await db.entries.deleteAll();
                await db.foods.deleteAll();
                if (pageContext.mounted) Navigator.pop(pageContext);
              },
            ),
          ],
        );
      },
    );
  }

  final formatter = NumberFormat('#,##0');

  deleteUnused(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext dialogContext) {
        final unusedFuture = (db.foods.selectOnly()
              ..addColumns([db.foods.id])
              ..join(
                [
                  leftOuterJoin(
                    db.entries,
                    db.entries.food.equalsExp(db.foods.id),
                  ),
                ],
              )
              ..addColumns([db.entries.id])
              ..where(db.entries.id.isNull()))
            .get();

        return AlertDialog(
          title: const Text('Confirm delete'),
          content: FutureBuilder(
            future: unusedFuture,
            builder: (context, snapshot) => Text(
              'Are you sure you want to delete ${formatter.format(snapshot.data?.length ?? 0)} unused foods? This action is irreversible',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.pop(dialogContext);
                final ids = (await unusedFuture)
                    .map((unused) => unused.read(db.foods.id)!);
                (db.foods.deleteWhere((tbl) => tbl.id.isIn(ids)));
                if (pageContext.mounted) Navigator.pop(pageContext);
              },
            ),
          ],
        );
      },
    );
  }

  deleteDiary(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm delete'),
          content: const Text(
            'Are you sure you want to delete all entries? This action is not reversible.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.pop(dialogContext);
                await db.entries.deleteAll();
                if (!pageContext.mounted) return;
                Navigator.pop(pageContext);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (sheetContext) {
            return Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.date_range),
                  title: const Text('Diary'),
                  onTap: () => deleteDiary(sheetContext),
                ),
                ListTile(
                  leading: const Icon(Icons.restaurant),
                  title: const Text('Food'),
                  onTap: () => deleteFoods(sheetContext),
                ),
                ListTile(
                  leading: const Icon(Icons.no_meals),
                  title: const Text('Unused food'),
                  onTap: () => deleteUnused(sheetContext),
                ),
                ListTile(
                  leading: const Icon(Icons.scale),
                  title: const Text('Weight'),
                  onTap: () => deleteWeights(sheetContext),
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('Database'),
                  onTap: () => deleteDatabase(sheetContext),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.delete),
      label: const Text('Delete records'),
    );
  }
}
