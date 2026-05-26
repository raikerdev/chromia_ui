import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AvatarsScreen extends StatelessWidget {
  const AvatarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Avatar',
      children: [
        ComponentPage(
          description:
              'ChromiaAvatar displays a user representation using an image, '
              'initials, or an icon. It supports four sizes, three shapes, '
              'and can be grouped with ChromiaAvatarGroup.',
          whenToUse:
              'Use avatars in headers, lists, and comments to represent users. '
              'Use initials when no image is available. '
              'Use ChromiaAvatarGroup when showing a limited set of participants '
              'with a "+N more" overflow indicator.',
          children: [
            // ── Initials ──────────────────────────────────────────────────────
            ComponentSection(
              title: 'Initials',
              description:
                  'Use ChromiaAvatar.initials() when no profile image is available.',
              child: ChromiaCodePreview(
                code: '''
ChromiaAvatar.initials(
  initials: 'AB',
  backgroundColor: colors.primary,
  size: ChromiaAvatarSize.large,
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ChromiaAvatar.initials(
                          initials: 'AB',
                          backgroundColor: colors.primary,
                          size: ChromiaAvatarSize.extraSmall,
                        ),
                        ChromiaAvatar.initials(
                          initials: 'CD',
                          backgroundColor: colors.secondary,
                          size: ChromiaAvatarSize.small,
                        ),
                        ChromiaAvatar.initials(
                          initials: 'EF',
                          backgroundColor: colors.success,
                          size: ChromiaAvatarSize.medium,
                        ),
                        ChromiaAvatar.initials(
                          initials: 'GH',
                          backgroundColor: colors.error,
                          size: ChromiaAvatarSize.large,
                        ),
                        ChromiaAvatar.initials(
                          initials: 'IJ',
                          backgroundColor: colors.info,
                          size: ChromiaAvatarSize.extraLarge,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Icon ──────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Icon',
              description:
                  'Use ChromiaAvatar.icon() for generic or system-level user representations.',
              child: ChromiaCodePreview(
                code: '''
ChromiaAvatar.icon(
  icon: Icons.person,
  backgroundColor: colors.primary,
  size: ChromiaAvatarSize.large,
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
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
                    );
                  },
                ),
              ),
            ),

            // ── Image ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Image',
              description:
                  'Use ChromiaAvatar.image() with any ImageProvider. '
                  'The backgroundColor is shown while the image loads.',
              child: ChromiaCodePreview(
                code: '''
ChromiaAvatar.image(
  imageProvider: NetworkImage('https://picsum.photos/200'),
  size: ChromiaAvatarSize.large,
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ChromiaAvatar.image(
                          imageProvider:
                              const NetworkImage('https://picsum.photos/200'),
                          backgroundColor: colors.primary,
                          size: ChromiaAvatarSize.small,
                        ),
                        ChromiaAvatar.image(
                          imageProvider:
                              const NetworkImage('https://picsum.photos/201'),
                          backgroundColor: colors.secondary,
                          size: ChromiaAvatarSize.medium,
                        ),
                        ChromiaAvatar.image(
                          imageProvider:
                              const NetworkImage('https://picsum.photos/202'),
                          backgroundColor: colors.success,
                          size: ChromiaAvatarSize.large,
                        ),
                        ChromiaAvatar.image(
                          imageProvider:
                              const NetworkImage('https://picsum.photos/203'),
                          backgroundColor: colors.warning,
                          size: ChromiaAvatarSize.extraLarge,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Shapes ────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Shapes',
              description:
                  'Three shapes — circle (default), rounded, and square — '
                  'to match different design contexts.',
              child: ChromiaCodePreview(
                code: '''
ChromiaAvatar.initials(
  initials: 'C',
  shape: ChromiaAvatarShape.circle,
  size: ChromiaAvatarSize.large,
)

ChromiaAvatar.initials(
  initials: 'R',
  shape: ChromiaAvatarShape.rounded,
  size: ChromiaAvatarSize.large,
)

ChromiaAvatar.initials(
  initials: 'S',
  shape: ChromiaAvatarShape.square,
  size: ChromiaAvatarSize.large,
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
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
                    );
                  },
                ),
              ),
            ),

            // ── Avatar Group ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Avatar Group',
              description:
                  'ChromiaAvatarGroup stacks avatars with overlap and shows '
                  'a "+N" overflow indicator when the count exceeds max.',
              child: ChromiaCodePreview(
                code: '''
ChromiaAvatarGroup(
  max: 4,
  showMore: true,
  size: ChromiaAvatarSize.large,
  avatars: [
    ChromiaAvatar.initials(initials: 'AB', backgroundColor: colors.primary),
    ChromiaAvatar.initials(initials: 'CD', backgroundColor: colors.secondary),
    ChromiaAvatar.initials(initials: 'EF', backgroundColor: colors.success),
    ChromiaAvatar.initials(initials: 'GH', backgroundColor: colors.error),
    ChromiaAvatar.initials(initials: 'IJ', backgroundColor: colors.warning),
  ],
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return ChromiaAvatarGroup(
                      max: 4,
                      showMore: true,
                      size: ChromiaAvatarSize.large,
                      spacing: 15,
                      avatars: [
                        ChromiaAvatar.initials(
                          initials: 'AB',
                          backgroundColor: colors.primary,
                        ),
                        ChromiaAvatar.image(
                          imageProvider:
                              const NetworkImage('https://picsum.photos/200'),
                          backgroundColor: colors.primary,
                          size: ChromiaAvatarSize.small,
                        ),
                        ChromiaAvatar.initials(
                          initials: 'EF',
                          backgroundColor: colors.success,
                        ),
                        ChromiaAvatar.image(
                          imageProvider:
                              const NetworkImage('https://picsum.photos/201'),
                          backgroundColor: colors.primary,
                          size: ChromiaAvatarSize.small,
                        ),
                        ChromiaAvatar.initials(
                          initials: 'IJ',
                          backgroundColor: colors.error,
                        ),
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
