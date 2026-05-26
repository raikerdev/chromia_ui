import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A toggle button with a tile layout.
///
/// Displays a [ChromiaToggleButton] at the trailing end with optional
/// [title], [subtitle] and [secondary] widgets.
///
/// Example usage:
/// ```dart
/// ChromiaListTileToggleButton(
///   value: isOn,
///   onChanged: (value) => setState(() => isOn = value),
///   title: Text('Enable notifications'),
///   subtitle: Text('Receive alerts when something happens'),
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

  /// Whether the toggle is on or off
  final bool value;

  /// Called when the user toggles. Pass `null` to disable.
  final ValueChanged<bool>? onChanged;

  /// The primary content
  final Widget? title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display at the leading edge
  final Widget? secondary;

  /// Color when on. Defaults to [ChromiaColors.primary].
  final Color? activeColor;

  /// Color when off. Defaults to [ChromiaColors.outline].
  final Color? inactiveColor;

  /// Padding around the tile. Defaults to [ChromiaSpacing.paddingM].
  final EdgeInsetsGeometry? contentPadding;

  /// Size of the toggle. Defaults to [ChromiaToggleButtonSize.medium].
  final ChromiaToggleButtonSize size;

  @override
  Widget build(BuildContext context) {
    return ChromiaListTileShell(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      title: title,
      subtitle: subtitle,
      secondary: secondary,
      contentPadding: contentPadding,
      control: ChromiaToggleButton(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        size: size,
      ),
    );
  }
}
