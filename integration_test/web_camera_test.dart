import 'package:drift/drift.dart' hide Column;
import 'package:fit_book/database/database.dart';
import 'package:fit_book/food/edit_food_page.dart';
import 'package:fit_book/image_capture.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/main.dart' as app;
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('webcam photo is saved and reopened in food editor',
      (tester) async {
    if (!kIsWeb) return;
    app.db = AppDatabase(dontLog: true);
    addTearDown(app.db.close);
    final id = await app.db.foods.insertOne(
      FoodsCompanion.insert(
        name: 'Camera test food',
        calories: const Value(100),
      ),
    );
    await app.db.customStatement('UPDATE settings SET show_images = 1');
    final settings = SettingsState(await app.db.settings.select().getSingle());
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: settings,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => EditFoodPage(id: id)),
                ),
                child: const Text('Open editor'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open editor'));
    await tester.pumpAndSettle();
    final takePhoto = find.text('Take photo');
    await tester.ensureVisible(takePhoto);
    await tester.tap(takePhoto);
    await tester.pump();
    final capture = find.widgetWithText(FilledButton, 'Take photo');
    final deadline = DateTime.now().add(const Duration(seconds: 20));
    while (capture.evaluate().isEmpty ||
        tester.widget<FilledButton>(capture).onPressed == null) {
      if (DateTime.now().isAfter(deadline)) fail('Camera did not initialize');
      await tester.pump(const Duration(milliseconds: 100));
    }
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));
    await binding.takeScreenshot('1_en-US');
    await tester.tap(capture);
    await tester.pumpAndSettle();
    expect(find.byType(Image), findsWidgets);
    expect(find.text('Image error'), findsNothing);
    await binding.takeScreenshot('2_en-US');
    final save = find.text('Save');
    await tester.ensureVisible(save.first);
    await tester.tap(save.first);
    await tester.pumpAndSettle();
    final saved = await (app.db.foods.select()
          ..where((table) => table.id.equals(id)))
        .getSingle();
    expect(decodeStoredImage(saved.imageFile!), isNotEmpty);
    await tester.tap(find.text('Open editor'));
    await tester.pumpAndSettle();
    expect(find.byType(Image), findsWidgets);
    expect(find.text('Image error'), findsNothing);
    await binding.takeScreenshot('3_en-US');
    await tester.pumpWidget(const SizedBox.shrink());
    settings.dispose();
  });
}
