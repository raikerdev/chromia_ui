import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CheckboxesScreen extends StatelessWidget {
  const CheckboxesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Checkbox',
      children: [
        ComponentPage(
          description:
              'ChromiaCheckbox is a themed checkbox that supports checked, unchecked, '
              'and tristate (indeterminate) states. It can display a label, use custom '
              'icons and colors, and be embedded inside list tiles.',
          whenToUse:
              'Use checkboxes when users need to select one or more options independently. '
              'Use ChromiaListTileCheckbox for settings screens where each option needs '
              'a title and description. Prefer a toggle button for binary on/off preferences.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description:
                  'Checked, unchecked, and disabled states. '
                  'Pass onChanged: null to disable.',
              child: ChromiaCodePreview(
                code: '''
// Unchecked
ChromiaCheckbox(
  value: false,
  onChanged: (value) => setState(() => checked = value ?? false),
)

// Checked
ChromiaCheckbox(
  value: true,
  onChanged: (value) => setState(() => checked = value ?? false),
)

// Disabled
ChromiaCheckbox(
  value: true,
  onChanged: null,
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool checked = false;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChromiaCheckbox(
                          value: checked,
                          onChanged: (value) {
                            setState(() => checked = value ?? false);
                          },
                        ),
                        const SizedBox(width: 16),
                        ChromiaCheckbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        const SizedBox(width: 16),
                        const ChromiaCheckbox(
                          value: true,
                          onChanged: null,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Tristate ──────────────────────────────────────────────────────
            ComponentSection(
              title: 'Tristate',
              description:
                  'Set tristate: true to allow a null (indeterminate) state — '
                  'useful for "select all" controls.',
              child: ChromiaCodePreview(
                code: '''
ChromiaCheckbox(
  value: null,   // indeterminate
  tristate: true,
  onChanged: (value) => setState(() => tristate = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool? tristate;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChromiaCheckbox(
                          value: tristate,
                          tristate: true,
                          onChanged: (value) {
                            setState(() => tristate = value);
                          },
                        ),
                        const SizedBox(width: 16),
                        const ChromiaCheckbox(
                          value: null,
                          tristate: true,
                          onChanged: null,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── With Label ────────────────────────────────────────────────────
            ComponentSection(
              title: 'With Label',
              description:
                  'Provide a label string to show a tappable text label beside the checkbox.',
              child: ChromiaCodePreview(
                code: '''
ChromiaCheckbox(
  value: accepted,
  label: 'Accept terms and conditions',
  onChanged: (value) => setState(() => accepted = value ?? false),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool accepted = false;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChromiaCheckbox(
                          value: accepted,
                          label: 'Accept terms and conditions',
                          onChanged: (value) {
                            setState(() => accepted = value ?? false);
                          },
                        ),
                        const SizedBox(height: 8),
                        const ChromiaCheckbox(
                          value: true,
                          label: 'Subscribe to newsletter',
                          onChanged: null,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Custom Icons & Colors ─────────────────────────────────────────
            ComponentSection(
              title: 'Custom Icons & Colors',
              description:
                  'Customize the check icon, tristate icon, size, '
                  'checkColor, and activeColor.',
              child: ChromiaCodePreview(
                code: '''
ChromiaCheckbox(
  value: checked,
  size: 36,
  checkIcon: Icons.star,
  checkColor: Colors.amber,
  activeColor: Colors.cyan,
  onChanged: (value) => setState(() => checked = value ?? false),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool checked = true;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChromiaCheckbox(
                          value: checked,
                          size: 36,
                          checkIcon: Icons.star,
                          checkColor: Colors.amber,
                          activeColor: Colors.cyan,
                          onChanged: (value) {
                            setState(() => checked = value ?? false);
                          },
                        ),
                        const SizedBox(width: 16),
                        ChromiaCheckbox(
                          value: checked,
                          size: 36,
                          checkIcon: Icons.favorite,
                          activeColor: Colors.red,
                          onChanged: (value) {
                            setState(() => checked = value ?? false);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Checkbox Tiles ────────────────────────────────────────────────
            ComponentSection(
              title: 'Checkbox Tiles',
              description:
                  'ChromiaListTileCheckbox embeds a checkbox inside a list tile '
                  'for settings-style screens.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTileCheckbox(
  value: enabled,
  onChanged: (value) => setState(() => enabled = value ?? false),
  title: ChromiaText('Enable notifications'),
  subtitle: ChromiaText('Receive alerts about new messages'),
  secondary: Icon(Icons.notifications),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool notifications = true;
                    bool autoSave = false;
                    final colors = context.chromiaColors;
                    final theme = context.chromiaTheme;
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.outline),
                        borderRadius: theme.radius.radiusM,
                      ),
                      child: Column(
                        children: [
                          ChromiaListTileCheckbox(
                            value: notifications,
                            onChanged: (value) {
                              setState(
                                () => notifications = value ?? false,
                              );
                            },
                            title: const ChromiaText('Enable notifications'),
                            subtitle: const ChromiaText(
                              'Receive alerts about new messages',
                            ),
                            secondary: Icon(
                              Icons.notifications,
                              color: colors.primary,
                            ),
                          ),
                          Divider(height: 1, color: colors.outline),
                          ChromiaListTileCheckbox(
                            value: autoSave,
                            onChanged: (value) {
                              setState(() => autoSave = value ?? false);
                            },
                            title: const ChromiaText('Auto-save'),
                            subtitle: const ChromiaText(
                              'Automatically save your progress',
                            ),
                            secondary: Icon(
                              Icons.save,
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
