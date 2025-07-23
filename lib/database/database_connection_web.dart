import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:flutter/foundation.dart';

QueryExecutor createWebConnection() {
  return LazyDatabase(() async {
    return WebDatabase.withStorage(
      await DriftWebStorage.indexedDbIfSupported('fitbook'),
      logStatements: kDebugMode,
    );
  });
}

// Stub for native function to avoid compilation errors
QueryExecutor createNativeConnection() {
  throw UnsupportedError('Native connection not supported on web');
}
