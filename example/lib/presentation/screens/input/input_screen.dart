import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Input',
      children: [
        ScreenNavigatorList(
          basePath: '/input',
          routes: inputRoutes,
        ),
      ],
    );
  }
}
