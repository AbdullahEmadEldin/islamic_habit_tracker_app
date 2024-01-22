import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/service/habit_database/habits_db.dart';
import 'package:islamic_habit_tracker/logic/cubit/habit_cubit.dart';
import 'package:islamic_habit_tracker/view/pages/bottom_nav_bar.dart';
import 'package:islamic_habit_tracker/view/pages/habits_details.dart';
import 'package:islamic_habit_tracker/view/pages/splash_screen.dart';

class AppRouter {
  static GoRouter router() {
    return GoRouter(
      initialLocation: '/bottomBar',
      routes: [
        GoRoute(
          name: AppRoutes.splashScreen,
          path: '/splash',
          pageBuilder: (context, state) =>
              const MaterialPage(child: SplashScreen()),
        ),
        GoRoute(
          name: AppRoutes.homeScreen,
          path: '/bottomBar',
          pageBuilder: (context, state) => MaterialPage(
              child: BlocProvider(
            create: (context) => HabitsCubit(db: locator.get<HabitDB>()),
            child: const BottomNavBar(),
          )),
          routes: [
            GoRoute(
              name: AppRoutes.habitsDetails,
              path: 'habitdetails',
              pageBuilder: (context, state) {
                final habit = state.extra as Habit;
                return MaterialPage(
                  child: BlocProvider(
                    create: (context) =>
                        HabitsCubit(db: locator.get<HabitDB>()),
                    child: HabitsDetails(
                      mainHabit: habit,
                    ),
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
