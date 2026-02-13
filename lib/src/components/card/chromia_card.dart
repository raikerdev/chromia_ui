import 'package:chromia_ui/src/theme/chromia_shadows.dart';
import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:chromia_ui/src/tokens/animation_tokens.dart';
import 'package:flutter/material.dart';

/// A customizable card component that follows the Chromia design system.
///
/// The [ChromiaCard] is a versatile container for grouping related content
/// and actions. It supports headers, footers, images, and various styling options.
///
/// Example usage:
/// ```dart
/// ChromiaCard(
///   child: Padding(
///     padding: EdgeInsets.all(16),
///     child: Text('Card content'),
///   ),
/// )
/// ```
///
/// With header and footer:
/// ```dart
/// ChromiaCard(
///   header: Text('Card Title'),
///   footer: Row(
///     children: [
///       TextButton(onPressed: () {}, child: Text('Cancel')),
///       ElevatedButton(onPressed: () {}, child: Text('Save')),
///     ],
///   ),
///   child: Text('Card content'),
/// )
/// ```
class ChromiaCard extends StatefulWidget {
  const ChromiaCard({
    required this.child,
    this.header,
    this.footer,
    this.image,
    this.imagePosition = CardImagePosition.top,
    this.onTap,
    this.padding,
    this.headerPadding,
    this.footerPadding,
    this.margin,
    this.elevation = 1,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    super.key,
  });

  /// The main content of the card
  final Widget child;

  /// Optional header widget
  final Widget? header;

  /// Optional footer widget
  final Widget? footer;

  /// Optional image widget
  final Widget? image;

  /// Position of the image relative to content
  final CardImagePosition imagePosition;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Padding for the main content
  final EdgeInsetsGeometry? padding;

  /// Padding for the header
  final EdgeInsetsGeometry? headerPadding;

  /// Padding for the footer
  final EdgeInsetsGeometry? footerPadding;

  /// Margin around the card
  final EdgeInsetsGeometry? margin;

  /// Elevation of the card (0-9)
  final double elevation;

  /// Border radius of the card
  final BorderRadius? borderRadius;

  /// Background color of the card
  final Color? backgroundColor;

  /// Border color
  final Color? borderColor;

  /// Border width
  final double? borderWidth;

  /// Width of the card
  final double? width;

  /// Height of the card
  final double? height;

  /// Clip behavior for the card
  final Clip clipBehavior;

  @override
  State<ChromiaCard> createState() => _ChromiaCardState();
}

class _ChromiaCardState extends State<ChromiaCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final radius = theme.radius;
    final shadows = theme.shadows;

    final bool isInteractive = widget.onTap != null;
    final BorderRadius effectiveRadius = widget.borderRadius ?? radius.radiusL;
    final Color effectiveBackgroundColor = widget.backgroundColor ?? colors.surface;

    // Determine shadow based on elevation and state
    List<BoxShadow> effectiveShadows;
    if (_isPressed && isInteractive) {
      effectiveShadows = shadows.xs;
    } else if (_isHovered && isInteractive) {
      effectiveShadows = _getElevatedShadows(widget.elevation + 1, shadows);
    } else {
      effectiveShadows = _getElevatedShadows(widget.elevation, shadows);
    }

    final Widget cardContent = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top image
        if (widget.image != null && widget.imagePosition == CardImagePosition.top)
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: effectiveRadius.topLeft,
              topRight: effectiveRadius.topRight,
            ),
            child: widget.image!,
          ),

        // Header
        if (widget.header != null)
          Padding(
            padding:
                widget.headerPadding ??
                EdgeInsets.symmetric(
                  horizontal: spacing.l,
                  vertical: spacing.m,
                ),
            child: DefaultTextStyle(
              style: theme.typography.titleMedium.copyWith(
                color: colors.textPrimary,
              ),
              child: widget.header!,
            ),
          ),

        // Main content
        Padding(
          padding: widget.padding ?? spacing.paddingL,
          child: DefaultTextStyle(
            style: theme.typography.bodyMedium.copyWith(
              color: colors.textSecondary,
            ),
            child: widget.child,
          ),
        ),

        // Footer
        if (widget.footer != null)
          Padding(
            padding:
                widget.footerPadding ??
                EdgeInsets.symmetric(
                  horizontal: spacing.l,
                  vertical: spacing.m,
                ),
            child: widget.footer!,
          ),

        // Bottom image
        if (widget.image != null && widget.imagePosition == CardImagePosition.bottom)
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: effectiveRadius.bottomLeft,
              bottomRight: effectiveRadius.bottomRight,
            ),
            child: widget.image!,
          ),
      ],
    );

    final Widget card = AnimatedContainer(
      duration: AnimationTokens.fast,
      curve: AnimationTokens.easeOut,
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveRadius,
        border: widget.borderColor != null
            ? Border.all(
                color: widget.borderColor!,
                width: widget.borderWidth ?? 1.0,
              )
            : null,
        boxShadow: effectiveShadows,
      ),
      clipBehavior: widget.clipBehavior,
      child: cardContent,
    );

    if (isInteractive) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          onTap: widget.onTap,
          child: card,
        ),
      );
    }

    return card;
  }

  /// Gets shadows based on elevation level
  List<BoxShadow> _getElevatedShadows(double elevation, ChromiaShadows shadows) {
    if (elevation <= 0) {
      return shadows.none;
    }
    if (elevation <= 1) {
      return shadows.xs;
    }
    if (elevation <= 2) {
      return shadows.s;
    }
    if (elevation <= 4) {
      return shadows.m;
    }
    if (elevation <= 6) {
      return shadows.l;
    }
    if (elevation <= 8) {
      return shadows.xl;
    }
    return shadows.xxl;
  }
}

/// Position of the image in the card
enum CardImagePosition {
  /// Image at the top of the card
  top,

  /// Image at the bottom of the card
  bottom,
}

/// A specialized card for displaying list items.
class ChromiaListCard extends StatelessWidget {
  const ChromiaListCard({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.elevation = 1,
    super.key,
  });

  /// The primary content
  final Widget title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display before the title
  final Widget? leading;

  /// A widget to display after the title
  final Widget? trailing;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Padding around the content
  final EdgeInsetsGeometry? padding;

  /// Elevation of the card
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return ChromiaCard(
      onTap: onTap,
      elevation: elevation,
      padding: padding ?? spacing.paddingM,
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            spacing.gapHM,
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextStyle(
                  style: theme.typography.bodyMedium.copyWith(
                    color: theme.colors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  child: title,
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
          if (trailing != null) ...[
            spacing.gapHM,
            trailing!,
          ],
        ],
      ),
    );
  }
}
