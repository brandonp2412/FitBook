import 'package:drift/drift.dart';
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/logging.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'database/database.dart';

double? parseQuickAddNumber(String text, NumberFormat formatter) {
  final value = text.trim();
  if (value.isEmpty) return null;
  try {
    return formatter.parse(value).toDouble();
  } on FormatException {
    return null;
  }
}

class QuickAddPage extends StatefulWidget {
  final int? id;

  const QuickAddPage({super.key, this.id});

  @override
  State<QuickAddPage> createState() => _QuickAddPageState();
}

class _QuickAddPageState extends State<QuickAddPage> {
  final cal = TextEditingController(text: "600");
  var created = DateTime.now();
  final kj = TextEditingController();
  final protein = TextEditingController(text: "0");
  final carb = TextEditingController(text: "0");
  final fat = TextEditingController(text: "0");
  late final String localeName;
  late final NumberFormat formatter;

  String _formatNumber(num value, {int minimumFractionDigits = 0}) =>
      (NumberFormat.decimalPattern(localeName)
            ..minimumFractionDigits = minimumFractionDigits
            ..maximumFractionDigits = 2)
          .format(value);

  @override
  void initState() {
    super.initState();
    final settings = context.read<SettingsState>().value;
    localeName = localizationsFromPreference(settings.locale).localeName;
    formatter = NumberFormat.decimalPattern(localeName)
      ..maximumFractionDigits = 2;
    kj.text = _formatNumber(600 * 4.184);
    initData();
  }

  void initData() async {
    if (widget.id == null) {
      final last = await (db.diaries.selectOnly().join(
        [innerJoin(db.foods, db.diaries.food.equalsExp(db.foods.id))],
      )
            ..addColumns(
              [
                db.foods.calories,
                db.foods.proteinG,
                db.foods.carbohydrateG,
                db.foods.fatG,
              ],
            )
            ..where(db.foods.name.equals('Quick-add'))
            ..orderBy([
              OrderingTerm(
                expression: db.diaries.created,
                mode: OrderingMode.desc,
              ),
            ])
            ..limit(1))
          .getSingleOrNull();
      if (last == null) return;
      cal.text = _formatNumber(last.read(db.foods.calories)!);
      kj.text = _formatNumber(formatter.parse(cal.text) * 4.184);
      protein.text = _formatNumber(last.read(db.foods.proteinG)!);
      carb.text = _formatNumber(last.read(db.foods.carbohydrateG)!);
      fat.text = _formatNumber(last.read(db.foods.fatG)!);

      return;
    }

    final entry = await (db.diaries.select()
          ..where((u) => u.id.equals(widget.id!)))
        .getSingle();
    final food = await (db.foods.select()
          ..where((u) => u.id.equals(entry.food ?? 0)))
        .getSingle();
    cal.text = food.calories != null
        ? _formatNumber(food.calories!, minimumFractionDigits: 2)
        : "0";
    protein.text = food.proteinG != null
        ? _formatNumber(food.proteinG!, minimumFractionDigits: 2)
        : "0";
    carb.text = food.carbohydrateG != null
        ? _formatNumber(food.carbohydrateG!, minimumFractionDigits: 2)
        : "0";
    fat.text = food.fatG != null
        ? _formatNumber(food.fatG!, minimumFractionDigits: 2)
        : "0";
    setState(() {
      created = entry.created;
    });
    selectAll(cal);
  }

  Future<void> save() async {
    final calories = parseQuickAddNumber(cal.text, formatter);
    final proteinG = parseQuickAddNumber(protein.text, formatter);
    final carbohydrateG = parseQuickAddNumber(carb.text, formatter);
    final fatG = parseQuickAddNumber(fat.text, formatter);
    if (calories == null ||
        proteinG == null ||
        carbohydrateG == null ||
        fatG == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.enterValidNutritionValues)),
      );
      return;
    }

    Navigator.pop(context);
    final foodId = await (db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Quick-add',
        created: Value(created),
        calories: Value(calories),
        proteinG: Value(proteinG),
        carbohydrateG: Value(carbohydrateG),
        fatG: Value(fatG),
        servingSize: Value(1.0),
        servingUnit: Value('serving'),
      ),
    ));

    final qty = 1.0;
    if (widget.id == null)
      db.into(db.diaries).insert(
            DiariesCompanion.insert(
              food: Value(foodId),
              created: created,
              quantity: qty,
              unit: 'serving',
            ),
          );
    else
      db.diaries.update()
        ..where((u) => u.id.equals(widget.id!))
        ..write(
          DiariesCompanion(
            food: Value(foodId),
            created: Value(created),
            quantity: Value(qty),
            unit: Value('serving'),
          ),
        );
    talker.info('Saved quick-add diary entry');
  }

  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: created,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      pickTime(pickedDate);
    }
  }

  Future<void> pickTime(DateTime pickedDate) async {
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

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.quickAddTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            autofocus: true,
            controller: cal,
            decoration: InputDecoration(label: Text(context.l10n.calories)),
            keyboardType: TextInputType.number,
            onTap: () => selectAll(cal),
            onSubmitted: (value) => save(),
            onChanged: (value) {
              final calories = parseQuickAddNumber(value, formatter);
              if (calories == null) return;
              setState(() {
                kj.text = _formatNumber(calories * 4.184);
              });
            },
          ),
          const SizedBox(height: 8),
          TextField(
            controller: kj,
            decoration: InputDecoration(
              labelText: context.l10n.kilojoules,
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) {
              final kilojoules = parseQuickAddNumber(value, formatter);
              if (kilojoules == null) return;
              setState(() {
                cal.text = _formatNumber(kilojoules / 4.184);
              });
            },
            onSubmitted: (value) => selectAll(protein),
            onTap: () => selectAll(kj),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: protein,
            decoration: InputDecoration(
              labelText: context.l10n.protein,
            ),
            onTap: () => selectAll(protein),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (value) => selectAll(carb),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: carb,
            decoration: InputDecoration(
              labelText: context.l10n.carbs,
            ),
            onTap: () => selectAll(carb),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            onSubmitted: (value) => selectAll(fat),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: fat,
            decoration: InputDecoration(
              labelText: context.l10n.fat,
            ),
            onTap: () => selectAll(fat),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (value) => save(),
          ),
          ListTile(
            title: Text(context.l10n.createdDate),
            subtitle: Text(
              formatDisplayDate(
                context,
                created,
                settings.longDateFormat,
              ),
            ),
            onTap: () => pickDate(),
          ),
          SizedBox(height: navigationBottomClearance(context)),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: navigationBottomClearance(context),
        ),
        child: AnimatedFab(
          onTap: save,
          label: context.l10n.save,
          icon: Icons.save,
          scroll: ScrollController(),
        ),
      ),
    );
  }
}
