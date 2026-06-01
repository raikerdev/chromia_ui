import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/screens/display/display_constants.dart';
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
            // ── Variants ──────────────────────────────────────────────────────
            ComponentSection(
              title: 'Variants',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Initials',
                    description: 'Use ChromiaAvatar.initials() when no profile image is available.',
                    code: AvatarConstants.initialsCode,
                    preview: Builder(
                      builder: (context) {
                        final colors = context.chromiaColors;
                        return ChromiaAvatar.initials(
                          initials: 'AB',
                          backgroundColor: colors.primary,
                          size: ChromiaAvatarSize.extraLarge,
                        );
                      },
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Icon',
                    description: 'Use ChromiaAvatar.icon() for generic or system-level user representations.',
                    code: AvatarConstants.iconCode,
                    preview: Builder(
                      builder: (context) {
                        final colors = context.chromiaColors;
                        return ChromiaAvatar.icon(
                          icon: Icons.person,
                          backgroundColor: colors.primary,
                          size: ChromiaAvatarSize.extraLarge,
                        );
                      },
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Image',
                    description:
                        'Use ChromiaAvatar.image() with any ImageProvider. The backgroundColor is shown while the image loads.',
                    code: AvatarConstants.imageCode,
                    preview: Builder(
                      builder: (context) {
                        final colors = context.chromiaColors;
                        return ChromiaAvatar.image(
                          imageProvider: const NetworkImage('https://picsum.photos/200'),
                          backgroundColor: colors.primary,
                          size: ChromiaAvatarSize.extraLarge,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ── Sizes ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Sizes',
              child: ChromiaCodePreview(
                code: AvatarConstants.sizesCode,
                preview: Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ChromiaAvatar.initials(
                      initials: 'AB',
                      size: ChromiaAvatarSize.extraSmall,
                    ),
                    ChromiaAvatar.initials(
                      initials: 'CD',
                      size: ChromiaAvatarSize.small,
                    ),
                    ChromiaAvatar.initials(
                      initials: 'EF',
                      size: ChromiaAvatarSize.medium,
                    ),
                    ChromiaAvatar.initials(
                      initials: 'GH',
                      size: ChromiaAvatarSize.large,
                    ),
                    ChromiaAvatar.initials(
                      initials: 'IJ',
                      size: ChromiaAvatarSize.extraLarge,
                    ),
                  ],
                ),
              ),
            ),

            // ── Shapes ────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Shapes',
              description: 'Three shapes — circle (default), rounded, and square — to match different design contexts.',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Circle',
                    code: AvatarConstants.shapeCircleCode,
                    preview: Builder(
                      builder: (context) {
                        final colors = context.chromiaColors;
                        return ChromiaAvatar.initials(
                          initials: 'CD',
                          backgroundColor: colors.primary,
                          shape: ChromiaAvatarShape.circle,
                          size: ChromiaAvatarSize.extraLarge,
                        );
                      },
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Rounded',
                    code: AvatarConstants.shapeRoundedCode,
                    preview: Builder(
                      builder: (context) {
                        final colors = context.chromiaColors;
                        return ChromiaAvatar.icon(
                          icon: Icons.person,
                          backgroundColor: colors.primary,
                          shape: ChromiaAvatarShape.rounded,
                          size: ChromiaAvatarSize.extraLarge,
                        );
                      },
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Square',
                    code: AvatarConstants.shapeSquareCode,
                    preview: Builder(
                      builder: (context) {
                        final colors = context.chromiaColors;
                        return ChromiaAvatar.image(
                          imageProvider: const NetworkImage('https://picsum.photos/200'),
                          backgroundColor: colors.primary,
                          shape: ChromiaAvatarShape.square,
                          size: ChromiaAvatarSize.extraLarge,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ── Avatar Group ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Avatar Group',
              description:
                  'ChromiaAvatarGroup stacks avatars with overlap and shows a "+N" overflow indicator when the count exceeds max.',
              child: ChromiaCodePreview(
                code: AvatarConstants.groupCode,
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return ChromiaAvatarGroup(
                      max: 3,
                      showMore: true,
                      size: ChromiaAvatarSize.extraLarge,
                      spacing: 15,
                      avatars: [
                        ChromiaAvatar.initials(initials: 'AB', backgroundColor: colors.primary),
                        ChromiaAvatar.initials(initials: 'CD', backgroundColor: colors.secondary),
                        ChromiaAvatar.initials(initials: 'EF', backgroundColor: colors.success),
                        ChromiaAvatar.initials(initials: 'GH', backgroundColor: colors.error),
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
