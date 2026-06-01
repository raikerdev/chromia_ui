import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/screens/display/display_constants.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final layersIcon = Icon(Icons.layers, color: colors.primary);
    final chevronRightIcon = Icon(Icons.chevron_right, color: colors.onSurfaceVariant);

    int selectedIndex = 0;

    return ExampleScaffold(
      title: 'List Tile',
      children: [
        ComponentPage(
          description:
              'ChromiaListTile is a themed list item that supports leading/trailing '
              'widgets, a title, an optional subtitle, and three visual variants: '
              'standard, outlined, and card.',
          whenToUse:
              'Use list tiles in navigational menus, settings screens, and data lists. '
              'Use the outlined variant when each row needs a clear boundary. '
              'Use the card variant for elevated, standalone items.',
          children: [
            // ── Variants ─────────────────────────────────────────────────────
            ComponentSection(
              title: 'Variants',
              description: 'A title, optional leading icon, optional trailing widget, and an onTap handler.',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Standard',
                    code: ListTileConstants.standard,
                    preview: ChromiaListTile(
                      variant: ChromiaListTileVariant.standard,
                      leading: layersIcon,
                      trailing: chevronRightIcon,
                      title: const Text('Standard'),
                      subtitle: const Text('Default variant'),
                      onTap: () {},
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Outlined',
                    code: ListTileConstants.outlined,
                    preview: ChromiaListTile(
                      variant: ChromiaListTileVariant.outlined,
                      leading: layersIcon,
                      trailing: chevronRightIcon,
                      title: const Text('Outlined'),
                      subtitle: const Text('With border'),
                      onTap: () {},
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Card',
                    code: ListTileConstants.card,
                    preview: ChromiaListTile(
                      variant: ChromiaListTileVariant.card,
                      leading: layersIcon,
                      trailing: chevronRightIcon,
                      title: const Text('Card'),
                      subtitle: const Text('With elevation'),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),

            // ── Selectable ────────────────────────────────────────────────────
            ComponentSection(
              title: 'Selectable List',
              description: 'Use selected: true and a check trailing to indicate the active item.',
              child: ChromiaCodePreview(
                code: ListTileConstants.selectable,
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    final colors = context.chromiaColors;
                    final items = [
                      (icon: Icons.home, title: 'Home'),
                      (icon: Icons.explore, title: 'Explore'),
                      (icon: Icons.notifications, title: 'Notifications'),
                      (icon: Icons.settings, title: 'Settings'),
                    ];
                    return Column(
                      children: items.asMap().entries.map((e) {
                        final i = e.key;
                        final item = e.value;
                        final isSelected = selectedIndex == i;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: ChromiaListTile(
                            leading: Icon(
                              item.icon,
                              color: isSelected ? colors.primary : colors.onSurfaceVariant,
                            ),
                            title: Text(item.title),
                            selected: isSelected,
                            trailing: isSelected
                                ? Icon(
                                    Icons.check,
                                    color: colors.primary,
                                  )
                                : null,
                            onTap: () => setState(() => selectedIndex = i),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),

            // ── With Switches ─────────────────────────────────────────────────
            ComponentSection(
              title: 'With Switches',
              description:
                  'Combine ChromiaListTile with ChromiaToggleButton in the trailing '
                  'for settings screens.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTile(
  leading: Icon(Icons.notifications),
  title: Text('Push Notifications'),
  subtitle: Text('Receive push notifications'),
  trailing: ChromiaToggleButton(
    value: push,
    onChanged: (value) => setState(() => push = value),
  ),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool push = true;
                    bool email = false;
                    final colors = context.chromiaColors;
                    return Column(
                      children: [
                        ChromiaListTile(
                          leading: Icon(
                            Icons.notifications,
                            color: colors.primary,
                          ),
                          title: const Text('Push Notifications'),
                          subtitle: const Text(
                            'Receive push notifications',
                          ),
                          trailing: ChromiaToggleButton(
                            value: push,
                            onChanged: (v) => setState(() => push = v),
                          ),
                        ),
                        const SizedBox(height: 4),
                        ChromiaListTile(
                          leading: Icon(
                            Icons.email,
                            color: colors.primary,
                          ),
                          title: const Text('Email Notifications'),
                          subtitle: const Text(
                            'Receive email notifications',
                          ),
                          trailing: ChromiaToggleButton(
                            value: email,
                            onChanged: (v) => setState(() => email = v),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Disabled ──────────────────────────────────────────────────────
            ComponentSection(
              title: 'Disabled State',
              description:
                  'Set enabled: false to prevent interaction and apply a '
                  'muted visual style.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTile(
  leading: Icon(Icons.block),
  title: Text('Disabled Item'),
  subtitle: Text('This item is disabled'),
  enabled: false,
  onTap: () {},
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return ChromiaListTile(
                      leading: Icon(
                        Icons.block,
                        color: colors.textDisabled,
                      ),
                      title: const Text('Disabled Item'),
                      subtitle: const Text('This item is disabled'),
                      enabled: false,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
