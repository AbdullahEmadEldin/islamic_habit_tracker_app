import 'package:get_it/get_it.dart';
import 'package:islamic_habit_tracker/core/localization/localization_manager.dart';
import 'package:islamic_habit_tracker/data/service/habit_database/habits_db.dart';
import 'package:islamic_habit_tracker/logic/cubits/delete_habits_cubits/delete_habits_cubit.dart';

final locator = GetIt.instance;
LanguageManager _appLanguage = LanguageManager();

void setUp() {
  locator.registerLazySingleton<LanguageManager>(() => _appLanguage);
  locator.registerLazySingleton<HabitDB>(() => HabitDB());

  locator.registerLazySingleton<DeleteHabitsCubit>(() => DeleteHabitsCubit());

  // locator
  //     .registerLazySingleton<NotificationService>(() => NotificationService());
}
