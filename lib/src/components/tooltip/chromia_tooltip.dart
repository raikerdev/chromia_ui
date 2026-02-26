import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:flutter/material.dart';

/// A customizable tooltip component for displaying contextual information.
///
/// Example usage:
/// ```dart
/// ChromiaTooltip(
///   message: 'This is a tooltip',
///   child: Icon(Icons.help),
/// )
///
/// ChromiaTooltip.rich(
///   title: 'Help',
///   message: 'This is a detailed tooltip with a title',
///   child: Icon(Icons.info),
/// )
/// ```
class ChromiaTooltip extends StatelessWidget {
  const ChromiaTooltip({
    required this.message,
    required this.child,
    this.preferBelow = true,
    this.verticalOffset,
    this.waitDuration,
    this.showDuration,
    this.padding,
    this.margin,
    this.decoration,
    this.textStyle,
    super.key,
  });

  /// Tooltip message
  final String message;

  /// The widget to display the tooltip on
  final Widget child;

  /// Whether to show the tooltip below the widget
  final bool preferBelow;

  /// Vertical offset from the widget
  final double? verticalOffset;

  /// Duration to wait before showing
  final Duration? waitDuration;

  /// Duration to show the tooltip
  final Duration? showDuration;

  /// Padding inside the tooltip
  final EdgeInsetsGeometry? padding;

  /// Margin around the tooltip
  final EdgeInsetsGeometry? margin;

  /// Custom decoration
  final Decoration? decoration;

  /// Custom text style
  final TextStyle? textStyle;

  /// Creates a rich tooltip with title and message
  factory ChromiaTooltip.rich({
    required String title,
    required String message,
    required Widget child,
    bool preferBelow = true,
    double? verticalOffset,
    Duration? waitDuration,
    Duration? showDuration,
  }) {
    return _ChromiaRichTooltip(
      title: title,
      message: message,
      preferBelow: preferBelow,
      verticalOffset: verticalOffset,
      waitDuration: waitDuration,
      showDuration: showDuration,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Tooltip(
      message: message,
      preferBelow: preferBelow,
      verticalOffset: verticalOffset ?? 24,
      waitDuration: waitDuration ?? const Duration(milliseconds: 500),
      showDuration: showDuration ?? const Duration(seconds: 2),
      padding: padding ?? spacing.paddingM,
      margin: margin ?? spacing.paddingS,
      decoration:
          decoration ??
          BoxDecoration(
            color: colors.surface,
            borderRadius: theme.radius.radiusS,
            boxShadow: theme.shadows.m,
          ),
      textStyle:
          textStyle ??
          theme.typography.bodySmall.copyWith(
            color: colors.onSurface,
          ),
      child: child,
    );
  }
}

class _ChromiaRichTooltip extends ChromiaTooltip {
  const _ChromiaRichTooltip({
    required this.title,
    required super.message,
    required super.child,
    super.preferBelow = true,
    super.verticalOffset,
    super.waitDuration,
    super.showDuration,
  }) : super();

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Tooltip(
      richMessage: WidgetSpan(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: theme.typography.labelMedium.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              spacing.gapVXS,
              Text(
                message,
                style: theme.typography.bodySmall.copyWith(
                  color: colors.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
      preferBelow: preferBelow,
      verticalOffset: verticalOffset ?? 24,
      waitDuration: waitDuration ?? const Duration(milliseconds: 500),
      showDuration: showDuration ?? const Duration(seconds: 3),
      padding: spacing.paddingM,
      margin: spacing.paddingS,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: theme.radius.radiusS,
        boxShadow: theme.shadows.m,
      ),
      child: child,
    );
  }
}

/// A custom tooltip that shows on long press
class ChromiaLongPressTooltip extends StatefulWidget {
  const ChromiaLongPressTooltip({
    required this.message,
    required this.child,
    this.duration = const Duration(seconds: 2),
    super.key,
  });

  /// Tooltip message
  final String message;

  /// The widget to display the tooltip on
  final Widget child;

  /// Duration to show the tooltip
  final Duration duration;

  @override
  State<ChromiaLongPressTooltip> createState() => _ChromiaLongPressTooltipState();
}

class _ChromiaLongPressTooltipState extends State<ChromiaLongPressTooltip> {
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showTooltip() {
    final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => _TooltipOverlay(
        message: widget.message,
        targetOffset: offset,
        targetSize: size,
        onDismiss: _hideTooltip,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(widget.duration, () {
      _hideTooltip();
    });
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onLongPress: _showTooltip,
      child: widget.child,
    );
  }
}

class _TooltipOverlay extends StatelessWidget {
  const _TooltipOverlay({
    required this.message,
    required this.targetOffset,
    required this.targetSize,
    required this.onDismiss,
  });

  final String message;
  final Offset targetOffset;
  final Size targetSize;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final theme = ChromiaTheme.of(context);
    final colors = theme.colors;
    final spacing = theme.spacing;

    return GestureDetector(
      onTap: onDismiss,
      behavior: HitTestBehavior.translucent,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              left: targetOffset.dx,
              top: targetOffset.dy + targetSize.height + 8,
              child: Container(
                padding: spacing.paddingM,
                constraints: const BoxConstraints(maxWidth: 200),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: theme.radius.radiusS,
                  boxShadow: theme.shadows.m,
                ),
                child: Text(
                  message,
                  style: theme.typography.bodySmall.copyWith(
                    color: colors.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A help icon with a tooltip
class ChromiaHelpIcon extends StatelessWidget {
  const ChromiaHelpIcon({
    required this.message,
    this.icon = Icons.help_outline,
    this.size,
    this.color,
    super.key,
  });

  /// Tooltip message
  final String message;

  /// Help icon
  final IconData icon;

  /// Icon size
  final double? size;

  /// Icon color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    return ChromiaTooltip(
      message: message,
      child: Icon(
        icon,
        size: size ?? 18,
        color: color ?? colors.textTertiary,
      ),
    );
  }
}
