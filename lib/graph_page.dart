import 'package:fit_book/app_line.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/graph_state.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  createState() => GraphPageState();
}

class GraphPageState extends State<GraphPage> {
  Future<void> _selectEnd(GraphState state) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: state.endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) state.setEndDate(pickedDate.toLocal());
  }

  Future<void> _selectStart(GraphState state) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: state.startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) state.setStartDate(pickedDate.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();
    final state = context.watch<GraphState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Metric'),
              value: state.metric,
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
                state.setMetric(value!);
              },
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Group by'),
              value: state.groupBy,
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
                state.setGroupBy(value!);
              },
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Start date'),
                    subtitle: state.startDate != null
                        ? Text(
                            DateFormat(settings.shortDateFormat)
                                .format(state.startDate!),
                          )
                        : null,
                    onLongPress: () => state.setStartDate(null),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selectStart(state),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Stop date'),
                    subtitle: state.endDate != null
                        ? Text(
                            DateFormat(settings.shortDateFormat)
                                .format(state.endDate!),
                          )
                        : null,
                    onLongPress: () => state.setEndDate(null),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selectEnd(state),
                  ),
                ),
              ],
            ),
            AppLine(
              metric: state.metric,
              groupBy: state.groupBy,
              startDate: state.startDate,
              endDate: state.endDate,
            ),
          ],
        ),
      ),
    );
  }
}
