import 'package:flutter/material.dart';

/// Base color palette tokens.
///
/// This class provides the foundation color palette that can be used
/// to generate semantic color systems and brand-specific themes.
class ColorTokens {
  ColorTokens._();

  // Neutral colors (Gray scale)
  static const Color neutral0 = Color(0xFFFFFFFF); // White
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFEEEEEE);
  static const Color neutral300 = Color(0xFFE0E0E0);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral600 = Color(0xFF757575);
  static const Color neutral700 = Color(0xFF616161);
  static const Color neutral800 = Color(0xFF424242);
  static const Color neutral900 = Color(0xFF2A2A2A);
  static const Color neutral1000 = Color(0xFF212121); // Black

  // Primary colors (Blue)
  static const Color primary50 = Color(0xFFE3F2FD);
  static const Color primary100 = Color(0xFFBBDEFB);
  static const Color primary200 = Color(0xFF90CAF9);
  static const Color primary300 = Color(0xFF64B5F6);
  static const Color primary400 = Color(0xFF42A5F5);
  static const Color primary500 = Color(0xFF2196F3);
  static const Color primary600 = Color(0xFF1E88E5);
  static const Color primary700 = Color(0xFF1976D2);
  static const Color primary800 = Color(0xFF1565C0);
  static const Color primary900 = Color(0xFF0D47A1);

  // Secondary colors (Purple)
  static const Color secondary50 = Color(0xFFF3E5F5);
  static const Color secondary100 = Color(0xFFE1BEE7);
  static const Color secondary200 = Color(0xFFCE93D8);
  static const Color secondary300 = Color(0xFFBA68C8);
  static const Color secondary400 = Color(0xFFAB47BC);
  static const Color secondary500 = Color(0xFF9C27B0);
  static const Color secondary600 = Color(0xFF8E24AA);
  static const Color secondary700 = Color(0xFF7B1FA2);
  static const Color secondary800 = Color(0xFF6A1B9A);
  static const Color secondary900 = Color(0xFF4A148C);

  // Success colors (Green)
  static const Color success50 = Color(0xFFE8F5E9);
  static const Color success100 = Color(0xFFC8E6C9);
  static const Color success200 = Color(0xFFA5D6A7);
  static const Color success300 = Color(0xFF81C784);
  static const Color success400 = Color(0xFF66BB6A);
  static const Color success500 = Color(0xFF4CAF50);
  static const Color success600 = Color(0xFF43A047);
  static const Color success700 = Color(0xFF388E3C);
  static const Color success800 = Color(0xFF2E7D32);
  static const Color success900 = Color(0xFF1B5E20);

  // Warning colors (Orange)
  static const Color warning50 = Color(0xFFFFF3E0);
  static const Color warning100 = Color(0xFFFFE0B2);
  static const Color warning200 = Color(0xFFFFCC80);
  static const Color warning300 = Color(0xFFFFB74D);
  static const Color warning400 = Color(0xFFFFA726);
  static const Color warning500 = Color(0xFFFF9800);
  static const Color warning600 = Color(0xFFFB8C00);
  static const Color warning700 = Color(0xFFF57C00);
  static const Color warning800 = Color(0xFFEF6C00);
  static const Color warning900 = Color(0xFFE65100);

  // Error colors (Red)
  static const Color error50 = Color(0xFFFFEBEE);
  static const Color error100 = Color(0xFFFFCDD2);
  static const Color error200 = Color(0xFFEF9A9A);
  static const Color error300 = Color(0xFFE57373);
  static const Color error400 = Color(0xFFEF5350);
  static const Color error500 = Color(0xFFF44336);
  static const Color error600 = Color(0xFFE53935);
  static const Color error700 = Color(0xFFD32F2F);
  static const Color error800 = Color(0xFFC62828);
  static const Color error900 = Color(0xFFB71C1C);

  // Info colors (Cyan)
  static const Color info50 = Color(0xFFE0F7FA);
  static const Color info100 = Color(0xFFB2EBF2);
  static const Color info200 = Color(0xFF80DEEA);
  static const Color info300 = Color(0xFF4DD0E1);
  static const Color info400 = Color(0xFF26C6DA);
  static const Color info500 = Color(0xFF00BCD4);
  static const Color info600 = Color(0xFF00ACC1);
  static const Color info700 = Color(0xFF0097A7);
  static const Color info800 = Color(0xFF00838F);
  static const Color info900 = Color(0xFF006064);

  /// Transparent color
  static const Color transparent = Color(0x00000000);

  /// Returns a color from a hex string (e.g., "#FF5733" or "FF5733")
  static Color fromHex(String hexString) {
    final buffer = hexString.replaceFirst('#', '');
    if (buffer.length == 6) {
      return Color(int.parse('FF$buffer', radix: 16));
    } else if (buffer.length == 8) {
      return Color(int.parse(buffer, radix: 16));
    }
    throw ArgumentError('Invalid hex color: $hexString');
  }

  /// Returns a map of all primary color shades
  static Map<int, Color> get primaryShades => {
    50: primary50,
    100: primary100,
    200: primary200,
    300: primary300,
    400: primary400,
    500: primary500,
    600: primary600,
    700: primary700,
    800: primary800,
    900: primary900,
  };

  /// Returns a map of all neutral color shades
  static Map<int, Color> get neutralShades => {
    0: neutral0,
    50: neutral50,
    100: neutral100,
    200: neutral200,
    300: neutral300,
    400: neutral400,
    500: neutral500,
    600: neutral600,
    700: neutral700,
    800: neutral800,
    900: neutral900,
    1000: neutral1000,
  };

  /// Returns a MaterialColor from a Color
  static MaterialColor createMaterialColor(Color color) {
    final strengths = <double>[0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];
    final swatch = <int, Color>{};
    final r = (color.r * 255.0).round().clamp(0, 255);
    final g = (color.g * 255.0).round().clamp(0, 255);
    final b = (color.b * 255.0).round().clamp(0, 255);

    for (var i = 0; i < strengths.length; i++) {
      final strength = strengths[i];
      final ds = (0.5 - strength).abs() < 0.01 ? 500 : (i + 1) * 100;
      swatch[ds] = Color.fromRGBO(
        r + ((strength < 0.5 ? 255 - r : r) * strength).round(),
        g + ((strength < 0.5 ? 255 - g : g) * strength).round(),
        b + ((strength < 0.5 ? 255 - b : b) * strength).round(),
        1,
      );
    }
    return MaterialColor(color.toARGB32(), swatch);
  }
}
