import 'package:drift/drift.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/weight/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';
import 'test_utils.dart';

void main() async {
  testWidgets('Weight page handles German at 200% text scale', (
    WidgetTester tester,
  ) async {
    await mockTests();
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final settingsState = SettingsState(await db.settings.select().getSingle());
    await db.weights.deleteAll();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(
          home: const WeightPage(),
          locale: const Locale('de'),
          textScaler: const TextScaler.linear(2),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Noch keine Gewichtseinträge'), findsOneWidget);
    expect(tester.takeException(), equals(null));

    await db.close();
  });

  testWidgets('WeightPage deletes selected weights', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settings = await (db.settings.select()).getSingle();
    final settingsState = SettingsState(settings);
    final now = DateTime.now();

    await db.weights.insertAll([
      WeightsCompanion.insert(created: now, unit: 'kg', amount: 60),
      WeightsCompanion.insert(
        created: now.subtract(const Duration(days: 1)),
        unit: 'kg',
        amount: 70,
      ),
      WeightsCompanion.insert(
        created: now.subtract(const Duration(days: 2)),
        unit: 'kg',
        amount: 80,
      ),
    ]);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const WeightPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.longPress(find.textContaining('60'));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('70'));
    await tester.tap(find.textContaining('80'));
    await tester.tap(find.byTooltip('Delete'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextButton, 'Delete'));
    await tester.pumpAndSettle();

    expect(await db.weights.select().get(), isEmpty);

    await db.close();
  });

  testWidgets('Compact weight rows keep their original search bar gap', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());

    await db.weights.insertOne(
      WeightsCompanion.insert(created: DateTime.now(), unit: 'kg', amount: 75),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const WeightPage()),
      ),
    );
    await tester.pumpAndSettle();

    final list = tester.widget<ListView>(find.byType(ListView));
    expect((list.padding! as EdgeInsets).top, 80);

    await db.close();
  });

  testWidgets('Weight displays use locale decimal separators', (
    WidgetTester tester,
  ) async {
    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());
    final now = DateTime.now();

    await db.weights.insertAll([
      WeightsCompanion.insert(created: now, unit: 'kg', amount: 75.5),
      WeightsCompanion.insert(
        created: now.subtract(const Duration(days: 1)),
        unit: 'kg',
        amount: 74,
      ),
    ]);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(
          home: const WeightPage(),
          locale: const Locale('de'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('75,5'), findsOneWidget);
    expect(find.text('▲1,5'), findsOneWidget);

    await db.close();
  });

  testWidgets('Weight stat cards use the standard search bar gap', (
    WidgetTester tester,
  ) async {
    await mockTests();
    await db.settings.update().write(
          const SettingsCompanion(compactWeights: Value(false)),
        );
    final settingsState = SettingsState(await db.settings.select().getSingle());

    await db.weights.insertOne(
      WeightsCompanion.insert(created: DateTime.now(), unit: 'kg', amount: 75),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const WeightPage()),
      ),
    );
    await tester.pumpAndSettle();

    final scroll =
        tester.widget<CustomScrollView>(find.byType(CustomScrollView));
    final padding = scroll.slivers.whereType<SliverPadding>().toList();
    expect((padding.first.padding as EdgeInsets).top, 72);
    expect((padding.last.padding as EdgeInsets).top, 16);

    await db.close();
  });

  testWidgets('Weight cards use Diary selection tint without borders', (
    WidgetTester tester,
  ) async {
    await mockTests();
    await db.settings.update().write(
          const SettingsCompanion(compactWeights: Value(false)),
        );
    final settingsState = SettingsState(await db.settings.select().getSingle());
    final weightId = await db.weights.insertOne(
      WeightsCompanion.insert(
        created: DateTime.now().subtract(const Duration(days: 1)),
        unit: 'kg',
        amount: 75,
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const WeightPage()),
      ),
    );
    await tester.pumpAndSettle();

    final tile = find.byKey(ValueKey('weight-select-$weightId'));
    final before =
        tester.widget<DecoratedBox>(tile).decoration as BoxDecoration;
    await tester.longPress(find.text('75.0'));
    await tester.pumpAndSettle();
    final after = tester.widget<DecoratedBox>(tile).decoration as BoxDecoration;

    expect(before.border, equals(null));
    expect(after.border, equals(null));
    expect(after.color, isNot(before.color));
    expect(tester.takeException(), equals(null));

    await db.close();
  });

  testWidgets('Desktop Weight selection matches Diary controls', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1;
    foundation.debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      foundation.debugDefaultTargetPlatformOverride = null;
    });

    await mockTests();
    final settingsState = SettingsState(await db.settings.select().getSingle());
    final weightId = await db.weights.insertOne(
      WeightsCompanion.insert(created: DateTime.now(), unit: 'kg', amount: 75),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const WeightPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('desktop-select-all')), findsOneWidget);
    final checkbox = find.byKey(ValueKey('weight-checkbox-$weightId'));
    expect(tester.widget<Checkbox>(checkbox).value, false);
    await tester.tap(find.byKey(const Key('desktop-select-all')));
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(checkbox).value, true);
    await tester.tap(checkbox);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(checkbox).value, false);
    expect(tester.takeException(), equals(null));
    foundation.debugDefaultTargetPlatformOverride = null;

    await db.close();
  });

  testWidgets('Desktop Weight cards show trailing selection controls', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1;
    foundation.debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      foundation.debugDefaultTargetPlatformOverride = null;
    });

    await mockTests();
    await db.settings.update().write(
          const SettingsCompanion(compactWeights: Value(false)),
        );
    final settingsState = SettingsState(await db.settings.select().getSingle());
    final weightId = await db.weights.insertOne(
      WeightsCompanion.insert(created: DateTime.now(), unit: 'kg', amount: 75),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => settingsState),
          ChangeNotifierProvider(create: (context) => DiaryState()),
        ],
        child: localizedApp(home: const WeightPage()),
      ),
    );
    await tester.pumpAndSettle();

    final checkbox = find.byKey(ValueKey('weight-checkbox-$weightId'));
    expect(find.byKey(const Key('desktop-select-all')), findsOneWidget);
    expect(tester.widget<Checkbox>(checkbox).value, false);
    await tester.tap(checkbox);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(checkbox).value, true);
    expect(tester.takeException(), equals(null));
    foundation.debugDefaultTargetPlatformOverride = null;

    await db.close();
  });
}
