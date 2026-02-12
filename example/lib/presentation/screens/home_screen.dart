import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/app_bar/example_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final colors = theme.colors;

    final screenRoutes = routes.where((route) => route.path != '/');

    return Scaffold(
      backgroundColor: colors.background,
      appBar: const ExampleAppBar(),
      body: SingleChildScrollView(
        padding: spacing.paddingL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            _buildWelcomeSection(context),
            spacing.gapVXXL,

            ListView.builder(
              shrinkWrap: true,
              itemCount: screenRoutes.length,
              itemBuilder: (context, index) {
                final route = screenRoutes.elementAt(index);
                return ListTile(
                  title: Text(route.title, style: theme.typography.headlineSmall),
                  subtitle: Text(route.path, style: theme.typography.bodyMedium),
                  leading: Icon(route.icon, color: colors.primary),
                  trailing: Icon(Icons.chevron_right, color: colors.textSecondary),
                  shape: Border(bottom: BorderSide(color: colors.border)),
                  onTap: () => context.push(route.path),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome to Chromia UI', style: theme.typography.displaySmall.copyWith(color: colors.textPrimary)),
        spacing.gapVS,
        Text(
          'A comprehensive Flutter UI component library for mobile, desktop, and web.',
          style: theme.typography.bodyLarge.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }
}
