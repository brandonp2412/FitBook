import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:drift/drift.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'database/database.dart';

class ScanBarcode extends StatefulWidget {
  final Function(Food) onFood;
  final Function(String) onBarcode;
  final bool? text;
  final String? value;

  const ScanBarcode({
    super.key,
    required this.onFood,
    required this.onBarcode,
    this.text,
    this.value,
  });

  @override
  createState() => _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanBarcode> {
  bool searching = false;

  scan() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) return;

    final scan = await BarcodeScanner.scan();
    final barcode = scan.rawContent;
    if (barcode.isEmpty) return;

    var food = await (db.foods.select()
          ..where((tbl) => tbl.barcode.equals(barcode))
          ..limit(1))
        .getSingleOrNull();
    if (food != null) return widget.onFood(food);

    setState(() {
      searching = true;
    });
    SearchResult search = await OpenFoodAPIClient.searchProducts(
      null,
      ProductSearchQueryConfiguration(
        parametersList: [BarcodeParameter(barcode)],
        version: ProductQueryVersion.v3,
      ),
    ).catchError(() => const SearchResult());
    setState(() {
      searching = false;
    });

    if (search.products == null || search.products!.isEmpty)
      return widget.onBarcode(barcode);

    if (!mounted) return;
    final settings = context.read<SettingsState>().value;
    var companion = mapOpenFoodFacts(search.products!.first, settings.foodUnit);
    companion = companion.copyWith(
      favorite: Value(settings.favoriteNew),
      created: Value(DateTime.now()),
      barcode: Value(barcode),
    );

    final id = await db.foods.insertOne(
      companion.copyWith(created: Value(DateTime.now())),
    );
    food = await (db.foods.select()..where((u) => u.id.equals(id))).getSingle();
    widget.onFood(food);
  }

  @override
  Widget build(BuildContext context) {
    if (searching) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (widget.text == true)
      return TextButton.icon(
        label: widget.value != null
            ? Text(widget.value ?? '')
            : const Text("Scan barcode"),
        onPressed: scan,
        icon: const Icon(Icons.barcode_reader),
      );
    else {
      return IconButton(
        icon: const Icon(Icons.barcode_reader),
        onPressed: scan,
      );
    }
  }
}
