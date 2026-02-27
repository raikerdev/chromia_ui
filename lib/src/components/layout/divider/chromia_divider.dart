import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:flutter/material.dart';

/// A customizable divider component for visual separation.
///
/// Example usage:
/// ```dart
/// ChromiaDivider()
///
/// ChromiaDivider.vertical(height: 24)
///
/// ChromiaDivider.withText(text: 'OR')
/// ```
class ChromiaDivider extends StatelessWidget {
  const ChromiaDivider({
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    super.key,
  }) : isVertical = false;

  const ChromiaDivider.vertical({
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    super.key,
  }) : isVertical = true;

  /// Height for horizontal divider or width for vertical divider
  final double? height;

  /// Thickness of the divider line
  final double? thickness;

  /// Space before the divider
  final double? indent;

  /// Space after the divider
  final double? endIndent;

  /// Color of the divider
  final Color? color;

  /// Whether this is a vertical divider
  final bool isVertical;

  /// Creates a divider with text in the middle
  factory ChromiaDivider.withText({
    required String text,
    double? thickness,
    Color? color,
    Color? textColor,
    TextStyle? textStyle,
  }) {
    return _ChromiaDividerWithText(
      text: text,
      thickness: thickness,
      color: color,
      textColor: textColor,
      textStyle: textStyle,
    );
  }

  /// Creates a divider with an icon in the middle
  factory ChromiaDivider.withIcon({
    required IconData icon,
    double? thickness,
    Color? color,
    Color? iconColor,
    double? iconSize,
  }) {
    return _ChromiaDividerWithIcon(
      icon: icon,
      thickness: thickness,
      color: color,
      iconColor: iconColor,
      iconSize: iconSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    final Color effectiveColor = color ?? colors.divider;

    if (isVertical) {
      return VerticalDivider(
        width: height,
        thickness: thickness ?? 1,
        indent: indent,
        endIndent: endIndent,
        color: effectiveColor,
      );
    }

    return Divider(
      height: height,
      thickness: thickness ?? 1,
      indent: indent,
      endIndent: endIndent,
      color: effectiveColor,
    );
  }
}

/// A divider with text in the middle
class _ChromiaDividerWithText extends ChromiaDivider {
  const _ChromiaDividerWithText({
    required this.text,
    super.thickness,
    super.color,
    this.textColor,
    this.textStyle,
  }) : super();

  final String text;
  final Color? textColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveColor = color ?? colors.divider;
    final Color effectiveTextColor = textColor ?? colors.textTertiary;

    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: thickness ?? 1,
            color: effectiveColor,
          ),
        ),
        Padding(
          padding: spacing.horizontalM,
          child: Text(
            text,
            style:
                textStyle ??
                theme.typography.labelSmall.copyWith(
                  color: effectiveTextColor,
                ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: thickness ?? 1,
            color: effectiveColor,
          ),
        ),
      ],
    );
  }
}

/// A divider with an icon in the middle
class _ChromiaDividerWithIcon extends ChromiaDivider {
  const _ChromiaDividerWithIcon({
    required this.icon,
    super.thickness,
    super.color,
    this.iconColor,
    this.iconSize,
  });

  final IconData icon;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveColor = color ?? colors.divider;
    final Color effectiveIconColor = iconColor ?? colors.textTertiary;

    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: thickness ?? 1,
            color: effectiveColor,
          ),
        ),
        Padding(
          padding: spacing.horizontalM,
          child: Icon(
            icon,
            size: iconSize ?? 16,
            color: effectiveIconColor,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: thickness ?? 1,
            color: effectiveColor,
          ),
        ),
      ],
    );
  }
}

/// A section divider with optional title
class ChromiaSectionDivider extends StatelessWidget {
  const ChromiaSectionDivider({
    this.title,
    this.trailing,
    this.padding,
    super.key,
  });

  /// Section title
  final String? title;

  /// Trailing widget (e.g., action button)
  final Widget? trailing;

  /// Padding around the section
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    if (title == null && trailing == null) {
      return const ChromiaDivider();
    }

    return Padding(
      padding: padding ?? spacing.verticalM,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null || trailing != null)
            Padding(
              padding: spacing.horizontalL,
              child: Row(
                children: [
                  if (title != null)
                    Expanded(
                      child: Text(
                        title!,
                        style: theme.typography.labelMedium.copyWith(
                          color: colors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ?trailing,
                ],
              ),
            ),
          if (title != null || trailing != null) spacing.gapVS,
          const ChromiaDivider(),
        ],
      ),
    );
  }
}
