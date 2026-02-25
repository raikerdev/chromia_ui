import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A mini drawer that shows only icons.
class ChromiaMiniDrawer extends StatelessWidget {
  const ChromiaMiniDrawer({
    this.header,
    this.items = const [],
    this.footer,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.backgroundColor,
    this.width = 72,
    super.key,
  });

  /// Header item
  final Widget? header;

  /// List of drawer items
  final List<ChromiaMiniDrawerItem> items;

  /// Footer item
  final ChromiaMiniDrawerItem? footer;

  /// Currently selected index
  final int selectedIndex;

  /// Callback when item is selected
  final ValueChanged<int>? onItemSelected;

  /// Background color
  final Color? backgroundColor;

  /// Width of the mini drawer
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Container(
      width: width,
      color: backgroundColor ?? colors.surface,
      child: SafeArea(
        child: Column(
          children: [
            if (header != null) ...[
              Container(
                width: width,
                height: width,
                padding: EdgeInsets.all(width * 0.2),
                child: header,
              ),
              spacing.gapVL,
            ],
            Expanded(
              child: ListView(
                children: items,
              ),
            ),
            ?footer,
          ],
        ),
      ),
    );
  }
}

class ChromiaMiniDrawerItem extends StatelessWidget {
  const ChromiaMiniDrawerItem({
    required this.icon,
    this.label,
    this.selected = false,
    this.onTap,
    this.badge,
    super.key,
  });

  /// Icon
  final IconData icon;

  /// Optional label (shown on hover)
  final String? label;

  /// Whether this item is selected
  final bool selected;

  /// Callback when tapped
  final VoidCallback? onTap;

  /// Optional badge
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveBackgroundColor = selected ? colors.surface : Colors.transparent;

    final Color effectiveIconColor = selected ? colors.primary : colors.textSecondary;

    return Tooltip(
      message: label ?? '',
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: spacing.paddingM,
          margin: EdgeInsets.symmetric(
            horizontal: spacing.s,
            vertical: spacing.xs,
          ),
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            borderRadius: theme.radius.radiusM,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Icon(
                icon,
                color: effectiveIconColor,
                size: 24,
              ),
              if (badge != null)
                Positioned(
                  top: -8,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: colors.error,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: ChromiaText(
                      badge!,
                      style: TextStyle(
                        color: colors.onError,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
