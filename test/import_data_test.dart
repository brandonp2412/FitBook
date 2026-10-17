import 'dart:io';

import 'package:drift/native.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/settings/backup_archive.dart';
import 'package:fit_book/settings/backup_database.dart';
import 'package:fit_book/settings/import_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

import 'drift/db/generated/schema_v40.dart' as v40;
import 'test_utils.dart';

class _FakeFilePicker extends FilePickerPlatform {
  _FakeFilePicker(this.result);

  final FilePickerResult? result;

  @override
  Future<FilePickerResult?> pickFiles({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    int compressionQuality = 0,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
    bool lockParentWindow = false,
    bool readSequential = false,
    bool cancelUploadOnWindowBlur = true,
    AndroidSAFOptions? androidSafOptions,
  }) async =>
      result;
}

Widget _app() => localizedApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ImportData(pageContext: context),
        ),
      ),
    );

Future<void> _openImport(WidgetTester tester, String label) async {
  await tester.tap(find.text('Import data'));
  await tester.pumpAndSettle();
  await tester.tap(find.text(label));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 200));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FilePickerPlatform originalPicker;

  setUp(() {
    originalPicker = FilePickerPlatform.instance;
  });

  tearDown(() {
    FilePickerPlatform.instance = originalPicker;
  });

  test('CSV import validation rejects header-only files', () {
    expect(
      () => validateCsvImportRows(
        [
          ['id', 'name'],
        ],
        minimumColumns: 2,
        label: 'Foods',
      ),
      throwsA(isA<FormatException>()),
    );
  });

  test('CSV import validation rejects truncated data rows', () {
    expect(
      () => validateCsvImportRows(
        [
          ['id', 'food', 'created', 'quantity', 'unit'],
          [1, 2, '2026-09-11'],
        ],
        minimumColumns: 5,
        label: 'Diary',
      ),
      throwsA(isA<FormatException>()),
    );
  });

  testWidgets('cancelling diary import is a no-op', (tester) async {
    FilePickerPlatform.instance = _FakeFilePicker(null);
    await tester.pumpWidget(_app());

    await _openImport(tester, 'Diary');

    expect(tester.takeException(), isNull);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('cancelling food import does not report an import failure',
      (tester) async {
    FilePickerPlatform.instance = _FakeFilePicker(null);
    await tester.pumpWidget(_app());

    await _openImport(tester, 'Foods');

    expect(tester.takeException(), isNull);
    expect(find.text('Failed to import data'), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  test('backup validation accepts a FitBook database', () async {
    final directory =
        await Directory.systemTemp.createTemp('fitbook-import-test-');
    addTearDown(() => directory.delete(recursive: true));
    final file = File('${directory.path}/fitbook.sqlite');
    final database = openBackupDatabase(file.path);
    database.execute('CREATE TABLE foods (id INTEGER PRIMARY KEY)');
    database.execute('CREATE TABLE diaries (id INTEGER PRIMARY KEY)');
    database.close();

    expect(() => validateBackupDatabaseFile(file), returnsNormally);
  });

  test('backup validation rejects another SQLite database', () async {
    final directory =
        await Directory.systemTemp.createTemp('fitbook-import-test-');
    addTearDown(() => directory.delete(recursive: true));
    final file = File('${directory.path}/other.sqlite');
    final database = openBackupDatabase(file.path);
    database.execute('CREATE TABLE unrelated (id INTEGER PRIMARY KEY)');
    database.close();

    expect(
      () => validateBackupDatabaseFile(file),
      throwsA(isA<FormatException>()),
    );
  });

  test('backup validation rejects a non-database file', () async {
    final directory =
        await Directory.systemTemp.createTemp('fitbook-import-test-');
    addTearDown(() => directory.delete(recursive: true));
    final file = File('${directory.path}/not-a-database.sqlite');
    await file.writeAsString('not sqlite');

    expect(
      () => validateBackupDatabaseFile(file),
      throwsA(isA<FormatException>()),
    );
  });
  test('legacy standalone SQLite with entries is accepted and copied',
      () async {
    final root =
        await Directory.systemTemp.createTemp('fitbook-sqlite-import-');
    addTearDown(() => root.delete(recursive: true));
    final source = File(p.join(root.path, 'old-fitbook.sqlite'));
    final working = await Directory(p.join(root.path, 'working')).create();
    final documents = await Directory(p.join(root.path, 'documents')).create();
    final writer = openBackupDatabase(source.path);
    writer.execute('CREATE TABLE foods (id INTEGER PRIMARY KEY, name TEXT)');
    writer.execute('CREATE TABLE entries (id INTEGER PRIMARY KEY)');
    writer.execute('PRAGMA user_version = 40');
    writer.execute("INSERT INTO foods VALUES (1, 'Apple')");
    writer.close();

    final imported = await prepareBackupDatabase(
      selectedFile: source,
      workingDirectory: working,
      documentsDirectory: documents,
    );
    expect(imported.path, isNot(source.path));
    final reader = openBackupDatabase(imported.path);
    try {
      expect(reader.select('SELECT name FROM foods').single['name'], 'Apple');
      expect(reader.select('PRAGMA user_version').single.values.single, 40);
    } finally {
      reader.close();
    }
  });
  test('legacy v40 SQLite backup migrates to current schema', () async {
    final root = await Directory.systemTemp.createTemp('fitbook-old-schema-');
    addTearDown(() => root.delete(recursive: true));
    final file = File(p.join(root.path, 'fitbook-old.sqlite'));
    final legacy = v40.DatabaseAtV40(NativeDatabase(file));
    await legacy.customSelect('SELECT 1 FROM foods LIMIT 1').get();
    await legacy.close();

    final working = await Directory(p.join(root.path, 'work')).create();
    final documents = await Directory(p.join(root.path, 'documents')).create();
    final imported = await prepareBackupDatabase(
      selectedFile: file,
      workingDirectory: working,
      documentsDirectory: documents,
    );
    final upgraded = AppDatabase(executor: NativeDatabase(imported));
    try {
      await upgraded.customSelect('SELECT 1 FROM diaries LIMIT 1').get();
      expect(
        (await upgraded.customSelect('PRAGMA user_version').get())
            .single
            .read<int>('user_version'),
        upgraded.schemaVersion,
      );
    } finally {
      await upgraded.close();
    }
  });
}
