import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// The internal layout engine for the entire list-tile family.
///
/// [ChromiaListTileShell] renders the canonical tile row:
///
/// ```
/// [leading?]  [title + subtitle (expanded)]  [control?]
/// ```
///
/// All members of the Chromia list-tile family are built on top of this shell:
/// - [ChromiaListTile] — general-purpose row (no control)
/// - [ChromiaListTileCheckbox] — trailing checkbox
/// - [ChromiaListTileRadioButton] — trailing radio button
/// - [ChromiaListTileToggleButton] — trailing toggle button
///
/// Every tile shares the same [ChromiaListTileVariant] options (standard,
/// outlined, card), the same [selected]/[enabled] semantics, and the same
/// padding defaults so the whole family looks cohesive.
///
/// You can also use it directly to attach any custom control to a tile row
/// without duplicating layout and theming logic.
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
    this.control,
    this.onTap,
    this.onLongPress,
    this.title,
    this.subtitle,
    this.leading,
    this.contentPadding,
    this.variant = ChromiaListTileVariant.standard,
    this.selected = false,
    this.enabled = true,
    this.tileColor,
    this.selectedTileColor,
    this.margin,
    super.key,
  });

  /// Optional control widget at the trailing end (e.g. a checkbox).
  ///
  /// When `null` the row ends after the title/subtitle column — equivalent
  /// to a plain [ChromiaListTile].
  final Widget? control;

  /// Called when the tile is tapped. Pass `null` to disable interaction.
  final VoidCallback? onTap;

  /// Called when the tile is long-pressed.
  final VoidCallback? onLongPress;

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
  final Widget? leading;

  /// Padding around the tile content.
  ///
  /// Defaults to [ChromiaSpacing.paddingM].
  final EdgeInsetsGeometry? contentPadding;

  /// The visual variant of the tile.
  ///
  /// - `standard` — no decoration (default)
  /// - `outlined` — 1 px border
  /// - `card` — elevated surface
  final ChromiaListTileVariant variant;

  /// Whether this tile is in a selected state.
  ///
  /// When `true` the tile background switches to [selectedTileColor]
  /// (or [ChromiaColors.surface] by default) and the outlined border uses
  /// [ChromiaColors.primary].
  final bool selected;

  /// Whether this tile can be interacted with.
  ///
  /// When `false`, [onTap] and [onLongPress] are suppressed and the tile
  /// content is rendered at reduced opacity.
  final bool enabled;

  /// Background color when not selected.
  final Color? tileColor;

  /// Background color when [selected] is `true`.
  ///
  /// Defaults to [ChromiaColors.surface].
  final Color? selectedTileColor;

  /// Optional margin applied around the entire tile.
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final radius = theme.radius;

    // Effective background: selected state overrides tileColor.
    final Color? background = selected
        ? (selectedTileColor ?? colors.surface)
        : tileColor;

    Widget content = InkWell(
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      borderRadius: radius.radiusM,
      child: Padding(
        padding: contentPadding ?? spacing.paddingM,
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
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
                        color: enabled
                            ? colors.onSurface
                            : colors.textDisabled,
                      ),
                      child: title!,
                    ),
                  if (subtitle != null) ...[
                    spacing.gapVXS,
                    DefaultTextStyle(
                      style: theme.typography.bodySmall.copyWith(
                        color: enabled
                            ? colors.onSurfaceVariant
                            : colors.textDisabled,
                      ),
                      child: subtitle!,
                    ),
                  ],
                ],
              ),
            ),
            if (control != null) ...[
              spacing.gapHM,
              control!,
            ],
          ],
        ),
      ),
    );

    // Apply variant decoration — consistent across the entire tile family.
    if (variant == ChromiaListTileVariant.outlined) {
      content = Container(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            color: selected ? colors.primary : colors.outline,
          ),
          borderRadius: radius.radiusM,
        ),
        child: content,
      );
    } else if (variant == ChromiaListTileVariant.card) {
      content = Container(
        decoration: BoxDecoration(
          color: background ?? colors.surface,
          borderRadius: radius.radiusM,
          boxShadow: theme.shadows.s,
        ),
        child: content,
      );
    } else if (background != null) {
      // Standard variant with explicit background (selected or tileColor).
      content = Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: radius.radiusM,
        ),
        child: content,
      );
    }

    // Optional disabled opacity.
    if (!enabled) {
      content = Opacity(opacity: kDisabledOpacity, child: content);
    }

    // Optional margin.
    if (margin != null) {
      content = Padding(padding: margin!, child: content);
    }

    return content;
  }
}
