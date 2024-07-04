import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';

class DeleteRecordsButton extends StatelessWidget {
  final BuildContext pageContext;

  const DeleteRecordsButton({
    super.key,
    required this.pageContext,
  });

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
                  onTap: () async {
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
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.restaurant),
                  title: const Text('Food'),
                  onTap: () async {
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
                                if (pageContext.mounted)
                                  Navigator.pop(pageContext);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.scale),
                  title: const Text('Weight'),
                  onTap: () async {
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
                                if (pageContext.mounted)
                                  Navigator.pop(pageContext);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
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
