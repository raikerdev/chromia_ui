import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class SnackBarsScreen extends StatelessWidget {
  const SnackBarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'SnackBars',
      children: [
        // SnackBars section
        _buildSnackBarSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildSnackBarSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SnackBars',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVM,

        Text(
          'Basic SnackBars',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaButton(
              onPressed: () {
                showChromiaSnackBar(
                  context: context,
                  message: 'This is a basic snack_bar',
                );
              },
              child: const Text('Show Basic'),
            ),
            ChromiaButton(
              variant: ChromiaButtonVariant.outlined,
              onPressed: () {
                showChromiaSnackBar(
                  context: context,
                  message: 'Action completed',
                  actionLabel: 'UNDO',
                  onActionPressed: () {
                    context.showInfoSnackBar(message: 'Action undone');
                  },
                );
              },
              child: const Text('With Action'),
            ),
          ],
        ),
        spacing.gapVL,

        Text(
          'Styled SnackBars',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaButton(
              onPressed: () {
                context.showSuccessSnackBar(
                  message: 'Changes saved successfully!',
                );
              },
              child: const Text('Success'),
            ),
            ChromiaButton(
              onPressed: () {
                context.showErrorSnackBar(
                  message: 'An error occurred',
                  actionLabel: 'RETRY',
                );
              },
              child: const Text('Error'),
            ),
            ChromiaButton(
              onPressed: () {
                context.showWarningSnackBar(
                  message: 'Please review your text_field',
                );
              },
              child: const Text('Warning'),
            ),
            ChromiaButton(
              onPressed: () {
                context.showInfoSnackBar(
                  message: 'New updates available',
                );
              },
              child: const Text('Info'),
            ),
          ],
        ),
      ],
    );
  }
}
