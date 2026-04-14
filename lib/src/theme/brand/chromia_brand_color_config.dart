import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

class ChromiaBrandColorConfig {
  const ChromiaBrandColorConfig({
    required Color primaryLight,
    Color? onPrimaryLight,
    Color? primaryContainerLight,
    Color? onPrimaryContainerLight,
    Color? primaryDark,
    Color? onPrimaryDark,
    Color? primaryContainerDark,
    Color? onPrimaryContainerDark,
    Color? secondaryLight,
    Color? onSecondaryLight,
    Color? secondaryContainerLight,
    Color? onSecondaryContainerLight,
    Color? secondaryDark,
    Color? onSecondaryDark,
    Color? secondaryContainerDark,
    Color? onSecondaryContainerDark,
    Map<String, Color>? customColors,
  }) : _primaryLight = primaryLight,
       _onPrimaryLight = onPrimaryLight,
       _primaryContainerLight = primaryContainerLight,
       _onPrimaryContainerLight = onPrimaryContainerLight,
       _primaryDark = primaryDark,
       _onPrimaryDark = onPrimaryDark,
       _primaryContainerDark = primaryContainerDark,
       _onPrimaryContainerDark = onPrimaryContainerDark,
       _secondaryLight = secondaryLight,
       _onSecondaryLight = onSecondaryLight,
       _secondaryContainerLight = secondaryContainerLight,
       _onSecondaryContainerLight = onSecondaryContainerLight,
       _secondaryDark = secondaryDark,
       _onSecondaryDark = onSecondaryDark,
       _secondaryContainerDark = secondaryContainerDark,
       _onSecondaryContainerDark = onSecondaryContainerDark,
       _customColors = customColors;

  const ChromiaBrandColorConfig.defaultConfig()
    : this(
        primaryLight: ChromiaBrandColorTokens.primaryLight,
        onPrimaryLight: ChromiaBrandColorTokens.onPrimaryLight,
        primaryContainerLight: ChromiaBrandColorTokens.primaryContainerLight,
        onPrimaryContainerLight: ChromiaBrandColorTokens.onPrimaryContainerLight,
        primaryDark: ChromiaBrandColorTokens.primaryDark,
        onPrimaryDark: ChromiaBrandColorTokens.onPrimaryDark,
        primaryContainerDark: ChromiaBrandColorTokens.primaryContainerDark,
        onPrimaryContainerDark: ChromiaBrandColorTokens.onPrimaryContainerDark,
        secondaryLight: ChromiaBrandColorTokens.secondaryLight,
        onSecondaryLight: ChromiaBrandColorTokens.onSecondaryLight,
        secondaryContainerLight: ChromiaBrandColorTokens.secondaryContainerLight,
        onSecondaryContainerLight: ChromiaBrandColorTokens.onSecondaryContainerLight,
        secondaryDark: ChromiaBrandColorTokens.secondaryDark,
        onSecondaryDark: ChromiaBrandColorTokens.onSecondaryDark,
        secondaryContainerDark: ChromiaBrandColorTokens.secondaryContainerDark,
        onSecondaryContainerDark: ChromiaBrandColorTokens.onSecondaryContainerDark,
      );

  final Color _primaryLight;
  final Color? _onPrimaryLight;
  final Color? _primaryContainerLight;
  final Color? _onPrimaryContainerLight;
  final Color? _primaryDark;
  final Color? _onPrimaryDark;
  final Color? _primaryContainerDark;
  final Color? _onPrimaryContainerDark;

  final Color? _secondaryLight;
  final Color? _onSecondaryLight;
  final Color? _secondaryContainerLight;
  final Color? _onSecondaryContainerLight;
  final Color? _secondaryDark;
  final Color? _onSecondaryDark;
  final Color? _secondaryContainerDark;
  final Color? _onSecondaryContainerDark;

  /// Additional custom colors for the brand (optional)
  final Map<String, Color>? _customColors;

  Color get primaryLight => _primaryLight;

  Color get onPrimaryLight => _onPrimaryLight ?? ColorUtils.getContrastColor(primaryLight);

  Color get primaryContainerLight => _primaryContainerLight ?? ColorUtils.lighten(primaryLight, 0.35);

  Color get onPrimaryContainerLight =>
      _onPrimaryContainerLight ??
      ColorUtils.ensureContrast(
        ColorUtils.darken(primaryLight, 0.3),
        primaryContainerLight,
      );

  Color get primaryDark => _primaryDark ?? _deriveDark(primaryLight);

  Color get onPrimaryDark => _onPrimaryDark ?? ColorUtils.getContrastColor(primaryDark);

  Color get primaryContainerDark => _primaryContainerDark ?? ColorUtils.darken(primaryDark, 0.25);

  Color get onPrimaryContainerDark =>
      _onPrimaryContainerDark ??
      ColorUtils.ensureContrast(
        ColorUtils.lighten(primaryDark, 0.35),
        primaryContainerDark,
      );

  Color get secondaryLight => _secondaryLight ?? _deriveSecondary(primaryLight);

  Color get onSecondaryLight => _onSecondaryLight ?? ColorUtils.getContrastColor(secondaryLight);

  Color get secondaryContainerLight => _secondaryContainerLight ?? ColorUtils.lighten(secondaryLight, 0.35);

  Color get onSecondaryContainerLight =>
      _onSecondaryContainerLight ??
      ColorUtils.ensureContrast(
        ColorUtils.darken(secondaryLight, 0.3),
        secondaryContainerLight,
      );

  Color get secondaryDark => _secondaryDark ?? _deriveDark(secondaryLight);

  Color get onSecondaryDark => _onSecondaryDark ?? ColorUtils.getContrastColor(secondaryDark);

  Color get secondaryContainerDark => _secondaryContainerDark ?? ColorUtils.darken(secondaryDark, 0.25);

  Color get onSecondaryContainerDark =>
      _onSecondaryContainerDark ??
      ColorUtils.ensureContrast(
        ColorUtils.lighten(secondaryDark, 0.35),
        secondaryContainerDark,
      );

  Map<String, Color> get customColors => _customColors ?? {};

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is ChromiaBrandColorConfig &&
        other.primaryLight == primaryLight &&
        other.onPrimaryLight == onPrimaryLight &&
        other.primaryContainerLight == primaryContainerLight &&
        other.onPrimaryContainerLight == onPrimaryContainerLight &&
        other.primaryDark == primaryDark &&
        other.onPrimaryDark == onPrimaryDark &&
        other.primaryContainerDark == primaryContainerDark &&
        other.onPrimaryContainerDark == onPrimaryContainerDark &&
        other.secondaryLight == secondaryLight &&
        other.onSecondaryLight == onSecondaryLight &&
        other.secondaryContainerLight == secondaryContainerLight &&
        other.onSecondaryContainerLight == onSecondaryContainerLight &&
        other.secondaryDark == secondaryDark &&
        other.onSecondaryDark == onSecondaryDark &&
        other.secondaryContainerDark == secondaryContainerDark &&
        other.onSecondaryContainerDark == onSecondaryContainerDark &&
        other.customColors == customColors;
  }

  @override
  int get hashCode {
    return Object.hash(
      primaryLight,
      onPrimaryLight,
      primaryContainerLight,
      onPrimaryContainerLight,
      primaryDark,
      onPrimaryDark,
      primaryContainerDark,
      onPrimaryContainerDark,
      secondaryLight,
      onSecondaryLight,
      secondaryContainerLight,
      onSecondaryContainerLight,
      secondaryDark,
      onSecondaryDark,
      secondaryContainerDark,
      onSecondaryContainerDark,
      customColors,
    );
  }

  Color _deriveSecondary(Color primary) {
    final HSLColor hsl = HSLColor.fromColor(primary);
    return hsl
        .withSaturation((hsl.saturation * 0.35).clamp(0.0, 1.0))
        .withLightness((hsl.lightness + 0.1).clamp(0.0, 1.0))
        .toColor();
  }

  Color _deriveDark(Color lightColor) {
    final Color lighter = ColorUtils.lighten(lightColor, 0.25);
    return ColorUtils.saturate(lighter, 0.1);
  }
}
