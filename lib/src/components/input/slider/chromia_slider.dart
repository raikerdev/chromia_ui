import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui/src/components/input/slider/chromia_slider_icon_shape.dart';
import 'package:flutter/material.dart';

/// A customizable slider component for selecting a value from a range.
///
/// Example usage:
/// ```dart
/// ChromiaSlider(
///   value: _currentValue,
///   min: 0,
///   max: 100,
///   onChanged: (value) => setState(() => _currentValue = value),
/// )
/// ```
class ChromiaSlider extends StatelessWidget {
  const ChromiaSlider({
    required this.value,
    required this.onChanged,
    this.minLabel,
    this.maxLabel,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.valueBuilder,
    this.enabled = true,
    this.trackHeight = 8,
    this.thumbRadius,
    this.thumbIcon,
    this.thumbShape,
    super.key,
  }) : assert(!(thumbIcon != null && thumbShape != null), 'Either thumbIcon or thumbShape must be provided, not both.');

  /// The current value of the slider
  final double value;

  /// Called when the value changes
  final ValueChanged<double>? onChanged;

  /// Label for minimum value
  final String? minLabel;

  /// Label for maximum value
  final String? maxLabel;

  /// Minimum value
  final double min;

  /// Maximum value
  final double max;

  /// Number of discrete divisions
  final int? divisions;

  /// Label to show above the slider thumb
  final String? label;

  /// Color of the active portion of the slider
  final Color? activeColor;

  /// Color of the inactive portion of the slider
  final Color? inactiveColor;

  /// Color of the slider thumb
  final Color? thumbColor;

  /// Custom value formatter
  final String Function(double)? valueBuilder;

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

  bool get _showInfo => valueBuilder != null || minLabel != null || maxLabel != null;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveActiveColor = activeColor ?? colors.primary;
    final Color effectiveInactiveColor = inactiveColor ?? colors.surfaceVariant;

    final enabledThumbRadius = thumbRadius ?? trackHeight + 4;

    final iconThumbShape = (thumbIcon != null) ? ChromiaSliderIconShape(icon: thumbIcon!, thumbRadius: enabledThumbRadius) : null;
    final enabledThumbShape = iconThumbShape ?? thumbShape ?? RoundSliderThumbShape(enabledThumbRadius: enabledThumbRadius);

    final SliderThemeData sliderTheme = SliderTheme.of(context).copyWith(
      activeTrackColor: effectiveActiveColor,
      inactiveTrackColor: effectiveInactiveColor,
      thumbColor: thumbColor ?? effectiveActiveColor,
      overlayColor: effectiveActiveColor.withAlpha(31),
      overlayShape: RoundSliderOverlayShape(overlayRadius: enabledThumbRadius + 10),
      valueIndicatorColor: effectiveActiveColor,
      trackHeight: trackHeight,
      thumbShape: enabledThumbShape,
      activeTickMarkColor: effectiveInactiveColor.withAlpha(50),
      inactiveTickMarkColor: effectiveActiveColor.withAlpha(100),
    );

    final Widget slider = SliderTheme(
      data: sliderTheme,
      child: Slider(
        value: value,
        min: min,
        max: max,
        divisions: divisions,
        label: label,
        onChanged: enabled ? onChanged : null,
      ),
    );

    if (_showInfo) {
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
                minLabel ?? '',
                margin: const EdgeInsetsGeometry.only(left: 8),
                type: ChromiaTypographyType.labelSmall,
                color: enabled ? colors.textSecondary : colors.textDisabled,
              ),
              ChromiaText(
                valueBuilder?.call(value) ?? '',
                type: ChromiaTypographyType.labelSmall,
                color: enabled ? colors.textSecondary : colors.textDisabled,
              ),
              ChromiaText(
                maxLabel ?? '',
                margin: const EdgeInsetsGeometry.only(right: 8),
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
