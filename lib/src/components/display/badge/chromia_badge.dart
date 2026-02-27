import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui/src/theme/chromia_theme.dart';
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
    super.key,
  });

  /// The widget to display the badge on
  final Widget child;

  /// The value to display in the badge
  final String? value;

  /// Whether to show the badge
  final bool showBadge;

  /// Position of the badge relative to the child
  final ChromiaBadgePosition? position;

  /// Background color of the badge
  final Color? backgroundColor;

  /// Text color of the badge
  final Color? textColor;

  /// Size of the badge
  final ChromiaBadgeSize size;

  /// Shape of the badge
  final ChromiaBadgeShape shape;

  /// Maximum value to display (values above this show as "99+")
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    if (!showBadge) {
      return child;
    }

    final bool isDot = value == null || value!.isEmpty;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.error;
    final Color effectiveTextColor = textColor ?? colors.onError;
    final ChromiaBadgePosition effectivePosition = position ?? ChromiaBadgePosition.topRight(offset: isDot ? -2 : null);

    // Calculate display value
    String? displayValue = value;
    if (value != null) {
      final int? numValue = int.tryParse(value!);
      if (numValue != null && numValue > maxValue) {
        displayValue = '$maxValue+';
      }
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: effectivePosition.top,
          right: effectivePosition.right,
          bottom: effectivePosition.bottom,
          left: effectivePosition.left,
          child: _Badge(
            value: displayValue,
            backgroundColor: effectiveBackgroundColor,
            textColor: effectiveTextColor,
            size: size,
            shape: shape,
          ),
        ),
      ],
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

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;

    final bool isDot = value == null || value!.isEmpty;
    final double minWidth = isDot ? size.value : size.value + 2;

    BoxShape? boxShape;
    BorderRadius? borderRadius;

    if (shape == ChromiaBadgeShape.circle) {
      boxShape = BoxShape.circle;
    } else if (shape == ChromiaBadgeShape.rounded) {
      borderRadius = BorderRadius.circular(size.value / 2);
    } else if (shape == ChromiaBadgeShape.square) {
      borderRadius = BorderRadius.circular(2);
    }

    return Container(
      constraints: BoxConstraints(
        minWidth: isDot ? minWidth / 1.5 : minWidth,
        minHeight: isDot ? size.value / 1.5 : size.value,
      ),
      padding: isDot
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(
              horizontal: size == ChromiaBadgeSize.small ? 4 : 6,
              vertical: 2,
            ),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: boxShape ?? BoxShape.rectangle,
        borderRadius: borderRadius,
        border: Border.all(
          color: theme.colors.surface,
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

const double customOffset = -6;
/// Position configuration for badges
class ChromiaBadgePosition {
  const ChromiaBadgePosition({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  /// Top right corner (default)
  factory ChromiaBadgePosition.topRight({double? offset}) {
    final double offsetValue = offset ?? customOffset;
    return ChromiaBadgePosition(
      top: offsetValue,
      right: offsetValue,
    );
  }

  /// Top left corner
  factory ChromiaBadgePosition.topLeft({double? offset}) {
    final double offsetValue = offset ?? customOffset;
    return ChromiaBadgePosition(
      top: offsetValue,
      left: offsetValue,
    );
  }

  /// Bottom right corner
  factory ChromiaBadgePosition.bottomRight({double? offset}) {
    final double offsetValue = offset ?? customOffset;
    return ChromiaBadgePosition(
      bottom: offsetValue,
      right: offsetValue,
    );
  }

  /// Bottom left corner
  factory ChromiaBadgePosition.bottomLeft({double? offset}) {
    final double offsetValue = offset ?? customOffset;
    return ChromiaBadgePosition(
      bottom: offsetValue,
      left: offsetValue,
    );
  }
}

/// Size options for badges
enum ChromiaBadgeSize {
  /// Small badge (16px)
  small(16, 8),

  /// Medium badge (18px, default)
  medium(18, 10),

  /// Large badge (20px)
  large(20, 11);

  final double value;
  final double fontSize;

  const ChromiaBadgeSize(this.value, this.fontSize);
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




