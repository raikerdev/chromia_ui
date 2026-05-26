import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChipsScreen extends StatelessWidget {
  const ChipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Chip',
      children: [
        ComponentPage(
          description:
              'ChromiaChip displays compact information or actions. '
              'It supports icons, avatars, deletable tags, filter selection, '
              'and single-choice (radio) behavior. '
              'Wrap multiple chips with ChromiaChipGroup for automatic wrapping.',
          whenToUse:
              'Use basic chips for tags and categories. '
              'Use filter chips to let users apply multiple search filters simultaneously. '
              'Use choice chips for mutually exclusive selections (similar to radio buttons). '
              'Use deletable chips for dynamic tag input.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description:
                  'Simple label-only chips. Wrap with ChromiaChipGroup '
                  'to handle Wrap layout automatically.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
ChromiaChipGroup(
  children: [
    ChromiaChip(label: 'Flutter'),
    ChromiaChip(label: 'Dart'),
    ChromiaChip(label: 'Mobile'),
    ChromiaChip(label: 'Design'),
  ],
)''',
                preview: const ChromiaChipGroup(
                  children: [
                    ChromiaChip(label: 'Flutter'),
                    ChromiaChip(label: 'Dart'),
                    ChromiaChip(label: 'Mobile'),
                    ChromiaChip(label: 'Design'),
                    ChromiaChip(label: 'UI'),
                  ],
                ),
              ),
            ),

            // ── With Icons ────────────────────────────────────────────────────
            ComponentSection(
              title: 'With Icons',
              description:
                  'Add a leading icon to provide visual context.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
ChromiaChip(label: 'Home',     icon: Icons.home)
ChromiaChip(label: 'Favorite', icon: Icons.favorite)
ChromiaChip(label: 'Star',     icon: Icons.star)''',
                preview: const ChromiaChipGroup(
                  children: [
                    ChromiaChip(label: 'Home', icon: Icons.home),
                    ChromiaChip(label: 'Favorite', icon: Icons.favorite),
                    ChromiaChip(label: 'Star', icon: Icons.star),
                    ChromiaChip(label: 'Settings', icon: Icons.settings),
                  ],
                ),
              ),
            ),

            // ── With Avatars ──────────────────────────────────────────────────
            ComponentSection(
              title: 'With Avatars',
              description:
                  'Pass a ChromiaAvatar as the avatar parameter to show '
                  'a user picture or initials inside the chip.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
ChromiaChip(
  label: 'Alice',
  avatar: ChromiaAvatar.initials(
    initials: 'A',
    backgroundColor: colors.primary,
    size: ChromiaAvatarSize.extraSmall,
  ),
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return ChromiaChipGroup(
                      children: [
                        ChromiaChip(
                          label: 'Alice',
                          avatar: ChromiaAvatar.initials(
                            initials: 'A',
                            backgroundColor: colors.primary,
                            size: ChromiaAvatarSize.extraSmall,
                          ),
                        ),
                        ChromiaChip(
                          label: 'Bob',
                          avatar: ChromiaAvatar.initials(
                            initials: 'B',
                            backgroundColor: colors.secondary,
                            size: ChromiaAvatarSize.extraSmall,
                          ),
                        ),
                        ChromiaChip(
                          label: 'Charlie',
                          avatar: ChromiaAvatar.initials(
                            initials: 'C',
                            backgroundColor: colors.success,
                            size: ChromiaAvatarSize.extraSmall,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Deletable (Tags) ──────────────────────────────────────────────
            ComponentSection(
              title: 'Deletable Chips',
              description:
                  'Provide onDeleted to show a remove button. '
                  'Ideal for dynamic tag lists.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
ChromiaChip(
  label: tag,
  onDeleted: () => setState(() => tags.remove(tag)),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    final tags = ['Flutter', 'Dart', 'Mobile', 'UI'];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChromiaChipGroup(
                          children: tags.map((tag) {
                            return ChromiaChip(
                              label: tag,
                              onDeleted: () {
                                setState(() => tags.remove(tag));
                              },
                            );
                          }).toList(),
                        ),
                        if (tags.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: ChromiaText(
                              'All chips removed. Tap Reset.',
                              type: ChromiaTypographyType.bodySmall,
                            ),
                          ),
                        const SizedBox(height: 8),
                        ChromiaButton(
                          size: ChromiaButtonSize.small,
                          variant: ChromiaButtonVariant.outlined,
                          onPressed: () => setState(() {
                            tags.addAll(
                              ['Flutter', 'Dart', 'Mobile', 'UI'],
                            );
                          }),
                          child: const Text('Reset Tags'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Filter Chips ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Filter Chips',
              description:
                  'Use ChromiaChip.filter() for multi-select filtering. '
                  'Multiple filters can be active at the same time.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
ChromiaChip.filter(
  label: 'Active',
  selected: filterActive,
  icon: Icons.check_circle,
  onSelected: (selected) => setState(() => filterActive = selected),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool active = false;
                    bool pending = true;
                    bool completed = false;
                    return ChromiaChipGroup(
                      children: [
                        ChromiaChip.filter(
                          label: 'Active',
                          selected: active,
                          icon: Icons.check_circle,
                          selectedIcon: Icons.check_circle,
                          onSelected: (v) => setState(() => active = v),
                        ),
                        ChromiaChip.filter(
                          label: 'Pending',
                          selected: pending,
                          icon: Icons.pending,
                          selectedIcon: Icons.pending,
                          onSelected: (v) => setState(() => pending = v),
                        ),
                        ChromiaChip.filter(
                          label: 'Completed',
                          selected: completed,
                          icon: Icons.done_all,
                          selectedIcon: Icons.done_all,
                          onSelected: (v) =>
                              setState(() => completed = v),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Choice Chips ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Choice Chips',
              description:
                  'Use ChromiaChip.choice() for single-select options. '
                  'Only one choice chip can be selected at a time.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
ChromiaChip.choice(
  label: 'Option 1',
  selected: selectedChoice == 'Option 1',
  onSelected: () => setState(() => selectedChoice = 'Option 1'),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    String? selected;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChromiaChipGroup(
                          children: ['Small', 'Medium', 'Large', 'XL'].map(
                            (option) {
                              return ChromiaChip.choice(
                                label: option,
                                selected: selected == option,
                                onSelected: () =>
                                    setState(() => selected = option),
                              );
                            },
                          ).toList(),
                        ),
                        if (selected != null) ...[
                          const SizedBox(height: 8),
                          ChromiaText(
                            'Selected: $selected',
                            type: ChromiaTypographyType.bodySmall,
                            color: context.chromiaColors.onSurfaceVariant,
                          ),
                        ],
                      ],
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
