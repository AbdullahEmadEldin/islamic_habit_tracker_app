// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `dawm`
  String get Dawm {
    return Intl.message(
      'dawm',
      name: 'Dawm',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Daily routine`
  String get dailyRoutine {
    return Intl.message(
      'Daily routine',
      name: 'dailyRoutine',
      desc: '',
      args: [],
    );
  }

  /// `azkar`
  String get Azkar {
    return Intl.message(
      'azkar',
      name: 'Azkar',
      desc: '',
      args: [],
    );
  }

  /// `Count:`
  String get count {
    return Intl.message(
      'Count:',
      name: 'count',
      desc: '',
      args: [],
    );
  }

  /// `Search for zikr...`
  String get searchZikr {
    return Intl.message(
      'Search for zikr...',
      name: 'searchZikr',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `App Theme`
  String get appTheme {
    return Intl.message(
      'App Theme',
      name: 'appTheme',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Help & Suggestions`
  String get help {
    return Intl.message(
      'Help & Suggestions',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get About {
    return Intl.message(
      'About App',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get endlish {
    return Intl.message(
      'English',
      name: 'endlish',
      desc: '',
      args: [],
    );
  }

  /// `Daily Habits`
  String get dailyHabits {
    return Intl.message(
      'Daily Habits',
      name: 'dailyHabits',
      desc: '',
      args: [],
    );
  }

  /// `All habits`
  String get allHabits {
    return Intl.message(
      'All habits',
      name: 'allHabits',
      desc: '',
      args: [],
    );
  }

  /// `You haven''t add any habits yet`
  String get emptyHabits {
    return Intl.message(
      'You haven\'\'t add any habits yet',
      name: 'emptyHabits',
      desc: '',
      args: [],
    );
  }

  /// `Add habit`
  String get addHabit {
    return Intl.message(
      'Add habit',
      name: 'addHabit',
      desc: '',
      args: [],
    );
  }

  /// `Delete habit`
  String get deleteHabit {
    return Intl.message(
      'Delete habit',
      name: 'deleteHabit',
      desc: '',
      args: [],
    );
  }

  /// `Track habit`
  String get trackHabit {
    return Intl.message(
      'Track habit',
      name: 'trackHabit',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get Statistics {
    return Intl.message(
      'Statistics',
      name: 'Statistics',
      desc: '',
      args: [],
    );
  }

  /// `Streak`
  String get streak {
    return Intl.message(
      'Streak',
      name: 'streak',
      desc: '',
      args: [],
    );
  }

  /// `Do you want remove habit`
  String get doYouWantRemoveHabit {
    return Intl.message(
      'Do you want remove habit',
      name: 'doYouWantRemoveHabit',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get NO {
    return Intl.message(
      'No',
      name: 'NO',
      desc: '',
      args: [],
    );
  }

  /// `Habit starting date`
  String get habitStartingDate {
    return Intl.message(
      'Habit starting date',
      name: 'habitStartingDate',
      desc: '',
      args: [],
    );
  }

  /// `Acheivement percentage`
  String get AcheivementPercent {
    return Intl.message(
      'Acheivement percentage',
      name: 'AcheivementPercent',
      desc: '',
      args: [],
    );
  }

  /// `Achieved`
  String get doneLabelColor {
    return Intl.message(
      'Achieved',
      name: 'doneLabelColor',
      desc: '',
      args: [],
    );
  }

  /// `Not acheived`
  String get notAchieved {
    return Intl.message(
      'Not acheived',
      name: 'notAchieved',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome in Dawm`
  String get onboradingone {
    return Intl.message(
      'Welcome in Dawm',
      name: 'onboradingone',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get onboradingonedetail {
    return Intl.message(
      '',
      name: 'onboradingonedetail',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get onboardingtwo {
    return Intl.message(
      '',
      name: 'onboardingtwo',
      desc: '',
      args: [],
    );
  }

  /// `Delete all data`
  String get DeleteAllData {
    return Intl.message(
      'Delete all data',
      name: 'DeleteAllData',
      desc: '',
      args: [],
    );
  }

  /// `Not starting yet`
  String get notSartingYet {
    return Intl.message(
      'Not starting yet',
      name: 'notSartingYet',
      desc: '',
      args: [],
    );
  }

  /// `Text copied to clipboard`
  String get textCoppied {
    return Intl.message(
      'Text copied to clipboard',
      name: 'textCoppied',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
