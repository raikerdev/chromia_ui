import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A range slider with a label header and current values display.
///
/// Renders a title/subtitle row above a full-width [ChromiaRangeSlider] track.
/// Supports the same [ChromiaListTileVariant] options as [ChromiaListTile]
/// (standard, outlined, card) so it integrates seamlessly in any list layout.
///
/// Example usage:
/// ```dart
/// ChromiaListTileRangeSlider(
///   values: priceRange,
///   onChanged: (v) => setState(() => priceRange = v),
///   title: Text('Price range'),
///   min: 0,
///   max: 1000,
///   divisions: 10,
///   valueBuilder: (v) => '\$${v.toInt()}',
/// )
/// ```
class ChromiaListTileRangeSlider extends StatelessWidget {
  /// Creates a [ChromiaListTileRangeSlider].
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
    this.variant = ChromiaListTileVariant.standard,
    super.key,
  });

  /// The current range values.
  final RangeValues values;

  /// Called when the values change.
  final ValueChanged<RangeValues>? onChanged;

  /// Primary label displayed above the slider.
  final Widget? title;

  /// Secondary label displayed below [title].
  final Widget? subtitle;

  /// Minimum value.
  final double min;

  /// Maximum value.
  final double max;

  /// Number of discrete divisions.
  final int? divisions;

  /// Color of the active portion.
  final Color? activeColor;

  /// Custom value formatter for each thumb. Defaults to one decimal place.
  final String Function(double)? valueBuilder;

  /// Padding around the tile. Defaults to [ChromiaSpacing.paddingM].
  final EdgeInsetsGeometry? contentPadding;

  /// Whether the slider is enabled.
  final bool enabled;

  /// Height of the slider track.
  final double trackHeight;

  /// Radius of the slider thumb.
  final double? thumbRadius;

  /// Icon to display on both slider thumbs.
  final IconData? thumbIcon;

  /// Icon to display on the start thumb.
  final IconData? startThumbIcon;

  /// Icon to display on the end thumb.
  final IconData? endThumbIcon;

  /// Shape of the slider thumbs.
  final RangeSliderThumbShape? rangeThumbShape;

  /// The visual variant of the tile.
  ///
  /// Mirrors [ChromiaListTile.variant] — standard (default), outlined, card.
  final ChromiaListTileVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final radius = theme.radius;

    final String startValue =
        valueBuilder?.call(values.start) ??
        values.start.toStringAsFixed(divisions != null ? 0 : 1);
    final String endValue =
        valueBuilder?.call(values.end) ??
        values.end.toStringAsFixed(divisions != null ? 0 : 1);

    Widget content = Padding(
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
                      DefaultTextStyle(
                        style: theme.typography.bodyMedium.copyWith(
                          color: colors.onSurface,
                        ),
                        child: title!,
                      ),
                      if (subtitle != null) ...[
                        spacing.gapVXS,
                        DefaultTextStyle(
                          style: theme.typography.bodySmall.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                          child: subtitle!,
                        ),
                      ],
                    ],
                  ),
                ),
                ChromiaText(
                  '($startValue – $endValue)',
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

    // Apply variant decoration — identical logic to ChromiaListTile.
    if (variant == ChromiaListTileVariant.outlined) {
      content = Container(
        decoration: BoxDecoration(
          border: Border.all(color: colors.outline),
          borderRadius: radius.radiusM,
        ),
        child: content,
      );
    } else if (variant == ChromiaListTileVariant.card) {
      content = Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: radius.radiusM,
          boxShadow: theme.shadows.s,
        ),
        child: content,
      );
    }

    return content;
  }
}
