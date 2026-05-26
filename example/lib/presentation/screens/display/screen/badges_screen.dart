import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            // ── Basic Badges ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic Badges',
              description:
                  'Wrap any widget with ChromiaBadge. '
                  'Pass an empty string for a dot indicator, or a number/text for a count.',
              child: ChromiaCodePreview(
                code: '''
// Dot (no value)
ChromiaBadge(
  value: '',
  child: Icon(Icons.notifications),
)

// Count
ChromiaBadge(
  value: '8',
  child: Icon(Icons.notifications),
)

// Overflow — capped with maxValue
ChromiaBadge(
  value: '999',
  maxValue: 99,
  child: Icon(Icons.notifications),
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    final icon = Icon(
                      Symbols.notifications_rounded,
                      size: 32,
                      color: colors.primary,
                      fill: 1,
                    );
                    return Wrap(
                      spacing: 24,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ChromiaBadge(value: '', child: icon),
                        ChromiaBadge(value: '8', child: icon),
                        ChromiaBadge(value: '99', child: icon),
                        ChromiaBadge(
                          value: '999',
                          maxValue: 99,
                          child: icon,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Show / Hide ───────────────────────────────────────────────────
            ComponentSection(
              title: 'Show / Hide',
              description:
                  'Use showBadge: false to hide the badge without removing '
                  'the widget from the tree.',
              child: ChromiaCodePreview(
                code: '''
ChromiaBadge(
  value: '8',
  showBadge: isVisible,
  child: Icon(Icons.notifications),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    bool isVisible = true;
                    final colors = context.chromiaColors;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ChromiaBadge(
                          value: '8',
                          showBadge: isVisible,
                          child: Icon(
                            Symbols.notifications_rounded,
                            size: 32,
                            color: colors.primary,
                            fill: 1,
                          ),
                        ),
                        const SizedBox(width: 24),
                        ChromiaToggleButton(
                          value: isVisible,
                          label: 'Show badge',
                          size: ChromiaToggleButtonSize.small,
                          onChanged: (v) => setState(() => isVisible = v),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Sizes ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Sizes',
              description: 'Small, medium, and large badge sizes.',
              child: ChromiaCodePreview(
                code: '''
ChromiaBadge(value: '99', size: ChromiaBadgeSize.small, child: icon)
ChromiaBadge(value: '99', size: ChromiaBadgeSize.medium, child: icon)
ChromiaBadge(value: '99', size: ChromiaBadgeSize.large, child: icon)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    final icon = Icon(
                      Symbols.shopping_cart_rounded,
                      size: 32,
                      color: colors.primary,
                      fill: 1,
                    );
                    return Wrap(
                      spacing: 24,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ChromiaBadge(
                          value: '99',
                          size: ChromiaBadgeSize.small,
                          child: icon,
                        ),
                        ChromiaBadge(
                          value: '99',
                          size: ChromiaBadgeSize.medium,
                          child: icon,
                        ),
                        ChromiaBadge(
                          value: '99',
                          size: ChromiaBadgeSize.large,
                          child: icon,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Label Badges ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Label Badges',
              description:
                  'ChromiaLabelBadge renders tag-style chips with optional '
                  'icons and a removable button.',
              child: ChromiaCodePreview(
                code: '''
ChromiaLabelBadge(
  text: 'New',
  backgroundColor: colors.primary,
  textColor: colors.onPrimary,
)

ChromiaLabelBadge(
  text: 'Featured',
  icon: Icons.star,
)

ChromiaLabelBadge(
  text: 'Removable',
  onRemove: () {},
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ChromiaLabelBadge(
                          text: 'New',
                          backgroundColor: colors.primary,
                          textColor: colors.onPrimary,
                        ),
                        const ChromiaLabelBadge(
                          text: 'Featured',
                          icon: Icons.star,
                        ),
                        ChromiaLabelBadge(
                          text: 'Beta',
                          backgroundColor: colors.warning,
                          textColor: colors.onPrimary,
                        ),
                        ChromiaLabelBadge(
                          text: 'Removable',
                          onRemove: () {},
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Status Badges ─────────────────────────────────────────────────
            ComponentSection(
              title: 'Status Badges',
              description:
                  'ChromiaStatusBadge communicates the state of a record. '
                  'Omit text to render a status dot on an avatar.',
              child: ChromiaCodePreview(
                code: '''
// With text labels
ChromiaStatusBadge(status: ChromiaStatusType.success, text: 'Active')
ChromiaStatusBadge(status: ChromiaStatusType.warning, text: 'Pending')
ChromiaStatusBadge(status: ChromiaStatusType.error,   text: 'Error')
ChromiaStatusBadge(status: ChromiaStatusType.info,    text: 'Info')
ChromiaStatusBadge(status: ChromiaStatusType.neutral, text: 'Inactive')

// Dot on an avatar
ChromiaStatusBadge(
  status: ChromiaStatusType.success,
  child: ChromiaAvatar.icon(icon: Symbols.person),
)''',
                preview: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Wrap(
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
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: const [
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
