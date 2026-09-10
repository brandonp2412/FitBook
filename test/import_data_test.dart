import 'package:file_picker/file_picker.dart';
import 'package:fit_book/settings/import_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

Widget _app() => MaterialApp(
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
}
