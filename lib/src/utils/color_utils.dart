import 'package:flutter/material.dart';

/// Utility functions for color manipulation.
class ColorUtils {
  ColorUtils._();

  /// Returns the luminance of a color (0.0 - 1.0).
  static double getLuminance(Color color) {
    return color.computeLuminance();
  }

  /// Returns true if the color is considered dark.
  static bool isDark(Color color) {
    return getLuminance(color) < 0.5;
  }

  /// Returns true if the color is considered light.
  static bool isLight(Color color) {
    return getLuminance(color) >= 0.5;
  }

  /// Returns a contrasting color (black or white) for the given color.
  static Color getContrastColor(Color color) {
    return isDark(color) ? Colors.white : Colors.black;
  }

  /// Returns an appropriate text color for the given background color.
  static Color getTextColor(Color backgroundColor) {
    return getContrastColor(backgroundColor);
  }

  /// Lightens a color by the given amount (0.0 - 1.0).
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final HSLColor hsl = HSLColor.fromColor(color);
    final double lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Darkens a color by the given amount (0.0 - 1.0).
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final HSLColor hsl = HSLColor.fromColor(color);
    final double lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Increases the saturation of a color by the given amount (0.0 - 1.0).
  static Color saturate(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final HSLColor hsl = HSLColor.fromColor(color);
    final double saturation = (hsl.saturation + amount).clamp(0.0, 1.0);
    return hsl.withSaturation(saturation).toColor();
  }

  /// Decreases the saturation of a color by the given amount (0.0 - 1.0).
  static Color desaturate(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final HSLColor hsl = HSLColor.fromColor(color);
    final double saturation = (hsl.saturation - amount).clamp(0.0, 1.0);
    return hsl.withSaturation(saturation).toColor();
  }

  /// Rotates the hue of a color by the given degrees (0 - 360).
  static Color rotateHue(Color color, double degrees) {
    final HSLColor hsl = HSLColor.fromColor(color);
    final double hue = (hsl.hue + degrees) % 360;
    return hsl.withHue(hue).toColor();
  }

  /// Returns a complementary color (opposite on the color wheel).
  static Color complementary(Color color) {
    return rotateHue(color, 180);
  }

  /// Returns an analogous color by rotating the hue.
  static Color analogous(Color color, [double degrees = 30]) {
    return rotateHue(color, degrees);
  }

  /// Blends two colors together with the given ratio (0.0 - 1.0).
  /// ratio = 0.0 returns color1, ratio = 1.0 returns color2.
  static Color blend(Color color1, Color color2, double ratio) {
    assert(ratio >= 0 && ratio <= 1, 'Ratio must be between 0 and 1');
    return Color.lerp(color1, color2, ratio)!;
  }

  /// Adds opacity to a color.
  static Color withOpacity(Color color, int opacity) {
    assert(opacity >= 0 && opacity <= 255, 'Opacity must be between 0 and 255');
    return color.withAlpha(opacity);
  }

  /// Converts a hex string to a Color.
  /// Supports both '#RRGGBB' and '#AARRGGBB' formats.
  static Color fromHex(String hexString) {
    final String buffer = hexString.replaceFirst('#', '');
    if (buffer.length == 6) {
      return Color(int.parse('FF$buffer', radix: 16));
    } else if (buffer.length == 8) {
      return Color(int.parse(buffer, radix: 16));
    }
    throw ArgumentError('Invalid hex color: $hexString');
  }

  /// Converts a Color to a hex string.
  static String toHex(Color color, {bool includeAlpha = false}) {
    if (includeAlpha) {
      return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}';
    } else {
      final String hex = color.toARGB32().toRadixString(16).padLeft(8, '0');
      return '#${hex.substring(2).toUpperCase()}';
    }
  }

  /// Returns a color with adjusted alpha channel.
  static Color withAlpha(Color color, int alpha) {
    assert(alpha >= 0 && alpha <= 255, 'Alpha must be between 0 and 255');
    return color.withAlpha(alpha);
  }

  /// Generates a color palette from a base color.
  static Map<int, Color> generatePalette(Color baseColor) {
    return {
      50: lighten(baseColor, 0.45),
      100: lighten(baseColor, 0.40),
      200: lighten(baseColor, 0.30),
      300: lighten(baseColor, 0.20),
      400: lighten(baseColor, 0.10),
      500: baseColor,
      600: darken(baseColor, 0.10),
      700: darken(baseColor, 0.20),
      800: darken(baseColor, 0.30),
      900: darken(baseColor, 0.40),
    };
  }

  /// Checks if two colors have sufficient contrast ratio.
  /// WCAG AA requires 4.5:1 for normal text, 3:1 for large text.
  /// WCAG AAA requires 7:1 for normal text, 4.5:1 for large text.
  static bool hasContrast(
    Color foreground,
    Color background, {
    double minimumRatio = 4.5,
  }) {
    final double ratio = getContrastRatio(foreground, background);
    return ratio >= minimumRatio;
  }

  /// Calculates the contrast ratio between two colors.
  /// Returns a value between 1 and 21.
  static double getContrastRatio(Color foreground, Color background) {
    final double l1 = getLuminance(foreground) + 0.05;
    final double l2 = getLuminance(background) + 0.05;
    return l1 > l2 ? l1 / l2 : l2 / l1;
  }

  /// Returns an accessible color pair (foreground on background).
  /// Adjusts the foreground color until it meets the minimum contrast ratio.
  static Color ensureContrast(
    Color foreground,
    Color background, {
    double minimumRatio = 4.5,
  }) {
    if (hasContrast(foreground, background, minimumRatio: minimumRatio)) {
      return foreground;
    }

    // Try darkening or lightening the foreground color
    final bool shouldDarken = isLight(background);
    Color adjusted = foreground;
    const double step = 0.05;

    for (double amount = step; amount <= 1.0; amount += step) {
      adjusted = shouldDarken
          ? darken(foreground, amount)
          : lighten(
              foreground,
              amount,
            );

      if (hasContrast(adjusted, background, minimumRatio: minimumRatio)) {
        return adjusted;
      }
    }

    // If still no contrast, return black or white
    return getContrastColor(background);
  }
}
