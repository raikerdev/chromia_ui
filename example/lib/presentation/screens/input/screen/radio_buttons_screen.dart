import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RadioButtonsScreen extends StatefulWidget {
  const RadioButtonsScreen({super.key});

  @override
  State<RadioButtonsScreen> createState() => _RadioButtonsScreenState();
}

class _RadioButtonsScreenState extends State<RadioButtonsScreen> {
  String _selectedBasic = 'basic1';
  String _selectedCustomizable = 'custom1';
  String _selectedWithLabel = 'option1';
  String _selectedRadioGroup = 'small';

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Radio Buttons',
      children: [
        // Radio button section
        _buildRadioButtonSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildRadioButtonSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic radio buttons
        ChromiaText(
          'Basic',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            const ChromiaRadioButton<String>(
              value: 'disabled',
              groupValue: 'disabled',
              onChanged: null, // Disabled
            ),
            spacing.gapHM,
            ChromiaRadioButton<String>(
              value: 'basic1',
              groupValue: _selectedBasic,
              onChanged: (value) => setState(() => _selectedBasic = value!),
            ),
            spacing.gapHM,
            ChromiaRadioButton<String>(
              value: 'basic2',
              groupValue: _selectedBasic,
              onChanged: (value) => setState(() => _selectedBasic = value!),
            ),
            spacing.gapHM,
            ChromiaRadioButton<String>(
              value: 'basic3',
              groupValue: _selectedBasic,
              onChanged: (value) => setState(() => _selectedBasic = value!),
            ),
          ],
        ),
        spacing.gapVL,

        // Customizable radio buttons
        ChromiaText(
          'Customizable',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            const ChromiaRadioButton<String>(
              value: 'disabled',
              groupValue: 'disabled',
              onChanged: null, // Disabled
            ),
            spacing.gapHM,
            ChromiaRadioButton<String>(
              value: 'custom1',
              groupValue: _selectedCustomizable,
              activeColor: Colors.red,
              size: 30,
              thumbScale: 0.2,
              onChanged: (value) => setState(() => _selectedCustomizable = value!),
            ),
            spacing.gapHM,
            ChromiaRadioButton<String>(
              value: 'custom2',
              groupValue: _selectedCustomizable,
              activeColor: Colors.cyan,
              size: 40,
              thumbScale: 0.6,
              onChanged: (value) => setState(() => _selectedCustomizable = value!),
            ),
            spacing.gapHM,
            ChromiaRadioButton<String>(
              value: 'custom3',
              groupValue: _selectedCustomizable,
              activeColor: Colors.green,
              size: 50,
              thumbScale: 0.9,
              onChanged: (value) => setState(() => _selectedCustomizable = value!),
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
        ChromiaRadioButton<String>(
          value: 'option1',
          groupValue: _selectedWithLabel,
          onChanged: (value) => setState(() => _selectedWithLabel = value!),
          label: 'Option 1',
        ),
        spacing.gapVS,
        ChromiaRadioButton<String>(
          value: 'option2',
          groupValue: _selectedWithLabel,
          onChanged: (value) => setState(() => _selectedWithLabel = value!),
          label: 'Option 2',
        ),
        spacing.gapVS,
        ChromiaRadioButton<String>(
          value: 'option3',
          groupValue: _selectedWithLabel,
          onChanged: (value) => setState(() => _selectedWithLabel = value!),
          label: 'Option 3',
        ),
        spacing.gapVL,

        // Vertical Radio group
        ChromiaText(
          'Vertical Radio Group',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaRadioButtonGroup<String>(
          value: _selectedRadioGroup,
          onChanged: (value) => setState(() => _selectedRadioGroup = value!),
          items: const [
            ChromiaRadioButtonItem(value: 'small', label: 'Small'),
            ChromiaRadioButtonItem(value: 'medium', label: 'Medium'),
            ChromiaRadioButtonItem(value: 'large', label: 'Large'),
          ],
        ),
        spacing.gapVL,

        // Horizontal radio group
        ChromiaText(
          'Horizontal Radio Group',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaRadioButtonGroup<String>(
          value: _selectedRadioGroup,
          onChanged: (value) => setState(() => _selectedRadioGroup = value!),
          direction: Axis.horizontal,
          items: const [
            ChromiaRadioButtonItem(value: 'small', label: 'S'),
            ChromiaRadioButtonItem(value: 'medium', label: 'M'),
            ChromiaRadioButtonItem(value: 'large', label: 'L'),
          ],
        ),
        spacing.gapVL,

        // Radio tiles
        ChromiaText(
          'Radio Tiles',
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
              ChromiaListTileRadioButton<String>(
                value: 'basic',
                groupValue: 'basic',
                onChanged: null,
                title: const ChromiaText('Basic Plan'),
                subtitle: const ChromiaText('For individuals'),
                secondary: Icon(Icons.person, color: colors.primary),
              ),
              Divider(height: 1, color: colors.divider),
              ChromiaListTileRadioButton<String>(
                value: 'pro',
                groupValue: _selectedWithLabel,
                onChanged: (value) => setState(() => _selectedWithLabel = value!),
                title: const ChromiaText('Pro Plan'),
                subtitle: const ChromiaText('For professionals'),
                secondary: Icon(Icons.work, color: colors.primary),
              ),
              Divider(height: 1, color: colors.divider),
              ChromiaListTileRadioButton<String>(
                value: 'enterprise',
                groupValue: _selectedWithLabel,
                onChanged: (value) => setState(() => _selectedWithLabel = value!),
                title: const ChromiaText('Enterprise Plan'),
                subtitle: const ChromiaText('For organizations'),
                secondary: Icon(Icons.business, color: colors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
