import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// Configuration for a brand theme.
///
/// Allows applications to define brand-specific styling that can be
/// used to generate complete themes. This enables multi-brand support
/// where different brands can have their own visual identity.
class ChromiaBrandConfig {
  const ChromiaBrandConfig({
    required this.name,
    required this.colorConfig,
    this.typographyConfig,
  });

  /// The name of the brand
  final String name;

  /// The color configuration for the brand
  final ChromiaBrandColorConfig colorConfig;

  /// The typography configuration for the brand
  final ChromiaBrandTypographyConfig? typographyConfig;

  /// Creates a copy of this config with the given fields replaced
  ChromiaBrandConfig copyWith({
    String? name,
    ChromiaBrandColorConfig? colorConfig,
    ChromiaBrandTypographyConfig? typographyConfig,
  }) {
    return ChromiaBrandConfig(
      name: name ?? this.name,
      colorConfig: colorConfig ?? this.colorConfig,
      typographyConfig: typographyConfig ?? this.typographyConfig,
    );
  }

  /// Returns a custom color by key, or null if not found
  Color? getCustomColor(String key) {
    return colorConfig.customColors[key];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChromiaBrandConfig &&
        other.name == name &&
        other.colorConfig == colorConfig &&
        other.typographyConfig == typographyConfig;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      colorConfig,
      typographyConfig,
    );
  }

  @override
  String toString() {
    return 'BrandConfig('
        'name: $name, '
        'colorConfig: ${colorConfig.toString()}, '
        'typographyConfig: ${typographyConfig.toString()}, '
        ')';
  }
}

/// Predefined brand configurations for common use cases.
class BrandConfigs {
  BrandConfigs._();

  /// Default Chromia brand
  static const ChromiaBrandConfig chromia = ChromiaBrandConfig(
    name: 'Default Chromia Brand',
    colorConfig: ChromiaBrandColorConfig.defaultConfig(),
  );

  static const ChromiaBrandConfig blueTheme = ChromiaBrandConfig(
    name: 'Blue Theme',
    colorConfig: ChromiaBrandColorConfig(
      primaryLight: Color(0xFF1976D2),
    ),
  );

  static const ChromiaBrandConfig purpleTheme = ChromiaBrandConfig(
    name: 'Purple Theme',
    colorConfig: ChromiaBrandColorConfig(
      primaryLight: Color(0xFF7B1FA2),
    ),
  );

  /// Example brand with orange theme
  static const ChromiaBrandConfig orangeTheme = ChromiaBrandConfig(
    name: 'Orange Theme',
    colorConfig: ChromiaBrandColorConfig(
      primaryLight: Color(0xFFF57C00),
    ),
  );

  /// Returns a list of all predefined brand configurations
  static List<ChromiaBrandConfig> get all => [
    chromia,
    blueTheme,
    purpleTheme,
    orangeTheme,
  ];
}
