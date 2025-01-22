import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/azkar_app.dart';
import 'package:islamic_habit_tracker/core/locator.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/cache/cache_helper.dart';
import 'core/constants.dart';
import 'core/localization/localization_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();

  /// Init shared preferences
  await CacheHelper.init();

  ///
  /// EasyLocalization Initialization.
  await EasyLocalization.ensureInitialized();

  /// Get App Lang from cache.
  final String startLocale = await LanguageManager.getAppLang();
  log('====== $startLocale');
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(
    EasyLocalization(
      startLocale: Locale(startLocale),
      supportedLocales: [
        Locale(LanguageType.english.code),
        Locale(LanguageType.arabic.code)
      ],
      path: AppConstants.translationsPath,
      fallbackLocale: const Locale('ar'),
      child: AzkarApp(showHome: showHome),
    ),
  );
}
