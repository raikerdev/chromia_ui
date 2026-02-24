import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A slider with a label and current value display.
class ChromiaListTileSlider extends StatelessWidget {
  const ChromiaListTileSlider({
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.activeColor,
    this.valueBuilder,
    this.contentPadding,
    this.enabled = true,
    this.trackHeight = 8,
    this.thumbRadius,
    this.thumbIcon,
    this.thumbShape,
    super.key,
  });

  /// The current value
  final double value;

  /// Called when the value changes
  final ValueChanged<double>? onChanged;

  /// Primary label
  final String? title;

  /// Secondary label
  final String? subtitle;

  /// Minimum value
  final double min;

  /// Maximum value
  final double max;

  /// Number of discrete divisions
  final int? divisions;

  /// Color of the active portion
  final Color? activeColor;

  /// Custom value formatter
  final String Function(double)? valueBuilder;

  /// Padding around the tile
  final EdgeInsetsGeometry? contentPadding;

  /// Whether the slider is enabled
  final bool enabled;

  /// Height of the slider track
  final double trackHeight;

  /// Radius of the slider thumb
  final double? thumbRadius;

  /// Icon to display on the slider thumb
  final IconData? thumbIcon;

  /// Shape of the slider thumb
  final SliderComponentShape? thumbShape;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final String displayValue = valueBuilder?.call(value) ?? value.toStringAsFixed(divisions != null ? 0 : 1);

    return Padding(
      padding: contentPadding ?? spacing.paddingM,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChromiaText(
                        title!,
                        type: ChromiaTypographyType.labelSmall,
                        color: colors.textSecondary,
                      ),
                      if (subtitle != null) ...[
                        spacing.gapVXS,
                        ChromiaText(
                          subtitle!,
                          type: ChromiaTypographyType.labelSmall,
                          color: colors.textSecondary,
                        ),
                      ],
                    ],
                  ),
                ),
                ChromiaText(
                  displayValue,
                  style: theme.typography.labelLarge.copyWith(
                    color: enabled ? colors.primary : colors.textDisabled,
                  ),
                  type: ChromiaTypographyType.labelLarge,
                  color: enabled ? colors.primary : colors.textDisabled,
                ),
              ],
            ),
          if (title != null) spacing.gapVS,
          ChromiaSlider(
            value: value,
            onChanged: onChanged,
            min: min,
            max: max,
            divisions: divisions,
            activeColor: activeColor,
            enabled: enabled,
            trackHeight: trackHeight,
            thumbRadius: thumbRadius,
            thumbIcon: thumbIcon,
            thumbShape: thumbShape,
          ),
        ],
      ),
    );
  }
}
