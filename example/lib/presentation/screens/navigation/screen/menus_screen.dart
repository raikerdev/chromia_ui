import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MenusScreen extends StatelessWidget {
  const MenusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Menu',
      children: [
        ComponentPage(
          description:
              'Chromia provides three menu components: ChromiaPopupMenu for '
              'three-dot overflow menus, ChromiaMenuButton for a labeled dropdown '
              'trigger, and ChromiaContextMenu for long-press / right-click menus.',
          whenToUse:
              'Use ChromiaPopupMenu for overflow actions in list items or cards. '
              'Use ChromiaMenuButton when users need to pick an action from a '
              'labeled button (e.g., "Sort by"). '
              'Use ChromiaContextMenu to add contextual actions to any widget.',
          children: [
            // ── Popup Menu ────────────────────────────────────────────────────
            ComponentSection(
              title: 'Popup Menu',
              description:
                  'ChromiaPopupMenu renders a three-dot icon that opens a dropdown '
                  'list of ChromiaMenuItem actions.',
              child: ChromiaCodePreview(
                code: '''
ChromiaPopupMenu<String>(
  items: const [
    ChromiaMenuItem(value: 'edit',   label: 'Edit',   icon: Icons.edit),
    ChromiaMenuItem(value: 'share',  label: 'Share',  icon: Icons.share),
    ChromiaMenuItem(value: 'delete', label: 'Delete', icon: Icons.delete),
  ],
  onSelected: (value) => showSnackBar(message: 'Selected: \$value'),
)''',
                preview: Builder(
                  builder: (context) => ChromiaCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Options'),
                        ChromiaPopupMenu<String>(
                          items: const [
                            ChromiaMenuItem(
                              value: 'edit',
                              label: 'Edit',
                              icon: Icons.edit,
                            ),
                            ChromiaMenuItem(
                              value: 'share',
                              label: 'Share',
                              icon: Icons.share,
                            ),
                            ChromiaMenuItem(
                              value: 'delete',
                              label: 'Delete',
                              icon: Icons.delete,
                            ),
                          ],
                          onSelected: (value) {
                            context.showInfoSnackBar(
                              message: 'Selected: $value',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ── Menu Button ───────────────────────────────────────────────────
            ComponentSection(
              title: 'Menu Button',
              description:
                  'ChromiaMenuButton shows a labeled button with a dropdown arrow. '
                  'Use for sort/filter controls.',
              child: ChromiaCodePreview(
                code: '''
ChromiaMenuButton<String>(
  label: 'Sort by',
  items: const [
    ChromiaMenuItem(value: 'name', label: 'Name', icon: Icons.sort_by_alpha),
    ChromiaMenuItem(value: 'date', label: 'Date', icon: Icons.calendar_today),
    ChromiaMenuItem(value: 'size', label: 'Size', icon: Icons.data_usage),
  ],
  onSelected: (value) => showSnackBar(message: 'Sorting by: \$value'),
)''',
                preview: Builder(
                  builder: (context) => ChromiaMenuButton<String>(
                    label: 'Sort by',
                    items: const [
                      ChromiaMenuItem(
                        value: 'name',
                        label: 'Name',
                        icon: Icons.sort_by_alpha,
                      ),
                      ChromiaMenuItem(
                        value: 'date',
                        label: 'Date',
                        icon: Icons.calendar_today,
                      ),
                      ChromiaMenuItem(
                        value: 'size',
                        label: 'Size',
                        icon: Icons.data_usage,
                      ),
                    ],
                    onSelected: (value) {
                      context.showInfoSnackBar(
                        message: 'Sorting by: $value',
                      );
                    },
                  ),
                ),
              ),
            ),

            // ── Context Menu ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Context Menu',
              description:
                  'ChromiaContextMenu adds a long-press (mobile) or '
                  'right-click (desktop/web) context menu to any widget.',
              child: ChromiaCodePreview(
                code: '''
ChromiaContextMenu<String>(
  items: const [
    ChromiaMenuItem(value: 'copy',  label: 'Copy',  icon: Icons.copy),
    ChromiaMenuItem(value: 'paste', label: 'Paste', icon: Icons.paste),
    ChromiaMenuItem(value: 'cut',   label: 'Cut',   icon: Icons.cut),
  ],
  onSelected: (value) => showSnackBar(message: 'Action: \$value'),
  child: ChromiaCard(child: Text('Long press or right-click here')),
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    final spacing = context.chromiaTheme.spacing;
                    return ChromiaContextMenu<String>(
                      items: const [
                        ChromiaMenuItem(
                          value: 'copy',
                          label: 'Copy',
                          icon: Icons.copy,
                        ),
                        ChromiaMenuItem(
                          value: 'paste',
                          label: 'Paste',
                          icon: Icons.paste,
                        ),
                        ChromiaMenuItem(
                          value: 'cut',
                          label: 'Cut',
                          icon: Icons.cut,
                        ),
                      ],
                      onSelected: (value) {
                        context.showInfoSnackBar(
                          message: 'Action: $value',
                        );
                      },
                      child: ChromiaCard(
                        child: Center(
                          child: Padding(
                            padding: spacing.paddingL,
                            child: ChromiaText(
                              'Long press or right-click here',
                              type: ChromiaTypographyType.bodyMedium,
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
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
