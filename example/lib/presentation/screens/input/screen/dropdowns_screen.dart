import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DropdownsScreen extends StatelessWidget {
  const DropdownsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Dropdown',
      children: [
        ComponentPage(
          description:
              'ChromiaDropdown is a themed dropdown select field that integrates '
              'with the Chromia design system. ChromiaRichDropdown supports items '
              'with icons and descriptions for richer selections.',
          whenToUse:
              'Use dropdowns when users must choose one option from a long list (7+). '
              'For 2–6 options, consider radio buttons or choice chips instead. '
              'Use ChromiaRichDropdown when each option benefits from an icon and description.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description:
                  'A simple dropdown with a label and hint text.',
              child: ChromiaCodePreview(
                code: '''
ChromiaDropdown<String>(
  value: selected,
  label: 'Country',
  hint: 'Select a country',
  items: const ['USA', 'Canada', 'Mexico', 'Colombia'],
  onChanged: (value) => setState(() => selected = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    String? selected;
                    return ChromiaDropdown<String>(
                      value: selected,
                      label: 'Country',
                      hint: 'Select a country',
                      items: const ['USA', 'Canada', 'Mexico', 'Colombia'],
                      onChanged: (value) =>
                          setState(() => selected = value),
                    );
                  },
                ),
              ),
            ),

            // ── With Helper Text & Icon ───────────────────────────────────────
            ComponentSection(
              title: 'With Helper Text & Icon',
              description:
                  'Add helperText for contextual guidance and prefixIcon '
                  'to visually reinforce the field purpose.',
              child: ChromiaCodePreview(
                code: '''
ChromiaDropdown<String>(
  value: selected,
  label: 'Language',
  hint: 'Select a language',
  helperText: 'Choose your preferred language',
  prefixIcon: Icon(Icons.language),
  items: const ['English', 'Spanish', 'French'],
  onChanged: (value) => setState(() => selected = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    String? selected;
                    return ChromiaDropdown<String>(
                      value: selected,
                      label: 'Language',
                      hint: 'Select a language',
                      helperText: 'Choose your preferred language',
                      prefixIcon: const Icon(Icons.language),
                      items: const ['English', 'Spanish', 'French', 'German'],
                      onChanged: (value) =>
                          setState(() => selected = value),
                    );
                  },
                ),
              ),
            ),

            // ── Disabled ──────────────────────────────────────────────────────
            ComponentSection(
              title: 'Disabled',
              description:
                  'Set enabled: false or onChanged: null to prevent interaction.',
              child: ChromiaCodePreview(
                code: '''
ChromiaDropdown<String>(
  value: 'Option 1',
  label: 'Disabled Dropdown',
  items: ['Option 1', 'Option 2'],
  enabled: false,
  onChanged: null,
)''',
                preview: const ChromiaDropdown<String>(
                  value: 'Option 1',
                  label: 'Disabled Dropdown',
                  items: ['Option 1', 'Option 2', 'Option 3'],
                  enabled: false,
                  onChanged: null,
                ),
              ),
            ),

            // ── Rich Dropdown ─────────────────────────────────────────────────
            ComponentSection(
              title: 'Rich Dropdown',
              description:
                  'ChromiaRichDropdown shows an icon and description for each '
                  'option — ideal for priority pickers, plan selectors, etc.',
              child: ChromiaCodePreview(
                code: '''
ChromiaRichDropdown<String>(
  value: priority,
  label: 'Priority',
  hint: 'Select priority level',
  items: const [
    ChromiaDropdownItem(
      value: 'high',
      label: 'High Priority',
      icon: Icons.arrow_upward,
      description: 'Needs immediate attention',
    ),
    ChromiaDropdownItem(
      value: 'medium',
      label: 'Medium Priority',
      icon: Icons.remove,
      description: 'Important but not urgent',
    ),
    ChromiaDropdownItem(
      value: 'low',
      label: 'Low Priority',
      icon: Icons.arrow_downward,
      description: 'Do when time allows',
    ),
  ],
  onChanged: (value) => setState(() => priority = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    String? priority;
                    return ChromiaRichDropdown<String>(
                      value: priority,
                      label: 'Priority',
                      hint: 'Select priority level',
                      helperText: 'Choose the priority for this task',
                      items: const [
                        ChromiaDropdownItem(
                          value: 'high',
                          label: 'High Priority',
                          icon: Icons.arrow_upward,
                          description: 'Critical items needing immediate attention',
                        ),
                        ChromiaDropdownItem(
                          value: 'medium',
                          label: 'Medium Priority',
                          icon: Icons.remove,
                          description: 'Important but not urgent',
                        ),
                        ChromiaDropdownItem(
                          value: 'low',
                          label: 'Low Priority',
                          icon: Icons.arrow_downward,
                          description: 'Can be done when time allows',
                        ),
                      ],
                      onChanged: (value) =>
                          setState(() => priority = value),
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
