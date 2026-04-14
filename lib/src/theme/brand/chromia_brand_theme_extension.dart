import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// Theme extension for brand-specific configuration.
///
/// This extension allows brand configuration to be stored in Flutter's
/// theme system and accessed throughout the app.
class ChromiaBrandThemeExtension extends ThemeExtension<ChromiaBrandThemeExtension> {
  const ChromiaBrandThemeExtension({
    required this.brandConfig,
  });

  /// The brand configuration
  final ChromiaBrandConfig brandConfig;

  /// Gets the brand name
  String get brandName => brandConfig.name;

  /// Gets the brand color config
  ChromiaBrandColorConfig get brandColorConfig => brandConfig.colorConfig;

  /// Gets a custom color by key
  Color? getCustomColor(String key) => brandConfig.getCustomColor(key);

  /// Gets the brand typography config
  ChromiaBrandTypographyConfig? get typographyConfig => brandConfig.typographyConfig;

  @override
  ThemeExtension<ChromiaBrandThemeExtension> copyWith({
    ChromiaBrandConfig? brandConfig,
  }) {
    return ChromiaBrandThemeExtension(
      brandConfig: brandConfig ?? this.brandConfig,
    );
  }

  @override
  ThemeExtension<ChromiaBrandThemeExtension> lerp(
    covariant ThemeExtension<ChromiaBrandThemeExtension>? other,
    double t,
  ) {
    if (other is! ChromiaBrandThemeExtension) {
      return this;
    }

    // For brand config, we don't interpolate - we just switch at t = 0.5
    return t < 0.5 ? this : other;
  }

  /// Helper method to get BrandThemeExtension from BuildContext
  static ChromiaBrandThemeExtension? of(BuildContext context) {
    return Theme.of(context).extension<ChromiaBrandThemeExtension>();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChromiaBrandThemeExtension && other.brandConfig == brandConfig;
  }

  @override
  int get hashCode => brandConfig.hashCode;

  @override
  String toString() => 'BrandThemeExtension(brandConfig: $brandConfig)';
}
