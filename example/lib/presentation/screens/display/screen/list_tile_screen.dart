import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

class ListTileScreen extends StatefulWidget {
  const ListTileScreen({super.key});

  @override
  State<ListTileScreen> createState() => _ListTileScreenState();
}

class _ListTileScreenState extends State<ListTileScreen> {
  int _selectedIndex = 0;
  bool _switch1 = true;
  bool _switch2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChromiaAppBar(
        title: 'List Tile Components',
      ),
      body: _ListTileExampleContent(
        selectedIndex: _selectedIndex,
        onSelectedIndexChanged: (index) => setState(() => _selectedIndex = index),
        switch1: _switch1,
        onSwitch1Changed: (value) => setState(() => _switch1 = value),
        switch2: _switch2,
        onSwitch2Changed: (value) => setState(() => _switch2 = value),
      ),
    );
  }
}

class _ListTileExampleContent extends StatelessWidget {
  const _ListTileExampleContent({
    required this.selectedIndex,
    required this.onSelectedIndexChanged,
    required this.switch1,
    required this.onSwitch1Changed,
    required this.switch2,
    required this.onSwitch2Changed,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelectedIndexChanged;
  final bool switch1;
  final ValueChanged<bool> onSwitch1Changed;
  final bool switch2;
  final ValueChanged<bool> onSwitch2Changed;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return ListView(
      padding: spacing.paddingL,
      children: [
        // Section: Basic ListTiles
        _buildSection(
          context,
          title: 'Basic List Tiles',
          children: [
            ChromiaListTile(
              leading: Icon(Icons.inbox, color: colors.primary),
              title: const Text('Inbox'),
              trailing: const Text('24'),
              onTap: () => context.showInfoSnackBar(message: 'Inbox tapped'),
            ),
            spacing.gapVS,
            ChromiaListTile(
              leading: Icon(Icons.drafts, color: colors.textSecondary),
              title: const Text('Drafts'),
              trailing: const Text('3'),
              onTap: () => context.showInfoSnackBar(message: 'Drafts tapped'),
            ),
            spacing.gapVS,
            ChromiaListTile(
              leading: Icon(Icons.send, color: colors.textSecondary),
              title: const Text('Sent'),
              onTap: () => context.showInfoSnackBar(message: 'Sent tapped'),
            ),
            spacing.gapVS,
            ChromiaListTile(
              leading: Icon(Icons.delete, color: colors.error),
              title: const Text('Trash'),
              trailing: const Text('12'),
              onTap: () => context.showInfoSnackBar(message: 'Trash tapped'),
            ),
          ],
        ),

        spacing.gapVXXL,

        // Section: List Tiles with Subtitles
        _buildSection(
          context,
          title: 'With Subtitles',
          children: [
            ChromiaListTile(
              leading: CircleAvatar(
                backgroundColor: colors.primary,
                child: const Text('JD', style: TextStyle(color: Colors.white)),
              ),
              title: const Text('John Doe'),
              subtitle: const Text('Software Engineer'),
              trailing: Icon(Icons.chevron_right, color: colors.textTertiary),
              onTap: () {},
            ),
            spacing.gapVS,
            ChromiaListTile(
              leading: CircleAvatar(
                backgroundColor: colors.secondary,
                child: const Text('AS', style: TextStyle(color: Colors.white)),
              ),
              title: const Text('Alice Smith'),
              subtitle: const Text('Product Manager'),
              trailing: Icon(Icons.chevron_right, color: colors.textTertiary),
              onTap: () {},
            ),
            spacing.gapVS,
            ChromiaListTile(
              leading: CircleAvatar(
                backgroundColor: colors.secondary,
                child: const Text('BJ', style: TextStyle(color: Colors.white)),
              ),
              title: const Text('Bob Johnson'),
              subtitle: const Text('UX Designer'),
              trailing: Icon(Icons.chevron_right, color: colors.textTertiary),
              onTap: () {},
            ),
          ],
        ),

        spacing.gapVXXL,

        // Section: Variants
        _buildSection(
          context,
          title: 'Variants',
          children: [
            ChromiaListTile(
              variant: ChromiaListTileVariant.standard,
              leading: Icon(Icons.layers, color: colors.primary),
              title: const Text('Standard'),
              subtitle: const Text('Default variant'),
              onTap: () {},
            ),
            spacing.gapVS,
            ChromiaListTile(
              variant: ChromiaListTileVariant.outlined,
              leading: Icon(Icons.layers_outlined, color: colors.primary),
              title: const Text('Outlined'),
              subtitle: const Text('With border'),
              onTap: () {},
            ),
            spacing.gapVS,
            ChromiaListTile(
              variant: ChromiaListTileVariant.card,
              leading: Icon(Icons.layers_rounded, color: colors.primary),
              title: const Text('Card'),
              subtitle: const Text('With elevation'),
              onTap: () {},
            ),
          ],
        ),

        spacing.gapVXXL,

        // Section: Selectable List
        _buildSection(
          context,
          title: 'Selectable List',
          children: List.generate(
            4,
            (index) => Padding(
              padding: spacing.verticalXS,
              child: ChromiaListTile(
                leading: Icon(
                  index == 0
                      ? Icons.home
                      : index == 1
                      ? Icons.explore
                      : index == 2
                      ? Icons.notifications
                      : Icons.settings,
                  color: selectedIndex == index ? colors.primary : colors.textSecondary,
                ),
                title: Text(
                  index == 0
                      ? 'Home'
                      : index == 1
                      ? 'Explore'
                      : index == 2
                      ? 'Notifications'
                      : 'Settings',
                ),
                trailing: selectedIndex == index ? Icon(Icons.check, color: colors.primary) : null,
                selected: selectedIndex == index,
                onTap: () => onSelectedIndexChanged(index),
              ),
            ),
          ),
        ),

        spacing.gapVXXL,

        // Section: With Switches
        _buildSection(
          context,
          title: 'With Switches',
          children: [
            ChromiaListTile(
              leading: Icon(Icons.notifications, color: colors.primary),
              title: const Text('Push Notifications'),
              subtitle: const Text('Receive push notifications'),
              trailing: ChromiaToggleButton(
                value: switch1,
                onChanged: onSwitch1Changed,
              ),
            ),
            spacing.gapVS,
            ChromiaListTile(
              leading: Icon(Icons.email, color: colors.primary),
              title: const Text('Email Notifications'),
              subtitle: const Text('Receive email notifications'),
              trailing: ChromiaToggleButton(
                value: switch2,
                onChanged: onSwitch2Changed,
              ),
            ),
          ],
        ),

        spacing.gapVXXL,

        // Section: Disabled State
        _buildSection(
          context,
          title: 'Disabled State',
          children: [
            ChromiaListTile(
              leading: Icon(Icons.block, color: colors.textDisabled),
              title: const Text('Disabled Item'),
              subtitle: const Text('This item is disabled'),
              enabled: false,
              onTap: () {},
            ),
          ],
        ),

        spacing.gapVXXL,

        // Section: Real-World Examples
        _buildSection(
          context,
          title: 'Real-World Examples',
          children: [
            ChromiaCard(
              child: Column(
                children: [
                  ChromiaText(
                    'Recent Transactions',
                    type: ChromiaTypographyType.titleMedium,
                    margin: spacing.paddingM,
                  ),
                  const ChromiaDivider(),
                  ChromiaListTile(
                    leading: Container(
                      padding: spacing.paddingS,
                      decoration: BoxDecoration(
                        color: colors.successHover,
                        borderRadius: theme.radius.radiusS,
                      ),
                      child: Icon(Icons.arrow_downward, color: colors.success, size: 20),
                    ),
                    title: const Text('Payment Received'),
                    subtitle: const Text('Jan 15, 2024 • 2:30 PM'),
                    trailing: ChromiaText(
                      '+\$250.00',
                      type: ChromiaTypographyType.titleMedium,
                      color: colors.success,
                    ),
                  ),
                  const ChromiaDivider(),
                  ChromiaListTile(
                    leading: Container(
                      padding: spacing.paddingS,
                      decoration: BoxDecoration(
                        color: colors.errorHover,
                        borderRadius: theme.radius.radiusS,
                      ),
                      child: Icon(Icons.arrow_upward, color: colors.error, size: 20),
                    ),
                    title: const Text('Subscription Payment'),
                    subtitle: const Text('Jan 14, 2024 • 11:15 AM'),
                    trailing: ChromiaText(
                      '-\$12.99',
                      type: ChromiaTypographyType.titleMedium,
                      color: colors.error,
                    ),
                  ),
                  const ChromiaDivider(),
                  ChromiaListTile(
                    leading: Container(
                      padding: spacing.paddingS,
                      decoration: BoxDecoration(
                        color: colors.successHover,
                        borderRadius: theme.radius.radiusS,
                      ),
                      child: Icon(Icons.arrow_downward, color: colors.success, size: 20),
                    ),
                    title: const Text('Refund Processed'),
                    subtitle: const Text('Jan 13, 2024 • 4:45 PM'),
                    trailing: ChromiaText(
                      '+\$89.99',
                      type: ChromiaTypographyType.titleMedium,
                      color: colors.success,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChromiaText(
          title,
          type: ChromiaTypographyType.titleLarge,
          margin: spacing.verticalM,
        ),
        ...children,
      ],
    );
  }
}
