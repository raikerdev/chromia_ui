import 'package:chromia_ui/src/components/badge/chromia_badge.dart';
import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:flutter/material.dart';

/// A customizable bottom navigation bar component.
///
/// Example usage:
/// ```dart
/// ChromiaBottomNavigationBar(
///   currentIndex: selectedIndex,
///   onTap: (index) => setState(() => selectedIndex = index),
///   items: [
///     ChromiaBottomNavigationItem(
///       icon: Icons.home,
///       label: 'Home',
///     ),
///     ChromiaBottomNavigationItem(
///       icon: Icons.explore,
///       label: 'Explore',
///     ),
///   ],
/// )
/// ```
class ChromiaBottomNavigationBar extends StatelessWidget {
  const ChromiaBottomNavigationBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.showLabels = true,
    this.elevation = 8,
    super.key,
  });

  /// List of navigation items
  final List<ChromiaBottomNavigationItem> items;

  /// Currently selected index
  final int currentIndex;

  /// Called when an item is tapped
  final ValueChanged<int> onTap;

  /// Background color of the bar
  final Color? backgroundColor;

  /// Color of the selected item
  final Color? selectedItemColor;

  /// Color of unselected items
  final Color? unselectedItemColor;

  /// Whether to show labels
  final bool showLabels;

  /// Elevation of the bar
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.surface,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: colors.shadow.withAlpha(26),
                  blurRadius: elevation,
                  offset: Offset(0, -elevation / 2),
                ),
              ]
            : null,
      ),
      child: SafeArea(
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = index == currentIndex;

              return _BottomNavigationItemWidget(
                item: item,
                isSelected: isSelected,
                onTap: () => onTap(index),
                selectedColor: selectedItemColor ?? colors.primary,
                unselectedColor: unselectedItemColor ?? colors.textSecondary,
                showLabel: showLabels,
              );
            }),
          ),
        ),
      ),
    );
  }
}

/// A single item in the bottom navigation bar
class ChromiaBottomNavigationItem {
  const ChromiaBottomNavigationItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.badge,
  });

  /// Icon to display
  final IconData icon;

  /// Label text
  final String label;

  /// Icon to display when selected (optional)
  final IconData? selectedIcon;

  /// Optional badge
  final String? badge;
}

class _BottomNavigationItemWidget extends StatelessWidget {
  const _BottomNavigationItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
    required this.showLabel,
  });

  final ChromiaBottomNavigationItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    final IconData effectiveIcon = isSelected && item.selectedIcon != null ? item.selectedIcon! : item.icon;
    final Color effectiveColor = isSelected ? selectedColor : unselectedColor;

    Widget iconWidget = Icon(
      effectiveIcon,
      color: effectiveColor,
      size: 24,
    );

    if (item.badge != null) {
      iconWidget = ChromiaBadge(
        value: item.badge,
        size: ChromiaBadgeSize.small,
        child: iconWidget,
      );
    }

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: spacing.paddingXS,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconWidget,
              if (showLabel) ...[
                spacing.gapVXS,
                Text(
                  item.label,
                  style: theme.typography.labelSmall.copyWith(
                    color: effectiveColor,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// A floating bottom navigation bar with rounded corners
class ChromiaFloatingBottomNavigationBar extends StatelessWidget {
  const ChromiaFloatingBottomNavigationBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.margin,
    super.key,
  });

  /// List of navigation items
  final List<ChromiaBottomNavigationItem> items;

  /// Currently selected index
  final int currentIndex;

  /// Called when an item is tapped
  final ValueChanged<int> onTap;

  /// Background color of the bar
  final Color? backgroundColor;

  /// Color of the selected item
  final Color? selectedItemColor;

  /// Color of unselected items
  final Color? unselectedItemColor;

  /// Margin around the bar
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Padding(
      padding: margin ?? spacing.paddingL,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: backgroundColor ?? colors.surface,
          borderRadius: theme.radius.radiusXL,
          boxShadow: theme.shadows.l,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = index == currentIndex;

            return _BottomNavigationItemWidget(
              item: item,
              isSelected: isSelected,
              onTap: () => onTap(index),
              selectedColor: selectedItemColor ?? colors.primary,
              unselectedColor: unselectedItemColor ?? colors.textSecondary,
              showLabel: false,
            );
          }),
        ),
      ),
    );
  }
}
