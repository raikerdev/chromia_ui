import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A status badge for showing status indicators.
class ChromiaStatusBadge extends StatelessWidget {
  const ChromiaStatusBadge({
    required this.status,
    this.text,
    this.showDot = true,
    super.key,
  });

  /// Status type
  final ChromiaStatusType status;

  /// Optional status text
  final String? text;

  /// Whether to show the status dot
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color statusColor = switch (status) {
      ChromiaStatusType.success => colors.success,
      ChromiaStatusType.warning => colors.warning,
      ChromiaStatusType.error => colors.error,
      ChromiaStatusType.info => colors.info,
      ChromiaStatusType.neutral => colors.textSecondary,
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
            ),
          ),
          spacing.gapHXS,
        ],
        ChromiaText(
          text!,
          type: ChromiaTypographyType.labelSmall,
          color: colors.textSecondary,
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