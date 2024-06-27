import 'package:dynamic_color/dynamic_color.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/diary/entries_state.dart';
import 'package:fit_book/food/food_page.dart';
import 'package:fit_book/graph_page.dart';
import 'package:fit_book/graph_state.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/weight/weights_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late AppDatabase db;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = AppDatabase();

  final sharedPreferences = await SharedPreferences.getInstance();
  final settingsState = SettingsState(sharedPreferences);

  runApp(appProviders(settingsState));
}

Widget appProviders(SettingsState settingsState) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => settingsState),
        ChangeNotifierProvider(create: (context) => EntriesState()),
        ChangeNotifierProvider(
          create: (context) => GraphState(settingsState.prefs),
        ),
      ],
      child: const App(),
    );

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    final defaultTheme = ColorScheme.fromSeed(seedColor: Colors.blue);
    final defaultDark = ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    );

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        title: 'FitBook',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: settings.systemColors ? lightDynamic : defaultTheme,
          fontFamily: 'Manrope',
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: settings.systemColors ? darkDynamic : defaultDark,
          fontFamily: 'Manrope',
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
        themeMode: settings.themeMode,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              DiaryPage(),
              GraphPage(),
              FoodPage(),
              WeightsPage(),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.date_range),
                text: "Diary",
              ),
              Tab(
                icon: Icon(Icons.insights),
                text: "Graph",
              ),
              Tab(
                icon: Icon(Icons.restaurant),
                text: "Food",
              ),
              Tab(
                icon: Icon(Icons.scale),
                text: "Weight",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
