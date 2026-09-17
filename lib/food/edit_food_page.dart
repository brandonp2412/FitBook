import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:fit_book/animated_fab.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/food/edit_meal_page.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/logging.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/scan_barcode.dart';
import 'package:fit_book/search_open_food_facts.dart';
import 'package:fit_book/settings/fields_picker.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

class EditFoodPage extends StatefulWidget {
  final int? id;

  /// Called after a new food row is created (save-as or first-time add), so
  /// the caller can scroll the food list back to the top.
  final VoidCallback? onSavedNew;
  final String? initialBarcode;

  const EditFoodPage({
    super.key,
    this.id,
    this.onSavedNew,
    this.initialBarcode,
  });

  @override
  State<EditFoodPage> createState() => _EditFoodPageState();
}

class _EditFoodPageState extends State<EditFoodPage> {
  late Setting settings;
  late String unit;
  bool? _favorite;
  String? imgFile;
  String? smallImg;
  String? bigImg;
  DateTime? created;
  NumberFormat get formatter => NumberFormat.decimalPattern(
        Localizations.localeOf(context).toLanguageTag(),
      )..maximumFractionDigits = 2;

  String _formatControllerValue(Object? value) =>
      value is num ? formatter.format(value) : value?.toString() ?? '';
  final calCtrl = TextEditingController(text: "0");
  final barcodeCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final kjCtrl = TextEditingController(text: "0");
  final sizeCtrl = TextEditingController(text: "1");
  final nameFocusNode = FocusNode();
  late SettingsState settingsState;
  final scrollCtrl = ScrollController();

  Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    settingsState = context.read<SettingsState>();
    settings = settingsState.value;
    unit = settings.foodUnit;

    setCtrls();
    settingsState.addListener(setCtrls);
    if (unit == 'serving')
      sizeCtrl.text = '1';
    else if (unit == 'grams') sizeCtrl.text = '100';

    _favorite = settings.favoriteNew;

    if (widget.id == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) nameFocusNode.requestFocus();
      });
    }

    if (widget.initialBarcode != null) {
      barcodeCtrl.text = widget.initialBarcode!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) toast(context, context.l10n.barcodeNotFoundSaveToInsert);
      });
    }

    if (widget.id == null) return;

    (db.foods.select()..where((u) => u.id.equals(widget.id!)))
        .getSingle()
        .then((food) {
      for (final field in food.toColumns(true).entries)
        if (controllers.containsKey(field.key))
          controllers[field.key]!.text =
              _formatControllerValue((field.value as Variable).value);

      setState(() {
        barcodeCtrl.text = food.barcode ?? "";
        unit = food.servingUnit ?? unit;
        nameCtrl.text = food.name;
        imgFile = food.imageFile;
        smallImg = food.smallImage;
        bigImg = food.bigImage;
        created = food.created;
        calCtrl.text =
            food.calories == null ? '' : formatter.format(food.calories!);
        kjCtrl.text = food.calories == null
            ? ''
            : formatter.format(food.calories! * 4.184);
        sizeCtrl.text = food.servingSize == null
            ? '100'
            : formatter.format(food.servingSize!);
        _favorite = food.favorite;
      });
    });
  }

  void setCtrls() async {
    settings = context.read<SettingsState>().value;
    final fields = settings.fields == null
        ? db.foods.$columns.map((column) => column.name)
        : settings.fields!.split(',');

    final columns = widget.id == null
        ? <String, Expression<Object>>{}
        : (await (db.foods.select()..where((u) => u.id.equals(widget.id!)))
                .getSingle())
            .toColumns(true);

    Map<String, TextEditingController> newControllers = {};

    for (final field in fields) {
      if (field.isEmpty) continue;
      if (excludedFields.contains(field)) continue;

      final expression = columns[field];
      if (expression is Variable<Object>)
        newControllers[field] = TextEditingController(
          text: _formatControllerValue(expression.value),
        );
      else
        newControllers[field] = TextEditingController(
          text: db.foods.$columns
                      .firstWhere((column) => column.name == field)
                      .type ==
                  DriftSqlType.double
              ? '0'
              : '',
        );
    }

    for (final entry in controllers.entries) {
      if (!newControllers.containsKey(entry.key)) {
        entry.value.dispose();
      }
    }

    controllers = newControllers;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    for (final controller in controllers.values) {
      controller.dispose();
    }
    if (mounted) settingsState.removeListener(setCtrls);
  }

  double? _parseNumber(String value) {
    final text = value.trim();
    if (text.isEmpty) return null;
    try {
      return formatter.parse(text).toDouble();
    } on FormatException {
      return null;
    }
  }

  Map<String, Expression> _buildFoodColumns({int? id}) {
    var food = FoodsCompanion.insert(
      name: nameCtrl.text,
      barcode: Value(barcodeCtrl.text),
      imageFile: Value(imgFile),
      smallImage: Value(smallImg),
      bigImage: Value(bigImg),
      calories: Value(_parseNumber(calCtrl.text)),
      servingUnit: Value(unit),
      servingSize: Value(_parseNumber(sizeCtrl.text)),
      // Editing a food must not change its position in the foods list.
      created: id == null ? Value(DateTime.now()) : Value<DateTime?>(created),
    );

    var columns = food.toColumns(false);
    for (final entry in controllers.entries) {
      if (excludedFields.contains(entry.key)) continue;

      final column = db.foods.$columns.firstWhere((c) => c.name == entry.key);
      Variable value = Variable(entry.value.text);
      if (column.type == DriftSqlType.double)
        value = Variable(_parseNumber(entry.value.text));
      else if (column.type == DriftSqlType.dateTime)
        value = Variable(DateTime.tryParse(entry.value.text));
      columns[entry.key] = value;
    }

    if (id != null) columns['id'] = Variable(id);
    columns['favorite'] = Variable(_favorite ?? false);
    return columns;
  }

  Future<void> saveAs() async {
    final columns = _buildFoodColumns();
    await db.into(db.foods).insert(RawValuesInsertable(columns));
    talker.info('Saved food as a new record');
    if (!mounted) return;
    Navigator.pop(context);
    widget.onSavedNew?.call();
  }

  Future<void> save() async {
    final columns = _buildFoodColumns(id: widget.id);

    var id = widget.id;
    if (widget.id != null) {
      await db.update(db.foods).replace(RawValuesInsertable(columns));
    } else {
      id = await db.into(db.foods).insert(RawValuesInsertable(columns));
      widget.onSavedNew?.call();
    }
    talker.info(
      widget.id == null ? 'Created food record' : 'Updated food record',
    );

    final matches = await (db.foods.select()
          ..where(
            (u) =>
                u.name.equals(nameCtrl.text) &
                u.id.isNotValue(widget.id ?? id ?? -1),
          ))
        .get();

    if (matches.length == 1 && mounted) {
      bool replace = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(context.l10n.nameConflict),
          content: Text(context.l10n.replaceExistingFood),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(context.l10n.no),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(context.l10n.yes),
            ),
          ],
        ),
      );
      if (replace) {
        db.diaries.update()
          ..where((u) => u.food.equals(matches.first.id))
          ..write(
            DiariesCompanion(
              food: Value(widget.id ?? id!),
            ),
          );
        await db.foods.deleteWhere((u) => u.id.equals(matches.first.id));
      }
    }

    if (mounted) Navigator.pop(context);
  }

  void setImage({ImageSource? source}) async {
    final destPath = await pickAndSaveImage('food', source: source);
    if (destPath == null) return;
    setState(() {
      imgFile = destPath;
    });
  }

  Widget _imageSection() {
    if (!settings.showImages) return const SizedBox.shrink();

    final hasImage = imgFile?.isNotEmpty == true ||
        smallImg?.isNotEmpty == true ||
        bigImg?.isNotEmpty == true;

    return Column(
      children: [
        if (hasImage)
          InkWell(
            onTap: () => showImageOptionsSheet(
              context: context,
              onReplace: setImage,
              onCamera: () => setImage(source: ImageSource.camera),
              onDelete: () => setState(() {
                imgFile = null;
                smallImg = null;
                bigImg = null;
              }),
            ),
            child: SizedBox(
              height: 200,
              child: imgFile != null
                  ? Image.file(
                      File(imgFile!),
                      cacheWidth: (MediaQuery.sizeOf(context).width *
                              MediaQuery.devicePixelRatioOf(context))
                          .round(),
                      errorBuilder: (context, error, stackTrace) =>
                          TextButton.icon(
                        onPressed: setImage,
                        label: Text(context.l10n.imageError),
                        icon: const Icon(Icons.error),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: smallImg ?? bigImg!,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => const SizedBox.expand(),
                      errorWidget: (_, __, ___) => const SizedBox.expand(),
                    ),
            ),
          )
        else
          Wrap(
            spacing: 8,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.image),
                label: Text(context.l10n.setImage),
                onPressed: setImage,
              ),
              TextButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: Text(context.l10n.takePhoto),
                onPressed: () => setImage(source: ImageSource.camera),
              ),
            ],
          ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    settings = context.watch<SettingsState>().value;
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id != null ? l10n.editFood : l10n.addFood),
        actions: [
          IconButton(
            icon: Icon(
              _favorite == true ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () => setState(() => _favorite = !(_favorite ?? false)),
          ),
          if (widget.id != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext dlgCtx) {
                    return AlertDialog(
                      title: Text(dlgCtx.l10n.confirmDelete),
                      content: Text(
                        dlgCtx.l10n.confirmDeleteFood(nameCtrl.text),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(dlgCtx.l10n.cancel),
                          onPressed: () {
                            Navigator.pop(dlgCtx);
                          },
                        ),
                        TextButton(
                          child: Text(dlgCtx.l10n.delete),
                          onPressed: () async {
                            Navigator.pop(dlgCtx);
                            await db.foods.deleteWhere(
                              (tbl) => tbl.id.equals(widget.id!),
                            );
                            if (context.mounted) Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
        ],
      ),
      body: AdaptiveFormSurface(
        maxWidth: 980,
        child: ListView(
          controller: scrollCtrl,
          children: [
            _imageSection(),
            TextField(
              controller: nameCtrl,
              focusNode: nameFocusNode,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: l10n.name,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              onSubmitted: (_) => selectAll(calCtrl),
              textInputAction: TextInputAction.next,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: calCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.caloriesKcal,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      final calories = _parseNumber(value);
                      if (calories == null) {
                        if (value.trim().isEmpty) kjCtrl.clear();
                        return;
                      }
                      kjCtrl.text = formatter.format(calories * 4.184);
                    },
                    onTap: () => selectAll(calCtrl),
                    onSubmitted: (_) => selectAll(kjCtrl),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: kjCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.kilojoulesKj,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      final kilojoules = _parseNumber(value);
                      if (kilojoules == null) {
                        if (value.trim().isEmpty) calCtrl.clear();
                        return;
                      }
                      calCtrl.text = formatter.format(kilojoules / 4.184);
                    },
                    onSubmitted: (_) => selectAll(controllers['protein_g']!),
                    onTap: () => selectAll(kjCtrl),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: l10n.servingSize,
                    ),
                    controller: sizeCtrl,
                    onTap: () => selectAll(sizeCtrl),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: unit,
                    decoration: InputDecoration(
                      labelText: l10n.servingUnit,
                    ),
                    items: unitOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(localizedUnit(l10n, value)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        unit = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            TextField(
              controller: barcodeCtrl,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: l10n.barcode,
                suffixIcon: ScanBarcode(
                  text: true,
                  value: barcodeCtrl.text,
                  onBarcode: (value) {
                    barcodeCtrl.text = value;
                    toast(context, l10n.barcodeNotFoundSaveToInsert);
                  },
                  onFood: (food) {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFoodPage(id: food.id),
                      ),
                    );
                  },
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditMealPage(),
                    ),
                  ),
                  label: Text(l10n.createMeal),
                  icon: const Icon(Icons.restaurant),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  label: Text(l10n.openFoodFacts),
                  onPressed: () async {
                    Food? food = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchOpenFoodFacts(
                          terms: nameCtrl.text,
                        ),
                      ),
                    );
                    if (food == null) return;

                    if (!context.mounted) return;
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFoodPage(id: food.id),
                      ),
                    );
                  },
                ),
                TextButton.icon(
                  onPressed: () => Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => FieldsPicker(),
                        ),
                      )
                      .then((_) => setCtrls()),
                  label: Text(l10n.fields),
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
            ...controllers.entries.map(
              (entry) {
                final column =
                    db.foods.$columns.firstWhere((c) => c.name == entry.key);

                return TextField(
                  controller: entry.value,
                  textInputAction: TextInputAction.next,
                  keyboardType: column.type == DriftSqlType.double
                      ? TextInputType.numberWithOptions(decimal: true)
                      : null,
                  onTap: () => selectAll(entry.value),
                  onSubmitted: (_) {
                    final currentIndex =
                        controllers.values.toList().indexOf(entry.value);
                    if (currentIndex < controllers.length - 1) {
                      selectAll(controllers.values.elementAt(currentIndex + 1));
                    }
                  },
                  decoration: InputDecoration(
                    labelText: localizedFoodFieldLabel(l10n, entry.key),
                  ),
                );
              },
            ),
            SizedBox(height: navigationBottomClearance(context)),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: navigationBottomClearance(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.id != null) ...[
              FloatingActionButton.small(
                heroTag: 'saveAs',
                tooltip: l10n.saveAsNewCopy,
                onPressed: saveAs,
                child: const Icon(Icons.save_as),
              ),
              const SizedBox(height: 8),
            ],
            AnimatedFab(
              onTap: save,
              label: l10n.save,
              icon: Icons.save,
              scroll: scrollCtrl,
            ),
          ],
        ),
      ),
    );
  }
}
