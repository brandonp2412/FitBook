import 'package:drift/drift.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/entry/diary_page.dart';
import 'package:fit_book/entry/entry_state.dart';
import 'package:fit_book/food/food_page.dart';
import 'package:fit_book/graph_page.dart';
import 'package:fit_book/reminders.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/weight/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

AppDatabase db = AppDatabase();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settings = await (db.settings.select()).getSingle();
  final settingsState = SettingsState(settings);

  if (settings.reminders)
    setupReminders();
  else
    cancelReminders();

  final packageInfo = await PackageInfo.fromPlatform();
  OpenFoodAPIConfiguration.userAgent = UserAgent(
    name: '${packageInfo.appName}/${packageInfo.version} (brandon@presley.nz)',
    url: 'https://github.com/brandonp2412/FitBook',
  );
  OpenFoodAPIConfiguration.globalUser = User(
    userId: settingsState.value.offLogin ?? '',
    password: settingsState.value.offPassword ?? '',
  );

  runApp(appProviders(settingsState));
}

Widget appProviders(SettingsState settingsState) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => settingsState),
        ChangeNotifierProvider(create: (context) => EntryState()),
      ],
      child: const App(),
    );

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

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
        themeMode: ThemeMode.values
            .byName(settings.themeMode.replaceAll('ThemeMode.', '')),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabsSetting = context
        .select<SettingsState, String>((settings) => settings.value.tabs);
    final tabs = tabsSetting.split(',');

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.surface,
        statusBarColor: Theme.of(context).colorScheme.surface,
        statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
      child: DefaultTabController(
        length: tabs.length,
        child: SafeArea(
          child: Scaffold(
            body: TabBarView(
              children: tabs.map((tab) {
                if (tab == 'DiaryPage')
                  return const DiaryPage();
                else if (tab == 'GraphPage')
                  return const GraphPage();
                else if (tab == 'FoodPage')
                  return const FoodPage();
                else if (tab == 'WeightPage')
                  return const WeightPage();
                else
                  return ErrorWidget('Invalid tab settings.');
              }).toList(),
            ),
            bottomNavigationBar: TabBar(
              dividerColor: Colors.transparent,
              tabs: tabs.map((tab) {
                if (tab == 'DiaryPage')
                  return const Tab(
                    icon: Icon(Icons.date_range),
                    text: "Diary",
                  );
                else if (tab == 'GraphPage')
                  return const Tab(
                    icon: Icon(Icons.insights),
                    text: "Graph",
                  );
                else if (tab == 'FoodPage')
                  return const Tab(
                    icon: Icon(Icons.restaurant),
                    text: "Food",
                  );
                else if (tab == 'WeightPage')
                  return const Tab(
                    icon: Icon(Icons.scale),
                    text: "Weight",
                  );
                else
                  return ErrorWidget('Invalid tab settings.');
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
