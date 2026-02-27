import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogsScreen extends StatelessWidget {
  const DialogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Dialogs',
      children: [
        // Dialogs section
        _buildDialogSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildDialogSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Alert dialog
        ChromiaText(
          'Alert Dialog',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaButton(
          onPressed: () {
            showChromiaAlert(
              context: context,
              title: 'Alert',
              message: 'This is an alert message.',
            );
          },
          child: const ChromiaText('Show Alert'),
        ),
        spacing.gapVL,

        // Confirm dialog
        ChromiaText(
          'Confirm Dialog',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            ChromiaButton(
              onPressed: () async {
                final confirmed = await showChromiaConfirmDialog(
                  context: context,
                  title: 'Confirm Action',
                  message: 'Are you sure you want to continue?',
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: ChromiaText(confirmed ? 'Confirmed' : 'Cancelled'),
                    ),
                  );
                }
              },
              child: const ChromiaText('Show Confirm'),
            ),
            spacing.gapHM,
            ChromiaButton(
              variant: ChromiaButtonVariant.outlined,
              onPressed: () async {
                final confirmed = await showChromiaConfirmDialog(
                  context: context,
                  title: 'Delete Item',
                  message: 'This action cannot be undone.',
                  confirmLabel: 'Delete',
                  isDestructive: true,
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: ChromiaText(confirmed ? 'Deleted' : 'Cancelled'),
                    ),
                  );
                }
              },
              child: const ChromiaText('Show Destructive'),
            ),
          ],
        ),
        spacing.gapVL,

        // Custom dialog
        ChromiaText(
          'Custom Dialog',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaButton(
          onPressed: () {
            showChromiaDialog(
              context: context,
              title: 'Custom Dialog',
              contentWidget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ChromiaTextField(
                    label: 'Name',
                    hintText: 'Enter your name',
                  ),
                  spacing.gapVM,
                  const ChromiaTextField(
                    label: 'Email',
                    hintText: 'Enter your email',
                  ),
                ],
              ),
              actions: [
                ChromiaDialogAction(
                  label: 'Cancel',
                  onPressed: () => context.pop(),
                ),
                ChromiaDialogAction(
                  label: 'Submit',
                  isPrimary: true,
                  onPressed: () => context.pop(),
                ),
              ],
            );
          },
          child: const ChromiaText('Show Custom'),
        ),
        spacing.gapVL,

        // Loading dialog
        ChromiaText(
          'Loading Dialog',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaButton(
          onPressed: () async {
            ChromiaLoadingDialog.show(
              context: context,
              message: 'Processing...',
            );
            await Future.delayed(const Duration(seconds: 2));
            if (context.mounted) {
              ChromiaLoadingDialog.hide(context);
            }
          },
          child: const ChromiaText('Show Loading'),
        ),
        spacing.gapVL,

        // Bottom sheet
        ChromiaText(
          'Bottom Sheet',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaButton(
          onPressed: () {
            showChromiaBottomSheet(
              context: context,
              child: Container(
                padding: spacing.paddingXXL,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ChromiaText(
                      'Bottom Sheet',
                      style: theme.typography.headlineSmall,
                    ),
                    spacing.gapVM,
                    ChromiaText(
                      'This is a bottom sheet dialog.',
                      style: theme.typography.bodyMedium,
                    ),
                    spacing.gapVL,
                    ChromiaButton(
                      onPressed: () => context.pop(),
                      child: const ChromiaText('Close'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const ChromiaText('Show Bottom Sheet'),
        ),
      ],
    );
  }
}
