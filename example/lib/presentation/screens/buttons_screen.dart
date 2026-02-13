import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  ChromiaButtonVariant _variant = ChromiaButtonVariant.filled;

  void _setVariant(ChromiaButtonVariant variant) {
    setState(() {
      _variant = variant;
    });
  }

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Button variants
        Text('Variants', style: theme.typography.titleSmall.copyWith(color: colors.textSecondary)),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaButton(
              variant: ChromiaButtonVariant.filled,
              onPressed: () => _setVariant(ChromiaButtonVariant.filled),
              child: const Text('Filled'),
            ),
            ChromiaButton(
              variant: ChromiaButtonVariant.outlined,
              onPressed: () => _setVariant(ChromiaButtonVariant.outlined),
              child: const Text('Outlined'),
            ),
            ChromiaButton(
              variant: ChromiaButtonVariant.text,
              onPressed: () => _setVariant(ChromiaButtonVariant.text),
              child: const Text('Text'),
            ),
            ChromiaButton(
              variant: ChromiaButtonVariant.tonal,
              onPressed: () => _setVariant(ChromiaButtonVariant.tonal),
              child: const Text('Tonal'),
            ),
            ChromiaButton(
              variant: ChromiaButtonVariant.elevated,
              onPressed: () => _setVariant(ChromiaButtonVariant.elevated),
              child: const Text('Elevated'),
            ),
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
            ChromiaButton(variant: _variant, size: ChromiaButtonSize.small, onPressed: () {}, child: const Text('Small')),
            ChromiaButton(variant: _variant, size: ChromiaButtonSize.medium, onPressed: () {}, child: const Text('Medium')),
            ChromiaButton(variant: _variant, size: ChromiaButtonSize.large, onPressed: () {}, child: const Text('Large')),
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
            ChromiaButton(variant: _variant, onPressed: () {}, child: const Text('Enabled')),
            ChromiaButton(variant: _variant, onPressed: null, child: const Text('Disabled')),
            ChromiaButton(variant: _variant, onPressed: () {}, isLoading: true, child: const Text('Loading')),
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
            ChromiaButton(
              variant: _variant,
              onPressed: () {},
              icon: const Icon(Icons.add),
              child: const Text('Leading Icon'),
            ),
            ChromiaButton(
              variant: _variant,
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
        ChromiaButton(variant: _variant, onPressed: () {}, isFullWidth: true, child: const Text('Full Width Button')),
      ],
    );
  }
}
