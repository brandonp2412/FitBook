import 'package:drift/drift.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/main.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock_tests.dart';

void main() {
  testWidgets('tab dock hides for nested pages and returns on pop',
      (tester) async {
    await mockTests();
    final setting = await db.settings.select().getSingle();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsState(setting)),
          ChangeNotifierProvider(create: (_) => DiaryState()),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(BottomNav), findsOneWidget);

    final diary = tester.state<DiaryPageState>(find.byType(DiaryPage));
    diary.navigatorKey.currentState!.push(
      MaterialPageRoute<void>(
        builder: (_) => const Scaffold(body: Text('Nested details')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Nested details'), findsOneWidget);
    expect(find.byType(BottomNav), findsNothing);

    diary.navigatorKey.currentState!.pop();
    await tester.pumpAndSettle();
    expect(find.byType(BottomNav), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await db.close();
  });
}
