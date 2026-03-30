import 'package:chromia_ui/src/tokens/color_tokens.dart';
import 'package:flutter/material.dart';

/// Semantic color system for Chromia UI, aligned with Material Design 3 color roles.
///
/// Color roles follow MD3 conventions:
/// - **primary / onPrimary / primaryContainer / onPrimaryContainer**
/// - **secondary / onSecondary / secondaryContainer / onSecondaryContainer**
/// - **tertiary / onTertiary / tertiaryContainer / onTertiaryContainer**
/// - **error / onError / errorContainer / onErrorContainer**
/// - **surface** family with container levels
/// - **outline / outlineVariant** (replaces legacy border names)
///
/// Extended semantic roles (non-MD3, preserved for utility):
/// - **success**, **warning**, **info** each with their `on*` and `*Container` variants.
class ChromiaColors {
  const ChromiaColors({
    // Primary role
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.primaryHover,
    required this.primaryPressed,
    required this.primaryDisabled,
    // Secondary role
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.secondaryHover,
    required this.secondaryPressed,
    required this.secondaryDisabled,
    // Tertiary role
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.tertiaryHover,
    required this.tertiaryPressed,
    required this.tertiaryDisabled,
    // Error role
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.errorHover,
    // Success role
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.successHover,
    // Warning role
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.warningHover,
    // Info role
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.infoHover,
    // Surface system
    required this.surface,
    required this.surfaceHover,
    required this.surfacePressed,
    required this.surfaceVariant,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.onSurface,
    required this.onSurfaceVariant,
    // Background
    required this.background,
    required this.onBackground,
    // Outline system (MD3)
    required this.outline,
    required this.outlineVariant,
    required this.outlineStrong,
    // Divider
    required this.divider,
    // Text
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

  // ── Primary ──────────────────────────────────────────────────────────────
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color primaryHover;
  final Color primaryPressed;
  final Color primaryDisabled;

  // ── Secondary ─────────────────────────────────────────────────────────────
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color secondaryHover;
  final Color secondaryPressed;
  final Color secondaryDisabled;

  // ── Tertiary ──────────────────────────────────────────────────────────────
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color tertiaryHover;
  final Color tertiaryPressed;
  final Color tertiaryDisabled;

  // ── Error ─────────────────────────────────────────────────────────────────
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color errorHover;

  // ── Success ───────────────────────────────────────────────────────────────
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color successHover;

  // ── Warning ───────────────────────────────────────────────────────────────
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;
  final Color warningHover;

  // ── Info ──────────────────────────────────────────────────────────────────
  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;
  final Color infoHover;

  // ── Surface ───────────────────────────────────────────────────────────────
  final Color surface;
  final Color surfaceHover;
  final Color surfacePressed;
  final Color surfaceVariant;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color onSurface;
  final Color onSurfaceVariant;

  // ── Background ────────────────────────────────────────────────────────────
  final Color background;
  final Color onBackground;

  // ── Outline (MD3) ─────────────────────────────────────────────────────────
  /// Medium-emphasis borders and input decorations. Formerly `border`.
  final Color outline;

  /// Low-emphasis borders, hover states. Formerly `borderHover`.
  final Color outlineVariant;

  /// High-emphasis borders. Formerly `borderStrong`.
  final Color outlineStrong;

  // ── Divider ───────────────────────────────────────────────────────────────
  final Color divider;

  // ── Text ──────────────────────────────────────────────────────────────────
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;

  // ── Other ─────────────────────────────────────────────────────────────────
  final Color shadow;
  final Color overlay;
  final Color scrim;
  final Color transparent;

  // ── Factories ─────────────────────────────────────────────────────────────

  /// Default light color scheme
  factory ChromiaColors.light() {
    return const ChromiaColors(
      // Primary
      primary: ColorTokens.primary600,
      onPrimary: ColorTokens.neutral0,
      primaryContainer: ColorTokens.primary100,
      onPrimaryContainer: ColorTokens.primary900,
      primaryHover: ColorTokens.primary800,
      primaryPressed: ColorTokens.primary900,
      primaryDisabled: ColorTokens.primary200,
      // Secondary
      secondary: ColorTokens.secondary600,
      onSecondary: ColorTokens.neutral0,
      secondaryContainer: ColorTokens.secondary100,
      onSecondaryContainer: ColorTokens.secondary900,
      secondaryHover: ColorTokens.secondary700,
      secondaryPressed: ColorTokens.secondary800,
      secondaryDisabled: ColorTokens.secondary200,
      // Tertiary
      tertiary: ColorTokens.tertiary600,
      onTertiary: ColorTokens.neutral0,
      tertiaryContainer: ColorTokens.tertiary100,
      onTertiaryContainer: ColorTokens.tertiary900,
      tertiaryHover: ColorTokens.tertiary700,
      tertiaryPressed: ColorTokens.tertiary800,
      tertiaryDisabled: ColorTokens.tertiary200,
      // Error
      error: ColorTokens.error600,
      onError: ColorTokens.neutral0,
      errorContainer: ColorTokens.error100,
      onErrorContainer: ColorTokens.error900,
      errorHover: ColorTokens.error700,
      // Success
      success: ColorTokens.success600,
      onSuccess: ColorTokens.neutral0,
      successContainer: ColorTokens.success100,
      onSuccessContainer: ColorTokens.success900,
      successHover: ColorTokens.success700,
      // Warning
      warning: ColorTokens.warning600,
      onWarning: ColorTokens.neutral0,
      warningContainer: ColorTokens.warning100,
      onWarningContainer: ColorTokens.warning900,
      warningHover: ColorTokens.warning700,
      // Info
      info: ColorTokens.info600,
      onInfo: ColorTokens.neutral0,
      infoContainer: ColorTokens.info100,
      onInfoContainer: ColorTokens.info900,
      infoHover: ColorTokens.info700,
      // Surface
      surface: ColorTokens.neutral0,
      surfaceHover: ColorTokens.neutral200,
      surfacePressed: ColorTokens.neutral300,
      surfaceVariant: ColorTokens.neutral100,
      surfaceContainer: ColorTokens.neutral200,
      surfaceContainerHigh: ColorTokens.neutral200,
      surfaceContainerHighest: ColorTokens.neutral300,
      onSurface: ColorTokens.neutral900,
      onSurfaceVariant: ColorTokens.neutral700,
      // Background
      background: ColorTokens.neutral50,
      onBackground: ColorTokens.neutral900,
      // Outline
      outline: ColorTokens.neutral300,
      outlineVariant: ColorTokens.neutral400,
      outlineStrong: ColorTokens.neutral500,
      // Divider
      divider: ColorTokens.neutral200,
      // Text
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
      // Primary
      primary: ColorTokens.primary400,
      onPrimary: ColorTokens.neutral900,
      primaryContainer: ColorTokens.primary800,
      onPrimaryContainer: ColorTokens.primary100,
      primaryHover: ColorTokens.primary300,
      primaryPressed: ColorTokens.primary200,
      primaryDisabled: ColorTokens.primary800,
      // Secondary
      secondary: ColorTokens.secondary400,
      onSecondary: ColorTokens.neutral900,
      secondaryContainer: ColorTokens.secondary800,
      onSecondaryContainer: ColorTokens.secondary100,
      secondaryHover: ColorTokens.secondary300,
      secondaryPressed: ColorTokens.secondary200,
      secondaryDisabled: ColorTokens.secondary800,
      // Tertiary
      tertiary: ColorTokens.tertiary400,
      onTertiary: ColorTokens.neutral900,
      tertiaryContainer: ColorTokens.tertiary800,
      onTertiaryContainer: ColorTokens.tertiary100,
      tertiaryHover: ColorTokens.tertiary300,
      tertiaryPressed: ColorTokens.tertiary200,
      tertiaryDisabled: ColorTokens.tertiary800,
      // Error
      error: ColorTokens.error400,
      onError: ColorTokens.neutral900,
      errorContainer: ColorTokens.error800,
      onErrorContainer: ColorTokens.error100,
      errorHover: ColorTokens.error300,
      // Success
      success: ColorTokens.success400,
      onSuccess: ColorTokens.neutral900,
      successContainer: ColorTokens.success800,
      onSuccessContainer: ColorTokens.success100,
      successHover: ColorTokens.success300,
      // Warning
      warning: ColorTokens.warning400,
      onWarning: ColorTokens.neutral900,
      warningContainer: ColorTokens.warning800,
      onWarningContainer: ColorTokens.warning100,
      warningHover: ColorTokens.warning300,
      // Info
      info: ColorTokens.info400,
      onInfo: ColorTokens.neutral900,
      infoContainer: ColorTokens.info800,
      onInfoContainer: ColorTokens.info100,
      infoHover: ColorTokens.info300,
      // Surface
      surface: ColorTokens.neutral900,
      surfaceHover: ColorTokens.neutral800,
      surfacePressed: ColorTokens.neutral700,
      surfaceVariant: ColorTokens.neutral800,
      surfaceContainer: ColorTokens.neutral800,
      surfaceContainerHigh: ColorTokens.neutral800,
      surfaceContainerHighest: ColorTokens.neutral700,
      onSurface: ColorTokens.neutral100,
      onSurfaceVariant: ColorTokens.neutral300,
      // Background
      background: ColorTokens.neutral1000,
      onBackground: ColorTokens.neutral100,
      // Outline
      outline: ColorTokens.neutral700,
      outlineVariant: ColorTokens.neutral600,
      outlineStrong: ColorTokens.neutral500,
      // Divider
      divider: ColorTokens.neutral800,
      // Text
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
      primaryContainer: _adjustBrightness(primaryColor, isDark ? -0.4 : 0.4),
      onPrimaryContainer: _adjustBrightness(primaryColor, isDark ? 0.5 : -0.5),
    );
  }

  /// Adjusts the brightness of a color
  static Color _adjustBrightness(Color color, double amount) {
    final HSLColor hsl = HSLColor.fromColor(color);
    final double lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  // ── copyWith ──────────────────────────────────────────────────────────────

  ChromiaColors copyWith({
    // Primary
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryHover,
    Color? primaryPressed,
    Color? primaryDisabled,
    // Secondary
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryHover,
    Color? secondaryPressed,
    Color? secondaryDisabled,
    // Tertiary
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryHover,
    Color? tertiaryPressed,
    Color? tertiaryDisabled,
    // Error
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? errorHover,
    // Success
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? successHover,
    // Warning
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? warningHover,
    // Info
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? infoHover,
    // Surface
    Color? surface,
    Color? surfaceHover,
    Color? surfacePressed,
    Color? surfaceVariant,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurface,
    Color? onSurfaceVariant,
    // Background
    Color? background,
    Color? onBackground,
    // Outline
    Color? outline,
    Color? outlineVariant,
    Color? outlineStrong,
    // Divider
    Color? divider,
    // Text
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    // Other
    Color? shadow,
    Color? overlay,
    Color? scrim,
    Color? transparent,
  }) {
    return ChromiaColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryPressed: primaryPressed ?? this.primaryPressed,
      primaryDisabled: primaryDisabled ?? this.primaryDisabled,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      secondaryHover: secondaryHover ?? this.secondaryHover,
      secondaryPressed: secondaryPressed ?? this.secondaryPressed,
      secondaryDisabled: secondaryDisabled ?? this.secondaryDisabled,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      tertiaryHover: tertiaryHover ?? this.tertiaryHover,
      tertiaryPressed: tertiaryPressed ?? this.tertiaryPressed,
      tertiaryDisabled: tertiaryDisabled ?? this.tertiaryDisabled,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      errorHover: errorHover ?? this.errorHover,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      successHover: successHover ?? this.successHover,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      warningHover: warningHover ?? this.warningHover,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      infoHover: infoHover ?? this.infoHover,
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
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      outlineStrong: outlineStrong ?? this.outlineStrong,
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
