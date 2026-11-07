import 'dart:io';
import 'package:fit_book/crash_logger.dart';
import 'package:fit_book/logging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('app startup continues if crash log storage is unavailable', () async {
    final previousFlutterHandler = FlutterError.onError;
    final previousPlatformHandler = PlatformDispatcher.instance.onError;
    try {
      final logger = await CrashLogger.install(
        supportDirectory: () async => throw const FileSystemException('denied'),
      );

      expect(CrashLogger.instance, same(logger));
      expect(
        () => logger.record(StateError('diagnostic'), StackTrace.current),
        returnsNormally,
      );
    } finally {
      FlutterError.onError = previousFlutterHandler;
      PlatformDispatcher.instance.onError = previousPlatformHandler;
    }
  });

  test('crash logs rotate before exceeding the size limit', () async {
    final previousFlutterHandler = FlutterError.onError;
    final previousPlatformHandler = PlatformDispatcher.instance.onError;
    final directory =
        await Directory.systemTemp.createTemp('fitbook-rotation-');
    try {
      final logger = await CrashLogger.install(
        supportDirectory: () async => directory,
      );
      final file = File('${directory.path}/crash.log');
      file.writeAsStringSync(''.padRight(512 * 1024, 'a'));
      logger.record(StateError('rotated-marker'), StackTrace.current);
      expect(file.readAsStringSync(), contains('rotated-marker'));
      expect(
        File('${file.path}.previous').lengthSync(),
        greaterThanOrEqualTo(512 * 1024),
      );
    } finally {
      FlutterError.onError = previousFlutterHandler;
      PlatformDispatcher.instance.onError = previousPlatformHandler;
      await directory.delete(recursive: true);
    }
  });

  test('Talker preserves persistent Flutter and platform crash logs', () async {
    final previousFlutterHandler = FlutterError.onError;
    final previousPlatformHandler = PlatformDispatcher.instance.onError;
    final directory = await Directory.systemTemp.createTemp('fitbook-errors-');
    try {
      await CrashLogger.install(supportDirectory: () async => directory);
      installTalkerErrorHandlers();

      FlutterError.onError?.call(
        FlutterErrorDetails(
          exception: StateError('flutter-error-marker'),
          stack: StackTrace.current,
        ),
      );
      expect(
        PlatformDispatcher.instance.onError?.call(
          StateError('platform-error-marker'),
          StackTrace.current,
        ),
        isTrue,
      );

      final log = File('${directory.path}/crash.log').readAsStringSync();
      expect(log, contains('flutter-error-marker'));
      expect(log, contains('platform-error-marker'));
    } finally {
      FlutterError.onError = previousFlutterHandler;
      PlatformDispatcher.instance.onError = previousPlatformHandler;
      await directory.delete(recursive: true);
    }
  });
}
