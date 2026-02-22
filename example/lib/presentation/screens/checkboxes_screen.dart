import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class CheckboxesScreen extends StatefulWidget {
  const CheckboxesScreen({super.key});

  @override
  State<CheckboxesScreen> createState() => _CheckboxesScreenState();
}

class _CheckboxesScreenState extends State<CheckboxesScreen> {
  bool _basicValue = true;
  bool? _tristateValue;
  bool _customizableValue = true;
  bool? _customizableTristateValue;
  bool _withLabelValue = false;
  bool _tileValue = false;
  bool _customTileValue = false;

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
        ChromiaText(
          'Basic',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            const ChromiaCheckbox(
              value: true,
              onChanged: null, // Disabled
            ),
            spacing.gapHM,
            ChromiaCheckbox(
              value: _basicValue,
              onChanged: (value) => setState(() => _basicValue = value ?? false),
            ),
          ],
        ),
        spacing.gapVL,

        ChromiaText(
          'Tristate',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            const ChromiaCheckbox(
              value: null,
              tristate: true,
              onChanged: null, // Disabled
            ),
            spacing.gapHM,
            ChromiaCheckbox(
              value: _tristateValue,
              tristate: true,
              onChanged: (value) => setState(() => _tristateValue = value),
            ),
          ],
        ),
        spacing.gapVL,

        ChromiaText(
          'Customizable',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            ChromiaCheckbox(
              value: _customizableValue,
              size: 40,
              checkIcon: Icons.star,
              checkColor: Colors.amber,
              activeColor: Colors.cyan,
              onChanged: (value) => setState(() => _customizableValue = value ?? false),
            ),
            spacing.gapHM,
            ChromiaCheckbox(
              value: _customizableTristateValue,
              tristate: true,
              size: 30,
              checkIcon: Icons.favorite,
              tristateIcon: Icons.heart_broken,
              activeColor: Colors.red,
              onChanged: (value) => setState(() => _customizableTristateValue = value),
            ),
          ],
        ),
        spacing.gapVL,

        // With labels
        ChromiaText(
          'With Labels',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaCheckbox(
          value: true,
          onChanged: null,
          label: 'Subscribe to newsletter',
        ),
        spacing.gapVS,
        ChromiaCheckbox(
          value: _withLabelValue,
          onChanged: (value) => setState(() => _withLabelValue = value ?? false),
          label: 'Accept terms and conditions',
        ),
        spacing.gapVL,

        // Checkbox tiles
        ChromiaText(
          'Checkbox Tiles',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            borderRadius: theme.radius.radiusM,
          ),
          child: Column(
            children: [
              ChromiaListTileCheckbox(
                value: true,
                onChanged: null,
                title: const ChromiaText('Enable notifications'),
                subtitle: const ChromiaText('Receive alerts about new messages'),
                secondary: Icon(Icons.notifications, color: colors.primary),
              ),
              Divider(height: 1, color: colors.divider),
              ChromiaListTileCheckbox(
                value: _tileValue,
                onChanged: (value) => setState(() => _tileValue = value ?? false),
                title: const ChromiaText('Auto-save'),
                subtitle: const ChromiaText('Automatically save your progress'),
                secondary: Icon(Icons.save, color: colors.primary),
              ),
              Divider(height: 1, color: colors.divider),
              ChromiaListTileCheckbox(
                value: _customTileValue,
                onChanged: (value) => setState(() => _customTileValue = value ?? false),
                checkIcon: Icons.thumb_up,
                title: const ChromiaText('Show likes'),
                subtitle: const ChromiaText('Show likes on posts'),
                secondary: Icon(Icons.thumb_up, color: colors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
