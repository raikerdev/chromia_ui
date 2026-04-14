import 'package:flutter/material.dart';

/// Typography tokens for consistent text styling.
///
/// Provides standardized font sizes, weights, line heights, and letter spacing
/// to maintain visual hierarchy and readability.
class TypographyTokens {
  TypographyTokens._();

  // Font sizes
  static const double fontSize10 = 10.0;
  static const double fontSize11 = 11.0;
  static const double fontSize12 = 12.0;
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize22 = 22.0;
  static const double fontSize24 = 24.0;
  static const double fontSize28 = 28.0;
  static const double fontSize32 = 32.0;
  static const double fontSize36 = 36.0;
  static const double fontSize45 = 45.0;
  static const double fontSize57 = 57.0;

  // Font weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // Line heights (relative to font size)
  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.75;
  static const double lineHeightLoose = 2.0;

  // Letter spacing
  static const double letterSpacingTight = -0.5;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.5;
  static const double letterSpacingWider = 1.0;
  static const double letterSpacingWidest = 1.5;

  /// Returns all font sizes as a map
  static Map<String, double> get allFontSizes => {
    'fontSize10': fontSize10,
    'fontSize11': fontSize11,
    'fontSize12': fontSize12,
    'fontSize14': fontSize14,
    'fontSize16': fontSize16,
    'fontSize22': fontSize22,
    'fontSize24': fontSize24,
    'fontSize28': fontSize28,
    'fontSize32': fontSize32,
    'fontSize36': fontSize36,
    'fontSize45': fontSize45,
    'fontSize57': fontSize57,
  };

  /// Returns all font weights as a map
  static Map<String, FontWeight> get allFontWeights => {
    'thin': thin,
    'extraLight': extraLight,
    'light': light,
    'regular': regular,
    'medium': medium,
    'semiBold': semiBold,
    'bold': bold,
    'extraBold': extraBold,
    'black': black,
  };
}
