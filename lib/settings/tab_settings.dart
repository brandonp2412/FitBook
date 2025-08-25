import 'package:drift/drift.dart' hide Column;
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabSettings extends StatefulWidget {
  const TabSettings({super.key});

  @override
  createState() => _TabSettingsState();
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

  setTab(String name, bool enabled) {
    if (!enabled && tabs.where((tab) => tab.enabled == true).length == 1)
      return toast(context, 'You need at least one tab');
    final index = tabs.indexWhere((tappedTab) => tappedTab.name == name);
    setState(() {
      tabs[index] = (name: name, enabled: enabled);
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    return Scaffold(
      appBar: AppBar(title: const Text("Tabs")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text("Scrollable Tabs"),
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
                      title: const Row(
                        children: [
                          Icon(Icons.date_range),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Diary"),
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
                      title: const Row(
                        children: [
                          Icon(Icons.insights),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Graph"),
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
                      title: const Row(
                        children: [
                          Icon(Icons.restaurant),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Food"),
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
                      title: const Row(
                        children: [
                          Icon(Icons.scale),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Weight"),
                          ),
                        ],
                      ),
                      trailing: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.drag_handle),
                      ),
                    );
                  } else
                    return ErrorWidget("Invalid tab settings.");
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
        label: const Text("Save"),
      ),
    );
  }
}
