import 'package:chromia_ui/src/components/input/chromia_text_field_style.dart';
import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:chromia_ui/src/theme/chromia_theme_data.dart';
import 'package:chromia_ui/src/tokens/animation_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable text field component that follows the Chromia design system.
///
/// The [ChromiaTextField] provides a consistent text input experience across
/// your application with support for validation, icons, labels, and more.
///
/// Example usage:
/// ```dart
/// ChromiaTextField(
///   label: 'Email',
///   hintText: 'Enter your email',
///   onChanged: (value) => print(value),
/// )
/// ```
class ChromiaTextField extends StatefulWidget {
  const ChromiaTextField({
    this.controller,
    this.focusNode,
    this.initialValue,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.autofocus = false,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.variant = ChromiaTextFieldVariant.filled,
    this.size = ChromiaTextFieldSize.medium,
    this.style,
    super.key,
  });

  /// Controls the text being edited
  final TextEditingController? controller;

  /// Defines the focus for this text field
  final FocusNode? focusNode;

  /// Initial value for the text field
  final String? initialValue;

  /// The label text displayed above the field
  final String? label;

  /// The hint text displayed when the field is empty
  final String? hintText;

  /// Helper text displayed below the field
  final String? helperText;

  /// Error text displayed below the field
  final String? errorText;

  /// Icon displayed at the start of the field
  final Widget? prefixIcon;

  /// Icon displayed at the end of the field
  final Widget? suffixIcon;

  /// Text displayed before the input
  final String? prefixText;

  /// Text displayed after the input
  final String? suffixText;

  /// Whether to obscure the text (for passwords)
  final bool obscureText;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether the field is read-only
  final bool readOnly;

  /// Maximum number of lines
  final int maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum length of input
  final int? maxLength;

  /// The type of keyboard to show
  final TextInputType? keyboardType;

  /// The action button on the keyboard
  final TextInputAction? textInputAction;

  /// How to capitalize text
  final TextCapitalization textCapitalization;

  /// Whether to enable autocorrect
  final bool autocorrect;

  /// Whether to show suggestions
  final bool enableSuggestions;

  /// Whether to autofocus on this field
  final bool autofocus;

  /// Validation function
  final String? Function(String?)? validator;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Called when the text changes
  final ValueChanged<String>? onChanged;

  /// Called when the user submits
  final ValueChanged<String>? onSubmitted;

  /// Called when the field is tapped
  final VoidCallback? onTap;

  /// Called when editing is complete
  final VoidCallback? onEditingComplete;

  /// The text field variant
  final ChromiaTextFieldVariant variant;

  /// The text field size
  final ChromiaTextFieldSize size;

  /// Custom style
  final ChromiaTextFieldStyle? style;

  @override
  State<ChromiaTextField> createState() => _ChromiaTextFieldState();
}

class _ChromiaTextFieldState extends State<ChromiaTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  String? _internalError;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _handleChanged(String value) {
    // Run validation if provided
    if (widget.validator != null) {
      setState(() {
        _internalError = widget.validator!(value);
      });
    }
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final ChromiaThemeData theme = context.chromiaTheme;
    final bool hasError = widget.errorText != null || _internalError != null;
    final String? displayError = widget.errorText ?? _internalError;

    // Get base style for the variant
    final ChromiaTextFieldStyle baseStyle = _getBaseStyle(theme);

    // Apply size modifications
    final ChromiaTextFieldStyle sizedStyle = _applySizeToStyle(baseStyle, theme);

    // Merge with custom style if provided
    final ChromiaTextFieldStyle finalStyle = widget.style != null ? sizedStyle.merge(widget.style) : sizedStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: finalStyle.labelStyle?.copyWith(
              color: hasError ? finalStyle.errorColor : (widget.enabled ? finalStyle.labelColor : finalStyle.disabledTextColor),
            ),
          ),
          SizedBox(height: theme.spacing.xs),
        ],

        // Text field
        AnimatedContainer(
          duration: AnimationTokens.fast,
          curve: AnimationTokens.easeOut,
          decoration: BoxDecoration(
            color: _getFillColor(finalStyle, hasError),
            borderRadius: finalStyle.borderRadius,
            border: Border.all(
              color: _getBorderColor(finalStyle, hasError),
              width: _getBorderWidth(finalStyle),
            ),
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization,
            autocorrect: widget.autocorrect,
            enableSuggestions: widget.enableSuggestions,
            autofocus: widget.autofocus,
            inputFormatters: widget.inputFormatters,
            onChanged: _handleChanged,
            onSubmitted: widget.onSubmitted,
            onTap: widget.onTap,
            onEditingComplete: widget.onEditingComplete,
            style: finalStyle.textStyle?.copyWith(
              color: widget.enabled ? finalStyle.textColor : finalStyle.disabledTextColor,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: finalStyle.hintStyle?.copyWith(
                color: finalStyle.hintColor,
              ),
              prefixIcon: widget.prefixIcon != null
                  ? IconTheme(
                      data: IconThemeData(
                        color: finalStyle.prefixIconColor,
                      ),
                      child: widget.prefixIcon!,
                    )
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? IconTheme(
                      data: IconThemeData(
                        color: finalStyle.suffixIconColor,
                      ),
                      child: widget.suffixIcon!,
                    )
                  : null,
              prefixText: widget.prefixText,
              suffixText: widget.suffixText,
              contentPadding: finalStyle.contentPadding,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              counterText: '',
            ),
          ),
        ),

        // Helper or error text
        if (widget.helperText != null || displayError != null) ...[
          SizedBox(height: theme.spacing.xs),
          Text(
            displayError ?? widget.helperText!,
            style: (hasError ? finalStyle.errorStyle : finalStyle.helperStyle)?.copyWith(
              color: hasError ? finalStyle.errorColor : finalStyle.labelColor,
            ),
          ),
        ],
      ],
    );
  }

  /// Gets the base style for the text field variant
  ChromiaTextFieldStyle _getBaseStyle(ChromiaThemeData theme) {
    return switch (widget.variant) {
      ChromiaTextFieldVariant.filled => ChromiaTextFieldStyle.filled(theme),
      ChromiaTextFieldVariant.outlined => ChromiaTextFieldStyle.outlined(theme),
    };
  }

  /// Applies size modifications to the style
  ChromiaTextFieldStyle _applySizeToStyle(
    ChromiaTextFieldStyle style,
    ChromiaThemeData theme,
  ) {
    return switch (widget.size) {
      ChromiaTextFieldSize.small => style.copyWith(
        contentPadding: EdgeInsets.symmetric(
          horizontal: theme.spacing.m,
          vertical: theme.spacing.s,
        ),
        textStyle: theme.typography.bodySmall,
      ),
      ChromiaTextFieldSize.medium => style,
      ChromiaTextFieldSize.large => style.copyWith(
        contentPadding: EdgeInsets.symmetric(
          horizontal: theme.spacing.xl,
          vertical: theme.spacing.l,
        ),
        textStyle: theme.typography.bodyLarge,
      ),
    };
  }

  /// Gets the current fill color based on state
  Color _getFillColor(ChromiaTextFieldStyle style, bool hasError) {
    if (!widget.enabled) {
      return style.disabledFillColor ?? Colors.grey.shade200;
    }
    if (hasError) {
      return style.errorFillColor ?? Colors.red.shade50;
    }
    if (_isFocused) {
      return style.focusedFillColor ?? style.fillColor ?? Colors.grey.shade100;
    }
    return style.fillColor ?? Colors.grey.shade100;
  }

  /// Gets the current border color based on state
  Color _getBorderColor(ChromiaTextFieldStyle style, bool hasError) {
    if (!widget.enabled) {
      return style.disabledBorderColor ?? Colors.grey.shade400;
    }
    if (hasError) {
      return style.errorBorderColor ?? Colors.red;
    }
    if (_isFocused) {
      return style.focusedBorderColor ?? Colors.blue;
    }
    return style.borderColor ?? Colors.grey.shade400;
  }

  /// Gets the current border width based on state
  double _getBorderWidth(ChromiaTextFieldStyle style) {
    if (_isFocused) {
      return style.focusedBorderWidth ?? 2.0;
    }
    return style.borderWidth ?? 1.0;
  }
}
