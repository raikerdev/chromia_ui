import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A switch with a tile layout.
///
/// Displays a [ChromiaSwitch] at the trailing end with optional
/// [title], [subtitle] and [secondary] widgets.
///
/// Example usage:
/// ```dart
/// ChromiaListTileSwitch(
///   value: isOn,
///   onChanged: (value) => setState(() => isOn = value),
///   title: Text('Enable notifications'),
///   subtitle: Text('Receive alerts when something happens'),
/// )
/// ```
class ChromiaListTileSwitch extends StatelessWidget {
  const ChromiaListTileSwitch({
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.secondary,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.contentPadding,
    super.key,
  });

  /// Whether the switch is on or off.
  final bool value;

  /// Called when the user toggles. Pass `null` to disable.
  final ValueChanged<bool>? onChanged;

  /// The primary content.
  final Widget? title;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// A widget to display at the leading edge.
  final Widget? secondary;

  /// Track color when on. Defaults to [ChromiaColors.primary].
  final Color? activeTrackColor;

  /// Track color when off. Defaults to [ChromiaColors.outline].
  final Color? inactiveTrackColor;

  /// Thumb color. Defaults to [ChromiaColors.surface].
  final Color? thumbColor;

  /// Padding around the tile. Defaults to [ChromiaSpacing.paddingM].
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return ChromiaListTileShell(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      title: title,
      subtitle: subtitle,
      secondary: secondary,
      contentPadding: contentPadding,
      control: ChromiaSwitch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: activeTrackColor,
        inactiveTrackColor: inactiveTrackColor,
        thumbColor: thumbColor,
      ),
    );
  }
}
