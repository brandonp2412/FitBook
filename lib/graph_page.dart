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
  State<GraphPage> createState() => GraphPageState();
}

class GraphPageState extends State<GraphPage>
    with AutomaticKeepAliveClientMixin {
  String metric = 'calories';
  Period groupBy = Period.day;
  DateTime? start;
  DateTime? end;

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = context.watch<SettingsState>().value;
    final fields =
        settings.fields?.split(',').where((field) => field.isNotEmpty) ??
            defaultFields;
    final filteredFields =
        fields.where((field) => !excludedFields.contains(field));

    return Scaffold(
      body: ListView(
        controller: scrollCtrl,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        children: [
          _SectionCard(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;

                final metricDropdown = DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Metric',
                    isDense: true,
                    filled: true,
                    fillColor: colorScheme.surface,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.outlineVariant),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  initialValue: filteredFields.contains(metric) ||
                          metric == 'calories' ||
                          metric == 'body-weight'
                      ? metric
                      : null,
                  borderRadius: BorderRadius.circular(12),
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
                        child: Text(sentenceCase(field)),
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
                );

                final groupByChips = SegmentedButton<Period>(
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
                    setState(() {
                      groupBy = value.first;
                    });
                  },
                );

                final startTile = _DateField(
                  label: 'Start date',
                  value: start,
                  hint: settings.shortDateFormat,
                  onTap: _selectStart,
                  onClear: () => setState(() => start = null),
                );

                final stopTile = _DateField(
                  label: 'Stop date',
                  value: end,
                  hint: settings.shortDateFormat,
                  onTap: _selectEnd,
                  onClear: () => setState(() => end = null),
                );

                final groupByLabel = Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Group by',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                );

                if (isWide) {
                  return material.Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: metricDropdown),
                          const SizedBox(width: 12),
                          Expanded(
                            child: material.Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                groupByLabel,
                                const SizedBox(height: 6),
                                groupByChips,
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: startTile),
                          const SizedBox(width: 12),
                          Expanded(child: stopTile),
                        ],
                      ),
                    ],
                  );
                }

                return material.Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    metricDropdown,
                    const SizedBox(height: 16),
                    groupByLabel,
                    const SizedBox(height: 6),
                    SizedBox(width: double.infinity, child: groupByChips),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: startTile),
                        const SizedBox(width: 12),
                        Expanded(child: stopTile),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          _SectionCard(
            child: material.Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Data points',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
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
                  inactiveColor: colorScheme.primary.withValues(alpha: 0.24),
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
          ),
          const SizedBox(height: 12),
          _SectionCard(
            child: AppLine(
              metric: metric,
              groupBy: groupBy,
              start: start,
              end: end,
            ),
          ),
        ],
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

/// A tonal surface card matching the app's card language, used to group the
/// graph controls and chart into distinct visual sections.
class _SectionCard extends StatelessWidget {
  final Widget child;

  const _SectionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
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
