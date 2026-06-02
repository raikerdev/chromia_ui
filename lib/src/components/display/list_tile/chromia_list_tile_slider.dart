import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A slider with a label header and current value display.
///
/// Renders a title/subtitle row above a full-width [ChromiaSlider] track.
/// Supports the same [ChromiaListTileVariant] options as [ChromiaListTile]
/// (standard, outlined, card) so it integrates seamlessly in any list layout.
///
/// Example usage:
/// ```dart
/// ChromiaListTileSlider(
///   value: volume,
///   onChanged: (v) => setState(() => volume = v),
///   title: Text('Volume'),
///   subtitle: Text('Adjust playback volume'),
///   min: 0,
///   max: 100,
///   divisions: 10,
///   valueBuilder: (v) => '${v.toInt()}%',
/// )
/// ```
class ChromiaListTileSlider extends StatelessWidget {
  /// Creates a [ChromiaListTileSlider].
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
    this.variant = ChromiaListTileVariant.standard,
    super.key,
  });

  /// The current value.
  final double value;

  /// Called when the value changes.
  final ValueChanged<double>? onChanged;

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

  /// Custom value formatter. Defaults to one decimal place.
  final String Function(double)? valueBuilder;

  /// Padding around the tile. Defaults to [ChromiaSpacing.paddingM].
  final EdgeInsetsGeometry? contentPadding;

  /// Whether the slider is enabled.
  final bool enabled;

  /// Height of the slider track.
  final double trackHeight;

  /// Radius of the slider thumb.
  final double? thumbRadius;

  /// Icon to display on the slider thumb.
  final IconData? thumbIcon;

  /// Shape of the slider thumb.
  final SliderComponentShape? thumbShape;

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

    final String displayValue =
        valueBuilder?.call(value) ??
        value.toStringAsFixed(divisions != null ? 0 : 1);

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
                  displayValue,
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
