import 'dart:async';

import 'package:drift/drift.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/crash_logger.dart';
import 'package:fit_book/database/database.dart';
import 'package:fit_book/database/failed_migrations_page.dart';
import 'package:fit_book/diary/diary_page.dart';
import 'package:fit_book/diary/diary_state.dart';
import 'package:fit_book/food/food_page.dart';
import 'package:fit_book/graph_page.dart';
import 'package:fit_book/logging.dart';
import 'package:fit_book/reminders.dart';
import 'package:fit_book/settings/navigation_animation.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/settings/whats_new.dart';
import 'package:fit_book/utils.dart';
import 'package:fit_book/weight/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

final ValueNotifier<int> dbVersion = ValueNotifier<int>(0);
AppDatabase _db = AppDatabase();

AppDatabase get db => _db;

set db(AppDatabase value) {
  _db = value;
  dbVersion.value++;
}

MethodChannel androidChannel =
    const MethodChannel("com.presley.fit_book/android");

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await CrashLogger.install(fileName: 'fitbook-crash.log');
      installTalkerErrorHandlers();
      talker.info('Starting FitBook');

      Setting settings;
      try {
        settings = await (db.settings.select()).getSingle();
      } catch (error) {
        talker.handle(error, StackTrace.current, 'Database migration failed');
        return runApp(FailedMigrationsPage(error: error));
      }

      final state = SettingsState(settings);
      talker.info('Loaded application settings');

      (settings.reminders ? setupReminders : cancelReminders)();

      runApp(appProviders(state));

      try {
        final pkgInfo = await PackageInfo.fromPlatform();
        OpenFoodAPIConfiguration.userAgent = UserAgent(
          name: '${pkgInfo.appName}/${pkgInfo.version} (brandon@presley.nz)',
          url: 'https://github.com/brandonp2412/FitBook',
        );
        OpenFoodAPIConfiguration.globalUser = User(
          userId: state.value.offLogin ?? '',
          password: state.value.offPassword ?? '',
        );
        talker.info('Configured Open Food Facts client for ${pkgInfo.version}');
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          'Unable to configure Open Food Facts client',
        );
      }
    },
    (error, stack) {
      talker.handle(error, stack, 'Uncaught zone error');
      CrashLogger.instance?.record(error, stack, context: 'zone');
    },
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
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: settings.systemColors ? lightDynamic : defaultTheme,
            fontFamily: 'Manrope',
            useMaterial3: true,
            pageTransitionsTheme:
                navigationTransitionsTheme(settings.navigationAnimation),
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
            pageTransitionsTheme:
                navigationTransitionsTheme(settings.navigationAnimation),
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
  final _pageController = PageController();
  var _currentIndex = 0;
  var _isPageTransitioning = false;

  Widget _pageForTab(String tab) {
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

  Widget _buildTabPage(String tab, int index) {
    return RepaintBoundary(
      child: TickerMode(
        enabled: !_isPageTransitioning && index == _currentIndex,
        child: _pageForTab(tab),
      ),
    );
  }

  bool _onPageScroll(ScrollNotification notification) {
    if (notification is ScrollStartNotification && !_isPageTransitioning) {
      setState(() => _isPageTransitioning = true);
    } else if (notification is ScrollEndNotification && _isPageTransitioning) {
      setState(() => _isPageTransitioning = false);
    }
    return false;
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

      talker.info('Detected FitBook update to ${pkg.version}');
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
    }).catchError((error, stackTrace) {
      talker.handle(error, stackTrace, 'Unable to check FitBook version');
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabsSetting = context
        .select<SettingsState, String>((settings) => settings.value.tabs);
    final tabs = tabsSetting.split(',');
    final scrollableTabs = context.select<SettingsState, bool>(
      (settings) => settings.value.scrollableTabs,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: dbVersion,
              builder: (context, generation, child) =>
                  NotificationListener<ScrollNotification>(
                onNotification: _onPageScroll,
                child: PageView.builder(
                  key: ValueKey(generation),
                  controller: _pageController,
                  physics: scrollableTabs
                      ? const AlwaysScrollableScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  itemCount: tabs.length,
                  onPageChanged: (i) => setState(() => _currentIndex = i),
                  itemBuilder: (context, index) =>
                      _buildTabPage(tabs[index], index),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNav(
                tabs: tabs,
                currentIndex: _currentIndex,
                onTap: (i) {
                  _pageController.animateToPage(
                    i,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,
                  );
                  setState(() => _currentIndex = i);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
