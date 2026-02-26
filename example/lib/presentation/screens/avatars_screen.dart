import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class AvatarsScreen extends StatelessWidget {
  const AvatarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Avatars',
      children: [
        // Avatar section
        _buildAvatarSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildAvatarSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic avatars with images
        ChromiaText(
          'Image Avatars',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.m,
          children: [
            ChromiaAvatar(
              backgroundColor: colors.primary,
              size: ChromiaAvatarSize.small,
              child: Icon(Icons.person, color: colors.onPrimary),
            ),
            ChromiaAvatar(
              backgroundColor: colors.secondary,
              size: ChromiaAvatarSize.medium,
              child: Icon(Icons.person, color: colors.onPrimary),
            ),
            ChromiaAvatar(
              backgroundColor: colors.success,
              size: ChromiaAvatarSize.large,
              child: Icon(Icons.person, color: colors.onPrimary),
            ),
            ChromiaAvatar(
              backgroundColor: colors.warning,
              size: ChromiaAvatarSize.extraLarge,
              child: Icon(Icons.person, color: colors.onPrimary),
            ),
          ],
        ),
        spacing.gapVM,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.m,
          children: [
            ChromiaAvatar(
              imageProvider: const NetworkImage('https://picsum.photos/200'),
              backgroundColor: colors.primary,
              size: ChromiaAvatarSize.small,
              child: Icon(Icons.person, color: colors.onPrimary),
            ),
            ChromiaAvatar(
              imageProvider: const NetworkImage('https://picsum.photos/200'),
              backgroundColor: colors.secondary,
              size: ChromiaAvatarSize.medium,
              child: Icon(Icons.person, color: colors.onPrimary),
            ),
            ChromiaAvatar(
              imageProvider: const NetworkImage('https://picsum.photos/200'),
              backgroundColor: colors.success,
              size: ChromiaAvatarSize.large,
              child: Icon(Icons.person, color: colors.onPrimary),
            ),
            ChromiaAvatar(
              imageProvider: const NetworkImage('https://picsum.photos/200'),
              backgroundColor: colors.warning,
              size: ChromiaAvatarSize.extraLarge,
              child: Icon(Icons.person, color: colors.onPrimary),
            ),
          ],
        ),
        spacing.gapVL,

        // Initials avatars
        ChromiaText(
          'Initials Avatars',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.m,
          children: [
            ChromiaAvatar.initials(
              initials: 'AB',
              backgroundColor: colors.primary,
              size: ChromiaAvatarSize.small,
            ),
            ChromiaAvatar.initials(
              initials: 'CD',
              backgroundColor: colors.secondary,
              size: ChromiaAvatarSize.medium,
            ),
            ChromiaAvatar.initials(
              initials: 'EF',
              backgroundColor: colors.error,
              size: ChromiaAvatarSize.large,
            ),
            ChromiaAvatar.initials(
              initials: 'GH',
              backgroundColor: colors.info,
              size: ChromiaAvatarSize.extraLarge,
            ),
          ],
        ),
        spacing.gapVL,

        // Icon avatars
        ChromiaText(
          'Icon Avatars',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.m,
          children: [
            ChromiaAvatar.icon(
              icon: Icons.person,
              backgroundColor: colors.primary,
              size: ChromiaAvatarSize.small,
            ),
            ChromiaAvatar.icon(
              icon: Icons.business,
              backgroundColor: colors.secondary,
              size: ChromiaAvatarSize.medium,
            ),
            ChromiaAvatar.icon(
              icon: Icons.favorite,
              backgroundColor: colors.error,
              size: ChromiaAvatarSize.large,
            ),
            ChromiaAvatar.icon(
              icon: Icons.star,
              backgroundColor: colors.warning,
              size: ChromiaAvatarSize.extraLarge,
            ),
          ],
        ),
        spacing.gapVL,

        // Avatar shapes
        ChromiaText(
          'Avatar Shapes',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.m,
          children: [
            ChromiaAvatar.initials(
              initials: 'C',
              backgroundColor: colors.primary,
              shape: ChromiaAvatarShape.circle,
              size: ChromiaAvatarSize.large,
            ),
            ChromiaAvatar.initials(
              initials: 'R',
              backgroundColor: colors.secondary,
              shape: ChromiaAvatarShape.rounded,
              size: ChromiaAvatarSize.large,
            ),
            ChromiaAvatar.initials(
              initials: 'S',
              backgroundColor: colors.success,
              shape: ChromiaAvatarShape.square,
              size: ChromiaAvatarSize.large,
            ),
          ],
        ),
        spacing.gapVL,

        // Avatars with status
        ChromiaText(
          'Avatars with Status',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.xl,
          runSpacing: spacing.m,
          children: [
            ChromiaAvatarWithStatus(
              avatar: ChromiaAvatar.initials(
                initials: 'ON',
                backgroundColor: colors.primary,
                size: ChromiaAvatarSize.large,
              ),
              status: ChromiaAvatarStatus.online,
            ),
            ChromiaAvatarWithStatus(
              avatar: ChromiaAvatar.initials(
                initials: 'BY',
                backgroundColor: colors.error,
                size: ChromiaAvatarSize.large,
              ),
              status: ChromiaAvatarStatus.busy,
            ),
            ChromiaAvatarWithStatus(
              avatar: ChromiaAvatar.initials(
                initials: 'AW',
                backgroundColor: colors.warning,
                size: ChromiaAvatarSize.large,
              ),
              status: ChromiaAvatarStatus.away,
            ),
            ChromiaAvatarWithStatus(
              avatar: ChromiaAvatar.initials(
                initials: 'OF',
                backgroundColor: colors.textTertiary,
                size: ChromiaAvatarSize.large,
              ),
              status: ChromiaAvatarStatus.offline,
            ),
          ],
        ),
        spacing.gapVL,

        // Avatar group
        ChromiaText(
          'Avatar Group',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaAvatarGroup(
          avatars: [
            ChromiaAvatar.initials(
              initials: 'AB',
              backgroundColor: colors.primary,
            ),
            ChromiaAvatar.initials(
              initials: 'CD',
              backgroundColor: colors.secondary,
            ),
            ChromiaAvatar.initials(
              initials: 'EF',
              backgroundColor: colors.success,
            ),
            ChromiaAvatar.initials(
              initials: 'GH',
              backgroundColor: colors.warning,
            ),
            ChromiaAvatar.initials(
              initials: 'IJ',
              backgroundColor: colors.error,
            ),
          ],
          max: 4,
          spacing: 15,
          showMore: true,
          size: ChromiaAvatarSize.large,
        ),
        spacing.gapVL,

        // Interactive avatar
        ChromiaText(
          'Interactive Avatar',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaAvatar.initials(
          initials: 'TA',
          backgroundColor: colors.primary,
          size: ChromiaAvatarSize.large,
          onTap: () {
            showChromiaAlert(
              context: context,
              title: 'Avatar Tapped',
              message: 'You tapped on the avatar!',
            );
          },
        ),
      ],
    );
  }

}
