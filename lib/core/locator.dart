import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_habit_tracker/core/localization/localization_manager.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/core/theme/theme_manager.dart';
import 'package:islamic_habit_tracker/data/service/habit_database/habits_db.dart';
import 'package:islamic_habit_tracker/data/service/notification_service.dart';
import 'package:islamic_habit_tracker/logic/cubits/habit_cubit.dart';

final locator = GetIt.instance;
ThemeData _appTheme = AppThemes.lightAppTheme;
LocalizationManager _appLanguage = LocalizationManager();
ThemeManager _themeManager = ThemeManager();

void setUp() {
  locator.registerSingleton<ThemeData>(_appTheme);
  locator.registerLazySingleton<ThemeManager>(() => _themeManager);
  locator.registerLazySingleton<LocalizationManager>(() => _appLanguage);
  locator.registerLazySingleton<HabitDB>(() => HabitDB());
  locator.registerLazySingleton<HabitsCubit>(() => HabitsCubit(db: HabitDB()));
  locator
      .registerLazySingleton<NotificationService>(() => NotificationService());
}
