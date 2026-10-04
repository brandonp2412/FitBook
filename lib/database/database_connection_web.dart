// ignore_for_file: deprecated_member_use
import 'package:drift/drift.dart';
import 'package:drift/web.dart';

QueryExecutor createWebConnection() {
  return LazyDatabase(() async {
    return WebDatabase.withStorage(
      await DriftWebStorage.indexedDbIfSupported('fitbook'),
      logStatements: false,
    );
  });
}

QueryExecutor createNativeConnection() {
  throw UnsupportedError('Native connection not supported on web');
}
