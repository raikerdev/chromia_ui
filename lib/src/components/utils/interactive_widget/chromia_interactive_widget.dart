import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

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
  final bool useCircleBorder;

  bool get isInteractive => onPressed != null || onLongPress != null || onHover != null;

  @override
  Widget build(BuildContext context) {
    if (!isInteractive) {
      return child ?? const SizedBox();
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        customBorder: useCircleBorder ? const CircleBorder() : null,
        mouseCursor: SystemMouseCursors.click,
        hoverColor: ColorTokens.neutral900.withAlpha(30),
        highlightColor: ColorTokens.neutral900.withAlpha(50),
        child: Ink(
          child: child,
        ),
      ),
    );
  }
}
