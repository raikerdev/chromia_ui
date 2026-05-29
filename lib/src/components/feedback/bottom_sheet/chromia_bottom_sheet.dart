import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// Shows a modal bottom sheet with Chromia styling.
///
/// Pass a [ChromiaBottomSheet] as [child] for a fully styled layout with
/// drag handle, title and action buttons:
///
/// ```dart
/// showChromiaBottomSheet(
///   context: context,
///   child: ChromiaBottomSheet(
///     title: 'Choose an option',
///     child: Column(children: [...]),
///   ),
/// );
/// ```
Future<T?> showChromiaBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  bool enableDrag = true,
  bool isScrollControlled = false,
  Color? backgroundColor,
}) {
  final theme = ChromiaTheme.of(context);

  return showModalBottomSheet<T>(
    context: context,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    isScrollControlled: isScrollControlled,
    backgroundColor: backgroundColor ?? theme.colors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(theme.radius.xl),
      ),
    ),
    builder: (context) => child,
  );
}

/// A content layout widget for use inside a bottom sheet.
///
/// Provides a consistent layout with optional drag handle, title,
/// scrollable body and action buttons. Designed to be passed as the
/// [child] of [showChromiaBottomSheet].
///
/// Example usage:
/// ```dart
/// showChromiaBottomSheet(
///   context: context,
///   child: ChromiaBottomSheet(
///     title: 'Share',
///     child: Column(
///       children: [
///         ListTile(leading: Icon(Icons.link), title: Text('Copy link')),
///         ListTile(leading: Icon(Icons.mail), title: Text('Send via email')),
///       ],
///     ),
///     actions: [
///       ChromiaButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
///     ],
///   ),
/// );
/// ```
class ChromiaBottomSheet extends StatelessWidget {
  /// Creates a [ChromiaBottomSheet].
  ///
  /// Provide either [title] or [titleWidget], not both.
  const ChromiaBottomSheet({
    this.title,
    this.titleWidget,
    this.child,
    this.actions,
    this.showDragHandle = true,
    this.padding,
    this.scrollable = false,
    super.key,
  }) : assert(
         title == null || titleWidget == null,
         'Provide either title or titleWidget, not both.',
       );

  /// Title text (mutually exclusive with [titleWidget]).
  final String? title;

  /// Custom title widget (mutually exclusive with [title]).
  final Widget? titleWidget;

  /// The main content.
  final Widget? child;

  /// Action buttons displayed below the content.
  final List<Widget>? actions;

  /// Whether to show the drag handle at the top. Defaults to `true`.
  final bool showDragHandle;

  /// Padding around the sheet content. Defaults to horizontal L + vertical M.
  final EdgeInsetsGeometry? padding;

  /// Whether to wrap content in a [SingleChildScrollView].
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final spacing = theme.spacing;

    final bool hasTitle = title != null || titleWidget != null;
    final bool hasActions = actions != null && actions!.isNotEmpty;

    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showDragHandle) ...[
          Center(
            child: Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                color: colors.onSurfaceVariant.withAlpha(77),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          spacing.gapVM,
        ],
        if (hasTitle) ...[
          DefaultTextStyle(
            style: theme.typography.titleLarge.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
            child: titleWidget ??
                ChromiaText(
                  title!,
                  type: ChromiaTypographyType.titleLarge,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
          spacing.gapVM,
        ],
        ?child,
        if (hasActions) ...[
          spacing.gapVM,
          ...actions!,
        ],
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );

    if (scrollable) {
      content = SingleChildScrollView(child: content);
    }

    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: spacing.l,
            vertical: spacing.m,
          ),
      child: content,
    );
  }
}
