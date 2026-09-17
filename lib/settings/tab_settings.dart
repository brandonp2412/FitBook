// ignore_for_file: deprecated_member_use
import 'package:drift/drift.dart' hide Column;
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

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.tabs)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
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
            Expanded(
              child: ReorderableListView.builder(
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
                  if (tab.name == 'DiaryPage') {
                    return ListTile(
                      key: Key(tab.name),
                      onTap: () => setTab(tab.name, !tab.enabled),
                      leading: Switch(
                        value: tab.enabled,
                        onChanged: (value) => setTab(tab.name, value),
                      ),
                      title: Row(
                        children: [
                          const Icon(Icons.date_range),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(context.l10n.diary),
                          ),
                        ],
                      ),
                      trailing: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.drag_handle),
                      ),
                    );
                  } else if (tab.name == 'GraphPage') {
                    return ListTile(
                      key: Key(tab.name),
                      onTap: () => setTab(tab.name, !tab.enabled),
                      leading: Switch(
                        value: tab.enabled,
                        onChanged: (value) => setTab(tab.name, value),
                      ),
                      title: Row(
                        children: [
                          const Icon(Icons.insights),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(context.l10n.navGraph),
                          ),
                        ],
                      ),
                      trailing: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.drag_handle),
                      ),
                    );
                  } else if (tab.name == 'FoodPage') {
                    return ListTile(
                      key: Key(tab.name),
                      onTap: () => setTab(tab.name, !tab.enabled),
                      leading: Switch(
                        value: tab.enabled,
                        onChanged: (value) => setTab(tab.name, value),
                      ),
                      title: Row(
                        children: [
                          const Icon(Icons.restaurant),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(context.l10n.food),
                          ),
                        ],
                      ),
                      trailing: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.drag_handle),
                      ),
                    );
                  } else if (tab.name == 'WeightPage') {
                    return ListTile(
                      key: Key(tab.name),
                      onTap: () => setTab(tab.name, !tab.enabled),
                      leading: Switch(
                        value: tab.enabled,
                        onChanged: (value) => setTab(tab.name, value),
                      ),
                      title: Row(
                        children: [
                          const Icon(Icons.scale),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(context.l10n.weight),
                          ),
                        ],
                      ),
                      trailing: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.drag_handle),
                      ),
                    );
                  } else
                    return ErrorWidget(context.l10n.invalidTabSettings);
                },
                itemCount: tabs.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await (db.settings.update().write(
                SettingsCompanion(
                  tabs: Value(
                    tabs
                        .where((tab) => tab.enabled)
                        .map((tab) => tab.name)
                        .join(','),
                  ),
                ),
              ));
          if (context.mounted) Navigator.of(context).pop();
        },
        icon: const Icon(Icons.save),
        label: Text(context.l10n.save),
      ),
    );
  }
}
