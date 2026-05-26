import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description:
                  'A title, optional leading icon, optional trailing widget, '
                  'and an onTap handler.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTile(
  leading: Icon(Icons.inbox, color: colors.primary),
  title: Text('Inbox'),
  trailing: Text('24'),
  onTap: () {},
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Column(
                      children: [
                        ChromiaListTile(
                          leading: Icon(
                            Icons.inbox,
                            color: colors.primary,
                          ),
                          title: const Text('Inbox'),
                          trailing: const Text('24'),
                          onTap: () => context.showInfoSnackBar(
                            message: 'Inbox tapped',
                          ),
                        ),
                        const SizedBox(height: 4),
                        ChromiaListTile(
                          leading: Icon(
                            Icons.drafts,
                            color: colors.onSurfaceVariant,
                          ),
                          title: const Text('Drafts'),
                          trailing: const Text('3'),
                          onTap: () => context.showInfoSnackBar(
                            message: 'Drafts tapped',
                          ),
                        ),
                        const SizedBox(height: 4),
                        ChromiaListTile(
                          leading: Icon(
                            Icons.delete,
                            color: colors.error,
                          ),
                          title: const Text('Trash'),
                          trailing: const Text('12'),
                          onTap: () => context.showInfoSnackBar(
                            message: 'Trash tapped',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── With Subtitle ─────────────────────────────────────────────────
            ComponentSection(
              title: 'With Subtitle',
              description:
                  'Add a subtitle for secondary information below the title.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTile(
  leading: CircleAvatar(child: Text('JD')),
  title: Text('John Doe'),
  subtitle: Text('Software Engineer'),
  trailing: Icon(Icons.chevron_right),
  onTap: () {},
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Column(
                      children: [
                        ChromiaListTile(
                          leading: CircleAvatar(
                            backgroundColor: colors.primary,
                            child: const Text(
                              'JD',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: const Text('John Doe'),
                          subtitle: const Text('Software Engineer'),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: colors.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(height: 4),
                        ChromiaListTile(
                          leading: CircleAvatar(
                            backgroundColor: colors.secondary,
                            child: const Text(
                              'AS',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: const Text('Alice Smith'),
                          subtitle: const Text('Product Manager'),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: colors.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Variants ─────────────────────────────────────────────────────
            ComponentSection(
              title: 'Variants',
              description:
                  'Standard (default), outlined (with border), and card (elevated) variants.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTile(
  variant: ChromiaListTileVariant.standard,
  title: Text('Standard'),
  subtitle: Text('Default variant'),
  onTap: () {},
)

ChromiaListTile(
  variant: ChromiaListTileVariant.outlined,
  title: Text('Outlined'),
  subtitle: Text('With border'),
  onTap: () {},
)

ChromiaListTile(
  variant: ChromiaListTileVariant.card,
  title: Text('Card'),
  subtitle: Text('With elevation'),
  onTap: () {},
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Column(
                      children: [
                        ChromiaListTile(
                          variant: ChromiaListTileVariant.standard,
                          leading: Icon(
                            Icons.layers,
                            color: colors.primary,
                          ),
                          title: const Text('Standard'),
                          subtitle: const Text('Default variant'),
                          onTap: () {},
                        ),
                        const SizedBox(height: 8),
                        ChromiaListTile(
                          variant: ChromiaListTileVariant.outlined,
                          leading: Icon(
                            Icons.layers_outlined,
                            color: colors.primary,
                          ),
                          title: const Text('Outlined'),
                          subtitle: const Text('With border'),
                          onTap: () {},
                        ),
                        const SizedBox(height: 8),
                        ChromiaListTile(
                          variant: ChromiaListTileVariant.card,
                          leading: Icon(
                            Icons.layers_rounded,
                            color: colors.primary,
                          ),
                          title: const Text('Card'),
                          subtitle: const Text('With elevation'),
                          onTap: () {},
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Selectable ────────────────────────────────────────────────────
            ComponentSection(
              title: 'Selectable List',
              description:
                  'Use selected: true and a check trailing to indicate the active item.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTile(
  leading: Icon(Icons.home, color: isSelected ? colors.primary : colors.onSurfaceVariant),
  title: Text('Home'),
  selected: isSelected,
  trailing: isSelected ? Icon(Icons.check, color: colors.primary) : null,
  onTap: () => setState(() => selectedIndex = 0),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    int selectedIndex = 0;
                    final colors = context.chromiaColors;
                    final items = [
                      (Icons.home, 'Home'),
                      (Icons.explore, 'Explore'),
                      (Icons.notifications, 'Notifications'),
                      (Icons.settings, 'Settings'),
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
                              item.$1,
                              color: isSelected
                                  ? colors.primary
                                  : colors.onSurfaceVariant,
                            ),
                            title: Text(item.$2),
                            selected: isSelected,
                            trailing: isSelected
                                ? Icon(
                                    Icons.check,
                                    color: colors.primary,
                                  )
                                : null,
                            onTap: () =>
                                setState(() => selectedIndex = i),
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
                            onChanged: (v) =>
                                setState(() => push = v),
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
                            onChanged: (v) =>
                                setState(() => email = v),
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
