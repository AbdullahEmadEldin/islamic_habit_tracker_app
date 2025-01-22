import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/helpers/extensions.dart';
import 'package:islamic_habit_tracker/core/theme/app_fonts.dart';

class AppTextThemes {
  static TextTheme lightTextTheme(BuildContext context) => TextTheme(
        displayLarge: getTextStyle(
          context,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 24.0.responsive(context),
        ),
        displayMedium: getTextStyle(
          context,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 18.0.responsive(context),
        ),
        displaySmall: getTextStyle(
          context,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 16.0.responsive(context),
        ),
        bodyLarge: getTextStyle(
          context,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 14.0.responsive(context),
        ),
        bodyMedium: getTextStyle(
          context,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 12.0.responsive(context),
        ),
        bodySmall: getTextStyle(
          context,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 10.0.responsive(context),
        ),
      );
}

/// *******************************************************
/// This methods to make calling text styles more easier
/// And determine the needed properties in TextStyle.
/// *******************************************************
TextStyle getTextStyle(BuildContext context,
    {required double fontSize, FontWeight? fontWeight, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: AppFonts.typesetting,
    color: color,
  );
}
// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class AppTextThemes {
//   static TextTheme lightTextTheme = TextTheme(
//     bodyLarge: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 14.0,
//     ),
//     bodyMedium: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 12.0,
//     ),
//     displayLarge: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 32.0,
//       fontWeight: FontWeight.bold,
//       color: Color(0xff470550),
//     ),
//     displayMedium: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 21.0,
//       color: Color(0xff470550),
//     ),
//     displaySmall: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 16.0,
//       fontWeight: FontWeight.w600,
//     ),
//     titleLarge: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 20.0,
//       fontWeight: FontWeight.w600,
//     ),
//     titleMedium: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 18.0,
//       fontWeight: FontWeight.normal,
//     ),
//     titleSmall: TextStyle(
//       fontFamily: 'ArefRuqaa-Regular',
//       fontWeight: FontWeight.normal,
//     ),
//     headlineLarge: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 48.0,
//       fontWeight: FontWeight.normal,
//     ),
//   );
// // 2
//   static TextTheme darkTextTheme = TextTheme(
//     bodyLarge: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 14.0,
//     ),
//     bodyMedium: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 12.0,
//     ),
//     displayLarge: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 32.0,
//       fontWeight: FontWeight.bold,
//       color: Color(0xff470550),
//     ),
//     displayMedium: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 21.0,
//       color: Color(0xff470550),
//     ),
//     displaySmall: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 16.0,
//       fontWeight: FontWeight.w600,
//     ),
//     titleLarge: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 20.0,
//       fontWeight: FontWeight.w600,
//     ),
//     titleMedium: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 18.0,
//       fontWeight: FontWeight.normal,
//     ),
//     titleSmall: TextStyle(
//       fontFamily: 'ArefRuqaa-Regular',
//       fontWeight: FontWeight.normal,
//     ),
//     headlineLarge: TextStyle(
//       fontFamily: 'arabic_typesetting',
//       fontSize: 48.0,
//       fontWeight: FontWeight.normal,
//     ),
//   );
// }
