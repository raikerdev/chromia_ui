import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A utility widget that adds tap, long-press and hover interactions to any
/// child using [InkWell] over a transparent [Material].
///
/// All colours are resolved from the current [ChromiaTheme] so both light and
/// dark modes behave correctly.
class ChromiaInteractiveWidget extends StatelessWidget {
  const ChromiaInteractiveWidget({
    this.child,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.useCircleBorder = false,
    super.key,
  });

  final Widget? child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;

  /// When `true`, the ink ripple uses a circular clip (e.g. for icon buttons).
  final bool useCircleBorder;

  bool get isInteractive =>
      onPressed != null || onLongPress != null || onHover != null;

  @override
  Widget build(BuildContext context) {
    if (!isInteractive) {
      return child ?? const SizedBox();
    }

    // onSurface is dark on light backgrounds and light on dark backgrounds,
    // so the overlay naturally adapts to the current theme.
    final Color onSurface = context.chromiaColors.onSurface;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        customBorder: useCircleBorder ? const CircleBorder() : null,
        mouseCursor: SystemMouseCursors.click,
        hoverColor: onSurface.withAlpha(20),
        highlightColor: onSurface.withAlpha(40),
        child: Ink(
          child: child,
        ),
      ),
    );
  }
}
