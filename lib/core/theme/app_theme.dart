import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/theme/text_theme.dart';

abstract class AppColors {
  ///lgiht theme colors
  static Color splashBackground = const Color.fromARGB(255, 204, 193, 218);
  static Color lBackground = const Color(0xffF2E9E9);
  static Color lForeground = const Color(0xFF7B6C96);
  static Color lSecondaryBackground = const Color(0xFFF5ECFF);
  static Color lContainerColor = const Color.fromARGB(255, 184, 176, 233);
  static Color doneDayColor =
      const Color.fromARGB(255, 51, 128, 53).withOpacity(0.3);
  static Color doneDayborderColor = const Color.fromARGB(255, 86, 241, 91);
  static Color falseDayColor =
      const Color.fromARGB(255, 167, 37, 28).withOpacity(0.3);
  static Color falseDayborderColor = const Color.fromARGB(255, 252, 41, 25);

  static Color primary = const Color(0xff674D9D);
  static Color palePrimary = const Color(0xFF7B6C96);
  static Color lightPrimary = const Color.fromARGB(255, 211, 205, 231);

  ///dark theme colors
  static Color dBackground = const Color(0xff292F3D);
}

class AppThemes {
  static ThemeData lightAppTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromARGB(255, 240, 238, 238),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          return Colors.black;
        },
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.lForeground, elevation: 8),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 6,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)))),
    ),
    textTheme: AppTextThemes.lightTextTheme,
  );

  static ThemeData darkAppTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dBackground,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
    ),
    textTheme: AppTextThemes.darkTextTheme,
  );
}
