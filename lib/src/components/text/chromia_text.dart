import 'package:chromia_ui/src/theme/chromia_typography.dart';
import 'package:flutter/material.dart';

/// A customizable text with a [ChromiaTypographyType].
///
/// The [ChromiaText] is a widget that displays text with a customizable style.
///
/// Example usage:
/// ```dart
/// ChromiaText(
///   'example text',
///   type: ChromiaTypographyType.bodyMedium,
///   color: Colors.white,
/// )
/// ```

class ChromiaText extends StatelessWidget {
  const ChromiaText(
    this.data, {
    this.color,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.semanticsIdentifier,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    super.key,
    this.type = ChromiaTypographyType.bodyMedium,
    this.style,
    this.strutStyle,
    this.margin = EdgeInsets.zero,
  });

  final String data;
  final ChromiaTypographyType type;
  final Color? color;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final String? semanticsIdentifier;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Text(
        data,
        style: type.getTextStyle(context).copyWith(color: color).merge(style),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        semanticsIdentifier: semanticsIdentifier,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      ),
    );
  }
}
