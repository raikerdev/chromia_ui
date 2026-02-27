import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Progress',
      children: [
        // Progress section
        _buildProgressSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildProgressSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Linear progress
        ChromiaText(
          'Linear Progress',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaLinearProgress(value: 0.3),
        spacing.gapVM,
        const ChromiaLinearProgress(value: 0.6),
        spacing.gapVM,
        const ChromiaLinearProgress(value: 0.9),
        spacing.gapVL,

        // With label
        ChromiaText(
          'With Label',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaLinearProgress(
          value: 0.65,
          showLabel: true,
        ),
        spacing.gapVL,

        // Indeterminate
        ChromiaText(
          'Indeterminate',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaLinearProgress(),
        spacing.gapVL,

        // Circular progress
        ChromiaText(
          'Circular Progress',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            const ChromiaCircularProgress(value: 0.25),
            spacing.gapHXL,
            const ChromiaCircularProgress(value: 0.5),
            spacing.gapHXL,
            const ChromiaCircularProgress(value: 0.75),
            spacing.gapHXL,
            const ChromiaCircularProgress(),
          ],
        ),
        spacing.gapVL,

        // Circular with label
        ChromiaText(
          'Circular with Label',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            const ChromiaCircularProgress(
              value: 0.33,
              showLabel: true,
            ),
            spacing.gapHXL,
            const ChromiaCircularProgress(
              value: 0.67,
              showLabel: true,
            ),
            spacing.gapHXL,
            const ChromiaCircularProgress(
              value: 1.0,
              showLabel: true,
            ),
          ],
        ),
        spacing.gapVL,

        // Customizable progress
        ChromiaText(
          'Customizable Progress',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaLinearProgress(
          value: 0.3,
          color: Colors.red,
          backgroundColor: Colors.green,
          height: 16,
        ),
        spacing.gapVM,
        const ChromiaLinearProgress(
          color: Colors.red,
          backgroundColor: Colors.green,
          height: 16,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        spacing.gapVM,
        Row(
          children: [
            const ChromiaCircularProgress(
              value: 0.3,
              color: Colors.red,
              backgroundColor: Colors.green,
              strokeWidth: 8,
              size: 60,
            ),
            spacing.gapHM,
            const ChromiaCircularProgress(
              color: Colors.red,
              backgroundColor: Colors.green,
              child: Icon(Icons.star),
            ),
          ],
        ),
        spacing.gapVL,

        // Stepped progress
        ChromiaText(
          'Stepped Progress',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaSteppedProgress(
          currentStep: 0,
          totalSteps: 4,
        ),
        spacing.gapVM,
        const ChromiaSteppedProgress(
          currentStep: 1,
          totalSteps: 4,
        ),
        spacing.gapVM,
        const ChromiaSteppedProgress(
          currentStep: 2,
          totalSteps: 4,
        ),
        spacing.gapVM,
        const ChromiaSteppedProgress(
          currentStep: 3,
          totalSteps: 4,
        ),
        spacing.gapVL,
      ],
    );
  }
}
