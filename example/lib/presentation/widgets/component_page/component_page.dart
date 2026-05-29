import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/code_preview/chromia_code_preview.dart' show ChromiaCodePreview, ChromiaCodePreviewGroup;
import 'package:chromia_ui_example/presentation/widgets/widgets.dart' show ChromiaCodePreview, ChromiaCodePreviewGroup;
import 'package:flutter/material.dart';

/// Page-level layout for a component documentation screen.
///
/// Renders a header (overview description + optional "when to use" guidance)
/// followed by a list of [ComponentSection] widgets.
///
/// Use inside `ExampleScaffold`'s `children` list:
/// ```dart
/// ExampleScaffold(
///   title: 'Button',
///   children: [
///     ComponentPage(
///       description: 'Buttons allow users to take actions with a single tap.',
///       whenToUse: 'Use a filled button for the primary action on a screen.',
///       children: [],
///     ),
///   ],
/// )
/// ```
class ComponentPage extends StatelessWidget {
  const ComponentPage({
    required this.description,
    required this.children,
    this.whenToUse,
    super.key,
  });

  /// Short overview of what this component does (1–3 sentences).
  final String description;

  /// Optional guidance on when to use this component vs alternatives.
  final String? whenToUse;

  /// List of [ComponentSection] widgets, one per feature/variant group.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Overview description ──────────────────────────────────────────────
        ChromiaText(
          description,
          type: ChromiaTypographyType.bodyLarge,
          color: colors.onSurfaceVariant,
        ),

        // ── "When to use" box ─────────────────────────────────────────────────
        if (whenToUse != null) ...[
          spacing.gapVL,
          Container(
            padding: spacing.paddingL,
            decoration: BoxDecoration(
              color: colors.infoContainer,
              borderRadius: theme.radius.radiusM,
              border: Border.all(color: colors.info.withAlpha(60)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lightbulb_outline_rounded, color: colors.info, size: 20),
                spacing.gapHM,
                Expanded(
                  child: ChromiaText(
                    whenToUse!,
                    type: ChromiaTypographyType.bodyMedium,
                    color: colors.onInfoContainer,
                  ),
                ),
              ],
            ),
          ),
        ],

        spacing.gapVXXL,

        // ── Sections ──────────────────────────────────────────────────────────
        ...children,
      ],
    );
  }
}

/// A named section within a [ComponentPage].
///
/// Renders a title, optional description, and the demo widget
/// (typically a [ChromiaCodePreview] or [ChromiaCodePreviewGroup]).
///
/// ```dart
/// ComponentSection(
///   title: 'Variants',
///   description: 'Five style variants to match different levels of emphasis.',
///   child: ChromiaCodePreviewGroup(items: [...]),
/// )
/// ```
class ComponentSection extends StatelessWidget {
  const ComponentSection({
    required this.title,
    required this.child,
    this.description,
    super.key,
  });

  /// Section heading shown in headlineSmall style.
  final String title;

  /// Optional paragraph describing this group of demos.
  final String? description;

  /// The demo content — usually [ChromiaCodePreview] or [ChromiaCodePreviewGroup].
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final spacing = theme.spacing;

    return Padding(
      padding: EdgeInsets.only(bottom: spacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Section header ────────────────────────────────────────────────
          ChromiaText(
            title,
            type: ChromiaTypographyType.headlineSmall,
            color: colors.onSurface,
          ),
          if (description != null) ...[
            spacing.gapVXS,
            ChromiaText(
              description!,
              type: ChromiaTypographyType.bodyMedium,
              color: colors.onSurfaceVariant,
            ),
          ],
          spacing.gapVL,

          // ── Demo content ──────────────────────────────────────────────────
          child,
        ],
      ),
    );
  }
}
