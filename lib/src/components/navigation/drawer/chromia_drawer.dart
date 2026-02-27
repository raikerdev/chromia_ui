import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable drawer component for side navigation.
///
/// Example usage:
/// ```dart
/// ChromiaDrawer(
///   header: DrawerHeader(child: Text('Menu')),
///   items: [
///     ChromiaDrawerItem(
///       icon: Icons.home,
///       label: 'Home',
///       onTap: () => Navigator.pop(context),
///     ),
///     ChromiaDrawerItem(
///       icon: Icons.settings,
///       label: 'Settings',
///       onTap: () {},
///     ),
///   ],
/// )
/// ```
class ChromiaDrawer extends StatelessWidget {
  const ChromiaDrawer({
    this.header,
    this.items = const [],
    this.footer,
    this.backgroundColor,
    this.width,
    super.key,
  });

  /// Header widget (typically DrawerHeader or custom widget)
  final Widget? header;

  /// List of drawer items
  final List<Widget> items;

  /// Footer widget
  final Widget? footer;

  /// Background color
  final Color? backgroundColor;

  /// Width of the drawer
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    return Drawer(
      backgroundColor: backgroundColor ?? colors.surface,
      width: width,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ?header,
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
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

/// A single item in the drawer.
class ChromiaDrawerItem extends StatelessWidget {
  const ChromiaDrawerItem({
    required this.label,
    this.icon,
    this.trailing,
    this.selected = false,
    this.onTap,
    this.badge,
    super.key,
  });

  /// Label text
  final String label;

  /// Leading icon
  final IconData? icon;

  /// Trailing widget
  final Widget? trailing;

  /// Whether this item is selected
  final bool selected;

  /// Callback when tapped
  final VoidCallback? onTap;

  /// Optional badge text
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveBackgroundColor = selected ? colors.surface : Colors.transparent;
    final Color effectiveTextColor = selected ? colors.primary : colors.textPrimary;
    final Color effectiveIconColor = selected ? colors.primary : colors.textSecondary;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.l,
          vertical: spacing.m,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: spacing.m,
          vertical: spacing.xxs,
        ),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: theme.radius.radiusM,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: effectiveIconColor,
                size: 24,
              ),
              spacing.gapHM,
            ],
            Expanded(
              child: ChromiaText(
                label,
                type: ChromiaTypographyType.bodyMedium,
                style: TextStyle(
                  color: effectiveTextColor,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            if (badge != null) ...[
              spacing.gapHM,
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.s,
                  vertical: spacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: colors.error,
                  borderRadius: theme.radius.radiusS,
                ),
                child: ChromiaText(
                  badge!,
                  type: ChromiaTypographyType.labelSmall,
                  color: colors.onError,
                ),
              ),
            ],
            if (trailing != null) ...[
              spacing.gapHM,
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}

/// A section header in the drawer.
class ChromiaDrawerSection extends StatelessWidget {
  const ChromiaDrawerSection({
    required this.title,
    this.padding,
    super.key,
  });

  /// Section title
  final String title;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Padding(
      padding:
          padding ??
          EdgeInsets.fromLTRB(
            spacing.l,
            spacing.l,
            spacing.l,
            spacing.s,
          ),
      child: ChromiaText(
        title.toUpperCase(),
        type: ChromiaTypographyType.labelSmall,
        style: TextStyle(
          color: colors.textTertiary,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

/// A divider for the drawer.
class ChromiaDrawerDivider extends StatelessWidget {
  const ChromiaDrawerDivider({
    this.margin,
    super.key,
  });

  /// Margin around the divider
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Container(
      margin:
          margin ??
          EdgeInsets.symmetric(
            horizontal: spacing.l,
            vertical: spacing.m,
          ),
      height: 1,
      color: colors.divider,
    );
  }
}

/// A custom drawer header with user info.
class ChromiaDrawerHeader extends StatelessWidget {
  const ChromiaDrawerHeader({
    this.title,
    this.subtitle,
    this.avatar,
    this.backgroundImage,
    this.backgroundColor,
    this.onTap,
    super.key,
  });

  /// Title text (e.g., user name)
  final String? title;

  /// Subtitle text (e.g., email)
  final String? subtitle;

  /// Avatar widget
  final Widget? avatar;

  /// Background image
  final ImageProvider? backgroundImage;

  /// Background color
  final Color? backgroundColor;

  /// Callback when tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: backgroundColor ?? colors.surface,
          image: backgroundImage != null
              ? DecorationImage(
                  image: backgroundImage!,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withAlpha(77),
                    BlendMode.darken,
                  ),
                )
              : null,
        ),
        padding: spacing.paddingL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (avatar != null) ...[
              avatar!,
              spacing.gapVM,
            ],
            if (title != null)
              ChromiaText(
                title!,
                type: ChromiaTypographyType.titleLarge,
                style: TextStyle(
                  color: backgroundImage != null ? Colors.white : colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (subtitle != null) ...[
              spacing.gapVXS,
              ChromiaText(
                subtitle!,
                type: ChromiaTypographyType.bodySmall,
                color: backgroundImage != null ? Colors.white.withAlpha(230) : colors.onSurface.withAlpha(204),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
