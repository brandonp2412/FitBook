import 'package:drift/drift.dart';
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
  State<GraphPage> createState() => GraphPageState();
}

class GraphPageState extends State<GraphPage>
    with AutomaticKeepAliveClientMixin {
  String metric = 'calories';
  Period groupBy = Period.day;
  DateTime? start;
  DateTime? end;

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = context.watch<SettingsState>().value;
    final fields =
        settings.fields?.split(',').where((field) => field.isNotEmpty) ??
            defaultFields;
    final filteredFields =
        fields.where((field) => !excludedFields.contains(field));

    final metricValue = filteredFields.contains(metric) ||
            metric == 'calories' ||
            metric == 'body-weight'
        ? metric
        : null;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: material.Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: metricValue,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(12),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                      items: [
                        DropdownMenuItem(
                          value: db.foods.calories.name,
                          child: const Text("Calories"),
                        ),
                        const DropdownMenuItem(
                          value: 'body-weight',
                          child: Text("Body weight"),
                        ),
                        ...filteredFields.map(
                          (field) => DropdownMenuItem(
                            value: field,
                            child: Text(sentenceCase(field)),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() => metric = value);
                        db.settings.update().write(
                              SettingsCompanion(lastGraph: Value(metric)),
                            );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filledTonal(
                  icon: const Icon(Icons.tune),
                  tooltip: 'Options',
                  onPressed: _showOptions,
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<Period>(
                showSelectedIcon: false,
                style: SegmentedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                ),
                segments: const [
                  ButtonSegment(value: Period.day, label: Text("Day")),
                  ButtonSegment(value: Period.week, label: Text("Week")),
                  ButtonSegment(value: Period.month, label: Text("Month")),
                  ButtonSegment(value: Period.year, label: Text("Year")),
                ],
                selected: {groupBy},
                onSelectionChanged: (value) {
                  setState(() => groupBy = value.first);
                },
              ),
            ),
            Expanded(
              child: AppLine(
                metric: metric,
                groupBy: groupBy,
                start: start,
                end: end,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOptions() {
    final pageContext = context;

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (sheetContext, setSheetState) {
            final theme = Theme.of(sheetContext);
            final colorScheme = theme.colorScheme;
            final settings = pageContext.read<SettingsState>().value;

            Widget label(String text) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    text,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                );

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: material.Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    label('Date range'),
                    Row(
                      children: [
                        Expanded(
                          child: _DateField(
                            label: 'Start date',
                            value: start,
                            hint: settings.shortDateFormat,
                            onTap: () async {
                              await _selectStart();
                              setSheetState(() {});
                            },
                            onClear: () {
                              setState(() => start = null);
                              setSheetState(() {});
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _DateField(
                            label: 'Stop date',
                            value: end,
                            hint: settings.shortDateFormat,
                            onTap: () async {
                              await _selectEnd();
                              setSheetState(() {});
                            },
                            onClear: () {
                              setState(() => end = null);
                              setSheetState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        label('Data points'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${settings.limit}',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: settings.limit.toDouble(),
                      inactiveColor:
                          colorScheme.primary.withValues(alpha: 0.24),
                      min: 10,
                      max: 100,
                      onChanged: (value) {
                        db.settings.update().write(
                              SettingsCompanion(limit: Value(value.toInt())),
                            );
                        setSheetState(() {});
                      },
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.tune),
                        label: const Text('Customize fields'),
                        onPressed: () {
                          Navigator.pop(sheetContext);
                          Navigator.of(pageContext)
                              .push(
                                MaterialPageRoute(
                                  builder: (context) => FieldsPicker(),
                                ),
                              )
                              .then((_) => setState(() {}));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _selectEnd() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: end,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null)
      setState(() {
        end = pickedDate.toLocal();
      });
  }

  Future<void> _selectStart() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: start,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null)
      setState(() {
        start = pickedDate.toLocal();
      });
  }
}

/// A tappable filled control that displays a labelled date, with the formatted
/// value or a placeholder hint. Long-press clears the date.
class _DateField extends StatelessWidget {
  final String label;
  final DateTime? value;
  final String hint;
  final VoidCallback onTap;
  final VoidCallback onClear;

  const _DateField({
    required this.label,
    required this.value,
    required this.hint,
    required this.onTap,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasValue = value != null;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      onLongPress: onClear,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              size: 18,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: material.Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    hasValue ? DateFormat(hint).format(value!) : hint,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: hasValue
                          ? colorScheme.onSurface
                          : colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                      fontWeight:
                          hasValue ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
