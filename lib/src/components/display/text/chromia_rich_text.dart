import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A rich text widget with built-in Chromia typography styles.
///
/// [ChromiaRichText] displays text with multiple styles using [TextSpan]s
/// while providing easy access to Chromia's typography system.
///
/// ## Features
///
/// - **Multi-Style Text**: Display text with different styles in one widget
/// - **Typography Integration**: Use Chromia typography for text spans
/// - **Interactive Text**: Support for tap handlers and gestures
/// - **Full RichText API**: Supports all standard RichText properties
/// - **Helper Methods**: Convenient builders for common patterns
///
/// ## Basic Usage
///
/// ```dart
/// ChromiaRichText(
///   text: TextSpan(
///     children: [
///       TextSpan(text: 'Hello '),
///       TextSpan(
///         text: 'World',
///         style: TextStyle(fontWeight: FontWeight.bold),
///       ),
///     ],
///   ),
/// )
/// ```
///
/// ## Using Typography Types
///
/// ```dart
/// final theme = context.chromiaTheme;
///
/// ChromiaRichText(
///   text: TextSpan(
///     style: theme.typography.bodyMedium,
///     children: [
///       TextSpan(text: 'Regular text '),
///       TextSpan(
///         text: 'bold text',
///         style: theme.typography.bodyMedium.copyWith(
///           fontWeight: FontWeight.bold,
///         ),
///       ),
///       TextSpan(text: ' and '),
///       TextSpan(
///         text: 'colored text',
///         style: TextStyle(color: theme.colors.primary),
///       ),
///     ],
///   ),
/// )
/// ```
///
/// ## Interactive Text
///
/// ```dart
/// ChromiaRichText(
///   text: TextSpan(
///     style: theme.typography.bodyMedium,
///     children: [
///       TextSpan(text: 'Click '),
///       TextSpan(
///         text: 'here',
///         style: TextStyle(
///           color: theme.colors.primary,
///           decoration: TextDecoration.underline,
///         ),
///         recognizer: TapGestureRecognizer()
///           ..onTap = () => print('Tapped!'),
///       ),
///       TextSpan(text: ' for more info'),
///     ],
///   ),
/// )
/// ```
///
/// ## Convenient Builders
///
/// ```dart
/// // Highlight specific words
/// ChromiaRichText.highlight(
///   text: 'This is important text',
///   highlights: ['important'],
///   highlightStyle: TextStyle(
///     color: theme.colors.error,
///     fontWeight: FontWeight.bold,
///   ),
/// )
///
/// // Label with value
/// ChromiaRichText.labelValue(
///   label: 'Name:',
///   value: 'John Doe',
/// )
/// ```
///
/// See also:
/// - [ChromiaText] for simple single-style text
/// - [RichText] for the underlying Flutter widget
class ChromiaRichText extends StatelessWidget {
  /// Creates a rich text widget.
  ///
  /// The [text] parameter is required and specifies the root [TextSpan]
  /// of the text tree.
  const ChromiaRichText({
    required this.text,
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor,
    this.textScaler = TextScaler.noScaling,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
    this.selectionRegistrar,
    this.selectionColor,
    this.margin = EdgeInsets.zero,
  });

  /// Creates a rich text widget with highlighted words.
  ///
  /// Highlights specific words in the text with a custom style.
  ///
  /// ```dart
  /// ChromiaRichText.highlight(
  ///   text: 'Flutter is amazing',
  ///   highlights: ['amazing'],
  ///   highlightStyle: TextStyle(color: Colors.blue),
  /// )
  /// ```
  factory ChromiaRichText.highlight({
    required String text,
    required List<String> highlights,
    TextStyle? baseStyle,
    TextStyle? highlightStyle,
    bool caseSensitive = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
  }) {
    return _ChromiaHighlightText(
      text: TextSpan(text: text),
      highlights: highlights,
      baseStyle: baseStyle,
      highlightStyle: highlightStyle,
      caseSensitive: caseSensitive,
      margin: margin,
    );
  }

  /// Creates a rich text widget for label-value pairs.
  ///
  /// Displays a label followed by a value with different styles.
  ///
  /// ```dart
  /// ChromiaRichText.labelValue(
  ///   label: 'Email:',
  ///   value: 'john@example.com',
  /// )
  /// ```
  factory ChromiaRichText.labelValue({
    required String label,
    required String value,
    String separator = ' ',
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
  }) {
    return _ChromiaLabelValueText(
      label: label,
      value: value,
      separator: separator,
      labelStyle: labelStyle,
      valueStyle: valueStyle,
      margin: margin,
      text: const TextSpan(),
    );
  }

  /// The text to display as a [TextSpan] tree.
  final InlineSpan text;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// Whether the text should break at soft line breaks.
  final bool softWrap;

  /// How visual overflow should be handled.
  final TextOverflow overflow;

  /// Deprecated. Use [textScaler] instead.
  @Deprecated(
    'Use textScaler instead. '
    'This feature was deprecated after v3.12.0-2.0.pre.',
  )
  final double? textScaleFactor;

  /// The font scaling strategy to use.
  final TextScaler textScaler;

  /// An optional maximum number of lines for the text to span.
  final int? maxLines;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  final Locale? locale;

  /// The strut style to use.
  final StrutStyle? strutStyle;

  /// Defines how to measure the width of the rendered text.
  final TextWidthBasis textWidthBasis;

  /// Defines how the paragraph will apply TextStyle.height.
  final TextHeightBehavior? textHeightBehavior;

  /// The selection registrar for managing text selection.
  final SelectionRegistrar? selectionRegistrar;

  /// The color to use when painting the selection.
  final Color? selectionColor;

  /// The margin around the text widget.
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: RichText(
        text: text,
        textAlign: textAlign,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaler,
        maxLines: maxLines,
        locale: locale,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionRegistrar: selectionRegistrar,
        selectionColor: selectionColor,
      ),
    );
  }
}

/// Internal widget for highlight text factory
class _ChromiaHighlightText extends ChromiaRichText {
  const _ChromiaHighlightText({
    required super.text,
    required this.highlights,
    this.baseStyle,
    this.highlightStyle,
    this.caseSensitive = false,
    super.margin = EdgeInsets.zero,
  });

  final List<String> highlights;
  final TextStyle? baseStyle;
  final TextStyle? highlightStyle;
  final bool caseSensitive;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final defaultBaseStyle = baseStyle ?? theme.typography.bodyMedium;
    final defaultHighlightStyle =
        highlightStyle ??
        theme.typography.bodyMedium.copyWith(
          color: theme.colors.primary,
          fontWeight: FontWeight.bold,
        );

    final List<TextSpan> spans = [];
    String remainingText = text.toString();
    int currentIndex = 0;

    while (currentIndex < text.toString().length) {
      bool foundHighlight = false;

      for (final highlight in highlights) {
        final searchText = caseSensitive ? remainingText : remainingText.toLowerCase();
        final searchHighlight = caseSensitive ? highlight : highlight.toLowerCase();
        final index = searchText.indexOf(searchHighlight);

        if (index == 0) {
          // Add highlighted text
          final highlightedText = remainingText.substring(0, highlight.length);
          spans.add(
            TextSpan(
              text: highlightedText,
              style: defaultHighlightStyle,
            ),
          );
          currentIndex += highlight.length;
          remainingText = text.toString().substring(currentIndex);
          foundHighlight = true;
          break;
        }
      }

      if (!foundHighlight) {
        // Find next highlight or end of string
        int nextHighlightIndex = remainingText.length;
        for (final highlight in highlights) {
          final searchText = caseSensitive ? remainingText : remainingText.toLowerCase();
          final searchHighlight = caseSensitive ? highlight : highlight.toLowerCase();
          final index = searchText.indexOf(searchHighlight);
          if (index != -1 && index < nextHighlightIndex) {
            nextHighlightIndex = index;
          }
        }

        // Add normal text
        final normalText = remainingText.substring(0, nextHighlightIndex);
        if (normalText.isNotEmpty) {
          spans.add(
            TextSpan(
              text: normalText,
              style: defaultBaseStyle,
            ),
          );
        }
        currentIndex += nextHighlightIndex;
        remainingText = text.toString().substring(currentIndex);
      }
    }

    return ChromiaRichText(
      text: TextSpan(children: spans),
      margin: margin,
    );
  }
}

/// Internal widget for label-value text factory
class _ChromiaLabelValueText extends ChromiaRichText {
  const _ChromiaLabelValueText({
    required super.text,
    required this.label,
    required this.value,
    this.separator = ' ',
    this.labelStyle,
    this.valueStyle,
    super.margin = EdgeInsets.zero,
  });

  final String label;
  final String value;
  final String separator;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final defaultLabelStyle =
        labelStyle ??
        theme.typography.labelMedium.copyWith(
          color: theme.colors.textSecondary,
        );
    final defaultValueStyle = valueStyle ?? theme.typography.bodyMedium;

    return ChromiaRichText(
      text: TextSpan(
        children: [
          TextSpan(text: label, style: defaultLabelStyle),
          if (separator.isNotEmpty) TextSpan(text: separator, style: defaultLabelStyle),
          TextSpan(text: value, style: defaultValueStyle),
        ],
      ),
      margin: margin,
    );
  }
}
