import 'dart:io';
import 'package:fit_book/crash_logger.dart';
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
}
