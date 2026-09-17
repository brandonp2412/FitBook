import 'dart:io';

import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DeleteRecordsButton extends StatelessWidget {
  final BuildContext pageContext;

  const DeleteRecordsButton({
    super.key,
    required this.pageContext,
  });

  void deleteWeights(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(dialogContext.l10n.confirmDelete),
          content: Text(dialogContext.l10n.deleteAllWeightsConfirm),
          actions: <Widget>[
            TextButton(
              child: Text(dialogContext.l10n.cancel),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: Text(dialogContext.l10n.delete),
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

  void deleteDatabase(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.l10n.confirmDelete),
          content: Text(context.l10n.deleteDatabaseConfirm),
          actions: <Widget>[
            TextButton.icon(
              label: Text(context.l10n.cancel),
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton.icon(
              label: Text(context.l10n.delete),
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final dbFolder = await getApplicationDocumentsDirectory();
                final file = File(
                  p.join(dbFolder.path, 'fitbook.sqlite'),
                );
                await db.close();
                await db.executor.close();
                await file.delete();
                if (!kIsWeb) {
                  if (Platform.isAndroid || Platform.isIOS)
                    SystemNavigator.pop();
                  if (Platform.isWindows ||
                      Platform.isMacOS ||
                      Platform.isLinux) exit(0);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void deleteFoods(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(dialogContext.l10n.confirmDelete),
          content: Text(dialogContext.l10n.deleteFoodsAndDiaryConfirm),
          actions: <Widget>[
            TextButton(
              child: Text(dialogContext.l10n.cancel),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: Text(dialogContext.l10n.delete),
              onPressed: () async {
                Navigator.pop(dialogContext);
                await db.diaries.deleteAll();
                await db.foods.deleteAll();
                if (pageContext.mounted) Navigator.pop(pageContext);
              },
            ),
          ],
        );
      },
    );
  }

  void deleteUnused(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext dialogContext) {
        final unusedFuture = (db.foods.selectOnly()
              ..addColumns([db.foods.id])
              ..join(
                [
                  leftOuterJoin(
                    db.diaries,
                    db.diaries.food.equalsExp(db.foods.id),
                  ),
                ],
              )
              ..addColumns([db.diaries.id])
              ..where(db.diaries.id.isNull()))
            .get();

        return AlertDialog(
          title: Text(dialogContext.l10n.confirmDelete),
          content: FutureBuilder(
            future: unusedFuture,
            builder: (context, snapshot) => Text(
              context.l10n.deleteUnusedFoodsConfirm(snapshot.data?.length ?? 0),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(dialogContext.l10n.cancel),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: Text(dialogContext.l10n.delete),
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

  void deleteDiary(BuildContext sheetContext) {
    Navigator.pop(sheetContext);
    showDialog(
      context: sheetContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(dialogContext.l10n.confirmDelete),
          content: Text(dialogContext.l10n.deleteAllDiaryConfirm),
          actions: <Widget>[
            TextButton(
              child: Text(dialogContext.l10n.cancel),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: Text(dialogContext.l10n.delete),
              onPressed: () async {
                Navigator.pop(dialogContext);
                await db.diaries.deleteAll();
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
            return SafeArea(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.date_range),
                    title: Text(sheetContext.l10n.diary),
                    onTap: () => deleteDiary(sheetContext),
                  ),
                  ListTile(
                    leading: const Icon(Icons.restaurant),
                    title: Text(sheetContext.l10n.food),
                    onTap: () => deleteFoods(sheetContext),
                  ),
                  ListTile(
                    leading: const Icon(Icons.no_meals),
                    title: Text(sheetContext.l10n.unusedFood),
                    onTap: () => deleteUnused(sheetContext),
                  ),
                  ListTile(
                    leading: const Icon(Icons.scale),
                    title: Text(sheetContext.l10n.weight),
                    onTap: () => deleteWeights(sheetContext),
                  ),
                  ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text(sheetContext.l10n.database),
                    onTap: () => deleteDatabase(sheetContext),
                  ),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.delete),
      label: Text(context.l10n.deleteRecords),
    );
  }
}
