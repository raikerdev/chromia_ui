import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return ExampleScaffold(
      title: 'Typography',
      children: [
        // Typography section
        _buildTypographySection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildTypographySection(BuildContext context) {
    final theme = context.chromiaTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TypographyExample(label: 'Display Large', style: theme.typography.displayLarge),
        _TypographyExample(label: 'Display Medium', style: theme.typography.displayMedium),
        _TypographyExample(label: 'Display Small', style: theme.typography.displaySmall),
        _TypographyExample(label: 'Headline Large', style: theme.typography.headlineLarge),
        _TypographyExample(label: 'Headline Medium', style: theme.typography.headlineMedium),
        _TypographyExample(label: 'Headline Small', style: theme.typography.headlineSmall),
        _TypographyExample(label: 'Body Large', style: theme.typography.bodyLarge),
        _TypographyExample(label: 'Body Medium', style: theme.typography.bodyMedium),
        _TypographyExample(label: 'Body Small', style: theme.typography.bodySmall),
      ],
    );
  }
}

class _TypographyExample extends StatelessWidget {
  const _TypographyExample({required this.label, required this.style});

  final String label;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaSpacing;

    return Padding(
      padding: spacing.verticalS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label (font-size: ${style.fontSize})', style: TextStyle(fontSize: 12, color: colors.textTertiary)),
          Text('The quick brown fox jumps over the lazy dog', style: style.copyWith(color: colors.textPrimary)),
        ],
      ),
    );
  }
}
