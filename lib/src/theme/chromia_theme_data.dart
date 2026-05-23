import 'package:chromia_ui/chromia_ui.dart';
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
  final ChromiaBrandConfig? brandConfig;

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
    ChromiaBrandConfig brandConfig, {
    bool isDark = false,
  }) {
    final ChromiaThemeData baseTheme = isDark ? ChromiaThemeData.dark() : ChromiaThemeData.light();

    final ChromiaColors brandColors = ChromiaColors.fromBrandColorConfig(
      brandConfig.colorConfig,
      isDark: isDark,
    );

    ChromiaTypography brandTypography = baseTheme.typography;

    // Apply custom font family if provided
    if (brandConfig.typographyConfig != null) {
      brandTypography = _applyFontFamily(
        brandTypography,
        brandConfig.typographyConfig!,
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
    ChromiaBrandTypographyConfig typographyConfig,
  ) {
    return ChromiaTypography(
      displayLarge: typography.displayLarge.copyWith(fontFamily: typographyConfig.displayFontFamily),
      displayMedium: typography.displayMedium.copyWith(fontFamily: typographyConfig.displayFontFamily),
      displaySmall: typography.displaySmall.copyWith(fontFamily: typographyConfig.displayFontFamily),
      headlineLarge: typography.headlineLarge.copyWith(fontFamily: typographyConfig.headlineFontFamily),
      headlineMedium: typography.headlineMedium.copyWith(fontFamily: typographyConfig.headlineFontFamily),
      headlineSmall: typography.headlineSmall.copyWith(fontFamily: typographyConfig.headlineFontFamily),
      titleLarge: typography.titleLarge.copyWith(fontFamily: typographyConfig.titleFontFamily),
      titleMedium: typography.titleMedium.copyWith(fontFamily: typographyConfig.titleFontFamily),
      titleSmall: typography.titleSmall.copyWith(fontFamily: typographyConfig.titleFontFamily),
      bodyLarge: typography.bodyLarge.copyWith(fontFamily: typographyConfig.bodyFontFamily),
      bodyMedium: typography.bodyMedium.copyWith(fontFamily: typographyConfig.bodyFontFamily),
      bodySmall: typography.bodySmall.copyWith(fontFamily: typographyConfig.bodyFontFamily),
      labelLarge: typography.labelLarge.copyWith(fontFamily: typographyConfig.labelFontFamily),
      labelMedium: typography.labelMedium.copyWith(fontFamily: typographyConfig.labelFontFamily),
      labelSmall: typography.labelSmall.copyWith(fontFamily: typographyConfig.labelFontFamily),
      caption: typography.caption.copyWith(fontFamily: typographyConfig.bodyFontFamily),
      overline: typography.overline.copyWith(fontFamily: typographyConfig.bodyFontFamily),
    );
  }

  /// Converts this ChromiaThemeData to a Material [ThemeData].
  ///
  /// All Material sub-themes (InputDecoration, Slider, AppBar, Dialog, etc.)
  /// are configured with Chromia tokens so that both Chromia wrapper
  /// components **and** native Material widgets inherit the correct brand
  /// colours in both light and dark mode.
  ThemeData toMaterialTheme() {
    // ── ColorScheme ───────────────────────────────────────────────────────────
    final ColorScheme colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      primaryContainer: colors.primaryContainer,
      onPrimaryContainer: colors.onPrimaryContainer,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      secondaryContainer: colors.secondaryContainer,
      onSecondaryContainer: colors.onSecondaryContainer,
      error: colors.error,
      onError: colors.onError,
      errorContainer: colors.errorContainer,
      onErrorContainer: colors.onErrorContainer,
      surface: colors.surface,
      onSurface: colors.onSurface,
      onSurfaceVariant: colors.onSurfaceVariant,
      outline: colors.outline,
      outlineVariant: colors.outlineVariant,
      scrim: colors.scrim,
      shadow: colors.shadow,
      surfaceTint: colors.primary,
    );

    // ── TextTheme ─────────────────────────────────────────────────────────────
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

    // ── Shared helpers ────────────────────────────────────────────────────────
    final BorderRadius radiusS = radius.radiusS;
    final BorderRadius radiusM = radius.radiusM;
    final BorderRadius radiusL = radius.radiusL;
    final RoundedRectangleBorder shapeM = RoundedRectangleBorder(borderRadius: radiusM);
    final RoundedRectangleBorder shapeL = RoundedRectangleBorder(borderRadius: radiusL);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      brightness: brightness,
      scaffoldBackgroundColor: colors.surface,
      dividerColor: colors.outline,

      // ── Icons ───────────────────────────────────────────────────────────────
      iconTheme: IconThemeData(color: colors.onSurface),
      primaryIconTheme: IconThemeData(color: colors.onPrimary),

      // ── AppBar ──────────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
        shadowColor: colors.shadow,
        surfaceTintColor: colors.transparent,
        titleTextStyle: typography.titleLarge.copyWith(color: colors.onSurface),
        iconTheme: IconThemeData(color: colors.onSurface),
        actionsIconTheme: IconThemeData(color: colors.onSurface),
      ),

      // ── Card ────────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: colors.surfaceContainer,
        surfaceTintColor: colors.transparent,
        elevation: 0,
        shape: shapeL,
        margin: EdgeInsets.zero,
      ),

      // ── Dialog ──────────────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: colors.transparent,
        elevation: 0,
        shape: shapeL,
        titleTextStyle: typography.titleLarge.copyWith(color: colors.onSurface),
        contentTextStyle: typography.bodyMedium.copyWith(color: colors.onSurface),
      ),

      // ── Popup / Menu ─────────────────────────────────────────────────────────
      popupMenuTheme: PopupMenuThemeData(
        color: colors.surface,
        surfaceTintColor: colors.transparent,
        elevation: 2,
        shape: shapeM,
        textStyle: typography.bodyMedium.copyWith(color: colors.onSurface),
      ),

      // ── Tooltip ──────────────────────────────────────────────────────────────
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: radiusS,
          boxShadow: shadows.m,
        ),
        textStyle: typography.bodySmall.copyWith(color: colors.onSurface),
        padding: EdgeInsets.symmetric(
          horizontal: spacing.m,
          vertical: spacing.s,
        ),
      ),

      // ── SnackBar ─────────────────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.surfaceContainer,
        contentTextStyle: typography.bodyMedium.copyWith(color: colors.onSurface),
        actionTextColor: colors.primary,
        shape: shapeM,
        behavior: SnackBarBehavior.floating,
        elevation: 2,
      ),

      // ── Progress ─────────────────────────────────────────────────────────────
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.primary,
        linearTrackColor: colors.surfaceContainer,
        circularTrackColor: colors.surfaceContainer,
      ),

      // ── Slider ───────────────────────────────────────────────────────────────
      sliderTheme: SliderThemeData(
        activeTrackColor: colors.primary,
        inactiveTrackColor: colors.surfaceContainer,
        thumbColor: colors.primary,
        overlayColor: colors.primary.withAlpha(30),
        activeTickMarkColor: colors.onPrimary,
        inactiveTickMarkColor: colors.primary,
        valueIndicatorColor: colors.primary,
        valueIndicatorTextStyle: typography.labelSmall.copyWith(color: colors.onPrimary),
        trackHeight: 4,
      ),

      // ── Input ────────────────────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceContainer,
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.l,
          vertical: spacing.m,
        ),
        border: OutlineInputBorder(
          borderRadius: radiusM,
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusM,
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusM,
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusM,
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radiusM,
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: radiusM,
          borderSide: BorderSide(color: colors.outline.withAlpha(128)),
        ),
        labelStyle: typography.bodyMedium.copyWith(color: colors.onSurfaceVariant),
        hintStyle: typography.bodyMedium.copyWith(color: colors.onSurfaceVariant),
        errorStyle: typography.bodySmall.copyWith(color: colors.error),
        helperStyle: typography.bodySmall.copyWith(color: colors.onSurfaceVariant),
        prefixIconColor: colors.onSurfaceVariant,
        suffixIconColor: colors.onSurfaceVariant,
      ),

      // ── Checkbox / Radio / Switch ─────────────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          if (states.contains(WidgetState.disabled)) {
            return colors.surfaceContainer;
          }
          return colors.transparent;
        }),
        checkColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.textDisabled;
          }
          return colors.onPrimary;
        }),
        side: BorderSide(color: colors.outline, width: 2),
        shape: RoundedRectangleBorder(borderRadius: radiusS),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.surfaceContainer;
          }
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.outline;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.textDisabled;
          }
          if (states.contains(WidgetState.selected)) {
            return colors.surface;
          }
          return colors.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.surfaceContainer;
          }
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.surfaceContainer;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.transparent;
          }
          return colors.outline;
        }),
      ),

      // ── Buttons (native Material) ─────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.surface,
          foregroundColor: colors.primary,
          shadowColor: colors.shadow,
          shape: shapeL,
          textStyle: typography.labelLarge,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: shapeL,
          textStyle: typography.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary),
          shape: shapeL,
          textStyle: typography.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          shape: shapeL,
          textStyle: typography.labelLarge,
        ),
      ),

      // ── Extensions ───────────────────────────────────────────────────────────
      extensions: [
        if (brandConfig != null) ChromiaBrandThemeExtension(brandConfig: brandConfig!),
      ],
    );
  }

  /// Creates a copy of this theme with the given fields replaced
  ChromiaThemeData copyWith({
    ChromiaColors? colors,
    ChromiaTypography? typography,
    ChromiaSpacing? spacing,
    ChromiaRadius? radius,
    ChromiaShadows? shadows,
    ChromiaBrandConfig? brandConfig,
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
