import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A specialized card for displaying list items.
///
/// The [ChromiaListTileCard] is a widget that
/// provides a card-like design for displaying list items.
///
/// Example usage:
/// ```dart
/// ChromiaListTileCard(
///   title: Text('Title'),
///   subtitle: Text('Subtitle'),
///   leading: Icon(Icons.star),
///   trailing: Icon(Icons.arrow_forward),
///   onTap: () {
///     // Handle card tap
///   },
/// )
/// ```
class ChromiaListTileCard extends StatelessWidget {
  const ChromiaListTileCard({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.elevation = 1,
    super.key,
  });

  /// The primary content
  final Widget title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display before the title
  final Widget? leading;

  /// A widget to display after the title
  final Widget? trailing;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Padding around the content
  final EdgeInsetsGeometry? padding;

  /// Elevation of the card
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return ChromiaCard(
      onTap: onTap,
      elevation: elevation,
      padding: padding ?? spacing.paddingM,
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
                DefaultTextStyle(
                  style: theme.typography.bodyMedium.copyWith(
                    color: theme.colors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  child: title,
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
          if (trailing != null) ...[
            spacing.gapHM,
            trailing!,
          ],
        ],
      ),
    );
  }
}
