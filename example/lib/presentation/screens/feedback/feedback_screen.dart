import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Feedback',
      children: [
        ScreenNavigatorList(
          basePath: '/feedback',
          routes: feedbackRoutes,
        ),
      ],
    );
  }
}
