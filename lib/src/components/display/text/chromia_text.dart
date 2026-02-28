import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable text widget with built-in Chromia typography styles.
///
/// [ChromiaText] simplifies text styling by providing direct access to the
/// Chromia design system's typography scale. Instead of manually applying
/// text styles, you can use predefined typography types.
///
/// ## Features
///
/// - **Typography Integration**: Direct access to Chromia typography scale
/// - **Color Override**: Easy color customization
/// - **Full Text API**: Supports all standard Text widget properties
/// - **Margin Support**: Built-in margin for spacing
/// - **Style Merging**: Combine typography with custom styles
///
/// ## Basic Usage
///
/// ```dart
/// // Simple text with typography
/// ChromiaText(
///   'Hello World',
///   type: ChromiaTypographyType.headlineLarge,
/// )
///
/// // Text with color override
/// ChromiaText(
///   'Welcome',
///   type: ChromiaTypographyType.titleMedium,
///   color: Colors.blue,
/// )
///
/// // Text with margin
/// ChromiaText(
///   'Spaced text',
///   type: ChromiaTypographyType.bodySmall,
///   margin: EdgeInsets.all(16),
/// )
/// ```
///
/// ## Advanced Usage
///
/// ```dart
/// // Combine typography with custom style
/// ChromiaText(
///   'Custom styled',
///   type: ChromiaTypographyType.bodyMedium,
///   style: TextStyle(
///     fontWeight: FontWeight.bold,
///     letterSpacing: 1.5,
///   ),
/// )
///
/// // Text with overflow handling
/// ChromiaText(
///   'Very long text that might overflow...',
///   type: ChromiaTypographyType.bodyMedium,
///   maxLines: 2,
///   overflow: TextOverflow.ellipsis,
/// )
/// ```
///
/// ## Typography Types
///
/// The component supports all Chromia typography types:
/// - Display: displayLarge, displayMedium, displaySmall
/// - Headline: headlineLarge, headlineMedium, headlineSmall
/// - Title: titleLarge, titleMedium, titleSmall
/// - Body: bodyLarge, bodyMedium, bodySmall
/// - Label: labelLarge, labelMedium, labelSmall
///
/// See also:
/// - [ChromiaRichText] for multi-styled text
/// - [ChromiaTypographyType] for available typography styles
class ChromiaText extends StatelessWidget {
  /// Creates a text widget with Chromia typography.
  ///
  /// The [data] parameter is required and specifies the text to display.
  ///
  /// The [type] parameter determines which typography style to use.
  /// Defaults to [ChromiaTypographyType.bodyMedium].
  ///
  /// The [color] parameter overrides the color from the typography style.
  ///
  /// The [style] parameter is merged with the typography style, allowing
  /// you to customize specific properties while keeping the base style.
  ///
  /// The [margin] parameter adds spacing around the text widget.
  /// Defaults to [EdgeInsets.zero].
  const ChromiaText(
    this.data, {
    super.key,
    this.type = ChromiaTypographyType.bodyMedium,
    this.color,
    this.style,
    this.strutStyle,
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
    this.margin = EdgeInsets.zero,
  });

  /// The text to display.
  final String data;

  /// The typography type to apply.
  ///
  /// This determines the base text style from the Chromia typography scale.
  /// Defaults to [ChromiaTypographyType.bodyMedium].
  final ChromiaTypographyType type;

  /// Optional color override.
  ///
  /// If provided, this color will override the color from the typography style.
  final Color? color;

  /// Additional text style to merge with the typography style.
  ///
  /// Use this to customize specific properties while maintaining the
  /// base typography style. The custom style is merged after the
  /// typography style and color override.
  final TextStyle? style;

  /// The strut style to use.
  ///
  /// Strut style defines the minimum height and baseline alignment.
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This determines how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there
  /// was unlimited horizontal space.
  final bool? softWrap;

  /// How visual overflow should be handled.
  ///
  /// Common values:
  /// - [TextOverflow.clip]: Clip the overflowing text
  /// - [TextOverflow.ellipsis]: Show ellipsis (...) for overflow
  /// - [TextOverflow.fade]: Fade out overflowing text
  final TextOverflow? overflow;

  /// Deprecated. Use [textScaler] instead.
  @Deprecated(
    'Use textScaler instead. '
    'This feature was deprecated after v3.12.0-2.0.pre.',
  )
  final double? textScaleFactor;

  /// The font scaling strategy to use.
  ///
  /// Controls how the text scales relative to the configured font size.
  final TextScaler? textScaler;

  /// An optional maximum number of lines for the text to span.
  ///
  /// If the text exceeds the given number of lines, it will be truncated
  /// according to [overflow].
  final int? maxLines;

  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value
  /// instead of the actual text.
  final String? semanticsLabel;

  /// An optional identifier for this text widget.
  final String? semanticsIdentifier;

  /// Defines how to measure the width of the rendered text.
  final TextWidthBasis? textWidthBasis;

  /// Defines how the paragraph will apply TextStyle.height to the ascent
  /// of the first line and descent of the last line.
  final TextHeightBehavior? textHeightBehavior;

  /// The color to use when painting the selection.
  final Color? selectionColor;

  /// The margin around the text widget.
  ///
  /// Defaults to [EdgeInsets.zero]. Use this for adding spacing
  /// around the text without wrapping in additional widgets.
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    // Get base typography style from theme
    final baseStyle = type.getTextStyle(context);

    // Apply color override if provided
    final styledWithColor = color != null ? baseStyle.copyWith(color: color) : baseStyle;

    // Merge with custom style if provided
    final finalStyle = style != null ? styledWithColor.merge(style) : styledWithColor;

    return Padding(
      padding: margin,
      child: Text(
        data,
        style: finalStyle,
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
