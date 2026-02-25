import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// Shows a customizable dialog.
///
/// Example usage:
/// ```dart
/// await showChromiaDialog(
///   context: context,
///   title: 'Confirm Action',
///   content: 'Are you sure you want to continue?',
///   actions: [
///     ChromiaDialogAction(
///       label: 'Cancel',
///       onPressed: () => Navigator.pop(context),
///     ),
///     ChromiaDialogAction(
///       label: 'Confirm',
///       isPrimary: true,
///       onPressed: () => Navigator.pop(context, true),
///     ),
///   ],
/// );
/// ```
Future<T?> showChromiaDialog<T>({
  required BuildContext context,
  String? title,
  Widget? titleWidget,
  String? content,
  Widget? contentWidget,
  List<ChromiaDialogAction>? actions,
  bool barrierDismissible = true,
  Color? barrierColor,
  double? width,
  EdgeInsetsGeometry? contentPadding,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    builder: (context) => ChromiaDialog(
      title: title,
      titleWidget: titleWidget,
      content: content,
      contentWidget: contentWidget,
      actions: actions,
      width: width,
      contentPadding: contentPadding,
    ),
  );
}

/// A customizable dialog component.
class ChromiaDialog extends StatelessWidget {
  const ChromiaDialog({
    this.title,
    this.titleWidget,
    this.content,
    this.contentWidget,
    this.actions,
    this.width,
    this.contentPadding,
    super.key,
  });

  /// Title text
  final String? title;

  /// Custom title widget
  final Widget? titleWidget;

  /// Content text
  final String? content;

  /// Custom content widget
  final Widget? contentWidget;

  /// Action buttons
  final List<ChromiaDialogAction>? actions;

  /// Width of the dialog
  final double? width;

  /// Padding for content
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final radius = theme.radius;

    return Dialog(
      backgroundColor: colors.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: radius.radiusXL,
      ),
      child: Container(
        width: width ?? 400,
        padding: spacing.paddingXXL,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            if (title != null || titleWidget != null) ...[
              titleWidget ??
                  ChromiaText(
                    title!,
                    type: ChromiaTypographyType.headlineSmall,
                    color: colors.textPrimary,
                  ),
              spacing.gapVL,
            ],

            // Content
            if (content != null || contentWidget != null) ...[
              Padding(
                padding: contentPadding ?? EdgeInsets.zero,
                child:
                    contentWidget ??
                    ChromiaText(
                      content!,
                      type: ChromiaTypographyType.bodyMedium,
                      color: colors.textSecondary,
                    ),
              ),
              spacing.gapVXL,
            ],

            // Actions
            if (actions != null && actions!.isNotEmpty) _buildActions(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context, ChromiaThemeData theme) {
    final spacing = theme.spacing;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (int i = 0; i < actions!.length; i++) ...[
          _ActionButton(action: actions![i]),
          if (i < actions!.length - 1) spacing.gapHM,
        ],
      ],
    );
  }
}

/// An action button for dialogs.
class ChromiaDialogAction {
  const ChromiaDialogAction({
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
    this.isDestructive = false,
  });

  /// Button label
  final String label;

  /// Callback when pressed
  final VoidCallback onPressed;

  /// Whether this is the primary action
  final bool isPrimary;

  /// Whether this is a destructive action (shown in red)
  final bool isDestructive;
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.action});

  final ChromiaDialogAction action;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    Color? backgroundColor;
    Color? textColor;

    if (action.isPrimary) {
      backgroundColor = colors.primary;
      textColor = colors.onPrimary;
    } else if (action.isDestructive) {
      backgroundColor = Colors.transparent;
      textColor = colors.error;
    } else {
      backgroundColor = Colors.transparent;
      textColor = colors.textPrimary;
    }

    return InkWell(
      onTap: action.onPressed,
      borderRadius: theme.radius.radiusM,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.l,
          vertical: spacing.m,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: theme.radius.radiusM,
        ),
        child: Text(
          action.label,
          style: theme.typography.labelMedium.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

/// Shows an alert dialog with a single action.
Future<void> showChromiaAlert({
  required BuildContext context,
  required String title,
  required String message,
  String actionLabel = 'OK',
  VoidCallback? onPressed,
}) {
  return showChromiaDialog(
    context: context,
    title: title,
    content: message,
    actions: [
      ChromiaDialogAction(
        label: actionLabel,
        isPrimary: true,
        onPressed: onPressed ?? () => Navigator.pop(context),
      ),
    ],
  );
}

/// Shows a confirmation dialog with cancel and confirm actions.
Future<bool> showChromiaConfirmDialog({
  required BuildContext context,
  required String title,
  required String message,
  String cancelLabel = 'Cancel',
  String confirmLabel = 'Confirm',
  bool isDestructive = false,
}) async {
  final result = await showChromiaDialog<bool>(
    context: context,
    title: title,
    content: message,
    actions: [
      ChromiaDialogAction(
        label: cancelLabel,
        onPressed: () => Navigator.pop(context, false),
      ),
      ChromiaDialogAction(
        label: confirmLabel,
        isPrimary: !isDestructive,
        isDestructive: isDestructive,
        onPressed: () => Navigator.pop(context, true),
      ),
    ],
  );

  return result ?? false;
}

/// Shows a bottom sheet dialog.
Future<T?> showChromiaBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  bool enableDrag = true,
  Color? backgroundColor,
}) {
  final theme = ChromiaTheme.of(context);

  return showModalBottomSheet<T>(
    context: context,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: backgroundColor ?? theme.colors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(theme.radius.xl),
      ),
    ),
    builder: (context) => child,
  );
}

/// A loading dialog that shows a progress indicator.
class ChromiaLoadingDialog extends StatelessWidget {
  const ChromiaLoadingDialog({
    this.message,
    super.key,
  });

  /// Loading message
  final String? message;

  /// Shows the loading dialog
  static Future<void> show({
    required BuildContext context,
    String? message,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ChromiaLoadingDialog(message: message),
    );
  }

  /// Hides the loading dialog
  static void hide(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Dialog(
      backgroundColor: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: theme.radius.radiusL,
      ),
      child: Padding(
        padding: spacing.paddingXXL,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
            ),
            if (message != null) ...[
              spacing.gapVL,
              Text(
                message!,
                style: theme.typography.bodyMedium.copyWith(
                  color: colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
