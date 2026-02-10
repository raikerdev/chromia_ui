import 'package:chromia_ui/src/theme/chromia_theme_data.dart';
import 'package:flutter/material.dart';

/// Defines the visual properties of a button.
///
/// This class encapsulates all the styling information for a button,
/// including colors, padding, border radius, and elevation.
class ChromiaButtonStyle {
  const ChromiaButtonStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.hoverBackgroundColor,
    this.pressedBackgroundColor,
    this.borderColor,
    this.disabledBorderColor,
    this.hoverBorderColor,
    this.borderWidth,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.textStyle,
    this.minimumSize,
    this.maximumSize,
  });

  /// The background color of the button
  final Color? backgroundColor;

  /// The foreground color (text and icon) of the button
  final Color? foregroundColor;

  /// The background color when the button is disabled
  final Color? disabledBackgroundColor;

  /// The foreground color when the button is disabled
  final Color? disabledForegroundColor;

  /// The background color when the button is hovered
  final Color? hoverBackgroundColor;

  /// The background color when the button is pressed
  final Color? pressedBackgroundColor;

  /// The border color of the button
  final Color? borderColor;

  /// The border color when the button is disabled
  final Color? disabledBorderColor;

  /// The border color when the button is hovered
  final Color? hoverBorderColor;

  /// The width of the button border
  final double? borderWidth;

  /// The padding inside the button
  final EdgeInsetsGeometry? padding;

  /// The border radius of the button
  final BorderRadius? borderRadius;

  /// The elevation of the button
  final double? elevation;

  /// The text style for the button label
  final TextStyle? textStyle;

  /// The minimum size of the button
  final Size? minimumSize;

  /// The maximum size of the button
  final Size? maximumSize;

  /// Creates a filled button style (primary variant)
  factory ChromiaButtonStyle.filled(ChromiaThemeData theme) {
    return ChromiaButtonStyle(
      backgroundColor: theme.colors.primary,
      foregroundColor: theme.colors.onPrimary,
      disabledBackgroundColor: theme.colors.primaryDisabled,
      disabledForegroundColor: theme.colors.textDisabled,
      hoverBackgroundColor: theme.colors.primaryHover,
      pressedBackgroundColor: theme.colors.primaryPressed,
      borderRadius: theme.radius.radiusM,
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.l,
        vertical: theme.spacing.m,
      ),
      elevation: 0,
      textStyle: theme.typography.labelLarge,
      minimumSize: const Size(64, 40),
    );
  }

  /// Creates an outlined button style
  factory ChromiaButtonStyle.outlined(ChromiaThemeData theme) {
    return ChromiaButtonStyle(
      backgroundColor: theme.colors.transparent,
      foregroundColor: theme.colors.primary,
      disabledBackgroundColor: theme.colors.transparent,
      disabledForegroundColor: theme.colors.textDisabled,
      hoverBackgroundColor: theme.colors.surfaceHover,
      pressedBackgroundColor: theme.colors.surfacePressed,
      borderColor: theme.colors.primary,
      disabledBorderColor: theme.colors.border,
      hoverBorderColor: theme.colors.primaryHover,
      borderWidth: 1.5,
      borderRadius: theme.radius.radiusM,
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.l,
        vertical: theme.spacing.m,
      ),
      elevation: 0,
      textStyle: theme.typography.labelLarge,
      minimumSize: const Size(64, 40),
    );
  }

  /// Creates a text button style (ghost variant)
  factory ChromiaButtonStyle.text(ChromiaThemeData theme) {
    return ChromiaButtonStyle(
      backgroundColor: theme.colors.transparent,
      foregroundColor: theme.colors.primary,
      disabledBackgroundColor: theme.colors.transparent,
      disabledForegroundColor: theme.colors.textDisabled,
      hoverBackgroundColor: theme.colors.surfaceHover,
      pressedBackgroundColor: theme.colors.surfacePressed,
      borderRadius: theme.radius.radiusM,
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.l,
        vertical: theme.spacing.m,
      ),
      elevation: 0,
      textStyle: theme.typography.labelLarge,
      minimumSize: const Size(64, 40),
    );
  }

  /// Creates a tonal button style (filled with lower emphasis)
  factory ChromiaButtonStyle.tonal(ChromiaThemeData theme) {
    return ChromiaButtonStyle(
      backgroundColor: theme.colors.surfaceContainerHigh,
      foregroundColor: theme.colors.primary,
      disabledBackgroundColor: theme.colors.surfaceVariant,
      disabledForegroundColor: theme.colors.textDisabled,
      hoverBackgroundColor: theme.colors.surfaceContainerHighest,
      pressedBackgroundColor: theme.colors.surfaceContainer,
      borderRadius: theme.radius.radiusM,
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.l,
        vertical: theme.spacing.m,
      ),
      elevation: 0,
      textStyle: theme.typography.labelLarge,
      minimumSize: const Size(64, 40),
    );
  }

  /// Creates an elevated button style
  factory ChromiaButtonStyle.elevated(ChromiaThemeData theme) {
    return ChromiaButtonStyle(
      backgroundColor: theme.colors.surface,
      foregroundColor: theme.colors.primary,
      disabledBackgroundColor: theme.colors.surfaceVariant,
      disabledForegroundColor: theme.colors.textDisabled,
      hoverBackgroundColor: theme.colors.surfaceHover,
      pressedBackgroundColor: theme.colors.surfacePressed,
      borderRadius: theme.radius.radiusM,
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.l,
        vertical: theme.spacing.m,
      ),
      elevation: 2,
      textStyle: theme.typography.labelLarge,
      minimumSize: const Size(64, 40),
    );
  }

  /// Creates a copy of this style with the given fields replaced
  ChromiaButtonStyle copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? hoverBackgroundColor,
    Color? pressedBackgroundColor,
    Color? borderColor,
    Color? disabledBorderColor,
    Color? hoverBorderColor,
    double? borderWidth,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
    double? elevation,
    TextStyle? textStyle,
    Size? minimumSize,
    Size? maximumSize,
  }) {
    return ChromiaButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor ?? this.disabledForegroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      pressedBackgroundColor: pressedBackgroundColor ?? this.pressedBackgroundColor,
      borderColor: borderColor ?? this.borderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      hoverBorderColor: hoverBorderColor ?? this.hoverBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      textStyle: textStyle ?? this.textStyle,
      minimumSize: minimumSize ?? this.minimumSize,
      maximumSize: maximumSize ?? this.maximumSize,
    );
  }

  /// Merges this style with another style
  ChromiaButtonStyle merge(ChromiaButtonStyle? other) {
    if (other == null) {
      return this;
    }

    return copyWith(
      backgroundColor: other.backgroundColor,
      foregroundColor: other.foregroundColor,
      disabledBackgroundColor: other.disabledBackgroundColor,
      disabledForegroundColor: other.disabledForegroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      pressedBackgroundColor: other.pressedBackgroundColor,
      borderColor: other.borderColor,
      disabledBorderColor: other.disabledBorderColor,
      hoverBorderColor: other.hoverBorderColor,
      borderWidth: other.borderWidth,
      padding: other.padding,
      borderRadius: other.borderRadius,
      elevation: other.elevation,
      textStyle: other.textStyle,
      minimumSize: other.minimumSize,
      maximumSize: other.maximumSize,
    );
  }
}

/// Enum for button variants
enum ChromiaButtonVariant {
  /// Filled button with solid background (default)
  filled,

  /// Outlined button with border
  outlined,

  /// Text button without background or border
  text,

  /// Tonal button with subtle background
  tonal,

  /// Elevated button with shadow
  elevated,
}

/// Enum for button sizes
enum ChromiaButtonSize {
  /// Small button
  small,

  /// Medium button (default)
  medium,

  /// Large button
  large,
}
