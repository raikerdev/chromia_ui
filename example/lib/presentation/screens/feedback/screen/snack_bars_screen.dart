import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SnackBarsScreen extends StatelessWidget {
  const SnackBarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Snack Bar',
      children: [
        ComponentPage(
          description:
              'Chromia provides showChromiaSnackBar for basic snack bars, '
              'and BuildContext extension methods — showSuccessSnackBar, '
              'showErrorSnackBar, showWarningSnackBar, and showInfoSnackBar — '
              'for semantic variants.',
          whenToUse:
              'Use snack bars for brief, non-blocking feedback about completed actions. '
              'Use the success variant after a save or upload. '
              'Use the error variant when an operation fails. '
              'Add an action label for recoverable actions like UNDO.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description:
                  'showChromiaSnackBar displays a neutral message. '
                  'Add actionLabel and onActionPressed for an undo-style action.',
              child: ChromiaCodePreview(
                code: '''
// Basic message
showChromiaSnackBar(
  context: context,
  message: 'This is a basic snack bar',
)

// With action
showChromiaSnackBar(
  context: context,
  message: 'Action completed',
  actionLabel: 'UNDO',
  onActionPressed: () { /* handle undo */ },
)''',
                preview: Builder(
                  builder: (context) => Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ChromiaButton(
                        onPressed: () {
                          showChromiaSnackBar(
                            context: context,
                            message: 'This is a basic snack bar',
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
                              context.showInfoSnackBar(
                                message: 'Action undone',
                              );
                            },
                          );
                        },
                        child: const Text('With Action'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Semantic Variants ─────────────────────────────────────────────
            ComponentSection(
              title: 'Semantic Variants',
              description:
                  'Use context extension methods for pre-styled success, '
                  'error, warning, and info snack bars.',
              child: ChromiaCodePreview(
                code: '''
context.showSuccessSnackBar(message: 'Changes saved successfully!')
context.showErrorSnackBar(message: 'An error occurred', actionLabel: 'RETRY')
context.showWarningSnackBar(message: 'Please review your input')
context.showInfoSnackBar(message: 'New updates available')''',
                preview: Builder(
                  builder: (context) => Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ChromiaButton(
                        onPressed: () => context.showSuccessSnackBar(
                          message: 'Changes saved successfully!',
                        ),
                        child: const Text('Success'),
                      ),
                      ChromiaButton(
                        onPressed: () => context.showErrorSnackBar(
                          message: 'An error occurred',
                          actionLabel: 'RETRY',
                        ),
                        child: const Text('Error'),
                      ),
                      ChromiaButton(
                        onPressed: () => context.showWarningSnackBar(
                          message: 'Please review your input',
                        ),
                        child: const Text('Warning'),
                      ),
                      ChromiaButton(
                        onPressed: () => context.showInfoSnackBar(
                          message: 'New updates available',
                        ),
                        child: const Text('Info'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
