import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Badges',
      children: [
        // Badges section
        _buildBadgeSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildBadgeSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final showBadge = ValueNotifier(true);

    final notificationIcon = Icon(Symbols.notifications_rounded, size: 32, color: colors.primary, fill: 1);
    final emailIcon = Icon(Symbols.email_rounded, size: 32, color: colors.primary, fill: 1);
    final starIcon = Icon(Symbols.star_rounded, size: 32, color: colors.primary, fill: 1);
    final shoppingCartIcon = Icon(Symbols.shopping_cart_rounded, size: 32, color: colors.primary, fill: 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic badges
        ChromiaText(
          'Basic Badges',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.xl,
          runSpacing: spacing.m,
          children: [
            ChromiaBadge(
              value: '',
              child: notificationIcon,
            ),
            ChromiaBadge(
              value: '8',
              child: notificationIcon,
            ),
            ChromiaBadge(
              value: '99',
              child: notificationIcon,
            ),
          ],
        ),
        spacing.gapVL,

        // Show badges
        ValueListenableBuilder(
          valueListenable: showBadge,
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ChromiaText(
                      'Show Badge',
                      type: ChromiaTypographyType.headlineSmall,
                      color: colors.textPrimary,
                    ),
                    spacing.gapHM,
                    ChromiaToggleButton(
                      value: value,
                      size: ChromiaToggleButtonSize.small,
                      onChanged: (value) => showBadge.value = value,
                    ),
                  ],
                ),
                spacing.gapVS,
                ChromiaBadge(
                  showBadge: value,
                  value: '8',
                  child: notificationIcon,
                ),
                spacing.gapHL,

              ],
            );
          },
        ),
        spacing.gapVL,

        // Badge sizes
        ChromiaText(
          'Badge Sizes',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.xl,
          runSpacing: spacing.m,
          children: [
            ChromiaBadge(
              value: '99',
              size: ChromiaBadgeSize.small,
              child: shoppingCartIcon,
            ),
            ChromiaBadge(
              value: '99',
              size: ChromiaBadgeSize.medium,
              child: shoppingCartIcon,
            ),
            ChromiaBadge(
              value: '99',
              size: ChromiaBadgeSize.large,
              child: shoppingCartIcon,
            ),
          ],
        ),
        spacing.gapVM,
        Wrap(
          spacing: spacing.xl,
          runSpacing: spacing.m,
          children: [
            ChromiaBadge(
              size: ChromiaBadgeSize.small,
              child: shoppingCartIcon,
            ),
            ChromiaBadge(
              size: ChromiaBadgeSize.medium,
              child: shoppingCartIcon,
            ),
            ChromiaBadge(
              size: ChromiaBadgeSize.large,
              child: shoppingCartIcon,
            ),
          ],
        ),
        spacing.gapVL,

        // Badge shapes
        ChromiaText(
          'Badge Shapes',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.xl,
          runSpacing: spacing.m,
          children: [
            ChromiaBadge(
              value: '8',
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
              shape: ChromiaBadgeShape.circle,
              child: emailIcon,
            ),
            ChromiaBadge(
              value: '88',
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
              shape: ChromiaBadgeShape.circle,
              child: emailIcon,
            ),
            ChromiaBadge(
              value: '888',
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
              maxValue: 99,
              shape: ChromiaBadgeShape.circle,
              child: emailIcon,
            ),
            ChromiaBadge(
              value: 'S',
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
              shape: ChromiaBadgeShape.circle,
              child: emailIcon,
            ),
          ],
        ),
        spacing.gapVM,
        Wrap(
          spacing: spacing.xl,
          runSpacing: spacing.m,
          children: [
            ChromiaBadge(
              value: '8',
              shape: ChromiaBadgeShape.rounded,
              child: emailIcon,
            ),
            ChromiaBadge(
              value: '88',
              shape: ChromiaBadgeShape.rounded,
              child: emailIcon,
            ),
            ChromiaBadge(
              value: '888',
              maxValue: 99,
              shape: ChromiaBadgeShape.rounded,
              child: emailIcon,
            ),
            ChromiaBadge(
              value: 'new',
              shape: ChromiaBadgeShape.rounded,
              child: emailIcon,
            ),
          ],
        ),
        spacing.gapVM,
        Wrap(
          spacing: spacing.xl,
          runSpacing: spacing.m,
          children: [
            ChromiaBadge(
              value: '8',
              shape: ChromiaBadgeShape.square,
              child: emailIcon,
            ),
            ChromiaBadge(
              value: '88',
              shape: ChromiaBadgeShape.square,
              child: emailIcon,
            ),
            ChromiaBadge(
              value: '888',
              maxValue: 99,
              shape: ChromiaBadgeShape.square,
              child: emailIcon,
            ),
            ChromiaBadge(
              value: 'new',
              shape: ChromiaBadgeShape.square,
              child: emailIcon,
            ),
          ],
        ),
        spacing.gapVL,

        // Badge positions
        ChromiaText(
          'Badge Positions',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.xxl,
          runSpacing: spacing.m,
          children: [
            ChromiaBadge(value: '1', position: ChromiaBadgePosition.topLeft(), child: starIcon),
            ChromiaBadge(value: '2', position: ChromiaBadgePosition.topRight(), child: starIcon),
          ],
        ),
        Wrap(
          spacing: spacing.xxl,
          runSpacing: spacing.m,
          children: [
            ChromiaBadge(value: '3', position: ChromiaBadgePosition.bottomLeft(), child: starIcon),
            ChromiaBadge(value: '4', position: ChromiaBadgePosition.bottomRight(), child: starIcon),
          ],
        ),
        spacing.gapVL,

        // Labels
        ChromiaText(
          'Labels',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            const ChromiaLabel(text: 'New'),
            const ChromiaLabel(
              text: 'Featured',

              icon: Icons.star,
            ),
            ChromiaLabel(
              text: 'Pro',
              backgroundColor: colors.primary,
              textColor: colors.onPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            ChromiaLabel(
              text: 'Beta',
              backgroundColor: colors.warning,
              textColor: colors.onPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            ChromiaLabel(
              text: 'Removable',
              onRemove: () {},
            ),
          ],
        ),
        spacing.gapVL,

        // Status badges
        ChromiaText(
          'Status Badges',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.m,
          children: const [
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
        spacing.gapVL,

        // Status dots only
        ChromiaText(
          'Status Dots',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.m,
          children: const [
            ChromiaStatusBadge(status: ChromiaStatusType.success),
            ChromiaStatusBadge(status: ChromiaStatusType.warning),
            ChromiaStatusBadge(status: ChromiaStatusType.error),
            ChromiaStatusBadge(status: ChromiaStatusType.info),
            ChromiaStatusBadge(status: ChromiaStatusType.neutral),
          ],
        ),
      ],
    );
  }
}
