import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/theme/text_theme.dart';

Color lBackground = const Color(0xffF2E9E9);
Color lForeground = const Color(0xff470550);
Color lSecondaryBackground = const Color(0xFFF5ECFF);
Color lContainerColor = const Color.fromARGB(255, 184, 176, 233);

class AppThemes {
  static ThemeData lightAppTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lBackground,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          return Colors.black;
        },
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lForeground, elevation: 8),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          elevation: 6,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)))),
    ),
    textTheme: AppTextThemes.lightTextTheme,
  );

  static ThemeData darkAppTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
    ),
    textTheme: AppTextThemes.darkTextTheme,
  );
}
