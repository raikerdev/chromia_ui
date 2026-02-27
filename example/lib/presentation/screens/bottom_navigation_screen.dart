import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  bool _useFloatingStyle = false;

  final List<_NavPage> _pages = [
    const _NavPage(
      title: 'Home',
      icon: Icons.home,
      selectedIcon: Icons.home,
      body: _HomeTabContent(),
    ),
    const _NavPage(
      title: 'Search',
      icon: Icons.search,
      selectedIcon: Icons.search,
      body: _SearchTabContent(),
      badge: '3',
    ),
    const _NavPage(
      title: 'Favorites',
      icon: Icons.favorite_border,
      selectedIcon: Icons.favorite,
      body: _FavoritesTabContent(),
    ),
    const _NavPage(
      title: 'Profile',
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      body: _ProfileTabContent(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final currentPage = _pages[_currentIndex];

    return Scaffold(
      appBar: ChromiaAppBar(
        title: currentPage.title,
        actions: [
          ChromiaTooltip(
            message: _useFloatingStyle ? 'Standard Style' : 'Floating Style',
            child: IconButton(
              icon: Icon(
                _useFloatingStyle ? Icons.dock : Icons.rocket_launch,
                color: colors.textPrimary,
              ),
              onPressed: () {
                setState(() => _useFloatingStyle = !_useFloatingStyle);
              },
            ),
          ),
        ],
      ),
      body: currentPage.body,
      bottomNavigationBar: _buildBottomNavigation(theme),
    );
  }

  Widget _buildBottomNavigation(ChromiaThemeData theme) {
    final items = _pages
        .map(
          (page) => ChromiaBottomNavigationItem(
            icon: page.icon,
            label: page.title,
            selectedIcon: page.selectedIcon,
            badge: page.badge,
          ),
        )
        .toList();

    if (_useFloatingStyle) {
      return ChromiaFloatingBottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        onTap: (index) => setState(() => _currentIndex = index),
      );
    }

    return ChromiaBottomNavigationBar(
      currentIndex: _currentIndex,
      items: items,
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}

class _NavPage {
  const _NavPage({
    required this.title,
    required this.icon,
    required this.selectedIcon,
    required this.body,
    this.badge,
  });

  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final Widget body;
  final String? badge;
}

class _HomeTabContent extends StatelessWidget {
  const _HomeTabContent();

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return ListView(
      padding: spacing.paddingL,
      children: [
        Text(
          'Welcome to Home',
          style: theme.typography.headlineMedium.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVL,
        ChromiaCard(
          header: Row(
            children: [
              Icon(Icons.info_outline, color: colors.primary),
              spacing.gapHM,
              const Text('About Bottom Navigation'),
            ],
          ),
          child: const Text(
            'This example demonstrates the ChromiaBottomNavigationBar component. '
            'Toggle between standard and floating styles using the button in the app bar. '
            'Notice the badge on the Search tab!',
          ),
        ),
        spacing.gapVL,
        ChromiaCard(
          header: const Text('Features'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _FeatureItem(
                icon: Icons.touch_app,
                title: 'Interactive',
                description: 'Tap any tab to navigate',
              ),
              spacing.gapVM,
              const _FeatureItem(
                icon: Icons.notifications,
                title: 'Badges',
                description: 'Show notification counts',
              ),
              spacing.gapVM,
              const _FeatureItem(
                icon: Icons.style,
                title: 'Two Styles',
                description: 'Standard and floating variants',
              ),
              spacing.gapVM,
              const _FeatureItem(
                icon: Icons.palette,
                title: 'Themed',
                description: 'Follows your app theme',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SearchTabContent extends StatelessWidget {
  const _SearchTabContent();

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return ListView(
      padding: spacing.paddingL,
      children: [
        Text(
          'Search Results',
          style: theme.typography.headlineMedium.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVL,
        ChromiaCard(
          child: Column(
            children: [
              ChromiaBadge(
                value: '3',
                backgroundColor: colors.error,
                child: Icon(Icons.search, size: 48, color: colors.primary),
              ),
              spacing.gapVM,
              Text(
                'You have 3 new search results',
                style: theme.typography.titleMedium,
              ),
              spacing.gapVS,
              Text(
                'Notice the badge on this tab in the bottom navigation',
                style: theme.typography.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        spacing.gapVL,
        ...List.generate(
          3,
          (index) => Padding(
            padding: spacing.verticalS,
            child: ChromiaListTileCard(
              leading: CircleAvatar(
                backgroundColor: colors.primary,
                child: Text('${index + 1}'),
              ),
              title: Text('Search Result ${index + 1}'),
              subtitle: const Text('This is a search result item'),
              trailing: Icon(Icons.arrow_forward_ios, color: colors.textTertiary),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class _FavoritesTabContent extends StatelessWidget {
  const _FavoritesTabContent();

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return ListView(
      padding: spacing.paddingL,
      children: [
        Text(
          'Your Favorites',
          style: theme.typography.headlineMedium.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVL,
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: spacing.m,
          crossAxisSpacing: spacing.m,
          children: [
            _FavoriteCard(
              icon: Icons.favorite,
              label: 'Liked',
              count: '24',
              color: colors.error,
            ),
            _FavoriteCard(
              icon: Icons.bookmark,
              label: 'Saved',
              count: '12',
              color: colors.primary,
            ),
            _FavoriteCard(
              icon: Icons.star,
              label: 'Starred',
              count: '8',
              color: colors.warning,
            ),
            _FavoriteCard(
              icon: Icons.archive,
              label: 'Archived',
              count: '5',
              color: colors.info,
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfileTabContent extends StatelessWidget {
  const _ProfileTabContent();

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return ListView(
      padding: spacing.paddingL,
      children: [
        Center(
          child: Column(
            children: [
              spacing.gapVL,
              ChromiaAvatar.initials(
                initials: 'JD',
                backgroundColor: colors.primary,
                size: ChromiaAvatarSize.extraLarge,
              ),
              spacing.gapVM,
              Text(
                'John Doe',
                style: theme.typography.headlineMedium,
              ),
              spacing.gapVS,
              Text(
                'john.doe@example.com',
                style: theme.typography.bodyMedium.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        spacing.gapVXL,
        ChromiaCard(
          child: Column(
            children: [
              _ProfileMenuItem(
                icon: Icons.person,
                title: 'Edit Profile',
                onTap: () {},
              ),
              const ChromiaDivider(),
              _ProfileMenuItem(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {},
              ),
              const ChromiaDivider(),
              _ProfileMenuItem(
                icon: Icons.help,
                title: 'Help & Support',
                onTap: () {},
              ),
              const ChromiaDivider(),
              _ProfileMenuItem(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () async {
                  final confirmed = await showChromiaConfirmDialog(
                    context: context,
                    title: 'Logout',
                    message: 'Are you sure you want to logout?',
                  );
                  if (confirmed && context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Row(
      children: [
        Icon(icon, color: colors.primary, size: 24),
        spacing.gapHM,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.typography.labelMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                description,
                style: theme.typography.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  const _FavoriteCard({
    required this.icon,
    required this.label,
    required this.count,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return ChromiaCard(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 48),
          spacing.gapVM,
          Text(
            count,
            style: theme.typography.headlineMedium.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          spacing.gapVXS,
          Text(
            label,
            style: theme.typography.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: spacing.paddingM,
        child: Row(
          children: [
            Icon(icon, color: colors.textSecondary),
            spacing.gapHM,
            Expanded(
              child: Text(
                title,
                style: theme.typography.bodyMedium,
              ),
            ),
            Icon(Icons.chevron_right, color: colors.textTertiary),
          ],
        ),
      ),
    );
  }
}
