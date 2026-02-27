import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable app bar component that follows the Chromia design system.
///
/// Example usage:
/// ```dart
/// ChromiaAppBar(
///   title: 'My App',
///   actions: [
///     IconButton(
///       icon: Icon(Icons.search),
///       onPressed: () {},
///     ),
///   ],
/// )
/// ```
class ChromiaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChromiaAppBar({
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.bottom,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.centerTitle,
    this.showBackButton = true,
    this.onBackPressed,
    this.height,
    super.key,
  });

  /// Title text
  final String? title;

  /// Custom title widget
  final Widget? titleWidget;

  /// Leading widget (replaces back button)
  final Widget? leading;

  /// Action widgets
  final List<Widget>? actions;

  /// Bottom widget (e.g., TabBar)
  final PreferredSizeWidget? bottom;

  /// Background color
  final Color? backgroundColor;

  /// Foreground color (text and icons)
  final Color? foregroundColor;

  /// Elevation
  final double elevation;

  /// Whether to center the title
  final bool? centerTitle;

  /// Whether to show back button automatically
  final bool showBackButton;

  /// Callback when back button is pressed
  final VoidCallback? onBackPressed;

  /// Custom height
  final double? height;

  @override
  Size get preferredSize {
    final double baseHeight = height ?? kToolbarHeight;
    final double bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(baseHeight + bottomHeight);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.surface;
    final Color effectiveForegroundColor = foregroundColor ?? colors.textPrimary;

    // Determine if we should show a back button
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;
    final bool shouldShowBack = showBackButton && canPop && leading == null;

    Widget? effectiveLeading = leading;
    if (shouldShowBack) {
      effectiveLeading = IconButton(
        icon: Icon(Icons.arrow_back, color: effectiveForegroundColor),
        onPressed: onBackPressed ?? () => Navigator.pop(context),
      );
    }

    return AppBar(
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      elevation: elevation,
      shadowColor: colors.shadow,
      centerTitle: centerTitle,
      leading: effectiveLeading,
      title:
          titleWidget ??
          (title != null
              ? ChromiaText(
                  title!,
                  type: ChromiaTypographyType.titleLarge,
                  color: effectiveForegroundColor,
                )
              : null),
      actions: actions != null
          ? [
              ...actions!,
              SizedBox(width: spacing.xs),
            ]
          : null,
      bottom: bottom,
      toolbarHeight: height,
    );
  }
}

/// A search app bar with integrated search field.
class ChromiaSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ChromiaSearchAppBar({
    required this.onSearch,
    this.hintText = 'Search...',
    this.leading,
    this.actions,
    this.backgroundColor,
    this.height,
    this.autofocus = false,
    this.controller,
    super.key,
  });

  /// Called when search query changes
  final ValueChanged<String> onSearch;

  /// Hint text for search field
  final String hintText;

  /// Leading widget
  final Widget? leading;

  /// Action widgets
  final List<Widget>? actions;

  /// Background color
  final Color? backgroundColor;

  /// Custom height
  final double? height;

  /// Whether to autofocus the search field
  final bool autofocus;

  /// Text editing controller
  final TextEditingController? controller;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  State<ChromiaSearchAppBar> createState() => _ChromiaSearchAppBarState();
}

class _ChromiaSearchAppBarState extends State<ChromiaSearchAppBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();

    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _controller.clear();
    widget.onSearch('');
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    final Color effectiveBackgroundColor = widget.backgroundColor ?? colors.surface;

    return AppBar(
      backgroundColor: effectiveBackgroundColor,
      elevation: 0,
      shadowColor: colors.shadow,
      leading:
          widget.leading ??
          IconButton(
            icon: Icon(Icons.arrow_back, color: colors.textPrimary),
            onPressed: () => Navigator.pop(context),
          ),
      title: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onChanged: widget.onSearch,
        style: theme.typography.bodyMedium.copyWith(
          color: colors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: theme.typography.bodyMedium.copyWith(
            color: colors.textTertiary,
          ),
          border: InputBorder.none,
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: colors.textSecondary),
                  onPressed: _clearSearch,
                )
              : null,
        ),
      ),
      actions: widget.actions,
      toolbarHeight: widget.height,
    );
  }
}

/// An app bar with tabs.
class ChromiaTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ChromiaTabBar({
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    super.key,
  });

  /// List of tabs
  final List<Widget> tabs;

  /// Tab controller
  final TabController? controller;

  /// Whether tabs should be scrollable
  final bool isScrollable;

  /// Color of the indicator
  final Color? indicatorColor;

  /// Color of selected tab label
  final Color? labelColor;

  /// Color of unselected tab labels
  final Color? unselectedLabelColor;

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    return TabBar(
      controller: controller,
      tabs: tabs,
      isScrollable: isScrollable,
      indicatorColor: indicatorColor ?? colors.primary,
      labelColor: labelColor ?? colors.primary,
      unselectedLabelColor: unselectedLabelColor ?? colors.textSecondary,
      indicatorWeight: 3,
      labelStyle: theme.typography.labelMedium,
      unselectedLabelStyle: theme.typography.labelMedium,
    );
  }
}

/// A collapsible app bar that expands and collapses on scroll.
class ChromiaSliverAppBar extends StatelessWidget {
  const ChromiaSliverAppBar({
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.flexibleSpace,
    this.backgroundColor,
    this.foregroundColor,
    this.expandedHeight = 200,
    this.collapsedHeight,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.stretch = false,
    super.key,
  });

  /// Title text
  final String? title;

  /// Custom title widget
  final Widget? titleWidget;

  /// Leading widget
  final Widget? leading;

  /// Action widgets
  final List<Widget>? actions;

  /// Flexible space widget
  final Widget? flexibleSpace;

  /// Background color
  final Color? backgroundColor;

  /// Foreground color
  final Color? foregroundColor;

  /// Expanded height
  final double expandedHeight;

  /// Collapsed height
  final double? collapsedHeight;

  /// Whether the app bar should remain visible at the top
  final bool pinned;

  /// Whether the app bar should become visible as soon as the user scrolls
  final bool floating;

  /// Whether the app bar should snap into view
  final bool snap;

  /// Whether the app bar should stretch
  final bool stretch;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.surface;
    final Color effectiveForegroundColor = foregroundColor ?? colors.textPrimary;

    return SliverAppBar(
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      pinned: pinned,
      floating: floating,
      snap: snap,
      stretch: stretch,
      leading: leading,
      actions: actions,
      flexibleSpace:
          flexibleSpace ??
          FlexibleSpaceBar(
            title:
                titleWidget ??
                (title != null
                    ? ChromiaText(
                        title!,
                        type: ChromiaTypographyType.titleLarge,
                        color: effectiveForegroundColor,
                      )
                    : null),
            centerTitle: true,
          ),
    );
  }
}
