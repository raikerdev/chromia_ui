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
    required this.brightness,
    // Primary role
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    // Secondary role
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    // Tertiary role
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    // Error role
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    // Success role
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    // Warning role
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    // Info role
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
    // Surface role
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.surfaceContainerHighest,
    required this.surfaceContainerHigh,
    required this.surfaceContainer,
    required this.surfaceContainerLow,
    required this.surfaceContainerLowest,
    // Outline role
    required this.outline,
    required this.outlineVariant,
    // Other
    required this.shadow,
    required this.overlay,
    required this.scrim,
    required this.transparent,
  });

  final Brightness brightness;

  // ── Primary ───────────────────────────────────────────────────────────────
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;

  // ── Secondary ─────────────────────────────────────────────────────────────
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;

  // ── Tertiary ──────────────────────────────────────────────────────────────
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;

  // ── Error ─────────────────────────────────────────────────────────────────
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;

  // ── Success ───────────────────────────────────────────────────────────────
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  // ── Warning ───────────────────────────────────────────────────────────────
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;

  // ── Info ──────────────────────────────────────────────────────────────────
  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;

  // ── Surface ───────────────────────────────────────────────────────────────
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color surfaceContainerHighest;
  final Color surfaceContainerHigh;
  final Color surfaceContainer;
  final Color surfaceContainerLow;
  final Color surfaceContainerLowest;

  // ── Outline ───────────────────────────────────────────────────────────────
  final Color outline;
  final Color outlineVariant;

  // ── Other ─────────────────────────────────────────────────────────────────
  final Color shadow;
  final Color overlay;
  final Color scrim;
  final Color transparent;

  bool get isDark => brightness == Brightness.dark;

  Color get textDisabled => onSurface.withAlpha(97);

  // ── State Variations ──────────────────────────────────────────────────────
  Color get primaryHover => _adjustBrightness(primary, isDark ? 0.1 : -0.1);
  Color get primaryPressed => _adjustBrightness(primary, isDark ? 0.2 : -0.2);
  Color get primaryDisabled => _adjustBrightness(primary, isDark ? -0.3 : 0.3);

  Color get secondaryHover => _adjustBrightness(secondary, isDark ? 0.1 : -0.1);
  Color get secondaryPressed => _adjustBrightness(secondary, isDark ? 0.2 : -0.2);
  Color get secondaryDisabled => _adjustBrightness(secondary, isDark ? -0.3 : 0.3);

  Color get tertiaryHover => _adjustBrightness(tertiary, isDark ? 0.1 : -0.1);
  Color get tertiaryPressed => _adjustBrightness(tertiary, isDark ? 0.2 : -0.2);
  Color get tertiaryDisabled => _adjustBrightness(tertiary, isDark ? -0.3 : 0.3);

  Color get errorHover => _adjustBrightness(error, isDark ? 0.1 : -0.1);
  Color get errorPressed => _adjustBrightness(error, isDark ? 0.2 : -0.2);
  Color get errorDisabled => _adjustBrightness(error, isDark ? -0.3 : 0.3);

  Color get successHover => _adjustBrightness(success, isDark ? 0.1 : -0.1);
  Color get successPressed => _adjustBrightness(success, isDark ? 0.2 : -0.2);
  Color get successDisabled => _adjustBrightness(success, isDark ? -0.3 : 0.3);

  Color get warningHover => _adjustBrightness(warning, isDark ? 0.1 : -0.1);
  Color get warningPressed => _adjustBrightness(warning, isDark ? 0.2 : -0.2);
  Color get warningDisabled => _adjustBrightness(warning, isDark ? -0.3 : 0.3);

  Color get infoHover => _adjustBrightness(info, isDark ? 0.1 : -0.1);
  Color get infoPressed => _adjustBrightness(info, isDark ? 0.2 : -0.2);
  Color get infoDisabled => _adjustBrightness(info, isDark ? -0.3 : 0.3);

  Color get surfaceHover => _adjustBrightness(surface, isDark ? 0.1 : -0.1);
  Color get surfacePressed => _adjustBrightness(surface, isDark ? 0.2 : -0.2);
  Color get surfaceDisabled => _adjustBrightness(surface, isDark ? -0.3 : 0.3);

  // ── Factories ─────────────────────────────────────────────────────────────

  /// Default light color scheme
  factory ChromiaColors.light() {
    return const ChromiaColors(
      brightness: Brightness.light,
      // Primary
      primary: ColorTokens.primary600,
      onPrimary: ColorTokens.neutral0,
      primaryContainer: ColorTokens.primary100,
      onPrimaryContainer: ColorTokens.primary900,
      // Secondary
      secondary: ColorTokens.secondary600,
      onSecondary: ColorTokens.neutral0,
      secondaryContainer: ColorTokens.secondary100,
      onSecondaryContainer: ColorTokens.secondary900,
      // Tertiary
      tertiary: ColorTokens.tertiary600,
      onTertiary: ColorTokens.neutral0,
      tertiaryContainer: ColorTokens.tertiary100,
      onTertiaryContainer: ColorTokens.tertiary900,
      // Error
      error: ColorTokens.error600,
      onError: ColorTokens.neutral0,
      errorContainer: ColorTokens.error100,
      onErrorContainer: ColorTokens.error900,
      // Success
      success: ColorTokens.success600,
      onSuccess: ColorTokens.neutral0,
      successContainer: ColorTokens.success100,
      onSuccessContainer: ColorTokens.success900,
      // Warning
      warning: ColorTokens.warning600,
      onWarning: ColorTokens.neutral0,
      warningContainer: ColorTokens.warning100,
      onWarningContainer: ColorTokens.warning900,
      // Info
      info: ColorTokens.info600,
      onInfo: ColorTokens.neutral0,
      infoContainer: ColorTokens.info100,
      onInfoContainer: ColorTokens.info900,
      // Surface
      surface: ColorTokens.surfaceLight,
      onSurface: ColorTokens.onSurfaceLight,
      surfaceVariant: ColorTokens.surfaceVariantLight,
      onSurfaceVariant: ColorTokens.onSurfaceVariantLight,
      surfaceContainerHighest: ColorTokens.surfaceContainerHighestLight,
      surfaceContainerHigh: ColorTokens.surfaceContainerHighLight,
      surfaceContainer: ColorTokens.surfaceContainerLight,
      surfaceContainerLow: ColorTokens.surfaceContainerLowLight,
      surfaceContainerLowest: ColorTokens.surfaceContainerLowestLight,
      // Outline
      outline: ColorTokens.neutral300,
      outlineVariant: ColorTokens.neutral400,
      // Other
      shadow: ColorTokens.shadowLight,
      overlay: ColorTokens.overlayLight,
      scrim: ColorTokens.scrimLight,
      transparent: ColorTokens.transparentLight,
    );
  }

  /// Default dark color scheme
  factory ChromiaColors.dark() {
    return const ChromiaColors(
      brightness: Brightness.dark,
      // Primary
      primary: ColorTokens.primary400,
      onPrimary: ColorTokens.neutral900,
      primaryContainer: ColorTokens.primary800,
      onPrimaryContainer: ColorTokens.primary100,
      // Secondary
      secondary: ColorTokens.secondary400,
      onSecondary: ColorTokens.neutral900,
      secondaryContainer: ColorTokens.secondary800,
      onSecondaryContainer: ColorTokens.secondary100,
      // Tertiary
      tertiary: ColorTokens.tertiary400,
      onTertiary: ColorTokens.neutral900,
      tertiaryContainer: ColorTokens.tertiary800,
      onTertiaryContainer: ColorTokens.tertiary100,
      // Error
      error: ColorTokens.error400,
      onError: ColorTokens.neutral900,
      errorContainer: ColorTokens.error800,
      onErrorContainer: ColorTokens.error100,
      // Success
      success: ColorTokens.success400,
      onSuccess: ColorTokens.neutral900,
      successContainer: ColorTokens.success800,
      onSuccessContainer: ColorTokens.success100,
      // Warning
      warning: ColorTokens.warning400,
      onWarning: ColorTokens.neutral900,
      warningContainer: ColorTokens.warning800,
      onWarningContainer: ColorTokens.warning100,
      // Info
      info: ColorTokens.info400,
      onInfo: ColorTokens.neutral900,
      infoContainer: ColorTokens.info800,
      onInfoContainer: ColorTokens.info100,
      // Surface
      surface: ColorTokens.surfaceDark,
      onSurface: ColorTokens.onSurfaceDark,
      surfaceVariant: ColorTokens.surfaceVariantDark,
      onSurfaceVariant: ColorTokens.onSurfaceVariantDark,
      surfaceContainerHighest: ColorTokens.surfaceContainerHighestDark,
      surfaceContainerHigh: ColorTokens.surfaceContainerHighDark,
      surfaceContainer: ColorTokens.surfaceContainerDark,
      surfaceContainerLow: ColorTokens.surfaceContainerLowDark,
      surfaceContainerLowest: ColorTokens.surfaceContainerLowestDark,
      // Outline
      outline: ColorTokens.neutral700,
      outlineVariant: ColorTokens.neutral600,
      // Other
      shadow: ColorTokens.shadowDark,
      overlay: ColorTokens.overlayDark,
      scrim: ColorTokens.scrimDark,
      transparent: ColorTokens.transparentDark,
    );
  }

  /// Creates a color scheme from a primary color
  factory ChromiaColors.fromPrimary(Color primaryColor, {bool isDark = false}) {
    final ChromiaColors base = isDark ? ChromiaColors.dark() : ChromiaColors.light();

    return base.copyWith(
      primary: primaryColor,
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
    Brightness? brightness,
    // Primary
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    // Secondary
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    // Tertiary
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    // Error
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    // Success
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    // Warning
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    // Info
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    // Surface
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? surfaceContainerHighest,
    Color? surfaceContainerHigh,
    Color? surfaceContainer,
    Color? surfaceContainerLow,
    Color? surfaceContainerLowest,
    // Outline
    Color? outline,
    Color? outlineVariant,
    // Other
    Color? shadow,
    Color? overlay,
    Color? scrim,
    Color? transparent,
  }) {
    return ChromiaColors(
      brightness: brightness ?? this.brightness,
      // Primary
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      // Secondary
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      // Tertiary
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      // Error
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      // Success
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      // Warning
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      // Info
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      // Surface
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      surfaceContainerHighest: surfaceContainerHighest ?? this.surfaceContainerHighest,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainerLowest: surfaceContainerLowest ?? this.surfaceContainerLowest,
      // Outline
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      // Other
      shadow: shadow ?? this.shadow,
      overlay: overlay ?? this.overlay,
      scrim: scrim ?? this.scrim,
      transparent: transparent ?? this.transparent,
    );
  }
}
