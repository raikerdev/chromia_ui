import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Typography',
      children: [
        ComponentPage(
          description:
              'ChromiaTypography defines 17 text styles organized in a scale from '
              'Display (largest, decorative) to Overline (smallest, all-caps labels). '
              'Styles are accessed through ChromiaTypographyType enum and automatically '
              'inherit the active brand font family.',
          whenToUse:
              'Always use ChromiaText or ChromiaTypographyType.getTextStyle(context) '
              'instead of hardcoded TextStyle — this ensures brand font families '
              'and theme overrides are respected across all apps.',
          children: [
            ComponentSection(
              title: 'Type Scale',
              description:
                  'The complete scale from displayLarge (57px) down to overline (10px). '
                  'Each style shows its name, size, and a sample sentence.',
              child: _TypeScaleDemo(),
            ),
            ComponentSection(
              title: 'Usage',
              description:
                  'Use ChromiaText for themed text, or call getTextStyle(context) '
                  'to get a raw TextStyle for custom widgets.',
              child: ChromiaCodePreview(
                code: '''
// Using ChromiaText widget
ChromiaText(
  'Hello, world!',
  type: ChromiaTypographyType.headlineMedium,
)

// Using getTextStyle for custom widgets
Text(
  'Custom widget',
  style: ChromiaTypographyType.bodyLarge.getTextStyle(context),
)

// Applying a color override
ChromiaText(
  'Muted text',
  type: ChromiaTypographyType.bodyMedium,
  color: context.chromiaColors.onSurfaceVariant,
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChromiaText(
                          'Hello, world!',
                          type: ChromiaTypographyType.headlineMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Custom widget',
                          style: ChromiaTypographyType.bodyLarge
                              .getTextStyle(context),
                        ),
                        const SizedBox(height: 8),
                        ChromiaText(
                          'Muted text',
                          type: ChromiaTypographyType.bodyMedium,
                          color: colors.onSurfaceVariant,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TypeScaleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaSpacing;
    final radius = context.chromiaRadius;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: ChromiaTypographyType.values.map((type) {
        final style = type.getTextStyle(context);
        final fontSize = style.fontSize?.toStringAsFixed(0) ?? '—';
        return Container(
          margin: EdgeInsets.only(bottom: spacing.s),
          padding: spacing.paddingL,
          decoration: BoxDecoration(
            color: colors.surfaceContainer,
            borderRadius: radius.radiusM,
            border: Border.all(color: colors.outlineVariant),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChromiaText(
                      type.name,
                      type: ChromiaTypographyType.labelMedium,
                      color: colors.primary,
                    ),
                    ChromiaText(
                      '${fontSize}sp',
                      type: ChromiaTypographyType.labelSmall,
                      color: colors.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ChromiaText(
                  'The quick brown fox',
                  type: type,
                  color: colors.onSurface,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
