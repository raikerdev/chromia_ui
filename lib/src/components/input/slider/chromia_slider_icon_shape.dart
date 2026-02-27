import 'package:flutter/material.dart';

class ChromiaSliderIconShape extends SliderComponentShape {
  final IconData icon;
  final double thumbRadius;

  const ChromiaSliderIconShape({required this.icon, required this.thumbRadius});

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

    final TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl)
      ..text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: thumbRadius * 2.5,
          fontFamily: icon.fontFamily,
          color: sliderTheme.thumbColor,
          shadows: const [Shadow(color: Colors.black87 ,blurRadius: 1)],
        ),
      )
      ..layout();

    final Offset textCenter = Offset(center.dx - (textPainter.width / 2), center.dy - (textPainter.height / 2));
    const cornerRadius = 4.0;

    canvas.drawRRect(
      RRect.fromRectXY(Rect.fromCenter(center: center, width: 1, height: 1), cornerRadius, cornerRadius),
      paint,
    );

    textPainter.paint(canvas, textCenter);
  }
}
