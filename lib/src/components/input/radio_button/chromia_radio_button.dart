import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable radio button component that follows the Chromia design system.
///
/// When [label] is provided the entire row (radio + text) responds to taps
/// as a single unit via [ChromiaInlineLabel].
///
/// Example usage:
/// ```dart
/// ChromiaRadioButton<String>(
///   value: 'option1',
///   groupValue: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value!),
/// )
/// ```
///
/// With label:
/// ```dart
/// ChromiaRadioButton<String>(
///   value: 'option1',
///   groupValue: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value!),
///   label: 'Option 1',
/// )
/// ```
class ChromiaRadioButton<T> extends StatelessWidget {
  const ChromiaRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.activeColor,
    this.size = 20.0,
    this.thumbScale = 0.4,
    super.key,
  }) : assert(
         thumbScale <= 1.0 && thumbScale >= 0.0,
         'thumbScale must be between 0.0 and 1.0',
       );

  /// The value represented by this radio button
  final T value;

  /// The currently selected value for the group
  final T? groupValue;

  /// Called when the user selects this radio button. Pass `null` to disable.
  final ValueChanged<T?>? onChanged;

  /// Optional label text. When set, the entire row responds to taps.
  final String? label;

  /// The color when selected. Defaults to [ChromiaColors.primary].
  final Color? activeColor;

  /// The size of the radio circle
  final double size;

  /// The scale of the inner thumb when selected (0.0–1.0)
  final double thumbScale;

  bool get _isSelected => value == groupValue;

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final bool isEnabled = onChanged != null;
    final Color effectiveActiveColor = activeColor ?? colors.primary;
    final VoidCallback? onTap = isEnabled ? () => onChanged!(value) : null;

    // Only self-handle tap when not wrapped in ChromiaInlineLabel.
    final control = _buildRadio(
      context,
      isEnabled: isEnabled,
      activeColor: effectiveActiveColor,
      onTap: label == null ? onTap : null,
    );

    if (label == null) {
      return control;
    }

    return ChromiaInlineLabel(
      label: label!,
      control: control,
      isEnabled: isEnabled,
      onTap: onTap,
    );
  }

  // ── Visual ─────────────────────────────────────────────────────────────────

  Widget _buildRadio(
    BuildContext context, {
    required bool isEnabled,
    required Color activeColor,
    VoidCallback? onTap,
  }) {
    final colors = context.chromiaColors;

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
            shape: BoxShape.circle,
            color: _isSelected
                ? (isEnabled ? activeColor : colors.surfaceContainer)
                : colors.transparent,
            border: Border.all(
              color: _isSelected
                  ? (isEnabled ? activeColor : colors.surfaceContainer)
                  : (isEnabled ? colors.outline : colors.surfaceContainer),
              width: 2,
            ),
          ),
          child: _isSelected
              ? Center(
                  child: Container(
                    width: size * thumbScale,
                    height: size * thumbScale,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isEnabled ? colors.onPrimary : colors.surface,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
