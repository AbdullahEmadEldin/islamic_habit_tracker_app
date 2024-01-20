import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/data/models/azkar_category.dart';
import 'package:islamic_habit_tracker/data/service/habit_database/habits_db.dart';
import 'package:islamic_habit_tracker/logic/cubit/habit_cubit.dart';
import 'package:islamic_habit_tracker/view/pages/azkar_details.dart';
import 'package:islamic_habit_tracker/view/pages/azkar_screen.dart';
import 'package:islamic_habit_tracker/view/pages/bottom_nav_bar.dart';
import 'package:islamic_habit_tracker/view/pages/settings_screen.dart';
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
                  child: BottomNavBar(),
                )),
            routes: [
              GoRoute(
                name: AppRoutes.azkarScreen,
                path: 'azkarScreen',
                pageBuilder: (context, state) =>
                    const MaterialPage(child: AzkarScreen()),
                routes: [
                  GoRoute(
                    name: AppRoutes.azkarDetailsScreen,
                    path: 'azkarDetails',
                    builder: (context, state) {
                      final zikrCateogry = state.extra as ZikrCategory;
                      return AzkarDetails(
                        zikrCategory: zikrCateogry,
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                name: AppRoutes.settingsScreen,
                path: 'settingsScreen',
                pageBuilder: (context, state) =>
                    MaterialPage(child: SettingsScreen()),
              ),
            ])
      ],
    );
  }
}
