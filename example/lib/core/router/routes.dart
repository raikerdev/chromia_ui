import 'package:chromia_ui_example/presentation/screens/brands_screen.dart';
import 'package:chromia_ui_example/presentation/screens/buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/cards_screen.dart';
import 'package:chromia_ui_example/presentation/screens/checkboxes_screen.dart';
import 'package:chromia_ui_example/presentation/screens/home_screen.dart';
import 'package:chromia_ui_example/presentation/screens/progress_screen.dart';
import 'package:chromia_ui_example/presentation/screens/radio_buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/sliders_screen.dart';
import 'package:chromia_ui_example/presentation/screens/toggle_buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/text_fields_screen.dart';
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
  ExampleRoute(title: 'Cards', icon: Icons.view_carousel, path: '/cards', child: const CardsScreen()),
  ExampleRoute(title: 'Text Fields', icon: Icons.text_fields, path: '/text-fields', child: const TextFieldsScreen()),
  ExampleRoute(title: 'Buttons', icon: Icons.touch_app_rounded, path: '/buttons', child: const ButtonsScreen()),
  ExampleRoute(title: 'Checkboxes', icon: Icons.check_box_rounded, path: '/checkboxes', child: const CheckboxesScreen()),
  ExampleRoute(title: 'Toggle Buttons', icon: Icons.toggle_on, path: '/toggle-buttons', child: const ToggleButtonsScreen()),
  ExampleRoute(title: 'Radio Buttons', icon: Icons.radio_button_checked, path: '/radio-buttons', child: const RadioButtonsScreen()),
  ExampleRoute(title: 'Sliders', icon: Icons.tune, path: '/sliders', child: const SlidersScreen()),
  ExampleRoute(title: 'Progress', icon: Icons.rotate_right, path: '/progress', child: const ProgressScreen()),
];
