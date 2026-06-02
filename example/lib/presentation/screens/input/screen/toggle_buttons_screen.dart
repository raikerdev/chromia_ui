import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ToggleButtonsScreen extends StatelessWidget {
  const ToggleButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Toggle Button',
      children: [
        ComponentPage(
          description:
              'ChromiaToggleButton is a themed switch/toggle that represents a '
              'binary on/off state. It supports three sizes, optional labels, '
              'custom colors, and list-tile embedding.',
          whenToUse:
              'Use toggle buttons for binary settings like enabling/disabling features. '
              'Prefer toggles over checkboxes when the action takes effect immediately '
              '(e.g., enabling dark mode). Use ChromiaListTileToggleButton for settings screens.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description:
                  'On, off, and disabled states. Pass onChanged: null to disable.',
              child: ChromiaCodePreview(
                code: '''
ChromiaToggleButton(
  value: isOn,
  onChanged: (value) => setState(() => isOn = value),
)

// Disabled
ChromiaToggleButton(
  value: true,
  onChanged: null,
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool isOn = false;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChromiaToggleButton(
                          value: isOn,
                          onChanged: (value) => setState(() => isOn = value),
                        ),
                        const SizedBox(width: 16),
                        const ChromiaToggleButton(value: true, onChanged: null),
                        const SizedBox(width: 16),
                        const ChromiaToggleButton(
                          value: false,
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
                  'Add a label string to show descriptive text alongside the toggle.',
              child: ChromiaCodePreview(
                code: '''
ChromiaToggleButton(
  value: darkMode,
  label: 'Dark mode',
  onChanged: (value) => setState(() => darkMode = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool darkMode = false;
                    bool notifications = true;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChromiaToggleButton(
                          value: darkMode,
                          label: 'Dark mode',
                          onChanged: (value) =>
                              setState(() => darkMode = value),
                        ),
                        const SizedBox(height: 8),
                        const ChromiaToggleButton(
                          value: true,
                          label: 'Enable notifications',
                          onChanged: null,
                        ),
                        const SizedBox(height: 8),
                        ChromiaToggleButton(
                          value: notifications,
                          label: 'Auto-update',
                          onChanged: (value) =>
                              setState(() => notifications = value),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Sizes ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Sizes',
              description:
                  'Three sizes — small, medium (default), and large — for different layout densities.',
              child: ChromiaCodePreview(
                code: '''
ChromiaToggleButton(
  value: isOn,
  size: ChromiaToggleButtonSize.small,
  onChanged: (value) => setState(() => isOn = value),
)

ChromiaToggleButton(
  value: isOn,
  size: ChromiaToggleButtonSize.medium,
  onChanged: (value) => setState(() => isOn = value),
)

ChromiaToggleButton(
  value: isOn,
  size: ChromiaToggleButtonSize.large,
  onChanged: (value) => setState(() => isOn = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool isOn = true;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ChromiaToggleButton(
                          value: isOn,
                          size: ChromiaToggleButtonSize.small,
                          onChanged: (value) => setState(() => isOn = value),
                        ),
                        const SizedBox(width: 16),
                        ChromiaToggleButton(
                          value: isOn,
                          size: ChromiaToggleButtonSize.medium,
                          onChanged: (value) => setState(() => isOn = value),
                        ),
                        const SizedBox(width: 16),
                        ChromiaToggleButton(
                          value: isOn,
                          size: ChromiaToggleButtonSize.large,
                          onChanged: (value) => setState(() => isOn = value),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Custom Colors ─────────────────────────────────────────────────
            ComponentSection(
              title: 'Custom Colors',
              description:
                  'Override activeColor, inactiveColor, and thumbColor to match '
                  'a specific brand or semantic context.',
              child: ChromiaCodePreview(
                code: '''
ChromiaToggleButton(
  value: isOn,
  activeColor: Colors.teal,
  inactiveColor: Colors.red,
  thumbColor: Colors.cyan,
  onChanged: (value) => setState(() => isOn = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool isOn = true;
                    return ChromiaToggleButton(
                      value: isOn,
                      activeColor: Colors.teal,
                      inactiveColor: Colors.red,
                      thumbColor: Colors.cyan,
                      onChanged: (value) => setState(() => isOn = value),
                    );
                  },
                ),
              ),
            ),

            // ── Toggle Tiles ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Toggle Tiles',
              description:
                  'ChromiaListTileToggleButton embeds a toggle inside a list tile '
                  'for settings screens.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTileToggleButton(
  value: pushEnabled,
  onChanged: (value) => setState(() => pushEnabled = value),
  title: Text('Push Notifications'),
  subtitle: Text('Receive notifications on your device'),
  leading: Icon(Icons.notifications),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool push = true;
                    bool email = false;
                    final colors = context.chromiaColors;
                    final theme = context.chromiaTheme;
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.outline),
                        borderRadius: theme.radius.radiusM,
                      ),
                      child: Column(
                        children: [
                          ChromiaListTileToggleButton(
                            value: push,
                            onChanged: (value) =>
                                setState(() => push = value),
                            title: const Text('Push Notifications'),
                            subtitle: const Text(
                              'Receive notifications on your device',
                            ),
                            leading: Icon(
                              Icons.notifications,
                              color: colors.primary,
                            ),
                          ),
                          Divider(height: 1, color: colors.outline),
                          ChromiaListTileToggleButton(
                            value: email,
                            onChanged: (value) =>
                                setState(() => email = value),
                            title: const Text('Email Updates'),
                            subtitle: const Text(
                              'Receive weekly digest emails',
                            ),
                            leading: Icon(
                              Icons.email,
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
