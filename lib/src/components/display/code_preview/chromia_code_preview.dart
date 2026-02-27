import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A component that displays code alongside its rendered preview.
///
/// Perfect for documentation and showcasing component variations.
///
/// Example usage:
/// ```dart
/// ChromiaCodePreview(
///   code: '''
/// ChromiaButton(
///   onPressed: () {},
///   child: Text('Click me'),
/// )
///   ''',
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
    this.language = 'dart',
    this.showCopyButton = true,
    this.codeHeight,
    this.previewPadding,
    this.previewAlignment = Alignment.center,
    this.layout = CodePreviewLayout.horizontal,
    super.key,
  });

  /// The code to display
  final String code;

  /// The widget to preview
  final Widget preview;

  /// Optional title for the preview
  final String? title;

  /// Optional description
  final String? description;

  /// Programming language for syntax (currently just for display)
  final String language;

  /// Whether to show the copy button
  final bool showCopyButton;

  /// Fixed height for code section (optional)
  final double? codeHeight;

  /// Padding around the preview
  final EdgeInsetsGeometry? previewPadding;

  /// Alignment of the preview widget
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
    await Future.delayed(const Duration(seconds: 2), () {});
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
            Text(
              widget.title!,
              style: theme.typography.titleMedium,
            ),
          if (widget.description != null) ...[
            spacing.gapVXS,
            Text(
              widget.description!,
              style: theme.typography.bodySmall.copyWith(
                color: theme.colors.textSecondary,
              ),
            ),
          ],
          spacing.gapVM,
        ],
        _buildContent(theme),
      ],
    );
  }

  Widget _buildContent(ChromiaThemeData theme) {
    if (widget.layout == CodePreviewLayout.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildPreviewSection(theme),
          theme.spacing.gapVM,
          _buildCodeSection(theme),
        ],
      );
    }

    // Horizontal layout
    return LayoutBuilder(
      builder: (context, constraints) {
        // If screen is too small, switch to vertical
        if (constraints.maxWidth < 800) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildPreviewSection(theme),
              theme.spacing.gapVM,
              _buildCodeSection(theme),
            ],
          );
        }

        // Horizontal layout
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: _buildCodeSection(theme),
              ),
              theme.spacing.gapHM,
              Expanded(
                flex: 1,
                child: _buildPreviewSection(theme),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCodeSection(ChromiaThemeData theme) {
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Container(
      height: widget.codeHeight,
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: theme.radius.radiusM,
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header with language and copy button
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: spacing.m,
              vertical: spacing.s,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: colors.border),
              ),
            ),
            child: Row(
              children: [
                Text(
                  widget.language,
                  style: theme.typography.labelSmall.copyWith(
                    color: colors.textSecondary,
                    fontFamily: 'monospace',
                  ),
                ),
                const Spacer(),
                if (widget.showCopyButton)
                  InkWell(
                    onTap: _copyToClipboard,
                    borderRadius: theme.radius.radiusS,
                    child: Padding(
                      padding: spacing.paddingXS,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _copied ? Icons.check : Icons.copy,
                            size: 16,
                            color: _copied ? colors.success : colors.textSecondary,
                          ),
                          spacing.gapHXS,
                          Text(
                            _copied ? 'Copied!' : 'Copy',
                            style: theme.typography.labelSmall.copyWith(
                              color: _copied ? colors.success : colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Code content
          Expanded(
            child: SingleChildScrollView(
              padding: spacing.paddingM,
              child: SelectableText(
                widget.code.trim(),
                style: theme.typography.bodySmall.copyWith(
                  fontFamily: 'monospace',
                  color: colors.textPrimary,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewSection(ChromiaThemeData theme) {
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Container(
      padding: widget.previewPadding ?? spacing.paddingXL,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: theme.radius.radiusM,
        border: Border.all(color: colors.border),
      ),
      child: Align(
        alignment: widget.previewAlignment,
        child: widget.preview,
      ),
    );
  }
}

/// Layout options for code preview
enum CodePreviewLayout {
  /// Code on left, preview on right (switches to vertical on small screens)
  horizontal,

  /// Preview on top, code on bottom
  vertical,
}

/// A group of related code previews with tabs
class ChromiaCodePreviewGroup extends StatefulWidget {
  const ChromiaCodePreviewGroup({
    required this.items,
    this.title,
    this.description,
    super.key,
  });

  /// List of preview items
  final List<CodePreviewItem> items;

  /// Optional title
  final String? title;

  /// Optional description
  final String? description;

  @override
  State<ChromiaCodePreviewGroup> createState() => _ChromiaCodePreviewGroupState();
}

class _ChromiaCodePreviewGroupState extends State<ChromiaCodePreviewGroup> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null || widget.description != null) ...[
          if (widget.title != null)
            Text(
              widget.title!,
              style: theme.typography.titleLarge,
            ),
          if (widget.description != null) ...[
            spacing.gapVXS,
            Text(
              widget.description!,
              style: theme.typography.bodyMedium.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
          spacing.gapVL,
        ],
        // Tabs
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: colors.border),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(widget.items.length, (index) {
                final item = widget.items[index];
                final isSelected = index == _selectedIndex;

                return GestureDetector(
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
                    child: Text(
                      item.label,
                      style: theme.typography.labelMedium.copyWith(
                        color: isSelected ? colors.primary : colors.textSecondary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        spacing.gapVL,
        // Content
        ChromiaCodePreview(
          code: widget.items[_selectedIndex].code,
          preview: widget.items[_selectedIndex].preview,
          description: widget.items[_selectedIndex].description,
        ),
      ],
    );
  }
}

/// A single item in a code preview group
class CodePreviewItem {
  const CodePreviewItem({
    required this.label,
    required this.code,
    required this.preview,
    this.description,
  });

  /// Tab label
  final String label;

  /// Code to display
  final String code;

  /// Widget to preview
  final Widget preview;

  /// Optional description
  final String? description;
}
