import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class DividersScreen extends StatelessWidget {
  const DividersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Dividers',
      children: [
        // Divider section
        _buildDividerSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildDividerSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dividers',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVM,

        // Basic divider
        Text(
          'Basic Divider',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaDivider(),
        spacing.gapVL,

        // Divider with custom thickness
        Text(
          'Custom Thickness',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaDivider(thickness: 2),
        spacing.gapVL,

        // Divider with indent
        Text(
          'With Indent',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaDivider(
          indent: 16,
          endIndent: 16,
          thickness: 2,
        ),
        spacing.gapVL,

        // Divider with text
        Text(
          'Divider with Text',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaDivider.withText(text: 'OR'),
        spacing.gapVM,
        ChromiaDivider.withText(text: 'CONTINUE WITH'),
        spacing.gapVL,

        // Divider with icon
        Text(
          'Divider with Icon',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaDivider.withIcon(icon: Icons.star),
        spacing.gapVM,
        ChromiaDivider.withIcon(icon: Icons.favorite),
        spacing.gapVL,

        // Vertical dividers
        Text(
          'Vertical Dividers',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Item 1'),
              ChromiaDivider.vertical(height: 40),
              Text('Item 2'),
              ChromiaDivider.vertical(height: 40),
              Text('Item 3'),
            ],
          ),
        ),
        spacing.gapVL,

        // Section divider
        Text(
          'Section Divider',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaSectionDivider(
          title: 'Settings',
          trailing: ChromiaButton(
            size: ChromiaButtonSize.small,
            variant: ChromiaButtonVariant.text,
            onPressed: () {},
            child: const Text('View All'),
          ),
        ),
      ],
    );
  }
}
