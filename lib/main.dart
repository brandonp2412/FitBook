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

  (settings.reminders ? setupReminders : cancelReminders)();

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

  Brightness _getCurrentBrightness(Setting settings, BuildContext context) {
    if (settings.themeMode == 'ThemeMode.dark' ||
        settings.themeMode == 'ThemeMode.amoled') {
      return Brightness.dark;
    }
    if (settings.themeMode == 'ThemeMode.system') {
      return MediaQuery.of(context).platformBrightness;
    }
    return Brightness.light;
  }

  void _setSystemUIStyle(Brightness brightness) {
    final iconBrightness =
        brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: iconBrightness,
        systemNavigationBarIconBrightness: iconBrightness,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

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
        final currentBrightness = _getCurrentBrightness(settings, context);
        _setSystemUIStyle(currentBrightness);

        return MaterialApp(
          title: 'FitBook',
          theme: ThemeData(
            colorScheme: settings.systemColors ? lightDynamic : defaultTheme,
            fontFamily: 'Manrope',
            useMaterial3: true,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
          darkTheme: ThemeData(
            colorScheme:
                (settings.systemColors ? darkDynamic : defaultDark)?.copyWith(
              surface: settings.themeMode == 'ThemeMode.amoled'
                  ? Colors.black
                  : null,
            ),
            fontFamily: 'Manrope',
            useMaterial3: true,
            inputDecorationTheme: const InputDecorationTheme(
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
          themeMode: settings.themeMode == 'ThemeMode.amoled'
              ? ThemeMode.dark
              : ThemeMode.values
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
  Widget _buildTabPage(String tab) {
    switch (tab) {
      case 'DiaryPage':
        return const DiaryPage();
      case 'GraphPage':
        return const GraphPage();
      case 'FoodPage':
        return const FoodPage();
      case 'WeightPage':
        return const WeightPage();
      default:
        return ErrorWidget('Invalid tab settings.');
    }
  }

  Tab _buildTabWidget(String tab) {
    return switch (tab) {
      'DiaryPage' => const Tab(icon: Icon(Icons.date_range), text: "Diary"),
      'GraphPage' => const Tab(icon: Icon(Icons.insights), text: "Graph"),
      'FoodPage' => const Tab(icon: Icon(Icons.restaurant), text: "Food"),
      'WeightPage' => const Tab(icon: Icon(Icons.scale), text: "Weight"),
      _ => const Tab(icon: Icon(Icons.error), text: "Error"),
    };
  }

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
            children: tabs.map(_buildTabPage).toList(),
          ),
        ),
        bottomNavigationBar: Material(
          color: Theme.of(context).colorScheme.surface,
          child: SafeArea(
            top: false,
            child: TabBar(
              dividerColor: Colors.transparent,
              tabs: tabs.map(_buildTabWidget).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
