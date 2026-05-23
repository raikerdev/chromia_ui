import 'package:chromia_ui/src/theme/chromia_colors.dart';
import 'package:chromia_ui/src/theme/chromia_radius.dart';
import 'package:chromia_ui/src/theme/chromia_shadows.dart';
import 'package:chromia_ui/src/theme/chromia_spacing.dart';
import 'package:chromia_ui/src/theme/chromia_theme_data.dart';
import 'package:chromia_ui/src/theme/chromia_typography.dart';
import 'package:flutter/foundation.dart';
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty<ChromiaThemeData>('data', data));
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

/// Asserts in debug mode that there is a [ChromiaTheme] ancestor in the tree.
///
/// Call this inside `build` methods of custom widgets that depend on
/// [ChromiaTheme.of] to get a clear error message when the widget is used
/// outside a [ChromiaTheme] — instead of silently falling back to the
/// default light theme.
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   assert(debugCheckHasChromiaTheme(context));
///   final theme = ChromiaTheme.of(context);
///   // ...
/// }
/// ```
bool debugCheckHasChromiaTheme(BuildContext context) {
  assert(() {
    if (context.widget is ChromiaTheme) {
      return true;
    }
    final bool found =
        context.dependOnInheritedWidgetOfExactType<_InheritedChromiaTheme>() != null;
    if (!found) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('No ChromiaTheme widget found.'),
        ErrorDescription(
          '${context.widget.runtimeType} requires a ChromiaTheme ancestor.\n'
          'The specific widget that could not find a ChromiaTheme was:\n'
          '  ${context.widget.runtimeType}',
        ),
        ErrorHint(
          'Ensure that a ChromiaTheme widget is above the widget tree:\n'
          '  ChromiaTheme(\n'
          '    data: ChromiaThemeData.light(),\n'
          '    child: YourWidget(),\n'
          '  )',
        ),
        context.describeElement('The context being searched was'),
      ]);
    }
    return true;
  }());
  return true;
}

// ── AnimatedChromiaTheme ──────────────────────────────────────────────────────

/// A [Tween] that interpolates between two [ChromiaThemeData] instances.
///
/// Uses [ChromiaThemeData.lerp] for the interpolation.
class ChromiaThemeDataTween extends Tween<ChromiaThemeData> {
  /// Creates a tween for [ChromiaThemeData].
  ChromiaThemeDataTween({super.begin, super.end});

  @override
  ChromiaThemeData lerp(double t) => ChromiaThemeData.lerp(begin!, end!, t);
}

/// An animated [ChromiaTheme] that smoothly transitions between themes.
///
/// When [data] changes, the widget interpolates from the previous theme to
/// the new one over [duration] using [ChromiaThemeData.lerp]. This enables
/// butter-smooth dark/light mode toggles and brand-switch animations.
///
/// ```dart
/// AnimatedChromiaTheme(
///   data: isDark ? ChromiaThemeData.dark() : ChromiaThemeData.light(),
///   duration: const Duration(milliseconds: 300),
///   child: MyApp(),
/// )
/// ```
///
/// See also:
/// - [ChromiaTheme] — the non-animated version.
/// - [ChromiaThemeData.lerp] — the interpolation function.
class AnimatedChromiaTheme extends ImplicitlyAnimatedWidget {
  /// Creates an animated Chromia theme.
  const AnimatedChromiaTheme({
    required this.data,
    required this.child,
    super.duration = const Duration(milliseconds: 200),
    super.curve,
    super.onEnd,
    super.key,
  });

  /// The target theme. When this changes the widget animates toward it.
  final ChromiaThemeData data;

  /// The widget subtree that receives the animated theme.
  final Widget child;

  @override
  AnimatedWidgetBaseState<AnimatedChromiaTheme> createState() =>
      _AnimatedChromiaThemeState();
}

class _AnimatedChromiaThemeState
    extends AnimatedWidgetBaseState<AnimatedChromiaTheme> {
  ChromiaThemeDataTween? _data;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _data = visitor(
      _data,
      widget.data,
      (dynamic value) =>
          ChromiaThemeDataTween(begin: value as ChromiaThemeData),
    ) as ChromiaThemeDataTween?;
  }

  @override
  Widget build(BuildContext context) {
    return ChromiaTheme(
      data: _data!.evaluate(animation),
      child: widget.child,
    );
  }
}

// ── BuildContext extensions ───────────────────────────────────────────────────

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
