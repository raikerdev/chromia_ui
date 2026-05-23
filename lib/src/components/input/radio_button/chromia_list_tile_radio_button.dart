import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A radio button with a tile layout.
///
/// Displays a [ChromiaRadioButton] at the trailing end with optional
/// [title], [subtitle] and [secondary] widgets.
///
/// Example usage:
/// ```dart
/// ChromiaListTileRadioButton<String>(
///   value: 'option1',
///   groupValue: selectedOption,
///   onChanged: (value) => setState(() => selectedOption = value),
///   title: Text('Option 1'),
///   subtitle: Text('Description for Option 1'),
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

  /// Called when the user selects this option. Pass `null` to disable.
  final ValueChanged<T?>? onChanged;

  /// The primary content
  final Widget? title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display at the leading edge
  final Widget? secondary;

  /// The color when selected. Defaults to [ChromiaColors.primary].
  final Color? activeColor;

  /// Padding around the tile. Defaults to [ChromiaSpacing.paddingM].
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return ChromiaListTileShell(
      onTap: onChanged != null ? () => onChanged!(value) : null,
      title: title,
      subtitle: subtitle,
      secondary: secondary,
      contentPadding: contentPadding,
      control: ChromiaRadioButton<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: activeColor,
      ),
    );
  }
}
