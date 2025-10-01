import 'package:drift/drift.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/database/failed_migrations_page.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/food/food_page.dart';
import 'package:fit_book/graph_page.dart';
import 'package:fit_book/reminders.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/settings/whats_new.dart';
import 'package:fit_book/utils.dart';
import 'package:fit_book/weight/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

AppDatabase db = AppDatabase();
MethodChannel androidChannel =
    const MethodChannel("com.presley.fit_book/android");

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Setting settings;
  try {
    settings = await (db.settings.select()).getSingle();
  } catch (error) {
    return runApp(FailedMigrationsPage(error: error));
  }

  final state = SettingsState(settings);

  if (settings.reminders)
    setupReminders();
  else
    cancelReminders();

  runApp(appProviders(state));

  final pkgInfo = await PackageInfo.fromPlatform();
  OpenFoodAPIConfiguration.userAgent = UserAgent(
    name: '${pkgInfo.appName}/${pkgInfo.version} (brandon@presley.nz)',
    url: 'https://github.com/brandonp2412/FitBook',
  );
  OpenFoodAPIConfiguration.globalUser = User(
    userId: state.value.offLogin ?? '',
    password: state.value.offPassword ?? '',
  );
}

Widget appProviders(SettingsState state) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => state),
        ChangeNotifierProvider(
          create: (context) => DiaryState(),
        ),
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
      builder: (lightDynamic, darkDynamic) {
        final currentBrightness = settings.themeMode == 'ThemeMode.dark' ||
                (settings.themeMode == 'ThemeMode.system' &&
                    MediaQuery.of(context).platformBrightness ==
                        Brightness.dark)
            ? Brightness.dark
            : Brightness.light;

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarIconBrightness: currentBrightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
            systemNavigationBarIconBrightness:
                currentBrightness == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark,
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
          ),
        );

        return MaterialApp(
          title: 'FitBook',
          theme: ThemeData(
            colorScheme: settings.systemColors ? lightDynamic : defaultTheme,
            fontFamily: 'Manrope',
            useMaterial3: true,
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
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final info = PackageInfo.fromPlatform();
    info.then((pkg) async {
      final meta = await (db.metadata.select()..limit(1)).getSingleOrNull();
      if (int.parse(pkg.buildNumber) == meta?.buildNumber) return null;
      if (meta == null)
        db.metadata.insertOne(
          MetadataCompanion(buildNumber: Value(int.parse(pkg.buildNumber))),
        );
      else
        db.metadata.update().write(
              MetadataCompanion(
                buildNumber: Value(int.parse(pkg.buildNumber)),
              ),
            );

      if (mounted)
        toast(
          context,
          "New version ${pkg.version}",
          SnackBarAction(
            label: 'Changes',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const WhatsNew(),
              ),
            ),
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabsSetting = context
        .select<SettingsState, String>((settings) => settings.value.tabs);
    final tabs = tabsSetting.split(',');
    final scrollableTabs = context.select<SettingsState, bool>(
      (settings) => settings.value.scrollableTabs,
    );

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: SafeArea(
          child: TabBarView(
            physics: scrollableTabs
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
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
        ),
        bottomNavigationBar: Material(
          color: Theme.of(context).colorScheme.surface,
          child: SafeArea(
            top: false,
            child: TabBar(
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
