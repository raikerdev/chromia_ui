import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class DropdownsScreen extends StatefulWidget {
  const DropdownsScreen({super.key});

  @override
  State<DropdownsScreen> createState() => _DropdownsScreenState();
}

class _DropdownsScreenState extends State<DropdownsScreen> {
  String? _selectedCountry;
  String? _selectedLanguage;
  String? _selectedPriority;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Dropdowns',
      children: [
        // Dropdown section
        _buildDropdownSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildDropdownSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dropdowns',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVM,

        // Basic dropdown
        Text(
          'Basic Dropdown',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaDropdown<String>(
          value: _selectedCountry,
          items: const ['USA', 'Canada', 'Mexico', 'Colombia', 'Argentina'],
          onChanged: (value) {
            setState(() => _selectedCountry = value);
          },
          label: 'Country',
          hint: 'Select a country',
        ),
        spacing.gapVL,

        // Dropdown with helper text
        Text(
          'With Helper Text',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaDropdown<String>(
          value: _selectedLanguage,
          items: const ['English', 'Spanish', 'French', 'German', 'Portuguese'],
          onChanged: (value) {
            setState(() => _selectedLanguage = value);
          },
          label: 'Language',
          hint: 'Select a language',
          helperText: 'Choose your preferred language',
        ),
        spacing.gapVL,

        // Dropdown with icon
        Text(
          'With Icon',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaDropdown<String>(
          value: _selectedCountry,
          items: const ['USA', 'Canada', 'Mexico', 'Colombia', 'Argentina'],
          onChanged: (value) {
            setState(() => _selectedCountry = value);
          },
          label: 'Country',
          hint: 'Select a country',
          prefixIcon: Icon(Icons.public, color: colors.primary),
        ),
        spacing.gapVL,

        // Disabled dropdown
        Text(
          'Disabled',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaDropdown<String>(
          value: 'Option 1',
          items: ['Option 1', 'Option 2', 'Option 3'],
          onChanged: null,
          label: 'Disabled Dropdown',
          enabled: false,
        ),
        spacing.gapVL,

        // Rich dropdown
        Text(
          'Rich Dropdown',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaRichDropdown<String>(
          value: _selectedPriority,
          items: const [
            ChromiaDropdownItem(
              value: 'high',
              label: 'High Priority',
              icon: Icons.arrow_upward,
              description: 'Critical items that need immediate attention',
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
          onChanged: (value) {
            setState(() => _selectedPriority = value);
          },
          label: 'Priority',
          hint: 'Select priority level',
          helperText: 'Choose the priority for this task',
        ),
      ],
    );
  }
}
