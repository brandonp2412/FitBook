import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:fit_book/app_line.dart';
import 'package:fit_book/app_line_chart.dart';
import 'package:fit_book/constants.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/chart_settings.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;

import 'mock_tests.dart';
import 'test_utils.dart';

Widget _withState(Widget child, SettingsState state) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => state),
        ChangeNotifierProvider(create: (_) => DiaryState()),
      ],
      child: localizedApp(home: Scaffold(body: child)),
    );

void main() {
  test('v56 migration keeps curve preference and persists chart visuals',
      () async {
    final directory = await Directory.systemTemp.createTemp('fitbook-chart-');
    addTearDown(() => directory.delete(recursive: true));
    final file = File('${directory.path}/fitbook.db');
    final schema = jsonDecode(
      File('drift_schemas/db/drift_schema_v56.json').readAsStringSync(),
    ) as Map<String, dynamic>;
    final raw = sqlite.sqlite3.open(file.path);
    try {
      for (final entity in schema['fixed_sql'] as List<dynamic>) {
        for (final entry in entity['sql'] as List<dynamic>) {
          if (entry['dialect'] == 'sqlite') raw.execute(entry['sql'] as String);
        }
      }
      raw.execute("""
        INSERT INTO settings (
          long_date_format, short_date_format, entry_unit, food_unit,
          theme_mode, diary_summary, favorite_new,
          select_entry_on_submit, show_others, system_colors, curve_lines
        ) VALUES (
          'dd/MM/yy', 'd/M/yy', 'grams', 'grams', 'ThemeMode.dark',
          'DiarySummary.division', 0, 0, 0, 0, 1
        )
      """);
      raw.execute('PRAGMA user_version = 56');
    } finally {
      raw.close();
    }
    final oldDb = AppDatabase(executor: NativeDatabase(file));
    final migrated = await oldDb.settings.select().getSingle();
    expect(migrated.curveLines, isTrue);
    expect(migrated.curveSmoothness, 0.35);
    expect(migrated.showChartGridlines, isFalse);
    expect(migrated.fillChartArea, isTrue);
    await oldDb.settings.update().write(
          const SettingsCompanion(
            curveSmoothness: Value(0.8),
            showChartGridlines: Value(true),
            fillChartArea: Value(false),
          ),
        );
    await oldDb.close();

    final reopenedDb = AppDatabase(executor: NativeDatabase(file));
    final saved = await reopenedDb.settings.select().getSingle();
    expect(saved.curveLines, isTrue);
    expect(saved.curveSmoothness, 0.8);
    expect(saved.showChartGridlines, isTrue);
    expect(saved.fillChartArea, isFalse);
    await reopenedDb.close();
  });
  testWidgets('Chart visuals save all four values and update the preview',
      (tester) async {
    await mockTests();
    final state = SettingsState(await db.settings.select().getSingle());
    await tester.pumpWidget(_withState(const ChartSettingsPage(), state));
    await tester.pumpAndSettle();

    final initial = tester.widget<AppLineChart>(find.byType(AppLineChart));
    expect(initial.showGridlines, isFalse);
    expect(initial.series.single.fill, isTrue);
    expect(initial.curveSmoothness, 0.35);
    expect(find.byKey(const Key('chart-visuals-preview')), findsOneWidget);

    await tester.tap(find.byKey(const Key('chart-gridlines-switch')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('chart-shading-switch')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('curve-lines-switch')));
    await tester.pumpAndSettle();
    await tester
        .ensureVisible(find.byKey(const Key('curve-smoothness-slider')));
    await tester.drag(
      find.byKey(const Key('curve-smoothness-slider')),
      const Offset(90, 0),
    );
    await tester.pumpAndSettle();

    final saved = await db.settings.select().getSingle();
    expect(saved.showChartGridlines, isTrue);
    expect(saved.fillChartArea, isFalse);
    expect(saved.curveLines, isTrue);
    expect(saved.curveSmoothness, greaterThan(0.35));
    final preview = tester.widget<AppLineChart>(find.byType(AppLineChart));
    expect(preview.showGridlines, isTrue);
    expect(preview.series.single.fill, isFalse);
    expect(preview.series.single.curved, isTrue);
    expect(preview.curveSmoothness, saved.curveSmoothness);
    expect(tester.takeException(), isNull);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 1));
    await db.close();
  });

  testWidgets(
      'Weight graph reflects persisted visual changes without losing data',
      (tester) async {
    await mockTests();
    final state = SettingsState(await db.settings.select().getSingle());
    await db.weights.insertAll([
      WeightsCompanion.insert(
        created: DateTime.now().subtract(const Duration(days: 3)),
        unit: 'kg',
        amount: 71,
      ),
      WeightsCompanion.insert(
        created: DateTime.now().subtract(const Duration(days: 2)),
        unit: 'kg',
        amount: 75,
      ),
      WeightsCompanion.insert(
        created: DateTime.now().subtract(const Duration(days: 1)),
        unit: 'kg',
        amount: 73,
      ),
    ]);

    await tester.pumpWidget(
      _withState(
        const SizedBox(
          width: 560,
          height: 430,
          child: AppLine(metric: 'body-weight', groupBy: Period.day),
        ),
        state,
      ),
    );
    await tester.pumpAndSettle();
    final before = tester.widget<AppLineChart>(find.byType(AppLineChart));
    final points = before.series.single.points.map((p) => p.value).toList();

    await db.settings.update().write(
          const SettingsCompanion(
            showChartGridlines: Value(true),
            fillChartArea: Value(false),
            curveLines: Value(true),
            curveSmoothness: Value(0.8),
          ),
        );
    await tester.pumpAndSettle();
    final after = tester.widget<AppLineChart>(find.byType(AppLineChart));
    expect(after.showGridlines, isTrue);
    expect(after.series.single.fill, isFalse);
    expect(after.series.single.curved, isTrue);
    expect(after.curveSmoothness, 0.8);
    expect(
      after.series.single.points.map((p) => p.value),
      orderedEquals(points),
    );
    expect(after.bottomLabels, orderedEquals(before.bottomLabels));
    expect(after.startAtZero, before.startAtZero);
    expect(tester.takeException(), isNull);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 1));
    await db.close();
  });
}
