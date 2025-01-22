import 'dart:developer';

import 'package:flutter/material.dart';

import '../services/cache/cache_helper.dart';
import '../constants.dart';
import 'text_theme.dart';

class AppThemes {
  /// define a singleton instance
  /// Singleton instance
  AppThemes._internal() {
    // Initialize themeNotifier
    themeNotifier.value =
        CacheHelper.getData(key: SharedPrefKeys.isDark) ?? false
            ? ThemeMode.dark
            : themeMode;
  }

  static final AppThemes instance = AppThemes._internal();

  static ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode {
    final bool? isDark = CacheHelper.getData(key: SharedPrefKeys.isDark);
    if (isDark == null) {
      log('System Theme mode');
      _themeMode = ThemeMode.system;
    } else {
      log('Cache Theme mode');
      isDark ? _themeMode = ThemeMode.dark : _themeMode = ThemeMode.light;
    }
    return _themeMode;
  }

  toggleTheme(bool? isDark) {
    if (isDark == null) {
      CacheHelper.removeData(
        key: SharedPrefKeys.isDark,
      );
      _themeMode = ThemeMode.system;
      themeNotifier.value = _themeMode;
      return;
    }
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    CacheHelper.saveData(key: SharedPrefKeys.isDark, value: isDark);
    themeNotifier.value = _themeMode;
  }

  final ValueNotifier<ThemeMode?> themeNotifier = ValueNotifier(null);
  //
  //! ----------------------------------- light theme -----------------------------------
  //
  static ThemeData lightAppTheme(BuildContext context) => ThemeData(
        colorScheme: const ColorScheme.light(
            brightness: Brightness.light,
            primary: Color(0xff7B57FC),
            onPrimary: Color(0xffFFFFFF),
            secondary: Color(0xffEEEBFF),
            onSecondary: Color(0xff7B57FC),
            primaryContainer: Color(0xffFFFFFF),
            onPrimaryContainer: Color(0xff001B36), // border color
            error: Color(0xff9500),
            onError: Color(0xfff0e0e0),
            surface: Color(0xffF7F7FE), // background
            // text on background && text on primaryContainer
            onSurface: Color(0xff001B36),
            surfaceDim: Color(0xff556987)),
        textTheme: AppTextThemes.lightTextTheme(context),
      );

  static ThemeData darkAppTheme(BuildContext context) => ThemeData(
        colorScheme: const ColorScheme.dark(
            brightness: Brightness.dark,
            primary: Color(0xff7B57FC),
            onPrimary: Color(0xffFFFFFF),
            //
            secondary: Color(0xff404F65),
            onSecondary: Color(0xffFFFFFF),
            //
            primaryContainer: Color(0xff333F51),
            onPrimaryContainer: Color(0xff8896AB), // border color
            //
            error: Color(0xff9500),
            onError: Color(0xfff0e0e0),
            surface: Color(0xff001B36),
            // text on background && text on primaryContainer
            onSurface: Color(0xffFFFFFF),
            surfaceDim: Color(0xffBBC3CF)),
        textTheme: AppTextThemes.lightTextTheme(context),
      );
}