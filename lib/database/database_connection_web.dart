import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:drift/web.dart';
import 'package:flutter/foundation.dart';

Uint8List? importedDatabaseData;

QueryExecutor createWebConnection() {
  return DatabaseConnection.delayed(
    Future(() async {
      final result = await WasmDatabase.open(
        databaseName: 'fitbook',
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.dart.js'),
        initializeDatabase: () async {
          // If we have imported data, use it
          if (importedDatabaseData != null) {
            final data = importedDatabaseData!;
            importedDatabaseData = null; // Clear after use
            return data;
          }

          // Otherwise, try to migrate from old WebDatabase if it exists
          try {
            final storage =
                await DriftWebStorage.indexedDbIfSupported('fitbook');
            await storage.open();
            final blob = await storage.restore();
            await storage.close();
            return blob;
          } catch (e) {
            // No existing database, return null to create new
            return null;
          }
        },
      );

      if (result.missingFeatures.isNotEmpty) {
        if (kDebugMode) {
          print('Using ${result.chosenImplementation} due to missing browser '
              'features: ${result.missingFeatures}');
        }
      }

      return result.resolvedExecutor;
    }),
  );
}

// Stub for native function to avoid compilation errors
QueryExecutor createNativeConnection() {
  throw UnsupportedError('Native connection not supported on web');
}
