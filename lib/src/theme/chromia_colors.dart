import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/foundation.dart';
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
class ChromiaColors with Diagnosticable {
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

  Color get secondaryPressed =>
      _adjustBrightness(secondary, isDark ? 0.2 : -0.2);

  Color get secondaryDisabled =>
      _adjustBrightness(secondary, isDark ? -0.3 : 0.3);

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

  // Surface state overlays: blend onSurface at low alpha over the base
  // surface instead of adjusting lightness. This produces clearly visible
  // hover/press feedback regardless of the base surface color.
  Color get surfaceHover => Color.alphaBlend(
    onSurface.withAlpha(isDark ? 20 : 15),
    surface,
  );

  Color get surfacePressed => Color.alphaBlend(
    onSurface.withAlpha(isDark ? 38 : 28),
    surface,
  );

  Color get surfaceDisabled => Color.alphaBlend(
    onSurface.withAlpha(isDark ? 10 : 8),
    surface,
  );

  // ── Factories ─────────────────────────────────────────────────────────────

  /// Default light color scheme.
  ///
  /// Surfaces are neutral (`#F8F8F8`) blended with the Chromia primary colour
  /// at ~2 % opacity, producing a barely-perceptible teal whisper that ties
  /// the background to the brand without overwhelming it.
  factory ChromiaColors.light() {
    const Color primary = ChromiaBrandColorTokens.primaryLight;
    return ChromiaColors(
      brightness: Brightness.light,
      // Primary
      primary: primary,
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
      // Surface — neutral base + subtle primary tint
      surface: _tintedSurface(
        primary,
        ColorTokens.surfaceLight,
      ),
      onSurface: ColorTokens.onSurfaceLight,
      onSurfaceVariant: ColorTokens.onSurfaceVariantLight,
      surfaceContainer: _tintedSurface(
        primary,
        ColorTokens.surfaceContainerLight,
        alpha: 7,
      ),
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

  /// Default dark color scheme.
  ///
  /// Surfaces are neutral (`#121212`) blended with the Chromia primary colour
  /// at ~2 % opacity for a barely-perceptible tint in dark contexts.
  factory ChromiaColors.dark() {
    const Color primary = ChromiaBrandColorTokens.primaryDark;
    return ChromiaColors(
      brightness: Brightness.dark,
      // Primary
      primary: primary,
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
      // Surface — neutral base + subtle primary tint
      surface: _tintedSurface(
        primary,
        ColorTokens.surfaceDark,
      ),
      onSurface: ColorTokens.onSurfaceDark,
      onSurfaceVariant: ColorTokens.onSurfaceVariantDark,
      surfaceContainer: _tintedSurface(
        primary,
        ColorTokens.surfaceContainerDark,
        alpha: 7,
      ),
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

  /// Creates a color scheme from a [ChromiaBrandColorConfig].
  ///
  /// The surface tint is recomputed from the brand's own primary colour so
  /// that every brand gets a harmonious, brand-specific background — not the
  /// default Chromia teal tint.
  factory ChromiaColors.fromBrandColorConfig(
    ChromiaBrandColorConfig colorConfig, {
    bool isDark = false,
  }) {
    // Resolve brand primary (falls back to Chromia default via the config getter).
    final Color brandPrimary =
        isDark ? colorConfig.primaryDark : colorConfig.primaryLight;

    final Color neutralSurface =
        isDark ? ColorTokens.surfaceDark : ColorTokens.surfaceLight;
    final Color neutralContainer = isDark
        ? ColorTokens.surfaceContainerDark
        : ColorTokens.surfaceContainerLight;

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

    // Recompute surface tint with the brand's primary colour.
    return base.copyWith(
      surface: _tintedSurface(brandPrimary, neutralSurface),
      surfaceContainer: _tintedSurface(brandPrimary, neutralContainer, alpha: 7),
    );
  }

  /// Blends [primary] at [alpha]/255 opacity into [base] to produce a surface
  /// that subtly harmonises with the brand colour without overpowering it.
  ///
  /// The default [alpha] of `5` corresponds to ≈ 2 % opacity — perceptible
  /// as a whisper of colour but never dominant. Use `7` for container levels
  /// (cards, inputs) to keep their visual separation from the main surface.
  static Color _tintedSurface(Color primary, Color base, {int alpha = 5}) {
    return Color.alphaBlend(primary.withAlpha(alpha), base);
  }

  /// Adjusts the brightness of a color
  static Color _adjustBrightness(Color color, double amount) {
    final HSLColor hsl = HSLColor.fromColor(color);
    final double lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  // ── lerp ──────────────────────────────────────────────────────────────────

  /// Linearly interpolates between two [ChromiaColors] instances.
  ///
  /// All color fields are lerped with [Color.lerp].
  /// [brightness] switches at `t >= 0.5`.
  static ChromiaColors lerp(ChromiaColors a, ChromiaColors b, double t) {
    return ChromiaColors(
      brightness: t < 0.5 ? a.brightness : b.brightness,
      // Primary
      primary: Color.lerp(a.primary, b.primary, t)!,
      onPrimary: Color.lerp(a.onPrimary, b.onPrimary, t)!,
      primaryContainer: Color.lerp(a.primaryContainer, b.primaryContainer, t)!,
      onPrimaryContainer: Color.lerp(
        a.onPrimaryContainer,
        b.onPrimaryContainer,
        t,
      )!,
      // Secondary
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      onSecondary: Color.lerp(a.onSecondary, b.onSecondary, t)!,
      secondaryContainer: Color.lerp(
        a.secondaryContainer,
        b.secondaryContainer,
        t,
      )!,
      onSecondaryContainer: Color.lerp(
        a.onSecondaryContainer,
        b.onSecondaryContainer,
        t,
      )!,
      // Error
      error: Color.lerp(a.error, b.error, t)!,
      onError: Color.lerp(a.onError, b.onError, t)!,
      errorContainer: Color.lerp(a.errorContainer, b.errorContainer, t)!,
      onErrorContainer: Color.lerp(a.onErrorContainer, b.onErrorContainer, t)!,
      // Success
      success: Color.lerp(a.success, b.success, t)!,
      onSuccess: Color.lerp(a.onSuccess, b.onSuccess, t)!,
      successContainer: Color.lerp(a.successContainer, b.successContainer, t)!,
      onSuccessContainer: Color.lerp(
        a.onSuccessContainer,
        b.onSuccessContainer,
        t,
      )!,
      // Warning
      warning: Color.lerp(a.warning, b.warning, t)!,
      onWarning: Color.lerp(a.onWarning, b.onWarning, t)!,
      warningContainer: Color.lerp(a.warningContainer, b.warningContainer, t)!,
      onWarningContainer: Color.lerp(
        a.onWarningContainer,
        b.onWarningContainer,
        t,
      )!,
      // Info
      info: Color.lerp(a.info, b.info, t)!,
      onInfo: Color.lerp(a.onInfo, b.onInfo, t)!,
      infoContainer: Color.lerp(a.infoContainer, b.infoContainer, t)!,
      onInfoContainer: Color.lerp(a.onInfoContainer, b.onInfoContainer, t)!,
      // Surface
      surface: Color.lerp(a.surface, b.surface, t)!,
      onSurface: Color.lerp(a.onSurface, b.onSurface, t)!,
      onSurfaceVariant: Color.lerp(a.onSurfaceVariant, b.onSurfaceVariant, t)!,
      surfaceContainer: Color.lerp(a.surfaceContainer, b.surfaceContainer, t)!,
      onSurfaceContainer: Color.lerp(
        a.onSurfaceContainer,
        b.onSurfaceContainer,
        t,
      )!,
      // Outline
      outline: Color.lerp(a.outline, b.outline, t)!,
      outlineVariant: Color.lerp(a.outlineVariant, b.outlineVariant, t)!,
      // Other
      shadow: Color.lerp(a.shadow, b.shadow, t)!,
      overlay: Color.lerp(a.overlay, b.overlay, t)!,
      scrim: Color.lerp(a.scrim, b.scrim, t)!,
      transparent: Color.lerp(a.transparent, b.transparent, t)!,
    );
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

  // ── debugFillProperties ───────────────────────────────────────────────────

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<Brightness>('brightness', brightness))
      ..add(ColorProperty('primary', primary))
      ..add(ColorProperty('onPrimary', onPrimary))
      ..add(ColorProperty('secondary', secondary))
      ..add(ColorProperty('error', error))
      ..add(ColorProperty('surface', surface))
      ..add(ColorProperty('outline', outline));
  }
}
