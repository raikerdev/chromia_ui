import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ToggleButtonsScreen extends StatefulWidget {
  const ToggleButtonsScreen({super.key});

  @override
  State<ToggleButtonsScreen> createState() => _ToggleButtonsScreenState();
}

class _ToggleButtonsScreenState extends State<ToggleButtonsScreen> {
  bool _basicValue = false;
  bool _customizableValue = false;
  bool _withLabelValue = false;
  bool _sizeValue = false;
  bool _listTileValue = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Toggle Buttons',
      children: [
        // Toggle button section
        _buildToggleButtonSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildToggleButtonSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic switches
        ChromiaText(
          'Basic',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            const ChromiaToggleButton(
              value: true,
              onChanged: null, // Disabled
            ),
            spacing.gapHM,
            ChromiaToggleButton(
              value: _basicValue,
              onChanged: (value) => setState(() => _basicValue = value),
            ),
          ],
        ),
        spacing.gapVL,

        // Customizable switches
        ChromiaText(
          'Customizable',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            const ChromiaToggleButton(
              value: true,
              inactiveColor: Colors.red,
              activeColor: Colors.teal,
              thumbColor: Colors.cyan,
              onChanged: null, // Disabled
            ),
            spacing.gapHM,
            ChromiaToggleButton(
              value: _customizableValue,
              inactiveColor: Colors.red,
              activeColor: Colors.teal,
              thumbColor: Colors.cyan,
              onChanged: (value) => setState(() => _customizableValue = value),
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
        const ChromiaToggleButton(
          value: true,
          onChanged: null,
          label: 'Enable notifications',
        ),
        spacing.gapVS,
        ChromiaToggleButton(
          value: _withLabelValue,
          onChanged: (value) => setState(() => _withLabelValue = value),
          label: 'Dark mode',
        ),
        spacing.gapVL,

        // Switch sizes
        ChromiaText(
          'Sizes',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVM,
        Row(
          children: [
            ChromiaToggleButton(
              value: _sizeValue,
              onChanged: (value) => setState(() => _sizeValue = value),
              size: ChromiaToggleButtonSize.small,
            ),
            spacing.gapHM,
            ChromiaToggleButton(
              value: _sizeValue,
              onChanged: (value) => setState(() => _sizeValue = value),
              size: ChromiaToggleButtonSize.medium,
            ),
            spacing.gapHM,
            ChromiaToggleButton(
              value: _sizeValue,
              onChanged: (value) => setState(() => _sizeValue = value),
              size: ChromiaToggleButtonSize.large,
            ),
          ],
        ),
        spacing.gapVS,
        ChromiaToggleButton(
          value: _sizeValue,
          onChanged: (value) => setState(() => _sizeValue = value),
          size: ChromiaToggleButtonSize.small,
          label: 'With label',
        ),
        spacing.gapHM,
        ChromiaToggleButton(
          value: _sizeValue,
          onChanged: (value) => setState(() => _sizeValue = value),
          size: ChromiaToggleButtonSize.medium,
          label: 'With label',
        ),
        spacing.gapHM,
        ChromiaToggleButton(
          value: _sizeValue,
          onChanged: (value) => setState(() => _sizeValue = value),
          size: ChromiaToggleButtonSize.large,
          label: 'With label',
        ),
        spacing.gapVL,

        // Switch tiles
        ChromiaText(
          'Switch Tiles',
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
              ChromiaListTileToggleButton(
                value: true,
                onChanged: null,
                title: const Text('Push Notifications'),
                subtitle: const Text('Receive notifications on your device'),
                secondary: Icon(Icons.notifications, color: colors.primary),
              ),
              Divider(height: 1, color: colors.divider),
              ChromiaListTileToggleButton(
                value: _listTileValue,
                onChanged: (value) => setState(() => _listTileValue = value),
                title: const Text('Auto-save'),
                subtitle: const Text('Automatically save your work'),
                secondary: Icon(Icons.save, color: colors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
