import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:flutter/material.dart';

/// A customizable chip component for displaying compact information.
///
/// Example usage:
/// ```dart
/// ChromiaChip(
///   label: 'Flutter',
///   onDeleted: () => removeTag('Flutter'),
/// )
///
/// ChromiaChip.filter(
///   label: 'Active',
///   selected: true,
///   onSelected: (selected) => setState(() => isActive = selected),
/// )
/// ```
class ChromiaChip extends StatelessWidget {
  const ChromiaChip({
    required this.label,
    this.avatar,
    this.icon,
    this.onPressed,
    this.onDeleted,
    this.backgroundColor,
    this.foregroundColor,
    this.deleteIconColor,
    this.padding,
    super.key,
  });

  /// Label text
  final String label;

  /// Avatar widget (shown at the start)
  final Widget? avatar;

  /// Icon (shown at the start if no avatar)
  final IconData? icon;

  /// Callback when the chip is pressed
  final VoidCallback? onPressed;

  /// Callback when the delete icon is pressed
  final VoidCallback? onDeleted;

  /// Background color
  final Color? backgroundColor;

  /// Foreground color (text and icons)
  final Color? foregroundColor;

  /// Delete icon color
  final Color? deleteIconColor;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  /// Creates a filter chip that can be selected
  factory ChromiaChip.filter({
    required String label,
    required bool selected,
    required ValueChanged<bool> onSelected,
    Widget? avatar,
    IconData? icon,
    IconData? selectedIcon,
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    Color? foregroundColor,
    Color? selectedForegroundColor,
  }) {
    return _ChromiaFilterChip(
      label: label,
      selected: selected,
      onSelected: onSelected,
      avatar: avatar,
      icon: icon,
      selectedIcon: selectedIcon,
      backgroundColor: backgroundColor,
      selectedBackgroundColor: selectedBackgroundColor,
      foregroundColor: foregroundColor,
      selectedForegroundColor: selectedForegroundColor,
    );
  }

  /// Creates a choice chip (radio button style)
  factory ChromiaChip.choice({
    required String label,
    required bool selected,
    required VoidCallback onSelected,
    Widget? avatar,
    IconData? icon,
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    Color? foregroundColor,
    Color? selectedForegroundColor,
  }) {
    return _ChromiaChoiceChip(
      label: label,
      selected: selected,
      onSelected: onSelected,
      avatar: avatar,
      icon: icon,
      backgroundColor: backgroundColor,
      selectedBackgroundColor: selectedBackgroundColor,
      foregroundColor: foregroundColor,
      selectedForegroundColor: selectedForegroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.surfaceContainerHigh;
    final Color effectiveForegroundColor = foregroundColor ?? colors.textPrimary;
    final Color effectiveDeleteIconColor = deleteIconColor ?? colors.textSecondary;

    final bool isInteractive = onPressed != null;

    Widget chip = Container(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: spacing.m,
            vertical: spacing.xs,
          ),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: theme.radius.radiusL,
        border: Border.all(
          color: colors.border,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (avatar != null) ...[
            avatar!,
            spacing.gapHXS,
          ] else if (icon != null) ...[
            Icon(
              icon,
              size: 16,
              color: effectiveForegroundColor,
            ),
            spacing.gapHXS,
          ],
          Text(
            label,
            style: theme.typography.labelMedium.copyWith(
              color: effectiveForegroundColor,
            ),
          ),
          if (onDeleted != null) ...[
            spacing.gapHXS,
            GestureDetector(
              onTap: onDeleted,
              child: Icon(
                Icons.close,
                size: 16,
                color: effectiveDeleteIconColor,
              ),
            ),
          ],
        ],
      ),
    );

    if (isInteractive) {
      chip = InkWell(
        onTap: onPressed,
        borderRadius: theme.radius.radiusL,
        child: chip,
      );
    }

    return chip;
  }
}

class _ChromiaFilterChip extends ChromiaChip {
  const _ChromiaFilterChip({
    required super.label,
    required this.selected,
    required this.onSelected,
    super.avatar,
    super.icon,
    this.selectedIcon,
    super.backgroundColor,
    this.selectedBackgroundColor,
    super.foregroundColor,
    this.selectedForegroundColor,
  }) : super();

  final bool selected;
  final ValueChanged<bool> onSelected;
  final IconData? selectedIcon;
  final Color? selectedBackgroundColor;
  final Color? selectedForegroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveBackgroundColor = selected
        ? (selectedBackgroundColor ?? colors.surface)
        : (backgroundColor ?? colors.surfaceContainerHigh);

    final Color effectiveForegroundColor = selected
        ? (selectedForegroundColor ?? colors.primary)
        : (foregroundColor ?? colors.textPrimary);

    final IconData? effectiveIcon = selected && selectedIcon != null ? selectedIcon : icon;

    return InkWell(
      onTap: () => onSelected(!selected),
      borderRadius: theme.radius.radiusL,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.m,
          vertical: spacing.xs,
        ),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: theme.radius.radiusL,
          border: Border.all(
            color: selected ? colors.primary : colors.border,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (avatar != null) ...[
              avatar!,
              spacing.gapHXS,
            ] else if (effectiveIcon != null) ...[
              Icon(
                effectiveIcon,
                size: 16,
                color: effectiveForegroundColor,
              ),
              spacing.gapHXS,
            ],
            Text(
              label,
              style: theme.typography.labelMedium.copyWith(
                color: effectiveForegroundColor,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChromiaChoiceChip extends ChromiaChip {
  const _ChromiaChoiceChip({
    required super.label,
    required this.selected,
    required this.onSelected,
    super.avatar,
    super.icon,
    super.backgroundColor,
    this.selectedBackgroundColor,
    super.foregroundColor,
    this.selectedForegroundColor,
  }) : super();

  final bool selected;
  final VoidCallback onSelected;
  final Color? selectedBackgroundColor;
  final Color? selectedForegroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveBackgroundColor = selected
        ? (selectedBackgroundColor ?? colors.primary)
        : (backgroundColor ?? colors.surfaceContainerHigh);

    final Color effectiveForegroundColor = selected
        ? (selectedForegroundColor ?? colors.onPrimary)
        : (foregroundColor ?? colors.textPrimary);

    return InkWell(
      onTap: selected ? null : onSelected,
      borderRadius: theme.radius.radiusL,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.m,
          vertical: spacing.xs,
        ),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: theme.radius.radiusL,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (avatar != null) ...[
              avatar!,
              spacing.gapHXS,
            ] else if (icon != null) ...[
              Icon(
                icon,
                size: 16,
                color: effectiveForegroundColor,
              ),
              spacing.gapHXS,
            ],
            Text(
              label,
              style: theme.typography.labelMedium.copyWith(
                color: effectiveForegroundColor,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A group of chips that can be selected
class ChromiaChipGroup extends StatelessWidget {
  const ChromiaChipGroup({
    required this.children,
    this.spacing,
    this.runSpacing,
    this.alignment = WrapAlignment.start,
    super.key,
  });

  /// List of chips
  final List<Widget> children;

  /// Spacing between chips
  final double? spacing;

  /// Run spacing for wrapped chips
  final double? runSpacing;

  /// Alignment of chips
  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final effectiveSpacing = spacing ?? theme.spacing.s;
    final effectiveRunSpacing = runSpacing ?? theme.spacing.s;

    return Wrap(
      spacing: effectiveSpacing,
      runSpacing: effectiveRunSpacing,
      alignment: alignment,
      children: children,
    );
  }
}
