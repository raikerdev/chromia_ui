import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class CheckboxesScreen extends StatelessWidget {
  const CheckboxesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Checkboxes',
      children: [
        // Checkboxes section
        _buildCheckboxesSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildCheckboxesSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic checkboxes
        Text(
          'Basic',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        Row(
          children: [
            ChromiaCheckbox(
              initialValue: true,
              onChanged: (value) {},
            ),
            spacing.gapHM,
            ChromiaCheckbox(
              initialValue: false,
              onChanged: (value) {},
            ),
            spacing.gapHM,
            ChromiaCheckbox(
              initialValue: null,
              onChanged: (value) {},
              tristate: true,
            ),
            spacing.gapHM,
            const ChromiaCheckbox(
              initialValue: true,
              onChanged: null, // Disabled
            ),
          ],
        ),
        spacing.gapVL,

        // With labels
        Text(
          'With Labels',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaCheckbox(
          initialValue: true,
          onChanged: (value) {},
          label: 'Accept terms and conditions',
        ),
        spacing.gapVS,
        ChromiaCheckbox(
          initialValue: false,
          onChanged: (value) {},
          label: 'Subscribe to newsletter',
        ),
        spacing.gapVL,

        // Checkbox tiles
        Text(
          'Checkbox Tiles',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            borderRadius: theme.radius.radiusM,
          ),
          child: Column(
            children: [
              ChromiaCheckboxTile(
                value: true,
                onChanged: (value) {},
                title: const Text('Enable notifications'),
                subtitle: const Text('Receive alerts about new messages'),
                secondary: Icon(Icons.notifications, color: colors.primary),
              ),
              Divider(height: 1, color: colors.divider),
              ChromiaCheckboxTile(
                value: false,
                onChanged: (value) {},
                title: const Text('Auto-save'),
                subtitle: const Text('Automatically save your progress'),
                secondary: Icon(Icons.save, color: colors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
