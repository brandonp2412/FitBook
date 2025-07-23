import 'package:drift/drift.dart';
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/app_line.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/database/settings.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/fields_picker.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  createState() => GraphPageState();
}

class GraphPageState extends State<GraphPage>
    with AutomaticKeepAliveClientMixin {
  String metric = 'calories';
  Period groupBy = Period.day;
  DateTime? startDate;
  DateTime? endDate;

  final ScrollController scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    final settings = context.read<SettingsState>().value;

    final fields = settings.fields?.split(',') ?? defaultFields;
    fields.add('calories');
    fields.add('body-weight');
    if (fields.contains(settings.lastGraph))
      setState(() {
        metric = settings.lastGraph;
      });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final settings = context.watch<SettingsState>().value;
    final fields =
        settings.fields?.split(',').where((field) => field.isNotEmpty) ??
            defaultFields;
    final filteredFields =
        fields.where((field) => !excludedFields.contains(field));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          controller: scrollCtrl,
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Metric'),
              value: filteredFields.contains(metric) ||
                      metric == 'calories' ||
                      metric == 'body-weight'
                  ? metric
                  : null,
              items: [
                DropdownMenuItem(
                  value: db.foods.calories.name,
                  child: Text("Calories"),
                ),
                DropdownMenuItem(
                  value: 'body-weight',
                  child: Text("Body weight"),
                ),
                ...filteredFields.map(
                  (field) => DropdownMenuItem(
                    value: field,
                    child: Text(
                      sentenceCase(field),
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  metric = value!;
                });
                db.settings.update().write(
                      SettingsCompanion(
                        lastGraph: Value(metric.toString()),
                      ),
                    );
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Group by'),
                value: groupBy,
                items: const [
                  DropdownMenuItem(
                    value: Period.day,
                    child: Text("Day"),
                  ),
                  DropdownMenuItem(
                    value: Period.week,
                    child: Text("Week"),
                  ),
                  DropdownMenuItem(
                    value: Period.month,
                    child: Text("Month"),
                  ),
                  DropdownMenuItem(
                    value: Period.year,
                    child: Text("Year"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    groupBy = value!;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Start date'),
                    subtitle: startDate != null
                        ? Text(
                            DateFormat(settings.shortDateFormat)
                                .format(startDate!),
                          )
                        : Text(
                            settings.shortDateFormat,
                          ),
                    onLongPress: () => setState(() {
                      startDate = null;
                    }),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selectStart(),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Stop date'),
                    subtitle: endDate != null
                        ? Text(
                            DateFormat(settings.shortDateFormat)
                                .format(endDate!),
                          )
                        : Text(settings.shortDateFormat),
                    onLongPress: () => setState(() {
                      endDate = null;
                    }),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selectEnd(),
                  ),
                ),
              ],
            ),
            material.Column(
              children: [
                material.Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Limit (${settings.limit})",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Slider(
                  value: settings.limit.toDouble(),
                  inactiveColor: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.24),
                  min: 10,
                  max: 100,
                  onChanged: (value) {
                    db.settings.update().write(
                          SettingsCompanion(
                            limit: Value(value.toInt()),
                          ),
                        );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            AppLine(
              metric: metric,
              groupBy: groupBy,
              startDate: startDate,
              endDate: endDate,
            ),
            const SizedBox(height: 72),
          ],
        ),
      ),
      floatingActionButton: AnimatedFab(
        onTap: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FieldsPicker(),
                ),
              )
              .then((_) => setState(() {}));
        },
        label: "Fields",
        icon: Icons.settings,
        scroll: scrollCtrl,
      ),
    );
  }

  Future<void> _selectEnd() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null)
      setState(() {
        endDate = pickedDate.toLocal();
      });
  }

  Future<void> _selectStart() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null)
      setState(() {
        startDate = pickedDate.toLocal();
      });
  }
}
