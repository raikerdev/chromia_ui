import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DividersScreen extends StatelessWidget {
  const DividersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Divider',
      children: [
        ComponentPage(
          description:
              'ChromiaDivider separates content with a horizontal or vertical line. '
              'It supports text and icon variants for labeled section breaks, '
              'and ChromiaSectionDivider for titled list sections with optional actions.',
          whenToUse:
              'Use dividers to visually separate groups of related content. '
              'Use ChromiaDivider.withText for auth screens with an "OR" separator. '
              'Use ChromiaSectionDivider as a list section header with an optional action.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description:
                  'A simple horizontal divider. '
                  'Customize with thickness, indent, and color.',
              child: ChromiaCodePreview(
                code: '''
// Default
ChromiaDivider()

// Custom thickness
ChromiaDivider(thickness: 2)

// With indent
ChromiaDivider(indent: 16, endIndent: 16, thickness: 2)''',
                preview: const Column(
                  children: [
                    ChromiaDivider(),
                    SizedBox(height: 12),
                    ChromiaDivider(thickness: 2),
                    SizedBox(height: 12),
                    ChromiaDivider(
                      indent: 16,
                      endIndent: 16,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ),

            // ── With Text ─────────────────────────────────────────────────────
            ComponentSection(
              title: 'With Text',
              description:
                  'ChromiaDivider.withText() centers a label between two lines. '
                  'Commonly used as an "OR" separator on auth screens.',
              child: ChromiaCodePreview(
                code: '''
ChromiaDivider.withText(text: 'OR')
ChromiaDivider.withText(text: 'CONTINUE WITH')''',
                preview: Column(
                  children: [
                    ChromiaDivider.withText(text: 'OR'),
                    const SizedBox(height: 12),
                    ChromiaDivider.withText(text: 'CONTINUE WITH'),
                  ],
                ),
              ),
            ),

            // ── With Icon ─────────────────────────────────────────────────────
            ComponentSection(
              title: 'With Icon',
              description:
                  'ChromiaDivider.withIcon() centers an icon between two lines.',
              child: ChromiaCodePreview(
                code: '''
ChromiaDivider.withIcon(icon: Icons.star)
ChromiaDivider.withIcon(icon: Icons.favorite)''',
                preview: Column(
                  children: [
                    ChromiaDivider.withIcon(icon: Icons.star),
                    const SizedBox(height: 12),
                    ChromiaDivider.withIcon(icon: Icons.favorite),
                  ],
                ),
              ),
            ),

            // ── Vertical ──────────────────────────────────────────────────────
            ComponentSection(
              title: 'Vertical',
              description:
                  'Use ChromiaDivider.vertical() inside a Row to separate '
                  'inline items such as toolbar actions or tab labels.',
              child: ChromiaCodePreview(
                code: '''
SizedBox(
  height: 50,
  child: Row(
    children: [
      Text('Item 1'),
      ChromiaDivider.vertical(height: 40),
      Text('Item 2'),
      ChromiaDivider.vertical(height: 40),
      Text('Item 3'),
    ],
  ),
)''',
                preview: const SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Item 1'),
                      ChromiaDivider.vertical(height: 40),
                      Text('Item 2'),
                      ChromiaDivider.vertical(height: 40),
                      Text('Item 3'),
                    ],
                  ),
                ),
              ),
            ),

            // ── Section Divider ───────────────────────────────────────────────
            ComponentSection(
              title: 'Section Divider',
              description:
                  'ChromiaSectionDivider renders a titled label with an optional '
                  'trailing action — ideal for grouped list section headers.',
              child: ChromiaCodePreview(
                code: '''
ChromiaSectionDivider(
  title: 'Settings',
  trailing: ChromiaButton(
    variant: ChromiaButtonVariant.text,
    size: ChromiaButtonSize.small,
    onPressed: () {},
    child: Text('View All'),
  ),
)''',
                preview: Builder(
                  builder: (context) => ChromiaSectionDivider(
                    title: 'Settings',
                    trailing: ChromiaButton(
                      size: ChromiaButtonSize.small,
                      variant: ChromiaButtonVariant.text,
                      onPressed: () {},
                      child: const Text('View All'),
                    ),
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
