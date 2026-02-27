import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TooltipsScreen extends StatelessWidget {
  const TooltipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Tooltips',
      children: [
        // Tooltip section
        _buildTooltipSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildTooltipSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic tooltips
        ChromiaText(
          'Basic Tooltips',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaText(
          'Hover or long-press on the icons to see tooltips',
          style: theme.typography.bodySmall.copyWith(
            color: colors.textTertiary,
          ),
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.m,
          children: [
            ChromiaTooltip(
              message: 'This is a home icon',
              child: Icon(Icons.home, size: 32, color: colors.primary),
            ),
            ChromiaTooltip(
              message: 'This is a favorite icon',
              child: Icon(Icons.favorite, size: 32, color: colors.error),
            ),
            ChromiaTooltip(
              message: 'This is a star icon',
              child: Icon(Icons.star, size: 32, color: colors.warning),
            ),
            ChromiaTooltip(
              message: 'This is a settings icon',
              child: Icon(Icons.settings, size: 32, color: colors.textPrimary),
            ),
          ],
        ),
        spacing.gapVL,

        // Rich tooltips
        ChromiaText(
          'Rich Tooltips',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.m,
          children: [
            ChromiaTooltip.rich(
              title: 'Help',
              message: 'This is a detailed tooltip with additional information.',
              child: Icon(Icons.help_outline, size: 32, color: colors.info),
            ),
            ChromiaTooltip.rich(
              title: 'Information',
              message: 'Rich tooltips can contain longer descriptions and explanations.',
              child: Icon(Icons.info_outline, size: 32, color: colors.primary),
            ),
          ],
        ),
        spacing.gapVL,

        // Help icons
        ChromiaText(
          'Help Icons',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            ChromiaText(
              'Username',
              style: theme.typography.bodyMedium,
            ),
            spacing.gapHXS,
            const ChromiaHelpIcon(
              message: 'Enter your unique username',
            ),
            const Spacer(),
            ChromiaText(
              'Email',
              style: theme.typography.bodyMedium,
            ),
            spacing.gapHXS,
            const ChromiaHelpIcon(
              message: 'Your email address for notifications',
            ),
          ],
        ),
        spacing.gapVL,

        // Tooltips on buttons
        ChromiaText(
          'Tooltips on Buttons',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaTooltip(
              message: 'Save your changes',
              child: ChromiaButton(
                onPressed: () {},
                icon: const Icon(Icons.save),
                child: const ChromiaText('Save'),
              ),
            ),
            ChromiaTooltip(
              message: 'Discard all changes',
              child: ChromiaButton(
                variant: ChromiaButtonVariant.outlined,
                onPressed: () {},
                icon: const Icon(Icons.cancel),
                child: const ChromiaText('Cancel'),
              ),
            ),
          ],
        ),
        spacing.gapVL,

        // Long press tooltip
        ChromiaText(
          'Long Press Tooltip',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaText(
          'Long press on the card below to see the tooltip',
          style: theme.typography.bodySmall.copyWith(
            color: colors.textTertiary,
          ),
        ),
        spacing.gapVS,
        ChromiaLongPressTooltip(
          message: 'You activated the long press tooltip!',
          duration: const Duration(seconds: 3),
          child: ChromiaCard(
            child: Row(
              children: [
                Icon(Icons.touch_app, color: colors.primary),
                spacing.gapHM,
                const Expanded(
                  child: ChromiaText('Long press here'),
                ),
              ],
            ),
          ),
        ),
        spacing.gapVL,

        // Tooltips in a form example
        ChromiaText(
          'Tooltips in Form',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ChromiaText(
                      'Account Settings',
                      style: theme.typography.titleMedium,
                    ),
                  ),
                  const ChromiaHelpIcon(
                    message: 'Configure your account preferences',
                  ),
                ],
              ),
              spacing.gapVM,
              Row(
                children: [
                  Expanded(
                    child: ChromiaText(
                      'Email Notifications',
                      style: theme.typography.bodyMedium,
                    ),
                  ),
                  const ChromiaHelpIcon(
                    message: 'Receive updates via email',
                  ),
                  spacing.gapHM,
                  ChromiaToggleButton(
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
              spacing.gapVM,
              Row(
                children: [
                  Expanded(
                    child: ChromiaText(
                      'Push Notifications',
                      style: theme.typography.bodyMedium,
                    ),
                  ),
                  const ChromiaHelpIcon(
                    message: 'Receive push notifications on your device',
                  ),
                  spacing.gapHM,
                  ChromiaToggleButton(
                    value: false,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
