import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Button',
      children: [
        ComponentPage(
          description:
              'Buttons allow users to take actions and make choices with a single tap. '
              'ChromiaButton supports multiple visual variants, three sizes, '
              'loading and disabled states, and optional leading/trailing icons.',
          whenToUse:
              'Use Filled for the primary action on a screen. '
              'Use Outlined or Text for secondary actions. '
              'Use Tonal when you need emphasis without the full weight of a filled button. '
              'Use Elevated when the button needs to stand out from the background.',
          children: [
            // ── Variants ─────────────────────────────────────────────────────
            ComponentSection(
              title: 'Variants',
              description:
                  'Five style variants to match different levels of emphasis.',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Filled',
                    description:
                        'Maximum emphasis. Use for the single primary action on a screen.',
                    code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.filled,
  onPressed: () {},
  child: const Text('Filled'),
)''',
                    preview: ChromiaButton(
                      variant: ChromiaButtonVariant.filled,
                      onPressed: () {},
                      child: const Text('Filled'),
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Outlined',
                    description:
                        'Medium emphasis. Ideal for secondary actions alongside a filled button.',
                    code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.outlined,
  onPressed: () {},
  child: const Text('Outlined'),
)''',
                    preview: ChromiaButton(
                      variant: ChromiaButtonVariant.outlined,
                      onPressed: () {},
                      child: const Text('Outlined'),
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Text',
                    description:
                        'Lowest emphasis. Use for tertiary or inline actions.',
                    code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.text,
  onPressed: () {},
  child: const Text('Text'),
)''',
                    preview: ChromiaButton(
                      variant: ChromiaButtonVariant.text,
                      onPressed: () {},
                      child: const Text('Text'),
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Tonal',
                    description:
                        'Filled with the secondary container color. A softer alternative to Filled.',
                    code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.tonal,
  onPressed: () {},
  child: const Text('Tonal'),
)''',
                    preview: ChromiaButton(
                      variant: ChromiaButtonVariant.tonal,
                      onPressed: () {},
                      child: const Text('Tonal'),
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Elevated',
                    description:
                        'Raised with a shadow. Use when the button must stand out from a flat surface.',
                    code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.elevated,
  onPressed: () {},
  child: const Text('Elevated'),
)''',
                    preview: ChromiaButton(
                      variant: ChromiaButtonVariant.elevated,
                      onPressed: () {},
                      child: const Text('Elevated'),
                    ),
                  ),
                ],
              ),
            ),

            // ── Sizes ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Sizes',
              description:
                  'Three sizes — small, medium (default), and large — to fit different layout densities.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
// Small
ChromiaButton(
  size: ChromiaButtonSize.small,
  onPressed: () {},
  child: const Text('Small'),
)

// Medium (default)
ChromiaButton(
  size: ChromiaButtonSize.medium,
  onPressed: () {},
  child: const Text('Medium'),
)

// Large
ChromiaButton(
  size: ChromiaButtonSize.large,
  onPressed: () {},
  child: const Text('Large'),
)''',
                preview: Wrap(
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ChromiaButton(
                      size: ChromiaButtonSize.small,
                      onPressed: () {},
                      child: const Text('Small'),
                    ),
                    ChromiaButton(
                      size: ChromiaButtonSize.medium,
                      onPressed: () {},
                      child: const Text('Medium'),
                    ),
                    ChromiaButton(
                      size: ChromiaButtonSize.large,
                      onPressed: () {},
                      child: const Text('Large'),
                    ),
                  ],
                ),
              ),
            ),

            // ── States ────────────────────────────────────────────────────────
            ComponentSection(
              title: 'States',
              description:
                  'Buttons adapt visually to enabled, disabled, and loading states. '
                  'Set onPressed to null to disable; set isLoading: true for async actions.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
// Enabled
ChromiaButton(
  onPressed: () {},
  child: const Text('Enabled'),
)

// Disabled — onPressed: null
ChromiaButton(
  onPressed: null,
  child: const Text('Disabled'),
)

// Loading
ChromiaButton(
  isLoading: true,
  onPressed: () {},
  child: const Text('Loading'),
)''',
                preview: Wrap(
                  spacing: 12,
                  children: [
                    ChromiaButton(
                      onPressed: () {},
                      child: const Text('Enabled'),
                    ),
                    const ChromiaButton(
                      onPressed: null,
                      child: Text('Disabled'),
                    ),
                    ChromiaButton(
                      isLoading: true,
                      onPressed: () {},
                      child: const Text('Loading'),
                    ),
                  ],
                ),
              ),
            ),

            // ── Icons ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'With Icons',
              description:
                  'Add an icon to the leading or trailing position using icon and iconPosition.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
// Leading icon (default)
ChromiaButton(
  icon: const Icon(Icons.add),
  onPressed: () {},
  child: const Text('Add item'),
)

// Trailing icon
ChromiaButton(
  icon: const Icon(Icons.arrow_forward),
  iconPosition: IconPosition.trailing,
  onPressed: () {},
  child: const Text('Continue'),
)''',
                preview: Wrap(
                  spacing: 12,
                  children: [
                    ChromiaButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                      child: const Text('Add item'),
                    ),
                    ChromiaButton(
                      icon: const Icon(Icons.arrow_forward),
                      iconPosition: IconPosition.trailing,
                      onPressed: () {},
                      child: const Text('Continue'),
                    ),
                  ],
                ),
              ),
            ),

            // ── Full Width ────────────────────────────────────────────────────
            ComponentSection(
              title: 'Full Width',
              description:
                  'Set isFullWidth: true to stretch the button to fill its parent.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
ChromiaButton(
  isFullWidth: true,
  onPressed: () {},
  child: const Text('Full Width Button'),
)''',
                preview: ChromiaButton(
                  isFullWidth: true,
                  onPressed: () {},
                  child: const Text('Full Width Button'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
