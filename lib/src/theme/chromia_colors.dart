import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// Semantic color system for Chromia UI, aligned with Material Design 3 color roles.
///
/// Color roles follow MD3 conventions:
/// - **primary / onPrimary / primaryContainer / onPrimaryContainer**
/// - **secondary / onSecondary / secondaryContainer / onSecondaryContainer**
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
    required this.onSurfaceVariant,
    required this.surfaceContainer,
    required this.onSurfaceContainer,
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
  final Color onSurfaceVariant;
  final Color surfaceContainer;
  final Color onSurfaceContainer;

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
      primary: ChromiaBrandColorTokens.primaryLight,
      onPrimary: ChromiaBrandColorTokens.onPrimaryLight,
      primaryContainer: ChromiaBrandColorTokens.primaryContainerLight,
      onPrimaryContainer: ChromiaBrandColorTokens.onPrimaryContainerLight,
      // Secondary
      secondary: ChromiaBrandColorTokens.secondaryLight,
      onSecondary: ChromiaBrandColorTokens.onSecondaryLight,
      secondaryContainer: ChromiaBrandColorTokens.secondaryContainerLight,
      onSecondaryContainer: ChromiaBrandColorTokens.onSecondaryContainerLight,
      // Error
      error: ColorTokens.errorLight,
      onError: ColorTokens.onErrorLight,
      errorContainer: ColorTokens.errorContainerLight,
      onErrorContainer: ColorTokens.onErrorContainerLight,
      // Success
      success: ColorTokens.successLight,
      onSuccess: ColorTokens.onSuccessLight,
      successContainer: ColorTokens.successContainerLight,
      onSuccessContainer: ColorTokens.onSuccessContainerLight,
      // Warning
      warning: ColorTokens.warningLight,
      onWarning: ColorTokens.onWarningLight,
      warningContainer: ColorTokens.warningContainerLight,
      onWarningContainer: ColorTokens.onWarningContainerLight,
      // Info
      info: ColorTokens.infoLight,
      onInfo: ColorTokens.onInfoLight,
      infoContainer: ColorTokens.infoContainerLight,
      onInfoContainer: ColorTokens.onInfoContainerLight,
      // Surface
      surface: ColorTokens.surfaceLight,
      onSurface: ColorTokens.onSurfaceLight,
      onSurfaceVariant: ColorTokens.onSurfaceVariantLight,
      surfaceContainer: ColorTokens.surfaceContainerLight,
      onSurfaceContainer: ColorTokens.onSurfaceContainerLight,
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
      primary: ChromiaBrandColorTokens.primaryDark,
      onPrimary: ChromiaBrandColorTokens.onPrimaryDark,
      primaryContainer: ChromiaBrandColorTokens.primaryContainerDark,
      onPrimaryContainer: ChromiaBrandColorTokens.onPrimaryContainerDark,
      // Secondary
      secondary: ChromiaBrandColorTokens.secondaryDark,
      onSecondary: ChromiaBrandColorTokens.onSecondaryDark,
      secondaryContainer: ChromiaBrandColorTokens.secondaryContainerDark,
      onSecondaryContainer: ChromiaBrandColorTokens.onSecondaryContainerDark,
      // Error
      error: ColorTokens.errorDark,
      onError: ColorTokens.onErrorDark,
      errorContainer: ColorTokens.errorContainerDark,
      onErrorContainer: ColorTokens.onErrorContainerDark,
      // Success
      success: ColorTokens.successDark,
      onSuccess: ColorTokens.onSuccessDark,
      successContainer: ColorTokens.successContainerDark,
      onSuccessContainer: ColorTokens.onSuccessContainerDark,
      // Warning
      warning: ColorTokens.warningDark,
      onWarning: ColorTokens.onWarningDark,
      warningContainer: ColorTokens.warningContainerDark,
      onWarningContainer: ColorTokens.onWarningContainerDark,
      // Info
      info: ColorTokens.infoDark,
      onInfo: ColorTokens.onInfoDark,
      infoContainer: ColorTokens.infoContainerDark,
      onInfoContainer: ColorTokens.onInfoContainerDark,
      // Surface
      surface: ColorTokens.surfaceDark,
      onSurface: ColorTokens.onSurfaceDark,
      onSurfaceVariant: ColorTokens.onSurfaceVariantDark,
      surfaceContainer: ColorTokens.surfaceContainerDark,
      onSurfaceContainer: ColorTokens.onSurfaceContainerDark,
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

  /// Create a color scheme from a [ChromiaBrandColorConfig]
  factory ChromiaColors.fromBrandColorConfig(ChromiaBrandColorConfig colorConfig, {bool isDark = false}) {
    final ChromiaColors base = isDark
        ? ChromiaColors.dark().copyWith(
            primary: colorConfig.primaryDark,
            onPrimary: colorConfig.onPrimaryDark,
            primaryContainer: colorConfig.primaryContainerDark,
            onPrimaryContainer: colorConfig.onPrimaryContainerDark,
            secondary: colorConfig.secondaryDark,
            onSecondary: colorConfig.onSecondaryDark,
            secondaryContainer: colorConfig.secondaryContainerDark,
            onSecondaryContainer: colorConfig.onSecondaryContainerDark,
          )
        : ChromiaColors.light().copyWith(
            primary: colorConfig.primaryLight,
            onPrimary: colorConfig.onPrimaryLight,
            primaryContainer: colorConfig.primaryContainerLight,
            onPrimaryContainer: colorConfig.onPrimaryContainerLight,
            secondary: colorConfig.secondaryLight,
            onSecondary: colorConfig.onSecondaryLight,
            secondaryContainer: colorConfig.secondaryContainerLight,
            onSecondaryContainer: colorConfig.onSecondaryContainerLight,
          );
    return base;
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
    Color? onSurfaceVariant,
    Color? surfaceContainer,
    Color? onSurfaceContainer,
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
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      onSurfaceContainer: onSurfaceContainer ?? this.onSurfaceContainer,
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
