import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic_habit_tracker/core/localization/localization_manager.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/navigation/router.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/core/theme/theme_manager.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

///this instance is the main and only instance to create database
///you can use it to access store and create Box for each enitity
//late ObjectBox mainObjectbox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  // mainObjectbox = await ObjectBox.createDB();
  runApp(const AzkarApp());
}

class AzkarApp extends StatefulWidget {
  const AzkarApp({super.key});

  @override
  State<AzkarApp> createState() => _AzkarAppState();
}

class _AzkarAppState extends State<AzkarApp> {
  @override

  ///these listners for switching theme
  @override
  void initState() {
    locator.get<ThemeManager>().addListener(themeListener);
    locator.get<LocalizationManager>().addListener(languageLisnter);
    super.initState();
  }

  void dispose() {
    locator.get<ThemeManager>().removeListener(themeListener);
    locator.get<LocalizationManager>().removeListener(languageLisnter);
    super.dispose();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  languageLisnter() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router(),
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
