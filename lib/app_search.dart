import 'package:fit_book/quick_add_page.dart';
import 'package:fit_book/settings/settings_page.dart';
import 'package:flutter/material.dart';

class AppSearch extends StatefulWidget {
  const AppSearch({
    super.key,
    required this.selected,
    required this.onChange,
    required this.onClear,
    required this.onEdit,
    required this.onDelete,
    required this.onSelect,
    required this.onFavorite,
    this.filter,
    this.controller,
  });

  final Set<dynamic> selected;
  final Function(String) onChange;
  final Function onClear;
  final Function onEdit;
  final Function onDelete;
  final Function onSelect;
  final Function onFavorite;
  final Widget? filter;
  final TextEditingController? controller;

  @override
  State<AppSearch> createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: SearchBar(
        hintText: "Search...",
        controller: widget.controller,
        padding: WidgetStateProperty.all(
          const EdgeInsets.only(right: 8.0),
        ),
        textCapitalization: TextCapitalization.sentences,
        onChanged: widget.onChange,
        leading:
            widget.selected.isEmpty && widget.controller?.text.isEmpty == true
                ? const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Icon(Icons.search),
                  )
                : IconButton(
                    onPressed: () {
                      widget.onClear();
                      widget.controller?.text = '';
                      widget.onChange('');
                    },
                    icon: const Icon(Icons.arrow_back),
                    tooltip: 'Clear',
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 8.0,
                    ),
                  ),
        trailing: [
          if (widget.filter != null && widget.selected.isEmpty) widget.filter!,
          if (widget.selected.isNotEmpty)
            IconButton(
              tooltip: 'Delete',
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm delete'),
                      content: Text(
                        'Are you sure you want to delete ${widget.selected.length} records? This action is not reversible.',
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text('Delete'),
                          onPressed: () async {
                            Navigator.pop(context);
                            widget.onDelete();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          Badge.count(
            backgroundColor: Theme.of(context).colorScheme.primary,
            count: widget.selected.length,
            isLabelVisible: widget.selected.isNotEmpty,
            child: PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              tooltip: 'Show menu',
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.done_all),
                    title: const Text('Select all'),
                    onTap: () async {
                      Navigator.pop(context);
                      widget.onSelect();
                    },
                  ),
                ),
                if (widget.selected.isEmpty) ...[
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.electric_bolt),
                      title: const Text('Quick-add'),
                      onTap: () async {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuickAddPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () async {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
                if (widget.selected.isNotEmpty) ...[
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Edit'),
                      onTap: () async {
                        Navigator.pop(context);
                        widget.onEdit();
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.favorite_outline),
                      title: const Text('Favorite'),
                      onTap: () async {
                        Navigator.pop(context);
                        widget.onFavorite();
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.clear),
                      title: const Text('Clear'),
                      onTap: () async {
                        Navigator.pop(context);
                        widget.onClear();
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
