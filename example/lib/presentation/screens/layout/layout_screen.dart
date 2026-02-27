import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Layout',
      children: [
        ScreenNavigatorList(
          basePath: '/layout',
          routes: layoutRoutes,
        ),
      ],
    );
  }
}
