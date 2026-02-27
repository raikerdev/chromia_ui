import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Navigation',
      children: [
        ScreenNavigatorList(
          basePath: '/navigation',
          routes: navigationRoutes,
        ),
      ],
    );
  }
}
