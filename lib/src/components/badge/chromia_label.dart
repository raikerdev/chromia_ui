import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A standalone badge that can be used inline.
class ChromiaLabel extends StatelessWidget {
  const ChromiaLabel({
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.onRemove,
    this.borderRadius,
    super.key,
  });

  /// Text to display
  final String text;

  /// Background color
  final Color? backgroundColor;

  /// Text color
  final Color? textColor;

  /// Optional icon
  final IconData? icon;

  /// Callback when remove button is pressed
  final VoidCallback? onRemove;

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.surfaceContainerHigh;
    final Color effectiveTextColor = textColor ?? colors.textPrimary;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.m,
        vertical: spacing.xs,
      ),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: borderRadius ?? theme.radius.radiusS,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 14,
              color: effectiveTextColor,
            ),
            spacing.gapHXS,
          ],
          ChromiaText(
            text,
            type: ChromiaTypographyType.labelSmall,
            color: effectiveTextColor,
          ),
          if (onRemove != null) ...[
            spacing.gapHXS,
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onRemove,
                child: Icon(
                  Icons.close,
                  size: 14,
                  color: effectiveTextColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
