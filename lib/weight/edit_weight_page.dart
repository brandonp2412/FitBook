import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart' as drift;
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

/// Persists [amount]/[unit] for [original], inserting when it has no id and
/// updating otherwise, applying the kg/lb conversion implied by [convertTo].
///
/// Also runs the auto-calculated macro targets and positive-reinforcement
/// toast so every entry point (quick add and the full editor) behaves the same.
void saveWeight(
  BuildContext context, {
  required WeightsCompanion original,
  required double amount,
  required String unit,
  String? convertTo,
  DateTime? created,
  String? image,
}) {
  convertTo ??= unit;
  if (unit == 'kg' && convertTo == 'lb') {
    amount *= 2.20462262185;
    unit = 'lb';
  }
  if (unit == 'lb' && convertTo == 'kg') {
    amount /= 2.20462262185;
    unit = 'kg';
  }

  if (original.id.present)
    (db.weights.update()..where((u) => u.id.equals(original.id.value))).write(
      WeightsCompanion(
        unit: drift.Value(unit),
        amount: drift.Value(amount),
        created: drift.Value(created ?? original.created.value),
        image: drift.Value(image),
      ),
    );
  else
    db.weights.insertOne(
      WeightsCompanion.insert(
        created: DateTime.now(),
        unit: unit,
        amount: amount,
        image: drift.Value(image),
      ),
    );

  final settings = context.read<SettingsState>().value;
  if (settings.autoCalc) {
    final macros = getMacros(amount, unit);
    db.settings.update().write(
          SettingsCompanion(
            dailyCalories: drift.Value(macros.calories.toInt()),
            dailyCarb: drift.Value(macros.carb.toInt()),
            dailyFat: drift.Value(macros.fat.toInt()),
            dailyProtein: drift.Value(macros.protein.toInt()),
          ),
        );
  }

  if (settings.targetWeight == null) return;
  if (!settings.positiveReinforcement) return;
  final show =
      shouldNotify(amount, original.amount.value, settings.targetWeight!);
  if (!show) return;
  final random = Random();
  final message =
      positiveReinforcements[random.nextInt(positiveReinforcements.length)];

  toast(context, message);
}

/// Pushes the full [EditWeightPage] editor as a page route.
///
/// Unlike [showQuickAddWeight], the field is not focused automatically; the user
/// opts into each field they want to change. Reached by tapping an existing
/// weight or the expand action of the quick-add sheet.
Future<void> showEditWeight(
  BuildContext context,
  WeightsCompanion weight, {
  String? initialValue,
}) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditWeightPage(
        weight: weight,
        initialValue: initialValue,
      ),
    ),
  );
}

/// Shows a compact [QuickAddWeight] sheet that logs a new weight from a single
/// field, then hands off to the full [showEditWeight] editor if the user taps
/// expand (carrying whatever they typed across).
Future<void> showQuickAddWeight(
  BuildContext context,
  WeightsCompanion weight,
) async {
  final result = await showModalBottomSheet<({String value, bool expand})>(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) => QuickAddWeight(weight: weight),
  );
  if (result == null || !context.mounted) return;

  if (result.expand)
    await showEditWeight(context, weight, initialValue: result.value);
  else
    saveWeight(
      context,
      original: weight,
      amount: double.parse(result.value),
      unit: weight.unit.value,
    );
}

/// A single-field bottom sheet for logging a weight quickly.
///
/// Submitting the field (enter) pops with `expand: false` and the typed value;
/// the expand action pops with `expand: true` so the caller can open the full
/// editor. Validation happens here so the caller only ever sees a parseable
/// value.
class QuickAddWeight extends StatefulWidget {
  final WeightsCompanion weight;

  const QuickAddWeight({
    super.key,
    required this.weight,
  });

  @override
  State<QuickAddWeight> createState() => _QuickAddWeightState();
}

class _QuickAddWeightState extends State<QuickAddWeight> {
  final TextEditingController valueController = TextEditingController();
  final FocusNode _valueFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _valueFocusNode.requestFocus(),
    );
  }

  @override
  void dispose() {
    valueController.dispose();
    _valueFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    if (double.tryParse(valueController.text) == null) return;
    Navigator.pop(context, (value: valueController.text, expand: false));
  }

  void _expand() {
    Navigator.pop(context, (value: valueController.text, expand: true));
  }

  @override
  Widget build(BuildContext context) {
    final unit = widget.weight.unit.value;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: TextField(
          controller: valueController,
          focusNode: _valueFocusNode,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _submit(),
          decoration: InputDecoration(
            labelText: 'Weight ($unit)',
            suffixIcon: IconButton(
              icon: const Icon(Icons.tune),
              tooltip: 'More options',
              onPressed: _expand,
            ),
          ),
        ),
      ),
    );
  }
}

class EditWeightPage extends StatefulWidget {
  final WeightsCompanion weight;
  final String? initialValue;

  const EditWeightPage({
    super.key,
    required this.weight,
    this.initialValue,
  });

  @override
  State<EditWeightPage> createState() => _EditWeightPageState();
}

class _EditWeightPageState extends State<EditWeightPage> {
  final TextEditingController valueController = TextEditingController();

  String unit = 'kg';
  String convertTo = 'kg';
  String? image;
  DateTime created = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectAll(valueController);
    unit = widget.weight.unit.value;
    convertTo = widget.weight.unit.value;
    created = widget.weight.created.value;
    image = widget.weight.image.value;

    if (widget.weight.id.present)
      valueController.text = widget.weight.amount.value.toStringAsFixed(2);
    else if (widget.initialValue != null)
      valueController.text = widget.initialValue!;
  }

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: created,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _selectTime(pickedDate);
    }
  }

  Future<void> _selectTime(DateTime pickedDate) async {
    final settings = context.read<SettingsState>().value;
    if (!settings.longDateFormat.contains('h:mm') &&
        !settings.longDateFormat.contains('H:mm'))
      return setState(() {
        created = pickedDate;
      });

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(created),
    );

    if (pickedTime != null) {
      setState(() {
        created = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  void save() {
    Navigator.of(context).pop();
    saveWeight(
      context,
      original: widget.weight,
      amount: double.parse(valueController.text),
      unit: unit,
      convertTo: convertTo,
      created: created,
      image: image,
    );
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.pickFiles(type: FileType.image);
    final path = result?.files.single.path;
    if (path == null) return;
    final docsDir = (await getApplicationDocumentsDirectory()).path;
    final fileName = 'weight_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final destPath = '$docsDir/$fileName';
    await File(path).copy(destPath);
    setState(() {
      image = destPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.weight.id.present ? "Edit weight" : "Add weight"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              SharePlus.instance.share(
                ShareParams(
                  text: "I just weighed ${valueController.text} $unit!",
                ),
              );
            },
          ),
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextFormField(
                controller: valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Weight ($unit)'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter weight' : null,
                onTap: () => selectAll(valueController),
                onFieldSubmitted: (value) => save(),
              ),
              TextFormField(
                controller: TextEditingController(
                  text:
                      "${widget.weight.amount.value.toStringAsFixed(2)} ${widget.weight.unit.value}",
                ),
                decoration: const InputDecoration(labelText: 'Last weight'),
                enabled: false,
              ),
              const SizedBox(height: 8.0),
              ListTile(
                title: Text("Unit ($unit)"),
                leading: unit == 'kg'
                    ? const Icon(Icons.straighten)
                    : const Icon(Icons.square_foot),
                onTap: () => setState(() {
                  unit = unit == 'kg' ? 'lb' : 'kg';
                  convertTo = unit;
                }),
                trailing: Switch(
                  value: unit == 'kg',
                  onChanged: (value) => setState(() {
                    if (value)
                      unit = 'kg';
                    else
                      unit = 'lb';
                    convertTo = unit;
                  }),
                ),
              ),
              ListTile(
                title: convertTo == unit
                    ? Text("Keep unit as $unit")
                    : Text("Convert to $convertTo"),
                leading: const Icon(Icons.conveyor_belt),
                onTap: () {
                  setState(() {
                    convertTo = convertTo == 'kg' ? 'lb' : 'kg';
                  });
                  db.settings.update().write(
                        SettingsCompanion(
                          convertWeight: drift.Value(convertTo),
                        ),
                      );
                },
                trailing: Switch(
                  value: convertTo == 'kg',
                  onChanged: (value) {
                    setState(() {
                      if (value)
                        convertTo = 'kg';
                      else
                        convertTo = 'lb';
                    });

                    db.settings.update().write(
                          SettingsCompanion(
                            convertWeight: drift.Value(convertTo),
                          ),
                        );
                  },
                ),
              ),
              ListTile(
                title: const Text('Created Date'),
                subtitle: Selector<SettingsState, String>(
                  selector: (p0, settings) => settings.value.longDateFormat,
                  builder: (context, longDateFormat, child) =>
                      Text(DateFormat(longDateFormat).format(created)),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(),
              ),
              if (image?.isNotEmpty == true && settings.showImages)
                SizedBox(
                  height: 200,
                  child: Image.file(
                    File(image!),
                    errorBuilder: (context, error, stackTrace) =>
                        TextButton.icon(
                      onPressed: () {},
                      label: const Text('Image error'),
                      icon: const Icon(Icons.error),
                    ),
                  ),
                ),
              if (settings.showImages) ...[
                const SizedBox(height: 8),
                TextButton.icon(
                  icon: const Icon(Icons.image),
                  label: const Text('Set image'),
                  onPressed: _pickImage,
                ),
              ],
              if (image != null && settings.showImages)
                TextButton.icon(
                  icon: const Icon(Icons.delete),
                  label: const Text("Remove image"),
                  onPressed: () => setState(() {
                    image = null;
                  }),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.paddingOf(context).bottom +
              BottomNav.totalOverlayHeight,
        ),
        child: AnimatedFab(
          onTap: save,
          label: "Save",
          icon: Icons.save,
          scroll: ScrollController(),
        ),
      ),
    );
  }
}
