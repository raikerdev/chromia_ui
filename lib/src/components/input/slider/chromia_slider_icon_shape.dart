import 'package:flutter/material.dart';

/// A custom slider thumb shape that renders a Material icon instead of the
/// default filled circle.
///
/// Pass this to [SliderThemeData.thumbShape] when you want an icon-based thumb.
class ChromiaSliderIconShape extends SliderComponentShape {
  /// The icon to render as the slider thumb.
  final IconData icon;

  /// The radius of the thumb hit-box and paint area.
  final double thumbRadius;

  /// Color used for the icon shadow. Pass `theme.colors.shadow` from the
  /// parent build method so dark mode is handled correctly.
  final Color shadowColor;

  /// Creates a [ChromiaSliderIconShape].
  const ChromiaSliderIconShape({
    required this.icon,
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
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final TextPainter textPainter =
        TextPainter(textDirection: TextDirection.rtl)
          ..text = TextSpan(
            text: String.fromCharCode(icon.codePoint),
            style: TextStyle(
              fontSize: thumbRadius * 2.5,
              fontFamily: icon.fontFamily,
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
