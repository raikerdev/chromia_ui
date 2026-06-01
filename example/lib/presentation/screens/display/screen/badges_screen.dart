import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/screens/display/display_constants.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final icon = Icon(
      Icons.notifications,
      size: 32,
      color: colors.primary,
    );
    return ExampleScaffold(
      title: 'Badge',
      children: [
        ComponentPage(
          description:
              'Chromia provides ChromiaBadge for notification counts, '
              'ChromiaLabelBadge for tag-style labels, and ChromiaStatusBadge '
              'for semantic status indicators (success, warning, error, info, neutral).',
          whenToUse:
              'Use ChromiaBadge on icons and avatars to indicate unread counts. '
              'Use ChromiaLabelBadge for tags, categories, or feature flags. '
              'Use ChromiaStatusBadge to communicate the state of a record or entity.',
          children: [
            // ── Variants ──────────────────────────────────────────────────────
            ComponentSection(
              title: 'Variants',
              description:
                  'Wrap any widget with ChromiaBadge. Pass an empty string for a dot indicator, or a number/text for a count.',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Dot',
                    description: 'Show badge with no value',
                    code: BadgeConstants.dotCode,
                    preview: ChromiaBadge(child: icon),
                  ),
                  CodePreviewItem(
                    label: 'Count',
                    description: 'Show badge with numeric value',
                    code: BadgeConstants.countCode,
                    preview: ChromiaBadge(
                      value: '9',
                      child: icon,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Overflow',
                    description: 'Show badge capped with maxValue',
                    code: BadgeConstants.overflowCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      child: icon,
                    ),
                  ),
                ],
              ),
            ),

            // ── Sizes ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Sizes',
              description: 'Small, medium, and large badge sizes.',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Small',
                    code: BadgeConstants.smallCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      size: ChromiaBadgeSize.small,
                      child: icon,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Medium',
                    code: BadgeConstants.mediumCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      size: ChromiaBadgeSize.medium,
                      child: icon,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Large',
                    code: BadgeConstants.largeCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      size: ChromiaBadgeSize.large,
                      child: icon,
                    ),
                  ),
                ],
              ),
            ),

            // ── Shapes ────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Shapes',
              description: 'Circle, rounded and square badge shapes.',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Circle',
                    code: BadgeConstants.circleCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      shape: ChromiaBadgeShape.circle,
                      child: icon,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Rounded',
                    code: BadgeConstants.roundedCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      shape: ChromiaBadgeShape.rounded,
                      child: icon,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Square',
                    code: BadgeConstants.squareCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      shape: ChromiaBadgeShape.square,
                      child: icon,
                    ),
                  ),
                ],
              ),
            ),

            // ── Positions ────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Positions',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Top-Right',
                    code: BadgeConstants.topRightCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      position: ChromiaPosition.topRight(),
                      child: icon,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Bottom-Right',
                    code: BadgeConstants.bottomRightCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      position: ChromiaPosition.bottomRight(),
                      child: icon,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Bottom-Left',
                    code: BadgeConstants.bottomLeftCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      position: ChromiaPosition.bottomLeft(),
                      child: icon,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Top-Left',
                    code: BadgeConstants.topLeftCode,
                    preview: ChromiaBadge(
                      value: '99',
                      maxValue: 9,
                      position: ChromiaPosition.topLeft(),
                      child: icon,
                    ),
                  ),
                ],
              ),
            ),

            // ── Status Badges ─────────────────────────────────────────────────
            const ComponentSection(
              title: 'Status Badges',
              description:
                  'ChromiaStatusBadge communicates the state of a record. Omit text to render a status dot on an avatar.',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Dot on an avatar',
                    code: BadgeConstants.dotOnAvatar,
                    preview: Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.success,
                          child: ChromiaAvatar(child: Icon(Symbols.person)),
                        ),
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.warning,
                          child: ChromiaAvatar(child: Icon(Symbols.person)),
                        ),
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.error,
                          child: ChromiaAvatar(child: Icon(Symbols.person)),
                        ),
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.info,
                          child: ChromiaAvatar(child: Icon(Symbols.person)),
                        ),
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.neutral,
                          child: ChromiaAvatar(child: Icon(Symbols.person)),
                        ),
                      ],
                    ),
                  ),
                  CodePreviewItem(
                    label: 'With text labels',
                    code: BadgeConstants.withTextLabels,
                    preview: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.success,
                          text: 'Active',
                        ),
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.warning,
                          text: 'Pending',
                        ),
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.error,
                          text: 'Error',
                        ),
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.info,
                          text: 'Info',
                        ),
                        ChromiaStatusBadge(
                          status: ChromiaStatusType.neutral,
                          text: 'Inactive',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Label Badges ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Label Badges',
              description: 'ChromiaLabelBadge renders tag-style chips with optional icons and a removable button.',
              child: ChromiaCodePreviewGroup(
                items: [
                  const CodePreviewItem(
                    label: 'Simple',
                    code: BadgeConstants.labelSimple,
                    preview: ChromiaLabelBadge(text: 'v1.0.0'),
                  ),
                  const CodePreviewItem(
                    label: 'With Icon',
                    code: BadgeConstants.labelWithIcon,
                    preview: ChromiaLabelBadge(
                      text: 'Favorite',
                      icon: Icons.favorite,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'With Color',
                    code: BadgeConstants.labelWithColor,
                    preview: ChromiaLabelBadge(
                      text: 'New',
                      backgroundColor: colors.primary,
                      textColor: colors.onPrimary,
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Shapes',
                    code: BadgeConstants.labelShapes,
                    preview:  Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ChromiaLabelBadge(
                          text: 'Square',
                          shape: ChromiaBadgeShape.square,
                          backgroundColor: colors.error,
                          textColor: colors.onError,
                        ),
                        ChromiaLabelBadge(
                          text: 'Rounded',
                          shape: ChromiaBadgeShape.rounded,
                          backgroundColor: colors.warning,
                          textColor: colors.onWarning,
                        ),
                        ChromiaLabelBadge(
                          text: 'Circle',
                          shape: ChromiaBadgeShape.circle,
                          backgroundColor: colors.info,
                          textColor: colors.onInfo,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
