import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable toggle button component that follows the Chromia design system.
///
/// The [ChromiaToggleButton] is a widget that toggle the state of a single setting on or off.
///
/// Example usage:
/// ```dart
/// ChromiaToggleButton(
///   value: isEnabled,
///   onChanged: (value) => setState(() => isEnabled = value),
/// )
/// ```
class ChromiaToggleButton extends StatefulWidget {
  const ChromiaToggleButton({
    required this.value,
    required this.onChanged,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.size = ChromiaToggleButtonSize.medium,
    super.key,
  });

  /// Whether the toggle button is on or off
  final bool value;

  /// Called when the user toggles the toggle button
  final ValueChanged<bool>? onChanged;

  /// Optional label text
  final String? label;

  /// Color when the toggle button is on
  final Color? activeColor;

  /// Color when the toggle button is off
  final Color? inactiveColor;

  /// Color of the thumb
  final Color? thumbColor;

  /// Size of the toggle button
  final ChromiaToggleButtonSize size;

  @override
  State<ChromiaToggleButton> createState() => _ChromiaToggleButtonState();
}

class _ChromiaToggleButtonState extends State<ChromiaToggleButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AnimationTokens.fast,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: AnimationTokens.easeOut,
    );

    if (widget.value) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(ChromiaToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.onChanged != null) {
      widget.onChanged!(!widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final bool isEnabled = widget.onChanged != null;

    if (widget.label != null) {
      return InkWell(
        onTap: isEnabled ? _handleTap : null,
        borderRadius: theme.radius.radiusS,
        child: Padding(
          padding: spacing.paddingXS,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildToggleButton(context, isEnabled, colors),
              spacing.gapHM,
              Flexible(
                child: ChromiaText(
                  widget.label!,
                  type: ChromiaTypographyType.bodyMedium,
                  color: isEnabled ? colors.textPrimary : colors.textDisabled,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return _buildToggleButton(context, isEnabled, colors);
  }

  Widget _buildToggleButton(
    BuildContext context,
    bool isEnabled,
    ChromiaColors colors,
  ) {
    final theme = context.chromiaTheme;
    final Color effectiveActiveColor = widget.activeColor ?? colors.primary;
    final Color effectiveInactiveColor = widget.inactiveColor ?? colors.border;
    final Color effectiveThumbColor = widget.thumbColor ?? colors.surface;

    final dimensions = _getToggleButtonDimensions(widget.size, theme.spacing);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isEnabled && widget.label == null ? _handleTap : null,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: dimensions.width,
              height: dimensions.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dimensions.height / 2),
                color: isEnabled
                    ? Color.lerp(
                        effectiveInactiveColor,
                        effectiveActiveColor,
                        _animation.value,
                      )
                    : colors.surfaceContainer,
              ),
              padding: EdgeInsets.all(dimensions.padding),
              child: Align(
                alignment: Alignment.lerp(
                  Alignment.centerLeft,
                  Alignment.centerRight,
                  _animation.value,
                )!,
                child: Container(
                  width: dimensions.thumbSize,
                  height: dimensions.thumbSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: effectiveThumbColor,
                    boxShadow: [
                      BoxShadow(
                        color: colors.shadow.withAlpha(51),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _ToggleButtonDimensions _getToggleButtonDimensions(
    ChromiaToggleButtonSize size,
    spacing,
  ) {
    return switch (size) {
      ChromiaToggleButtonSize.small => const _ToggleButtonDimensions(
        width: 36,
        height: 20,
        thumbSize: 16,
        padding: 2,
      ),
      ChromiaToggleButtonSize.medium => const _ToggleButtonDimensions(
        width: 44,
        height: 24,
        thumbSize: 20,
        padding: 2,
      ),
      ChromiaToggleButtonSize.large => const _ToggleButtonDimensions(
        width: 52,
        height: 28,
        thumbSize: 24,
        padding: 2,
      ),
    };
  }
}

class _ToggleButtonDimensions {
  const _ToggleButtonDimensions({
    required this.width,
    required this.height,
    required this.thumbSize,
    required this.padding,
  });

  final double width;
  final double height;
  final double thumbSize;
  final double padding;
}

/// Size options for ChromiaToggleButton
enum ChromiaToggleButtonSize {
  /// Small toggle button
  small,

  /// Medium toggle button (default)
  medium,

  /// Large toggle button
  large,
}
