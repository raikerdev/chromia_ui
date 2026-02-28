import 'package:flutter/material.dart';

/// Configuration for a brand theme.
///
/// Allows applications to define brand-specific styling that can be
/// used to generate complete themes. This enables multi-brand support
/// where different brands can have their own visual identity.
class BrandConfig {
  const BrandConfig({
    required this.name,
    required this.primaryColor,
    this.secondaryColor,
    this.logoPath,
    this.fontFamily,
    this.customColors,
    this.monospaceFontFamily,
  });

  /// The name of the brand
  final String name;

  /// Primary brand color
  final Color primaryColor;

  /// Secondary brand color (optional, defaults to a variant of primary)
  final Color? secondaryColor;

  /// Path to the brand logo asset (optional)
  final String? logoPath;

  /// Custom font family for the brand (optional)
  final String? fontFamily;

  /// Custom monospace font family for the brand (optional)
  final String? monospaceFontFamily;

  /// Additional custom colors for the brand (optional)
  final Map<String, Color>? customColors;

  /// Creates a copy of this config with the given fields replaced
  BrandConfig copyWith({
    String? name,
    Color? primaryColor,
    Color? secondaryColor,
    String? logoPath,
    String? fontFamily,
    String? monospaceFontFamily,
    Map<String, Color>? customColors,
  }) {
    return BrandConfig(
      name: name ?? this.name,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      logoPath: logoPath ?? this.logoPath,
      fontFamily: fontFamily ?? this.fontFamily,
      monospaceFontFamily: monospaceFontFamily ?? this.monospaceFontFamily,
      customColors: customColors ?? this.customColors,
    );
  }

  /// Returns a custom color by key, or null if not found
  Color? getCustomColor(String key) {
    return customColors?[key];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is BrandConfig &&
        other.name == name &&
        other.primaryColor == primaryColor &&
        other.secondaryColor == secondaryColor &&
        other.logoPath == logoPath &&
        other.fontFamily == fontFamily;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      primaryColor,
      secondaryColor,
      logoPath,
      fontFamily,
    );
  }

  @override
  String toString() {
    return 'BrandConfig('
        'name: $name, '
        'primaryColor: $primaryColor, '
        'secondaryColor: $secondaryColor, '
        'logoPath: $logoPath, '
        'fontFamily: $fontFamily'
        ')';
  }
}

/// Predefined brand configurations for common use cases.
class BrandConfigs {
  BrandConfigs._();

  /// Default Chromia brand
  static const BrandConfig chromia = BrandConfig(
    name: 'Chromia',
    primaryColor: Color(0xFF2196F3),
    secondaryColor: Color(0xFF9C27B0),
  );

  /// Example brand with blue theme
  static const BrandConfig blueTheme = BrandConfig(
    name: 'Blue Theme',
    primaryColor: Color(0xFF1976D2),
    secondaryColor: Color(0xFF0288D1),
  );

  /// Example brand with green theme
  static const BrandConfig greenTheme = BrandConfig(
    name: 'Green Theme',
    primaryColor: Color(0xFF388E3C),
    secondaryColor: Color(0xFF689F38),
  );

  /// Example brand with purple theme
  static const BrandConfig purpleTheme = BrandConfig(
    name: 'Purple Theme',
    primaryColor: Color(0xFF7B1FA2),
    secondaryColor: Color(0xFF512DA8),
  );

  /// Example brand with orange theme
  static const BrandConfig orangeTheme = BrandConfig(
    name: 'Orange Theme',
    primaryColor: Color(0xFFF57C00),
    secondaryColor: Color(0xFFFF6F00),
  );

  /// Example brand with red theme
  static const BrandConfig redTheme = BrandConfig(
    name: 'Red Theme',
    primaryColor: Color(0xFFD32F2F),
    secondaryColor: Color(0xFFC62828),
  );

  /// Returns a list of all predefined brand configurations
  static List<BrandConfig> get all => [
    chromia,
    blueTheme,
    greenTheme,
    purpleTheme,
    orangeTheme,
    redTheme,
  ];
}
