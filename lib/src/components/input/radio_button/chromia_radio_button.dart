import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable radio button component that follows the Chromia design system.
///
/// The [ChromiaRadioButton] widget allow users to select
/// a single option from a set of options.
///
/// Example usage:
/// ```dart
/// String selectedValue = 'option1';
///
/// ChromiaRadio<String>(
///   value: 'option1',
///   groupValue: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value!),
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
  }) : assert(thumbScale <= 1.0 && thumbScale >= 0.0, 'thumbScale must be between 0.0 and 1.0');

  /// The value represented by this radio button
  final T value;

  /// The currently selected value for the group
  final T? groupValue;

  /// Called when the user selects this radio button
  final ValueChanged<T?>? onChanged;

  /// Optional label text
  final String? label;

  /// The color when selected
  final Color? activeColor;

  /// The size of the radio button
  final double size;

  /// The scale of the thumb when selected
  final double thumbScale;

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final bool isEnabled = onChanged != null;
    final Color effectiveActiveColor = activeColor ?? colors.primary;

    if (label != null) {
      return InkWell(
        onTap: isEnabled ? () => onChanged!(value) : null,
        borderRadius: theme.radius.radiusS,
        child: Padding(
          padding: spacing.paddingXS,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRadio(
                context,
                isEnabled,
                effectiveActiveColor,
              ),
              spacing.gapHM,
              Flexible(
                child: ChromiaText(
                  label!,
                  type: ChromiaTypographyType.bodyMedium,
                  color: isEnabled ? colors.textPrimary : colors.textDisabled,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return _buildRadio(
      context,
      isEnabled,
      effectiveActiveColor,
    );
  }

  Widget _buildRadio(
    BuildContext context,
    bool isEnabled,
    Color activeColor,
  ) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isEnabled && label == null ? () => onChanged!(value) : null,
        child: AnimatedContainer(
          duration: AnimationTokens.fast,
          curve: AnimationTokens.easeOut,
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isSelected ? (isEnabled ? activeColor : colors.surfaceContainer) : colors.transparent,
            border: Border.all(
              color: _isSelected
                  ? (isEnabled ? activeColor : colors.surfaceContainer)
                  : (isEnabled ? colors.border : colors.surfaceContainer),
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
