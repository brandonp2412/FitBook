import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/web_camera_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

bool get supportsCameraCapture =>
    kIsWeb || Platform.isAndroid || Platform.isIOS;

Future<String?> pickAndSaveImage(
  BuildContext context,
  String prefix, {
  ImageSource? source,
}) async {
  if (source == ImageSource.camera && !supportsCameraCapture) return null;
  try {
    if (kIsWeb) {
      final Uint8List? bytes;
      if (source == ImageSource.camera) {
        bytes = await showDialog<Uint8List>(
          context: context,
          builder: (_) => const WebCameraDialog(),
        );
      } else {
        final file = await FilePicker.pickFile(type: FileType.image);
        bytes = await file?.xFile.readAsBytes();
      }
      return bytes == null ? null : encodeStoredImage(bytes);
    }

    final String? path;
    if (source == null) {
      path = (await FilePicker.pickFile(type: FileType.image))?.path;
    } else {
      path = (await ImagePicker().pickImage(source: source))?.path;
    }
    if (path == null) return null;
    final docsDir = (await getApplicationDocumentsDirectory()).path;
    final destPath =
        '$docsDir/${prefix}_${DateTime.now().millisecondsSinceEpoch}.jpg';
    await File(path).copy(destPath);
    return destPath;
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(context.l10n.imageError)));
    }
    return null;
  }
}

String encodeStoredImage(Uint8List bytes) =>
    Uri.dataFromBytes(bytes, mimeType: 'image/jpeg').toString();

bool isEmbeddedImage(String value) => value.startsWith('data:image/');

Uint8List? decodeStoredImage(String value) =>
    isEmbeddedImage(value) ? Uri.tryParse(value)?.data?.contentAsBytes() : null;

Widget storedImage(
  String path, {
  BoxFit? fit,
  int? cacheWidth,
  double? width,
  double? height,
  ImageErrorWidgetBuilder? errorBuilder,
}) {
  if (isEmbeddedImage(path) || kIsWeb) {
    Uint8List? bytes;
    try {
      bytes = decodeStoredImage(path);
    } on FormatException {
      bytes = null;
    }
    return Image.memory(
      bytes ?? Uint8List(0),
      fit: fit,
      cacheWidth: cacheWidth,
      width: width,
      height: height,
      errorBuilder: errorBuilder,
    );
  }
  return Image.file(
    File(path),
    fit: fit,
    cacheWidth: cacheWidth,
    width: width,
    height: height,
    errorBuilder: errorBuilder,
  );
}
