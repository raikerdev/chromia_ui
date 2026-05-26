import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TooltipsScreen extends StatelessWidget {
  const TooltipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Tooltip',
      children: [
        ComponentPage(
          description:
              'ChromiaTooltip wraps any widget and shows a message on hover '
              'or long-press. ChromiaTooltip.rich adds a title for richer content. '
              'ChromiaHelpIcon is a pre-built help icon with an inline tooltip. '
              'ChromiaLongPressTooltip is optimized for touch targets.',
          whenToUse:
              'Use tooltips to explain icon-only buttons and less obvious UI elements. '
              'Use ChromiaHelpIcon next to form labels that need extra clarification. '
              'On mobile, tooltips trigger on long-press; on desktop, on hover.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description:
                  'Wrap any widget with ChromiaTooltip. '
                  'Hover over or long-press the icons to see the tooltips.',
              child: ChromiaCodePreview(
                code: '''
ChromiaTooltip(
  message: 'This is a home icon',
  child: Icon(Icons.home, size: 32),
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Wrap(
                      spacing: 24,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ChromiaTooltip(
                          message: 'This is a home icon',
                          child: Icon(
                            Icons.home,
                            size: 32,
                            color: colors.primary,
                          ),
                        ),
                        ChromiaTooltip(
                          message: 'Add to favorites',
                          child: Icon(
                            Icons.favorite,
                            size: 32,
                            color: colors.error,
                          ),
                        ),
                        ChromiaTooltip(
                          message: 'Mark as starred',
                          child: Icon(
                            Icons.star,
                            size: 32,
                            color: colors.warning,
                          ),
                        ),
                        ChromiaTooltip(
                          message: 'Open settings',
                          child: Icon(
                            Icons.settings,
                            size: 32,
                            color: colors.onSurface,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Rich Tooltips ─────────────────────────────────────────────────
            ComponentSection(
              title: 'Rich Tooltips',
              description:
                  'ChromiaTooltip.rich adds a bold title above the message '
                  'for more informative tooltips.',
              child: ChromiaCodePreview(
                code: '''
ChromiaTooltip.rich(
  title: 'Help',
  message: 'Detailed explanation of this feature.',
  child: Icon(Icons.help_outline, size: 32),
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Wrap(
                      spacing: 24,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ChromiaTooltip.rich(
                          title: 'Help',
                          message:
                              'This is a detailed tooltip with additional information.',
                          child: Icon(
                            Icons.help_outline,
                            size: 32,
                            color: colors.info,
                          ),
                        ),
                        ChromiaTooltip.rich(
                          title: 'Information',
                          message:
                              'Rich tooltips can contain longer descriptions.',
                          child: Icon(
                            Icons.info_outline,
                            size: 32,
                            color: colors.primary,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Help Icon ─────────────────────────────────────────────────────
            ComponentSection(
              title: 'Help Icon',
              description:
                  'ChromiaHelpIcon is a small inline tooltip icon — '
                  'place it next to form labels for quick hints.',
              child: ChromiaCodePreview(
                code: '''
Row(
  children: [
    Text('Username'),
    SizedBox(width: 4),
    ChromiaHelpIcon(message: 'Enter your unique username'),
  ],
)''',
                preview: Builder(
                  builder: (context) {
                    final theme = context.chromiaTheme;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ChromiaText(
                              'Username',
                              style: theme.typography.bodyMedium,
                            ),
                            const SizedBox(width: 4),
                            const ChromiaHelpIcon(
                              message: 'Enter your unique username',
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ChromiaText(
                              'Email',
                              style: theme.typography.bodyMedium,
                            ),
                            const SizedBox(width: 4),
                            const ChromiaHelpIcon(
                              message:
                                  'Your email address for account notifications',
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Tooltips on Buttons ───────────────────────────────────────────
            ComponentSection(
              title: 'Tooltips on Buttons',
              description:
                  'Wrap any widget including buttons. Useful for icon-only action bars.',
              child: ChromiaCodePreview(
                code: '''
ChromiaTooltip(
  message: 'Save your changes',
  child: ChromiaButton(
    icon: Icon(Icons.save),
    onPressed: () {},
    child: Text('Save'),
  ),
)''',
                preview: Builder(
                  builder: (context) => Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      ChromiaTooltip(
                        message: 'Save your changes',
                        child: ChromiaButton(
                          onPressed: () {},
                          icon: const Icon(Icons.save),
                          child: const Text('Save'),
                        ),
                      ),
                      ChromiaTooltip(
                        message: 'Discard all changes',
                        child: ChromiaButton(
                          variant: ChromiaButtonVariant.outlined,
                          onPressed: () {},
                          icon: const Icon(Icons.cancel),
                          child: const Text('Cancel'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Long Press ────────────────────────────────────────────────────
            ComponentSection(
              title: 'Long Press Tooltip',
              description:
                  'ChromiaLongPressTooltip is optimized for touch — '
                  'it shows on long-press and auto-dismisses after duration.',
              child: ChromiaCodePreview(
                code: '''
ChromiaLongPressTooltip(
  message: 'You activated the long press tooltip!',
  duration: Duration(seconds: 3),
  child: ChromiaCard(child: Text('Long press here')),
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return ChromiaLongPressTooltip(
                      message: 'You activated the long press tooltip!',
                      duration: const Duration(seconds: 3),
                      child: ChromiaCard(
                        child: Row(
                          children: [
                            Icon(
                              Icons.touch_app,
                              color: colors.primary,
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: ChromiaText('Long press here'),
                            ),
                          ],
                        ),
                      ),
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
