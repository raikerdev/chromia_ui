import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A compact inline control + label row for input controls.
///
/// Used internally by [ChromiaCheckbox], [ChromiaRadioButton] and
/// [ChromiaToggleButton] when a [label] is provided. The entire row
/// (control + text) responds to taps as a single unit.
///
/// You can also use it directly to attach a tappable label to any custom
/// control while keeping the Chromia typography and disabled-state styling.
///
/// ```
/// [control]  [label text (flexible)]
/// ```
///
/// Example:
/// ```dart
/// ChromiaInlineLabel(
///   label: 'Accept terms',
///   isEnabled: true,
///   onTap: () => setState(() => checked = !checked),
///   control: MyCustomControl(checked: checked),
/// )
/// ```
class ChromiaInlineLabel extends StatelessWidget {
  /// Creates a [ChromiaInlineLabel].
  const ChromiaInlineLabel({
    required this.label,
    required this.control,
    required this.isEnabled,
    this.onTap,
    super.key,
  });

  /// Text displayed to the right of [control].
  final String label;

  /// The control widget (checkbox, radio, toggle, or any custom widget).
  final Widget control;

  /// Whether the control is interactive.
  ///
  /// `false` → label uses [ChromiaColors.textDisabled].
  /// `true`  → label uses [ChromiaColors.onSurface].
  final bool isEnabled;

  /// Called when the row is tapped. `null` = non-interactive.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final spacing = theme.spacing;
    final radius = theme.radius;

    return InkWell(
      onTap: onTap,
      borderRadius: radius.radiusS,
      child: Padding(
        padding: spacing.paddingXS,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            control,
            spacing.gapHM,
            Flexible(
              child: ChromiaText(
                label,
                type: ChromiaTypographyType.bodyMedium,
                color: isEnabled ? colors.onSurface : colors.textDisabled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
