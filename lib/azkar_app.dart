import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/navigation/router.dart';
import 'core/services/connectivity/cubit/internet_cubit.dart';
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
    return ValueListenableBuilder<ThemeMode?>(
        valueListenable: AppThemes.instance.themeNotifier,
        builder: (context, themeMode, child) {
          ThemeData currentTheme = AppThemes.lightAppTheme(context);
          if (themeMode == ThemeMode.dark) {
            currentTheme = AppThemes.darkAppTheme(context);
          } else {
            currentTheme = AppThemes.lightAppTheme(context);
          }
          return BlocProvider(
            create: (context) => InternetCubit()..monitoringInternetState(),
            child: MaterialApp.router(
              routerConfig: AppRouter.router(widget.showHome),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              title: 'Dawm',
              locale: context.locale,
              themeMode: themeMode,
              theme: currentTheme,
              darkTheme: AppThemes.darkAppTheme(context),
            ),
          );
        });
  }
}
