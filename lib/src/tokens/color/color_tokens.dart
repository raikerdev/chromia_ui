import 'package:flutter/material.dart';

/// Base color palette tokens.
///
/// This class provides the foundation color palette that can be used
/// to generate semantic color systems and brand-specific themes.
class ColorTokens {
  ColorTokens._();

  // Neutral colors (Gray scale)
  static const Color neutral0 = Color(0xFFFFFFFF);
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
  static const Color neutral1000 = Color(0xFF000000);

  // Error colors (Red)
  static const Color errorLight = Color(0xFFB71C1C);
  static const Color onErrorLight = Color(0xFFFFFFFF);
  static const Color errorContainerLight = Color(0xFFFFCDD2);
  static const Color onErrorContainerLight = Color(0xFF7F0000);

  static const Color errorDark = Color(0xFFEF9A9A);
  static const Color onErrorDark = Color(0xFF3E0000);
  static const Color errorContainerDark = Color(0xFF541212);
  static const Color onErrorContainerDark = Color(0xFFFFCDD2);

  // Success colors (Green)
  static const Color successLight = Color(0xFF1B5E20);
  static const Color onSuccessLight = Color(0xFFFFFFFF);
  static const Color successContainerLight = Color(0xFFC8E6C9);
  static const Color onSuccessContainerLight = Color(0xFF003300);

  static const Color successDark = Color(0xFF81C784);
  static const Color onSuccessDark = Color(0xFF003300);
  static const Color successContainerDark = Color(0xFF1A3D1A);
  static const Color onSuccessContainerDark = Color(0xFFC8E6C9);

  // Warning colors (Orange)
  static const Color warningLight = Color(0xFFF57F17);
  static const Color onWarningLight = Color(0xFFFFFFFF);
  static const Color warningContainerLight = Color(0xFFFFF8E1);
  static const Color onWarningContainerLight = Color(0xFF7B5800);

  static const Color warningDark = Color(0xFFFFD54F);
  static const Color onWarningDark = Color(0xFF3E2800);
  static const Color warningContainerDark = Color(0xFF4A3500);
  static const Color onWarningContainerDark = Color(0xFFFFF8E1);

  // Info colors (Cyan)
  static const Color infoLight = Color(0xFF006064);
  static const Color onInfoLight = Color(0xFFFFFFFF);
  static const Color infoContainerLight = Color(0xFFB2EBF2);
  static const Color onInfoContainerLight = Color(0xFF002F32);

  static const Color infoDark = Color(0xFF4DD0E1);
  static const Color onInfoDark = Color(0xFF002F32);
  static const Color infoContainerDark = Color(0xFF003D42);
  static const Color onInfoContainerDark = Color(0xFFB2EBF2);

  // Surface colors
  static const Color surfaceLight = Color(0xFFFEF7FF);
  static const Color onSurfaceLight = Color(0xFF1D1B20);
  static const Color onSurfaceVariantLight = Color(0xFF49454F);
  static const Color surfaceContainerLight = Color(0xFFF3EDF7);
  static const Color onSurfaceContainerLight = Color(0xFF1D1B20);

  static const Color surfaceDark = Color(0xFF141218);
  static const Color onSurfaceDark = Color(0xFFE6E0E9);
  static const Color onSurfaceVariantDark = Color(0xFFCAC4D0);
  static const Color surfaceContainerDark = Color(0xFF211F26);
  static const Color onSurfaceContainerDark = Color(0xFFE6E0E9);

  // Other light
  static const Color shadowLight = Color(0xFF2A2A2A);
  static const Color overlayLight = Color(0x52000000);
  static const Color scrimLight = Color(0x52000000);
  static const Color transparentLight = Color(0x00FFFFFF);

  static const Color shadowDark = Color(0xFF000000);
  static const Color overlayDark = Color(0x52FFFFFF);
  static const Color scrimDark = Color(0x52000000);
  static const Color transparentDark = Color(0x00000000);

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
