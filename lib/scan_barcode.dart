import 'package:drift/drift.dart' hide Column;
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
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
  if (!status.isGranted) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera permission is required to scan.')),
      );
    }
    return const BarcodeScanResult.cancelled();
  }

  if (!context.mounted) return const BarcodeScanResult.cancelled();
  final barcode = await Navigator.of(context).push<String>(
    MaterialPageRoute(builder: (_) => const _BarcodeScannerPage()),
  );
  if (barcode == null || barcode.isEmpty) {
    return const BarcodeScanResult.cancelled();
  }

  var food = await (db.foods.select()
        ..where((tbl) => tbl.barcode.equals(barcode))
        ..limit(1))
      .getSingleOrNull();
  if (food != null) return BarcodeScanResult.food(food);

  Product? product;
  try {
    final result = await OpenFoodAPIClient.getProductV3(
      ProductQueryConfiguration(
        barcode,
        version: ProductQueryVersion.v3,
      ),
    ).timeout(const Duration(seconds: 10));
    product = result.product;
  } catch (_) {
    // A failed lookup should still return the scanned barcode for manual entry.
  }

  if (product == null) {
    return BarcodeScanResult.barcode(barcode);
  }

  if (!context.mounted) return const BarcodeScanResult.cancelled();
  final settings = context.read<SettingsState>().value;
  var companion = mapOpenFoodFacts(product, settings.foodUnit);
  companion = companion.copyWith(
    favorite: Value(settings.favoriteNew),
    created: Value(DateTime.now()),
    barcode: Value(barcode),
  );

  final id = await db.foods.insertOne(companion);
  food = await (db.foods.select()..where((u) => u.id.equals(id))).getSingle();
  return BarcodeScanResult.food(food);
}

class _BarcodeScannerPage extends StatefulWidget {
  const _BarcodeScannerPage();

  @override
  State<_BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<_BarcodeScannerPage> {
  static const _foodBarcodeFormats =
      Format.ean8 | Format.ean13 | Format.upca | Format.upce;

  bool _handled = false;
  String? _cameraError;

  void _onScan(Code code) {
    final barcode = code.text?.trim();
    if (_handled || barcode == null || barcode.isEmpty) return;
    _handled = true;
    HapticFeedback.mediumImpact();
    Navigator.of(context).pop(barcode);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          ReaderWidget(
            codeFormat: _foodBarcodeFormats,
            cropPercent: 0.72,
            resolution: ResolutionPreset.medium,
            scanDelay: const Duration(milliseconds: 100),
            scanDelaySuccess: Duration.zero,
            showGallery: false,
            showToggleCamera: false,
            allowPinchZoom: true,
            actionButtonsAlignment: Alignment.bottomLeft,
            actionButtonsPadding: const EdgeInsets.all(20),
            actionButtonsBackgroundColor: Colors.black54,
            actionButtonsBackgroundBorderRadius: BorderRadius.circular(28),
            flashOnIcon: const Icon(Icons.flash_on_rounded),
            flashOffIcon: const Icon(Icons.flash_off_rounded),
            scannerOverlay: ScannerOverlayBorder(
              cutOutSize: 0.72,
              borderColor: colors.primary,
              borderWidth: 5,
              borderLength: 36,
              borderRadius: 20,
              overlayColor: Colors.black54,
            ),
            onControllerCreated: (_, error) {
              if (error != null && mounted) {
                setState(() => _cameraError = error.toString());
              }
            },
            onScan: _onScan,
            onActionSecondButton: () => Navigator.of(context).pop(),
            actionSecondButtonIcon: const Icon(Icons.close_rounded),
          ),
          IgnorePointer(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 100),
                child: Column(
                  children: [
                    Text(
                      'Scan a food barcode',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        shadows: const [Shadow(blurRadius: 8)],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Hold the barcode inside the frame',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                    const Spacer(),
                    const Text(
                      'Pinch to zoom',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_cameraError != null)
            ColoredBox(
              color: Colors.black87,
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.no_photography_outlined,
                          color: Colors.white,
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Could not start the camera',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
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
