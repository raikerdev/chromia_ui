import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

class ChromiaBadgeContainer extends StatelessWidget {
  const ChromiaBadgeContainer({
    required this.badge,
    required this.badgePosition,
    this.child,
    super.key,
  });

  final Widget badge;
  final ChromiaBadgePosition badgePosition;
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
