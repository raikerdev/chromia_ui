import 'package:flutter/material.dart';

class ChromiaPositionWidget extends StatelessWidget {
  const ChromiaPositionWidget({
    required this.badge,
    required this.badgePosition,
    this.child,
    super.key,
  });

  final Widget badge;
  final ChromiaPosition badgePosition;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (child == null) {
      return badge;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child!,
        Positioned(
          top: badgePosition.top,
          right: badgePosition.right,
          bottom: badgePosition.bottom,
          left: badgePosition.left,
          child: badge,
        ),
      ],
    );
  }
}

/// Position configuration for badges
class ChromiaPosition {
  static const double _customOffset = -4;

  const ChromiaPosition({
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
  factory ChromiaPosition.topRight({double? offset}) {
    final double offsetValue = offset ?? _customOffset;
    return ChromiaPosition(
      top: offsetValue,
      right: offsetValue,
    );
  }

  /// Top left corner
  factory ChromiaPosition.topLeft({double? offset}) {
    final double offsetValue = offset ?? _customOffset;
    return ChromiaPosition(
      top: offsetValue,
      left: offsetValue,
    );
  }

  /// Bottom right corner
  factory ChromiaPosition.bottomRight({double? offset}) {
    final double offsetValue = offset ?? _customOffset;
    return ChromiaPosition(
      bottom: offsetValue,
      right: offsetValue,
    );
  }

  /// Bottom left corner
  factory ChromiaPosition.bottomLeft({double? offset}) {
    final double offsetValue = offset ?? _customOffset;
    return ChromiaPosition(
      bottom: offsetValue,
      left: offsetValue,
    );
  }
}
