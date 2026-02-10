import 'package:chromia_ui/src/theme/chromia_colors.dart';
import 'package:chromia_ui/src/theme/chromia_radius.dart';
import 'package:chromia_ui/src/theme/chromia_shadows.dart';
import 'package:chromia_ui/src/theme/chromia_spacing.dart';
import 'package:chromia_ui/src/theme/chromia_theme_data.dart';
import 'package:chromia_ui/src/theme/chromia_typography.dart';
import 'package:flutter/material.dart';

/// An InheritedWidget that propagates the Chromia theme down the widget tree.
///
/// This widget should be placed near the root of your widget tree to make
/// the theme available to all descendant widgets.
///
/// Example:
/// ```dart
/// ChromiaTheme(
///   data: ChromiaThemeData.light(),
///   child: MaterialApp(
///     home: MyHomePage(),
///   ),
/// )
/// ```
class ChromiaTheme extends StatelessWidget {
  const ChromiaTheme({
    required this.data,
    required this.child,
    super.key,
  });

  /// The theme data to propagate
  final ChromiaThemeData data;

  /// The widget below this widget in the tree
  final Widget child;

  /// Returns the ChromiaThemeData from the closest ChromiaTheme ancestor.
  ///
  /// If there is no ancestor, this method returns a default light theme.
  static ChromiaThemeData of(BuildContext context) {
    final _InheritedChromiaTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedChromiaTheme>();

    return inheritedTheme?.data ?? ChromiaThemeData.light();
  }

  /// Returns the ChromiaThemeData from the closest ChromiaTheme ancestor,
  /// or null if there is no ancestor.
  static ChromiaThemeData? maybeOf(BuildContext context) {
    final _InheritedChromiaTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedChromiaTheme>();

    return inheritedTheme?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedChromiaTheme(
      data: data,
      child: child,
    );
  }
}

/// The actual InheritedWidget that holds the theme data.
class _InheritedChromiaTheme extends InheritedWidget {
  const _InheritedChromiaTheme({
    required this.data,
    required super.child,
  });

  final ChromiaThemeData data;

  @override
  bool updateShouldNotify(_InheritedChromiaTheme oldWidget) {
    return data != oldWidget.data;
  }
}

/// Extension on BuildContext for easy access to the theme.
extension ChromiaThemeExtension on BuildContext {
  /// Returns the ChromiaThemeData from the closest ChromiaTheme ancestor.
  ChromiaThemeData get chromiaTheme => ChromiaTheme.of(this);

  /// Returns the ChromiaColors from the current theme.
  ChromiaColors get chromiaColors => chromiaTheme.colors;

  /// Returns the ChromiaTypography from the current theme.
  ChromiaTypography get chromiaTypography => chromiaTheme.typography;

  /// Returns the ChromiaSpacing from the current theme.
  ChromiaSpacing get chromiaSpacing => chromiaTheme.spacing;

  /// Returns the ChromiaRadius from the current theme.
  ChromiaRadius get chromiaRadius => chromiaTheme.radius;

  /// Returns the ChromiaShadows from the current theme.
  ChromiaShadows get chromiaShadows => chromiaTheme.shadows;

  /// Returns true if the current theme is dark.
  bool get isDarkTheme => chromiaTheme.isDark;

  /// Returns true if the current theme is light.
  bool get isLightTheme => chromiaTheme.isLight;
}
