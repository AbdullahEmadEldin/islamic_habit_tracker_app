import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_habit_tracker/core/cache/cache_helper.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/navigation/router.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/core/theme/theme_manager.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
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
  late ThemeData _lightTheme;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 866),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // Initialize themes here, after ScreenUtil is initialized
        _lightTheme = AppThemes.lightAppTheme(context);

        return MaterialApp.router(
          routerConfig: AppRouter.router(widget.showHome),
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          theme: _lightTheme,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}
