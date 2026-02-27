import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:flutter/material.dart';

/// Shows a customizable snack_bar.
///
/// Example usage:
/// ```dart
/// showChromiaSnackBar(
///   context: context,
///   message: 'Item added to cart',
/// )
///
/// showChromiaSnackBar.success(
///   context: context,
///   message: 'Changes saved successfully',
/// )
/// ```
void showChromiaSnackBar({
  required BuildContext context,
  required String message,
  String? actionLabel,
  VoidCallback? onActionPressed,
  Duration duration = const Duration(seconds: 4),
  SnackBarBehavior behavior = SnackBarBehavior.floating,
  Color? backgroundColor,
  Color? textColor,
  IconData? icon,
}) {
  final theme = ChromiaTheme.of(context);
  final colors = theme.colors;
  final spacing = theme.spacing;

  final snackBar = SnackBar(
    content: Row(
      children: [
        if (icon != null) ...[
          Icon(icon, color: textColor ?? colors.onPrimary, size: 20),
          spacing.gapHM,
        ],
        Expanded(
          child: Text(
            message,
            style: theme.typography.bodyMedium.copyWith(
              color: textColor ?? colors.onPrimary,
            ),
          ),
        ),
      ],
    ),
    action: actionLabel != null
        ? SnackBarAction(
            label: actionLabel,
            textColor: textColor ?? colors.onPrimary,
            onPressed: onActionPressed ?? () {},
          )
        : null,
    duration: duration,
    behavior: behavior,
    backgroundColor: backgroundColor ?? colors.shadow,
    shape: RoundedRectangleBorder(
      borderRadius: theme.radius.radiusM,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

/// Extension to add convenience methods
extension ChromiaSnackBarExtension on BuildContext {
  /// Shows a success snack_bar
  void showSuccessSnackBar({
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
  }) {
    final theme = ChromiaTheme.of(this);
    final colors = theme.colors;

    showChromiaSnackBar(
      context: this,
      message: message,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
      backgroundColor: colors.success,
      textColor: colors.onPrimary,
      icon: Icons.check_circle,
    );
  }

  /// Shows an error snack_bar
  void showErrorSnackBar({
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
  }) {
    final theme = ChromiaTheme.of(this);
    final colors = theme.colors;

    showChromiaSnackBar(
      context: this,
      message: message,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
      backgroundColor: colors.error,
      textColor: colors.onPrimary,
      icon: Icons.error,
    );
  }

  /// Shows a warning snack_bar
  void showWarningSnackBar({
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
  }) {
    final theme = ChromiaTheme.of(this);
    final colors = theme.colors;

    showChromiaSnackBar(
      context: this,
      message: message,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
      backgroundColor: colors.warning,
      textColor: colors.onPrimary,
      icon: Icons.warning,
    );
  }

  /// Shows an info snack_bar
  void showInfoSnackBar({
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
  }) {
    final theme = ChromiaTheme.of(this);
    final colors = theme.colors;

    showChromiaSnackBar(
      context: this,
      message: message,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
      backgroundColor: colors.info,
      textColor: colors.onPrimary,
      icon: Icons.info,
    );
  }
}
