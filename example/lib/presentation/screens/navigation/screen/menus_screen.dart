import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MenusScreen extends StatelessWidget {
  const MenusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Menus',
      children: [
        // Menu section
        _buildMenuSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Menus',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVM,

        Text(
          'Popup Menu',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Options'),
              ChromiaPopupMenu<String>(
                items: const [
                  ChromiaMenuItem(value: 'edit', label: 'Edit', icon: Icons.edit),
                  ChromiaMenuItem(value: 'share', label: 'Share', icon: Icons.share),
                  ChromiaMenuItem(value: 'delete', label: 'Delete', icon: Icons.delete),
                ],
                onSelected: (value) {
                  context.showInfoSnackBar(message: 'Selected: $value');
                },
              ),
            ],
          ),
        ),
        spacing.gapVL,

        Text(
          'Menu Button',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaMenuButton<String>(
          label: 'Sort by',
          items: const [
            ChromiaMenuItem(value: 'name', label: 'Name', icon: Icons.sort_by_alpha),
            ChromiaMenuItem(value: 'date', label: 'Date', icon: Icons.calendar_today),
            ChromiaMenuItem(value: 'size', label: 'Size', icon: Icons.data_usage),
          ],
          onSelected: (value) {
            context.showInfoSnackBar(message: 'Sorting by: $value');
          },
        ),
        spacing.gapVL,

        Text(
          'Context Menu',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaContextMenu<String>(
          items: const [
            ChromiaMenuItem(value: 'copy', label: 'Copy', icon: Icons.copy),
            ChromiaMenuItem(value: 'paste', label: 'Paste', icon: Icons.paste),
            ChromiaMenuItem(value: 'cut', label: 'Cut', icon: Icons.cut),
          ],
          onSelected: (value) {
            context.showInfoSnackBar(message: 'Action: $value');
          },
          child: ChromiaCard(
            child: Center(
              child: Padding(
                padding: spacing.paddingL,
                child: Text(
                  'Long press or right-click here',
                  style: theme.typography.bodyMedium.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
