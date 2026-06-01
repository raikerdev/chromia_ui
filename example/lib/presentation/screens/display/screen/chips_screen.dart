import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/screens/display/display_constants.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChipsScreen extends StatelessWidget {
  const ChipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = ['Flutter', 'Dart', 'Mobile', 'UI'];
    bool active = false;
    bool pending = true;
    bool completed = false;
    String? selected;

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
              title: 'Variants',
              child: ChromiaCodePreviewGroup(
                items: [
                  const CodePreviewItem(
                    label: 'Basic',
                    description: 'Simple label-only chips. Wrap with ChromiaChipGroup to handle Wrap layout automatically.',
                    code: ChipConstants.simpleCode,
                    preview: ChromiaChipGroup(
                      children: [
                        ChromiaChip(label: 'Flutter'),
                        ChromiaChip(label: 'Dart'),
                        ChromiaChip(label: 'Mobile'),
                        ChromiaChip(label: 'Design'),
                        ChromiaChip(label: 'UI'),
                      ],
                    ),
                  ),
                  const CodePreviewItem(
                    label: 'With Icons',
                    description: 'Add a leading icon to provide visual context.',
                    code: ChipConstants.withIconCode,
                    preview: ChromiaChipGroup(
                      children: [
                        ChromiaChip(label: 'Home', icon: Icons.home),
                        ChromiaChip(label: 'Favorite', icon: Icons.favorite),
                        ChromiaChip(label: 'Star', icon: Icons.star),
                        ChromiaChip(label: 'Settings', icon: Icons.settings),
                      ],
                    ),
                  ),
                  CodePreviewItem(
                    label: 'With Avatars',
                    description:
                        'AdPass a ChromiaAvatar as the avatar parameter to show a user picture or initials inside the chip.',
                    code: ChipConstants.withAvatarCode,
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
                ],
              ),
            ),

            // ── Deletable (Tags) ──────────────────────────────────────────────
            ComponentSection(
              title: 'Deletable Chips',
              description: 'Provide onDeleted to show a remove button. Ideal for dynamic tag lists.',
              child: ChromiaCodePreview(
                code: ChipConstants.deletableCode,
                preview: StatefulBuilder(
                  builder: (context, setBuilderState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChromiaChipGroup(
                          children: tags.map((tag) {
                            return ChromiaChip(
                              label: tag,
                              onDeleted: () {
                                setBuilderState(() => tags.remove(tag));
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
                          onPressed: () => setBuilderState(() {
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
                  'Use ChromiaChip.filter() for multi-select filtering. Multiple filters can be active at the same time.',
              child: ChromiaCodePreview(
                code: ChipConstants.filterCode,
                preview: StatefulBuilder(
                  builder: (context, setBuilderState) {
                    return ChromiaChipGroup(
                      children: [
                        ChromiaChip.filter(
                          label: 'Active',
                          selected: active,
                          icon: Icons.check_circle,
                          selectedIcon: Icons.check_circle,
                          onSelected: (v) => setBuilderState(() => active = v),
                        ),
                        ChromiaChip.filter(
                          label: 'Pending',
                          selected: pending,
                          icon: Icons.pending,
                          selectedIcon: Icons.pending,
                          onSelected: (v) => setBuilderState(() => pending = v),
                        ),
                        ChromiaChip.filter(
                          label: 'Completed',
                          selected: completed,
                          icon: Icons.done_all,
                          selectedIcon: Icons.done_all,
                          onSelected: (v) => setBuilderState(() => completed = v),
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
                code: ChipConstants.choiceCode,
                preview: StatefulBuilder(
                  builder: (context, setBuilderState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChromiaChipGroup(
                          children: ['Small', 'Medium', 'Large', 'XL'].map(
                            (option) {
                              return ChromiaChip.choice(
                                label: option,
                                selected: selected == option,
                                onSelected: () => setBuilderState(() => selected = option),
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
