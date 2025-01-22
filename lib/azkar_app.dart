import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/locator.dart';
import 'core/navigation/router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_manager.dart';

class AzkarApp extends StatefulWidget {
  final bool showHome;
  const AzkarApp({super.key, required this.showHome});

  @override
  State<AzkarApp> createState() => _AzkarAppState();
}

class _AzkarAppState extends State<AzkarApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router(widget.showHome),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      title: 'Dawm',
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: locator.get<ThemeData>(),
      darkTheme: AppThemes.darkAppTheme,
      themeMode: locator.get<ThemeManager>().themeMode,
    );
  }
}
