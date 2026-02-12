import 'package:chromia_ui_example/presentation/screens/brands_screen.dart';
import 'package:chromia_ui_example/presentation/screens/buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/home_screen.dart';
import 'package:chromia_ui_example/presentation/screens/typography_screen.dart';
import 'package:flutter/material.dart';

class ExampleRoute {
  final String title;
  final IconData icon;
  final String path;
  final Widget child;

  ExampleRoute({required this.icon, required this.title, required this.path, required this.child});
}

final routes = <ExampleRoute>[
  ExampleRoute(title: 'Home', icon: Icons.home_rounded, path: '/', child: const HomeScreen()),
  ExampleRoute(title: 'Brands', icon: Icons.color_lens_rounded, path: '/brands', child: const BrandsScreen()),
  ExampleRoute(title: 'Typography', icon: Icons.font_download_rounded, path: '/typography', child: const TypographyScreen()),
  ExampleRoute(title: 'Buttons', icon: Icons.touch_app_rounded, path: '/buttons', child: const ButtonsScreen()),
];
