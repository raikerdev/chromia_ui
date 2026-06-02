import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RadioButtonsScreen extends StatelessWidget {
  const RadioButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Radio Button',
      children: [
        ComponentPage(
          description:
              'ChromiaRadioButton allows selecting a single option from a set. '
              'Use ChromiaRadioButtonGroup for grouped options in a vertical or '
              'horizontal layout, and ChromiaListTileRadioButton for settings lists.',
          whenToUse:
              'Use radio buttons when users must choose exactly one option from a small '
              'set (2–6 items). For larger sets, prefer a dropdown. '
              'Use ChromiaRadioButtonGroup to manage state for the whole group easily.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description:
                  'Unselected, selected, and disabled states. '
                  'The groupValue determines which button is active.',
              child: ChromiaCodePreview(
                code: '''
ChromiaRadioButton<String>(
  value: 'option1',
  groupValue: selected,
  onChanged: (value) => setState(() => selected = value!),
)

ChromiaRadioButton<String>(
  value: 'option2',
  groupValue: selected,
  onChanged: (value) => setState(() => selected = value!),
)

// Disabled
ChromiaRadioButton<String>(
  value: 'disabled',
  groupValue: 'disabled',
  onChanged: null,
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    String selected = 'a';
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChromiaRadioButton<String>(
                          value: 'a',
                          groupValue: selected,
                          onChanged: (v) => setState(() => selected = v!),
                        ),
                        const SizedBox(width: 16),
                        ChromiaRadioButton<String>(
                          value: 'b',
                          groupValue: selected,
                          onChanged: (v) => setState(() => selected = v!),
                        ),
                        const SizedBox(width: 16),
                        ChromiaRadioButton<String>(
                          value: 'c',
                          groupValue: selected,
                          onChanged: (v) => setState(() => selected = v!),
                        ),
                        const SizedBox(width: 16),
                        const ChromiaRadioButton<String>(
                          value: 'disabled',
                          groupValue: 'disabled',
                          onChanged: null,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── With Labels ───────────────────────────────────────────────────
            ComponentSection(
              title: 'With Labels',
              description:
                  'Add a label string to show descriptive text beside each radio button.',
              child: ChromiaCodePreview(
                code: '''
ChromiaRadioButton<String>(
  value: 'option1',
  groupValue: selected,
  label: 'Option 1',
  onChanged: (value) => setState(() => selected = value!),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    String selected = 'option1';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChromiaRadioButton<String>(
                          value: 'option1',
                          groupValue: selected,
                          label: 'Option 1',
                          onChanged: (v) => setState(() => selected = v!),
                        ),
                        const SizedBox(height: 8),
                        ChromiaRadioButton<String>(
                          value: 'option2',
                          groupValue: selected,
                          label: 'Option 2',
                          onChanged: (v) => setState(() => selected = v!),
                        ),
                        const SizedBox(height: 8),
                        ChromiaRadioButton<String>(
                          value: 'option3',
                          groupValue: selected,
                          label: 'Option 3',
                          onChanged: (v) => setState(() => selected = v!),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Radio Group (Vertical) ────────────────────────────────────────
            ComponentSection(
              title: 'Radio Group — Vertical',
              description:
                  'ChromiaRadioButtonGroup manages a list of items and their '
                  'shared selection state. Default layout is vertical.',
              child: ChromiaCodePreview(
                code: '''
ChromiaRadioButtonGroup<String>(
  value: selected,
  onChanged: (value) => setState(() => selected = value!),
  items: const [
    ChromiaRadioButtonItem(value: 'small', label: 'Small'),
    ChromiaRadioButtonItem(value: 'medium', label: 'Medium'),
    ChromiaRadioButtonItem(value: 'large', label: 'Large'),
  ],
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    String selected = 'medium';
                    return ChromiaRadioButtonGroup<String>(
                      value: selected,
                      onChanged: (v) => setState(() => selected = v!),
                      items: const [
                        ChromiaRadioButtonItem(
                          value: 'small',
                          label: 'Small',
                        ),
                        ChromiaRadioButtonItem(
                          value: 'medium',
                          label: 'Medium',
                        ),
                        ChromiaRadioButtonItem(
                          value: 'large',
                          label: 'Large',
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Radio Group (Horizontal) ──────────────────────────────────────
            ComponentSection(
              title: 'Radio Group — Horizontal',
              description:
                  'Set direction: Axis.horizontal for a side-by-side layout.',
              child: ChromiaCodePreview(
                code: '''
ChromiaRadioButtonGroup<String>(
  value: selected,
  direction: Axis.horizontal,
  onChanged: (value) => setState(() => selected = value!),
  items: const [
    ChromiaRadioButtonItem(value: 'S', label: 'S'),
    ChromiaRadioButtonItem(value: 'M', label: 'M'),
    ChromiaRadioButtonItem(value: 'L', label: 'L'),
  ],
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    String selected = 'M';
                    return ChromiaRadioButtonGroup<String>(
                      value: selected,
                      direction: Axis.horizontal,
                      onChanged: (v) => setState(() => selected = v!),
                      items: const [
                        ChromiaRadioButtonItem(value: 'S', label: 'S'),
                        ChromiaRadioButtonItem(value: 'M', label: 'M'),
                        ChromiaRadioButtonItem(value: 'L', label: 'L'),
                        ChromiaRadioButtonItem(value: 'XL', label: 'XL'),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Radio Tiles ───────────────────────────────────────────────────
            ComponentSection(
              title: 'Radio Tiles',
              description:
                  'ChromiaListTileRadioButton embeds a radio button inside a '
                  'list tile — ideal for plan/option selection screens.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTileRadioButton<String>(
  value: 'pro',
  groupValue: selected,
  onChanged: (value) => setState(() => selected = value!),
  title: ChromiaText('Pro Plan'),
  subtitle: ChromiaText('For professionals'),
  leading: Icon(Icons.work),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    String selected = 'basic';
                    final colors = context.chromiaColors;
                    final theme = context.chromiaTheme;
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.outline),
                        borderRadius: theme.radius.radiusM,
                      ),
                      child: Column(
                        children: [
                          ChromiaListTileRadioButton<String>(
                            value: 'basic',
                            groupValue: selected,
                            onChanged: (v) =>
                                setState(() => selected = v!),
                            title: const ChromiaText('Basic Plan'),
                            subtitle: const ChromiaText('For individuals'),
                            leading: Icon(
                              Icons.person,
                              color: colors.primary,
                            ),
                          ),
                          Divider(height: 1, color: colors.outline),
                          ChromiaListTileRadioButton<String>(
                            value: 'pro',
                            groupValue: selected,
                            onChanged: (v) =>
                                setState(() => selected = v!),
                            title: const ChromiaText('Pro Plan'),
                            subtitle: const ChromiaText(
                              'For professionals',
                            ),
                            leading: Icon(
                              Icons.work,
                              color: colors.primary,
                            ),
                          ),
                          Divider(height: 1, color: colors.outline),
                          ChromiaListTileRadioButton<String>(
                            value: 'enterprise',
                            groupValue: selected,
                            onChanged: (v) =>
                                setState(() => selected = v!),
                            title: const ChromiaText('Enterprise Plan'),
                            subtitle: const ChromiaText(
                              'For organizations',
                            ),
                            leading: Icon(
                              Icons.business,
                              color: colors.primary,
                            ),
                          ),
                        ],
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
