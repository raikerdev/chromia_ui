import 'package:chromia_ui/src/tokens/color_tokens.dart';
import 'package:flutter/material.dart';

/// Semantic color system for Chromia UI.
///
/// Provides meaningful color names that describe their purpose
/// rather than their appearance, making it easier to maintain
/// consistency and support dark mode.
class ChromiaColors {
  const ChromiaColors({
    // Brand colors
    required this.primary,
    required this.primaryHover,
    required this.primaryPressed,
    required this.primaryDisabled,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryHover,
    required this.secondaryPressed,
    required this.secondaryDisabled,
    required this.onSecondary,
    // Surface colors
    required this.surface,
    required this.surfaceHover,
    required this.surfacePressed,
    required this.surfaceVariant,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.onSurface,
    required this.onSurfaceVariant,
    // Background colors
    required this.background,
    required this.onBackground,
    // State colors
    required this.success,
    required this.successHover,
    required this.onSuccess,
    required this.warning,
    required this.warningHover,
    required this.onWarning,
    required this.error,
    required this.errorHover,
    required this.onError,
    required this.info,
    required this.infoHover,
    required this.onInfo,
    // Border and divider
    required this.border,
    required this.borderHover,
    required this.borderStrong,
    required this.divider,
    // Text colors
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    // Other
    required this.shadow,
    required this.overlay,
    required this.scrim,
    required this.transparent,
  });

  // Brand colors
  final Color primary;
  final Color primaryHover;
  final Color primaryPressed;
  final Color primaryDisabled;
  final Color onPrimary;

  final Color secondary;
  final Color secondaryHover;
  final Color secondaryPressed;
  final Color secondaryDisabled;
  final Color onSecondary;

  // Surface colors
  final Color surface;
  final Color surfaceHover;
  final Color surfacePressed;
  final Color surfaceVariant;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color onSurface;
  final Color onSurfaceVariant;

  // Background colors
  final Color background;
  final Color onBackground;

  // State colors
  final Color success;
  final Color successHover;
  final Color onSuccess;

  final Color warning;
  final Color warningHover;
  final Color onWarning;

  final Color error;
  final Color errorHover;
  final Color onError;

  final Color info;
  final Color infoHover;
  final Color onInfo;

  // Border and divider
  final Color border;
  final Color borderHover;
  final Color borderStrong;
  final Color divider;

  // Text colors
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;

  // Other
  final Color shadow;
  final Color overlay;
  final Color scrim;
  final Color transparent;

  /// Default light color scheme
  factory ChromiaColors.light() {
    return const ChromiaColors(
      // Brand colors
      primary: ColorTokens.primary600,
      primaryHover: ColorTokens.primary800,
      primaryPressed: ColorTokens.primary900,
      primaryDisabled: ColorTokens.primary200,
      onPrimary: ColorTokens.neutral0,
      secondary: ColorTokens.secondary600,
      secondaryHover: ColorTokens.secondary700,
      secondaryPressed: ColorTokens.secondary800,
      secondaryDisabled: ColorTokens.secondary200,
      onSecondary: ColorTokens.neutral0,
      // Surface colors
      surface: ColorTokens.neutral0,
      surfaceHover: ColorTokens.neutral200,
      surfacePressed: ColorTokens.neutral300,
      surfaceVariant: ColorTokens.neutral100,
      surfaceContainer: ColorTokens.neutral200,
      surfaceContainerHigh: ColorTokens.neutral200,
      surfaceContainerHighest: ColorTokens.neutral300,
      onSurface: ColorTokens.neutral900,
      onSurfaceVariant: ColorTokens.neutral700,
      // Background colors
      background: ColorTokens.neutral50,
      onBackground: ColorTokens.neutral900,
      // State colors
      success: ColorTokens.success600,
      successHover: ColorTokens.success700,
      onSuccess: ColorTokens.neutral0,
      warning: ColorTokens.warning600,
      warningHover: ColorTokens.warning700,
      onWarning: ColorTokens.neutral0,
      error: ColorTokens.error600,
      errorHover: ColorTokens.error700,
      onError: ColorTokens.neutral0,
      info: ColorTokens.info600,
      infoHover: ColorTokens.info700,
      onInfo: ColorTokens.neutral0,
      // Border and divider
      border: ColorTokens.neutral300,
      borderHover: ColorTokens.neutral400,
      borderStrong: ColorTokens.neutral500,
      divider: ColorTokens.neutral200,
      // Text colors
      textPrimary: ColorTokens.neutral900,
      textSecondary: ColorTokens.neutral700,
      textTertiary: ColorTokens.neutral500,
      textDisabled: ColorTokens.neutral500,
      // Other
      shadow: ColorTokens.neutral900,
      overlay: Color(0x52000000),
      scrim: Color(0x52000000),
      transparent: Color(0x00FFFFFF),
    );
  }

  /// Default dark color scheme
  factory ChromiaColors.dark() {
    return const ChromiaColors(
      // Brand colors
      primary: ColorTokens.primary400,
      primaryHover: ColorTokens.primary300,
      primaryPressed: ColorTokens.primary200,
      primaryDisabled: ColorTokens.primary800,
      onPrimary: ColorTokens.neutral900,
      secondary: ColorTokens.secondary400,
      secondaryHover: ColorTokens.secondary300,
      secondaryPressed: ColorTokens.secondary200,
      secondaryDisabled: ColorTokens.secondary800,
      onSecondary: ColorTokens.neutral900,
      // Surface colors
      surface: ColorTokens.neutral900,
      surfaceHover: ColorTokens.neutral800,
      surfacePressed: ColorTokens.neutral700,
      surfaceVariant: ColorTokens.neutral800,
      surfaceContainer: ColorTokens.neutral800,
      surfaceContainerHigh: ColorTokens.neutral800,
      surfaceContainerHighest: ColorTokens.neutral700,
      onSurface: ColorTokens.neutral100,
      onSurfaceVariant: ColorTokens.neutral300,
      // Background colors
      background: ColorTokens.neutral1000,
      onBackground: ColorTokens.neutral100,
      // State colors
      success: ColorTokens.success400,
      successHover: ColorTokens.success300,
      onSuccess: ColorTokens.neutral900,
      warning: ColorTokens.warning400,
      warningHover: ColorTokens.warning300,
      onWarning: ColorTokens.neutral900,
      error: ColorTokens.error400,
      errorHover: ColorTokens.error300,
      onError: ColorTokens.neutral900,
      info: ColorTokens.info400,
      infoHover: ColorTokens.info300,
      onInfo: ColorTokens.neutral900,
      // Border and divider
      border: ColorTokens.neutral700,
      borderHover: ColorTokens.neutral600,
      borderStrong: ColorTokens.neutral500,
      divider: ColorTokens.neutral800,
      // Text colors
      textPrimary: ColorTokens.neutral100,
      textSecondary: ColorTokens.neutral300,
      textTertiary: ColorTokens.neutral500,
      textDisabled: ColorTokens.neutral600,
      // Other
      shadow: ColorTokens.neutral1000,
      overlay: Color(0x52FFFFFF),
      scrim: Color(0x52000000),
      transparent: ColorTokens.transparent,
    );
  }

  /// Creates a color scheme from a primary color
  factory ChromiaColors.fromPrimary(Color primaryColor, {bool isDark = false}) {
    final ChromiaColors base = isDark ? ChromiaColors.dark() : ChromiaColors.light();

    return base.copyWith(
      primary: primaryColor,
      primaryHover: _adjustBrightness(primaryColor, isDark ? 0.1 : -0.1),
      primaryPressed: _adjustBrightness(primaryColor, isDark ? 0.2 : -0.2),
      primaryDisabled: _adjustBrightness(primaryColor, isDark ? -0.3 : 0.3),
    );
  }

  /// Adjusts the brightness of a color
  static Color _adjustBrightness(Color color, double amount) {
    final HSLColor hsl = HSLColor.fromColor(color);
    final double lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Creates a copy of this color scheme with the given fields replaced
  ChromiaColors copyWith({
    Color? primary,
    Color? primaryHover,
    Color? primaryPressed,
    Color? primaryDisabled,
    Color? onPrimary,
    Color? secondary,
    Color? secondaryHover,
    Color? secondaryPressed,
    Color? secondaryDisabled,
    Color? onSecondary,
    Color? surface,
    Color? surfaceHover,
    Color? surfacePressed,
    Color? surfaceVariant,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? background,
    Color? onBackground,
    Color? success,
    Color? successHover,
    Color? onSuccess,
    Color? warning,
    Color? warningHover,
    Color? onWarning,
    Color? error,
    Color? errorHover,
    Color? onError,
    Color? info,
    Color? infoHover,
    Color? onInfo,
    Color? border,
    Color? borderHover,
    Color? borderStrong,
    Color? divider,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? shadow,
    Color? overlay,
    Color? scrim,
    Color? transparent,
  }) {
    return ChromiaColors(
      primary: primary ?? this.primary,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryPressed: primaryPressed ?? this.primaryPressed,
      primaryDisabled: primaryDisabled ?? this.primaryDisabled,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      secondaryHover: secondaryHover ?? this.secondaryHover,
      secondaryPressed: secondaryPressed ?? this.secondaryPressed,
      secondaryDisabled: secondaryDisabled ?? this.secondaryDisabled,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      surfaceHover: surfaceHover ?? this.surfaceHover,
      surfacePressed: surfacePressed ?? this.surfacePressed,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest: surfaceContainerHighest ?? this.surfaceContainerHighest,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      success: success ?? this.success,
      successHover: successHover ?? this.successHover,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      warningHover: warningHover ?? this.warningHover,
      onWarning: onWarning ?? this.onWarning,
      error: error ?? this.error,
      errorHover: errorHover ?? this.errorHover,
      onError: onError ?? this.onError,
      info: info ?? this.info,
      infoHover: infoHover ?? this.infoHover,
      onInfo: onInfo ?? this.onInfo,
      border: border ?? this.border,
      borderHover: borderHover ?? this.borderHover,
      borderStrong: borderStrong ?? this.borderStrong,
      divider: divider ?? this.divider,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      shadow: shadow ?? this.shadow,
      overlay: overlay ?? this.overlay,
      scrim: scrim ?? this.scrim,
      transparent: transparent ?? this.transparent,
    );
  }
}

/// Extension to add missing neutral color shades
extension ColorTokensExtension on ColorTokens {
  /// Neutral 850 color (between 800 and 900)
  static const Color neutral850 = Color(0xFF303030);
}
