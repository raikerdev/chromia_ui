import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:chromia_ui_example/presentation/widgets/screen_navigator_item/screen_navigator_item.dart';
import 'package:flutter/material.dart';

class ScreenNavigatorList extends StatelessWidget {
  final String? basePath;
  final List<ScreenRoute> routes;

  const ScreenNavigatorList({required this.routes, this.basePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: routes.map((route) => ScreenNavigatorItem(route, pathPrefix: basePath)).toList(),
    );
  }
}
