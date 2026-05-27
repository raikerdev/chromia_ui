import 'dart:math' as math;

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
    this.showCopyButton = true,
    this.height = 300,
    this.layout = Axis.horizontal,
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

  /// Whether to show the copy button
  final bool showCopyButton;

  /// Fixed height (optional)
  final double height;

  /// Layout orientation
  final Axis layout;

  @override
  State<ChromiaCodePreview> createState() => _ChromiaCodePreviewState();
}

class _ChromiaCodePreviewState extends State<ChromiaCodePreview> {
  static const double maxFontScaleFactor = 1.3;
  static const double minFontScaleFactor = 1;

  bool _copied = false;
  double _fontScaleFactor = 1.0;

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _copied = false);
    }
  }

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
    if (widget.layout == Axis.vertical) {
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

    final syntaxTheme = _buildSyntaxTheme(context);

    return Container(
      height: widget.height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: colors.surface,
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
              color: colors.surfaceContainer,
              borderRadius: BorderRadius.only(
                topLeft: context.chromiaRadius.radiusM.topLeft,
                topRight: context.chromiaRadius.radiusM.topRight,
              ),
              border: Border(bottom: BorderSide(color: colors.outline)),
            ),
            child: Row(
              children: [
                ChromiaText(
                  'Dart',
                  type: ChromiaTypographyType.bodyMedium,
                  color: colors.onSurfaceContainer,
                ),
                const Spacer(),
                _zoomControls(context),
                spacing.gapHM,
                if (widget.showCopyButton)
                  ChromiaButton(
                    variant: ChromiaButtonVariant.text,
                    icon: Icon(
                      _copied ? Icons.check : Icons.copy,
                      size: 16,
                      color: _copied ? colors.success : colors.onSurfaceContainer,
                    ),
                    onPressed: _copyToClipboard,
                    child: ChromiaText(
                      _copied ? 'Copied!' : 'Copy',
                      type: ChromiaTypographyType.labelSmall,
                      color: _copied ? colors.success : colors.onSurfaceContainer,
                    ),
                  ),
              ],
            ),
          ),
          // Syntax-highlighted code
          Expanded(child: _buildCodeContent(syntaxTheme)),
        ],
      ),
    );
  }

  Widget _buildCodeContent(SyntaxTheme syntaxTheme) {
    return SingleChildScrollView(
      padding: const .only(bottom: 10),
      child: ChromiaSyntaxView(
        code: widget.code.trim(),
        syntaxTheme: syntaxTheme,
        fontScaleFactor: _fontScaleFactor,
      ),
    );
  }

  Widget _buildPreviewSection(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaSpacing;

    return Container(
      padding: spacing.paddingXL,
      alignment: .center,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: context.chromiaRadius.radiusM,
        border: Border.all(color: colors.outline),
      ),
      child: widget.preview,
    );
  }

  Widget _zoomControls(BuildContext context) {
    final colors = context.chromiaColors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.zoom_out, color: colors.onSurfaceContainer),
          onPressed: () => setState(() {
            _fontScaleFactor = math.max(
              minFontScaleFactor,
              _fontScaleFactor - 0.1,
            );
          }),
        ),
        IconButton(
          icon: Icon(Icons.zoom_in, color: colors.onSurfaceContainer),
          onPressed: () => setState(() {
            _fontScaleFactor = math.min(
              maxFontScaleFactor,
              _fontScaleFactor + 0.1,
            );
          }),
        ),
      ],
    );
  }

  SyntaxTheme _buildSyntaxTheme(BuildContext context) {
    final colors = context.chromiaColors;
    final isDark = context.chromiaTheme.brightness == Brightness.dark;

    return SyntaxTheme(
      baseStyle: TextStyle(color: colors.onSurfaceVariant),
      numberStyle: TextStyle(
        color: isDark ? const Color(0xFF2AACB8) : const Color(0xFF1750EB),
      ),
      commentStyle: TextStyle(
        color: isDark ? const Color(0xFF7A7E85) : const Color(0xFF8C8C8C),
      ),
      keywordStyle: TextStyle(
        color: isDark ? const Color(0xFFCF8E6D) : const Color(0xFFEd864A),
      ),
      stringStyle: TextStyle(
        color: isDark ? const Color(0xFF6AAB73) : const Color(0xFF067D17),
      ),
      classStyle: TextStyle(
        color: isDark ? const Color(0xFF57AAF7) : const Color(0xFF0033B3),
      ),
      constantStyle: TextStyle(
        color: isDark ? const Color(0xFFC77DBB) : const Color(0xFF871094),
      ),
      linesCountColor: isDark ? const Color(0xFF5C6370) : const Color(0xFF9E9E9E),
      backgroundColor: colors.surface,
      zoomIconColor: isDark ? const Color(0xFF5C6370) : const Color(0xFF9E9E9E),
    );
  }
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
  State<ChromiaCodePreviewGroup> createState() => _ChromiaCodePreviewGroupState();
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
                            color: isSelected ? colors.primary : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: ChromiaText(
                        item.label,
                        type: ChromiaTypographyType.labelMedium,
                        style: TextStyle(
                          color: isSelected ? colors.primary : colors.onSurfaceVariant,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
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
