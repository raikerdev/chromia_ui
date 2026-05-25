import 'package:flutter/material.dart';

class ChromiaRangeSliderIconShape extends RangeSliderThumbShape {
  final IconData startIcon;
  final IconData endIcon;
  final double thumbRadius;

  /// Color used for the icon shadow. Pass `theme.colors.shadow` from the
  /// parent build method so dark mode is handled correctly.
  final Color shadowColor;

  const ChromiaRangeSliderIconShape({
    required this.startIcon,
    required this.endIcon,
    required this.thumbRadius,
    this.shadowColor = Colors.black87,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required SliderThemeData sliderTheme,
    bool? isDiscrete,
    bool? isEnabled,
    bool? isOnTop,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final iconToUse = thumb == Thumb.start ? startIcon : endIcon;

    final TextPainter textPainter =
        TextPainter(textDirection: TextDirection.rtl)
          ..text = TextSpan(
            text: String.fromCharCode(iconToUse.codePoint),
            style: TextStyle(
              fontSize: thumbRadius * 2.5,
              fontFamily: iconToUse.fontFamily,
              color: sliderTheme.thumbColor,
              shadows: [
                Shadow(color: shadowColor.withAlpha(180), blurRadius: 1),
              ],
            ),
          )
          ..layout();

    final Offset textCenter = Offset(
      center.dx - (textPainter.width / 2),
      center.dy - (textPainter.height / 2),
    );
    const cornerRadius = 4.0;

    canvas.drawRRect(
      RRect.fromRectXY(
        Rect.fromCenter(center: center, width: 1, height: 1),
        cornerRadius,
        cornerRadius,
      ),
      paint,
    );

    textPainter.paint(canvas, textCenter);
  }
}
