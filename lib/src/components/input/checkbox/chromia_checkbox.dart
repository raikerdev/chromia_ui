import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable checkbox component that follows the Chromia design system.
///
/// When [label] is provided the entire row (checkbox + text) responds to taps
/// as a single unit via [ChromiaInlineLabel].
///
/// Example usage:
/// ```dart
/// ChromiaCheckbox(
///   value: isChecked,
///   onChanged: (value) => setState(() => isChecked = value ?? false),
/// )
/// ```
///
/// With label:
/// ```dart
/// ChromiaCheckbox(
///   value: isChecked,
///   onChanged: (value) => setState(() => isChecked = value ?? false),
///   label: 'Accept terms and conditions',
/// )
/// ```
class ChromiaCheckbox extends StatelessWidget {
  const ChromiaCheckbox({
    required this.value,
    required this.onChanged,
    this.label,
    this.tristate = false,
    this.activeColor,
    this.checkColor,
    this.size = 20.0,
    this.checkIcon = Icons.check,
    this.tristateIcon = Icons.remove,
    super.key,
  });

  /// Whether the checkbox is checked
  final bool? value;

  /// Called when the value changes. Pass `null` to disable.
  final ValueChanged<bool?>? onChanged;

  /// Optional label text. When set, the entire row responds to taps.
  final String? label;

  /// Whether the checkbox can be in an indeterminate state
  final bool tristate;

  /// The color when checked. Defaults to [ChromiaColors.primary].
  final Color? activeColor;

  /// The color of the check mark. Defaults to [ChromiaColors.onPrimary].
  final Color? checkColor;

  /// The size of the checkbox box
  final double size;

  /// The icon to display when checked
  final IconData checkIcon;

  /// The icon to display in indeterminate state
  final IconData tristateIcon;

  // ── Tap logic ──────────────────────────────────────────────────────────────

  VoidCallback? _buildOnTap(bool isEnabled) {
    if (!isEnabled) {
      return null;
    }
    return () {
      if (tristate) {
        if (value == false) {
          onChanged!(true);
        } else if (value == true) {
          onChanged!(null);
        } else {
          onChanged!(false);
        }
      } else {
        onChanged!(!(value ?? false));
      }
    };
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final bool isEnabled = onChanged != null;
    final Color effectiveActiveColor = activeColor ?? colors.primary;
    final Color effectiveCheckColor = checkColor ?? colors.onPrimary;

    // When wrapped in ChromiaInlineLabel the InkWell above handles the tap,
    // so the bare control must not register a second tap handler.
    final control = _buildCheckbox(
      context,
      isEnabled: isEnabled,
      activeColor: effectiveActiveColor,
      checkColor: effectiveCheckColor,
      onTap: label == null ? _buildOnTap(isEnabled) : null,
    );

    if (label == null) {
      return control;
    }

    return ChromiaInlineLabel(
      label: label!,
      control: control,
      isEnabled: isEnabled,
      onTap: _buildOnTap(isEnabled),
    );
  }

  // ── Visual ─────────────────────────────────────────────────────────────────

  Widget _buildCheckbox(
    BuildContext context, {
    required bool isEnabled,
    required Color activeColor,
    required Color checkColor,
    VoidCallback? onTap,
  }) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final radius = theme.radius;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: AnimationTokens.fast,
          curve: AnimationTokens.easeOut,
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: value == true
                ? (isEnabled ? activeColor : colors.surfaceContainer)
                : colors.transparent,
            border: Border.all(
              color: value == true
                  ? (isEnabled ? activeColor : colors.surfaceContainer)
                  : (isEnabled ? colors.outline : colors.surfaceContainer),
              width: 2,
            ),
            borderRadius: radius.circular(4),
          ),
          child: value == true
              ? Icon(checkIcon, size: size * 0.7, color: checkColor)
              : value == null
              ? Icon(
                  tristateIcon,
                  size: size * 0.7,
                  color: isEnabled ? activeColor : colors.outline,
                )
              : null,
        ),
      ),
    );
  }
}
