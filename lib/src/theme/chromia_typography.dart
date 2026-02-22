import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:chromia_ui/src/tokens/typography_tokens.dart';
import 'package:flutter/material.dart';

/// Semantic typography system for Chromia UI.
///
/// Provides predefined text styles for different use cases,
/// ensuring consistency and visual hierarchy across the application.
class ChromiaTypography {
  const ChromiaTypography({
    // Display styles
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    // Headline styles
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    // Title styles
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    // Body styles
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    // Label styles
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    // Caption styles
    required this.caption,
    required this.overline,
    // Code style
    required this.code,
  });

  // Display styles (largest text)
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;

  // Headline styles (page titles)
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;

  // Title styles (section titles)
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;

  // Body styles (main content)
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  // Label styles (buttons, form labels)
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  // Caption styles (supporting text)
  final TextStyle caption;
  final TextStyle overline;

  // Code style
  final TextStyle code;

  /// Default typography configuration
  factory ChromiaTypography.defaultTypography() {
    return const ChromiaTypography(
      // Display styles
      displayLarge: TextStyle(
        fontSize: TypographyTokens.fontSize72,
        fontWeight: TypographyTokens.bold,
        height: TypographyTokens.lineHeightTight,
        letterSpacing: TypographyTokens.letterSpacingTight,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      displayMedium: TextStyle(
        fontSize: TypographyTokens.fontSize56,
        fontWeight: TypographyTokens.bold,
        height: TypographyTokens.lineHeightTight,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: TypographyTokens.fontSize48,
        fontWeight: TypographyTokens.semiBold,
        height: TypographyTokens.lineHeightTight,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),

      // Headline styles
      headlineLarge: TextStyle(
        fontSize: TypographyTokens.fontSize40,
        fontWeight: TypographyTokens.semiBold,
        height: TypographyTokens.lineHeightTight,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      headlineMedium: TextStyle(
        fontSize: TypographyTokens.fontSize32,
        fontWeight: TypographyTokens.semiBold,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: TypographyTokens.fontSize28,
        fontWeight: TypographyTokens.medium,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),

      // Title styles
      titleLarge: TextStyle(
        fontSize: TypographyTokens.fontSize24,
        fontWeight: TypographyTokens.medium,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: TypographyTokens.fontSize20,
        fontWeight: TypographyTokens.medium,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: TypographyTokens.fontSize18,
        fontWeight: TypographyTokens.medium,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),

      // Body styles
      bodyLarge: TextStyle(
        fontSize: TypographyTokens.fontSize16,
        fontWeight: TypographyTokens.regular,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: TypographyTokens.fontSize14,
        fontWeight: TypographyTokens.regular,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: TypographyTokens.fontSize12,
        fontWeight: TypographyTokens.regular,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),

      // Label styles
      labelLarge: TextStyle(
        fontSize: TypographyTokens.fontSize16,
        fontWeight: TypographyTokens.medium,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingWide,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      labelMedium: TextStyle(
        fontSize: TypographyTokens.fontSize14,
        fontWeight: TypographyTokens.medium,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingWide,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      labelSmall: TextStyle(
        fontSize: TypographyTokens.fontSize12,
        fontWeight: TypographyTokens.medium,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingWide,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),

      // Caption styles
      caption: TextStyle(
        fontSize: TypographyTokens.fontSize12,
        fontWeight: TypographyTokens.regular,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),
      overline: TextStyle(
        fontSize: TypographyTokens.fontSize10,
        fontWeight: TypographyTokens.medium,
        height: TypographyTokens.lineHeightNormal,
        letterSpacing: TypographyTokens.letterSpacingWidest,
        fontFamily: TypographyTokens.defaultFontFamily,
      ),

      // Code style
      code: TextStyle(
        fontSize: TypographyTokens.fontSize14,
        fontWeight: TypographyTokens.regular,
        height: TypographyTokens.lineHeightRelaxed,
        letterSpacing: TypographyTokens.letterSpacingNormal,
        fontFamily: TypographyTokens.monospaceFontFamily,
      ),
    );
  }

  /// Creates a copy of this typography with the given fields replaced
  ChromiaTypography copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? caption,
    TextStyle? overline,
    TextStyle? code,
  }) {
    return ChromiaTypography(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
      code: code ?? this.code,
    );
  }

  /// Applies a color to all text styles
  ChromiaTypography apply({required Color color}) {
    return ChromiaTypography(
      displayLarge: displayLarge.copyWith(color: color),
      displayMedium: displayMedium.copyWith(color: color),
      displaySmall: displaySmall.copyWith(color: color),
      headlineLarge: headlineLarge.copyWith(color: color),
      headlineMedium: headlineMedium.copyWith(color: color),
      headlineSmall: headlineSmall.copyWith(color: color),
      titleLarge: titleLarge.copyWith(color: color),
      titleMedium: titleMedium.copyWith(color: color),
      titleSmall: titleSmall.copyWith(color: color),
      bodyLarge: bodyLarge.copyWith(color: color),
      bodyMedium: bodyMedium.copyWith(color: color),
      bodySmall: bodySmall.copyWith(color: color),
      labelLarge: labelLarge.copyWith(color: color),
      labelMedium: labelMedium.copyWith(color: color),
      labelSmall: labelSmall.copyWith(color: color),
      caption: caption.copyWith(color: color),
      overline: overline.copyWith(color: color),
      code: code.copyWith(color: color),
    );
  }
}

enum ChromiaTypographyType {
  // Display styles
  displayLarge,
  displayMedium,
  displaySmall,
  // Headline styles
  headlineLarge,
  headlineMedium,
  headlineSmall,
  // Title styles
  titleLarge,
  titleMedium,
  titleSmall,
  // Body styles
  bodyLarge,
  bodyMedium,
  bodySmall,
  // Label styles
  labelLarge,
  labelMedium,
  labelSmall,
  // Caption styles
  caption,
  overline,
  // Code style
  code;

  TextStyle getTextStyle(BuildContext context) {
    final typography = context.chromiaTheme.typography;
    switch (this) {
      case ChromiaTypographyType.displayLarge:
        return typography.displayLarge;
      case ChromiaTypographyType.displayMedium:
        return typography.displayMedium;
      case ChromiaTypographyType.displaySmall:
        return typography.displaySmall;
      case ChromiaTypographyType.headlineLarge:
        return typography.headlineLarge;
      case ChromiaTypographyType.headlineMedium:
        return typography.headlineMedium;
      case ChromiaTypographyType.headlineSmall:
        return typography.headlineSmall;
      case ChromiaTypographyType.titleLarge:
        return typography.titleLarge;
      case ChromiaTypographyType.titleMedium:
        return typography.titleMedium;
      case ChromiaTypographyType.titleSmall:
        return typography.titleSmall;
      case ChromiaTypographyType.bodyLarge:
        return typography.bodyLarge;
      case ChromiaTypographyType.bodyMedium:
        return typography.bodyMedium;
      case ChromiaTypographyType.bodySmall:
        return typography.bodySmall;
      case ChromiaTypographyType.labelLarge:
        return typography.labelLarge;
      case ChromiaTypographyType.labelMedium:
        return typography.labelMedium;
      case ChromiaTypographyType.labelSmall:
        return typography.labelSmall;
      case ChromiaTypographyType.caption:
        return typography.caption;
      case ChromiaTypographyType.overline:
        return typography.overline;
      case ChromiaTypographyType.code:
        return typography.code;
    }
  }
}