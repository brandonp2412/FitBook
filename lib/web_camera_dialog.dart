import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:flutter/material.dart';

class WebCameraDialog extends StatefulWidget {
  const WebCameraDialog({super.key});

  @override
  State<WebCameraDialog> createState() => _WebCameraDialogState();
}

class _WebCameraDialogState extends State<WebCameraDialog> {
  CameraController? _controller;
  bool _failed = false;
  bool _capturing = false;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final cameras = await availableCameras();
      if (!mounted) return;
      if (cameras.isEmpty) throw StateError('No camera available');
      final camera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final controller = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      _controller = controller;
      await controller.initialize();
      if (mounted) setState(() {});
    } catch (_) {
      if (mounted) setState(() => _failed = true);
    }
  }

  Future<void> _capture() async {
    final controller = _controller;
    if (controller == null || _capturing) return;
    setState(() => _capturing = true);
    try {
      final photo = await controller.takePicture();
      final bytes = await photo.readAsBytes();
      if (mounted) Navigator.pop<Uint8List>(context, bytes);
    } catch (_) {
      if (mounted)
        setState(() {
          _failed = true;
          _capturing = false;
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final controller = _controller;
    final ready = controller?.value.isInitialized == true && !_failed;
    return AlertDialog(
      title: Text(l10n.takePhoto),
      content: SizedBox(
        width: 480,
        child: _failed
            ? Text(l10n.cameraStartFailed)
            : ready
                ? AspectRatio(
                    aspectRatio: controller!.value.aspectRatio,
                    child: CameraPreview(controller),
                  )
                : const Center(
                    heightFactor: 3,
                    child: CircularProgressIndicator(),
                  ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        FilledButton.icon(
          onPressed: ready && !_capturing ? _capture : null,
          icon: const Icon(Icons.camera_alt),
          label: Text(l10n.takePhoto),
        ),
      ],
    );
  }
}
