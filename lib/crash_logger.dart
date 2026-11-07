import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Persists uncaught errors to a rolling log file without depending on another app.
class CrashLogger {
  CrashLogger._(this._file);

  final File? _file;
  static CrashLogger? _instance;

  static Future<CrashLogger> install({
    String fileName = 'crash.log',
    Future<Directory> Function()? supportDirectory,
  }) async {
    File? file;
    if (!kIsWeb) {
      try {
        final dir =
            await (supportDirectory ?? getApplicationSupportDirectory)();
        file = File(p.join(dir.path, fileName));
      } catch (_) {
        debugPrint('Crash log storage unavailable; continuing startup.');
      }
    }

    final logger = CrashLogger._(file);
    _instance = logger;

    final previousFlutterOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      logger.record(details.exception, details.stack, context: 'FlutterError');
      previousFlutterOnError?.call(details);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      logger.record(error, stack, context: 'PlatformDispatcher');
      return true;
    };

    if (file != null) debugPrint('Crash log: ${file.path}');
    return logger;
  }

  static CrashLogger? get instance => _instance;

  void record(Object error, StackTrace? stack, {String context = 'uncaught'}) {
    final entry = StringBuffer()
      ..writeln('[${DateTime.now().toIso8601String()}] ($context) $error');
    if (stack != null) entry.writeln(stack.toString().trimRight());
    entry.writeln();

    debugPrint(entry.toString());
    final file = _file;
    if (file == null) return;

    try {
      const maxLogBytes = 512 * 1024;
      if (file.existsSync() && file.lengthSync() >= maxLogBytes) {
        final previousLog = File('${file.path}.previous');
        if (previousLog.existsSync()) previousLog.deleteSync();
        file.renameSync(previousLog.path);
      }
      file.writeAsStringSync(entry.toString(), mode: FileMode.append);
    } catch (_) {
      // Logging must remain best-effort.
    }
  }
}
