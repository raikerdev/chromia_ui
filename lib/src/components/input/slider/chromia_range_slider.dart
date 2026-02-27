import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui/src/components/input/slider/chromia_range_slider_icon_shape.dart';
import 'package:flutter/material.dart';

/// A range slider for selecting a range of values.
class ChromiaRangeSlider extends StatelessWidget {
  const ChromiaRangeSlider({
    required this.values,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.labels,
    this.activeColor,
    this.inactiveColor,
    this.showValues = false,
    this.valueBuilder,
    this.enabled = true,
    this.trackHeight = 8,
    this.thumbRadius,
    this.startThumbIcon,
    this.endThumbIcon,
    this.rangeThumbShape,
    super.key,
  });

  /// The current range values
  final RangeValues values;

  /// Called when the values change
  final ValueChanged<RangeValues>? onChanged;

  /// Minimum value
  final double min;

  /// Maximum value
  final double max;

  /// Number of discrete divisions
  final int? divisions;

  /// Labels to show above the thumbs
  final RangeLabels? labels;

  /// Color of the active portion
  final Color? activeColor;

  /// Color of the inactive portion
  final Color? inactiveColor;

  /// Whether to show the values below the slider
  final bool showValues;

  /// Custom value formatter
  final String Function(double)? valueBuilder;

  /// Whether the slider is enabled
  final bool enabled;

  /// Height of the slider track
  final double trackHeight;

  /// Radius of the slider thumb
  final double? thumbRadius;

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

    final Color effectiveActiveColor = activeColor ?? colors.primary;
    final Color effectiveInactiveColor = inactiveColor ?? colors.surfaceVariant;

    final enabledThumbRadius = thumbRadius ?? trackHeight + 4;

    final iconThumbShape = (startThumbIcon != null)
        ? ChromiaRangeSliderIconShape(
            startIcon: startThumbIcon!,
            endIcon: endThumbIcon ?? startThumbIcon!,
            thumbRadius: enabledThumbRadius,
          )
        : null;
    final enabledRangeThumbShape =
        iconThumbShape ?? rangeThumbShape ?? RoundRangeSliderThumbShape(enabledThumbRadius: enabledThumbRadius);

    final SliderThemeData sliderTheme = SliderTheme.of(context).copyWith(
      activeTrackColor: effectiveActiveColor,
      inactiveTrackColor: effectiveInactiveColor,
      thumbColor: effectiveActiveColor,
      overlayColor: effectiveActiveColor.withAlpha(31),
      overlayShape: RoundSliderOverlayShape(overlayRadius: enabledThumbRadius + 10),
      valueIndicatorColor: effectiveActiveColor,
      trackHeight: trackHeight,
      rangeThumbShape: enabledRangeThumbShape,
      activeTickMarkColor: effectiveInactiveColor.withAlpha(50),
      inactiveTickMarkColor: effectiveActiveColor.withAlpha(100),
    );

    final Widget slider = SliderTheme(
      data: sliderTheme,
      child: RangeSlider(
        values: values,
        min: min,
        max: max,
        divisions: divisions,
        labels: labels,
        onChanged: enabled ? onChanged : null,
      ),
    );

    if (showValues) {
      final String startValue = valueBuilder?.call(values.start) ?? values.start.toStringAsFixed(divisions != null ? 0 : 1);
      final String endValue = valueBuilder?.call(values.end) ?? values.end.toStringAsFixed(divisions != null ? 0 : 1);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          slider,
          spacing.gapVXS,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChromiaText(
                startValue,
                type: ChromiaTypographyType.labelSmall,
                color: enabled ? colors.textSecondary : colors.textDisabled,
              ),
              ChromiaText(
                endValue,
                type: ChromiaTypographyType.labelSmall,
                color: enabled ? colors.textSecondary : colors.textDisabled,
              ),
            ],
          ),
        ],
      );
    }

    return slider;
  }
}
