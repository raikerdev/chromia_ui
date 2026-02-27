import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A radio button with a tile layout similar to RadioListTile.
///
/// The [ChromiaListTileRadioButton] is a widget that displays a radio button
/// with a tile layout.
///
/// Example usage:
/// String selectedValue = 'option1';
///
/// ```dart
/// ChromiaListTileRadioButton<String>(
///   value: 'option1',
///   groupValue: selectedOption,
///   onChanged: (value) => setState(() => selectedOption = value),
///   title: Text('Option 1'),
///   subtitle: Text('Description for Option 1'),
///   secondary: Icon(Icons.radio_button_checked),
///   activeColor: Colors.blue,
/// )
/// ```
class ChromiaListTileRadioButton<T> extends StatelessWidget {
  const ChromiaListTileRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.secondary,
    this.activeColor,
    this.contentPadding,
    super.key,
  });

  /// The value represented by this radio button
  final T value;

  /// The currently selected value for the group
  final T? groupValue;

  /// Called when the user selects this radio button
  final ValueChanged<T?>? onChanged;

  /// The primary content
  final Widget? title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display before the radio button
  final Widget? secondary;

  /// The color when selected
  final Color? activeColor;

  /// Padding around the tile
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final radius = theme.radius;

    return InkWell(
      onTap: onChanged != null ? () => onChanged!(value) : null,
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
            ChromiaRadioButton<T>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: activeColor,
            ),
          ],
        ),
      ),
    );
  }
}
