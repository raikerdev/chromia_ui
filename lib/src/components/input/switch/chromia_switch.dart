import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A switch component that follows the Chromia design system.
///
/// Unlike [ChromiaToggleButton] (which is a fully custom animated widget),
/// [ChromiaSwitch] wraps Flutter's [Switch] and inherits platform-native
/// behaviour and accessibility automatically.
///
/// When [label] is provided the entire row (switch + text) responds to taps
/// as a single unit via [ChromiaInlineLabel].
///
/// Example usage:
/// ```dart
/// ChromiaSwitch(
///   value: isEnabled,
///   onChanged: (value) => setState(() => isEnabled = value),
/// )
/// ```
///
/// With label:
/// ```dart
/// ChromiaSwitch(
///   value: isEnabled,
///   onChanged: (value) => setState(() => isEnabled = value),
///   label: 'Enable notifications',
/// )
/// ```
class ChromiaSwitch extends StatelessWidget {
  /// Creates a [ChromiaSwitch].
  ///
  /// Pass `null` to [onChanged] to disable interaction.
  const ChromiaSwitch({
    required this.value,
    required this.onChanged,
    this.label,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    super.key,
  });

  /// Whether the switch is on or off.
  final bool value;

  /// Called when the user toggles. Pass `null` to disable.
  final ValueChanged<bool>? onChanged;

  /// Optional label text. When set, the entire row responds to taps.
  final String? label;

  /// Track color when on. Defaults to [ChromiaColors.primary].
  final Color? activeTrackColor;

  /// Track color when off. Defaults to [ChromiaColors.outline].
  final Color? inactiveTrackColor;

  /// Thumb color. Defaults to [ChromiaColors.surface].
  final Color? thumbColor;

  void _handleTap() {
    onChanged?.call(!value);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final bool isEnabled = onChanged != null;

    final Color effectiveActiveTrackColor = activeTrackColor ?? colors.primary;
    final Color effectiveInactiveTrackColor =
        inactiveTrackColor ?? colors.outline;
    final Color effectiveThumbColor = thumbColor ?? colors.surface;

    // When a label is present ChromiaInlineLabel's InkWell handles taps, so
    // the Switch must not intercept them — wrap with IgnorePointer.
    Widget switchControl = Switch(
      value: value,
      onChanged: onChanged,
      activeThumbColor: effectiveThumbColor,
      activeTrackColor: effectiveActiveTrackColor,
      inactiveThumbColor: effectiveThumbColor,
      inactiveTrackColor: effectiveInactiveTrackColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    if (label != null) {
      switchControl = IgnorePointer(child: switchControl);
    }

    if (label == null) {
      return Semantics(
        toggled: value,
        enabled: isEnabled,
        child: switchControl,
      );
    }

    return Semantics(
      toggled: value,
      enabled: isEnabled,
      label: label,
      child: ChromiaInlineLabel(
        label: label!,
        control: switchControl,
        isEnabled: isEnabled,
        onTap: isEnabled ? _handleTap : null,
      ),
    );
  }
}
