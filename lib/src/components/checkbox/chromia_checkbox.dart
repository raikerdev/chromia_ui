import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:chromia_ui/src/tokens/animation_tokens.dart';
import 'package:flutter/material.dart';

/// A customizable checkbox component that follows the Chromia design system.
///
/// Example usage:
/// ```dart
/// ChromiaCheckbox(
///   value: isChecked,
///   onChanged: (value) {
///     setState(() => isChecked = value ?? false);
///   },
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
    super.key,
  });

  /// Whether the checkbox is checked
  final bool? value;

  /// Called when the value changes
  final ValueChanged<bool?>? onChanged;

  /// Optional label text
  final String? label;

  /// Whether the checkbox can be in an indeterminate state
  final bool tristate;

  /// The color when checked
  final Color? activeColor;

  /// The color of the check mark
  final Color? checkColor;

  /// The size of the checkbox
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final radius = theme.radius;

    final bool isEnabled = onChanged != null;
    final Color effectiveActiveColor = activeColor ?? colors.primary;
    final Color effectiveCheckColor = checkColor ?? colors.onPrimary;

    if (label != null) {
      return InkWell(
        onTap: isEnabled
            ? () {
                if (tristate) {
                  // Cycle through: false -> true -> null -> false
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
              }
            : null,
        borderRadius: radius.radiusS,
        child: Padding(
          padding: spacing.paddingXS,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCheckbox(
                context,
                isEnabled,
                effectiveActiveColor,
                effectiveCheckColor,
              ),
              spacing.gapHM,
              Flexible(
                child: Text(
                  label!,
                  style: theme.typography.bodyMedium.copyWith(
                    color: isEnabled ? colors.textPrimary : colors.textDisabled,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return _buildCheckbox(
      context,
      isEnabled,
      effectiveActiveColor,
      effectiveCheckColor,
    );
  }

  Widget _buildCheckbox(
    BuildContext context,
    bool isEnabled,
    Color activeColor,
    Color checkColor,
  ) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final radius = theme.radius;

    return GestureDetector(
      onTap: isEnabled && label == null
          ? () {
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
            }
          : null,
      child: AnimatedContainer(
        duration: AnimationTokens.fast,
        curve: AnimationTokens.easeOut,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: value == true ? (isEnabled ? activeColor : colors.border) : colors.transparent,
          border: Border.all(
            color: value == true ? (isEnabled ? activeColor : colors.border) : (isEnabled ? colors.border : colors.border),
            width: 2,
          ),
          borderRadius: radius.circular(4),
        ),
        child: value == true
            ? Icon(
                Icons.check,
                size: size * 0.7,
                color: checkColor,
              )
            : value == null
            ? Icon(
                Icons.remove,
                size: size * 0.7,
                color: isEnabled ? activeColor : colors.border,
              )
            : null,
      ),
    );
  }
}

/// A checkbox with a tile layout similar to CheckboxListTile.
class ChromiaCheckboxTile extends StatelessWidget {
  const ChromiaCheckboxTile({
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.secondary,
    this.tristate = false,
    this.activeColor,
    this.checkColor,
    this.contentPadding,
    super.key,
  });

  /// Whether the checkbox is checked
  final bool? value;

  /// Called when the value changes
  final ValueChanged<bool?>? onChanged;

  /// The primary content
  final Widget? title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display before the checkbox
  final Widget? secondary;

  /// Whether the checkbox can be in an indeterminate state
  final bool tristate;

  /// The color when checked
  final Color? activeColor;

  /// The color of the check mark
  final Color? checkColor;

  /// Padding around the tile
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final radius = theme.radius;

    return InkWell(
      onTap: onChanged != null
          ? () {
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
            }
          : null,
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
            ChromiaCheckbox(
              value: value,
              onChanged: null,
              // Handled by tile tap
              tristate: tristate,
              activeColor: activeColor,
              checkColor: checkColor,
            ),
          ],
        ),
      ),
    );
  }
}
