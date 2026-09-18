import 'dart:io';

import 'package:drift/drift.dart' hide Column;
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/logging.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'database/database.dart';

bool get supportsBarcodeCamera =>
    !kIsWeb && (Platform.isAndroid || Platform.isIOS);

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
  if (!supportsBarcodeCamera) return const BarcodeScanResult.cancelled();

  final status = await Permission.camera.request();
  if (!status.isGranted) {
    talker.warning('Camera permission denied for barcode scan');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.cameraPermissionRequired)),
      );
    }
    return const BarcodeScanResult.cancelled();
  }

  if (!context.mounted) return const BarcodeScanResult.cancelled();
  final barcode = await Navigator.of(context, rootNavigator: true).push<String>(
    MaterialPageRoute(builder: (_) => const _BarcodeScannerPage()),
  );
  if (barcode == null || barcode.isEmpty) {
    talker.debug('Barcode scan cancelled');
    return const BarcodeScanResult.cancelled();
  }
  talker.info('Scanned barcode');

  var food = await (db.foods.select()
        ..where((tbl) => tbl.barcode.equals(barcode))
        ..limit(1))
      .getSingleOrNull();
  if (food != null) {
    talker.debug('Found scanned food in local database');
    return BarcodeScanResult.food(food);
  }

  Product? product;
  try {
    final result = await OpenFoodAPIClient.getProductV3(
      ProductQueryConfiguration(
        barcode,
        version: ProductQueryVersion.v3,
      ),
    ).timeout(const Duration(seconds: 10));
    product = result.product;
  } catch (error, stackTrace) {
    talker.handle(error, stackTrace, 'Open Food Facts barcode lookup failed');
    // A failed lookup should still return the scanned barcode for manual entry.
  }

  if (product == null) {
    talker.info('No product found for scanned barcode');
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
  talker.info('Saved scanned Open Food Facts product to local database');
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
  bool _cameraFailed = false;

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
                talker.handle(error, null, 'Unable to start barcode camera');
                setState(() => _cameraFailed = true);
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
                      context.l10n.scanFoodBarcode,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        shadows: const [Shadow(blurRadius: 8)],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.l10n.holdBarcodeInFrame,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const Spacer(),
                    Text(
                      context.l10n.pinchToZoom,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_cameraFailed)
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
                        Text(
                          context.l10n.cameraStartFailed,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(context.l10n.close),
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
    if (!supportsBarcodeCamera) return const SizedBox.shrink();

    if (searching) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (widget.text == true)
      return TextButton.icon(
        label: Text(context.l10n.scanBarcode),
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
