import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return ExampleScaffold(
      title: 'Buttons',
      children: [
        // Buttons section
        _buildButtonsSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildButtonsSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Button variants
        Text('Variants', style: theme.typography.titleSmall.copyWith(color: colors.textSecondary)),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaButton(variant: ChromiaButtonVariant.filled, onPressed: () {}, child: const Text('Filled')),
            ChromiaButton(variant: ChromiaButtonVariant.outlined, onPressed: () {}, child: const Text('Outlined')),
            ChromiaButton(variant: ChromiaButtonVariant.text, onPressed: () {}, child: const Text('Text')),
            ChromiaButton(variant: ChromiaButtonVariant.tonal, onPressed: () {}, child: const Text('Tonal')),
            ChromiaButton(variant: ChromiaButtonVariant.elevated, onPressed: () {}, child: const Text('Elevated')),
          ],
        ),
        spacing.gapVL,

        // Button sizes
        Text('Sizes', style: theme.typography.titleSmall.copyWith(color: colors.textSecondary)),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ChromiaButton(size: ChromiaButtonSize.small, onPressed: () {}, child: const Text('Small')),
            ChromiaButton(size: ChromiaButtonSize.medium, onPressed: () {}, child: const Text('Medium')),
            ChromiaButton(size: ChromiaButtonSize.large, onPressed: () {}, child: const Text('Large')),
          ],
        ),
        spacing.gapVL,

        // Button states
        Text('States', style: theme.typography.titleSmall.copyWith(color: colors.textSecondary)),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaButton(onPressed: () {}, child: const Text('Enabled')),
            const ChromiaButton(onPressed: null, child: Text('Disabled')),
            ChromiaButton(onPressed: () {}, isLoading: true, child: const Text('Loading')),
          ],
        ),
        spacing.gapVL,

        // Button with icons
        Text('With Icons', style: theme.typography.titleSmall.copyWith(color: colors.textSecondary)),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaButton(onPressed: () {}, icon: const Icon(Icons.add), child: const Text('Leading Icon')),
            ChromiaButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
              iconPosition: IconPosition.trailing,
              child: const Text('Trailing Icon'),
            ),
          ],
        ),
        spacing.gapVL,

        // Full width button
        Text('Full Width', style: theme.typography.titleSmall.copyWith(color: colors.textSecondary)),
        spacing.gapVS,
        ChromiaButton(onPressed: () {}, isFullWidth: true, child: const Text('Full Width Button')),
      ],
    );
  }
}
