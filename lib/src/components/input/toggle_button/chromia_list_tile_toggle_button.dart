import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A switch with a tile layout similar to SwitchListTile.
///
/// The [ChromiaListTileToggleButton] is a widget that displays a toggle button
/// with a tile layout.
///
/// Example usage:
/// ```dart
/// ChromiaListTileToggleButton(
///   value: isOn,
///   onChanged: (value) => setState(() => isOn = value),
///   title: Text('Toggle Button'),
///   subtitle: Text('This is a toggle button'),
///   activeColor: Colors.green,
/// )
/// ```
class ChromiaListTileToggleButton extends StatelessWidget {
  const ChromiaListTileToggleButton({
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.secondary,
    this.activeColor,
    this.inactiveColor,
    this.contentPadding,
    this.size = ChromiaToggleButtonSize.medium,
    super.key,
  });

  /// Whether the switch is on or off
  final bool value;

  /// Called when the user toggles the switch
  final ValueChanged<bool>? onChanged;

  /// The primary content
  final Widget? title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display before the switch
  final Widget? secondary;

  /// Color when the switch is on
  final Color? activeColor;

  /// Color when the switch is off
  final Color? inactiveColor;

  /// Padding around the tile
  final EdgeInsetsGeometry? contentPadding;

  /// Size of the switch
  final ChromiaToggleButtonSize size;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final radius = theme.radius;

    return InkWell(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
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
                        color: theme.colors.textPrimary,
                      ),
                      child: title!,
                    ),
                  if (subtitle != null) ...[
                    spacing.gapVXS,
                    DefaultTextStyle(
                      style: theme.typography.bodySmall.copyWith(
                        color: theme.colors.textSecondary,
                      ),
                      child: subtitle!,
                    ),
                  ],
                ],
              ),
            ),
            spacing.gapHM,
            ChromiaToggleButton(
              value: value,
              onChanged: onChanged,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
