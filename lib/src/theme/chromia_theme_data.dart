import 'package:chromia_ui/src/theme/brand/brand_config.dart';
import 'package:chromia_ui/src/theme/brand/brand_theme_extension.dart';
import 'package:chromia_ui/src/theme/chromia_colors.dart';
import 'package:chromia_ui/src/theme/chromia_radius.dart';
import 'package:chromia_ui/src/theme/chromia_shadows.dart';
import 'package:chromia_ui/src/theme/chromia_spacing.dart';
import 'package:chromia_ui/src/theme/chromia_typography.dart';
import 'package:flutter/material.dart';

/// Main theme data class for Chromia UI.
///
/// This class combines all the theme systems (colors, typography, spacing,
/// radius, shadows, and brand) into a single cohesive theme configuration.
class ChromiaThemeData {
  const ChromiaThemeData({
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.radius,
    required this.shadows,
    this.brandConfig,
    this.brightness = Brightness.light,
  });

  /// Color scheme
  final ChromiaColors colors;

  /// Typography system
  final ChromiaTypography typography;

  /// Spacing system
  final ChromiaSpacing spacing;

  /// Border radius system
  final ChromiaRadius radius;

  /// Shadow system
  final ChromiaShadows shadows;

  /// Brand configuration (optional)
  final BrandConfig? brandConfig;

  /// Theme brightness
  final Brightness brightness;

  /// Returns true if this is a dark theme
  bool get isDark => brightness == Brightness.dark;

  /// Returns true if this is a light theme
  bool get isLight => brightness == Brightness.light;

  /// Creates a light theme with default configuration
  factory ChromiaThemeData.light() {
    return ChromiaThemeData(
      colors: ChromiaColors.light(),
      typography: ChromiaTypography.defaultTypography(),
      spacing: ChromiaSpacing.defaultSpacing(),
      radius: ChromiaRadius.defaultRadius(),
      shadows: ChromiaShadows.light(),
      brightness: Brightness.light,
    );
  }

  /// Creates a dark theme with default configuration
  factory ChromiaThemeData.dark() {
    return ChromiaThemeData(
      colors: ChromiaColors.dark(),
      typography: ChromiaTypography.defaultTypography(),
      spacing: ChromiaSpacing.defaultSpacing(),
      radius: ChromiaRadius.defaultRadius(),
      shadows: ChromiaShadows.dark(),
      brightness: Brightness.dark,
    );
  }

  /// Creates a theme from a brand configuration
  factory ChromiaThemeData.fromBrand(
    BrandConfig brandConfig, {
    bool isDark = false,
  }) {
    final ChromiaThemeData baseTheme = isDark ? ChromiaThemeData.dark() : ChromiaThemeData.light();

    final ChromiaColors brandColors =
        ChromiaColors.fromPrimary(
          brandConfig.primaryColor,
          isDark: isDark,
        ).copyWith(
          secondary: brandConfig.secondaryColor ?? baseTheme.colors.secondary,
        );

    ChromiaTypography brandTypography = baseTheme.typography;

    // Apply custom font family if provided
    if (brandConfig.fontFamily != null) {
      brandTypography = _applyFontFamily(
        brandTypography,
        brandConfig.fontFamily!,
      );
    }

    return ChromiaThemeData(
      colors: brandColors,
      typography: brandTypography,
      spacing: baseTheme.spacing,
      radius: baseTheme.radius,
      shadows: baseTheme.shadows,
      brandConfig: brandConfig,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
  }

  /// Applies a font family to all text styles in the typography
  static ChromiaTypography _applyFontFamily(
    ChromiaTypography typography,
    String fontFamily,
  ) {
    return ChromiaTypography(
      displayLarge: typography.displayLarge.copyWith(fontFamily: fontFamily),
      displayMedium: typography.displayMedium.copyWith(fontFamily: fontFamily),
      displaySmall: typography.displaySmall.copyWith(fontFamily: fontFamily),
      headlineLarge: typography.headlineLarge.copyWith(fontFamily: fontFamily),
      headlineMedium: typography.headlineMedium.copyWith(fontFamily: fontFamily),
      headlineSmall: typography.headlineSmall.copyWith(fontFamily: fontFamily),
      titleLarge: typography.titleLarge.copyWith(fontFamily: fontFamily),
      titleMedium: typography.titleMedium.copyWith(fontFamily: fontFamily),
      titleSmall: typography.titleSmall.copyWith(fontFamily: fontFamily),
      bodyLarge: typography.bodyLarge.copyWith(fontFamily: fontFamily),
      bodyMedium: typography.bodyMedium.copyWith(fontFamily: fontFamily),
      bodySmall: typography.bodySmall.copyWith(fontFamily: fontFamily),
      labelLarge: typography.labelLarge.copyWith(fontFamily: fontFamily),
      labelMedium: typography.labelMedium.copyWith(fontFamily: fontFamily),
      labelSmall: typography.labelSmall.copyWith(fontFamily: fontFamily),
      caption: typography.caption.copyWith(fontFamily: fontFamily),
      overline: typography.overline.copyWith(fontFamily: fontFamily),
      code: typography.code.copyWith(fontFamily: fontFamily),
    );
  }

  /// Converts this ChromiaThemeData to a Material ThemeData
  ThemeData toMaterialTheme() {
    final ColorScheme colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      error: colors.error,
      onError: colors.onError,
      surface: colors.surface,
      onSurface: colors.onSurface,
      surfaceTint: colors.primary,
    );

    final TextTheme textTheme = TextTheme(
      displayLarge: typography.displayLarge,
      displayMedium: typography.displayMedium,
      displaySmall: typography.displaySmall,
      headlineLarge: typography.headlineLarge,
      headlineMedium: typography.headlineMedium,
      headlineSmall: typography.headlineSmall,
      titleLarge: typography.titleLarge,
      titleMedium: typography.titleMedium,
      titleSmall: typography.titleSmall,
      bodyLarge: typography.bodyLarge,
      bodyMedium: typography.bodyMedium,
      bodySmall: typography.bodySmall,
      labelLarge: typography.labelLarge,
      labelMedium: typography.labelMedium,
      labelSmall: typography.labelSmall,
    );

    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,
      dividerColor: colors.divider,
      extensions: [
        if (brandConfig != null) BrandThemeExtension(brandConfig: brandConfig!),
      ],
      useMaterial3: true,
    );
  }

  /// Creates a copy of this theme with the given fields replaced
  ChromiaThemeData copyWith({
    ChromiaColors? colors,
    ChromiaTypography? typography,
    ChromiaSpacing? spacing,
    ChromiaRadius? radius,
    ChromiaShadows? shadows,
    BrandConfig? brandConfig,
    Brightness? brightness,
  }) {
    return ChromiaThemeData(
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      spacing: spacing ?? this.spacing,
      radius: radius ?? this.radius,
      shadows: shadows ?? this.shadows,
      brandConfig: brandConfig ?? this.brandConfig,
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChromiaThemeData &&
        other.colors == colors &&
        other.typography == typography &&
        other.spacing == spacing &&
        other.radius == radius &&
        other.shadows == shadows &&
        other.brandConfig == brandConfig &&
        other.brightness == brightness;
  }

  @override
  int get hashCode {
    return Object.hash(
      colors,
      typography,
      spacing,
      radius,
      shadows,
      brandConfig,
      brightness,
    );
  }

  @override
  String toString() {
    return 'ChromiaThemeData('
        'brightness: $brightness, '
        'brandConfig: $brandConfig'
        ')';
  }
}
