import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/layout/app_bar/example_app_bar.dart';
import 'package:flutter/material.dart';

class ExampleScaffold extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ExampleScaffold({required this.title, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return Scaffold(
      appBar: ExampleAppBar(title: title),
      body: SingleChildScrollView(
        padding: spacing.paddingL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
