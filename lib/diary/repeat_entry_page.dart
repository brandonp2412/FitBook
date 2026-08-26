import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:flutter/material.dart';

/// Configures future copies of a food or meal diary entry.
class RepeatEntryPage extends StatefulWidget {
  const RepeatEntryPage({
    super.key,
    required this.foodId,
    required this.mealId,
    required this.quantity,
    required this.unit,
    required this.initialDate,
  });

  final int? foodId;
  final int? mealId;
  final double quantity;
  final String unit;
  final DateTime initialDate;

  @override
  State<RepeatEntryPage> createState() => _RepeatEntryPageState();
}

class _RepeatEntryPageState extends State<RepeatEntryPage> {
  late DateTime _startDate;
  late TimeOfDay _time;
  bool _everyDay = true;
  late Set<int> _weekdays;

  @override
  void initState() {
    super.initState();
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    _startDate = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
    _time = TimeOfDay.fromDateTime(widget.initialDate);
    _weekdays = {widget.initialDate.weekday};
  }

  Future<void> _save() async {
    final lastDate = _startDate.add(const Duration(days: 365));
    final existing = await (db.diaries.select()
          ..where(
            (entry) => widget.foodId != null
                ? entry.food.equals(widget.foodId!)
                : entry.meal.equals(widget.mealId!),
          )
          ..where((entry) => entry.created.isBiggerOrEqualValue(_startDate))
          ..where((entry) => entry.created.isSmallerThanValue(lastDate)))
        .get();
    final existingDates = existing
        .map(
          (entry) =>
              '${entry.created.year}-${entry.created.month}-${entry.created.day}-${entry.created.hour}-${entry.created.minute}',
        )
        .toSet();

    final entries = <DiariesCompanion>[];
    for (var date = _startDate;
        date.isBefore(lastDate);
        date = date.add(const Duration(days: 1))) {
      if (!_everyDay && !_weekdays.contains(date.weekday)) continue;
      final scheduled = DateTime(
        date.year,
        date.month,
        date.day,
        _time.hour,
        _time.minute,
      );
      final key =
          '${scheduled.year}-${scheduled.month}-${scheduled.day}-${scheduled.hour}-${scheduled.minute}';
      if (existingDates.contains(key)) continue;
      entries.add(
        DiariesCompanion.insert(
          food:
              widget.foodId == null ? const Value(null) : Value(widget.foodId!),
          meal:
              widget.mealId == null ? const Value(null) : Value(widget.mealId!),
          created: scheduled,
          quantity: widget.quantity,
          unit: widget.unit,
        ),
      );
    }
    if (entries.isNotEmpty) await db.diaries.insertAll(entries);
    if (!mounted) return;
    Navigator.pop(context, entries.length);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Repeat entry')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Start date'),
              subtitle: Text(
                MaterialLocalizations.of(context).formatMediumDate(_startDate),
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _startDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (date != null) setState(() => _startDate = date);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Time of day'),
              subtitle: Text(_time.format(context)),
              onTap: () async {
                final time =
                    await showTimePicker(context: context, initialTime: _time);
                if (time != null) setState(() => _time = time);
              },
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Every day'),
              subtitle:
                  const Text('Create this entry each day for the next year'),
              value: _everyDay,
              onChanged: (value) => setState(() => _everyDay = value),
            ),
            if (!_everyDay) ...[
              const SizedBox(height: 8),
              const Text('Repeat on'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: List.generate(7, (index) {
                  final weekday = index + 1;
                  const labels = [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun',
                  ];
                  return FilterChip(
                    label: Text(labels[index]),
                    selected: _weekdays.contains(weekday),
                    onSelected: (selected) => setState(() {
                      if (selected)
                        _weekdays.add(weekday);
                      else
                        _weekdays.remove(weekday);
                    }),
                  );
                }),
              ),
            ],
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: !_everyDay && _weekdays.isEmpty ? null : _save,
          icon: const Icon(Icons.repeat),
          label: const Text('Schedule'),
        ),
      );
}
