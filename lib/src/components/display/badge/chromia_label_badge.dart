import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui/src/utils/widget_utils.dart';
import 'package:flutter/material.dart';

/// A standalone badge that can be used inline.
class ChromiaLabelBadge extends StatelessWidget {
  const ChromiaLabelBadge({
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.onRemove,
    this.shape = ChromiaBadgeShape.rounded,
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

  /// Shape of the badge
  final ChromiaBadgeShape shape;

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaSpacing;
    final radius = context.chromiaRadius;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.surfaceContainer;
    final Color effectiveTextColor = textColor ?? colors.onSurfaceContainer;

    final BorderRadius borderRadius = switch (shape) {
      ChromiaBadgeShape.rounded => radius.radiusS,
      ChromiaBadgeShape.square => radius.radiusNone,
      ChromiaBadgeShape.circle => radius.radiusFull,
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.m,
        vertical: spacing.xs,
      ),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: borderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: TypographyTokens.fontSize14,
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
            Icon(
              Icons.close,
              size: TypographyTokens.fontSize14,
              color: effectiveTextColor,
            ).wrapWithOnTap(onRemove),
          ],
        ],
      ),
    );
  }
}
