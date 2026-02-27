import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final colors = theme.colors;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: const ChromiaAppBar(title: 'Chromia UI'),
      body: Padding(
        padding: spacing.paddingL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChromiaText(
              'Welcome to Chromia UI',
              type: ChromiaTypographyType.displaySmall,
              color: colors.textPrimary,
            ),
            spacing.gapVS,
            ChromiaText(
              'A comprehensive Flutter UI component library for mobile, desktop, and web.',
              type: ChromiaTypographyType.bodyLarge,
              color: colors.textSecondary,
            ),
            spacing.gapVXXL,
            ScreenNavigatorList(
              routes: [
                homeRoutes[1],
                ScreenRoute(icon: Symbols.account_circle_rounded, title: 'Display', path: '/display'),
                ScreenRoute(icon: Symbols.dialogs_rounded, title: 'Feedback', path: '/feedback'),
                ScreenRoute(icon: Symbols.buttons_alt_rounded, title: 'Input', path: '/input'),
                ScreenRoute(icon: Symbols.cards_rounded, title: 'Layout', path: '/layout'),
                ScreenRoute(icon: Symbols.bottom_navigation_rounded, title: 'Navigation', path: '/navigation'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
