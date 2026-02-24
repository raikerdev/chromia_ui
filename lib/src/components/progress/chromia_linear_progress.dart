import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable linear progress indicator.
///
/// Shows progress as a horizontal bar that fills from left to right.
///
/// Example usage:
/// ```dart
/// ChromiaLinearProgress(
///   value: 0.7, // 70% complete
/// )
/// ```
class ChromiaLinearProgress extends StatelessWidget {
  const ChromiaLinearProgress({
    this.value,
    this.backgroundColor,
    this.color,
    this.height = 4.0,
    this.borderRadius,
    this.showLabel = false,
    this.labelBuilder,
    super.key,
  });

  /// The progress value (0.0 to 1.0). If null, shows indeterminate progress.
  final double? value;

  /// Background color of the progress bar
  final Color? backgroundColor;

  /// Color of the progress indicator
  final Color? color;

  /// Height of the progress bar
  final double height;

  /// Border radius of the progress bar
  final BorderRadius? borderRadius;

  /// Whether to show a label with the percentage
  final bool showLabel;

  /// Custom label builder
  final String Function(double)? labelBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.surfaceVariant;
    final Color effectiveColor = color ?? colors.primary;
    final BorderRadius effectiveBorderRadius = borderRadius ?? BorderRadius.circular(height / 2);

    final Widget progressBar = ClipRRect(
      borderRadius: effectiveBorderRadius,
      child: SizedBox(
        height: height,
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: effectiveBackgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
        ),
      ),
    );

    if (showLabel && value != null) {
      final String label = labelBuilder?.call(value!) ?? '${(value! * 100).toStringAsFixed(0)}%';

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChromiaText(
                label,
                type: ChromiaTypographyType.labelSmall,
                color: colors.textSecondary,
              ),
            ],
          ),
          spacing.gapVXS,
          progressBar,
        ],
      );
    }

    return progressBar;
  }
}
