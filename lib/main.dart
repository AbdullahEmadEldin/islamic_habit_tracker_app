import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic_habit_tracker/core/cache/cache_helper.dart';
import 'package:islamic_habit_tracker/core/localization/localization_manager.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/navigation/router.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/core/theme/theme_manager.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setUp();
  final showHome = CacheHelper.getData(key: 'showHome') ?? false;
  runApp(AzkarApp(showHome: showHome));
}

class AzkarApp extends StatefulWidget {
  final bool showHome;
  const AzkarApp({super.key, required this.showHome});

  @override
  State<AzkarApp> createState() => _AzkarAppState();
}

class _AzkarAppState extends State<AzkarApp> {
  @override

  ///these listeners for switching theme
  @override
  void initState() {
    locator.get<ThemeManager>().addListener(themeListener);
    locator.get<LocalizationManager>().addListener(languageListener);

    super.initState();
  }

  @override
  void dispose() {
    locator.get<ThemeManager>().removeListener(themeListener);
    locator.get<LocalizationManager>().removeListener(languageListener);
    super.dispose();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  languageListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router(widget.showHome),
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: locator.get<ThemeData>(),
      darkTheme: AppThemes.darkAppTheme,
      themeMode: locator.get<ThemeManager>().themeMode,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
