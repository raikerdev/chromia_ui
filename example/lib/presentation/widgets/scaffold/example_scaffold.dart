import 'package:chromia_ui/chromia_ui.dart';
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
      appBar: ChromiaAppBar(title: title),
      body: SingleChildScrollView(
        padding: spacing.paddingL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
