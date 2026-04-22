import 'package:chromia_ui/chromia_ui.dart';
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
    final colors = context.chromiaColors;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.surfaceContainer;
    final Color effectiveForegroundColor = foregroundColor ?? colors.onSurfaceContainer;
    final Color effectiveDeleteIconColor = deleteIconColor ?? colors.onSurfaceContainer;

    return _Chip(
      label: label,
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      border: Border.all(
        color: colors.outline,
        width: 1,
      ),
      padding: padding,
      onPressed: onPressed,
      avatar: avatar,
      icon: icon,
      deleteWidget: onDeleted != null
          ? ChromiaInteractiveWidget(
              onPressed: onDeleted,
              useCircleBorder: true,
              child: Icon(
                Icons.close,
                size: 16,
                color: effectiveDeleteIconColor,
              ),
            )
          : null,
    );
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
    final colors = context.chromiaColors;

    final Color effectiveBackgroundColor = selected
        ? (selectedBackgroundColor ?? colors.surface)
        : (backgroundColor ?? colors.surfaceContainer);

    final Color effectiveForegroundColor = selected
        ? (selectedForegroundColor ?? colors.primary)
        : (foregroundColor ?? colors.onSurfaceContainer);

    final IconData? effectiveIcon = selected && selectedIcon != null ? selectedIcon : icon;

    return _Chip(
      label: label,
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      border: Border.all(
        color: selected ? effectiveForegroundColor : colors.outline,
        width: selected ? 2 : 1,
      ),
      padding: padding,
      onPressed: () => onSelected(!selected),
      avatar: avatar,
      icon: effectiveIcon,
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
    final colors = context.chromiaColors;

    final Color effectiveBackgroundColor = selected
        ? (selectedBackgroundColor ?? colors.primary)
        : (backgroundColor ?? colors.surfaceContainer);

    final Color effectiveForegroundColor = selected
        ? (selectedForegroundColor ?? colors.onPrimary)
        : (foregroundColor ?? colors.onSurfaceContainer);

    return _Chip(
      label: label,
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      padding: padding,
      onPressed: selected ? null : onSelected,
      avatar: avatar,
      icon: icon,
      fontWeight: selected ? TypographyTokens.semiBold : TypographyTokens.regular,
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    this.border,
    this.onPressed,
    this.avatar,
    this.icon,
    this.deleteWidget,
    this.padding,
    this.fontWeight = TypographyTokens.regular,
  });

  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final BoxBorder? border;
  final VoidCallback? onPressed;
  final Widget? avatar;
  final IconData? icon;
  final Widget? deleteWidget;
  final EdgeInsetsGeometry? padding;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    final spacing = context.chromiaSpacing;
    final radius = context.chromiaRadius;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius.radiusL,
        border: border,
      ),
      clipBehavior: Clip.antiAlias,
      child: ChromiaInteractiveWidget(
        onPressed: onPressed,
        child: Padding(
          padding:
              padding ??
              spacing.symmetric(
                horizontal: spacing.m,
                vertical: spacing.xs,
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
                  size: TypographyTokens.fontSize16,
                  color: foregroundColor,
                ),
                spacing.gapHXS,
              ],
              ChromiaText(
                label,
                type: ChromiaTypographyType.labelMedium,
                style: TextStyle(
                  color: foregroundColor,
                  fontWeight: fontWeight,
                ),
              ),
              if (deleteWidget != null) ...[
                spacing.gapHXS,
                deleteWidget!,
              ],
            ],
          ),
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
    final chromiaSpacing = context.chromiaSpacing;
    final effectiveSpacing = spacing ?? chromiaSpacing.s;
    final effectiveRunSpacing = runSpacing ?? chromiaSpacing.s;

    return Wrap(
      spacing: effectiveSpacing,
      runSpacing: effectiveRunSpacing,
      alignment: alignment,
      children: children,
    );
  }
}
