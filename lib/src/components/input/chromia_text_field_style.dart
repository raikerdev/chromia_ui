import 'package:chromia_ui/src/theme/chromia_theme_data.dart';
import 'package:flutter/material.dart';

/// Defines the visual properties of a text field.
///
/// This class encapsulates all the styling information for a text field,
/// including colors, padding, border radius, and text styles.
class ChromiaTextFieldStyle {
  const ChromiaTextFieldStyle({
    this.fillColor,
    this.focusedFillColor,
    this.errorFillColor,
    this.disabledFillColor,
    this.textColor,
    this.hintColor,
    this.labelColor,
    this.errorColor,
    this.disabledTextColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.borderWidth,
    this.focusedBorderWidth,
    this.borderRadius,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.helperStyle,
    this.prefixIconColor,
    this.suffixIconColor,
  });

  /// The fill color of the text field
  final Color? fillColor;

  /// The fill color when the text field is focused
  final Color? focusedFillColor;

  /// The fill color when the text field has an error
  final Color? errorFillColor;

  /// The fill color when the text field is disabled
  final Color? disabledFillColor;

  /// The text color
  final Color? textColor;

  /// The hint text color
  final Color? hintColor;

  /// The label text color
  final Color? labelColor;

  /// The error text color
  final Color? errorColor;

  /// The text color when disabled
  final Color? disabledTextColor;

  /// The border color
  final Color? borderColor;

  /// The border color when focused
  final Color? focusedBorderColor;

  /// The border color when there's an error
  final Color? errorBorderColor;

  /// The border color when disabled
  final Color? disabledBorderColor;

  /// The width of the border
  final double? borderWidth;

  /// The width of the border when focused
  final double? focusedBorderWidth;

  /// The border radius
  final BorderRadius? borderRadius;

  /// The padding inside the text field
  final EdgeInsetsGeometry? contentPadding;

  /// The text style
  final TextStyle? textStyle;

  /// The hint text style
  final TextStyle? hintStyle;

  /// The label text style
  final TextStyle? labelStyle;

  /// The error text style
  final TextStyle? errorStyle;

  /// The helper text style
  final TextStyle? helperStyle;

  /// The color of the prefix icon
  final Color? prefixIconColor;

  /// The color of the suffix icon
  final Color? suffixIconColor;

  /// Creates a filled text field style
  factory ChromiaTextFieldStyle.filled(ChromiaThemeData theme) {
    return ChromiaTextFieldStyle(
      fillColor: theme.colors.surfaceContainer,
      focusedFillColor: theme.colors.surfaceContainerHigh,
      errorFillColor: theme.colors.surfaceContainer,
      disabledFillColor: theme.colors.surfaceVariant,
      textColor: theme.colors.textPrimary,
      hintColor: theme.colors.textTertiary,
      labelColor: theme.colors.textSecondary,
      errorColor: theme.colors.error,
      disabledTextColor: theme.colors.textDisabled,
      borderColor: theme.colors.border,
      focusedBorderColor: theme.colors.primary,
      errorBorderColor: theme.colors.error,
      disabledBorderColor: theme.colors.border,
      borderWidth: 1.0,
      focusedBorderWidth: 2.0,
      borderRadius: theme.radius.radiusM,
      contentPadding: EdgeInsets.symmetric(
        horizontal: theme.spacing.l,
        vertical: theme.spacing.m,
      ),
      textStyle: theme.typography.bodyMedium,
      hintStyle: theme.typography.bodyMedium,
      labelStyle: theme.typography.bodySmall,
      errorStyle: theme.typography.bodySmall,
      helperStyle: theme.typography.bodySmall,
      prefixIconColor: theme.colors.textSecondary,
      suffixIconColor: theme.colors.textSecondary,
    );
  }

  /// Creates an outlined text field style
  factory ChromiaTextFieldStyle.outlined(ChromiaThemeData theme) {
    return ChromiaTextFieldStyle(
      fillColor: theme.colors.transparent,
      focusedFillColor: theme.colors.transparent,
      errorFillColor: theme.colors.transparent,
      disabledFillColor: theme.colors.surfaceVariant,
      textColor: theme.colors.textPrimary,
      hintColor: theme.colors.textTertiary,
      labelColor: theme.colors.textSecondary,
      errorColor: theme.colors.error,
      disabledTextColor: theme.colors.textDisabled,
      borderColor: theme.colors.border,
      focusedBorderColor: theme.colors.primary,
      errorBorderColor: theme.colors.error,
      disabledBorderColor: theme.colors.border,
      borderWidth: 1.5,
      focusedBorderWidth: 2.0,
      borderRadius: theme.radius.radiusM,
      contentPadding: EdgeInsets.symmetric(
        horizontal: theme.spacing.l,
        vertical: theme.spacing.m,
      ),
      textStyle: theme.typography.bodyMedium,
      hintStyle: theme.typography.bodyMedium,
      labelStyle: theme.typography.bodySmall,
      errorStyle: theme.typography.bodySmall,
      helperStyle: theme.typography.bodySmall,
      prefixIconColor: theme.colors.textSecondary,
      suffixIconColor: theme.colors.textSecondary,
    );
  }

  /// Creates a copy of this style with the given fields replaced
  ChromiaTextFieldStyle copyWith({
    Color? fillColor,
    Color? focusedFillColor,
    Color? errorFillColor,
    Color? disabledFillColor,
    Color? textColor,
    Color? hintColor,
    Color? labelColor,
    Color? errorColor,
    Color? disabledTextColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? disabledBorderColor,
    double? borderWidth,
    double? focusedBorderWidth,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    Color? prefixIconColor,
    Color? suffixIconColor,
  }) {
    return ChromiaTextFieldStyle(
      fillColor: fillColor ?? this.fillColor,
      focusedFillColor: focusedFillColor ?? this.focusedFillColor,
      errorFillColor: errorFillColor ?? this.errorFillColor,
      disabledFillColor: disabledFillColor ?? this.disabledFillColor,
      textColor: textColor ?? this.textColor,
      hintColor: hintColor ?? this.hintColor,
      labelColor: labelColor ?? this.labelColor,
      errorColor: errorColor ?? this.errorColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      focusedBorderWidth: focusedBorderWidth ?? this.focusedBorderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      contentPadding: contentPadding ?? this.contentPadding,
      textStyle: textStyle ?? this.textStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      helperStyle: helperStyle ?? this.helperStyle,
      prefixIconColor: prefixIconColor ?? this.prefixIconColor,
      suffixIconColor: suffixIconColor ?? this.suffixIconColor,
    );
  }

  /// Merges this style with another style
  ChromiaTextFieldStyle merge(ChromiaTextFieldStyle? other) {
    if (other == null) {
      return this;
    }
    return copyWith(
      fillColor: other.fillColor,
      focusedFillColor: other.focusedFillColor,
      errorFillColor: other.errorFillColor,
      disabledFillColor: other.disabledFillColor,
      textColor: other.textColor,
      hintColor: other.hintColor,
      labelColor: other.labelColor,
      errorColor: other.errorColor,
      disabledTextColor: other.disabledTextColor,
      borderColor: other.borderColor,
      focusedBorderColor: other.focusedBorderColor,
      errorBorderColor: other.errorBorderColor,
      disabledBorderColor: other.disabledBorderColor,
      borderWidth: other.borderWidth,
      focusedBorderWidth: other.focusedBorderWidth,
      borderRadius: other.borderRadius,
      contentPadding: other.contentPadding,
      textStyle: other.textStyle,
      hintStyle: other.hintStyle,
      labelStyle: other.labelStyle,
      errorStyle: other.errorStyle,
      helperStyle: other.helperStyle,
      prefixIconColor: other.prefixIconColor,
      suffixIconColor: other.suffixIconColor,
    );
  }
}

/// Enum for text field variants
enum ChromiaTextFieldVariant {
  /// Filled text field with background
  filled,

  /// Outlined text field with border
  outlined,
}

/// Enum for text field sizes
enum ChromiaTextFieldSize {
  /// Small text field
  small,

  /// Medium text field (default)
  medium,

  /// Large text field
  large,
}
