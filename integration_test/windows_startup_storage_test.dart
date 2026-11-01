import 'dart:io';
import 'dart:ui' show PlatformDispatcher;

import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:fit_book/crash_logger.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/database/failed_migrations_page.dart';
import 'package:fit_book/main.dart' as app;
import 'package:fit_book/weight/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

import 'screenshot_navigation.dart';

class _SandboxDirectories extends PathProviderWindows {
  _SandboxDirectories(this.root);

  final Directory root;
  int supportLookups = 0;

  @override
  Future<String?> getApplicationSupportPath() async {
    supportLookups++;
    return super.getApplicationSupportPath();
  }

  @override
  Future<String> getPath(String folderID) async => root.path;

  @override
  Future<String> getTemporaryPath() async => root.path;
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  for (final blocked in [false, true]) {
    testWidgets(
      'Windows starts with crash-log storage ${blocked ? 'blocked' : 'available'}',
      (tester) async {
        expect(Platform.isWindows, isTrue, reason: 'Requires a Windows guest');
        final originalDirectories = PathProviderPlatform.instance;
        final originalFlutterHandler = FlutterError.onError;
        final originalPlatformHandler = PlatformDispatcher.instance.onError;
        final sandbox =
            await Directory.systemTemp.createTemp('fitbook-startup-');
        final directories = _SandboxDirectories(sandbox);
        final database = AppDatabase(
          executor: NativeDatabase.createInBackground(
            File('${sandbox.path}/startup.sqlite'),
          ),
        );
        try {
          final supportPath = (await directories.getApplicationSupportPath())!;
          expect(supportPath, startsWith(sandbox.path));
          if (blocked) {
            await Directory(supportPath).delete(recursive: true);
            await File(supportPath).writeAsString('not a directory');
          }
          PathProviderPlatform.instance = directories;
          app.db = database;
          await tester.runAsync(() async {
            await database.weights.insertOne(
              WeightsCompanion.insert(
                created: DateTime(2026, 11, 1),
                unit: 'kg',
                amount: 72.5,
              ),
            );
          });

          if (blocked) {
            await expectLater(
              getApplicationSupportDirectory(),
              throwsA(isA<FileSystemException>()),
            );
          }
          app.main();
          final deadline = DateTime.now().add(const Duration(seconds: 30));
          while (find.byType(app.App).evaluate().isEmpty &&
              DateTime.now().isBefore(deadline)) {
            await tester.pump(const Duration(milliseconds: 100));
            await tester.runAsync(
              () => Future<void>.delayed(const Duration(milliseconds: 100)),
            );
          }
          expect(find.byType(app.App), findsOneWidget);
          expect(find.byType(FailedMigrationsPage), findsNothing);
          expect(directories.supportLookups, greaterThan(0));
          expect(CrashLogger.instance, isNotNull);
          await tester.pumpAndSettle();

          await selectScreenshotTab(tester, 'WeightPage');
          await tester.pumpAndSettle();
          expect(find.byType(WeightPage), findsOneWidget);
          expect(find.text('72.5kg'), findsOneWidget);
          await selectScreenshotTab(tester, 'GraphPage');
          await tester.pumpAndSettle();
          await selectScreenshotTab(tester, 'WeightPage');
          await tester.pumpAndSettle();
          expect(find.text('72.5kg'), findsOneWidget);

          CrashLogger.instance!.record(
            StateError('Windows startup diagnostic'),
            StackTrace.current,
          );
          if (blocked) {
            expect(
              await File(supportPath).readAsString(),
              'not a directory',
            );
          } else {
            expect(
              await File('$supportPath/fitbook-crash.log').readAsString(),
              contains('Windows startup diagnostic'),
            );
          }
        } finally {
          FlutterError.onError = originalFlutterHandler;
          PlatformDispatcher.instance.onError = originalPlatformHandler;
          await tester.pumpWidget(const SizedBox.shrink());
          await tester.pumpAndSettle();
          await database.close();
          PathProviderPlatform.instance = originalDirectories;
          await sandbox.delete(recursive: true);
        }
      },
    );
  }
}
