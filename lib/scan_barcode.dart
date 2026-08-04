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

class BarcodeScanResult {
  final Food? food;
  final String? barcode;

  const BarcodeScanResult.food(Food this.food) : barcode = null;
  const BarcodeScanResult.barcode(String this.barcode) : food = null;
  const BarcodeScanResult.cancelled()
      : food = null,
        barcode = null;
}

Future<BarcodeScanResult> performBarcodeScan(BuildContext context) async {
  final status = await Permission.camera.request();
  if (!status.isGranted) return const BarcodeScanResult.cancelled();

  final scan = await BarcodeScanner.scan();
  final barcode = scan.rawContent;
  if (barcode.isEmpty) return const BarcodeScanResult.cancelled();

  var food = await (db.foods.select()
        ..where((tbl) => tbl.barcode.equals(barcode))
        ..limit(1))
      .getSingleOrNull();
  if (food != null) return BarcodeScanResult.food(food);

  final search = await OpenFoodAPIClient.searchProducts(
    null,
    ProductSearchQueryConfiguration(
      parametersList: [BarcodeParameter(barcode)],
      version: ProductQueryVersion.v3,
    ),
  )
      .timeout(
        const Duration(seconds: 10),
        onTimeout: () => const SearchResult(),
      )
      .catchError((_) => const SearchResult());

  if (search.products == null || search.products!.isEmpty) {
    return BarcodeScanResult.barcode(barcode);
  }

  if (!context.mounted) return const BarcodeScanResult.cancelled();
  final settings = context.read<SettingsState>().value;
  var companion = mapOpenFoodFacts(search.products!.first, settings.foodUnit);
  companion = companion.copyWith(
    favorite: Value(settings.favoriteNew),
    created: Value(DateTime.now()),
    barcode: Value(barcode),
  );

  final id = await db.foods.insertOne(companion);
  food = await (db.foods.select()..where((u) => u.id.equals(id))).getSingle();
  return BarcodeScanResult.food(food);
}

class ScanBarcode extends StatefulWidget {
  final ValueChanged<Food> onFood;
  final ValueChanged<String> onBarcode;
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
  State<ScanBarcode> createState() => _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanBarcode> {
  bool searching = false;

  Future<void> scan() async {
    setState(() {
      searching = true;
    });
    final result = await performBarcodeScan(context);
    if (!mounted) return;
    setState(() {
      searching = false;
    });
    if (result.food != null) {
      widget.onFood(result.food!);
    } else if (result.barcode != null) {
      widget.onBarcode(result.barcode!);
    }
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
        label: const Text("Scan barcode"),
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
