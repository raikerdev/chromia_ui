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
        Text(
          'Basic Card',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaCard(
          child: Text(
            'This is a basic card with some content inside. '
            'Cards are great for grouping related information.',
          ),
        ),
        spacing.gapVL,

        // Card with header
        Text(
          'Card with Header',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        const ChromiaCard(
          header: Text('Card Title'),
          child: Text(
            'This card has a header section that can contain a title or any widget.',
          ),
        ),
        spacing.gapVL,

        // Card with header and footer
        Text(
          'Card with Header and Footer',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaCard(
          header: const Text('Project Card'),
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChromiaButton(
                variant: ChromiaButtonVariant.text,
                size: ChromiaButtonSize.small,
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              spacing.gapHM,
              ChromiaButton(
                size: ChromiaButtonSize.small,
                onPressed: () {},
                child: const Text('Save'),
              ),
            ],
          ),
          child: const Text(
            'This card demonstrates how to add action buttons in the footer section.',
          ),
        ),
        spacing.gapVL,

        // Interactive card
        Text(
          'Interactive Card',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaCard(
          elevation: 2,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Card tapped!')),
            );
          },
          child: Row(
            children: [
              Icon(Icons.touch_app, color: colors.primary, size: 40),
              spacing.gapHM,
              const Expanded(
                child: Text(
                  'Tap this card to see the interaction. '
                  'It has hover and press states.',
                ),
              ),
            ],
          ),
        ),
        spacing.gapVL,

        // Card with image
        Text(
          'Card with Image',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
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
          header: const Text('Photo Card'),
          child: const Text(
            'This card includes an image at the top. Perfect for gallery views or product cards.',
          ),
        ),
        spacing.gapVL,

        // Different elevations
        Text(
          'Different Elevations',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
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
                    Text(
                      'Elevation 0',
                      style: theme.typography.labelMedium.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    spacing.gapVXS,
                    Text(
                      'Flat',
                      style: theme.typography.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
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
                    Text(
                      'Elevation 2',
                      style: theme.typography.labelMedium.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    spacing.gapVXS,
                    Text(
                      'Default',
                      style: theme.typography.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
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
                    Text(
                      'Elevation 4',
                      style: theme.typography.labelMedium.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    spacing.gapVXS,
                    Text(
                      'Raised',
                      style: theme.typography.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        spacing.gapVL,

        // List cards
        Text(
          'List Cards',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaListTileCard(
          leading: CircleAvatar(
            backgroundColor: colors.primary,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          title: const Text('John Doe'),
          subtitle: const Text('Software Engineer'),
          trailing: Icon(Icons.chevron_right, color: colors.textSecondary),
          onTap: () {},
        ),
        spacing.gapVM,
        ChromiaListTileCard(
          leading: CircleAvatar(
            backgroundColor: colors.success,
            child: const Icon(Icons.check, color: Colors.white),
          ),
          title: const Text('Task Completed'),
          subtitle: const Text('Successfully deployed to production'),
          trailing: Text(
            '2 hours ago',
            style: theme.typography.bodySmall.copyWith(
              color: colors.textTertiary,
            ),
          ),
          onTap: () {},
        ),
        spacing.gapVM,
        ChromiaListTileCard(
          leading: CircleAvatar(
            backgroundColor: colors.warning,
            child: const Icon(Icons.warning, color: Colors.white),
          ),
          title: const Text('Warning Alert'),
          subtitle: const Text('Server resources running low'),
          trailing: Icon(Icons.arrow_forward, color: colors.primary),
          onTap: () {},
          elevation: 2,
        ),
        spacing.gapVL,

        // Grid of cards
        Text(
          'Card Grid Layout',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
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
              childAspectRatio: 100/20,
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
          Text(
            title,
            style: theme.typography.labelMedium,
          ),
        ],
      ),
    );
  }
}
