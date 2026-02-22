import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/scaffold/example_scaffold.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Cards',
      children: [
        // Cards section
        _buildCardsSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildCardsSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic card
        ChromiaText(
          'Basic Card',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaCard(
          child: ChromiaText(
            'This is a basic card with some content inside. '
            'Cards are great for grouping related information.',
          ),
        ),
        spacing.gapVL,

        // Card with header
        ChromiaText(
          'Card with Header',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        const ChromiaCard(
          header: ChromiaText('Card Title'),
          child: ChromiaText(
            'This card has a header section that can contain a title or any widget.',
          ),
        ),
        spacing.gapVL,

        // Card with header and footer
        ChromiaText(
          'Card with Header and Footer',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaCard(
          header: const ChromiaText('Project Card'),
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChromiaButton(
                variant: ChromiaButtonVariant.text,
                size: ChromiaButtonSize.small,
                onPressed: () {},
                child: const ChromiaText('Cancel'),
              ),
              spacing.gapHM,
              ChromiaButton(
                size: ChromiaButtonSize.small,
                onPressed: () {},
                child: const ChromiaText('Save'),
              ),
            ],
          ),
          child: const ChromiaText(
            'This card demonstrates how to add action buttons in the footer section.',
          ),
        ),
        spacing.gapVL,

        // Interactive card
        ChromiaText(
          'Interactive Card',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaCard(
          elevation: 2,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: ChromiaText('Card tapped!')),
            );
          },
          child: Row(
            children: [
              Icon(Icons.touch_app, color: colors.primary, size: 40),
              spacing.gapHM,
              const Expanded(
                child: ChromiaText(
                  'Tap this card to see the interaction. '
                  'It has hover and press states.',
                ),
              ),
            ],
          ),
        ),
        spacing.gapVL,

        // Card with image
        ChromiaText(
          'Card with Image',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaCard(
          image: Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colors.primary, colors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.image,
                size: 64,
                color: Colors.white,
              ),
            ),
          ),
          imagePosition: CardImagePosition.top,
          header: const ChromiaText('Photo Card'),
          child: const ChromiaText(
            'This card includes an image at the top. Perfect for gallery views or product cards.',
          ),
        ),
        spacing.gapVL,

        // Different elevations
        ChromiaText(
          'Different Elevations',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Row(
          children: [
            Expanded(
              child: ChromiaCard(
                elevation: 0,
                borderColor: colors.border,
                borderWidth: 1,
                child: Column(
                  children: [
                    ChromiaText(
                      'Elevation 0',
                      type: ChromiaTypographyType.labelMedium,
                      color: colors.textPrimary,
                    ),
                    spacing.gapVXS,
                    ChromiaText(
                      'Flat',
                      type: ChromiaTypographyType.bodySmall,
                      color: colors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
            spacing.gapHM,
            Expanded(
              child: ChromiaCard(
                elevation: 2,
                child: Column(
                  children: [
                    ChromiaText(
                      'Elevation 2',
                      type: ChromiaTypographyType.labelMedium,
                      color: colors.textPrimary,
                    ),
                    spacing.gapVXS,
                    ChromiaText(
                      'Default',
                      type: ChromiaTypographyType.bodySmall,
                      color: colors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
            spacing.gapHM,
            Expanded(
              child: ChromiaCard(
                elevation: 4,
                child: Column(
                  children: [
                    ChromiaText(
                      'Elevation 4',
                      type: ChromiaTypographyType.labelMedium,
                      color: colors.textPrimary,
                    ),
                    spacing.gapVXS,
                    ChromiaText(
                      'Raised',
                      type: ChromiaTypographyType.bodySmall,
                      color: colors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        spacing.gapVL,

        // List cards
        ChromiaText(
          'List Cards',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaListTileCard(
          leading: CircleAvatar(
            backgroundColor: colors.primary,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          title: const ChromiaText('John Doe'),
          subtitle: const ChromiaText('Software Engineer'),
          trailing: Icon(Icons.chevron_right, color: colors.textSecondary),
          onTap: () {},
        ),
        spacing.gapVM,
        ChromiaListTileCard(
          leading: CircleAvatar(
            backgroundColor: colors.success,
            child: const Icon(Icons.check, color: Colors.white),
          ),
          title: const ChromiaText('Task Completed'),
          subtitle: const ChromiaText('Successfully deployed to production'),
          trailing: ChromiaText(
            '2 hours ago',
            type: ChromiaTypographyType.bodySmall,
            color: colors.textTertiary,
          ),
          onTap: () {},
        ),
        spacing.gapVM,
        ChromiaListTileCard(
          leading: CircleAvatar(
            backgroundColor: colors.warning,
            child: const Icon(Icons.warning, color: Colors.white),
          ),
          title: const ChromiaText('Warning Alert'),
          subtitle: const ChromiaText('Server resources running low'),
          trailing: Icon(Icons.arrow_forward, color: colors.primary),
          onTap: () {},
          elevation: 2,
        ),
        spacing.gapVL,

        // Grid of cards
        ChromiaText(
          'Card Grid Layout',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = context.isMobile ? 2 : 3;
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: spacing.m,
              crossAxisSpacing: spacing.m,
              childAspectRatio: 100 / 20,
              children: [
                _buildGridItem(context, Icons.home, 'Home'),
                _buildGridItem(context, Icons.settings, 'Settings'),
                _buildGridItem(context, Icons.person, 'Profile'),
                _buildGridItem(context, Icons.notifications, 'Alerts'),
                _buildGridItem(context, Icons.analytics, 'Analytics'),
                _buildGridItem(context, Icons.help, 'Help'),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, IconData icon, String title) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    return ChromiaCard(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: colors.primary),
          spacing.gapVS,
          ChromiaText(
            title,
            type: ChromiaTypographyType.labelMedium,
          ),
        ],
      ),
    );
  }
}
