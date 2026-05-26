import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/code_preview/chromia_syntax_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

/// A widget that displays code alongside its rendered preview.
///
/// Used internally by the example app to document Chromia UI components.
/// Shows a live interactive preview paired with copyable source code.
///
/// ```dart
/// ChromiaCodePreview(
///   code: '''
/// ChromiaButton(
///   onPressed: () {},
///   child: Text('Click me'),
/// )''',
///   preview: ChromiaButton(
///     onPressed: () {},
///     child: Text('Click me'),
///   ),
/// )
/// ```
class ChromiaCodePreview extends StatefulWidget {
  const ChromiaCodePreview({
    required this.code,
    required this.preview,
    this.title,
    this.description,
    this.language = CodePreviewLanguage.dart,
    this.showCopyButton = true,
    this.height,
    this.previewPadding,
    this.previewAlignment = Alignment.center,
    this.layout = CodePreviewLayout.horizontal,
    super.key,
  });

  /// The code snippet to display
  final String code;

  /// The widget to preview
  final Widget preview;

  /// Optional title
  final String? title;

  /// Optional description
  final String? description;

  /// Programming language for syntax highlighting
  final CodePreviewLanguage language;

  /// Whether to show the copy button
  final bool showCopyButton;

  /// Fixed height (optional)
  final double? height;

  /// Padding around the preview section
  final EdgeInsetsGeometry? previewPadding;

  /// Alignment of the preview widget inside its container
  final Alignment previewAlignment;

  /// Layout orientation
  final CodePreviewLayout layout;

  @override
  State<ChromiaCodePreview> createState() => _ChromiaCodePreviewState();
}

class _ChromiaCodePreviewState extends State<ChromiaCodePreview> {
  bool _copied = false;

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _copied = false);
    }
  }

  Syntax get _syntax => switch (widget.language) {
    CodePreviewLanguage.dart => Syntax.DART,
    CodePreviewLanguage.c => Syntax.C,
    CodePreviewLanguage.cpp => Syntax.CPP,
    CodePreviewLanguage.javascript => Syntax.JAVASCRIPT,
    CodePreviewLanguage.kotlin => Syntax.KOTLIN,
    CodePreviewLanguage.java => Syntax.JAVA,
    CodePreviewLanguage.swift => Syntax.SWIFT,
    CodePreviewLanguage.yaml => Syntax.YAML,
    CodePreviewLanguage.rust => Syntax.RUST,
    CodePreviewLanguage.lua => Syntax.LUA,
    CodePreviewLanguage.python => Syntax.PYTHON,
  };

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null || widget.description != null) ...[
          if (widget.title != null)
            ChromiaText(
              widget.title!,
              type: ChromiaTypographyType.titleMedium,
            ),
          if (widget.description != null) ...[
            spacing.gapVXS,
            ChromiaText(
              widget.description!,
              type: ChromiaTypographyType.bodySmall,
              color: theme.colors.onSurfaceVariant,
            ),
          ],
          spacing.gapVM,
        ],
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    if (widget.layout == CodePreviewLayout.vertical) {
      return _buildVerticalContent(context);
    }

    // Horizontal layout — falls back to vertical on narrow screens
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return _buildVerticalContent(context);
        }

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildCodeSection(context)),
              context.chromiaSpacing.gapHM,
              Expanded(child: _buildPreviewSection(context)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVerticalContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildPreviewSection(context),
        context.chromiaSpacing.gapVM,
        _buildCodeSection(context),
      ],
    );
  }

  Widget _buildCodeSection(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaSpacing;
    final isDark = context.chromiaTheme.brightness == Brightness.dark;

    final codeBackgroundColor = isDark
        ? const Color(0xFF282C34)
        : const Color(0xFFFAFAFA);

    final syntaxTheme = SyntaxTheme(
      baseStyle: TextStyle(color: colors.onSurfaceVariant),
      numberStyle: TextStyle(
        color:
            isDark ? const Color(0xFF2AACB8) : const Color(0xFF1750EB),
      ),
      commentStyle: TextStyle(
        color:
            isDark ? const Color(0xFF7A7E85) : const Color(0xFF8C8C8C),
      ),
      keywordStyle: TextStyle(
        color:
            isDark ? const Color(0xFFCF8E6D) : const Color(0xFFEd864A),
      ),
      stringStyle: TextStyle(
        color:
            isDark ? const Color(0xFF6AAB73) : const Color(0xFF067D17),
      ),
      classStyle: TextStyle(
        color:
            isDark ? const Color(0xFF57AAF7) : const Color(0xFF0033B3),
      ),
      constantStyle: TextStyle(
        color:
            isDark ? const Color(0xFFC77DBB) : const Color(0xFF871094),
      ),
      linesCountColor:
          isDark ? const Color(0xFF5C6370) : const Color(0xFF9E9E9E),
      backgroundColor: codeBackgroundColor,
      zoomIconColor:
          isDark ? const Color(0xFF5C6370) : const Color(0xFF9E9E9E),
    );

    return Container(
      height: widget.height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: codeBackgroundColor,
        borderRadius: context.chromiaRadius.radiusM,
        border: Border.all(color: colors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header bar with language label + copy button
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: spacing.m,
              vertical: spacing.s,
            ),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF21252B)
                  : const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.only(
                topLeft: context.chromiaRadius.radiusM.topLeft,
                topRight: context.chromiaRadius.radiusM.topRight,
              ),
              border: Border(
                bottom: BorderSide(
                  color: isDark
                      ? const Color(0xFF181A1F)
                      : const Color(0xFFDDDDDD),
                ),
              ),
            ),
            child: Row(
              children: [
                ChromiaText(
                  widget.language.name,
                  type: ChromiaTypographyType.bodyMedium,
                  color: isDark
                      ? const Color(0xFF5C6370)
                      : const Color(0xFF9E9E9E),
                ),
                const Spacer(),
                if (widget.showCopyButton)
                  InkWell(
                    onTap: _copyToClipboard,
                    borderRadius: context.chromiaRadius.radiusS,
                    child: Padding(
                      padding: spacing.paddingXS,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _copied ? Icons.check : Icons.copy,
                            size: 16,
                            color: _copied
                                ? colors.success
                                : (isDark
                                      ? const Color(0xFF5C6370)
                                      : const Color(0xFF9E9E9E)),
                          ),
                          spacing.gapHXS,
                          ChromiaText(
                            _copied ? 'Copied!' : 'Copy',
                            type: ChromiaTypographyType.labelSmall,
                            color: _copied
                                ? colors.success
                                : (isDark
                                      ? const Color(0xFF5C6370)
                                      : const Color(0xFF9E9E9E)),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Syntax-highlighted code
          widget.height != null
              ? Expanded(child: _buildCodeContent(syntaxTheme))
              : _buildCodeContent(syntaxTheme),
        ],
      ),
    );
  }

  Widget _buildCodeContent(SyntaxTheme syntaxTheme) {
    return SingleChildScrollView(
      child: ChromiaSyntaxView(
        code: widget.code.trim(),
        syntax: _syntax,
        syntaxTheme: syntaxTheme,
      ),
    );
  }

  Widget _buildPreviewSection(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaSpacing;

    return Container(
      padding: widget.previewPadding ?? spacing.paddingXL,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: context.chromiaRadius.radiusM,
        border: Border.all(color: colors.outline),
      ),
      child: Align(
        alignment: widget.previewAlignment,
        child: widget.preview,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Enums
// ─────────────────────────────────────────────────────────────────────────────

/// Layout orientation for [ChromiaCodePreview].
enum CodePreviewLayout {
  /// Code on left, preview on right (switches to vertical on narrow screens).
  horizontal,

  /// Preview on top, code below.
  vertical,
}

/// Supported syntax highlighting languages.
enum CodePreviewLanguage {
  dart,
  c,
  cpp,
  javascript,
  kotlin,
  java,
  swift,
  yaml,
  rust,
  lua,
  python,
}

// ─────────────────────────────────────────────────────────────────────────────
// ChromiaCodePreviewGroup
// ─────────────────────────────────────────────────────────────────────────────

/// A tabbed group of [ChromiaCodePreview] items.
///
/// Each tab shows a different variant with its own code and preview.
class ChromiaCodePreviewGroup extends StatefulWidget {
  const ChromiaCodePreviewGroup({
    required this.items,
    this.title,
    this.description,
    super.key,
  });

  final List<CodePreviewItem> items;
  final String? title;
  final String? description;

  @override
  State<ChromiaCodePreviewGroup> createState() =>
      _ChromiaCodePreviewGroupState();
}

class _ChromiaCodePreviewGroupState extends State<ChromiaCodePreviewGroup> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null || widget.description != null) ...[
          if (widget.title != null)
            ChromiaText(
              widget.title!,
              type: ChromiaTypographyType.titleLarge,
            ),
          if (widget.description != null) ...[
            spacing.gapVXS,
            ChromiaText(
              widget.description!,
              type: ChromiaTypographyType.bodyMedium,
              color: colors.onSurfaceVariant,
            ),
          ],
          spacing.gapVL,
        ],
        // Tab row
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: colors.outline)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(widget.items.length, (index) {
                final item = widget.items[index];
                final isSelected = index == _selectedIndex;

                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: spacing.l,
                        vertical: spacing.m,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected
                                ? colors.primary
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: ChromiaText(
                        item.label,
                        type: ChromiaTypographyType.labelMedium,
                        style: TextStyle(
                          color: isSelected
                              ? colors.primary
                              : colors.onSurfaceVariant,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        spacing.gapVL,
        // Selected item content
        ChromiaCodePreview(
          code: widget.items[_selectedIndex].code,
          preview: widget.items[_selectedIndex].preview,
          description: widget.items[_selectedIndex].description,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CodePreviewItem
// ─────────────────────────────────────────────────────────────────────────────

/// A single tab entry for [ChromiaCodePreviewGroup].
class CodePreviewItem {
  const CodePreviewItem({
    required this.label,
    required this.code,
    required this.preview,
    this.description,
  });

  final String label;
  final String code;
  final Widget preview;
  final String? description;
}
