import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  bool miniDrawer = false;

  final List<_NavigationPage> _pages = const [
    _NavigationPage(
      title: 'Home',
      icon: Icons.home,
      body: _HomePage(),
    ),
    _NavigationPage(
      title: 'Explore',
      icon: Icons.explore,
      body: _ExplorePage(),
    ),
    _NavigationPage(
      title: 'Profile',
      icon: Icons.person,
      body: _ProfilePage(),
    ),
    _NavigationPage(
      title: 'Settings',
      icon: Icons.settings,
      body: _SettingsPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    final currentPage = _pages[_selectedIndex];

    return Scaffold(
      appBar: ChromiaAppBar(
        title: currentPage.title,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchPage(context),
          ),
          ChromiaBadge(
            value: '3',
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () => _showNotifications(context),
            ),
          ),
          spacing.gapHM,
          ChromiaToggleButton(
            value: miniDrawer,
            size: ChromiaToggleButtonSize.small,
            label: 'Mini Drawer',
            onChanged: (value) => setState(() => miniDrawer = value),
          ),
          spacing.gapHS,
          ChromiaButton(
            variant: ChromiaButtonVariant.tonal,
            icon: const Icon(Symbols.logout_rounded),
            child: const ChromiaText('Logout'),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
      drawer: miniDrawer ? _buildMiniDrawer(theme) : _buildDrawer(theme),
      body: currentPage.body,
    );
  }

  Widget _buildDrawer(ChromiaThemeData theme) {
    final colors = theme.colors;
    final spacing = theme.spacing;

    return ChromiaDrawer(
      header: ChromiaDrawerHeader(
        title: 'John Doe',
        subtitle: 'john.doe@example.com',
        avatar: CircleAvatar(
          radius: 32,
          backgroundColor: colors.primary,
          child: Icon(Symbols.person_rounded, size: 32, color: colors.onPrimary),
        ),
        onTap: () {
          Navigator.pop(context);
          _showProfileDialog();
        },
      ),
      items: [
        ChromiaDrawerItem(
          icon: Symbols.home_rounded,
          label: 'Home',
          selected: _selectedIndex == 0,
          onTap: () {
            setState(() => _selectedIndex = 0);
            Navigator.pop(context);
          },
        ),
        ChromiaDrawerItem(
          icon: Symbols.explore_rounded,
          label: 'Explore',
          selected: _selectedIndex == 1,
          onTap: () {
            setState(() => _selectedIndex = 1);
            Navigator.pop(context);
          },
        ),
        ChromiaDrawerItem(
          icon: Symbols.person_rounded,
          label: 'Profile',
          selected: _selectedIndex == 2,
          onTap: () {
            setState(() => _selectedIndex = 2);
            Navigator.pop(context);
          },
        ),
        const ChromiaDrawerDivider(),
        const ChromiaDrawerSection(title: 'Settings'),
        ChromiaDrawerItem(
          icon: Symbols.settings_rounded,
          label: 'Settings',
          badge: '2',
          selected: _selectedIndex == 3,
          onTap: () {
            setState(() => _selectedIndex = 3);
            Navigator.pop(context);
          },
        ),
        ChromiaDrawerItem(
          icon: Symbols.help_rounded,
          label: 'Help & Support',
          onTap: () {
            Navigator.pop(context);
            _showHelp();
          },
        ),
        ChromiaDrawerItem(
          icon: Symbols.info_rounded,
          label: 'About',
          onTap: () {
            Navigator.pop(context);
            _showAbout();
          },
        ),
      ],
      footer: Padding(
        padding: spacing.paddingL,
        child: ChromiaButton(
          variant: ChromiaButtonVariant.outlined,
          icon: const Icon(Symbols.logout_rounded),
          onPressed: () => _logout(),
          child: const Text('Logout'),
        ),
      ),
    );
  }

  Widget _buildMiniDrawer(ChromiaThemeData theme) {
    final colors = theme.colors;

    return ChromiaMiniDrawer(
      header: InkWell(
        child: CircleAvatar(
          radius: 32,
          backgroundColor: colors.primary,
          child: Icon(Symbols.person_rounded, size: 32, color: colors.onPrimary),
        ),
        onTap: () {
          Navigator.pop(context);
          _showProfileDialog();
        },
      ),
      items: [
        ChromiaMiniDrawerItem(
          icon: Symbols.home_rounded,
          label: 'Home',
          selected: _selectedIndex == 0,
          onTap: () {
            setState(() => _selectedIndex = 0);
            Navigator.pop(context);
          },
        ),
        ChromiaMiniDrawerItem(
          icon: Symbols.explore_rounded,
          label: 'Explore',
          selected: _selectedIndex == 1,
          onTap: () {
            setState(() => _selectedIndex = 1);
            Navigator.pop(context);
          },
        ),
        ChromiaMiniDrawerItem(
          icon: Symbols.person_rounded,
          label: 'Profile',
          selected: _selectedIndex == 2,
          onTap: () {
            setState(() => _selectedIndex = 2);
            Navigator.pop(context);
          },
        ),

        ChromiaMiniDrawerItem(
          icon: Symbols.settings_rounded,
          label: 'Settings',
          badge: '2',
          selected: _selectedIndex == 3,
          onTap: () {
            setState(() => _selectedIndex = 3);
            Navigator.pop(context);
          },
        ),

        ChromiaMiniDrawerItem(
          icon: Symbols.help_rounded,
          label: 'Help & Support',
          onTap: () {
            Navigator.pop(context);
            _showHelp();
          },
        ),
        ChromiaMiniDrawerItem(
          icon: Symbols.info_rounded,
          label: 'About',
          onTap: () {
            Navigator.pop(context);
            _showAbout();
          },
        ),
      ],
      footer: ChromiaMiniDrawerItem(
        icon: Symbols.logout_rounded,
        label: 'Logout',
        onTap: () => _logout(),
      ),
    );
  }

  void _showSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _SearchPage(
          onSearch: (query) {},
        ),
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    showChromiaDialog(
      context: context,
      title: 'Notifications',
      contentWidget: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _NotificationTile(
            title: 'New message',
            subtitle: 'You have a new message from Alice',
            time: '2 min ago',
          ),
          _NotificationTile(
            title: 'Update available',
            subtitle: 'A new version is available',
            time: '1 hour ago',
          ),
          _NotificationTile(
            title: 'Task completed',
            subtitle: 'Your task has been completed',
            time: '3 hours ago',
          ),
        ],
      ),
      actions: [
        ChromiaDialogAction(
          label: 'Close',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  void _showProfileDialog() {
    showChromiaDialog(
      context: context,
      title: 'Profile',
      content: 'View and edit your profile information.',
      actions: [
        ChromiaDialogAction(
          label: 'Close',
          onPressed: () => Navigator.pop(context),
        ),
        ChromiaDialogAction(
          label: 'Edit',
          isPrimary: true,
          onPressed: () {
            setState(() => _selectedIndex = 2);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void _showHelp() {
    showChromiaAlert(
      context: context,
      title: 'Help & Support',
      message: 'For help, please visit our support page or contact us.',
    );
  }

  void _showAbout() {
    showChromiaAlert(
      context: context,
      title: 'About',
      message: 'Chromia UI Navigation Example\nVersion 1.0.0',
    );
  }

  Future<void> _logout() async {
    final confirmed = await showChromiaConfirmDialog(
      context: context,
      title: 'Logout',
      message: 'Are you sure you want to logout?',
    );

    if (confirmed && mounted) {
      context.go('/');
    }
  }
}

class _NavigationPage {
  const _NavigationPage({
    required this.title,
    required this.icon,
    required this.body,
  });

  final String title;
  final IconData icon;
  final Widget body;
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return ListView(
      padding: spacing.paddingL,
      children: [
        const ChromiaCard(
          header: Text('Welcome'),
          child: Text('This is the home page with a custom AppBar and Drawer.'),
        ),
        spacing.gapVL,
        const ChromiaCard(
          header: Text('Recent Activity'),
          child: Column(
            children: [
              _ActivityItem(icon: Icons.check_circle, text: 'Task completed'),
              _ActivityItem(icon: Icons.message, text: 'New message received'),
              _ActivityItem(icon: Icons.upload, text: 'File uploaded'),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExplorePage extends StatelessWidget {
  const _ExplorePage();

  @override
  Widget build(BuildContext context) {
    final spacing = context.chromiaSpacing;

    return GridView.count(
      crossAxisCount: 2,
      padding: spacing.paddingL,
      mainAxisSpacing: spacing.m,
      crossAxisSpacing: spacing.m,
      children: List.generate(
        8,
        (index) => ChromiaCard(
          onTap: () {},
          child: Center(
            child: Text('Item ${index + 1}'),
          ),
        ),
      ),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage();

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final colors = theme.colors;

    return ListView(
      padding: spacing.paddingL,
      children: [
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: colors.primary,
            child: Icon(Icons.person, size: 50, color: colors.onPrimary),
          ),
        ),
        spacing.gapVM,
        Center(
          child: Text(
            'John Doe',
            style: theme.typography.headlineMedium,
          ),
        ),
        spacing.gapVS,
        Center(
          child: Text(
            'john.doe@example.com',
            style: theme.typography.bodyMedium.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ),
        spacing.gapVXL,
        const ChromiaCard(
          child: Column(
            children: [
              _ProfileItem(icon: Icons.email, label: 'Email', value: 'john.doe@example.com'),
              _ProfileItem(icon: Icons.phone, label: 'Phone', value: '+1 234 567 8900'),
              _ProfileItem(icon: Icons.location_on, label: 'Location', value: 'New York, USA'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsPage extends StatelessWidget {
  const _SettingsPage();

  @override
  Widget build(BuildContext context) {
    final spacing = context.chromiaSpacing;

    return ListView(
      padding: spacing.paddingL,
      children: [
        const ChromiaCard(
          header: Text('Account Settings'),
          child: Column(
            children: [
              ChromiaListTileToggleButton(
                value: true,
                onChanged: null,
                title: Text('Email Notifications'),
              ),
              ChromiaListTileToggleButton(
                value: false,
                onChanged: null,
                title: Text('Push Notifications'),
              ),
            ],
          ),
        ),
        spacing.gapVL,
        const ChromiaCard(
          header: Text('Privacy'),
          child: Column(
            children: [
              ChromiaListTileToggleButton(
                value: true,
                onChanged: null,
                title: Text('Public Profile'),
              ),
              ChromiaListTileToggleButton(
                value: true,
                onChanged: null,
                title: Text('Show Activity'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SearchPage extends StatelessWidget {
  const _SearchPage({required this.onSearch});

  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChromiaSearchAppBar(
        onSearch: onSearch,
        autofocus: true,
      ),
      body: const Center(
        child: Text('Search results will appear here'),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return Padding(
      padding: spacing.verticalS,
      child: Row(
        children: [
          Icon(Icons.notifications, color: theme.colors.primary),
          spacing.gapHM,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.typography.bodyMedium),
                Text(
                  subtitle,
                  style: theme.typography.bodySmall.copyWith(
                    color: theme.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: theme.typography.labelSmall.copyWith(
              color: theme.colors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  const _ActivityItem({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return Padding(
      padding: spacing.verticalS,
      child: Row(
        children: [
          Icon(icon, color: theme.colors.success, size: 20),
          spacing.gapHM,
          Text(text),
        ],
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return Padding(
      padding: spacing.verticalM,
      child: Row(
        children: [
          Icon(icon, color: theme.colors.primary),
          spacing.gapHM,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.typography.labelSmall.copyWith(
                    color: theme.colors.textSecondary,
                  ),
                ),
                Text(value, style: theme.typography.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
