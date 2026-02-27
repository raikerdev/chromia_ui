import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A progress indicator with multiple segments.
///
/// Useful for showing progress through multiple steps.
class ChromiaSteppedProgress extends StatelessWidget {
  const ChromiaSteppedProgress({
    required this.currentStep,
    required this.totalSteps,
    this.height = 4.0,
    this.spacing = 4.0,
    this.activeColor,
    this.inactiveColor,
    this.borderRadius,
    super.key,
  });

  /// Current step (0-based index)
  final int currentStep;

  /// Total number of steps
  final int totalSteps;

  /// Height of each step indicator
  final double height;

  /// Spacing between steps
  final double spacing;

  /// Color for completed steps
  final Color? activeColor;

  /// Color for incomplete steps
  final Color? inactiveColor;

  /// Border radius of step indicators
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    final Color effectiveActiveColor = activeColor ?? colors.primary;
    final Color effectiveInactiveColor = inactiveColor ?? colors.surfaceVariant;
    final BorderRadius effectiveBorderRadius = borderRadius ?? BorderRadius.circular(height / 2);

    return Row(
      children: List.generate(totalSteps, (index) {
        final bool isActive = index <= currentStep;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < totalSteps - 1 ? spacing : 0,
            ),
            child: AnimatedContainer(
              duration: AnimationTokens.normal,
              curve: AnimationTokens.easeOut,
              height: height,
              decoration: BoxDecoration(
                color: isActive ? effectiveActiveColor : effectiveInactiveColor,
                borderRadius: effectiveBorderRadius,
              ),
            ),
          ),
        );
      }),
    );
  }
}