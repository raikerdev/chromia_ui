import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable circular progress indicator.
///
/// Shows progress as a circular ring that fills clockwise.
///
/// Example usage:
/// ```dart
/// ChromiaCircularProgress(
///   value: 0.7, // 70% complete
///   size: 50,
/// )
/// ```
class ChromiaCircularProgress extends StatelessWidget {
  const ChromiaCircularProgress({
    this.value,
    this.size = 40.0,
    this.strokeWidth = 4.0,
    this.backgroundColor,
    this.color,
    this.showLabel = false,
    this.labelBuilder,
    this.child,
    super.key,
  });

  /// The progress value (0.0 to 1.0). If null, shows indeterminate progress.
  final double? value;

  /// Size of the circular progress indicator
  final double size;

  /// Width of the progress stroke
  final double strokeWidth;

  /// Background color of the progress circle
  final Color? backgroundColor;

  /// Color of the progress indicator
  final Color? color;

  /// Whether to show a label with the percentage in the center
  final bool showLabel;

  /// Custom label builder
  final String Function(double)? labelBuilder;

  /// Custom child widget to display in the center
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.surfaceVariant;
    final Color effectiveColor = color ?? colors.primary;

    Widget centerWidget;

    if (child != null) {
      centerWidget = child!;
    } else if (showLabel && value != null) {
      final String label = labelBuilder?.call(value!) ?? '${(value! * 100).toStringAsFixed(0)}%';
      centerWidget = ChromiaText(
        label,
        type: ChromiaTypographyType.labelSmall,
        style: theme.typography.labelSmall.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      centerWidget = const SizedBox.shrink();
    }

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: strokeWidth,
              backgroundColor: effectiveBackgroundColor,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
            ),
          ),
          centerWidget,
        ],
      ),
    );
  }
}