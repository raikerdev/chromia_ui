import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

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
              initialValue: value,
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
