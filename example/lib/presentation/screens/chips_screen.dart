import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class ChipsScreen extends StatefulWidget {
  const ChipsScreen({super.key});

  @override
  State<ChipsScreen> createState() => _ChipsScreenState();
}

class _ChipsScreenState extends State<ChipsScreen> {
  final List<String> _tags = [];
  bool _filterActive = false;
  bool _filterPending = false;
  bool _filterCompleted = false;
  String? _selectedChoice;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Chips',
      children: [
        // Chip section
        _buildChipSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildChipSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic chips
        ChromiaText(
          'Basic Chips',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaChipGroup(
          children: [
            ChromiaChip(label: 'Chip 1'),
            ChromiaChip(label: 'Chip 2'),
            ChromiaChip(label: 'Chip 3'),
            ChromiaChip(label: 'Chip 4'),
          ],
        ),
        spacing.gapVL,

        // Chips with icons
        ChromiaText(
          'Chips with Icons',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaChipGroup(
          children: [
            ChromiaChip(
              label: 'Home',
              icon: Icons.home,
            ),
            ChromiaChip(
              label: 'Favorite',
              icon: Icons.favorite,
            ),
            ChromiaChip(
              label: 'Star',
              icon: Icons.star,
            ),
          ],
        ),
        spacing.gapVL,

        // Deletable chips (tags)
        ChromiaText(
          'Deletable Chips (Tags)',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaChipGroup(
          children: _tags.map((tag) {
            return ChromiaChip(
              label: tag,
              onDeleted: () {
                setState(() {
                  _tags.remove(tag);
                });
              },
            );
          }).toList(),
        ),
        if (_tags.isNotEmpty) spacing.gapVS,
        ChromiaButton(
          size: ChromiaButtonSize.small,
          variant: ChromiaButtonVariant.outlined,
          onPressed: () {
            setState(() {
              _tags.addAll(['Flutter', 'Dart', 'Mobile']);
            });
          },
          child: const ChromiaText('Reset Tags'),
        ),
        spacing.gapVL,

        // Filter chips
        ChromiaText(
          'Filter Chips',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaChipGroup(
          children: [
            ChromiaChip.filter(
              label: 'Active',
              selected: _filterActive,
              onSelected: (selected) {
                setState(() => _filterActive = selected);
              },
              icon: Icons.check_circle,
              selectedIcon: Icons.check_circle,
            ),
            ChromiaChip.filter(
              label: 'Pending',
              selected: _filterPending,
              onSelected: (selected) {
                setState(() => _filterPending = selected);
              },
              icon: Icons.pending,
              selectedIcon: Icons.pending,
            ),
            ChromiaChip.filter(
              label: 'Completed',
              selected: _filterCompleted,
              onSelected: (selected) {
                setState(() => _filterCompleted = selected);
              },
              icon: Icons.done_all,
              selectedIcon: Icons.done_all,
            ),
          ],
        ),
        spacing.gapVL,

        // Choice chips (radio style)
        ChromiaText(
          'Choice Chips',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaChipGroup(
          children: [
            ChromiaChip.choice(
              label: 'Option 1',
              selected: _selectedChoice == 'Option 1',
              onSelected: () {
                setState(() => _selectedChoice = 'Option 1');
              },
            ),
            ChromiaChip.choice(
              label: 'Option 2',
              selected: _selectedChoice == 'Option 2',
              onSelected: () {
                setState(() => _selectedChoice = 'Option 2');
              },
            ),
            ChromiaChip.choice(
              label: 'Option 3',
              selected: _selectedChoice == 'Option 3',
              onSelected: () {
                setState(() => _selectedChoice = 'Option 3');
              },
            ),
          ],
        ),
        spacing.gapVS,
        ChromiaText(
          'Selected: $_selectedChoice',
          style: theme.typography.bodySmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVL,

        // Chips with avatars
        ChromiaText(
          'Chips with Avatars',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaChipGroup(
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
        ),
      ],
    );
  }
}
