import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: ChromiaTypographyType.values.map((type) => _buildTypographyExample(context, type.name, type)).toList(),
    );
  }

  Widget _buildTypographyExample(BuildContext context, String label, ChromiaTypographyType type) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaSpacing;
    final fontSize = type.getTextStyle(context).fontSize;
    return Padding(
      padding: spacing.verticalS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChromiaText(
            '$label (font-size: $fontSize)',
            type: ChromiaTypographyType.labelMedium,
            color: colors.primary,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ChromiaText(
            'The quick brown fox jumps over the lazy dog',
            type: type,
            color: colors.textPrimary,
          ),
        ],
      ),
    );
  }
}
