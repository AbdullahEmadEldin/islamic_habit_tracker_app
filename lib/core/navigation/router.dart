import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/features/azkar/data/models/azkar_category.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/logic/cubits/create_habit_cubit/create_habit_cubit.dart';
import 'package:islamic_habit_tracker/logic/cubits/delete_habits_cubits/delete_habits_cubit.dart';
import 'package:islamic_habit_tracker/logic/cubits/get_habits_cubit/get_habits_cubit.dart';
import 'package:islamic_habit_tracker/features/azkar/view/pages/azkar_details.dart';
import 'package:islamic_habit_tracker/view/pages/bottom_nav_bar.dart';
import 'package:islamic_habit_tracker/view/pages/habits_details.dart';
import 'package:islamic_habit_tracker/view/pages/onboarding/on_bording_collector.dart';

class AppRouter {
  static GoRouter router(bool showHome) {
    return GoRouter(
      initialLocation: showHome ? '/bottomBar' : '/onBoarding',
      routes: [
        GoRoute(
          name: AppRoutes.onBoarding,
          path: '/onBoarding',
          pageBuilder: (context, state) =>
              const MaterialPage(child: OnBoardingCollector()),
        ),
        GoRoute(
          name: AppRoutes.homeScreen,
          path: '/bottomBar',
          pageBuilder: (context, state) => MaterialPage(
              child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetHabitsCubit(),
              ),
              BlocProvider(
                create: (context) => DeleteHabitsCubit(),
              ),
              BlocProvider(
                create: (context) => CreateHabitCubit(),
              )
            ],
            child: const BottomNavBar(),
          )),
          routes: [
            GoRoute(
              name: AppRoutes.habitsDetails,
              path: 'habit_details',
              pageBuilder: (context, state) {
                final habit = state.extra as Habit;
                return MaterialPage(
                  child: HabitsDetails(
                    mainHabit: habit,
                  ),
                );
              },
            ),
            GoRoute(
              name: AppRoutes.azkarDetailsScreen,
              path: 'azkarDetails',
              pageBuilder: (context, state) {
                final azkar = state.extra as ZikrCategory;
                return MaterialPage(child: AzkarDetails(zikrCategory: azkar));
              },
            )
          ],
        )
      ],
    );
  }
}
