import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:flutter/material.dart';

/// A customizable popup menu component.
///
/// Example usage:
/// ```dart
/// ChromiaPopupMenu<String>(
///   items: [
///     ChromiaMenuItem(value: 'edit', label: 'Edit', icon: Icons.edit),
///     ChromiaMenuItem(value: 'delete', label: 'Delete', icon: Icons.delete),
///   ],
///   onSelected: (value) => print('Selected: $value'),
///   child: Icon(Icons.more_vert),
/// )
/// ```
class ChromiaPopupMenu<T> extends StatelessWidget {
  const ChromiaPopupMenu({
    required this.items,
    required this.onSelected,
    this.child,
    this.icon,
    this.initialValue,
    this.offset = Offset.zero,
    super.key,
  });

  /// List of menu items
  final List<ChromiaMenuItem<T>> items;

  /// Called when an item is selected
  final ValueChanged<T> onSelected;

  /// Custom child widget (e.g., button)
  final Widget? child;

  /// Icon to display (used if child is null)
  final IconData? icon;

  /// Initial selected value
  final T? initialValue;

  /// Offset of the menu from the button
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    return PopupMenuButton<T>(
      initialValue: initialValue,
      onSelected: onSelected,
      offset: offset,
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: theme.radius.radiusM,
      ),
      itemBuilder: (BuildContext context) {
        return items.map((ChromiaMenuItem<T> item) {
          if (item.isDivider) {
            return const PopupMenuDivider() as PopupMenuEntry<T>;
          }

          return PopupMenuItem<T>(
            value: item.value,
            enabled: item.enabled,
            child: _MenuItemContent(item: item),
          );
        }).toList();
      },
      child:
          child ??
          Icon(
            icon ?? Icons.more_vert,
            color: colors.textSecondary,
          ),
    );
  }
}

/// A single menu item
class ChromiaMenuItem<T> {
  const ChromiaMenuItem({
    required this.value,
    required this.label,
    this.icon,
    this.trailing,
    this.enabled = true,
    this.isDivider = false,
  });

  /// Value of the item
  final T? value;

  /// Label text
  final String label;

  /// Leading icon
  final IconData? icon;

  /// Trailing widget (e.g., shortcut text)
  final Widget? trailing;

  /// Whether the item is enabled
  final bool enabled;

  /// Whether this is a divider
  final bool isDivider;

  /// Creates a divider item
  factory ChromiaMenuItem.divider() {
    return ChromiaMenuItem<T>(
      value: null,
      label: '',
      isDivider: true,
    );
  }
}

class _MenuItemContent<T> extends StatelessWidget {
  const _MenuItemContent({required this.item});

  final ChromiaMenuItem<T> item;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color textColor = item.enabled ? colors.textPrimary : colors.textDisabled;

    return Row(
      children: [
        if (item.icon != null) ...[
          Icon(
            item.icon,
            size: 20,
            color: item.enabled ? colors.textSecondary : colors.textDisabled,
          ),
          spacing.gapHM,
        ],
        Expanded(
          child: Text(
            item.label,
            style: theme.typography.bodyMedium.copyWith(
              color: textColor,
            ),
          ),
        ),
        if (item.trailing != null) ...[
          spacing.gapHM,
          DefaultTextStyle(
            style: theme.typography.bodySmall.copyWith(
              color: colors.textTertiary,
            ),
            child: item.trailing!,
          ),
        ],
      ],
    );
  }
}

/// A context menu that shows on long press or right click
class ChromiaContextMenu<T> extends StatelessWidget {
  const ChromiaContextMenu({
    required this.items,
    required this.onSelected,
    required this.child,
    super.key,
  });

  /// List of menu items
  final List<ChromiaMenuItem<T>> items;

  /// Called when an item is selected
  final ValueChanged<T> onSelected;

  /// Child widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showMenu(context),
      onSecondaryTapDown: (details) => _showMenu(context, details.globalPosition),
      child: child,
    );
  }

  void _showMenu(BuildContext context, [Offset? position]) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset targetPosition =
        position ??
        renderBox.localToGlobal(
          renderBox.size.center(Offset.zero),
          ancestor: overlay,
        );

    final theme = ChromiaTheme.of(context);
    final colors = theme.colors;

    showMenu<T>(
      context: context,
      position: RelativeRect.fromLTRB(
        targetPosition.dx,
        targetPosition.dy,
        targetPosition.dx,
        targetPosition.dy,
      ),
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: theme.radius.radiusM,
      ),
      items: items.map((ChromiaMenuItem<T> item) {
        if (item.isDivider) {
          return const PopupMenuDivider() as PopupMenuEntry<T>;
        }

        return PopupMenuItem<T>(
          value: item.value,
          enabled: item.enabled,
          child: _MenuItemContent(item: item),
        );
      }).toList(),
    ).then((T? value) {
      if (value != null) {
        onSelected(value);
      }
    });
  }
}

/// A dropdown menu button
class ChromiaMenuButton<T> extends StatelessWidget {
  const ChromiaMenuButton({
    required this.items,
    required this.onSelected,
    this.label,
    this.selectedValue,
    this.icon,
    super.key,
  });

  /// List of menu items
  final List<ChromiaMenuItem<T>> items;

  /// Called when an item is selected
  final ValueChanged<T> onSelected;

  /// Button label
  final String? label;

  /// Currently selected value
  final T? selectedValue;

  /// Leading icon
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final selectedItem = selectedValue != null
        ? items.firstWhere(
            (item) => item.value == selectedValue,
            orElse: () => items.first,
          )
        : null;

    return PopupMenuButton<T>(
      onSelected: onSelected,
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: theme.radius.radiusM,
      ),
      itemBuilder: (BuildContext context) {
        return items.map((ChromiaMenuItem<T> item) {
          if (item.isDivider) {
            return const PopupMenuDivider() as PopupMenuEntry<T>;
          }

          final bool isSelected = item.value == selectedValue;

          return PopupMenuItem<T>(
            value: item.value,
            enabled: item.enabled,
            child: Row(
              children: [
                if (item.icon != null) ...[
                  Icon(
                    item.icon,
                    size: 20,
                    color: isSelected
                        ? colors.primary
                        : item.enabled
                        ? colors.textSecondary
                        : colors.textDisabled,
                  ),
                  spacing.gapHM,
                ],
                Expanded(
                  child: Text(
                    item.label,
                    style: theme.typography.bodyMedium.copyWith(
                      color: isSelected
                          ? colors.primary
                          : item.enabled
                          ? colors.textPrimary
                          : colors.textDisabled,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check,
                    size: 20,
                    color: colors.primary,
                  ),
              ],
            ),
          );
        }).toList();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.m,
          vertical: spacing.s,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: colors.border),
          borderRadius: theme.radius.radiusM,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20, color: colors.textSecondary),
              spacing.gapHM,
            ],
            Text(
              label ?? selectedItem?.label ?? 'Select',
              style: theme.typography.bodyMedium.copyWith(
                color: colors.textPrimary,
              ),
            ),
            spacing.gapHM,
            Icon(
              Icons.arrow_drop_down,
              color: colors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
