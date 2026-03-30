import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable list tile component with Chromia styling.
///
/// [ChromiaListTile] is an enhanced version of Flutter's ListTile that
/// integrates with the Chromia design system.
///
/// ## Features
///
/// - **Theme Integration**: Automatic Chromia theme styling
/// - **Multiple Variants**: Standard, outlined, and card styles
/// - **Rich Content**: Support for leading, trailing, title, subtitle
/// - **Interactive**: Tap and long-press handlers
/// - **Customizable**: Colors, padding, and spacing options
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
/// ChromiaListTile(
///   title: Text('Standard'),
/// )
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
/// - [ChromiaCard] for card containers
/// - [ListTile] for the underlying Flutter widget
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
    this.dense,
    this.visualDensity,
    this.shape,
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

  /// Whether this list tile is selected.
  ///
  /// If true, the tile will use [selectedTileColor] or the theme's
  /// selected color.
  final bool selected;

  /// Whether this list tile is interactive.
  ///
  /// If false, the tile will be grayed out and [onTap] will not work.
  final bool enabled;

  /// The visual variant of the list tile.
  final ChromiaListTileVariant variant;

  /// The tile's internal padding.
  final EdgeInsetsGeometry? contentPadding;

  /// The tile's background color when not selected.
  final Color? tileColor;

  /// The tile's background color when selected.
  final Color? selectedTileColor;

  /// Whether this list tile is part of a vertically dense list.
  final bool? dense;

  /// Defines how compact the list tile's layout will be.
  final VisualDensity? visualDensity;

  /// The shape of the tile's [Material].
  final ShapeBorder? shape;

  /// The margin around the list tile.
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    Widget tile = ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      selected: selected,
      enabled: enabled,
      contentPadding: contentPadding ?? spacing.paddingM,
      tileColor: tileColor,
      selectedTileColor: selectedTileColor ?? colors.surface,
      dense: dense,
      visualDensity: visualDensity,
      shape:
          shape ??
          RoundedRectangleBorder(
            borderRadius: theme.radius.radiusM,
          ),
    );

    // Apply variant styling
    if (variant == ChromiaListTileVariant.outlined) {
      tile = Container(
        decoration: BoxDecoration(
          border: Border.all(color: colors.outline),
          borderRadius: theme.radius.radiusM,
          color: selected ? selectedTileColor ?? colors.surface : tileColor,
        ),
        child: tile,
      );
    } else if (variant == ChromiaListTileVariant.card) {
      tile = Container(
        decoration: BoxDecoration(
          color: selected ? selectedTileColor ?? colors.surface : tileColor ?? colors.surface,
          borderRadius: theme.radius.radiusM,
          boxShadow: theme.shadows.s,
        ),
        child: tile,
      );
    }

    // Apply margin if provided
    if (margin != null) {
      tile = Padding(
        padding: margin!,
        child: tile,
      );
    }

    return tile;
  }
}

/// Visual variants for [ChromiaListTile].
enum ChromiaListTileVariant {
  /// Standard list tile with no border or elevation.
  standard,

  /// List tile with a border outline.
  outlined,

  /// List tile with elevation and shadow (card style).
  card,
}
