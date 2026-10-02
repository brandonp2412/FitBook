// ignore_for_file: deprecated_member_use
import 'package:drift/drift.dart' hide Column;
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabSettings extends StatefulWidget {
  const TabSettings({super.key});

  @override
  State<TabSettings> createState() => _TabSettingsState();
}

typedef TabSetting = ({
  String name,
  bool enabled,
});

class _TabSettingsState extends State<TabSettings> {
  List<TabSetting> tabs = [
    (name: 'DiaryPage', enabled: false),
    (name: 'GraphPage', enabled: false),
    (name: 'FoodPage', enabled: false),
    (name: 'WeightPage', enabled: false),
  ];

  @override
  void initState() {
    super.initState();
    final settings = context.read<SettingsState>();
    final tabSplit = settings.value.tabs.split(',');

    final enabledTabs =
        tabSplit.map((tab) => (name: tab, enabled: true)).toList();
    final disabledTabs =
        tabs.where((tab) => !tabSplit.contains(tab.name)).toList();

    tabs = enabledTabs + disabledTabs;
  }

  void setTab(String name, bool enabled) {
    if (!enabled && tabs.where((tab) => tab.enabled == true).length == 1)
      return toast(context, context.l10n.atLeastOneTab);
    final index = tabs.indexWhere((tappedTab) => tappedTab.name == name);
    setState(() {
      tabs[index] = (name: name, enabled: enabled);
    });
  }

  Future<void> _save() async {
    await db.settings.update().write(
          SettingsCompanion(
            tabs: Value(
              tabs.where((tab) => tab.enabled).map((tab) => tab.name).join(','),
            ),
          ),
        );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;
    final desktop = usesSideNavigation(context);

    final content = Column(
      children: [
        SwitchListTile(
          title: Text(context.l10n.scrollableTabs),
          value: settings.scrollableTabs,
          onChanged: (value) {
            db.settings.update().write(
                  SettingsCompanion(
                    scrollableTabs: Value(value),
                  ),
                );
          },
        ),
        const Divider(height: 1),
        Expanded(
          child: ReorderableListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            onReorder: (oldIndex, newIndex) {
              if (oldIndex < newIndex) {
                newIndex--;
              }

              final temp = tabs[oldIndex];
              setState(() {
                tabs.removeAt(oldIndex);
                tabs.insert(newIndex, temp);
              });
            },
            itemBuilder: (context, index) {
              final tab = tabs[index];
              final (icon, label) = switch (tab.name) {
                'DiaryPage' => (Icons.date_range, context.l10n.diary),
                'GraphPage' => (Icons.insights, context.l10n.navGraph),
                'FoodPage' => (Icons.restaurant, context.l10n.food),
                'WeightPage' => (Icons.scale, context.l10n.weight),
                _ => (Icons.error, context.l10n.invalidTabSettings),
              };

              return ListTile(
                key: Key(tab.name),
                onTap: () => setTab(tab.name, !tab.enabled),
                leading: Switch(
                  value: tab.enabled,
                  onChanged: (value) => setTab(tab.name, value),
                ),
                title: Row(
                  children: [
                    Icon(icon),
                    const SizedBox(width: 12),
                    Text(label),
                  ],
                ),
                trailing: ReorderableDragStartListener(
                  index: index,
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.grab,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.drag_handle),
                    ),
                  ),
                ),
              );
            },
            itemCount: tabs.length,
          ),
        ),
        if (desktop)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save_outlined),
                label: Text(context.l10n.save),
              ),
            ),
          ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.tabs)),
      body: AdaptivePageBody(
        maxWidth: 900,
        child: Padding(
          padding: EdgeInsets.all(desktop ? 24 : 8),
          child: desktop
              ? Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  child: content,
                )
              : content,
        ),
      ),
      floatingActionButton: desktop
          ? null
          : FloatingActionButton.extended(
              onPressed: _save,
              icon: const Icon(Icons.save),
              label: Text(context.l10n.save),
            ),
    );
  }
}
