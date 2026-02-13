import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Inputs',
      children: [
        // Text fields section
        _buildTextFieldsSection(context),
        spacing.gapVXXL,
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
        Text(
          'Text Fields',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVM,

        // Filled variant
        Text(
          'Filled Variant',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaTextField(
          label: 'Email',
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(Icons.email),
        ),
        spacing.gapVM,

        const ChromiaTextField(
          label: 'Password',
          hintText: 'Enter your password',
          obscureText: true,
          prefixIcon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.visibility),
        ),
        spacing.gapVL,

        // Outlined variant
        Text(
          'Outlined Variant',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaTextField(
          variant: ChromiaTextFieldVariant.outlined,
          label: 'Full Name',
          hintText: 'John Doe',
          prefixIcon: Icon(Icons.person),
        ),
        spacing.gapVM,

        // With helper text
        const ChromiaTextField(
          variant: ChromiaTextFieldVariant.outlined,
          label: 'Phone',
          hintText: '+1 234 567 8900',
          helperText: 'We\'ll never share your phone number',
          keyboardType: TextInputType.phone,
          prefixIcon: Icon(Icons.phone),
        ),
        spacing.gapVL,

        // With error
        Text(
          'With Validation',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaTextField(
          label: 'Username',
          hintText: 'Enter username',
          errorText: 'Username is already taken',
          prefixIcon: Icon(Icons.account_circle),
        ),
        spacing.gapVL,

        // Multiline
        Text(
          'Multiline',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaTextField(
          label: 'Description',
          hintText: 'Enter a description',
          maxLines: 4,
          minLines: 3,
        ),
      ],
    );
  }
}
