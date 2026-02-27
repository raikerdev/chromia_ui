import 'package:chromia_ui/src/components/input/button/chromia_button_style.dart';
import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:chromia_ui/src/theme/chromia_theme_data.dart';
import 'package:chromia_ui/src/tokens/animation_tokens.dart';
import 'package:flutter/material.dart';

/// A customizable button component that follows the Chromia design system.
///
/// The [ChromiaButton] is a versatile button that supports multiple variants,
/// sizes, and states. It automatically adapts to the current theme and provides
/// smooth animations and interactions.
///
/// Example usage:
/// ```dart
/// ChromiaButton(
///   onPressed: () => print('Button pressed'),
///   child: Text('Click me'),
/// )
/// ```
///
/// With custom styling:
/// ```dart
/// ChromiaButton(
///   variant: ChromiaButtonVariant.outlined,
///   size: ChromiaButtonSize.large,
///   onPressed: () => print('Button pressed'),
///   child: Text('Outlined Button'),
/// )
/// ```
class ChromiaButton extends StatefulWidget {
  const ChromiaButton({
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.variant = ChromiaButtonVariant.filled,
    this.size = ChromiaButtonSize.medium,
    this.style,
    this.isFullWidth = false,
    this.isLoading = false,
    this.loadingWidget,
    this.icon,
    this.iconPosition = IconPosition.leading,
    this.iconSpacing,
    super.key,
  });

  /// Callback when the button is pressed.
  /// If null, the button will be disabled.
  final VoidCallback? onPressed;

  /// Callback when the button is long pressed
  final VoidCallback? onLongPress;

  /// The widget to display as the button content
  final Widget child;

  /// The button variant (filled, outlined, text, tonal, elevated)
  final ChromiaButtonVariant variant;

  /// The button size (small, medium, large)
  final ChromiaButtonSize size;

  /// Custom button style to override default styling
  final ChromiaButtonStyle? style;

  /// Whether the button should take full available width
  final bool isFullWidth;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Custom loading widget (defaults to CircularProgressIndicator)
  final Widget? loadingWidget;

  /// Optional icon to display alongside the child
  final Widget? icon;

  /// Position of the icon relative to the child
  final IconPosition iconPosition;

  /// Spacing between icon and child
  final double? iconSpacing;

  @override
  State<ChromiaButton> createState() => _ChromiaButtonState();
}

class _ChromiaButtonState extends State<ChromiaButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final ChromiaThemeData theme = context.chromiaTheme;
    final bool isEnabled = widget.onPressed != null && !widget.isLoading;

    // Get base style for the variant
    final ChromiaButtonStyle baseStyle = _getBaseStyle(theme);

    // Apply size modifications
    final ChromiaButtonStyle sizedStyle = _applySizeToStyle(baseStyle, theme);

    // Merge with custom style if provided
    final ChromiaButtonStyle finalStyle = widget.style != null ? sizedStyle.merge(widget.style) : sizedStyle;

    // Determine current background color based on state
    final Color backgroundColor = _getBackgroundColor(finalStyle, isEnabled);
    final Color foregroundColor = _getForegroundColor(finalStyle, isEnabled);
    final Color? borderColor = _getBorderColor(finalStyle, isEnabled);

    return MouseRegion(
      onEnter: isEnabled ? (_) => setState(() => _isHovered = true) : null,
      onExit: isEnabled ? (_) => setState(() => _isHovered = false) : null,
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
        onTapUp: isEnabled ? (_) => setState(() => _isPressed = false) : null,
        onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
        onTap: isEnabled ? widget.onPressed : null,
        onLongPress: isEnabled ? widget.onLongPress : null,
        child: AnimatedContainer(
          duration: AnimationTokens.fast,
          curve: AnimationTokens.easeOut,
          constraints: BoxConstraints(
            minWidth: finalStyle.minimumSize?.width ?? 0,
            minHeight: finalStyle.minimumSize?.height ?? 0,
            maxWidth: widget.isFullWidth ? double.infinity : (finalStyle.maximumSize?.width ?? double.infinity),
            maxHeight: finalStyle.maximumSize?.height ?? double.infinity,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: finalStyle.borderRadius,
            border: borderColor != null && finalStyle.borderWidth != null
                ? Border.all(
                    color: borderColor,
                    width: finalStyle.borderWidth!,
                  )
                : null,
            boxShadow: finalStyle.elevation != null && finalStyle.elevation! > 0
                ? [
                    BoxShadow(
                      color: theme.colors.shadow.withAlpha(25),
                      blurRadius: finalStyle.elevation! * 2,
                      offset: Offset(0, finalStyle.elevation!),
                    ),
                  ]
                : null,
          ),
          padding: finalStyle.padding,
          child: _buildButtonContent(
            theme,
            foregroundColor,
            finalStyle.textStyle,
          ),
        ),
      ),
    );
  }

  /// Builds the button content with optional icon and loading state
  Widget _buildButtonContent(
    ChromiaThemeData theme,
    Color foregroundColor,
    TextStyle? textStyle,
  ) {
    if (widget.isLoading) {
      return _buildLoadingContent(theme, foregroundColor);
    }

    if (widget.icon != null) {
      return _buildContentWithIcon(theme, foregroundColor, textStyle);
    }

    return _buildContent(foregroundColor, textStyle);
  }

  /// Builds loading state content
  Widget _buildLoadingContent(ChromiaThemeData theme, Color foregroundColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child:
              widget.loadingWidget ??
              CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
              ),
        ),
        SizedBox(width: theme.spacing.s),
        DefaultTextStyle(
          style: TextStyle(color: foregroundColor),
          child: widget.child,
        ),
      ],
    );
  }

  /// Builds content with icon
  Widget _buildContentWithIcon(
    ChromiaThemeData theme,
    Color foregroundColor,
    TextStyle? textStyle,
  ) {
    final double spacing = widget.iconSpacing ?? theme.spacing.s;

    final Widget iconWidget = IconTheme(
      data: IconThemeData(color: foregroundColor, size: 20),
      child: widget.icon!,
    );

    final Widget textWidget = DefaultTextStyle(
      style: textStyle?.copyWith(color: foregroundColor) ?? TextStyle(color: foregroundColor),
      child: widget.child,
    );

    if (widget.iconPosition == IconPosition.leading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          SizedBox(width: spacing),
          textWidget,
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textWidget,
          SizedBox(width: spacing),
          iconWidget,
        ],
      );
    }
  }

  /// Builds content without icon
  Widget _buildContent(Color foregroundColor, TextStyle? textStyle) {
    return DefaultTextStyle(
      style: textStyle?.copyWith(color: foregroundColor) ?? TextStyle(color: foregroundColor),
      textAlign: TextAlign.center,
      child: widget.child,
    );
  }

  /// Gets the base style for the button variant
  ChromiaButtonStyle _getBaseStyle(ChromiaThemeData theme) {
    return switch (widget.variant) {
      ChromiaButtonVariant.filled => ChromiaButtonStyle.filled(theme),
      ChromiaButtonVariant.outlined => ChromiaButtonStyle.outlined(theme),
      ChromiaButtonVariant.text => ChromiaButtonStyle.text(theme),
      ChromiaButtonVariant.tonal => ChromiaButtonStyle.tonal(theme),
      ChromiaButtonVariant.elevated => ChromiaButtonStyle.elevated(theme),
    };
  }

  /// Applies size modifications to the style
  ChromiaButtonStyle _applySizeToStyle(
    ChromiaButtonStyle style,
    ChromiaThemeData theme,
  ) {
    return switch (widget.size) {
      ChromiaButtonSize.small => style.copyWith(
        borderRadius: theme.radius.radiusM,
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacing.m,
          vertical: theme.spacing.s,
        ),
        minimumSize: const Size(48, 32),
        textStyle: theme.typography.labelSmall,
      ),
      ChromiaButtonSize.medium => style,
      ChromiaButtonSize.large => style.copyWith(
        borderRadius: theme.radius.radiusXL,
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacing.xl,
          vertical: theme.spacing.l,
        ),
        minimumSize: const Size(80, 48),
        textStyle: theme.typography.labelLarge,
      ),
    };
  }

  /// Gets the current background color based on state
  Color _getBackgroundColor(ChromiaButtonStyle style, bool isEnabled) {
    if (!isEnabled) {
      return style.disabledBackgroundColor ?? Colors.grey.shade300;
    }
    if (_isPressed) {
      return style.pressedBackgroundColor ?? style.backgroundColor ?? Colors.blue;
    }
    if (_isHovered) {
      return style.hoverBackgroundColor ?? style.backgroundColor ?? Colors.blue;
    }
    return style.backgroundColor ?? Colors.blue;
  }

  /// Gets the current foreground color based on state
  Color _getForegroundColor(ChromiaButtonStyle style, bool isEnabled) {
    if (!isEnabled) {
      return style.disabledForegroundColor ?? Colors.grey.shade600;
    }
    return style.foregroundColor ?? Colors.white;
  }

  /// Gets the current border color based on state
  Color? _getBorderColor(ChromiaButtonStyle style, bool isEnabled) {
    if (style.borderColor == null) {
      return null;
    }

    if (!isEnabled) {
      return style.disabledBorderColor ?? Colors.grey.shade400;
    }
    if (_isHovered) {
      return style.hoverBorderColor ?? style.borderColor;
    }
    return style.borderColor;
  }
}

/// Position of the icon relative to the button text
enum IconPosition {
  /// Icon appears before the text
  leading,

  /// Icon appears after the text
  trailing,
}
