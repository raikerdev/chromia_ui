import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A shared layout shell for list tile variants with a trailing control.
///
/// [ChromiaListTileShell] provides the standard tile structure used by
/// [ChromiaListTileCheckbox], [ChromiaListTileRadioButton] and
/// [ChromiaListTileToggleButton]:
///
/// ```
/// [secondary?]  [title + subtitle (expanded)]  [control]
/// ```
///
/// Use it to build your own custom control tiles without duplicating the
/// layout and theming logic.
///
/// Example usage:
/// ```dart
/// ChromiaListTileShell(
///   onTap: () => setState(() => _value = !_value),
///   title: Text('My custom tile'),
///   subtitle: Text('With any trailing widget'),
///   control: MyCustomControl(value: _value),
/// )
/// ```
class ChromiaListTileShell extends StatelessWidget {
  /// Creates a [ChromiaListTileShell].
  const ChromiaListTileShell({
    required this.control,
    this.onTap,
    this.title,
    this.subtitle,
    this.secondary,
    this.contentPadding,
    super.key,
  });

  /// The control widget displayed at the trailing end (e.g. a checkbox).
  final Widget control;

  /// Called when the tile is tapped. Pass `null` to disable interaction.
  final VoidCallback? onTap;

  /// Primary content displayed in the center of the tile.
  ///
  /// Styled with [ChromiaTypography.bodyMedium] and [ChromiaColors.onSurface]
  /// unless the widget provides its own [DefaultTextStyle].
  final Widget? title;

  /// Secondary content displayed below [title].
  ///
  /// Styled with [ChromiaTypography.bodySmall] and
  /// [ChromiaColors.onSurfaceVariant] unless overridden.
  final Widget? subtitle;

  /// Optional widget displayed at the leading edge (before the text).
  final Widget? secondary;

  /// Padding around the tile content.
  ///
  /// Defaults to [ChromiaSpacing.paddingM].
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final radius = theme.radius;

    return InkWell(
      onTap: onTap,
      borderRadius: radius.radiusS,
      child: Padding(
        padding: contentPadding ?? spacing.paddingM,
        child: Row(
          children: [
            if (secondary != null) ...[
              secondary!,
              spacing.gapHM,
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    DefaultTextStyle(
                      style: theme.typography.bodyMedium.copyWith(
                        color: theme.colors.onSurface,
                      ),
                      child: title!,
                    ),
                  if (subtitle != null) ...[
                    spacing.gapVXS,
                    DefaultTextStyle(
                      style: theme.typography.bodySmall.copyWith(
                        color: theme.colors.onSurfaceVariant,
                      ),
                      child: subtitle!,
                    ),
                  ],
                ],
              ),
            ),
            spacing.gapHM,
            control,
          ],
        ),
      ),
    );
  }
}
