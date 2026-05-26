import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogsScreen extends StatelessWidget {
  const DialogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Dialog',
      children: [
        ComponentPage(
          description:
              'Chromia provides helper functions for showing themed dialogs: '
              'showChromiaAlert, showChromiaConfirmDialog, showChromiaDialog '
              '(custom content), ChromiaLoadingDialog, and showChromiaBottomSheet.',
          whenToUse:
              'Use alert dialogs for important information that requires acknowledgement. '
              'Use confirm dialogs for destructive or irreversible actions. '
              'Use custom dialogs for forms or complex interactions. '
              'Use loading dialogs for async operations.',
          children: [
            // ── Alert Dialog ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Alert Dialog',
              description:
                  'showChromiaAlert shows a simple information dialog '
                  'with a dismiss button.',
              child: ChromiaCodePreview(
                code: '''
ChromiaButton(
  onPressed: () {
    showChromiaAlert(
      context: context,
      title: 'Alert',
      message: 'This is an alert message.',
    );
  },
  child: Text('Show Alert'),
)''',
                preview: Builder(
                  builder: (context) => ChromiaButton(
                    onPressed: () {
                      showChromiaAlert(
                        context: context,
                        title: 'Alert',
                        message: 'This is an alert message.',
                      );
                    },
                    child: const Text('Show Alert'),
                  ),
                ),
              ),
            ),

            // ── Confirm Dialog ────────────────────────────────────────────────
            ComponentSection(
              title: 'Confirm Dialog',
              description:
                  'showChromiaConfirmDialog returns a bool — true if confirmed, '
                  'false if cancelled. Use isDestructive: true for dangerous actions.',
              child: ChromiaCodePreview(
                code: '''
// Standard confirm
final confirmed = await showChromiaConfirmDialog(
  context: context,
  title: 'Confirm Action',
  message: 'Are you sure you want to continue?',
);

// Destructive confirm
final deleted = await showChromiaConfirmDialog(
  context: context,
  title: 'Delete Item',
  message: 'This action cannot be undone.',
  confirmLabel: 'Delete',
  isDestructive: true,
);''',
                preview: Builder(
                  builder: (context) => Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      ChromiaButton(
                        onPressed: () async {
                          final confirmed = await showChromiaConfirmDialog(
                            context: context,
                            title: 'Confirm Action',
                            message: 'Are you sure you want to continue?',
                          );
                          if (context.mounted) {
                            context.showInfoSnackBar(
                              message:
                                  confirmed ? 'Confirmed!' : 'Cancelled.',
                            );
                          }
                        },
                        child: const Text('Show Confirm'),
                      ),
                      ChromiaButton(
                        variant: ChromiaButtonVariant.outlined,
                        onPressed: () async {
                          final deleted = await showChromiaConfirmDialog(
                            context: context,
                            title: 'Delete Item',
                            message: 'This action cannot be undone.',
                            confirmLabel: 'Delete',
                            isDestructive: true,
                          );
                          if (context.mounted) {
                            context.showInfoSnackBar(
                              message:
                                  deleted ? 'Deleted!' : 'Cancelled.',
                            );
                          }
                        },
                        child: const Text('Show Destructive'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Custom Dialog ─────────────────────────────────────────────────
            ComponentSection(
              title: 'Custom Dialog',
              description:
                  'showChromiaDialog accepts a contentWidget and a list of '
                  'ChromiaDialogAction buttons.',
              child: ChromiaCodePreview(
                code: '''
showChromiaDialog(
  context: context,
  title: 'Edit Profile',
  contentWidget: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ChromiaTextField(label: 'Name', hintText: 'Enter your name'),
      ChromiaTextField(label: 'Email', hintText: 'Enter your email'),
    ],
  ),
  actions: [
    ChromiaDialogAction(label: 'Cancel', onPressed: () => context.pop()),
    ChromiaDialogAction(label: 'Submit', isPrimary: true, onPressed: () => context.pop()),
  ],
)''',
                preview: Builder(
                  builder: (context) {
                    final spacing = context.chromiaTheme.spacing;
                    return ChromiaButton(
                      onPressed: () {
                        showChromiaDialog(
                          context: context,
                          title: 'Edit Profile',
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
                      child: const Text('Show Custom'),
                    );
                  },
                ),
              ),
            ),

            // ── Loading Dialog ────────────────────────────────────────────────
            ComponentSection(
              title: 'Loading Dialog',
              description:
                  'ChromiaLoadingDialog.show() blocks the UI with a spinner '
                  'during async operations. Call .hide() when done.',
              child: ChromiaCodePreview(
                code: '''
ChromiaLoadingDialog.show(
  context: context,
  message: 'Processing...',
);
await Future.delayed(const Duration(seconds: 2));
if (context.mounted) ChromiaLoadingDialog.hide(context);''',
                preview: Builder(
                  builder: (context) => ChromiaButton(
                    onPressed: () {
                      ChromiaLoadingDialog.show(
                        context: context,
                        message: 'Processing...',
                      );
                      Future.delayed(const Duration(seconds: 2)).then((_) {
                        if (context.mounted) {
                          ChromiaLoadingDialog.hide(context);
                        }
                      });
                    },
                    child: const Text('Show Loading'),
                  ),
                ),
              ),
            ),

            // ── Bottom Sheet ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Bottom Sheet',
              description:
                  'showChromiaBottomSheet slides up a modal sheet from the bottom '
                  'of the screen.',
              child: ChromiaCodePreview(
                code: '''
showChromiaBottomSheet(
  context: context,
  child: Padding(
    padding: spacing.paddingXXL,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChromiaText('Options', style: theme.typography.headlineSmall),
        ...
        ChromiaButton(onPressed: () => context.pop(), child: Text('Close')),
      ],
    ),
  ),
)''',
                preview: Builder(
                  builder: (context) {
                    final theme = context.chromiaTheme;
                    final spacing = theme.spacing;
                    return ChromiaButton(
                      onPressed: () {
                        showChromiaBottomSheet(
                          context: context,
                          child: Container(
                            padding: spacing.paddingXXL,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              children: [
                                ChromiaText(
                                  'Bottom Sheet',
                                  style: theme.typography.headlineSmall,
                                ),
                                spacing.gapVM,
                                ChromiaText(
                                  'Slide up from the bottom for quick actions or supplemental content.',
                                  style: theme.typography.bodyMedium,
                                ),
                                spacing.gapVL,
                                ChromiaButton(
                                  onPressed: () => context.pop(),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: const Text('Show Bottom Sheet'),
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
