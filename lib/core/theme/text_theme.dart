// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextThemes {
  static TextTheme lightTextTheme(BuildContext context) => TextTheme(
        bodyLarge: TextStyle(
          fontFamily: 'arabic_typesetting',
          fontSize: 14.0.sp,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'arabic_typesetting',
          fontSize: 12.0.sp,
        ),
        displayLarge: TextStyle(
          fontFamily: 'arabic_typesetting',
          fontSize: 32.0.sp,
          fontWeight: FontWeight.bold,
          color: Color(0xff470550),
        ),
        displayMedium: TextStyle(
          fontFamily: 'arabic_typesetting',
          fontSize: 28.0.sp,
          color: Color(0xff470550),
        ),
        displaySmall: TextStyle(
          fontFamily: 'arabic_typesetting',
          fontSize: 26.0.sp,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          fontFamily: 'arabic_typesetting',
          fontSize: 24.0.sp,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontFamily: 'arabic_typesetting',
          fontSize: 22.0.sp,
          fontWeight: FontWeight.normal,
        ),
        titleSmall: TextStyle(
          fontFamily: 'ArefRuqaa-Regular',
          fontWeight: FontWeight.normal,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'arabic_typesetting',
          fontSize: 48.0.sp,
          fontWeight: FontWeight.normal,
        ),
      );
// 2
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'arabic_typesetting',
      fontSize: 14.0.sp,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'arabic_typesetting',
      fontSize: 12.0,
    ),
    displayLarge: TextStyle(
      fontFamily: 'arabic_typesetting',
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Color(0xff470550),
    ),
    displayMedium: TextStyle(
      fontFamily: 'arabic_typesetting',
      fontSize: 21.0,
      color: Color(0xff470550),
    ),
    displaySmall: TextStyle(
      fontFamily: 'arabic_typesetting',
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontFamily: 'arabic_typesetting',
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontFamily: 'arabic_typesetting',
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
    ),
    titleSmall: TextStyle(
      fontFamily: 'ArefRuqaa-Regular',
      fontWeight: FontWeight.normal,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'arabic_typesetting',
      fontSize: 48.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
