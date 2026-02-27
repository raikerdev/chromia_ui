import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldsScreen extends StatefulWidget {
  const TextFieldsScreen({super.key});

  @override
  State<TextFieldsScreen> createState() => _TextFieldsScreenState();
}

class _TextFieldsScreenState extends State<TextFieldsScreen> {
  ChromiaTextFieldVariant selectedVariant = ChromiaTextFieldVariant.filled;
  bool isPasswordObscured = true;

  void _setVariant(ChromiaTextFieldVariant variant) {
    setState(() {
      selectedVariant = variant;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordObscured = !isPasswordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Text Fields',
      children: [
        // Variant section
        _buildVariantSection(context),
        spacing.gapVXXL,

        // Text fields section
        _buildTextFieldsSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildVariantSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChromiaText(
          'Select a variant to see the theme change dynamically:',
          type: ChromiaTypographyType.bodyMedium,
          color: colors.textSecondary,
        ),
        spacing.gapVM,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: ChromiaTextFieldVariant.values.map((variant) {
            final isSelected = variant.name == selectedVariant.name;
            return ChromiaButton(
              variant: isSelected ? ChromiaButtonVariant.filled : ChromiaButtonVariant.outlined,
              size: ChromiaButtonSize.small,
              onPressed: () => _setVariant(variant),
              child: Text(variant.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTextFieldsSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Single line'
        ChromiaText(
          'Single line',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,

        ChromiaTextField(
          label: 'Email',
          hintText: 'Enter your email',
          variant: selectedVariant,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email),
          suffixText: '@your-mail.com',
        ),
        spacing.gapVM,

        ChromiaTextField(
          variant: selectedVariant,
          label: 'Phone',
          hintText: '234 567 8900',
          keyboardType: TextInputType.phone,
          prefixText: '+1 ',
          suffixIcon: const Icon(Icons.phone),
        ),
        spacing.gapVL,

        ChromiaTextField(
          label: 'Password',
          hintText: 'Enter your password',
          obscureText: isPasswordObscured,
          variant: selectedVariant,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: InkWell(
            onTap: _togglePasswordVisibility,
            child: Icon(isPasswordObscured ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        spacing.gapVL,

        // With Helper text
        ChromiaText(
          'With Helper',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,

        ChromiaTextField(
          label: 'Document',
          hintText: 'Enter your document number',
          helperText: 'We don\'t share your information',
          keyboardType: TextInputType.number,
          variant: selectedVariant,
          prefixIcon: const Icon(Icons.assignment_ind),
        ),
        spacing.gapVM,

        ChromiaTextField(
          label: 'Username',
          hintText: 'Enter your username',
          variant: selectedVariant,
          maxLength: 10,
          prefixIcon: const Icon(Icons.account_circle),
        ),
        spacing.gapVM,

        // With validation text
        ChromiaText(
          'With Validation',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,

        ChromiaTextField(
          label: 'Username',
          hintText: 'Enter username',
          initialValue: 'john_doe',
          variant: selectedVariant,
          prefixIcon: const Icon(Icons.account_circle),
          validators: [DifferentValidator('Username is already taken', compareValue: 'john_doe')],
        ),
        spacing.gapVL,

        ChromiaTextField(
          label: 'Email',
          hintText: 'Enter your email',
          variant: selectedVariant,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.account_circle),
          validators: [EmailValidator('Invalid email')],
        ),
        spacing.gapVL,

        // Multiline
        ChromiaText(
          'Multiline',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,

        ChromiaTextField(
          label: 'Description',
          hintText: 'Enter a description',
          variant: selectedVariant,
          maxLines: 4,
          minLines: 3,
        ),
      ],
    );
  }
}
