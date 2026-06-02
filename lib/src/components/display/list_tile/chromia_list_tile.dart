import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable list tile built on the shared [ChromiaListTileShell] layout.
///
/// [ChromiaListTile] is a general-purpose row component that integrates with
/// the Chromia design system. It forms the foundation of the entire list-tile
/// family — all control tiles (Checkbox, Radio, Toggle, Switch) and slider
/// tiles use the same [ChromiaListTileShell] layout engine.
///
/// ## Features
///
/// - **Consistent layout**: same row engine as every control tile
/// - **Three variants**: standard, outlined, and card
/// - **Selected state**: highlighted background and primary border
/// - **Enabled / disabled**: suppresses interaction + reduced opacity
/// - **Rich content**: leading icon, title, subtitle, trailing widget
///
/// ## Basic Usage
///
/// ```dart
/// ChromiaListTile(
///   leading: Icon(Icons.person),
///   title: Text('John Doe'),
///   subtitle: Text('john@example.com'),
///   trailing: Icon(Icons.chevron_right),
///   onTap: () {},
/// )
/// ```
///
/// ## Variants
///
/// ```dart
/// // Standard (default)
/// ChromiaListTile(title: Text('Standard'))
///
/// // Outlined
/// ChromiaListTile(
///   variant: ChromiaListTileVariant.outlined,
///   title: Text('Outlined'),
/// )
///
/// // Card (elevated)
/// ChromiaListTile(
///   variant: ChromiaListTileVariant.card,
///   title: Text('Card'),
/// )
/// ```
///
/// See also:
/// - [ChromiaListTileShell] — the shared layout engine
/// - [ChromiaListTileCheckbox], [ChromiaListTileRadioButton],
///   [ChromiaListTileToggleButton] — control tiles
/// - [ChromiaListTileSlider], [ChromiaListTileRangeSlider] — slider tiles
class ChromiaListTile extends StatelessWidget {
  /// Creates a Chromia-styled list tile.
  ///
  /// The [title] parameter is required.
  const ChromiaListTile({
    required this.title,
    super.key,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.enabled = true,
    this.variant = ChromiaListTileVariant.standard,
    this.contentPadding,
    this.tileColor,
    this.selectedTileColor,
    this.margin,
  });

  /// The primary content of the list tile.
  final Widget title;

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar].
  final Widget? leading;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] or [Text].
  final Widget? trailing;

  /// Called when the user taps this list tile.
  final VoidCallback? onTap;

  /// Called when the user long-presses on this list tile.
  final VoidCallback? onLongPress;

  /// Whether this list tile is in a selected state.
  ///
  /// When `true`, the tile uses [selectedTileColor] as its background and the
  /// outlined border switches to [ChromiaColors.primary].
  final bool selected;

  /// Whether this list tile is interactive.
  ///
  /// When `false`, [onTap] and [onLongPress] are suppressed and the tile is
  /// rendered at reduced opacity.
  final bool enabled;

  /// The visual variant of the list tile.
  final ChromiaListTileVariant variant;

  /// The tile's internal padding.
  ///
  /// Defaults to [ChromiaSpacing.paddingM].
  final EdgeInsetsGeometry? contentPadding;

  /// The tile's background color when not selected.
  final Color? tileColor;

  /// The tile's background color when [selected] is `true`.
  ///
  /// Defaults to [ChromiaColors.surface].
  final Color? selectedTileColor;

  /// The margin around the list tile.
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return ChromiaListTileShell(
      leading: leading,
      title: title,
      subtitle: subtitle,
      control: trailing,
      onTap: onTap,
      onLongPress: onLongPress,
      selected: selected,
      enabled: enabled,
      contentPadding: contentPadding,
      tileColor: tileColor,
      selectedTileColor: selectedTileColor,
      variant: variant,
      margin: margin,
    );
  }
}

/// Visual variants for [ChromiaListTile] and all control tiles.
enum ChromiaListTileVariant {
  /// Standard tile with no border or elevation.
  standard,

  /// Tile with a 1 px border outline.
  outlined,

  /// Tile with elevation and shadow (card style).
  card,
}
