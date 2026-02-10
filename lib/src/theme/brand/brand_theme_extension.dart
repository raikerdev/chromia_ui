import 'package:chromia_ui/src/theme/brand/brand_config.dart';
import 'package:flutter/material.dart';

/// Theme extension for brand-specific configuration.
///
/// This extension allows brand configuration to be stored in Flutter's
/// theme system and accessed throughout the app.
class BrandThemeExtension extends ThemeExtension<BrandThemeExtension> {
  const BrandThemeExtension({
    required this.brandConfig,
  });

  /// The brand configuration
  final BrandConfig brandConfig;

  /// Gets the brand name
  String get brandName => brandConfig.name;

  /// Gets the primary brand color
  Color get primaryBrandColor => brandConfig.primaryColor;

  /// Gets the secondary brand color
  Color? get secondaryBrandColor => brandConfig.secondaryColor;

  /// Gets the logo path
  String? get logoPath => brandConfig.logoPath;

  /// Gets the custom font family
  String? get fontFamily => brandConfig.fontFamily;

  /// Gets a custom color by key
  Color? getCustomColor(String key) => brandConfig.getCustomColor(key);

  @override
  ThemeExtension<BrandThemeExtension> copyWith({
    BrandConfig? brandConfig,
  }) {
    return BrandThemeExtension(
      brandConfig: brandConfig ?? this.brandConfig,
    );
  }

  @override
  ThemeExtension<BrandThemeExtension> lerp(
    covariant ThemeExtension<BrandThemeExtension>? other,
    double t,
  ) {
    if (other is! BrandThemeExtension) {
      return this;
    }

    // For brand config, we don't interpolate - we just switch at t = 0.5
    return t < 0.5 ? this : other;
  }

  /// Helper method to get BrandThemeExtension from BuildContext
  static BrandThemeExtension? of(BuildContext context) {
    return Theme.of(context).extension<BrandThemeExtension>();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is BrandThemeExtension && other.brandConfig == brandConfig;
  }

  @override
  int get hashCode => brandConfig.hashCode;

  @override
  String toString() => 'BrandThemeExtension(brandConfig: $brandConfig)';
}
