import 'dart:developer';

import 'package:flutter/material.dart';

//*========================== IMP Explanation ========================== *//
/// This Extension to calculate the responsive dimension of a widget
/// according to the screen size and the device pixel ratio
/// it could be used with determining width or height and Widget or text.
//! Why not using MediaQuery ??????????
//? ===>> As in multiple cases the the widget size to the device pixel ratio will be too small or too large.
//? So we have to calculate the scale factor and limit it with max and min values.
//? STEPS:
//! 1- Determine a break point for each platform
///   ======>>> It's determined by approximation according to width only not height. <<<<=======.
///   On this BP the base dimension will set.
///   Under this BP the base dimension will be multiplied by the scale factor to decrease it.
///   Above this BP the base dimension will be multiplied by the scale factor to increase it.
/// ?===> And to avoid too small or too large dimension we will limit it with [min] and [max] values.
//! 2- get Scale Factor //? ==> as BP also there is a Scale Factor for each Platform.
//?    SF = currentScreenSize(from MediaQuery) / BP.
//! 2- get Responsive Dimension
///?    RD = baseDimension * SF
extension Responsive on double {
  double responsive(BuildContext context, {bool debug = false}) {
    final Size currentSize = MediaQuery.sizeOf(context);
    final scaleFactor = _getScaleFactor(currentSize);
    double responsiveDimension = this * scaleFactor;
    double upperLimit = this * 1.1;
    double lowerLimit = this * 0.8;

    responsiveDimension = responsiveDimension.clamp(lowerLimit, upperLimit);
    if (debug) {
      log('Base Dimension: $this');
      log('Scale Factor: $scaleFactor');
      log('Responsive Dimension: $responsiveDimension');
    }
    return responsiveDimension;
  }

  static double _getScaleFactor(Size currentSize) {
    final width = currentSize.width;
    double scaleFactor;
    if (width < 600) {
      scaleFactor =
          currentSize.width / 400; // approximated breakPoint for mobile
    } else if (width < 900) {
      scaleFactor = currentSize.width / 700;
    } else {
      scaleFactor = currentSize.width / 1000;
    }

    return double.parse(scaleFactor.toStringAsFixed(1));
  }
}

/// This extension on context to make calling navigation methods easier.
extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

/// This extension on context to make calling theme methods easier.
extension ThemeExtension on BuildContext {
  // Color Scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // You might also want these common theme accessors:
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Brightness
  Brightness get brightness => theme.brightness;
  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

///
/// This extension to handle the string length to a limited length
/// you can determine the max length for the string.
extension LimitStr on String {
  String limitStringLength(int maxLength) {
    if (length > maxLength) {
      return '${substring(0, maxLength)}...';
    } else {
      return this;
    }
  }
}
