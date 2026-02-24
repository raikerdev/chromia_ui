import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A slider with a label and current value display.
class ChromiaListTileRangeSlider extends StatelessWidget {
  const ChromiaListTileRangeSlider({
    required this.values,
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
    this.startThumbIcon,
    this.endThumbIcon,
    this.rangeThumbShape,
    super.key,
  });

  /// The current range values
  final RangeValues values;

  /// Called when the values change
  final ValueChanged<RangeValues>? onChanged;

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

  /// Icon to display on the slider start thumb
  final IconData? startThumbIcon;

  /// Icon to display on the slider end thumb
  final IconData? endThumbIcon;

  /// Shape of the slider start thumb
  final RangeSliderThumbShape? rangeThumbShape;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final String startValue = valueBuilder?.call(values.start) ?? values.start.toStringAsFixed(divisions != null ? 0 : 1);
    final String endValue = valueBuilder?.call(values.end) ?? values.end.toStringAsFixed(divisions != null ? 0 : 1);

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
                  '($startValue, $endValue)',
                  style: theme.typography.labelLarge.copyWith(
                    color: enabled ? colors.primary : colors.textDisabled,
                  ),
                  type: ChromiaTypographyType.labelLarge,
                  color: enabled ? colors.primary : colors.textDisabled,
                ),
              ],
            ),
          if (title != null) spacing.gapVS,
          ChromiaRangeSlider(
            values: values,
            onChanged: onChanged,
            min: min,
            max: max,
            divisions: divisions,
            activeColor: activeColor,
            enabled: enabled,
            showValues: false,
            trackHeight: trackHeight,
            thumbRadius: thumbRadius,
            startThumbIcon: startThumbIcon,
            endThumbIcon: endThumbIcon,
            rangeThumbShape: rangeThumbShape,
          ),
        ],
      ),
    );
  }
}
