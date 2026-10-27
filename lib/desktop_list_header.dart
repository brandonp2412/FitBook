import 'package:fit_book/l10n/l10n.dart';
import 'package:flutter/material.dart';

class DesktopListHeader extends StatelessWidget {
  const DesktopListHeader({
    super.key,
    required this.totalCount,
    required this.selectedCount,
    required this.onToggleAll,
  });

  final int totalCount;
  final int selectedCount;
  final VoidCallback onToggleAll;

  @override
  Widget build(BuildContext context) {
    final selection = selectedCount == 0
        ? false
        : selectedCount == totalCount
            ? true
            : null;
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: ListTile(
            key: const Key('desktop-select-all'),
            dense: true,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            title: Text(context.l10n.selectAll),
            trailing: Checkbox(
              tristate: true,
              value: selection,
              onChanged: (_) => onToggleAll(),
            ),
            onTap: onToggleAll,
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
