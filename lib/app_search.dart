import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/settings/settings_page.dart';
import 'package:flutter/material.dart';

/// Vertical space occupied by [AppSearch] when floated on top of a list: the
/// 56px search pill plus its 16px top padding. List views offset their content
/// by this amount so the first item clears the floating bar.
const double appSearchHeight = 72;

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
    this.ctrl,
  });

  final Set<dynamic> selected;
  final ValueChanged<String> onChange;
  final VoidCallback onClear;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSelect;
  final VoidCallback onFavorite;
  final Widget? filter;
  final TextEditingController? ctrl;

  @override
  State<AppSearch> createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {
  @override
  Widget build(BuildContext context) {
    Widget trailingMain;

    if (widget.filter != null && widget.selected.isEmpty)
      trailingMain = widget.filter!;
    else if (widget.selected.isNotEmpty)
      trailingMain = IconButton(
        tooltip: context.l10n.delete,
        icon: const Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(context.l10n.confirmDelete),
                content: Text(
                  context.l10n.confirmDeleteRecords(widget.selected.length),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(context.l10n.cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text(context.l10n.delete),
                    onPressed: () {
                      Navigator.pop(context);
                      widget.onDelete();
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    else
      trailingMain = const SizedBox.shrink(key: ValueKey('emptyWidget'));

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: SearchBar(
            hintText: context.l10n.search,
            controller: widget.ctrl,
            padding: WidgetStateProperty.all(
              const EdgeInsets.only(right: 8.0),
            ),
            textCapitalization: TextCapitalization.sentences,
            onChanged: widget.onChange,
            leading: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child:
                  widget.selected.isEmpty && widget.ctrl?.text.isEmpty == true
                      ? const Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 8.0),
                          child: Icon(Icons.search),
                        )
                      : IconButton(
                          onPressed: () {
                            widget.onClear();
                            widget.ctrl?.text = '';
                            widget.onChange('');
                          },
                          icon: const Icon(Icons.arrow_back),
                          tooltip: context.l10n.clear,
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 8.0,
                          ),
                        ),
            ),
            trailing: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: trailingMain,
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
              ),
              Badge.count(
                backgroundColor: Theme.of(context).colorScheme.primary,
                count: widget.selected.length,
                isLabelVisible: widget.selected.isNotEmpty,
                child: Builder(
                  builder: (BuildContext badgeContext) {
                    return IconButton(
                      icon: const Icon(Icons.more_vert),
                      tooltip: context.l10n.showMenu,
                      onPressed: () async {
                        final RenderBox button =
                            badgeContext.findRenderObject() as RenderBox;
                        final RenderBox overlay = Navigator.of(context)
                            .overlay!
                            .context
                            .findRenderObject() as RenderBox;
                        final RelativeRect position = RelativeRect.fromRect(
                          Rect.fromPoints(
                            button.localToGlobal(
                              Offset.zero,
                              ancestor: overlay,
                            ),
                            button.localToGlobal(
                              button.size.bottomRight(Offset.zero),
                              ancestor: overlay,
                            ),
                          ),
                          Offset.zero & overlay.size,
                        );

                        await showMenu(
                          context: context,
                          position: position,
                          items: [
                            PopupMenuItem(
                              child: ListTile(
                                leading: const Icon(Icons.done_all),
                                title: Text(context.l10n.selectAll),
                                onTap: () {
                                  Navigator.pop(context);
                                  widget.onSelect();
                                },
                              ),
                            ),
                            if (widget.selected.isEmpty) ...[
                              PopupMenuItem(
                                child: ListTile(
                                  leading: const Icon(Icons.settings),
                                  title: Text(context.l10n.settings),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context, rootNavigator: true)
                                        .push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SettingsPage(),
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
                                  title: Text(context.l10n.edit),
                                  onTap: () {
                                    Navigator.pop(context);
                                    widget.onEdit();
                                  },
                                ),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                  leading: const Icon(Icons.favorite_outline),
                                  title: Text(context.l10n.favorite),
                                  onTap: () {
                                    Navigator.pop(context);
                                    widget.onFavorite();
                                  },
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
