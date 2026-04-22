import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable badge component for displaying notifications and indicators.
///
/// Example usage:
/// ```dart
/// ChromiaBadge(
///   child: Icon(Icons.notifications),
///   value: '5',
/// )
/// ```
class ChromiaBadge extends StatelessWidget {
  const ChromiaBadge({
    required this.child,
    this.value,
    this.showBadge = true,
    this.position,
    this.backgroundColor,
    this.textColor,
    this.size = ChromiaBadgeSize.medium,
    this.shape = ChromiaBadgeShape.circle,
    this.maxValue = 9,
    this.offset,
    super.key,
  });

  /// The widget to display the badge on
  final Widget child;

  /// The value to display in the badge
  final String? value;

  /// Whether to show the badge
  final bool showBadge;

  /// Position of the badge relative to the child
  final ChromiaPosition? position;

  /// Background color of the badge
  final Color? backgroundColor;

  /// Text color of the badge
  final Color? textColor;

  /// Size of the badge
  final ChromiaBadgeSize size;

  /// Shape of the badge
  final ChromiaBadgeShape shape;

  /// Maximum value to display (values above this show as "9+")
  final int maxValue;

  /// Offset of the badge relative to the child
  final double? offset;

  bool get isDot => value == null || value!.isEmpty;

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;

    if (!showBadge) {
      return child;
    }

    final Color effectiveBackgroundColor = backgroundColor ?? colors.error;
    final Color effectiveTextColor = textColor ?? colors.onError;
    final ChromiaPosition effectivePosition = position ?? ChromiaPosition.topRight(offset: isDot ? -2 : null);

    // Calculate display value
    String? displayValue = value;
    if (value != null) {
      final int? numValue = int.tryParse(value!);
      if (numValue != null && numValue > maxValue) {
        displayValue = '$maxValue+';
      }
    }

    return ChromiaPositionWidget(
      badge: _Badge(
        value: displayValue,
        backgroundColor: effectiveBackgroundColor,
        textColor: effectiveTextColor,
        size: size,
        shape: shape,
      ),
      badgePosition: effectivePosition,
      child: child,
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.backgroundColor,
    required this.textColor,
    required this.size,
    required this.shape,
    this.value,
  });

  final String? value;
  final Color backgroundColor;
  final Color textColor;
  final ChromiaBadgeSize size;
  final ChromiaBadgeShape shape;

  bool get isDot => value == null || value!.isEmpty;

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final radius = context.chromiaRadius;
    final spacing = context.chromiaSpacing;

    final BorderRadius? borderRadius = switch (shape) {
      ChromiaBadgeShape.rounded => radius.radiusM,
      ChromiaBadgeShape.square => radius.radiusNone,
      ChromiaBadgeShape.circle => null,
    };

    return Container(
      constraints: BoxConstraints(
        minWidth: isDot ? size.value / 1.5 : size.value,
        minHeight: isDot ? size.value / 1.5 : size.value,
      ),
      padding: isDot
          ? spacing.paddingNone
          : spacing.symmetric(
              horizontal: size.value / 4,
              vertical: 2,
            ),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: shape == ChromiaBadgeShape.circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: borderRadius,
        border: Border.all(
          color: colors.surface,
          width: 1,
        ),
      ),
      child: isDot
          ? null
          : Center(
              child: ChromiaText(
                value!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: size.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}

/// Size options for badges
enum ChromiaBadgeSize {
  /// Small badge (16px)
  small(value: 16, fontSize: 8),

  /// Medium badge (18px, default)
  medium(value: 18, fontSize: 10),

  /// Large badge (20px)
  large(value: 20, fontSize: 11)
  ;

  final double value;
  final double fontSize;

  const ChromiaBadgeSize({
    required this.value,
    required this.fontSize,
  });
}

/// Shape options for badges
enum ChromiaBadgeShape {
  /// Circular badge
  circle,

  /// Rounded rectangle badge
  rounded,

  /// Square badge with slight rounding
  square,
}
