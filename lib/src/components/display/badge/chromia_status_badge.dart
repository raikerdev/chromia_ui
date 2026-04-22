import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A status badge for showing status indicators.
class ChromiaStatusBadge extends StatelessWidget {
  const ChromiaStatusBadge({
    required this.status,
    this.child,
    this.text,
    this.showDot = true,
    this.position,
    super.key,
  });

  /// The widget to display the badge on
  final Widget? child;

  /// Status type
  final ChromiaStatusType status;

  /// Optional status text
  final String? text;

  /// Whether to show the status dot
  final bool showDot;

  /// Position of the badge relative to the child
  final ChromiaPosition? position;

  @override
  Widget build(BuildContext context) {
    final String effectiveText = child == null ? text ?? '' : '';

    final ChromiaPosition effectivePosition = position ?? ChromiaPosition.bottomRight(offset: -3);

    return ChromiaPositionWidget(
      badge: _StatusBadge(
        status: status,
        text: effectiveText,
        showDot: showDot,
      ),
      badgePosition: effectivePosition,
      child: child,
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.status,
    this.text,
    this.showDot = true,
  });

  final ChromiaStatusType status;
  final String? text;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final spacing = theme.spacing;

    final Color statusColor = switch (status) {
      ChromiaStatusType.success => colors.success,
      ChromiaStatusType.warning => colors.warning,
      ChromiaStatusType.error => colors.error,
      ChromiaStatusType.info => colors.info,
      ChromiaStatusType.neutral => colors.onSurfaceVariant,
    };

    if (text == null && !showDot) {
      return const SizedBox.shrink();
    }

    if (text == null) {
      return Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: statusColor,
          shape: BoxShape.circle,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showDot) ...[
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: colors.surface,
                width: 1,
              ),
            ),
          ),
          spacing.gapHXS,
        ],
        ChromiaText(
          text!,
          type: ChromiaTypographyType.labelSmall,
          color: colors.onSurfaceVariant,
        ),
      ],
    );
  }
}

/// Status types for status badges
enum ChromiaStatusType {
  /// Success status
  success,

  /// Warning status
  warning,

  /// Error status
  error,

  /// Info status
  info,

  /// Neutral status
  neutral,
}
