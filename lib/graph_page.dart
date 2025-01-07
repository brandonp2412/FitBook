import 'package:drift/drift.dart';
import 'package:fit_book/app_line.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
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
  AppMetric metric = AppMetric.calories;
  Period groupBy = Period.day;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    final settings = context.read<SettingsState>();
    if (settings.value.lastGraph == 'AppMetric.calories') return;

    setState(() {
      metric = AppMetric.values
          .firstWhere((m) => m.toString() == settings.value.lastGraph);
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final settings = context.watch<SettingsState>().value;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Metric'),
              value: metric,
              items: const [
                DropdownMenuItem(
                  value: AppMetric.calories,
                  child: Text("Calories"),
                ),
                DropdownMenuItem(
                  value: AppMetric.protein,
                  child: Text("Protein"),
                ),
                DropdownMenuItem(
                  value: AppMetric.fat,
                  child: Text("Fat"),
                ),
                DropdownMenuItem(
                  value: AppMetric.carbs,
                  child: Text("Carbs"),
                ),
                DropdownMenuItem(
                  value: AppMetric.bodyWeight,
                  child: Text("Body weight"),
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
            DropdownButtonFormField(
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
            AppLine(
              metric: metric,
              groupBy: groupBy,
              startDate: startDate,
              endDate: endDate,
            ),
          ],
        ),
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
