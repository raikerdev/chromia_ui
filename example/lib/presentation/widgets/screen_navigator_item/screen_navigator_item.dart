import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenNavigatorItem extends StatelessWidget {
  final ScreenRoute route;
  final String? pathPrefix;

  const ScreenNavigatorItem(this.route, {this.pathPrefix, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    final fullPath = pathPrefix != null ? '$pathPrefix${route.path}' : route.path;

    return ListTile(
      title: ChromiaText(route.title, type: ChromiaTypographyType.headlineSmall),
      subtitle: ChromiaText(fullPath, type: ChromiaTypographyType.bodyMedium),
      leading: Icon(route.icon, color: colors.primary),
      trailing: Icon(Icons.chevron_right, color: colors.textSecondary),
      onTap: () {
        if (route.navigateWithGo) {
          context.go(fullPath);
        } else {
          context.push(fullPath);
        }
      },
    );
  }
}
