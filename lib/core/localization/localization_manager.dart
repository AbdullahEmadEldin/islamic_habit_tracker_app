import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../services/cache/cache_helper.dart';
import '../constants.dart';


enum LanguageType {
  english('en'),
  arabic('ar');

  final String code;

  const LanguageType(this.code);
}

class LanguageManager {
  static Future<void> changeAppLang(BuildContext context,
      {required LanguageType lang}) async {
    await CacheHelper.saveData(
        key: SharedPrefKeys.lang, value: lang.code);
    context.setLocale(Locale(lang.code));
  }

  static Future<String> getAppLang() async {
    return await CacheHelper.getData(key: SharedPrefKeys.lang) ??
        LanguageType.arabic.code;
  }
}